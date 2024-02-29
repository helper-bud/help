## so this is the another versiono of app_2, where i didn't created any kind of model class to get the data. 

### Files description 
1. api_services.dart : what it does is get the data. It doesn't use any model class, just used the dynamic keyword to receive the app data.in this case, the just gets decoded and then send to provider class.
2. api_providerState.dart also uses the dynamic class and to notify any changes of the data to the class. 
3. provider_homeScreen_2.dart what this does is get the data. but you will see long typed code to get a specific data from the provider, (its because we didn't used any model class in this case.)
