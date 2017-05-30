//
//  ViewController.swift
//  klAlert-Demo
//
//  Created by Ken Laws on 5/29/17.
//  Copyright © 2017 dela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var oneBtnComp: UIButton!
	@IBOutlet weak var twoBtnsComp: UIButton!
	@IBOutlet weak var popupComp: UIButton!


	@IBAction func oneBtnNoComp() {
		Alert.withOneButton(title: "Hello", msg: "I am an alert.", btn: "I Know")
	}


	@IBAction func oneBtnWithComp() {
		Alert.withOneButtonAndCompletion(title: "Please",
		                                 msg: "Push the button.",
		                                 btn: "OK") { 
			UIView.animate(withDuration: 1.0,
			               delay: 0.2,
			               usingSpringWithDamping: 0.2,
			               initialSpringVelocity: 0.2,
			               options: UIViewAnimationOptions.autoreverse,
			               animations: {
							self.oneBtnComp.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
			}, completion:  { (done) -> Void in
				if done {
					self.oneBtnComp.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
				}
			})
		}
	}


	@IBAction func twoBtnsWithComp() {
		Alert.withTwoButtonsAndCompletion(title: "Choices",
		                                  msg: "Cancel is red, OK is green.",
		                                  cancel: "Cancel",
		                                  go: "OK") { (ok) in
											let color = ok ? UIColor.green : UIColor.red
											UIView.animate(withDuration: 1.4,
											               delay: 0.0,
											               options: UIViewAnimationOptions.autoreverse,
											               animations: {
															self.twoBtnsComp.backgroundColor = color
											}, completion:  { (done) -> Void in
												if done {
													self.twoBtnsComp.backgroundColor = UIColor.white
												}
											})
		}
	}

	
	@IBAction func popupWithComp() {
		Alert.asAPopupWithCompletion(source: popupComp,
		                             title: "Main Title",
		                             msg: "optional sub-title",
		                             cancel: "Cancel",
		                             buttons: ["Red", "Green", "Blue"]) { (idx) in
										guard idx > 0 else { return }
										var color = UIColor.black
										switch idx {
										case 1:
											color = UIColor.red
										case 2:
											color = UIColor.green
										case 3:
											color = UIColor.blue
										default:
											break
										}

										UIView.animate(withDuration: 1.4,
										               delay: 0.0,
										               options: UIViewAnimationOptions.autoreverse,
										               animations: {
														self.popupComp.backgroundColor = color
										}, completion:  { (done) -> Void in
											if done {
												self.popupComp.backgroundColor = UIColor.white
											}
										})
		}
	}

}

