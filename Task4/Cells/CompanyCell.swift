//
//  MainTwoBtns.swift
//  Task4
//
//  Created by PRANSHUR GOEL on 13/07/22.
//

import UIKit
import SDWebImage
class CompanyCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lastEditedLbl: UILabel!
    @IBOutlet weak var companyNameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tabIndicator: UIView!

    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet var arBtn: [UIButton]!
    @IBOutlet weak var noOfLikes: UILabel!
    @IBOutlet weak var noOfViews: UILabel!
    @IBOutlet weak var likeViewHt: NSLayoutConstraint!
    @IBOutlet var arImgView: [UIImageView]!
    @IBOutlet var arView: [UIView]!
    
   var likeAndView = LikeAndViews()
   var attachmentData : [AttachmentDetail] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func likeCount(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        likeAndView.likeBtnClicked(isSelected: sender.isSelected)
        noOfLikes.text = "\(likeAndView.likes) likes"
        
        }
    
    @IBAction func btnTappedAppointmentTabs(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
                self.arBtn.forEach({$0.tintColor = (sender == $0) ? UIColor.appColor(.black) : UIColor.appColor(.grey)})
                let partition = 1.0 / Double(self.attachmentData.count + 1)
            
              self.tabIndicator.transform = CGAffineTransform(translationX: self.scrollView.bounds.width * partition * CGFloat(sender.tag-(3-self.attachmentData.count)), y: 0)
              
              self.scrollView.setContentOffset(CGPoint(x: self.scrollView.bounds.width*CGFloat(sender.tag-(3-self.attachmentData.count)), y: 0), animated: true)
            
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        arBtn[2-attachmentData.count].tintColor = UIColor.appColor(.black)
        noOfLikes.text = "\(likeAndView.likes) likes"
        
        
    }
    
    
    
}

extension CompanyCell
{
    func config(companyInfo: CompanyDetails,likeView: Bool){
        
        companyNameLbl.text = companyInfo.name
        descriptionLbl.text = companyInfo.description
        attachmentData = companyInfo.attachmentDetail ?? []
        likeAndView.likes = companyInfo.totalLikes
        noOfViews.text = String(companyInfo.totalViews) + " Views"
        img.sd_setImage(with: URL(string: companyInfo.imageUrl), placeholderImage: UIImage(named: "Frame 1046"))
        if likeView == false
        {
            lastEditDate(createdAt: companyInfo.createdAt)
            likeViewHt.constant = 0
        }
        else
        {
            lastEditedLbl.text = ""
        }
        showNoOfButton()
      }

            func showNoOfButton()
    {
        arBtn.indices.forEach {
            arBtn[$0].isHidden = true
            arView[$0].isHidden = true
        }
        var count = attachmentData.count+1
        for i in (0..<count)
        {
            arBtn[2-i].isHidden = false
            arView[2-i].isHidden = false
            
            if i == 1
            {arImgView[i].sd_setImage(with: URL(string: attachmentData[i-1].attachmentUrl))}
            else if i == 2
            {
                arImgView[2-i].sd_setImage(with: URL(string: attachmentData[2-i].thumbnailUrl))
                arImgView[3-i].sd_setImage(with: URL(string: attachmentData[3-i].attachmentUrl))
            }
        }
    }
    func lastEditDate(createdAt : String)
    {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        let date: NSDate? = dateFormatterGet.date(from: createdAt) as NSDate?
        lastEditedLbl.text = "Last edited "+dateFormatterPrint.string(from: date! as Date)
        
    }

}
