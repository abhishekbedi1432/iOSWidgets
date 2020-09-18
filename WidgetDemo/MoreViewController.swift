//
//  MoreViewController.swift
//  WidgetDemo
//
//  Created by kbedi on 10/07/2020.
//

import UIKit

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
//        navigationController?.hidesBarsOnTap = true
    }

    @IBAction func buttonAction(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        var moreVC: UIViewController!
        if #available(iOS 13.0, *) {
            moreVC = sb.instantiateViewController(identifier: "More")
        } else {
            // Fallback on earlier versions
            moreVC = sb.instantiateViewController(withIdentifier: "More")
        }
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(moreVC, animated: true)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
