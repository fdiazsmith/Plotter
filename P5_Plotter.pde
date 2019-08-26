
Canvas canvas;
JSONObject settings;

/**
* - useful to always have in a Pricessing day/
* @method settings
*/
void settings( ){

  settings = loadJSONObject("settings.json");

  JSONObject size;
  size = settings.getJSONObject("size");

  size(size.getInt("width"), size.getInt("height"));
  // here we could add a check to see if the widht and height ar defined
  // go go full screen if they are not.
  // fullScreen( );
}
/**
*
* @method setup
*/
void setup() {
  // size(600, 600);
  canvas = new Canvas( );
  surface.setResizable(true);
  surface.setTitle("Vista – Stairs sketch");
  surface.setLocation(settings.getJSONArray("windowPos").getInt(0), settings.getJSONArray("windowPos").getInt(1));

}
/**
*
* @method draw
*/
void draw( ) {
  clear();
  canvas.update();
}
/**
*
* @method keyReleased
*/
void keyReleased( ) {
  canvas.released(key);
}

/**
*
* @method keyPressed
*/
void keyPressed( ) {
  canvas.pressed(key);
}

/**
*
* @method mouseMoved
*/
void mouseMoved( ) {
  canvas.mouseMoved();
}
/**
*
* @method mousePressed
*/
void mousePressed() {
  canvas.mousePressed();
}

/**
* exucutes on exiting the sketch, a good place to save json file with new variables
* @method exit
*/
void exit( ) {
  // SAVE the window size used last
  JSONObject wSize;
  wSize = new JSONObject();
  wSize.setInt("width", width);
  wSize.setInt("height", height);
  settings.setJSONObject("size",wSize);
  // SAVe the window position used last
  JSONArray _windowPos;
  _windowPos = new JSONArray( );
  _windowPos.setInt(0, int( getJFrame(getSurface()).getX() ) );
  _windowPos.setInt(1, int( getJFrame(getSurface()).getY() ) );
  settings.setJSONArray("windowPos",_windowPos);
  // Example of saving another variable
  // JSONArray _colorA;
  // _colorA = new JSONArray( );
  // println("red(colorA): "+int(red(colorA)));
  // _colorA.setInt(0, int(red(colorA)));
  // _colorA.setInt(1, int(green(colorA)));
  // _colorA.setInt(2, int(blue(colorA))); 
  // settings.setJSONArray("colorA",_colorA);

  saveJSONObject(settings, "./settings.json");

  super.exit();
}

/**
*
* @method getJFrame
* @param {PSurface} surf - the frame or surface of the PApplet
*
*/
static final javax.swing.JFrame getJFrame(final PSurface surf) {
  return
    (javax.swing.JFrame)
    ((processing.awt.PSurfaceAWT.SmoothCanvas)
    surf.getNative()).getFrame();
}