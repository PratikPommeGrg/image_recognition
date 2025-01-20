package com.example.image_recognition

import android.content.Context
import com.google.android.material.slider.Slider
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.common.MethodChannel


class NativeSlider(private val context: Context, private val methodChannel: MethodChannel) : PlatformView {

    private val slider: Slider = Slider(context).apply {
        valueFrom = 0f
        valueTo = 100f
        value = 50f
        addOnChangeListener { slider, value, fromUser ->
            // Send slider value updates to Flutter
            methodChannel.invokeMethod("onValueChanged", value)
        }
    }

    override fun getView(): Slider {
        return slider
    }

    override fun dispose() {}
}
