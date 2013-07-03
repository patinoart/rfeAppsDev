//
//  ofxRfeUISlider.h
//  rfeUITest
//
//  Created by Juan Patino on 2/20/13.
//
//

#ifndef __rfeUITest__ofxRfeUISlider__
#define __rfeUITest__ofxRfeUISlider__

#include "ofMain.h"


class ofxRfeUISlider {
    
public:
    
    bool bisClicked;
    
    float x;
    float y;
    float constantW;
    float variableW;
    float h;
    
    float value;
    float minValue;
    float maxValue;
    
    ofColor buttonColor;
    ofColor highlightColor;
    
    ofTrueTypeFont buttonLabel;
    string buttonLabelName;
    
    void setup(string _buttonName, float _x, float _y, float _w, float _h, float _min, float _max);
    void update(bool _bisClicked);
    void draw();
    void moveSlider(float _x, float _y);
    
    
};

#endif /* defined(__rfeUITest__ofxRfeUISlider__) */
