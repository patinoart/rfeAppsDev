//
//  ofxRfeUIDDMenu.h
//  rfeDropDownMenuTest
//
//  Created by Juan Patino on 4/24/13.
//
//

#pragma once

#include "ofMain.h"

class ofxRfeUIDDMenu {
  
public:
    
    bool bisClicked;
    bool bisHit;
    bool bHover;
    
    float x;
    float y;
    float w;
    float hCollapsed;
    float hExpanded;
    float ySelected;
    
    ofColor buttonColor;
    ofColor highlightColor;
    ofColor labelColor;
    ofPoint touch;
    
    ofTrueTypeFont buttonLabel;
    string buttonLabelName;
        
    vector<string> itemList;
    vector<ofRectangle> itemRects;
    string itemNameSelected;
    
    void setup(string _buttonName, float _x, float _y, float _w, float _h);
    void style(ofColor _default, ofColor _highLight, ofColor _labelColor);
    void loadItems(vector<string> _items);
    void update(bool _bisClicked, ofPoint _mouse);
    void draw();
    void touchItem(float _x, float _y);
    bool buttonEvent(float _x, float _y);
    
};
