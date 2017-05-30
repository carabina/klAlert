klAlert
=======
UIAlertController is nice and all, but it means having to write a few lines of code where before one call was often all you'd need. klAlert is a series of static functions that let you create and handle the results of a modern alert in just one call:
```	
Alert.withTwoButtonsAndCompletion(title: "Checking",
		                            msg: "Shall we go on or cancel?",
		                         cancel: "Cancel",
		                             go: "Go On") { (go) in
							if go {
								//We proceed
							} else {
								//We cancel
							}
		}
```
## Current Version: 1.0.2
It, um, helps to make the class public...

## Installation
### [CocoaPods](http://cocoapods.org/)

1. Add the following to your [Podfile](http://guides.cocoapods.org/using/the-podfile.html):

    ```
    use_frameworks! #if this isn't already in your podfile
    pod "klAlert"
    ```
2. Run `pod install`.
3. Enjoy.

## Documentation
Until I have ample time, note that you can find at least simple examples of usage in the Demo app.
### Static Functions for the Class Alert
#### `static func withOneButton(title: String, msg: String, btn: String)`
Shows an alert with one button. There is no completion hander. It simply vanishes when the user taps the button.  
**Parameters**  
*title*: Title at top of alert  
*msg*: Explanatory alert text  
*btn*: Text for the button  

#### `static func withOneButtonAndCompletion(title: String, msg: String, btn: String, handler: @escaping () -> ())`
Shows an alert with one button. After a tap, it runs the completion handler.  
**Parameters**  
*title*: Title at top of alert  
*msg*: Explanatory alert text  
*btn*: Text for the button  
*handler*: closure that will run when the button is tapped  

#### `static func withTwoButtonsAndCompletion(title: String, msg: String, cancel: String, go: String, handler: @escaping (_ result: Bool) -> ())`
Shows an alert with two buttons, one using the .cancel style. After a tap, it runs the completion handler using a boolean to indicate if the user pressed the "go" or "cancel" button.  
**Parameters**  
*title*: Title at top of alert  
*msg*: Explanatory alert text  
*cancel*: Text for the "Cancel" button  
*go*: Text for the "OK" or "Proceed" button  
*handler*: closure with a Bool indicating which button was tapped (go == true)  

#### `static func asAPopupWithCompletion(source: UIView, title: String?, msg: String?, cancel: String, buttons: [String], handler: @escaping (_ result: Int) -> ())`
Shows a popup (action sheet) alert with a number of buttons, runs the completion handler once the user makes a choice and returns the index of the tapped button (cancel = 0, btn1 = 1...)  
**Parameters**  
*source*: The view from which the popover emanates (used if presented on an iPad)  
*title*: Large title at top of alert  
*msg*: Small subtitle. Can be nil  
*cancel*: Text for the "Cancel" button  
*buttons*: Array of Strings with button titles  
*handler*: closure with an Int indicating which button was tapped (cancel = 0, btn1 = 1...)  


