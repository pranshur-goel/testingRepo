//
//  FetchData.swift
//  Task4
//
//  Created by PRANSHUR GOEL on 18/07/22.
//

import Foundation

enum UserError:Error {
    case NoDataAvailable
    case CanNotProcessData
    case invalidUrl
}

class FetchData {

    static let sharedInstance = FetchData()
    
    func getUsers(fileName: String,completion:@escaping(Result<CompanyInfo,UserError>)->Void){
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else
        {
            completion(.failure(.invalidUrl))
            return
        }
        let url = URL(fileURLWithPath: path)
                do{
                    let decoder = JSONDecoder()
                    let data = try Data(contentsOf: url)
                    let userResponse = try decoder.decode(CompanyInfo.self, from: data)
                    completion(.success(userResponse))
                }
                catch{
                    completion(.failure(.CanNotProcessData))
                }
            }
          
        
    }




