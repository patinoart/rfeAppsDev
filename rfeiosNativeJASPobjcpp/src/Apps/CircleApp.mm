#include "CircleApp.h"
#include "rfeCenterViewController.h"

rfeCenterViewController *viewController;

//--------------------------------------------------------------
CircleApp :: CircleApp () {
    cout << "creating CircleApp" << endl;
}

//--------------------------------------------------------------
CircleApp :: ~CircleApp () {
    cout << "destroying CircleApp" << endl;
}

//--------------------------------------------------------------
void CircleApp::setup() {
	//ofBackground(127);
    ofSetBackgroundAuto(false);
    
    bFill = false;
    
    int fontSize = 8;
    if (ofxiPhoneGetOFWindow()->isRetinaSupported())
        fontSize *= 2;
    
    font.loadFont("fonts/mono0755.ttf", fontSize);
    
    // Our Gui setup
    viewController = [[rfeCenterViewController alloc] initWithNibName:@"rfeCenterViewController" bundle:nil];
    [ofxiPhoneGetGLParentView() addSubview:viewController.view];
    
}

//--------------------------------------------------------------
void CircleApp::update(){
    
    if (bFill) {
        ofSetColor(ofColor::red);
    } else {
        ofSetColor(ofColor::blue);
    }

}

//--------------------------------------------------------------
void CircleApp::draw() {
    int x = ofGetWidth()  * 0.5;
    int y = ofGetHeight() * 0.5;
    int r = MIN(ofGetWidth(), ofGetHeight()) * 0.3;
    int p = 0;
    
	ofSetColor(ofColor::red);
    ofCircle(x, y, r);
    
    x = ofGetWidth()  * 0.2;
    y = ofGetHeight() * 0.11;
    p = ofGetHeight() * 0.035;
    
    ofSetColor(ofColor::white);
    font.drawString("frame num      = " + ofToString(ofGetFrameNum() ),    x, y+=p);
    font.drawString("frame rate     = " + ofToString(ofGetFrameRate() ),   x, y+=p);
    font.drawString("screen width   = " + ofToString(ofGetWidth() ),       x, y+=p);
    font.drawString("screen height  = " + ofToString(ofGetHeight() ),      x, y+=p);
}

//--------------------------------------------------------------
void CircleApp::exit() {
    //
}

//--------------------------------------------------------------
void CircleApp::touchDown(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void CircleApp::touchMoved(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void CircleApp::touchUp(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void CircleApp::touchDoubleTap(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void CircleApp::lostFocus(){

}

//--------------------------------------------------------------
void CircleApp::gotFocus(){

}

//--------------------------------------------------------------
void CircleApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void CircleApp::deviceOrientationChanged(int newOrientation){

}


//--------------------------------------------------------------
void CircleApp::touchCancelled(ofTouchEventArgs& args){

}

