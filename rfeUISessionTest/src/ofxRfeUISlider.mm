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
    
    buttonLabel.loadFont("MavenPro-Regular.ttf", 24);
    
    buttonLabelName = _buttonName;
    
    buttonColor.setHex(0x6095a5);
    
    highlightColor.setHex(0xed3f00);
    
}

//------------------------------------------------------------------
void ofxRfeUISlider::style(ofColor _default, ofColor _highLight, ofColor _labelColor){
    
    buttonColor = _default;
    
    highlightColor = _highLight;
    
    labelColor = _labelColor;
    
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
    buttonLabel.drawString(buttonLabelName, x+20, y+h-(buttonLabel.stringHeight(buttonLabelName))+5);
    ofPopStyle();
}

//------------------------------------------------------------------
void ofxRfeUISlider::moveSlider(float _x, float _y) {
    
    if (_x > x && _x < (x + constantW)) {
        if (_y > y && _y < (y + h)) {
            bisClicked = true;
            
            if (bisClicked) {
                variableW = ofMap(_x, x, x+constantW, 0, constantW);
                value = ofMap(variableW, 0, constantW, minValue, maxValue);
                
                //cout << "Slider On" << endl;
                cout << "Variable Width: " << variableW << endl;
                cout << "Value: " << value << endl;
            }
            
        }
    } else {
        bisClicked = false;
    }
    
}