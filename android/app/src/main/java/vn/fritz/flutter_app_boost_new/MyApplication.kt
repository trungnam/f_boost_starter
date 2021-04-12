package vn.fritz.flutter_app_boost_new

import com.idlefish.flutterboost.FlutterBoost
import io.flutter.app.FlutterApplication
import io.flutter.embedding.engine.FlutterEngine


class MyApplication : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        FlutterBoost.instance().setup(this, MyFlutterBoostDelegate()) { engine: FlutterEngine -> engine.plugins }

    }
}