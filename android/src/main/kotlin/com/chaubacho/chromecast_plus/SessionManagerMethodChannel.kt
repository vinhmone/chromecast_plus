package com.chaubacho.chromecast_plus

import com.chaubacho.chromecast_plus.extensions.toMap
import com.google.android.gms.cast.framework.*
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
private const val TAG = "SessionManager"
class SessionManagerMethodChannel(discoveryManager: DiscoveryManagerMethodChannel) : FlutterPlugin,
    MethodChannel.MethodCallHandler, SessionManagerListener<Session> {

    private lateinit var channel: MethodChannel
    private val discoveryManagerMethodChannel: DiscoveryManagerMethodChannel = discoveryManager
    private val remoteMediaClientMethodChannel = RemoteMediaClientMethodChannel()

    private val sessionManager: SessionManager?
        get() {
            return CastContext.getSharedInstance()?.sessionManager
        }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel =
            MethodChannel(binding.binaryMessenger, "com.chaubacho.chromecast_plus.session_manager")
        channel.setMethodCallHandler(this)
        remoteMediaClientMethodChannel.onAttachedToEngine(binding)

    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "startSessionWithDeviceId" -> startSession(call.arguments, result)
            "endSessionAndStopCasting"-> sessionManager?.endCurrentSession(true)
            "endSession"-> sessionManager?.endCurrentSession(false)
            "setStreamVolume" -> sessionManager?.currentCastSession?.volume = call.arguments as Double

        }
    }

    private fun startSession(arguments: Any?, result: MethodChannel.Result) {
        val deviceId = arguments as String
        discoveryManagerMethodChannel.selectRoute(deviceId)
        result.success(true)

    }


    //SessionManagerLister
    override fun onSessionEnded(session: Session, p1: Int) {
        onSessionChanged()
    }

    override fun onSessionEnding(p0: Session) {
        onSessionChanged()
    }

    override fun onSessionResumeFailed(p0: Session, p1: Int) {

        onSessionChanged()
    }

    override fun onSessionResumed(p0: Session, p1: Boolean) {
        remoteMediaClientMethodChannel.startListen()
        onSessionChanged()
    }

    override fun onSessionResuming(p0: Session, p1: String) {
        onSessionChanged()
    }

    override fun onSessionStartFailed(p0: Session, p1: Int) {
        onSessionChanged()
    }

    override fun onSessionStarted(session: Session, p1: String) {
        remoteMediaClientMethodChannel.startListen()
        onSessionChanged()
    }

    override fun onSessionStarting(p0: Session) {
        onSessionChanged()
    }

    override fun onSessionSuspended(p0: Session, p1: Int) {
        onSessionChanged()
    }


    private fun onSessionChanged() {
        val session = sessionManager?.currentCastSession
        val map = session?.toMap()
        channel.invokeMethod("onSessionChanged", map)
    }


}