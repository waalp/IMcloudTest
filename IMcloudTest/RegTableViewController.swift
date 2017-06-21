//
//  RegTableViewController.swift
//  IMcloudTest
//
//  Created by Anson on 2017/6/6.
//  Copyright © 2017年 Anson. All rights reserved.
//

import UIKit

class RegTableViewController: UITableViewController {
    var (userOK,mailOK,passOK) = (false,false,false)
    @IBOutlet weak var usertext: UITextBox!
    @IBOutlet weak var mailtext: UITextBox!
    @IBOutlet weak var password: UITextBox!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "新用户注册"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: nil)
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        var isAllRight = self.navigationItem.rightBarButtonItem
        
        let user = AJWValidator(type: AJWValidatorType.string)
        user?.addValidation(toEnsureMinimumLength: 5, invalidMessage: "用户名不能少于5位")
        user?.addValidation(toEnsureMaximumLength: 15, invalidMessage: "用户名不能多于15位")
        self.usertext.ajw_attach(user)
        user?.validatorStateChangedHandler = {(newState:AJWValidatorState)->Void in
            switch newState {
            case AJWValidatorState.validationStateValid:
                self.usertext.highlightState = .Default
                self.userOK = true
            default:
                let errorMsg = user?.errorMessages.first as! String
                self.usertext.highlightState = .Wrong(errorMsg)
                self.userOK = false
            }
            
            isAllRight?.isEnabled = self.userOK && self.mailOK && self.passOK
        }
        
        let mail = AJWValidator(type: AJWValidatorType.string)
        mail?.addValidationToEnsureValidEmail(withInvalidMessage: "邮箱地址格式有误")
//        user?.addValidation(toEnsureMinimumLength: 5, invalidMessage: "用户名不能少于5位")
//        user?.addValidation(toEnsureMaximumLength: 15, invalidMessage: "用户名不能多于15位")
        self.mailtext.ajw_attach(mail)
        mail?.validatorStateChangedHandler = {(newState:AJWValidatorState)->Void in
            switch newState {
            case AJWValidatorState.validationStateValid:
                self.mailtext.highlightState = .Default
                self.mailOK = true
            default:
                let errorMsg = mail?.errorMessages.first as! String
                self.mailtext.highlightState = .Wrong(errorMsg)
                self.mailOK = false
            }
            
            isAllRight?.isEnabled = self.userOK && self.mailOK && self.passOK
        }

        let pass = AJWValidator(type: AJWValidatorType.string)
        pass?.addValidation(toEnsureMinimumLength: 5, invalidMessage: "密码不能少于5位")
        pass?.addValidation(toEnsureMaximumLength: 15, invalidMessage: "密码不能多于15位")
        self.password.ajw_attach(pass)
        pass?.validatorStateChangedHandler = {(newState:AJWValidatorState)->Void in
            switch newState {
            case AJWValidatorState.validationStateValid:
                self.password.highlightState = .Default
                self.passOK = true
            default:
                let errorMsg = pass?.errorMessages.first as! String
                self.password.highlightState = .Wrong(errorMsg)
                self.passOK = false
            }
            
            isAllRight?.isEnabled = self.userOK && self.mailOK && self.passOK
        }

        
//        self.navigationItem.rightBarButtonItem?.isEnabled = isAllRight
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
