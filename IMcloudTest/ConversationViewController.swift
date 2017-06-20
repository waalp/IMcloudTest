//
//  ConversationViewController.swift
//  IMcloudTest
//
//  Created by Anson on 2017/5/23.
//  Copyright © 2017年 Anson. All rights reserved.
//

import UIKit

class ConversationViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.targetId = "Anson"
        self.userName = "A"
        self.conversationType = .ConversationType_PRIVATE
        self.title = "正在与"+self.targetId+"聊天"
        self.tabBarController?.tabBar.isHidden = true
        NSLog("你叫什么名字%@", self.targetId)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //self.tabBarController?.tabBar.isHidden = true
        NSLog("刷新前准备")
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
