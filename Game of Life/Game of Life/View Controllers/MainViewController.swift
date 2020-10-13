//
//  MainViewController.swift
//  Game of Life
//
//  Created by Matthew Martindale on 10/12/20.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupViews()
    }
    
    private func setupViews() {
        clearButton.layer.cornerRadius = clearButton.frame.size.height / 5
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        let name = Notification.Name(rawValue: clearGridKey)
        NotificationCenter.default.post(name: name, object: nil)
    }
    

}
