#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	
	// initialize the accelerometer
	ofxAccelerometer.setup();
	
	//If you want a landscape oreintation
	//iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	
	ofBackground(255);
    ofSetCircleResolution(100);
    
    buttonWidth = 320;
    buttonHeight = 75;
    
    sliderW = 600;
    sliderH = 75;
    
    xPos = ofGetWidth()*0.5f - buttonWidth*0.5f;
    yPos = 20;
    
    sliderX = ofGetWidth()*0.5f - sliderW*0.5f;
    sliderY = yPos+buttonHeight+20;
    
    buttonClick = false;
    
    bPlay = false;
    rfe_button.setup("PLAY",xPos, yPos, buttonWidth, buttonHeight);
    rfe_buttonStop.setup("STOP",xPos, yPos, buttonWidth, buttonHeight);
    
    panLeftButton.setup("LEFT", 20, sliderY, ofGetWidth()*0.3f, buttonHeight);
    panCenterButton.setup("CENTER", 20+ofGetWidth()*0.3f+10, sliderY, ofGetWidth()*0.3f, buttonHeight);
    panRightButton.setup("RIGHT", 20+(ofGetWidth()*0.3f)*2+20, sliderY, ofGetWidth()*0.3f, buttonHeight);
    
    //panSlider.setup("PAN", sliderX, sliderY, sliderW, sliderH, 0, 1);
    loFreqSlider.setup("LOW FREQ", sliderX, sliderY+sliderH+20, sliderW*0.5f-10, sliderH, 0, 8);
    hiFreqSlider.setup("HI FREQ", sliderX+sliderW*0.5f+10, sliderY+sliderH+20, sliderW*0.5f-10, sliderH, 100, 10000);
    volSlider.setup("VOLUME", sliderX, sliderY+(sliderH*2)+40, sliderW, sliderH, 0.01, 0.95);
    
    // Control the waveforms
    sinWaveButton.setup("SINE", 20+(ofGetWidth()*0.3f)*0.5f, (sliderY+(sliderH*3)+40) + 20, ofGetWidth()*0.3f, buttonHeight);
    squareWaveButton.setup("SQUARE", 20+(ofGetWidth()*0.3f)*0.5f+ofGetWidth()*0.3f+20, (sliderY+(sliderH*3)+40) + 20, ofGetWidth()*0.3f, buttonHeight);
    
    circlePos.set(ofGetWidth()/2, ofGetHeight()/2+50);
    
    cout << "Width: " << ofGetWidth() << ", " << "Height: " << ofGetHeight() << endl;
    
    testFont.loadFont("MavenPro-Regular.ttf", 24);
    
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
    rfe_button.update(buttonClick, touchPos);
    rfe_buttonStop.update(buttonClick, touchPos);
    
    panLeftButton.update(buttonClick, touchPos);
    panCenterButton.update(buttonClick, touchPos);
    panRightButton.update(buttonClick, touchPos);
    
    //panSlider.update(panSMove);
    loFreqSlider.update(loFreqSMove);
    hiFreqSlider.update(hiFreqSMove);
    volSlider.update(volSMove);
    
    sinWaveButton.update(buttonClick, touchPos);
    squareWaveButton.update(buttonClick, touchPos);
    
    volume = volSlider.value;
//    pan = panSlider.value;
    
    phaseAdderTarget = (targetFrequency / (float)sampleRate *TWO_PI);
    //cout << "mouseX: " << touchPos.x << ", " << "mouseY: " << touchPos.y << endl;
}

//--------------------------------------------------------------
void testApp::draw(){
    
    float boxW = 305;
    float boxH = boxW * 0.75f;
    // Adding a 20px margin to lowest slider (VOL)
    float topY = (sliderY+(sliderH*4)+60) + 20;
    float leftX = 10;
    float rightX = leftX + boxW + 10;
    
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
	
    /*
    ofEnableAlphaBlending();
    ofSetColor(circleColor);
    ofCircle(circlePos, ofGetWidth()/3);
    ofSetColor(255-circleColor.r, 255-circleColor.g, 255-circleColor.b, 100);
    for (int i = 0; i < initialBufferSize; i++) {
        float r = ofMap(i, 0, initialBufferSize, 0, ofGetWidth()*0.3f, true);
        
        if (rAudio[i] > 0.0f) { // right channel is ON
            
            ofCircle(circlePos.x + 100, circlePos.y, 2 * r * rAudio[i]);
            
        } else { // middle relay OFF
            
            
        }
        
        if (lAudio[i] > 0.0f) { // left channel is ON
            
            ofCircle(circlePos.x - 100, circlePos.y, 2 * r * lAudio[i]);
            
        } else { // high relay OFF
            
            
        }
        
        
        //ofCircle(circlePos.x, circlePos.y, r * rAudio[i]);
        //if (rAudio[i] > 0) ofCircle(circlePos.x, circlePos.y, r * rAudio[i]); // abs(rAudio[i])); //r * rAudio[i]);
        //else ofCircle(circlePos.x, circlePos.y, r * 1 - rAudio[i]);
        //cout << "rAudio: "<< rAudio[i] << endl;
    }
    ofDisableAlphaBlending();
    */
    if (bPlay) {
        rfe_buttonStop.draw();
    } else {
        rfe_button.draw();
    }
    
    panLeftButton.draw();
    panCenterButton.draw();
    panRightButton.draw();
    
    panSlider.draw();
    loFreqSlider.draw();
    hiFreqSlider.draw();
    volSlider.draw();
    
    sinWaveButton.draw();
    squareWaveButton.draw();
    
    ofSetHexColor(0xed3f00);
    string panString = "Pan: " + ofToString(pan);
    testFont.drawString(panString, 20, ofGetHeight()-200);
    string freqString = "Freq: " + ofToString(targetFrequency);
    testFont.drawString(freqString, 20, ofGetHeight()-150);
    string volString = "Volume: " + ofToString(volume);
    testFont.drawString(volString, 20, ofGetHeight()-100);
    string frameRateString = "Frame Rate: " + ofToString(ofGetFrameRate()) + " fps";
    testFont.drawString(frameRateString, 20, ofGetHeight()-50);
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
        
        if (bSin) {
            sample = sin(phase);              // Sine wave
        }
        if (bSquare) {
            sample = sin(phase)>0?1:-1;     // Square wave
        }
        
        //float sample = fmod(phase, TWO_PI);     // Saw wave NOT WORKING NOW
        lAudio[i] = output[i * nChannels] = sample * volume * leftScale;
        rAudio[i] = output[i * nChannels + 1] = sample * volume * rightScale;
    }
}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
    touchPos.set(touch.x, touch.y);
    
    buttonClick = true;
    
    loFreqSlider.moveSlider(touch.x, touch.y);
    hiFreqSlider.moveSlider(touch.x, touch.y);
    volSlider.moveSlider(touch.x, touch.y);
    
    if (hiFreqSlider.bisClicked) targetFrequency = hiFreqSlider.value;
    if (loFreqSlider.bisClicked) targetFrequency = loFreqSlider.value;
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
    //panSlider.moveSlider(touch.x, touch.y);
    loFreqSlider.moveSlider(touch.x, touch.y);
    hiFreqSlider.moveSlider(touch.x, touch.y);
    volSlider.moveSlider(touch.x, touch.y);
    
    if (hiFreqSlider.bisClicked) targetFrequency = hiFreqSlider.value;
    if (loFreqSlider.bisClicked) targetFrequency = loFreqSlider.value;
    
}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){
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

