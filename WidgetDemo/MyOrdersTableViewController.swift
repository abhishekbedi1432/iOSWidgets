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

    
    class func updateWidget(_ tag: Int) {

        var widgetModel: OrderTrackingWidgetModel = OrderTrackingWidgetModel(number: "000", date: "NA", total: "400", status: "NA", color: "FFFF00", imageName: "")
        switch tag {
        case 0:
            widgetModel = OrderTrackingWidgetModel(number: "123", date: "Tomorrow", total: "400", status: "In-Progress", color: "FF4500", imageName: "shipment_dispatched_active")
        case 1:
            widgetModel = OrderTrackingWidgetModel(number: "456", date: "Yesterday", total: "400", status: "Delivered", color: "228B22", imageName: "shipment_delivered_success")
        case 2:
            widgetModel = OrderTrackingWidgetModel(number: "789", date: "Yesterday", total: "400", status: "Cancelled", color: "DC143C", imageName: "shipment_cancelled")
        default: break
        }
        
        let userDefaults = UserDefaults(suiteName: "group.bedi.WidgetDemo")
        guard let widgetData = try? JSONEncoder().encode(widgetModel) else { return }
        userDefaults?.setValue(widgetData, forKey: "orderStatus")
        userDefaults?.synchronize()
        
//        WidgetCenter.shared.reloadTimelines(ofKind: "group.bedi.WidgetDemo")
        WidgetCenter.shared.reloadAllTimelines()

    }
    
    @IBAction func trackOrderClicked(_ sender: Any) {
        
        guard let button = sender as? UIButton else {
            return
        }
        
        MyOrdersTableViewController.updateWidget(button.tag)
        
        showAlert()
    }
    
    private func showAlert() {
        
        let alert = UIAlertController(title: "Cool! 😎", message: "The Tracking Widget is now added to your Home Screen.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Got It!", style: .default) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}
