// glide imge view
    implementation 'com.github.bumptech.glide:glide:4.16.0'

Glide.with(context).load(R.drawable.loading_1).into( DrawableImageViewTarget(progressbar.customLoadingImageView)); /// loading_1 gif file. 

/// layout
<?xml version="1.0" encoding="utf-8"?>
<androidx.cardview.widget.CardView xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    app:cardElevation="@dimen/_5sdp"
    app:cardCornerRadius="@dimen/_15sdp"
    android:layout_marginStart="@dimen/_15sdp"
    android:layout_marginEnd="@dimen/_15sdp"
    >
    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="vertical"
        android:gravity="center"
        android:layout_margin="@dimen/_10sdp"
        >
        <ImageView
            android:id="@+id/custom_loading_imageView"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:src="@drawable/loading_1"
            app:layout_constraintBottom_toBottomOf="parent"
            app:layout_constraintEnd_toEndOf="parent"
            app:layout_constraintStart_toStartOf="parent"
            app:layout_constraintTop_toTopOf="parent" />
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
