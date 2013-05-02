//
//  ofxRfeUIImageButton.cpp
//  SoundSwitch
//
//  Created by Juan Patino on 4/25/13.
//
//

#include "ofxRfeUIImageButton.h"

//-------------------------------------------------------------------------
void ofxRfeUIImageButton::setup(ofImage _button_image, float _x, float _y){
    
    x = _x;
    y = _y;
    w = _button_image.getWidth();
    h = _button_image.getHeight();
    
    buttonImage = _button_image;
    buttonImageHighlight = _button_image;
    
    ofPixels pixels = buttonImageHighlight.getPixelsRef();
    
    for (int x = 0; x < buttonImageHighlight.getWidth(); x++) {
        for (int y = 0; y < buttonImageHighlight.getHeight(); y++) {
            
            ofColor cur = pixels.getColor(x, y);
            cur.r = 255 - cur.r;
            cur.g = 255 - cur.g;
            cur.b = 255 - cur.b;
            pixels.setColor(x, y, cur);
        }
    }
    
    buttonImageHighlight.setFromPixels(pixels);
    
}

//-------------------------------------------------------------------------
void ofxRfeUIImageButton::update(bool _bisClicked, ofPoint _mouse){
    
    bisClicked = _bisClicked;
    
    bool checkBool = buttonEvent(_mouse.x, _mouse.y);
    
    if (checkBool && bisClicked) {
        //ofSetColor(highlightColor);
        cout << "Button Clicked" << endl;
        bisHit = true;
    } else {
        //ofSetColor(buttonColor);
        bisHit = false;
        
    }
    
}

//-------------------------------------------------------------------------
void ofxRfeUIImageButton::draw(){
    
    
    ofPushStyle();
    if (bisHit) {
        ofPushStyle();
        buttonImageHighlight.draw(x, y);
        ofPopStyle();
    } else {
        ofPushStyle();
        buttonImage.draw(x, y);
        ofPopStyle();
    }
    ofPopStyle();
}

//-------------------------------------------------------------------------
bool ofxRfeUIImageButton::buttonEvent(float _x, float _y){
    
    if (_x > x && _x < (x + w)) {
        if (_y > y && _y < (y + h)) {
            return true;
        }
    } else {
        return false;
    }
    return 0;
    
}