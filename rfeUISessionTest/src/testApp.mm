#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	
	// initialize the accelerometer
	ofxAccelerometer.setup();
    ofEnableAlphaBlending();
	
	//If you want a landscape oreintation
	//iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	
	ofBackground(255);
    ofSetCircleResolution(100);
    
    //SETUP COLORS
    red.setHex(0xed3f00);
    blueGray.setHex(0xb5e1d8);
    blueLight.setHex(0x6095a5);
    blueMed.setHex(0x335a6e);
    blueDark.setHex(0x365160);
    textColor.setHex(0xffffff);
    
    // LABEL LOAD FONTS
    headerLabel.loadFont("MavenPro-Regular.ttf", 36);
    menuLabels.loadFont("MavenPro-Regular.ttf", 24);
    areaLabel = "AREA";
    beforeLabel = "BEFORE";
    intensityLabel = "INTENSITY";
    freqLabel = "FREQUENCY";
    timeLabel = "DURATION";
    
    // SETUP MENUS
    menuLabelX = 15;
    menuLabelY = 715;
    menuMargin = 40;
    
    
    // UI ELEMENT POSITIONS AND DIMENSIONS
    if (ofGetHeight() == 1136) menuH = 100;
    if (ofGetHeight() == 960) menuH = 25;
    
    menuX = 0;
    menuY = 100;
    menuW = ofGetWidth();
    
    
    sliderX = menuX;
    sliderY = menuY;
    sliderW = menuW;
    sliderH = menuH;
    
    float topMargin = 20;
    
    menuClick = false;
    
    // POPULATE THE DIFFERENT MENU LISTS
    // AREA
    areaList.push_back("Left Shoulder");
    areaList.push_back("Right Shoulder");
    areaList.push_back("Left Elbow");
    areaList.push_back("Right Elbow");
    areaList.push_back("Left Wrist");
    areaList.push_back("Right Wrist");
    areaList.push_back("Left Hip");
    areaList.push_back("Right Hip");
    areaList.push_back("Left Knee");
    areaList.push_back("Right Knee");
    areaList.push_back("Left Ankle");
    areaList.push_back("Right Ankle");
    areaList.push_back("Lower Back");
    areaList.push_back("Upper Back");
    areaList.push_back("Neck");
    
    // INTENSITY
    intensityList.push_back("LOW");
    intensityList.push_back("MEDIUM");
    intensityList.push_back("HIGH");
    
    // FREQUENCY
    freqList.push_back("SLOW");
    freqList.push_back("MEDIUM");
    freqList.push_back("FAST");
    
    // SETUP MENUS, BUTTONs, SLIDERS
    // Area
    areaMenu.setup(areaLabel, menuX, menuY, menuW, menuH-40);
    areaMenu.style(blueGray, blueDark, textColor);
    areaMenu.loadItems(areaList);
    areaMenu.itemNameSelected = "Choose Body Part";
    
    // Before
    beforeSlider.setup(beforeLabel, sliderX, sliderY + menuH + topMargin, sliderW, sliderH, 0, 10);
    beforeSlider.style(blueGray, blueDark, textColor);
    
    // Intensity
    intensityMenu.setup(intensityLabel, menuX, menuY + 2*(menuH + topMargin), menuW, menuH);
    intensityMenu.style(blueGray, blueDark, textColor);
    intensityMenu.loadItems(intensityList);
    intensityMenu.itemNameSelected = "Choose Intensity";
    
    // Frequency
    freqMenu.setup(freqLabel, menuX, menuY + 3*(menuH + topMargin), menuW, menuH);
    freqMenu.style(blueGray, blueDark, textColor);
    freqMenu.loadItems(freqList);
    freqMenu.itemNameSelected = "Choose Speed";
    
    // Duration = Time device is ACTIVE
    timeSlider.setup(timeLabel, sliderX, sliderY + 4*(sliderH + topMargin), sliderW, sliderH, 1, 5);
    timeSlider.style(blueGray, blueDark, textColor);
    

    settingsImg.loadImage("images/navButton.png");
    startImg.loadImage("images/startButton.png");

    
    settingsX = 20;
    settingsY = 20;
    startImgX = 0;
    startImgY = 730;
    
    settingsViewButton.setup("Nav", settingsX, settingsY, settingsImg.width, settingsImg.height);
    settingsViewButton.style(blueGray, blueDark, textColor);
    startButton.setup("Start", startImgX, ofGetHeight()-startImg.height, startImg.width, startImg.height);
    startButton.style(blueGray, blueDark, textColor);
    
    bSettingsClick = false;
    bStartBClick = false;
    bStart = false;
    
    // Audio setup //
    
    // 2 output channels,
	// 0 input channels
	// 44100 samples per second
	// 512 samples per buffer
	// 4 num buffers (latency)
    
	sampleRate = 44100;
	phase = 0;
	phaseAdder = 0.0f;
	phaseAdderTarget = 0.0;
	volume = 0.75f;
	pan = 0.0;
	bNoise = false;
    
    //for some reason on the iphone simulator 256 doesn't work - it comes in as 512!
	//so we do 512 - otherwise we crash
	initialBufferSize = 512;
	
	lAudio = new float[initialBufferSize];
	rAudio = new float[initialBufferSize];
	
	memset(lAudio, 0, initialBufferSize * sizeof(float));
	memset(rAudio, 0, initialBufferSize * sizeof(float));
    
    //we do this because we don't have a mouse move function to work with:
	targetFrequency = 0.0f;
	phaseAdderTarget = (targetFrequency / (float)sampleRate) * TWO_PI;
	
	ofSoundStreamSetup(2, 0, this, sampleRate, initialBufferSize, 4);
    ofSoundStreamStop();

    
	ofSetFrameRate(60);

}

