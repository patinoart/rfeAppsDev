#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "Globals.h"


class testApp : public ofxiPhoneApp {
	
public:
	void setup();
	void update();
	void draw();
	void exit();
	
	void touchDown(ofTouchEventArgs &touch);
	void touchMoved(ofTouchEventArgs &touch);
	void touchUp(ofTouchEventArgs &touch);
	void touchDoubleTap(ofTouchEventArgs &touch);
	void touchCancelled(ofTouchEventArgs &touch);

	void lostFocus();
	void gotFocus();
	void gotMemoryWarning();
	void deviceOrientationChanged(int newOrientation);
    int ofGetWidth(){
        return 320;
    }
    int ofGetHeight(){
        return 480;
    }
    ofPoint mouse(){
        
        float mousex = ofMap(mouseX,0,320*scaleWidth,0,320);
        float mousey = ofMap(mouseY, 0, 480*scaleHeight, 0,480);
        ofPoint p;
        p.set(mousex, mousey);
        return p;
    }
    
    
    iPhoneDeviceType ofxGetDeviceType() {
        if (iphone5) {
            return APPLE_DEVICE_IPHONE_5;
            
        }else{
            if(isiPad&&isRetina){
              
                return APPLE_DEVICE_IPAD_RETINA;
                
            }
            if(!isiPad&&!isRetina){
                return APPLE_DEVICE_IPHONE_NONRETINA;
                
            }
            if(isiPad&&!isRetina){
                return APPLE_DEVICE_IPAD_NONRETINA;
              
                
            }
            if(!isiPad&&isRetina){

                return APPLE_DEVICE_IPHONE_RETINA;
            
            }
        }

    }
    
    
    
    
    
    
    UofImage sample;
    UofImage circle;
    
    
    
    
};


