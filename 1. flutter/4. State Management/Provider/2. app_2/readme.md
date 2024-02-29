# A sample of based on Provider and API (using model class)
so the task is done here is , how call an api and use that using provider and update the ui 
## How the all the file works ? 
1. api_model.dart :  holds the data structure of the of the json. It was generated using json to dart
2. api_services.dart : makes the requeest and receive the data. process the data and return the data if any class calls for it.
3. api_providerState.dart : calls the apiServices for the data and listen to any changes. it also used for providing the updated data in ui.  api_services.dart  doesn't provide the data directly . We used the api provider to get the data in ui.
4. provider_homScreen_2.dart : where in the init state we call the provider. In the WidgetBuild, by getting the provide we update value in ui. 
### mind that we ui do the interaction with api_providerState.dart, it gets the data from there or make any changes in the data. 
