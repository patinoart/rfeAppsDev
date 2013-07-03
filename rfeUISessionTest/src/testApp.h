#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "ofxRfeUIDDMenu.h"
#include "ofxRfeUIImageButton.h"
#include "ofxRfeUIButton.h"
#include "ofxRfeUISlider.h"
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
    
        // RFE SESSION TEST
    
        // GLOBAL COLORS
        ofColor red, blueGray, blueLight, blueMed, blueDark;
        ofColor textColor;
        
        // BACKGROUND VARIABLES
        ofTrueTypeFont headerLabel, menuLabels;
        float menuLabelX, menuLabelY, menuMargin;
        string areaLabel, beforeLabel, intensityLabel, freqLabel, timeLabel;
        
        // Menus
        ofxRfeUIDDMenu areaMenu, intensityMenu, freqMenu;
        float menuX, menuY, menuW, menuH;
        bool menuClick;
        vector <string> areaList, intensityList, freqList;
        string selAreaString, selIntensityString, selFreqString;
        
        // Sliders
        ofxRfeUIStepSlider beforeSlider, timeSlider;
        float sliderX, sliderY, sliderW, sliderH;
        bool beforeSMove, timeSMove;
        string selBefore, selTime;
        
        // Button (Navigation Bar, Start Button)
        ofxRfeUIButton settingsViewButton, startButton, stopButton;
        float settingsX, settingsY, startImgX, startImgY;
        bool bSettingsClick, bStartBClick, bStart;
        string startButtonLabel;
    
        // USER Variables
        ofPoint user;
        
        // Create Class to contain one session
        
        // AUDIO SETUP
            
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


