package vn.fritz.flutter_app_boost_new

import android.os.Bundle
import android.util.Log
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import com.idlefish.flutterboost.FlutterBoost
import com.idlefish.flutterboost.containers.FlutterBoostActivity
import com.jakewharton.rxbinding4.view.clicks
import io.flutter.embedding.android.FlutterActivityLaunchConfigs
import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers
import java.lang.ref.WeakReference
import java.util.*
import java.util.concurrent.TimeUnit


class Main2Activity : AppCompatActivity() {

    private val btnGoToFlutter: Button by lazy { findViewById<Button>(R.id.btnGoToFlutter) }

    var sRef: WeakReference<Main2Activity>? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        WeakReference(this).also { this.sRef = it }

        setContentView(R.layout.activity_main2)

        val params = HashMap<String, Any>().apply {
            this["string"] = "a string"
            this["bool"] = true
            this["int"] = 666
        }

        btnGoToFlutter.clicks()
                .observeOn(AndroidSchedulers.mainThread())
//                .debounce(200, TimeUnit.MILLISECONDS, AndroidSchedulers.mainThread())
                .throttleFirst(400,TimeUnit.MILLISECONDS, AndroidSchedulers.mainThread())

                .subscribe {
                    Log.e("$this", "btnFlutter RX clicks")

                    val intent = FlutterBoostActivity.CachedEngineIntentBuilder(FlutterBoostActivity::class.java, FlutterBoost.ENGINE_ID)
                            .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.opaque)
                            .destroyEngineWithActivity(false)
                            .url("flutterPage")
                            .urlParams(params)
                            .build(this@Main2Activity)
                    startActivity(intent)
                }



    }


}