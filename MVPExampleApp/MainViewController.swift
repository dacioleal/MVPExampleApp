//
//  MainViewController.swift
//  MVPExampleApp
//
//  Created by Dacio Leal Rodriguez on 22/12/2019.
//  Copyright © 2019 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, MainViewPresenterDelegate {
    
    
    
    var mainView: MainView!
    
    private let presenter = MainViewPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "MVP App"
        self.presenter.setPresenterDelegate(mainViewPresenterDelegate: self)
        
        createMainView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.getCollegeFootballConferences()
    }

    //MARK: - Interface creation
    func createMainView() {
        mainView = MainView(frame: CGRect.zero)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mainView)
        
        let constraints = [mainView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                           mainView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                           mainView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
                           mainView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)]
        
        self.view.addConstraints(constraints)
    }
    
    
    //MARK: - MainViewPresenterDelegate
    func displayListOf(conferences: [Conference]) {
        //TODO: Update the tableview with the elements
        print("Conferences: \(conferences)")
    }
}
