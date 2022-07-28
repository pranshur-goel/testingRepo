//
//  ArchivedVC.swift
//  Task4
//
//  Created by PRANSHUR GOEL on 13/07/22.
//

import UIKit

class ArchivedVC: BaseArchivedDraftedClass {
    
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FetchData.sharedInstance.getUsers(fileName:"CompanyArchived" ){[weak self] result in
            guard let self = self else {return}
            switch result {
            case .failure(let error):
                print(error)
            case .success(let usersRes):
                self.setValues(tableView: self.tableView,user: usersRes.companiesList,viewAndLike: true)
            }
    
        }
        
    }
        
}
   


