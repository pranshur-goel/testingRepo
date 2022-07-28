//
//  bantu.swift
//  Task4
//
//  Created by PRANSHUR GOEL on 20/07/22.
//

import Foundation
import UIKit

class BaseArchivedDraftedClass:  UIViewController, UITableViewDataSource
{
    
    
    var users = [CompanyDetails]()
    var likeAndView : Bool?
    
    func setValues(tableView: UITableView, user: [CompanyDetails], viewAndLike:Bool)
    {
        self.users = user
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CompanyCell", bundle: nil), forCellReuseIdentifier: "CompanyCell")
        self.likeAndView = viewAndLike
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
        
  }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyCell", for: indexPath) as! CompanyCell
        cell.config(companyInfo: users[indexPath.row], likeView: likeAndView ?? true)
        return cell
    }
    
}
