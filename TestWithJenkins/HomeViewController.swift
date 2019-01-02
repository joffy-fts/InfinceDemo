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
            let colorVal = nsDictionary!["app_color"] as! String
            self.view.backgroundColor = colorWithHexString(hex: colorVal)
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
    
    
    func colorWithHexString (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: CharacterSet.whitespaces)
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
}
