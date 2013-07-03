#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	
	// initialize the accelerometer
	ofxAccelerometer.setup();
	
	//If you want a landscape oreintation
	//iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	
	ofBackground(255);
    ofSetCircleResolution(100);
    
    UIWidth = ofGetWidth();
    UIHeight = 100;
    xPos = ofGetWidth()*0.5f - UIWidth*0.5f;
    yPos = 100;
    float margin = 5;
    
    powerLabel = "POWER";
    powerOptions.push_back("LOW");
    powerOptions.push_back("MED");
    powerOptions.push_back("HIGH");
    
    speedLabel = "SPEED";
    speedOptions.push_back("SLOW");
    speedOptions.push_back("NORMAL");
    speedOptions.push_back("FAST");
    
    timerLabel = "TIME";
    minVal = 1;
    maxVal = 8;
    
    menuClick = false;
    sliderMov = false;
    theTimer = 0;
    
//    Menu.setup(Label, menuX, menuY, menuW, areaMenuH);
//    Menu.style(default, highlight, label);
//    Menu.loadItems(List);
//    Menu.itemNameSelected = "Before Input";
    
    powerMenu.setup(powerLabel, xPos, yPos, UIWidth, UIHeight);
    powerMenu.loadItems(powerOptions);
    powerMenu.itemNameSelected = "CHOOSE POWER";
    
    yPos += UIHeight+margin;
    speedMenu.setup(speedLabel, xPos, yPos, UIWidth, UIHeight);
    speedMenu.loadItems(speedOptions);
    speedMenu.itemNameSelected = "CHOOSE SPEED";
    
    yPos += UIHeight+margin;
    timeSlider.setup(timerLabel, xPos, yPos, UIWidth, UIHeight, minVal, maxVal);
    yPos += UIHeight+margin;
    
    startButton.setup("Start", xPos, yPos + 240, ofGetWidth(), 60);
    bStart = false;
    
    cout << "Width: " << ofGetWidth() << ", " << "Height: " << ofGetHeight() << endl;
    
    testFont.loadFont("MavenPro-Regular.ttf", 24);
    
    // Timer setup
    bTimeReached = false;
    //startTime = ofGetElapsedTimeMillis();
    startTime = 0;
    endTime = 1000;
    resetTimer = 3000;
    
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
	volume = 0.90f;
	pan = 1.0;
	bNoise = false;
    targetFrequency = 0;
    
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
    ofSoundStreamStart();
    //ofSoundStreamStop();

    
	ofSetFrameRate(60);

}

//--------------------------------------------------------------
void testApp::update(){
    
//    // MENUS
//    Menu.update(clickBool, touch);
//    // SLIDERS
//    Slider.update(sliderBool);

    
    powerMenu.update(menuClick, user);
    speedMenu.update(menuClick, user);
    
    timeSlider.update(sliderMov);
    
    startButton.update(bStart, user);
    
    //targetFrequency = pow(2, timeSlider.value);
    phaseAdderTarget = (targetFrequency / (float)sampleRate *TWO_PI);
    //cout << "mouseX: " << touchPos.x << ", " << "mouseY: " << touchPos.y << endl;
}

