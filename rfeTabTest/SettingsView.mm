//
//  SettingsView.cpp
//  rfeTabTest
//
//  Created by Juan Patino on 3/9/13.
//
//

#include "SettingsView.h"

//--------------------------------------------------------------
void SettingsView::setup(){
    
    // load the Nav Bar
    navBarSettings.loadImage("navBar/navBarSettings.png");
    navBarSettings.resize(navBarSettings.getWidth()*0.5, navBarSettings.getHeight()*0.5);
    
}

//--------------------------------------------------------------
void SettingsView::update(){
    
}

//--------------------------------------------------------------
void SettingsView::draw(){
    
    // draw the Nav Bar
    navBarSettings.draw(0, 0);

    
}

//--------------------------------------------------------------
void SettingsView::exit(){
    
}

//--------------------------------------------------------------
void SettingsView::touchDown(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void SettingsView::touchMoved(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void SettingsView::touchUp(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void SettingsView::touchDoubleTap(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void SettingsView::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void SettingsView::lostFocus(){
    
}

//--------------------------------------------------------------
void SettingsView::gotFocus(){
    
}

//--------------------------------------------------------------
void SettingsView::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void SettingsView::deviceOrientationChanged(int newOrientation){
    
}