//--------------------------------------------------------------
void testApp::update(){
    
    // MENUS
    areaMenu.update(menuClick, user);
    intensityMenu.update(menuClick, user);
    freqMenu.update(menuClick, user);
    
    // BUTTONS
    settingsViewButton.update(bSettingsClick, user);
    startButton.update(bStartBClick, user);
    
    // SLIDERS
    beforeSlider.update(beforeSMove);
    timeSlider.update(timeSMove);
    
//    volume = volSlider.value;
//    pan = panSlider.value;
    
//    phaseAdderTarget = (targetFrequency / (float)sampleRate *TWO_PI);
    //cout << "mouseX: " << touchPos.x << ", " << "mouseY: " << touchPos.y << endl;
}

//--------------------------------------------------------------
void testApp::draw(){
    
    
    // Background Header Banner TOP
    ofSetColor(blueDark);
    ofRect(0, 0, 640, 100);
    
    // Draw the labels with the chosen options

    menuLabels.drawString(areaLabel+": "+selAreaString, menuLabelX, menuLabelY);
    menuLabels.drawString(beforeLabel+": "+selBefore, menuLabelX, menuLabelY+menuMargin);
    menuLabels.drawString(intensityLabel+": "+selIntensityString, menuLabelX, menuLabelY+2*menuMargin);
    menuLabels.drawString(freqLabel+": "+selFreqString, menuLabelX, menuLabelY+3*menuMargin);
    menuLabels.drawString(timeLabel+": "+selTime, menuLabelX, menuLabelY+4*menuMargin);
    string theDate = ofToString(ofGetDay());
    menuLabels.drawString("Date: "+theDate, menuLabelX, menuLabelY+5*menuMargin);
    
    // Draw Menus Sliders Buttons
    settingsViewButton.draw();
    
    //SLIDERS
    beforeSlider.draw();
    timeSlider.draw();
    
    startButton.draw();
    
    freqMenu.draw();
    intensityMenu.draw();
    areaMenu.draw();
    
    // Header Label
    ofSetColor(ofColor::white);
    int headerPosX = ofGetWidth()*0.5f - headerLabel.stringWidth("New Session")*0.5f;
    int headerPosY = 100 - headerLabel.stringHeight("New Session");
    headerLabel.drawString("New Session", headerPosX, headerPosY);
    
}

//--------------------------------------------------------------
void testApp::exit(){
    ofSoundStreamClose();
}