//--------------------------------------------------------------
void testApp::draw(){
    
    // setup a timer
    theTimer = ofGetElapsedTimeMillis() - startTime;
    
    if (theTimer >= endTime && !bTimeReached) {
        bTimeReached = true;
        cout << "Timer Reached" << endl;
    }
    
    string timerResults;
    if (bTimeReached) {
        // do this when time is reached
        timerResults = "Done";
        //volume = 0;
        //targetFrequency = 0;
        //ofSoundStreamStop();
    } else {
        timerResults = "Running";
    }
    
//    string info = "Timer: " + ofToString(theTimer, 0) + " ms";
//    cout << info << endl;
    
    //float pct = ofMap(theTimer, 0.0, endTime, 0.0, 1.0, true);
    
    // Visualize the signals going out for the test
    
    float boxW = (ofGetWidth()-5)*0.5f;
    float boxH = boxW * 0.75f;
    // Adding a 20px margin to lowest slider (VOL)
    float topY = yPos;
    float leftX = 0;
    float rightX = leftX + boxW + 5;
    
    // draw LEFT channel box
    ofSetHexColor(0x365260);
    ofRect(leftX, topY, boxW, boxH);
    ofSetHexColor(0xb6e1d8);
    for (int i = 0; i < initialBufferSize; i++) {
        float x = ofMap(i, 0, initialBufferSize, 0, boxW, true);
        ofLine(leftX+x, topY+boxH*0.5f, leftX+x, topY + boxH*0.5f + lAudio[i] * boxH * 0.5f);
    }
    
    // draw RIGHT channel box
    ofSetHexColor(0xb6e1d8);
    ofRect(rightX, topY, boxW, boxH);
    ofSetHexColor(0x365260);
    for (int i = 0; i < initialBufferSize; i++) {
        float x = ofMap(i, 0, initialBufferSize, 0, boxW, true);
        ofLine(rightX+x, topY+boxH*0.5f, rightX+x, topY + boxH*0.5f + rAudio[i] * boxH * 0.5f);
    }
	
    ofSetHexColor(0xed3f00);
    string panString = "Pan: " + ofToString(pan);
    testFont.drawString(panString, 20, ofGetHeight()-200);
    string freqString = "Freq: " + ofToString(targetFrequency);
    testFont.drawString(freqString, 20, ofGetHeight()-150);
    string volString = "Volume: " + ofToString(volume);
    testFont.drawString(volString, 20, ofGetHeight()-100);
    string frameRateString = "Frame Rate: " + ofToString((int)ofGetFrameRate());
    testFont.drawString(frameRateString, 20, ofGetHeight()-50);
    
    string results = "Power: " + ofToString(selPower);
    testFont.drawString(results, ofGetWidth()*0.5f, ofGetHeight()-200);
    results = "Speed: " + ofToString(selSpeed);
    testFont.drawString(results, ofGetWidth()*0.5f, ofGetHeight()-175);
    results = "Duration: " + ofToString(selTime);
    testFont.drawString(results, ofGetWidth()*0.5f, ofGetHeight()-150);
    //results = "Runtime: " + timerResults;
    //testFont.drawString(results, ofGetWidth()*0.5f, ofGetHeight()-125);
    //results = "Percentage: " + ofToString(pct*100, 1) + "%";
    //testFont.drawString(results, ofGetWidth()*0.5f, ofGetHeight()-100);
    //results = "Timer: " + ofToString(theTimer);
    //testFont.drawString(results, ofGetWidth()*0.5f, ofGetHeight()-75);
    
    // Draw the UI Elements last to first
    startButton.draw();
    timeSlider.draw();
    speedMenu.draw();
    powerMenu.draw();
    
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
	float leftScale = 1 - pan;      // 0 == LEFT CHANNEL
	float rightScale = pan;         // 1 == RIGHT CHANNEL
    
	// sin (n) seems to have trouble when n is very large, so we
	// keep phase in the range of 0-TWO_PI like this:
    while(phase > TWO_PI){
		phase -= TWO_PI;
	}
    phaseAdder = 0.95f * phaseAdder + 0.05f * phaseAdderTarget;
    for(int i = 0; i < bufferSize; i++){
        phase += phaseAdder;
        float sample = 0;
//        sample = sin(phase);              // Sine wave
        sample = sin(phase)>0?1:-1;     // Square wave
        
        //float sample = fmod(phase, TWO_PI);     // Saw wave NOT WORKING NOW IGNORE
        lAudio[i] = output[i * nChannels] = sample * volume * leftScale;
        rAudio[i] = output[i * nChannels + 1] = sample * volume * rightScale;
    }
}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
    user.set(touch.x, touch.y);
    
    //MENU
    menuClick = true;
    
    // SLIDER
    timeSlider.moveSlider(touch.x, touch.y);
    
    // BUTTONS
    bStart = true;
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){

    sliderMov = true;
    
    // MENU
    if (powerMenu.bisHit) {
        // when you touch down the area menu
        powerMenu.touchItem(touch.x, touch.y);
        sliderMov = false;
    }
    
    if (speedMenu.bisHit) {
        speedMenu.touchItem(touch.x, touch.y);
        sliderMov = false;
    }

    if (sliderMov) {
        timeSlider.moveSlider(touch.x, touch.y);
    }

}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){
    
    // Inside of the touch Up send the audio signals
    
    // THIS IS WHERE YOU NEED TO WORK NOW JUAN! ~Juan
    
    // Left channel
    // 1 for power
    // 2 for speed
    // 3 for time
    
    // Right Channel
    // For power
    // 1 LoW
    // 2 Med
    // 3 High
    
    // For speed
    // 1 Slow
    // 2 Med High
    
    
    
    // MENU
    menuClick = false;
    if (powerMenu.bisHit) {
        // when you touch up the area menu
        selPower = powerMenu.itemNameSelected;
        ofSoundStreamStart();
        pan = 0.5;
        volume = 0.99;
        if (selPower == powerMenu.itemList.at(1)) {         // MED
            targetFrequency = 2.15f;
        } else if (selPower == powerMenu.itemList.at(2)) {  // HIGH
            targetFrequency = 2.25f;
        } else {                                            // LOW      
            targetFrequency = 2.0f;
        }
    }
    if (speedMenu.bisHit) {
        selSpeed = speedMenu.itemNameSelected;
        ofSoundStreamStart();
        pan = 0.5;
        volume = 0.99;
        if (selSpeed == speedMenu.itemList.at(1)) {         // NORMAL
            targetFrequency = 2.75f;
        } else if (selSpeed == speedMenu.itemList.at(2)) {  // FAST
            targetFrequency = 3.0f;
        } else {                                            // SLOW
            targetFrequency = 2.5f;
        }
    }
    
    sliderMov = false;
    selTime = ofToString(timeSlider.value);
    
    bStart = false;
    
    if (startButton.bisHit) {
        // start the timer (send to Arduino to decide BEGIN/END)
        bTimeReached = false;
        startTime = ofGetElapsedTimeMillis();
        ofSoundStreamStart();
        pan = 0.5;
        volume = 0.99;
        //pan = 0.5; // RightChannel
        //targetFrequency = 5; // Frequency 10000 = 10kHz
        targetFrequency = pow(2, timeSlider.value);
        //targetFrequency = timeSlider.value;
        //targetFrequencyR = timeSlider.value;
    }
}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){
    ofSoundStreamStop();
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

