//
//  ViewController.swift
//  Alert
//
//  Created by Harry Ng on 15/12/2015.
//  Copyright © 2015 STAY REAL. All rights reserved.
//

import UIKit
import AVFoundation
import PermissionScope

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(sender: UIButton) {
//        let alert = UIAlertController(title: "\u{201c}Moments \u{03b4}\u{201d} Would Like to Access the Camera", message: "Show Message", preferredStyle: .Alert)
//        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
//        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//        
//        presentViewController(alert, animated: true, completion: nil)
        let pscope = PermissionScope()
        pscope.viewControllerForAlerts = self
        pscope.addPermission(CameraPermission(), message: "We want to use Camera")
        pscope.onAuthChange = { (finished, results) in
            print(results)
        }
        pscope.requestCamera()
    }

}

