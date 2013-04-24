//
//  StartView.cpp
//  rfeTabTest
//
//  Created by Juan Patino on 3/9/13.
//
//

#include "StartView.h"

//--------------------------------------------------------------
void StartView::setup(){
    
    // load the Nav Bar
    navBarStart.loadImage("navBar/navBarStart.png");
    navBarStart.resize(navBarStart.getWidth()*0.5, navBarStart.getHeight()*0.5);
    
}

//--------------------------------------------------------------
void StartView::update(){
    
}

//--------------------------------------------------------------
void StartView::draw(){
    
    // draw the Nav Bar
    navBarStart.draw(0, 0);
    
}

//--------------------------------------------------------------
void StartView::exit(){
    
}

//--------------------------------------------------------------
void StartView::touchDown(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void StartView::touchMoved(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void StartView::touchUp(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void StartView::touchDoubleTap(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void StartView::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void StartView::lostFocus(){
    
}

//--------------------------------------------------------------
void StartView::gotFocus(){
    
}

//--------------------------------------------------------------
void StartView::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void StartView::deviceOrientationChanged(int newOrientation){
    
}


