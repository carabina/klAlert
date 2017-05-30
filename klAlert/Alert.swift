//
//  Alert.swift
//
//  Created by Ken Laws on 8/21/16.
//  Copyright © 2016 kenco.
//

import UIKit

let Device = UIDevice.current.userInterfaceIdiom

class Alert {
	
	/**
	Shows an alert with one button. There is no completion hander. It simply vanishes when the user taps the button.

	- Parameter title: Title at top of alert
	- Parameter msg: Explanatory alert text
	- Parameter btn: Text for the button
	*/
	static func withOneButton(title: String, msg: String, btn: String) {
		let theAlert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
		let defaultAction = UIAlertAction(title: btn, style: .default, handler: nil)
		theAlert.addAction(defaultAction)
		DispatchQueue.main.async {
			Alert.getTopController().present(theAlert, animated: true, completion: nil)
		}
	}
	
	
	/**
	Shows an alert with one button. After a tap, it runs the completion handler.

	- Parameter title: Title at top of alert
	- Parameter msg: Explanatory alert text
	- Parameter btn: Text for the button
	- Parameter handler: closure that will run when the button is tapped
	*/
	static func withOneButtonAndCompletion(title: String, msg: String, btn: String, handler: @escaping () -> ()) {
		let theAlert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
		let defaultAction = UIAlertAction(title: btn, style: .default) { (action) -> Void in
			handler()
		}
		theAlert.addAction(defaultAction)
		DispatchQueue.main.async {
			Alert.getTopController().present(theAlert, animated: true, completion: nil)
		}
	}
	
	
	/**
	Shows an alert with two buttons, one using the .cancel style. After a tap, it runs the completion handler using a boolean to indicate if the user pressed the "go" or "cancel" button.

	- Parameter title: Title at top of alert
	- Parameter msg: Explanatory alert text
	- Parameter cancel: Text for "Cancel" button
	- Parameter go: Text for "OK" or "Proceed" button
	- Parameter handler: closure with a Bool indicating which button was tapped (go == true)
	*/
	static func withTwoButtonsAndCompletion(title: String, msg: String, cancel: String, go: String, handler: @escaping (_ result: Bool) -> ()) {
		let theAlert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
		let cancelAction = UIAlertAction(title: cancel, style: .cancel) { (action) -> Void in
			handler(false)
		}
		theAlert.addAction(cancelAction)
		let okAction = UIAlertAction(title: go, style: .default) { (action) -> Void in
			handler(true)
		}
		theAlert.addAction(okAction)
		DispatchQueue.main.async {
			Alert.getTopController().present(theAlert, animated: true, completion: nil)
		}
	}

	
	/**
	Shows a popup alert with a number of buttons, runs the completion handler once the user makes a choice and returns the index of the tapped button (cancel = 0.)

	- Parameter source: The view from which the popover emanates if presented on an iPad
	- Parameter title: Large title at top of alert
	- Parameter msg: Small subtitle. Can be nil
	- Parameter cancel: Text for "Cancel" button
	- Parameter buttons: Array of Strings with button titles
	- Parameter handler: closure with an Int indicating which button was tapped (cancel = 0)
	*/
	static func asAPopupWithCompletion(source: UIView, title: String?, msg: String?, cancel: String, buttons: [String], handler: @escaping (_ result: Int) -> ()) {
		let theAlert = UIAlertController(title: title, message: msg, preferredStyle: .actionSheet)
		if Device == .pad {
			theAlert.modalPresentationStyle = .popover
			theAlert.popoverPresentationController?.sourceView = source
			theAlert.popoverPresentationController?.sourceRect = source.bounds
		}
		let cancelAction = UIAlertAction(title: cancel, style: .cancel) { (action) -> Void in
			handler(0)
		}
		theAlert.addAction(cancelAction)

		for (idx, title) in buttons.enumerated() {
			let action = UIAlertAction(title: title, style: .default) { (action) -> Void in
				handler(idx + 1)
			}
			theAlert.addAction(action)
		}

		DispatchQueue.main.async {
			Alert.getTopController().present(theAlert, animated: true, completion: nil)
		}
	}
	
	
	static func getTopController() -> UIViewController {
		if let vc = UIApplication.shared.keyWindow?.rootViewController {
			return vc
		} else {
			return UIApplication.shared.windows.last!.rootViewController!
			//Beyond this, there's no way to win.
		}
	}
	
	
}
