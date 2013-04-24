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
    
    bool bisClicked;
    bool bisHit;
    
    float x;
    float y;
    float w;
    float h;
    
    ofColor buttonColor;
    ofColor highlightColor;
    
    ofTrueTypeFont buttonLabel;
    string buttonLabelName;
    
    void setup(string _buttonName, float _x, float _y, float _w, float _h);
    void update(bool _bisClicked, ofPoint _mouse);
    void draw();
    bool buttonEvent(float _x, float _y);
    
    
};

#endif /* defined(__rfeUITest__ofxRfeUIButton__) */
