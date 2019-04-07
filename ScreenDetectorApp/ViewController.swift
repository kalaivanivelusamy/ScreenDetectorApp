//
//  ViewController.swift
//  ScreenDetectorApp
//
//  Created by Kalaivani, Velusamy on 07/04/19.
//  Copyright © 2019 Kalaivani, Velusamy . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector:#selector(screenChangedEvent), name:Notification.Name.UIApplicationUserDidTakeScreenshot, object: nil)
        
        checkCurrentRecordingStatus()
       // startTimer()
  
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIApplicationUserDidTakeScreenshot, object: nil)

    }
    
    @objc func screenChangedEvent(){
        if UIScreen.main.isCaptured == true{
            print("captured")
            //blank the view..

            let testFrame : CGRect = CGRect(x: 0, y: 200, width: 320, height: 200)
            let testView : UIView = UIView(frame: testFrame)
            testView.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
            testView.alpha=0.5
            self.view.addSubview(testView)
        }
        else{
        print("Screen")
        }
    }
    
    @objc func checkCurrentRecordingStatus() {
        NotificationCenter.default.post(name:Notification.Name.UIApplicationUserDidTakeScreenshot, object: nil)
    }

func startTimer()
{
   timer = Timer.scheduledTimer(timeInterval:1.0, target: self, selector: #selector(checkCurrentRecordingStatus), userInfo: nil, repeats: true)
   
}

func stopTimer()
{
    timer.invalidate()
}
}


