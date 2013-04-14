#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	
	// register touch events
	ofRegisterTouchEvents(this);
	// initialize the accelerometer
	ofxAccelerometer.setup();
	//iPhoneAlerts will be sent
	ofxiPhoneAlerts.addListener(this);

    
//////////////////////////////////////////////////////////////////
/*   
    
    
    This will load the right asset according to the device
    if non retina it will load image_3g.png if ipad3 image_hd.png etc.
    
    ofGetScreenHeight()&ofGetScreenWidth() returns the actual screensize
    ofGetWidth()&ofGetHeight()retuns 320x480 (size of project)

    mouse().x/mouse().y is the mapped position of mouseX-mouseY
 
 
 
 */
//////////////////////////////////////////////////////////////////    
    
    
    
    
    circle.loadImage("images/ball.png");
    sample.loadImage("images/image.png");
    ofEnableAlphaBlending();
}

//--------------------------------------------------------------
void testApp::update(){

}

//--------------------------------------------------------------
void testApp::draw(){
    ofScale(scaleWidth,scaleHeight);
/////////////////////////////////////////////////scale everything below this to fit screen
    
    
    sample.draw(0,0,ofGetWidth(),ofGetHeight());
 
    ofEnableBlendMode(OF_BLENDMODE_MULTIPLY); 
    circle.draw(0,0,480,480);
    ofDisableBlendMode();
    
    
    
    
    
    ofCircle(mouse().x, mouse().y, 20);
/////////////////////////////////////////////////////OR WRITE SEPERATE CODE FOR EACH DEVICE:
    
    
    
    if (ofxGetDeviceType()== APPLE_DEVICE_IPHONE_RETINA) {
    cout<<"iphone4 iphone4s,ipod touch with retina screens";
        
    }else if(ofxGetDeviceType()== APPLE_DEVICE_IPHONE_NONRETINA ){
    
    cout<<"older iphones iphone3gs old ipods etc";
        
    }else if(ofxGetDeviceType()== APPLE_DEVICE_IPHONE_5 ){
        cout<<"iphone5 new gen ipod touch with wider screen";
        
        
    }else if(ofxGetDeviceType()== APPLE_DEVICE_IPAD_RETINA ){
        cout<<"ipad 3 with retina// new smaller ipad";
        
    }else if(ofxGetDeviceType()== APPLE_DEVICE_IPAD_NONRETINA ){
        cout<<"ipad 2 older ipads without retina screen";
        
    }

    cout<<endl<<endl<<endl;



    
 
}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){

}


//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs& args){

}

