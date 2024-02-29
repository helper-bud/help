## This is and basic login app using rest api. where you can perform login using rest api and provider state management. 

### now how the whole files work ? 
1. api_services.dart  : reponsible for sending the request(with data) and then provide with to concerned classes
2. api_providerState.dart : responsible for handling the api_services.dart and also listen to any changes in the response result. This is the middle man for providing the data to the ui and also handling the request tothe api_service
3. provider_homScreen_2.dart : responsible for calling the api_providerState.dart where the provider gives the response to the ui. provider_homScreen_2.dart also takes input and send it to api_providerState.dart, so that it can send the data to server and fetch the reuslt. 
