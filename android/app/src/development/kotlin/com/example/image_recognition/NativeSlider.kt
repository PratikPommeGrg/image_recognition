import android.content.Context
import android.widget.SeekBar
import io.flutter.plugin.platform.PlatformView

class NativeSlider(private val context: Context) : PlatformView {
    private val seekBar: SeekBar = SeekBar(context).apply {
        max = 100
        setOnSeekBarChangeListener(object : SeekBar.OnSeekBarChangeListener {
            override fun onProgressChanged(seekBar: SeekBar?, progress: Int, fromUser: Boolean) {
                // Handle progress changes
            }

            override fun onStartTrackingTouch(seekBar: SeekBar?) {}
            override fun onStopTrackingTouch(seekBar: SeekBar?) {}
        })
    }

    override fun getView(): SeekBar {
        return seekBar
    }

    override fun dispose() {}
}
