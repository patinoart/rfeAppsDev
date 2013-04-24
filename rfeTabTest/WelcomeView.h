//
//  WelcomeView.h
//  rfeTabTest
//
//  Created by Juan Patino on 3/9/13.
//
//

#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "baseScene.h"
#include "ofxRfeUIButton.h"

class WelcomeView : public baseScene{
    
public:
    void setup();
    void update();
    void draw();
    void exit();
    
    void touchDown(ofTouchEventArgs & touch);
    void touchMoved(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    void touchDoubleTap(ofTouchEventArgs & touch);
    void touchCancelled(ofTouchEventArgs & touch);
    
    void lostFocus();
    void gotFocus();
    void gotMemoryWarning();
    void deviceOrientationChanged(int newOrientation);
    
    ofImage navBarWelcome;
    ofImage welcomeBg;
    
    
    
    
    
};