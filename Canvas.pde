/**
 * @class Canvas
 * - this class should coordinate between player and brush
 */
class Canvas {
  int foo = 0;

  /**
   * @contructor
   * @param {String} path - path to the data folder were the frames will be stored.
   */
  Canvas( ) {

  }

  /**
   * @method set
   * prepares the canvas to draw the next frame.
   */
  void set( ) {
    // call in setup
  }

  /**
   * @method released – handles keyReleased events
   * @param {char} _key - key just released
   */
  void released(char _key) {
    if ( _key == 's' ) {
      // code
    }
  }
  /**
   * @method pressed – handles keyReleased events
   * @param {char} _key - key just pressed
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
   * @method update - draws and displays
   */
  void update( ) {

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
