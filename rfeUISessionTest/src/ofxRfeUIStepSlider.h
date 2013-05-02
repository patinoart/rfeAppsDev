//
//  ofxRfeUISlider.h
//  rfeUITest
//
//  This SLIDER results in integer values
//  and are more like a stepping slider
//
//  Created by Juan Patino on 2/20/13.
//
//

#pragma once

#include "ofMain.h"


class ofxRfeUIStepSlider {
    
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
    ofColor labelColor;
    
    ofTrueTypeFont buttonLabel;
    string buttonLabelName;
    
    void setup(string _buttonName, float _x, float _y, float _w, float _h, float _min, float _max);
    void style(ofColor _default, ofColor _highLight, ofColor _labelColor);
    void update(bool _bisClicked);
    void draw();
    void moveSlider(float _x, float _y);
    
    
};
