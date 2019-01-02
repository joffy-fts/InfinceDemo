//
//  ViewController.swift
//  TestWithJenkins
//
//  Created by FTS-MAC-33 on 02/01/19.
//  Copyright © 2019 FTS-MAC-33. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bgImage : UIImageView!
    @IBOutlet weak var logoImage : UIImageView!
    @IBOutlet weak var nextButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func NextAction(_ sender: Any) {
        
        let storyboard = UIStoryboard( name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "homevc") as! HomeViewController
        self.present(viewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

