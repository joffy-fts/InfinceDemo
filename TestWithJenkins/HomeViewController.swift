//
//  HomeViewController.swift
//  TestWithJenkins
//
//  Created by FTS-MAC-33 on 02/01/19.
//  Copyright © 2019 FTS-MAC-33. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var versionLabel : UILabel!
    
    var nsDictionary: NSDictionary?


    override func viewDidLoad() {
        super.viewDidLoad()

        if let versionInfo      = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            var versionString       = "V: \(versionInfo)"
              self.versionLabel.text  = versionString
        }
        
        if let path = Bundle.main.path(forResource: "config", ofType: "plist") {
            nsDictionary = NSDictionary(contentsOfFile: path)
            
            print("plist data == ",nsDictionary)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToHome(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
