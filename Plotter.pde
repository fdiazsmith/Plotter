/**
 * @class Plotter
 *
 */
class Plotter {
  int foo = 0;
  color backgroundColor = color(255);
  float[] analogInputs;
  float[] previousYPos;
  float xPos = 0;
  int previousWidth, previousHeigth;  // used to detect window resize
  int[] selectedChannels;
  /**
   * @contructor
   */
  Plotter( ) {
    analogInputs = new float[16];
    selectedChannels = new int[1];
    selectedChannels[0] = 1;
    previousYPos = new float[selectedChannels.length];
  }
  /**
   * @contructor
   * @param {int[]} _channels
   */
  Plotter( int[] _channels ) {
    analogInputs = new float[16];
    selectedChannels = _channels;
    previousYPos = new float[selectedChannels.length];
  }

  /**
   * @method set
   */
  void set( ) {
    // call in setup
  }
  /**
   * @method update
   */
  void update( ) {
    // Trace analogue input values
    strokeWeight(1);  // trace width
    stroke(255);      // trace colour
    for (int i = 0; i < selectedChannels.length; i++) {
      float graphHeight = height / selectedChannels.length;
      float yPos = map(analogInputs[selectedChannels[i] - 1], 0, 1, i * graphHeight + graphHeight, i * graphHeight);
      line(xPos, previousYPos[i], xPos+1, yPos);
      previousYPos[i] = yPos;
    }

    // Restart if graph full or window resized
    if (++xPos >= width || previousWidth != width || previousHeigth != height) {
      previousWidth = width;
      previousHeigth = height;
      xPos = 0;
      drawBackground();
    }
  }
  /**
   * @method drawBackground
   */
  void drawBackground() {
    strokeWeight(1);                          // rectangle border width
    PFont f = createFont("Arial", 16, true);  // Arial, 16 point, anti-aliasing on
    for (int i = 0; i < selectedChannels.length; i++) {
      float graphHeight = height / selectedChannels.length;

      // Different rectangle border and fill colour for alternate graphs
      if(i % 2 == 0) {
        stroke(0);
        fill(0);
      }
      else {
        stroke(32);
        fill(32);
      }
      rect(0, i * graphHeight, width, graphHeight);

      // Print channel number
      fill(64);
      textFont(f, (int)graphHeight);
      text(nf(selectedChannels[i], 1), 10, (i + 1) * graphHeight);
    }
  }
  /**
   * @method released – handles keyReleased events
   * @param {char} _key
   */
  void released(char _key) {
    if ( _key == 's' ) {
      // code
    }
  }
  /**
   * @method pressed – handles keyReleased events
   * @param {char} _key
   */
  void pressed(char _key) {
    if ( _key == 'p' ) {
      // code
    }
  }
  /**
   * @method mouseMoved
   */
  void mouseMoved() {
    // do something
  }
  /**
   * @method mousePressed
   */
  void mousePressed() {
    // do something
  }


  /**
   * @class modal – 
   */
  void modal( String message, float normal ) {
    float alpha = 1-(normal*normal);
    textAlign(CENTER, CENTER);
    fill(50, alpha*150);
    rect(0,0,width, height);
    fill(255, alpha*255);
    textSize(132);
    text(message, width/2, height/2);
  }
  /**
   * @class message – 
   */
  void message( String message, float x, float y ) {
    textAlign(LEFT, CENTER);
    fill(30, 180);
    textSize(16);
    text(message, (int)x, (int)y );
  }
}
