//
//  ofxRfeUIButton.cpp
//  rfeUITest
//
//  Created by Juan Patino on 2/20/13.
//
//

#include "ofxRfeUIButton.h"

//------------------------------------------------------------------
void ofxRfeUIButton::setup(string _buttonName, float _x, float _y, float _w, float _h){
    
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
    buttonLabel.loadFont("MavenPro-Regular.ttf", 24);
    buttonLabel.setLineHeight(24);
    buttonLabel.setLetterSpacing(1.1f);
    
    buttonLabelName = _buttonName;
    
    buttonColor.setHex(0x6095a5);
    
    highlightColor.setHex(0xed3f00);
    
}

//------------------------------------------------------------------
void ofxRfeUIButton::update(bool _bisClicked, ofPoint _mouse) {
    
    bisClicked = _bisClicked;
    
    bool checkBool = buttonEvent(_mouse.x, _mouse.y);
    
    if (checkBool && bisClicked) {
        //ofSetColor(highlightColor);
        //cout << "Button Clicked" << endl;
        bisHit = true;
    } else {
        //ofSetColor(buttonColor);
        bisHit = false;
        
    }

}

//------------------------------------------------------------------
void ofxRfeUIButton::draw() {
    
    ofPushStyle();
    if (bisHit) {
        ofSetColor(highlightColor);
        ofRect(x, y, w, h);
    } else {
        ofSetColor(buttonColor);
        ofRect(x, y, w, h);
    }
    ofPopStyle();
    
    
    ofPushStyle();
    ofSetColor(255);
    buttonLabel.drawString(buttonLabelName, x+(w/2)-(buttonLabel.stringWidth(buttonLabelName)*0.5f), y+h-(buttonLabel.stringHeight(buttonLabelName)));
    //cout << "getSize: " << buttonLabel.getSize() << endl;
    ofPopStyle();
}

//------------------------------------------------------------------
bool ofxRfeUIButton::buttonEvent(float _x, float _y) {
    
    if (_x > x && _x < (x + w)) {
        if (_y > y && _y < (y + h)) {
            return true;
        }
    } else {
        return false;
    }
    return 0;
}