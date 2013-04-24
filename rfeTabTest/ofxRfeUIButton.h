//
//  ofxRfeUIButton.h
//  rfeUITest
//
//  Created by Juan Patino on 2/20/13.
//
//

#ifndef __rfeUITest__ofxRfeUIButton__
#define __rfeUITest__ofxRfeUIButton__

#include "ofMain.h"


class ofxRfeUIButton {
    
public:
    
    void setup(string _buttonName, float _x, float _y, ofImage _button_image);
    void update(bool _bisClicked, ofPoint _mouse);
    void draw();
    bool buttonEvent(float _x, float _y);
    
    bool bisClicked;
    bool bisHit;
    
    float x;
    float y;
    float w;
    float h;
    
    //ofColor buttonColor;
    //ofColor highlightColor;
    
    ofTrueTypeFont buttonLabel;
    string buttonLabelName;
    ofRectangle stringRect;
    
    ofImage buttonImage;
    ofImage buttonImageHighlight;
    
    
};

#endif /* defined(__rfeUITest__ofxRfeUIButton__) */
