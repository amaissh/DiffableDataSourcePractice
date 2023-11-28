//
//  ViewController.swift
//  DiffableDataSourcePractice
//
//  Created by Amais Sheikh on 27/11/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let vc = CompositionalLayoutViewController()
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
}
