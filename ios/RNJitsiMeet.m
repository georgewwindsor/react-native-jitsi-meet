/*#import <React/RCTViewManager.h>
#import <React/RCTLog.h>
#import <JitsiMeet/JitsiMeet.h>

@interface RNJitsiMeetManager : RCTViewManager
@end

@implementation RNJitsiMeetManager {
    JitsiMeetView *jitsiMeetView;
    RCTResponseSenderBlock onConferenceFailed;
    RCTResponseSenderBlock onConferenceJoined;
    RCTResponseSenderBlock onConferenceLeft;
    RCTResponseSenderBlock onConferenceWillJoin;
    RCTResponseSenderBlock onConferenceWillLeave;
    RCTResponseSenderBlock onLoadConfigError;
     RCTResponseSenderBlock   onStartedMuted;
     RCTResponseSenderBlock   onStartedMutedPolicyChange;
     RCTResponseSenderBlock   onTrackMuteChange;
    RCTResponseSenderBlock   onTalkWhileMuted;
     RCTResponseSenderBlock   onRemoteTrackunMute;
    RCTResponseSenderBlock   onRemoteTrackMute;


}

RCT_EXPORT_MODULE()

- (UIView *)view
{
    jitsiMeetView = [[JitsiMeetView alloc] init];
    return jitsiMeetView;
}

- (void)conferenceFailed:(NSDictionary *)data {
    RCTLogInfo(@"Conference failed");
    if (onConferenceFailed != nil) {
      onConferenceFailed(@[data]);
    }
}

- (void)conferenceJoined:(NSDictionary *)data {
    RCTLogInfo(@"Conference joined");
    if (onConferenceJoined != nil) {
      onConferenceJoined(@[data]);
    }
}

- (void)conferenceLeft:(NSDictionary *)data {
    RCTLogInfo(@"Conference left");
    if (onConferenceLeft != nil) {
      onConferenceLeft(@[data]);
    }
}

- (void)conferenceWillJoin:(NSDictionary *)data {
    RCTLogInfo(@"Conference will join");
    if (onConferenceWillJoin != nil) {
      onConferenceWillJoin(@[data]);
    }
}

- (void)conferenceWillLeave:(NSDictionary *)data {
    RCTLogInfo(@"Conference will leave");
    if (onConferenceWillLeave != nil) {
      onConferenceWillLeave(@[data]);
    }
}

- (void)loadConfigError:(NSDictionary *)data {
    RCTLogInfo(@"Config error");
    if (onLoadConfigError != nil) {
      onLoadConfigError(@[data]);
    }
}









- (void)startedMuted:(NSDictionary *)data {
    RCTLogInfo(@"Config error");
    if (onStartedMuted != nil) {
      onStartedMuted(@[data]);
    }
}

- (void)startedMutedPolicyChange:(NSDictionary *)data {
    RCTLogInfo(@"Config error");
    if (onStartedMutedPolicyChange != nil) {
      onStartedMutedPolicyChange(@[data]);
    }
}
- (void)trackMuteChange:(NSDictionary *)data {
    RCTLogInfo(@"Config error");
    if (onTrackMuteChange != nil) {
      onTrackMuteChange(@[data]);
    }
}
- (void)talkWhileMuted:(NSDictionary *)data {
    RCTLogInfo(@"Config error");
    if (onTalkWhileMuted!= nil) {
      onTalkWhileMuted(@[data]);
    }
}
- (void)remoteTrackunMute:(NSDictionary *)data {
    RCTLogInfo(@"Config error");
    if (onRemoteTrackunMute != nil) {
      onRemoteTrackunMute(@[data]);
    }
}
- (void)remoteTrackMute:(NSDictionary *)data {
    RCTLogInfo(@"Config error");
    if (onRemoteTrackMute != nil) {
      onRemoteTrackMute(@[data]);
    }
}























RCT_EXPORT_METHOD(loadUrl:(NSString *)urlString)
{
  RCTLogInfo(@"Load URL %@", urlString);
  dispatch_sync(dispatch_get_main_queue(), ^{
      jitsiMeetView.delegate = self;
      [jitsiMeetView loadURLString:urlString];
  });
}

RCT_EXPORT_METHOD(setEventHandler:(NSString *)event callback:(RCTResponseSenderBlock)callback)
{
    if ([event  isEqual: @"CONFERENCE_FAILED"]) {
    onConferenceFailed = callback;
    } else if ([event  isEqual: @"CONFERENCE_JOINED"]) {
    onConferenceJoined = callback;
    } else if ([event  isEqual: @"CONFERENCE_LEFT"]) {
    onConferenceLeft = callback;
    } else if ([event  isEqual: @"CONFERENCE_WILL_JOIN"]) {
    onConferenceWillJoin = callback;
    } else if ([event  isEqual: @"CONFERENCE_WILL_LEAVE"]) {
    onConferenceWillLeave = callback;
    } else if ([event  isEqual: @"LOAD_CONFIG_ERROR"]) {
    onLoadConfigError = callback;

    } else if ([event  isEqual: @"STARTED_MUTED"]) {
    onStartedMuted = callback;
    } else if ([event  isEqual: @"START_MUTED_POLICY_CHANGED"]) {
    onStartedMutedPolicyChange = callback;
    } else if ([event  isEqual: @"TRACK_MUTE_CHANGED"]) {
    onTrackMuteChange = callback;
    } else if ([event  isEqual: @"TALK_WHILE_MUTED"]) {
    onTalkWhileMuted = callback;
    } else if ([event  isEqual: @“REMOTE_TRACK_UNMUTE”]) {
    onRemoteTrackunMute = callback;
    } else if ([event  isEqual: @“REMOTE_TRACK_MUTE”]) {
    onRemoteTrackMute = callback;

  }
}

RCT_EXPORT_METHOD(removeEventHandler:(NSString *)event)
{
    if ([event  isEqual: @"CONFERENCE_FAILED"]) {
    onConferenceFailed = nil;
    } else if ([event  isEqual: @"CONFERENCE_JOINED"]) {
    onConferenceJoined = nil;
    } else if ([event  isEqual: @"CONFERENCE_LEFT"]) {
    onConferenceLeft = nil;
    } else if ([event  isEqual: @"CONFERENCE_WILL_JOIN"]) {
    onConferenceWillJoin = nil;
    } else if ([event  isEqual: @"CONFERENCE_WILL_LEAVE"]) {
    onConferenceWillLeave = nil;
    } else if ([event  isEqual: @"LOAD_CONFIG_ERROR"]) {
          onLoadConfigError = nil;
   }
    else if ([event  isEqual: @"STARTED_MUTED"]) {
       onStartedMuted = nil;
           }
    else if ([event  isEqual: @"START_MUTED_POLICY_CHANGED"]) {
       onStartedMutedPolicyChange = nil;
              }
    else if ([event  isEqual: @"TRACK_MUTE_CHANGED"]) {
       onTrackMuteChange = nil;
                 }
    else if ([event  isEqual: @"TALK_WHILE_MUTED"]) {
      onTalkWhileMuted = nil;
                                   }
    else if ([event  isEqual: @"REMOTE_TRACK_UNMUTE"]) {
       onRemoteTrackunMute= nil;
                                                        }
   else if ([event  isEqual: @"REMOTE_TRACK_MUTE"]) {
      onRemoteTrackMute = nil;
     }
}

@end*/
