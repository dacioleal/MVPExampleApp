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
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
        self.title = "MVP Example App"
        self.presenter.setPresenterDelegate(mainViewPresenterDelegate: self)
        
        createMainView()
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "conferenceCell")
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
    func didUpdateListOfCollegeFootballConferences() {
        self.mainView.tableView.reloadData()
    }
}




extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.getNumberOfCollegeFootballConferences()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "conferenceCell")
        cell.textLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        cell.textLabel?.textColor = UIColor.darkGray
        cell.textLabel?.text = self.presenter.getNameForCollegeFootballConferenceAt(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        headerView.textLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        headerView.textLabel?.text = "COLLEGE FOOTBALL CONFERENCES"
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let conferenceAbbrev = self.presenter.getAbbreviationForCollegeFootballConferenceAt(index: indexPath.row)
        
        if let abbreviation = conferenceAbbrev {
            //Temporary implementation to test the api call to get the teams. A new detail viewcontroller and presenter is needed to be built
            DataManager.getTeamsFromConference(conferenceAbbreviation: abbreviation) { (teams) in
                if let teams = teams {
                    print("Teams: \(teams)")
                }
            }
        }
    }
}
