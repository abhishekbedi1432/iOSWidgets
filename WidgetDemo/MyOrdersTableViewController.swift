//
//  MyOrdersTableViewController.swift
//  WidgetDemo
//
//  Created by kbedi on 10/07/2020.
//

import UIKit
import WidgetKit

extension UIButton {
    func blink() {
        
        self.alpha = 1
        UIView.animate(withDuration: 0.7, delay: 0.0, options: [.autoreverse, .curveEaseInOut], animations: {
            self.alpha = 0
        }, completion: {_ in
            self.alpha = 1
        })
    }
}


class MyOrdersTableViewController: UITableViewController {

    @IBOutlet weak var trackOrderWidgetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        title = "My Orders"
        trackOrderWidgetButton.blink()
    }

    @IBAction func trackOrderClicked(_ sender: Any) {
                
        guard let button = sender as? UIButton else {
            return
        }
        var status = "#No Status"
        switch button.tag {
        case 0: status = "In-Progress"
        case 1: status = "Delivered"
        case 2: status = "Cancelled"
        default: break
        }
        
        let userDefaults = UserDefaults(suiteName: "group.bedi.WidgetDemo")
        userDefaults?.setValue(status, forKey: "orderStatus")
        userDefaults?.synchronize()
        
//        WidgetCenter.shared.reloadTimelines(ofKind: "group.bedi.WidgetDemo")
        WidgetCenter.shared.reloadAllTimelines()
        let alert = UIAlertController(title: "Cool! 😎", message: "The Tracking Widget is now added to your Home Screen.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Got It!", style: .default) { _ in
            
            

            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}
