//
//  MainViewPresenter.swift
//  MVPExampleApp
//
//  Created by Dacio Leal Rodriguez on 24/12/2019.
//  Copyright © 2019 Dacio Leal Rodriguez. All rights reserved.
//

import Foundation

protocol MainViewPresenterDelegate: NSObjectProtocol {
    
    func didUpdateListOfCollegeFootballConferences()
}


class MainViewPresenter {
    
    weak var mainViewPresenterDelegate: MainViewPresenterDelegate?
    
    private var conferences = [Conference]()
    
    func setPresenterDelegate(mainViewPresenterDelegate: MainViewPresenterDelegate?) {
        self.mainViewPresenterDelegate = mainViewPresenterDelegate
    }
    
    func getCollegeFootballConferences() {
        DataManager.getCollegeFootballConferences { (results) in
            if let results = results {
                self.conferences.removeAll()
                self.conferences.append(contentsOf: results)
                DispatchQueue.main.async {
                    self.mainViewPresenterDelegate?.didUpdateListOfCollegeFootballConferences()
                }
            }
        }
    }
    
    func getNumberOfCollegeFootballConferences() -> Int {
        return conferences.count
    }
    
    func getNameForCollegeFootballConferenceAt(index: Int) -> String? {
        if conferences.indices.contains(index) {
            let conference = conferences[index]
            return conference.name
        }
        return nil
    }
    
    func getAbbreviationForCollegeFootballConferenceAt(index: Int) -> String? {
        if conferences.indices.contains(index) {
            let conference = conferences[index]
            return conference.abbreviation
        }
        return nil
    }
}
