//
//  ofxRfeUIImageButton.h
//  SoundSwitch
//
//  Created by Juan Patino on 4/25/13.
//
//

#pragma once

#include "ofMain.h"

class ofxRfeUIImageButton {
    
public:
    
    void setup(ofImage _button_image, float _x, float _y);
    void update(bool _bisClicked, ofPoint _mouse);
    void draw();
    bool buttonEvent(float _x, float _y);
    
    bool bisClicked;
    bool bisHit;
    
    float x;
    float y;
    float w;
    float h;
    
    ofImage buttonImage;
    ofImage buttonImageHighlight;
    
    
};