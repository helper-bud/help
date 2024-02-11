// in utils
private var dialog  : AlertDialog? = null
    fun showDialog(context: Context, message : String){
        val progressbar = ProgressDialogBinding.inflate(LayoutInflater.from(context))
        progressbar.tvtMessage.text = message
        dialog = AlertDialog
            .Builder(context)
            .setView(progressbar.root)
            .setCancelable(false)
            .create()

        dialog.show()
    }

    fun hideDialog(){
        dialog?.dismiss()
    }

// xml 
<?xml version="1.0" encoding="utf-8"?>
<androidx.cardview.widget.CardView xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    app:cardElevation="@dimen/_15sdp"
    app:cardCornerRadius="@dimen/_15sdp"
    android:layout_marginStart="@dimen/_15sdp"
    android:layout_marginEnd="@dimen/_15sdp"
    >
    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:orientation="vertical"
        android:gravity="center"
        android:layout_margin="@dimen/_10sdp"
        >

        <ProgressBar
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:indeterminateTint="@color/light_green"
            />

        <TextView
            android:id="@+id/tvtMessage"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="Loading..."
            android:fontFamily="@font/poppins_regular"
            android:textColor="@color/black"
            android:textSize="@dimen/_15ssp"
            android:layout_marginTop="@dimen/_5sdp"
            />
    </LinearLayout>
</androidx.cardview.widget.CardView>
