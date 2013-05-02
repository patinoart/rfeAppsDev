//
//  ofxRfeUIStepSlider.cpp
//  rfeSessionTest
//
//  Created by Juan Patino on 5/1/13.
//
//

#include "ofxRfeUIStepSlider.h"

//------------------------------------------------------------------
void ofxRfeUIStepSlider::setup(string _buttonName, float _x, float _y, float _w, float _h, float _min, float _max){
    
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
void ofxRfeUIStepSlider::style(ofColor _default, ofColor _highLight, ofColor _labelColor){
    
    buttonColor = _default;
    
    highlightColor = _highLight;
    
    labelColor = _labelColor;
    
}


//------------------------------------------------------------------
void ofxRfeUIStepSlider::update(bool _bisClicked) {
    bisClicked = _bisClicked;
    
    if (bisClicked) {
        
    }
    
}

//------------------------------------------------------------------
void ofxRfeUIStepSlider::draw() {
    
    ofPushStyle();
    ofFill();
    ofSetColor(buttonColor);
    ofRect(x, y, constantW, h);
    ofSetColor(highlightColor);
    ofRect(x, y, variableW, h);
    ofSetColor(255);
    buttonLabel.drawString(buttonLabelName+": "+ofToString(value), x+20, y+h-(buttonLabel.stringHeight(buttonLabelName))+5);
    ofPopStyle();
}

//------------------------------------------------------------------
void ofxRfeUIStepSlider::moveSlider(float _x, float _y) {
    
    if (_x > x && _x < (x + constantW)) {
        if (_y > y && _y < (y + h)) {
            bisClicked = true;
            
            if (bisClicked) {
                /* From PROCESSING to make an (int) slider
                 
                 for(int i = 0; i < 10; i++) {
                 noStroke();
                 fill(25*i);
                 rect(0+(i*60), height*0.5, width*0.1, height*0.5);
                 }
                 fill(255,0,0);
                 int xPos = (mouseX/60) * 60 + 30;
                 //  xPos *= 60;
                 //  xPos += 30;
                 println(xPos);
                 ellipse(xPos, 75, 25, 25);
                 
                 */
                
                //variableW = ofMap(_x, x, x+constantW, 0, constantW);
                //value = ofMap(variableW, 0, constantW, minValue, maxValue);
                int stepper = constantW/maxValue;
                variableW = (int)(_x/stepper)*stepper+stepper;
                value = (int)ofMap(variableW, 0, constantW, minValue, maxValue);
                //cout << "Slider On" << endl;
                cout << "Variable Width: " << variableW << endl;
                cout << "Value: " << value << endl;
            }
        }
    } else {
        bisClicked = false;
    }
    
}