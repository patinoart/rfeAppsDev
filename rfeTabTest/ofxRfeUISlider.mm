//
//  ofxRfeUISlider.cpp
//  rfeUITest
//
//  Created by Juan Patino on 2/20/13.
//
//

#include "ofxRfeUISlider.h"

//------------------------------------------------------------------
void ofxRfeUISlider::setup(string _buttonName, float _x, float _y, float _w, float _h, float _min, float _max){
    
    x = _x;
    y = _y;
    constantW = _w;
    variableW = 1;
    h = _h;
    
    minValue = _min;
    maxValue = _max;
    
    value = 1;
    
    buttonLabel.loadFont("MavenPro-Regular.ttf", 12);
    
    buttonLabelName = _buttonName;
    
    buttonColor.set(127);
    
    highlightColor.set(255, 0, 255);
    
}

//------------------------------------------------------------------
void ofxRfeUISlider::update(bool _bisClicked) {
    bisClicked = _bisClicked;
    
    if (bisClicked) {
        
    }
    
}

//------------------------------------------------------------------
void ofxRfeUISlider::draw() {
    
    ofPushStyle();
    ofFill();
    ofSetColor(buttonColor);
    ofRect(x, y, constantW, h);
    ofSetColor(highlightColor);
    ofRect(x, y, variableW, h);
    ofSetColor(255);
    buttonLabel.drawString(buttonLabelName, x+(x/6), y+h/1.5);
    ofPopStyle();
}

//------------------------------------------------------------------
void ofxRfeUISlider::moveSlider(float _x, float _y) {
    
    if (_x > x && _x < (x + constantW)) {
        if (_y > y && _y < (y + h)) {
            bisClicked = true;
            variableW = ofMap(_x, x, x+constantW, 0, constantW);
            cout << "Slider On" << endl;
            cout << "Variable Width: " << variableW << endl;
            value = ofMap(variableW, 0, constantW, minValue, maxValue);
            cout << "Value: " << value << endl;
        }
    } else {
        bisClicked = false;
    }
    
}