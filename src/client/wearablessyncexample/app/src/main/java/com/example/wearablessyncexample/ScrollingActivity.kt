package com.example.wearablessyncexample

import android.os.Bundle
import android.util.Log
import android.view.Menu
import android.view.MenuItem
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.appbar.CollapsingToolbarLayout
import com.google.android.material.floatingactionbutton.FloatingActionButton
import com.google.android.material.snackbar.Snackbar
import com.microsoft.signalr.HubConnectionBuilder
import java.lang.Exception

class ScrollingActivity : AppCompatActivity() {
    private lateinit var startTimerTextView: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_scrolling)
        setSupportActionBar(findViewById(R.id.toolbar))
        findViewById<CollapsingToolbarLayout>(R.id.toolbar_layout).title = title
        findViewById<FloatingActionButton>(R.id.fab).setOnClickListener { view ->
            Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                    .setAction("Action", null).show()
        }

        startTimerTextView = findViewById<TextView>(R.id.StartTimerTextView)
    }

    override fun onResume() {
        super.onResume()

        val hubConnection = HubConnectionBuilder.create("http://jwsignalraks.westus2.cloudapp.azure.com/startTimerHub")
            .build()

        Log.d("com.example.wearablessyncexample.onResume", "On Resume Called")

        hubConnection.on(
            "StartTimerEvent",
            { user: String?, startTimerResponse: StartTimerResponse? ->
                Log.d("com.example.wearablessyncexample.hubConnection.StartTimerEvent:", startTimerResponse.toString());
                runOnUiThread {
                    startTimerTextView.text =
                        "${startTimerTextView.text}\n${user}: ${startTimerResponse?.partnerIdentifier} at ${startTimerResponse?.timerEndDate}\n"
                }
            },
            String::class.java,
            StartTimerResponse::class.java
        )

        hubConnection.onClosed { exception: Exception -> Log.e("com.example.wearablessynceexample.onClosed", exception.message.toString()) }

        hubConnection.start().blockingAwait()
        Log.d("com.example.wearablessyncexample.hubConnection", hubConnection.connectionState.toString());
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        // Inflate the menu; this adds items to the action bar if it is present.
        menuInflater.inflate(R.menu.menu_scrolling, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.

        return when (item.itemId) {
            R.id.action_settings -> true
            else -> super.onOptionsItemSelected(item)
        }
    }
}
