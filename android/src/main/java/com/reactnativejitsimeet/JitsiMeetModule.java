package com.reactnativejitsimeet;

import android.content.Intent;
import android.content.IntentFilter;

import com.facebook.common.logging.FLog;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.modules.core.DeviceEventManagerModule;

public class JitsiMeetModule extends ReactContextBaseJavaModule {
    private DeviceEventManagerModule.RCTDeviceEventEmitter eventEmitter;

    public JitsiMeetModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "RNJitsiMeetNavigatorManager";
    }

    @ReactMethod
    public void initialize() {
      FLog.d("JitsiMeet", "Initialize");
      ReactApplicationContext context = getReactApplicationContext();
      this.eventEmitter = context.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class);
      JitsiBroadcastReceiver receiver = new JitsiBroadcastReceiver();
      receiver.setReactModule(this);
      IntentFilter filter = new IntentFilter();
      filter.addAction("CONFERENCE_FAILED");
      filter.addAction("CONFERENCE_JOINED");
      filter.addAction("CONFERENCE_LEFT");
      filter.addAction("CONFERENCE_WILL_JOIN");
      filter.addAction("CONFERENCE_WILL_LEAVE");
      filter.addAction("LOAD_CONFIG_ERROR");
      filter.addAction("STARTED_MUTED");
      filter.addAction("START_MUTED_POLICY_CHANGED");
      filter.addAction("TRACK_MUTE_CHANGED");
      filter.addAction("TALK_WHILE_MUTED");
      filter.addAction(“REMOTE_TRACK_UNMUTE”);
      filter.addAction(“REMOTE_TRACK_MUTE”);



      context.getCurrentActivity().registerReceiver(receiver, filter, context.getPackageName() + ".permission.JITSI_BROADCAST", null);
    }

    @ReactMethod
    public void call(String url) {
        ReactApplicationContext context = getReactApplicationContext();
        Intent intent = new Intent(context, JitsiMeetNavigatorActivity.class);
        intent.putExtra("url", url);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }


    public void callMuted(String url) {
        ReactApplicationContext context = getReactApplicationContext();


  Intent intent2 = new Intent(context, JitsiMeetNavigatorActivity.class);
        intent2.putExtra("url", url);
        intent2.setFlags(Intent.SET_START_MUTED_POLICY);
        context.startActivity(intent2);




        Intent intent = new Intent(context, JitsiMeetNavigatorActivity.class);
        intent.putExtra("url", url);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }



  public void mute(String url) {
        ReactApplicationContext context = getReactApplicationContext();
        Intent intent = new Intent(context, JitsiMeetNavigatorActivity.class);
        intent.putExtra("isMuted",true);
        intent.setFlags(Intent.CMD_SET_MUTED);
        context.startActivity(intent);
    }


  public void unmute(String url) {
        ReactApplicationContext context = getReactApplicationContext();
        Intent intent = new Intent(context, JitsiMeetNavigatorActivity.class);
      intent.putExtra("isMuted", false);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }




    public void onEventReceived(String event, WritableMap data) {
        eventEmitter.emit(event, data);
    }
}
