//
//  Structure.swift
//  Task4
//
//  Created by PRANSHUR GOEL on 15/07/22.
//

import Foundation
import UIKit
struct CompanyInfo: Codable{
  var companiesList: [CompanyDetails]
}
struct CompanyDetails: Codable{
  var id: String
  var name: String
  var description: String
  var imageId: Int?
  var imageUrl: String
  var createdBy: Int
  var status: String
  var createdAt: String
  var attachmentDetail: [AttachmentDetail]?
  var isInvestor: Bool
  var isBookmarked: Bool
  var isLiked: Bool
  var isArchived: Bool
  var totalLikes: Int
  var totalViews: Int
  var targetAmount: Int
  var expiryDate: String
  var totalInvestment: Int
  var totalInvestors: Int?
  var remainingAmount: Int
  var updateProfileRequest: String?
  var totalCount: Int
}
struct AttachmentDetail: Codable{
  var attachmentId: Int
  var type: String
  var attachmentName: String
  var attachmentUrl: String
  var thumbnailUrl: String
}



struct LikeAndViews{
  var likes: Int = 100
  var views: Int = 100
    
    mutating func likeBtnClicked(isSelected: Bool) {
        likes = (isSelected) ? (likes+1) : ( likes > 0 ? likes-1 : likes )
  }
    
}
