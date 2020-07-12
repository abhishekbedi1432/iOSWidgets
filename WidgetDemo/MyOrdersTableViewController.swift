//
//  MyOrdersTableViewController.swift
//  WidgetDemo
//
//  Created by kbedi on 10/07/2020.
//

import UIKit

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
                
        let userDefaults = UserDefaults(suiteName: "group.bedi.WidgetDemo")
        userDefaults?.setValue("In-Progress", forKey: "orderStatus")
        userDefaults?.synchronize()
        
        let alert = UIAlertController(title: "Cool! 😎", message: "The Tracking Widget is now added to your Home Screen.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Got It!", style: .default) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
