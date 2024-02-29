This is a simple conunter application that is built with provider state management.
## What is the main issue with statemanagement ? 
main issue with statemanagement with the widget tree is that, everytime we change something on the ui the whole screen gets updated. which is not so good for performance. for that reason we used another class to update any value of ui or state of the app. So using that state management we can make changes and only update ui on the particular part of the screen instead of rendering the whole ui again.

## NB : setState also or render whole screen again. 

# Above file : 
1. Counter_Provider_model : this acts as a model, where the value of the counter get incresead or decreased.
2. Count_Controller : this acts as a controller which checks/watc the value in the Counter_Provider_model, and return the updated value to ui or view.
3. Home_Screen : HomeScreen calls the controller (Count_Controller) and read the value and updates the value in the ui
4. Provider_main : This is equivalent to main.dart, it implements the home screen and on important thing in this part is : MultiProvider,  ChangeNotifierProvider
5. void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        // add rest of the provider you want.
      ],
      child: const MyApp())
  );
}
6. so here we have to wrap the main app with Multiprovider. Multiprovide is used if we have multiple provided value to be observed. Using this class is important  in the main.dart. All rest stay the same. 

