//
//  ViewController.swift
//  WidgetDemo
//
//  Created by kbedi on 10/07/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showMoreScreen(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let moreVC = sb.instantiateViewController(identifier: "More")
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(moreVC, animated: true)
    }
    
}

