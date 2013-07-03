//
//  ofxRfeUIDDMenu.cpp
//  rfeDropDownMenuTest
//
//  Created by Juan Patino on 4/24/13.
//
//

#include "ofxRfeUIDDMenu.h"

//------------------------------------------------------------------
void ofxRfeUIDDMenu::setup(string _buttonName, float _x, float _y, float _w, float _h){
    
    x = _x;
    y = _y;
    w = _w;
    hCollapsed = _h;
    
    buttonLabel.loadFont("MavenPro-Regular.ttf", 24);
    buttonLabel.setLineHeight(24);
    buttonLabel.setLetterSpacing(1.0f);
    
    buttonLabelName = _buttonName;
    
    buttonColor.setHex(0x6095a5);
    
    highlightColor.setHex(0xed3f00);
    
    
    
}

//------------------------------------------------------------------
void ofxRfeUIDDMenu::style(ofColor _default, ofColor _highLight, ofColor _labelColor){
    
    buttonColor = _default;
    
    highlightColor = _highLight;
    
    labelColor = _labelColor;
    
}

//------------------------------------------------------------------
void ofxRfeUIDDMenu::loadItems(vector<string> _items){
    
    itemList = _items;
    
    hExpanded = hCollapsed * itemList.size();
    itemNameSelected = itemList.at(0);
    
    for (int i = 0; i < itemList.size(); i++) {
        float yStepper = y + hCollapsed*i;
        itemRects.push_back(ofRectangle(x, yStepper, w, hCollapsed));
    }
    
}

//------------------------------------------------------------------
void ofxRfeUIDDMenu::update(bool _bisClicked, ofPoint _mouse){
    
    bisClicked = _bisClicked;
    touch = _mouse;
    
    bool checkBool = buttonEvent(_mouse.x, _mouse.y);
    
    if (checkBool && bisClicked) {
        //ofSetColor(highlightColor);
        //cout << "Button Clicked" << endl;
        bisHit = true;
    } else {
        //ofSetColor(buttonColor);
        bisHit = false;
        
    }
    
}

//------------------------------------------------------------------
void ofxRfeUIDDMenu::draw(){
    
    ofPushStyle();
    if (bisHit) {
        //ofSetColor(highlightColor);
        ofSetColor(buttonColor);
        ofRect(x, y, w, hExpanded);
        
        
        ofSetColor(highlightColor);
        if (bHover) {
            ofRect(x, ySelected, w, hCollapsed);
        }
    
        for (int i = 0; i < itemList.size(); i++) {
            ofPushStyle();
            ofSetColor(255);
            float yStepper = y + hCollapsed * (i+1) - buttonLabel.stringHeight(itemList.at(i));
            buttonLabel.drawString(itemList.at(i), x+20, yStepper+10 );
            ofPopStyle();
        }
        
    } else {
        ofSetColor(buttonColor);
        ofRect(x, y, w, hCollapsed);
        ofPushStyle();
            ofSetColor(255);
            buttonLabel.drawString(buttonLabelName+": "+itemNameSelected, x+20, y+hCollapsed-5-(buttonLabel.stringHeight(itemNameSelected)*0.5f));
            //cout << "getSize: " << buttonLabel.getSize() << endl;
        ofPopStyle();
    }
    ofPopStyle();
    
}

//------------------------------------------------------------------
void ofxRfeUIDDMenu::touchItem(float _x, float _y){
    

    for (int i = 0; i < itemList.size(); i++) {
        
        float rectAtIndexX = itemRects.at(i).x;
        float rectAtIndexY = itemRects.at(i).y;
        float rectAtIndexW = itemRects.at(i).width;
        float rectAtIndexH = itemRects.at(i).height;
        
        if (_x > rectAtIndexX && _x < (rectAtIndexX + rectAtIndexW)) {
            if (_y > rectAtIndexY && _y < (rectAtIndexY + rectAtIndexH)) {
                ySelected = rectAtIndexY;
                itemNameSelected = itemList.at(i);
                bHover = true;
            }
            
    }
    }

}

//------------------------------------------------------------------
bool ofxRfeUIDDMenu::buttonEvent(float _x, float _y){
    
    if (_x > x && _x < (x + w)) {
        if (_y > y && _y < (y + hCollapsed)) {
            return true;
        }
    } else {
        return false;
    }
    return 0;
    
}