private fun customizingEntertinOTP(){
        val editText = arrayOf(binding.edOTP1, binding.edOTP2, binding.edOTP3, binding.edOTP4, binding.edOTP5, binding.edOTP6)
        for(i in editText.indices){
            editText[i].addTextChangedListener(object : TextWatcher{
                override fun beforeTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {}

                override fun onTextChanged(p0: CharSequence?, p1: Int, p2: Int, p3: Int) {}

                override fun afterTextChanged(s: Editable?) {
                    if (s?.length == 1){ // checking if edit text is filed with something or not. if is then = 1, other wise 0. automatically moves upon the next otp number
                        if(i < editText.size -1){
                            editText[i+1].requestFocus()
                        }
                    }
                    else if(s?.length == 0){  // if not filled with something then give 0. backgpressing or deleting will move back to prev otp number
                        if(i > 0){
                            editText[i-1].requestFocus()
                        }
                    }
                }

            })
        }
    }

// OTP lay out for 6 otp. not background file neede
<LinearLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:weightSum="6"
            android:orientation="horizontal"
            android:layout_marginTop="@dimen/_10sdp"
            android:layout_marginStart="@dimen/_5sdp"
            android:layout_marginEnd="@dimen/_5sdp"
            >

            <com.google.android.material.textfield.TextInputLayout
                android:layout_width="0dp"
                android:layout_height="match_parent"
                android:layout_weight="1"
                app:boxCornerRadiusTopEnd="@dimen/_15sdp"
                app:boxCornerRadiusBottomEnd="@dimen/_15sdp"
                app:boxCornerRadiusBottomStart="@dimen/_15sdp"
                app:boxCornerRadiusTopStart="@dimen/_15sdp"
                >
                <com.google.android.material.textfield.TextInputEditText
                    android:id="@+id/edOTP1"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:gravity="center"
                    android:inputType="number"
                    />

            </com.google.android.material.textfield.TextInputLayout>

            <com.google.android.material.textfield.TextInputLayout
                android:layout_width="0dp"
                android:layout_height="match_parent"
                android:layout_weight="1"
                app:boxCornerRadiusTopEnd="@dimen/_15sdp"
                app:boxCornerRadiusBottomEnd="@dimen/_15sdp"
                app:boxCornerRadiusBottomStart="@dimen/_15sdp"
                app:boxCornerRadiusTopStart="@dimen/_15sdp"
                android:layout_marginStart="@dimen/_5sdp"

                >
                <com.google.android.material.textfield.TextInputEditText
                    android:id="@+id/edOTP2"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:gravity="center"
                    android:inputType="number"
                    />

            </com.google.android.material.textfield.TextInputLayout>

            <com.google.android.material.textfield.TextInputLayout
                android:layout_width="0dp"
                android:layout_height="match_parent"
                android:layout_weight="1"
                app:boxCornerRadiusTopEnd="@dimen/_15sdp"
                app:boxCornerRadiusBottomEnd="@dimen/_15sdp"
                app:boxCornerRadiusBottomStart="@dimen/_15sdp"
                app:boxCornerRadiusTopStart="@dimen/_15sdp"
                android:layout_marginStart="@dimen/_5sdp"
                >
                <com.google.android.material.textfield.TextInputEditText
                    android:id="@+id/edOTP3"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:gravity="center"
                    android:inputType="number"
                    />

            </com.google.android.material.textfield.TextInputLayout>

            <com.google.android.material.textfield.TextInputLayout
                android:layout_width="0dp"
                android:layout_height="match_parent"
                android:layout_weight="1"
                app:boxCornerRadiusTopEnd="@dimen/_15sdp"
                app:boxCornerRadiusBottomEnd="@dimen/_15sdp"
                app:boxCornerRadiusBottomStart="@dimen/_15sdp"
                app:boxCornerRadiusTopStart="@dimen/_15sdp"
                android:layout_marginStart="@dimen/_5sdp"
                >
                <com.google.android.material.textfield.TextInputEditText
                    android:id="@+id/edOTP4"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:gravity="center"
                    android:inputType="number"
                    />

            </com.google.android.material.textfield.TextInputLayout>

            <com.google.android.material.textfield.TextInputLayout
                android:layout_width="0dp"
                android:layout_height="match_parent"
                android:layout_weight="1"
                app:boxCornerRadiusTopEnd="@dimen/_15sdp"
                app:boxCornerRadiusBottomEnd="@dimen/_15sdp"
                app:boxCornerRadiusBottomStart="@dimen/_15sdp"
                app:boxCornerRadiusTopStart="@dimen/_15sdp"
                android:layout_marginStart="@dimen/_5sdp"
                >
                <com.google.android.material.textfield.TextInputEditText
                    android:id="@+id/edOTP5"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:gravity="center"
                    android:inputType="number"
                    />

            </com.google.android.material.textfield.TextInputLayout>

            <com.google.android.material.textfield.TextInputLayout
                android:layout_width="0dp"
                android:layout_height="match_parent"
                android:layout_weight="1"
                app:boxCornerRadiusTopEnd="@dimen/_15sdp"
                app:boxCornerRadiusBottomEnd="@dimen/_15sdp"
                app:boxCornerRadiusBottomStart="@dimen/_15sdp"
                app:boxCornerRadiusTopStart="@dimen/_15sdp"
                android:layout_marginStart="@dimen/_5sdp"

                >
                <com.google.android.material.textfield.TextInputEditText
                    android:id="@+id/edOTP6"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:gravity="center"
                    android:inputType="number"
                    />

            </com.google.android.material.textfield.TextInputLayout>

        </LinearLayout>
