import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
JSONObject settings;

Plotter plotter;

// GLOBALS variables
int PORT;
String IP;

/**
* - useful to always have in a Pricessing day/
* @method settings
*/
void settings( ){

  settings = loadJSONObject("settings.json");

  JSONObject size;
  size = settings.getJSONObject("size");
  IP = settings.getString("IP");
  PORT = settings.getInt("port");

  size(size.getInt("width"), size.getInt("height"));

  // here we could add a check to see if the widht and height ar defined
  // go go full screen if they are not.
  // fullScreen( );
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,PORT);

  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device,
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress(IP,PORT);
}
/**
*
* @method setup
*/
void setup() {
  size(600, 600);
  plotter = new Plotter( );
  if (frame != null) {
    surface.setResizable(true);
  }
}
/**
*
* @method draw
*/
void draw( ) {
  // clear();
  plotter.update();
}
/**
*
* @method oscEvent
* @params theOscMessage
*/
void oscEvent(OscMessage theOscMessage) {
  String addrPattern = theOscMessage.addrPattern();

  // Print address pattern to terminal

  // Analogue input values
  if (addrPattern.equals("/hrm")) {
    for(int i = 0; i < plotter.analogInputs.length; i ++) {
      plotter.analogInputs[i] = theOscMessage.get(i).floatValue();
    }
  }
  else {
    println(addrPattern);

  }
  // /* check if theOscMessage has the address pattern we are looking for. */
  //
  // if(theOscMessage.checkAddrPattern("/filter")==true) {
  //   /* check if the typetag is the right one. */
  //   println("matched filterd");
  //   if(theOscMessage.checkTypetag("ifs")) {
  //     println("\tmatched tags");
  //     /* parse theOscMessage and extract the values from the osc message arguments. */
  //     int firstValue = theOscMessage.get(0).intValue();
  //     float secondValue = theOscMessage.get(1).floatValue();
  //     String thirdValue = theOscMessage.get(2).stringValue();
  //     print("### received an osc message /test with typetag ifs.");
  //     println(" values: "+firstValue+", "+secondValue+", "+thirdValue);
  //     return;
  //   }
  // }
  // println("### received an osc message. with address pattern "+theOscMessage.addrPattern());
}

/**
*
* @method keyReleased
*/
void keyReleased( ) {
  plotter.released(key);
}

/**
*
* @method keyPressed
*/
void keyPressed( ) {
  plotter.pressed(key);
}

/**
*
* @method mouseMoved
*/
void mouseMoved( ) {
  plotter.mouseMoved();
}
/**
*
* @method mousePressed
*/
void mousePressed() {
  plotter.mousePressed();
}

void sendOSC() {
  /* create a new osc message object */
  OscMessage myMessage = new OscMessage("/test");

  myMessage.add(123); /* add an int to the osc message */
  myMessage.add(12.34); /* add a float to the osc message */
  myMessage.add("some text"); /* add a string to the osc message */

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation);
}
