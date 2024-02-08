activity_main.xml
<!--spinner category / drop down category-->
            <com.google.android.material.textfield.TextInputLayout
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:hint="@string/select"
                style="@style/Widget.MaterialComponents.TextInputLayout.OutlinedBox.ExposedDropdownMenu"
                >
                <AutoCompleteTextView
                    android:id="@+id/autoComplete"
                    android:layout_width="match_parent"
                    android:layout_height="wrap_content"
                    android:inputType="none"
                    android:layout_margin="5dp"
                    />
            </com.google.android.material.textfield.TextInputLayout>


  list_item.xml
<?xml version="1.0" encoding="utf-8"?>
<TextView xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:padding="16dp"
    android:ellipsize="end"
    android:maxLines="1"
    android:textAppearance="?attr/textAppearanceSubtitle1"
    >

</TextView>

string.xml
<resources>
    <string name="app_name">Quantum Forge Admin</string>
    <string name="select">Select Item</string>
</resources>

MainActivity.kt
         private val category_items = arrayOf( "Men", "Woman", "Kids", "Accessories", "Sale")
         private lateinit var categorAdapter: ArrayAdapter<String>
//  category spinner
            categorAdapter = ArrayAdapter<String> (this@MainActivity, R.layout.list_item,category_items)
            autoComplete.setAdapter(categorAdapter)
            binding.autoComplete.setOnItemClickListener(object  : OnItemClickListener{
                override fun onItemClick(parent: AdapterView<*>?, view: View?, position: Int, id: Long) {
                    var item = parent?.getItemAtPosition(position).toString()
                }
            })




