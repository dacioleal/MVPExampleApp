//
//  MainViewPresenter.swift
//  MVPExampleApp
//
//  Created by Dacio Leal Rodriguez on 24/12/2019.
//  Copyright © 2019 Dacio Leal Rodriguez. All rights reserved.
//

import Foundation

protocol MainViewPresenterDelegate: NSObjectProtocol {
    
    func displayListOf(conferences: [Conference])
}


class MainViewPresenter {
    
    weak var mainViewPresenterDelegate: MainViewPresenterDelegate?
    
    func setPresenterDelegate(mainViewPresenterDelegate: MainViewPresenterDelegate?) {
        self.mainViewPresenterDelegate = mainViewPresenterDelegate
    }
    
    func getCollegeFootballConferences() {
        DataManager.getCollegeFootballConferences { (results) in
            if let results = results {
                DispatchQueue.main.async {
                    self.mainViewPresenterDelegate?.displayListOf(conferences: results)
                }
            }
        }
    }
}
