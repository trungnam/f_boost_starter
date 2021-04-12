package vn.fritz.flutter_app_boost_new

import android.content.Intent
import com.idlefish.flutterboost.FlutterBoost
import com.idlefish.flutterboost.FlutterBoostDelegate
import com.idlefish.flutterboost.containers.FlutterBoostActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs

class MyFlutterBoostDelegate : FlutterBoostDelegate {
    override fun pushNativeRoute(pageName: String, arguments: Map<String, Any>) {
        val intent = Intent(FlutterBoost.instance().currentActivity(), NativePageActivity::class.java)
        FlutterBoost.instance().currentActivity().startActivity(intent)
    }

    override fun pushFlutterRoute(pageName: String, uniqueId: String, arguments: Map<String, Any>) {
        val intent = FlutterBoostActivity.CachedEngineIntentBuilder(FlutterBoostActivity::class.java, FlutterBoost.ENGINE_ID)
                .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.opaque)
                .destroyEngineWithActivity(false)
                .uniqueId(uniqueId)
                .url(pageName)
                .urlParams(arguments)
                .build(FlutterBoost.instance().currentActivity())
        FlutterBoost.instance().currentActivity().startActivity(intent)
    }
}
