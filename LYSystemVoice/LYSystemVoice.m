//
//  LYSystemVoice.m
//  LYSDK
//
//  Created by 111 on 16/11/21.
//  Copyright © 2016年 111. All rights reserved.
//

#import "LYSystemVoice.h"
static SystemSoundID soundId;

@implementation LYSystemVoice
// 打开系统音频
+ (void)play:(NSString *)voiceStr{
    
    if(voiceStr){
        NSString * path = [NSString stringWithFormat:@"/System/Library/Audio/UISounds/%@.caf",voiceStr];
        NSURL * fileUrl = [NSURL URLWithString:path];
        if(path){
            SystemSoundID theSoungId;
            OSStatus err = AudioServicesCreateSystemSoundID((__bridge CFURLRef)fileUrl, &theSoungId);
            if(err == kAudioServicesNoError){
                soundId  = theSoungId;
            }
        }
    }else{
        soundId = kSystemSoundID_Vibrate;
    }
    AudioServicesPlaySystemSound(soundId);
}
@end