//--------------------------------------------------------------
void testApp::audioOut(float * output, int bufferSize, int nChannels){
    
	if( initialBufferSize != bufferSize ){
		ofLog(OF_LOG_ERROR, "your buffer size was set to %i - but the stream needs a buffer size of %i", initialBufferSize, bufferSize);
		return;
	}
	//pan = 0.5f;
	float leftScale = 1 - pan;
	float rightScale = pan;
    
	// sin (n) seems to have trouble when n is very large, so we
	// keep phase in the range of 0-TWO_PI like this:
	while(phase > TWO_PI){
		phase -= TWO_PI;
	}
    
    phaseAdder = 0.95f * phaseAdder + 0.05f * phaseAdderTarget;
    for(int i = 0; i < bufferSize; i++){
        phase += phaseAdder;
        float sample = 0;
        
        //if (bSin) {
            sample = sin(phase);              // Sine wave
        //}
        //if (bSquare) {
          //  sample = sin(phase)>0?1:-1;     // Square wave
        //}
        
        //float sample = fmod(phase, TWO_PI);     // Saw wave NOT WORKING NOW
        lAudio[i] = output[i * nChannels] = sample * volume * leftScale;
        rAudio[i] = output[i * nChannels + 1] = sample * volume * rightScale;
    }
}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
    
    user.set(touch.x, touch.y);
    
    cout << "X: " << user.x << ", Y: " << user.y << endl;
    
    //MENU
    menuClick = true;
    
    // SLIDER
    beforeSlider.moveSlider(touch.x, touch.y);
    timeSlider.moveSlider(touch.x, touch.y);
    
    // BUTTONS
    bSettingsClick = true;
    bStartBClick = true;

}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
    
    beforeSMove = true;
    timeSMove = true;
    
    // MENU
    if (areaMenu.bisHit) {
        // when you touch down the area menu
        areaMenu.touchItem(touch.x, touch.y);
        beforeSMove = false;
        timeSMove = false;
    }
    if (intensityMenu.bisHit) {
        // when you touch down the intensity menu
        intensityMenu.touchItem(touch.x, touch.y);
        beforeSMove = false;
        timeSMove = false;
    }
    if (freqMenu.bisHit) {
        // when you touch down the intensity menu
        freqMenu.touchItem(touch.x, touch.y);
        beforeSMove = false;
        timeSMove = false;
    }

    
    if (beforeSMove) {
        // SLIDER
        beforeSlider.moveSlider(touch.x, touch.y);
    
    }
    
    if (timeSMove) {
        timeSlider.moveSlider(touch.x, touch.y);
    }
    
    
    
}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){
    
    // MENU
    menuClick = false;
    if (areaMenu.bisHit) {
        // when you touch up the area menu
        selAreaString = areaMenu.itemNameSelected;
    }
    if (intensityMenu.bisHit) {
        // when you touch up the intensity menu
        selIntensityString = intensityMenu.itemNameSelected;
    }
    if (freqMenu.bisHit) {
        // when you touch up the freq menu
        selFreqString = freqMenu.itemNameSelected;
    }
    
    // SLIDER
    beforeSMove = false;
    timeSMove = false;
    selBefore = ofToString(beforeSlider.value);
    selTime = ofToString(timeSlider.value);
    
    // BUTTONS
    bSettingsClick = false;
    bStartBClick = false;
    
    if (settingsViewButton.bisHit) {
        // do something
    }
    
    if (startButton.bisHit) {
        // do something
    }
    
    /*
    buttonClick = false;
    //panSMove = false;
    loFreqSMove = false;
    hiFreqSMove = false;
    volSMove = false;
    
    if (rfe_button.bisHit || rfe_buttonStop.bisHit) {
        bPlay = !bPlay;
        circleColor.set(ofRandom(0,255), ofRandom(0,255), ofRandom(0,255));
        if (bPlay) {
           
            ofSoundStreamStart();
        } else {
       
            ofSoundStreamStop();
        }
    }
    //cout << "Released" << endl;
    
    if (panLeftButton.bisHit) {
        pan = 0;
    } else if (panCenterButton.bisHit) {
        pan = 0.5;
    } else if (panRightButton.bisHit) {
        pan = 1;
    }
    
    if (sinWaveButton.bisHit) {
        bSin = true;
        bSquare = false;
    }
    
    if (squareWaveButton.bisHit) {
        bSquare = true;
        bSin = false;
    }
    */
    
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

