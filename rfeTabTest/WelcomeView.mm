//
//  WelcomeView.cpp
//  rfeTabTest
//
//  Created by Juan Patino on 3/9/13.
//
//

#include "WelcomeView.h"

//--------------------------------------------------------------
void WelcomeView::setup(){
    
    welcomeBg.loadImage("backgrounds/welcomeViewBg.png");
    welcomeBg.resize(welcomeBg.getWidth()*0.5, welcomeBg.getHeight()*0.5);
    
    // load the Nav Bar
    navBarWelcome.loadImage("navBar/navBarWelcome.png");
    navBarWelcome.resize(navBarWelcome.getWidth()*0.5, navBarWelcome.getHeight()*0.5);

}

//--------------------------------------------------------------
void WelcomeView::update(){

}

//--------------------------------------------------------------
void WelcomeView::draw(){
    
    welcomeBg.draw(0, 0);
    
    // draw the Nav Bar
    navBarWelcome.draw(0, 0);
    
    
}

//--------------------------------------------------------------
void WelcomeView::exit(){
    
}

//--------------------------------------------------------------
void WelcomeView::touchDown(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void WelcomeView::touchMoved(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void WelcomeView::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void WelcomeView::touchDoubleTap(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void WelcomeView::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void WelcomeView::lostFocus(){
    
}

//--------------------------------------------------------------
void WelcomeView::gotFocus(){
    
}

//--------------------------------------------------------------
void WelcomeView::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void WelcomeView::deviceOrientationChanged(int newOrientation){
    
}


