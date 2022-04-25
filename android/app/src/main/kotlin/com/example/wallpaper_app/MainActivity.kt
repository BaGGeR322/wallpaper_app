package com.example.wallpaper_app

import android.app.WallpaperManager
import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.os.Build
import androidx.annotation.RequiresApi
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.IOException

private const val CHANNEL = "com.example.wallpaper_app/wallpaper_channel"
class MainActivity: FlutterActivity() {
    private lateinit var channel: MethodChannel

    @RequiresApi(Build.VERSION_CODES.N)
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)

        channel.setMethodCallHandler {call, result ->
            if (call.method == "setWallpaper") {
                val arguments = call.arguments as ArrayList<*>
                val setWallpaper = setWallpaper(arguments[0] as String, applicationContext, arguments[1] as Int, arguments[2] as Int, arguments[3] as Int)

                if (setWallpaper == 0) {
                    result.success(setWallpaper)
                } else {
                    result.error("UNAVAILABLE", "", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    @RequiresApi(Build.VERSION_CODES.N)
    private fun setWallpaper(path: String, applicationContext: Context, wallpaperType: Int, widthDevice: Int, heightDevice: Int): Int {
        var setWallpaper = 1
        val bitmap = BitmapFactory.decodeFile(path)
        var cx = (bitmap.width - widthDevice) / 2
        cx = if (cx < 0) 0 else cx
        var cy = bitmap.height - heightDevice
        cy = if (cy < 0) 0 else cy
        val resizedBitmap = Bitmap.createBitmap(bitmap, cx, cy, widthDevice, heightDevice)
        val wm: WallpaperManager? = WallpaperManager.getInstance(applicationContext)
        setWallpaper = try {
            wm?.setBitmap(resizedBitmap, null, true, wallpaperType)
            0
        } catch (e: IOException) {
            1
        }

        return setWallpaper
    }
}
