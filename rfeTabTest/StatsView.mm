//
//  StatsView.cpp
//  rfeTabTest
//
//  Created by Juan Patino on 3/9/13.
//
//

#include "StatsView.h"

//--------------------------------------------------------------
void StatsView::setup(){
    
    statsViewBgImg.loadImage("backgrounds/statsViewBg.png");
    statsViewBgImg.resize(statsViewBgImg.getWidth()*0.5, statsViewBgImg.getHeight()*0.5);
    
    // load the Nav Bar
    navBarStats.loadImage("navBar/navBarStats.png");
    navBarStats.resize(navBarStats.getWidth()*0.5, navBarStats.getHeight()*0.5);
    
    

    
}

//--------------------------------------------------------------
void StatsView::update(){
    
}

//--------------------------------------------------------------
void StatsView::draw(){
    
    statsViewBgImg.draw(0, 0);
    
    // draw the Nav Bar
    navBarStats.draw(0, 0);
    
}

//--------------------------------------------------------------
void StatsView::exit(){
    
}

//--------------------------------------------------------------
void StatsView::touchDown(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void StatsView::touchMoved(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void StatsView::touchUp(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void StatsView::touchDoubleTap(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void StatsView::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void StatsView::lostFocus(){
    
}

//--------------------------------------------------------------
void StatsView::gotFocus(){
    
}

//--------------------------------------------------------------
void StatsView::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void StatsView::deviceOrientationChanged(int newOrientation){
    
}


