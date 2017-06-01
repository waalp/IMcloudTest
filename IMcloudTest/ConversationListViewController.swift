//
//  ConversationListViewController.swift
//  IMcloudTest
//
//  Created by Anson on 2017/5/25.
//  Copyright © 2017年 Anson. All rights reserved.
//

import UIKit

class ConversationListViewController: RCConversationListViewController {

    @IBAction func ShowMenu(_ sender: UIBarButtonItem) {
//        var frame = (sender.value(forKey: "view") as AnyObject).frame
//        
//        frame?.origin.y = (frame?.origin.y)! + 30
//        KxMenu.show(in: self.view, from: frame!, menuItems: [
//            KxMenuItem("客服",image:nil,target:self,action:#selector(ConversationListViewController.ClickMenu1)),
//            KxMenuItem("会话",image:nil,target:self,action:#selector(ConversationListViewController.ClickMenu1)),
//            KxMenuItem("设置",image:nil,target:self,action:#selector(ConversationListViewController.ClickMenu1))
//        ])
        let Items = [
            MenuItem(title: "客服", iconName: nil, glow: UIColor.black, index: 0),
            MenuItem(title: "会话", iconName: nil, glow: UIColor.blue, index: 1)
        ]
        
        let menu = PopMenu(frame: self.view.bounds, items: Items)
        menu?.menuAnimationType = .sina
        
        if (menu?.isShowed)! {
            return
        }
        
        menu?.didSelectedItemCompletion = {(selectedItem:MenuItem!)->Void in
            switch selectedItem.index {
            case 0:
                let conVC = RCConversationViewController()
                conVC.targetId = "Anson"
                conVC.userName = "安"
                conVC.conversationType = RCConversationType.ConversationType_PRIVATE
                conVC.title = "安"
                self.navigationController?.pushViewController(conVC, animated: true)
                self.tabBarController?.tabBar.isHidden = true
            case 1:
                let conVC = RCConversationViewController()
                conVC.targetId = "Anson1"
                conVC.userName = "A"
                conVC.conversationType = RCConversationType.ConversationType_PRIVATE
                conVC.title = "A"
                self.navigationController?.pushViewController(conVC, animated: true)
                self.tabBarController?.tabBar.isHidden = true
                //NSLog("%@", selectedItem.title)
            default:
                NSLog("%@", selectedItem.title)
            }
            }
        menu?.show(at: self.view)
    }
    
    func ClickMenu1() {
        let conVC = RCConversationViewController()
        conVC.targetId = "Anson"
        conVC.userName = "安"
        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
        conVC.title = "安"
        self.navigationController?.pushViewController(conVC, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        NSLog("你点击了加号")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //NSLog("准备链接")
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.connectServer(completion: {()->Void in
        self.setDisplayConversationTypes([
            RCConversationType.ConversationType_PRIVATE.rawValue,
            RCConversationType.ConversationType_DISCUSSION.rawValue,
            RCConversationType.ConversationType_GROUP.rawValue,
            RCConversationType.ConversationType_CHATROOM.rawValue,
            RCConversationType.ConversationType_CUSTOMERSERVICE.rawValue,
            RCConversationType.ConversationType_SYSTEM.rawValue,
            RCConversationType.ConversationType_APPSERVICE.rawValue,
            RCConversationType.ConversationType_PUBLICSERVICE.rawValue,
            RCConversationType.ConversationType_PUSHSERVICE.rawValue
            ])
            self.refreshConversationTableViewIfNeeded()
        } )
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        //NSLog("准备显示")
    }

    override func onSelectedTableRow(_ conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, at indexPath: IndexPath!) {
        let conVC = RCConversationViewController()
        conVC.targetId = model.targetId
        conVC.userName = model.conversationTitle
        conVC.conversationType = RCConversationType.ConversationType_PRIVATE
        conVC.title = model.conversationTitle
        self.navigationController?.pushViewController(conVC, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //self.tabBarController?.tabBar.isHidden = true
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
