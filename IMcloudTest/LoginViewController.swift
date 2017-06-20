//
//  LoginViewController.swift
//  IMcloudTest
//
//  Created by Anson on 2017/6/3.
//  Copyright © 2017年 Anson. All rights reserved.
//

import UIKit
//extension UIView{
//    @IBInspectable var cornerRadius:CGFloat{
//        get{
//            return layer.cornerRadius
//        }
//        set{
//            layer.cornerRadius = newValue
//            layer.masksToBounds = (newValue > 0)
//        }
//    }
//}

class LoginViewController: UIViewController,JSAnimatedImagesViewDataSource {
    
    @IBOutlet weak var wallpaperImageView: JSAnimatedImagesView!

   
   

    override func viewDidLoad() {
        super.viewDidLoad()

        self.wallpaperImageView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func animatedImagesNumber(ofImages animatedImagesView: JSAnimatedImagesView!) -> UInt {
        return 3
    }
    
    func animatedImagesView(_ animatedImagesView: JSAnimatedImagesView!, imageAt index: UInt) -> UIImage! {
        return UIImage(named:"Image\(index+1)")
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
