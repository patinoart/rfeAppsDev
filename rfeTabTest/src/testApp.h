#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "ofxRfeUIButton.h"
#include "ofxRfeUISlider.h"
#include "baseScene.h"
#include "WelcomeView.h"
#include "UserView.h"
#include "StartView.h"
#include "StatsView.h"
#include "SettingsView.h"

#define NUMBER_OF_TAB_BUTTONS 5

class testApp : public ofxiPhoneApp{
	
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
    
        // default background image
        ofImage defaultBgImg;
    
        ofxRfeUIButton logoutButton, loginButton;
        ofImage logoutBImg;
        bool bIsLog;
    
        ofxRfeUIButton tabButton [NUMBER_OF_TAB_BUTTONS];
        ofImage buttonImage [NUMBER_OF_TAB_BUTTONS];
        ofImage buttonImageSel [NUMBER_OF_TAB_BUTTONS];
        ofPixels pixels [NUMBER_OF_TAB_BUTTONS];
        ofColor cur [NUMBER_OF_TAB_BUTTONS];
    
        ofPoint touchPos;
        bool tabButtonClick;
            
        baseScene *scenes [NUMBER_OF_TAB_BUTTONS];
    
        int currentScene;

};


