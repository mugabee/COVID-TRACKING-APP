//
//  ViewController.swift
//  Covid Tracker
//
//  Created by MUGABE RICHARD on 04/07/2021.
//

import UIKit
/// Data of covid cases
class ViewController: UIViewController {
    /*
     - Call APIs
     - ViewModel
     - View: Table
     - Filter / user Pick the state
     - Update UI
     */
    private var scope: APICaller.DataScope = .national
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Covid Cases"
        createFilterButton()
    
    }
    private func createFilterButton() {
        let buttonTitle: String = {
            switch scope {
            case .national: return "National"
                
            case .state(let state): return state.name
            
            }
        }()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: buttonTitle,
            style: .done,
            target: self,
            action: #selector(didTapFilter)
        
        
        )
    }
    @objc private func didTapFilter() {
        let vc = FilterViewController()
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }

}

