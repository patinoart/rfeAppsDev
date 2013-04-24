#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	
	// initialize the accelerometer
	ofxAccelerometer.setup();
    
    ofSetVerticalSync(true);
    ofEnableAlphaBlending();
    
    tabButtonClick = false;
	
	//If you want a landscape oreintation 
	//iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	
	//ofBackground(127,127,127);
    defaultBgImg.loadImage("backgrounds/defaultBG.png");
    defaultBgImg.resize(defaultBgImg.getWidth()*0.5, defaultBgImg.getHeight()*0.5);
    
    scenes[0] = new WelcomeView();
    scenes[1] = new UserView();
    scenes[2] = new StartView();
    scenes[3] = new StatsView();
    scenes[4] = new SettingsView();

    currentScene = 0;
    
    for (int i = 0; i < NUMBER_OF_TAB_BUTTONS; i++) {
        scenes[i]->setup();
    }
    
    string path = "buttons";
    
    ofDirectory dir(path);
    dir.allowExt("png");
    dir.listDir();
    
    for (int i = 0; i < dir.numFiles(); i++) {
        ofLogNotice(dir.getPath(i));
        buttonImage[i].loadImage(dir.getPath(i));
        //buttonImage[i].resize(buttonImage[i].getWidth()/2, buttonImage[i].getHeight()/2);
        buttonImageSel[i] = buttonImage[i];
        
        pixels[i] = buttonImageSel[i].getPixelsRef();
        
        for (int x = 0; x < buttonImageSel[i].getWidth(); x++) {
            for (int y = 0; y < buttonImageSel[i].getHeight(); y++) {
                
                cur[i] = pixels[i].getColor(x, y);
                cur[i].r *= 0.5;
                cur[i].g *= 0.5;
                cur[i].b *= 0.5;
                pixels[i].setColor(x, y, cur[i]);
            }
        }
        
        buttonImageSel[i].setFromPixels(pixels[i]);
    }
    
    bIsLog = false;
    
    logoutBImg.loadImage("navBar/rfe_iPh4_navBar_logout.png");
    logoutBImg.resize(logoutBImg.getWidth()*0.5, logoutBImg.getHeight()*0.5);
    logoutButton.setup("Logout", ofGetWidth() - logoutBImg.getWidth() - 5, 7, logoutBImg);
    loginButton.setup("Login", ofGetWidth() - logoutBImg.getWidth() - 5, 7, logoutBImg);
    
    float buttonX [5];
    
    buttonX[0] = 0;
    buttonX[1] = buttonImage[0].getWidth();
    buttonX[2] = buttonX[1] + buttonImage[1].getWidth();
    buttonX[3] = buttonX[2] + buttonImage[2].getWidth();
    buttonX[4] = buttonX[3] + buttonImage[3].getWidth();
    
    for (int i = 0; i < NUMBER_OF_TAB_BUTTONS; i++) {
        
        tabButton[i].setup(" ", buttonX[i], ofGetHeight()-buttonImage[i].getHeight(), buttonImage[i]);
    }
    
}

//--------------------------------------------------------------
void testApp::update(){
    
    scenes[currentScene]->update();
    
    logoutButton.update(tabButtonClick, touchPos);
    loginButton.update(tabButtonClick, touchPos);
    
    for (int i = 0; i < NUMBER_OF_TAB_BUTTONS; i++) {
        
        tabButton[i].update(tabButtonClick, touchPos);
    }
    
    
}

//--------------------------------------------------------------
void testApp::draw(){
    
    defaultBgImg.draw(0, 0);
    
	scenes[currentScene]->draw();
    
    if (bIsLog) {
        logoutButton.draw();
    } else {
        loginButton.draw();
    }
    
    for (int i = 0; i < NUMBER_OF_TAB_BUTTONS; i++) {
        
        tabButton[i].draw();
        if (currentScene == i) {
            ofPushStyle();
                buttonImageSel[i].draw(tabButton[i].x, tabButton[i].y, tabButton[i].w, tabButton[i].h);
            ofPopStyle();
        }
    }
}

//--------------------------------------------------------------
void testApp::exit(){
    scenes[currentScene]->exit();
}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
    
    tabButtonClick = true;

    scenes[currentScene]->touchDown(touch);
    
    touchPos.set(touch.x, touch.y);
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
    
    scenes[currentScene]->touchMoved(touch);

}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){
    
    tabButtonClick = false;
    
    if (logoutButton.bisHit || loginButton.bisHit) {
        bIsLog = !bIsLog;
        cout << ofToString(bIsLog) << endl;
    }
    
    scenes[currentScene]->touchUp(touch);
    
    for (int i = 0; i < NUMBER_OF_TAB_BUTTONS; i++) {
        if (tabButton[i].bisHit) {
            currentScene = i;
        }
        
        
    }

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){
    
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

