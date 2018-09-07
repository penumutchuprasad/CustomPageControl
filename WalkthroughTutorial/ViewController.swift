//ViewController.swift
/*
 * WalkthroughTutorial
 * Created by penumutchu.prasad@gmail.com on 07/09/18
 * Is a product created by abnboys
 * For the  in the WalkthroughTutorial
 
 * Here the permission is granted to this file with free of use anywhere in the IOS Projects.
 * Copyright © 2018 ABNBoys.com All rights reserved.
*/

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func ontapped(_ sender: LKPageControl) {
        
        print("act is caaleed")
        print(sender.currentPage)
    }
    

}

