#include "ofMain.h"
#include "testApp.h"
#include "Globals.h"


int main(){
    
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        if ([[UIScreen mainScreen] scale] > 1)
            isRetina = true;
    }
    if ([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)]) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            isiPad = true;
        }
    }
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad && [[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [UIScreen mainScreen].scale > 1){
        isRetina = true;
        isiPad = true;
    }
    
    [pool release];
    
    int width;
    int height;
    
    if (isRetina && isiPad){
        width = 1536;
        height = 2048;
        scaleWidth =4.8;
        scaleHeight =4.2666;
    }
    else if (!isRetina && !isiPad){
        width = 320;
        height = 480;
        scaleWidth =1;
        scaleHeight =1;
    }
    else if (isRetina && !isiPad){
        width = 640;
        height = 960;
        scaleWidth =2;
        scaleHeight =2;
    }
    else if (!isRetina && isiPad){
        width = 768;
        height = 1024;
        scaleWidth =2.4;
        scaleHeight =2.13333;
    }
    
    if ([ [ UIScreen mainScreen ] bounds ].size.height == 568){
        iphone5 = true;
        width = 640;
        height = 1136;
        scaleWidth =2;
        scaleHeight =2.36666;
        
    } else {
        iphone5=false;
    }
    /**
     *
     *  Below is how you start using a native ios setup.
     *
     *  First a ofAppiPhoneWindow is created and added to ofSetupOpenGL()
     *  Notice that no app is being sent to ofRunApp() - this happens later when we actually need the app.
     *
     *  One last thing that needs to be done is telling ofAppiPhoneWindow which AppDelegate to use.
     *  This is a custom AppDelegate and inside it you can start coding your native iOS application.
     *  The AppDelegate must extend ofxiPhoneAppDelegate.
     *
     **/
    
    ofAppiPhoneWindow *window = new ofAppiPhoneWindow();
    ofSetupOpenGL(ofPtr<ofAppBaseWindow>(window), width, height, OF_FULLSCREEN);
    window->enableRetinaSupport();
    window->startAppWithDelegate("rfeAppDelegate");
    
}
