//
//  ofxRfeUIButton.cpp
//  rfeUITest
//
//  Created by Juan Patino on 2/20/13.
//
//

#include "ofxRfeUIButton.h"

//------------------------------------------------------------------
void ofxRfeUIButton::setup(string _buttonName, float _x, float _y, ofImage _button_image){
    
    x = _x;
    y = _y;
    w = _button_image.getWidth();
    h = _button_image.getHeight();
    
    buttonImage = _button_image;
    buttonImageHighlight = _button_image;
    buttonLabel.loadFont("MavenPro-Regular.ttf", 11);
    buttonLabel.setLineHeight(11.0f);
    buttonLabel.setLetterSpacing(1.1);
    buttonLabelName = _buttonName;
    
    stringRect = buttonLabel.getStringBoundingBox(buttonLabelName, 0, 0);
    
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
    
    //buttonColor.set(127);
    
    //highlightColor = ofColor(255, 0, 255);
    
}

//------------------------------------------------------------------
void ofxRfeUIButton::update(bool _bisClicked, ofPoint _mouse) {

    
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

//------------------------------------------------------------------
void ofxRfeUIButton::draw() {
    
    ofPushStyle();
        if (bisHit) {
            //ofSetColor(highlightColor);
            //ofRect(x, y, w, h);
            
            buttonImageHighlight.draw(x, y);
            ofPushStyle();
            ofSetColor(0);
            buttonLabel.drawString(buttonLabelName, x+w*0.5-(stringRect.width*0.5), y+h*0.5+(stringRect.height*0.25));
            ofPopStyle();
            
        } else {
            //ofSetColor(buttonColor);
            //ofRect(x, y, w, h);
            buttonImage.draw(x, y);
            ofPushStyle();
                ofSetColor(255);
                buttonLabel.drawString(buttonLabelName, x+w*0.5-(stringRect.width*0.5), y+h*0.5+(stringRect.height*0.25));
            ofPopStyle();
        }
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