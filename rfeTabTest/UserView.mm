//
//  UserView.cpp
//  rfeTabTest
//
//  Created by Juan Patino on 3/9/13.
//
//

#include "UserView.h"

//--------------------------------------------------------------
void UserView::setup(){
    
    ofSetCircleResolution(100);
    
    // load the Nav Bar
    navBarUser.loadImage("navBar/navBarUser.png");
    navBarUser.resize(navBarUser.getWidth()*0.5, navBarUser.getHeight()*0.5);
    
    bTouch = false;
    
}

//--------------------------------------------------------------
void UserView::update(){
    
    if (bTouch) {
        cur.set(ofRandom(0, 255), ofRandom(0, 255), ofRandom(0, 255));
    }
    
}

//--------------------------------------------------------------
void UserView::draw(){
    
    // draw the Nav Bar
    navBarUser.draw(0, 0);
    
    ofPushStyle();
    ofSetColor(cur);
    ofCircle(pos, 25);
    ofPopStyle();
    
}

//--------------------------------------------------------------
void UserView::exit(){
    
}

//--------------------------------------------------------------
void UserView::touchDown(ofTouchEventArgs & touch){
    
    pos.set(touch.x, touch.y);
    
    bTouch = true;
    
}

//--------------------------------------------------------------
void UserView::touchMoved(ofTouchEventArgs & touch){
    
    pos.set(touch.x, touch.y);
    
    bTouch = true;
        
}

//--------------------------------------------------------------
void UserView::touchUp(ofTouchEventArgs & touch){
    
    bTouch = false;
    
}

//--------------------------------------------------------------
void UserView::touchDoubleTap(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void UserView::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void UserView::lostFocus(){
    
}

//--------------------------------------------------------------
void UserView::gotFocus(){
    
}

//--------------------------------------------------------------
void UserView::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void UserView::deviceOrientationChanged(int newOrientation){
    
}


