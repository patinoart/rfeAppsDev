#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "ofxRfeUIButton.h"
#include "ofxRfeUISlider.h"
#include "ofxRfeUIDDMenu.h"
#include "ofxRfeUIStepSlider.h"

class testApp : public ofxiPhoneApp{
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
    
        void audioOut(float * output, int bufferSize, int nChannels);
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
        //Menu for Intensity / POWER - L M H
        ofxRfeUIDDMenu powerMenu;
        vector<string> powerOptions;
        string powerLabel, selPower;
        bool menuClick;
        
        //Menu For Frequency / SPEED - L M H
        ofxRfeUIDDMenu speedMenu;
        vector<string> speedOptions;
        string speedLabel, selSpeed;
    
        //Step Slider for Duration
        ofxRfeUIStepSlider timeSlider;
        string timerLabel, selTime;
        float minVal, maxVal;
        bool sliderMov;
    
        // Button to start the Session (start the timer)
        ofxRfeUIButton startButton;
        bool bStart;
        // Timer variables to control the audio signal
        float startTime, endTime, resetTimer, theTimer;
        bool bTimeReached;
    
        // Position Variables
        float xPos, yPos, UIWidth, UIHeight;
        ofPoint user;
        ofPoint touchPos;
    
        ofTrueTypeFont testFont;
    
        // AUDIO
        float pan;
        int sampleRate;
        bool bNoise;
        float volume;
        
        float * lAudio;
        float * rAudio;
        
        //------------------- for the simple sine wave synthesis
        float targetFrequency;
        float phase;
        float phaseAdder;
        float phaseAdderTarget;
        int initialBufferSize;

};


