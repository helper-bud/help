    private val _selectedImages = mutableListOf<Uri>()

// for launching the intent
private val seletecImagesResult = registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { activityResult ->
        if (activityResult.resultCode == RESULT_OK){
            val intent = activityResult.data
            // multiple image selected
            if(intent?.clipData != null){
                val count = intent.clipData?.itemCount ?: 0
                (0 until count).forEach {
                    val imageUri = intent.clipData?.getItemAt(it)?.uri
                    imageUri?.let {
                        _selectedImages.add(it)
                    }
                }
            }
            else // if only selected image
            {
                val imageUri = intent?.data
                imageUri?.let {
                    _selectedImages.add(it)
                }
            }

            _updateImagesCounter()

        }

    }

// just a counter to count number of image selected. 
 private fun _updateImagesCounter() {
        binding.tvSelectedImages.text = _selectedImages.size.toString()
    }

 // on pressing launching the intent
 //image picker
            buttonImagesPicker.setOnClickListener {
                val intent = Intent(Intent.ACTION_GET_CONTENT)
                intent.putExtra(Intent.EXTRA_ALLOW_MULTIPLE, true)
                intent.type = "image/*"
                seletecImagesResult.launch(intent)
            }


