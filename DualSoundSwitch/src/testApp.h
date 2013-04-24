#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "ofxRfeUIButton.h"
#include "ofxRfeUISlider.h"

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
    
        // BUTTON SETUP
        ofxRfeUIButton rfe_button, rfe_buttonStop;
        bool bPlay;
    
        float buttonWidth;
        float buttonHeight;
        
        bool buttonClick;
        
        float xPos;
        float yPos;
    
        ofxRfeUIButton panLeftButton, panRightButton, panCenterButton;
        bool bLeftPan, bRightPan, bCenterPan;
    
        ofxRfeUIButton sinWaveButton, squareWaveButton;
        bool bSin, bSquare;
    
        // SLIDER SETUP
        ofxRfeUISlider panSlider, loFreqSlider, hiFreqSlider, volSlider;
        float sliderX, sliderY, sliderW, sliderH;
        bool panSMove, loFreqSMove, hiFreqSMove, volSMove;
    
        ofPoint circlePos;
        ofColor circleColor;
        
        ofPoint touchPos;
    
        ofTrueTypeFont testFont;
            
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


