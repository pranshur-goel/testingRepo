//
//  ViewController.swift
//  Task4
//
//  Created by PRANSHUR GOEL on 13/07/22.
//

import UIKit

class ShowcaseVC: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tabIndicator: UIView!
    @IBOutlet var aryBtn: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnTappedAppointmentTabs(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            
            self.tabIndicator.transform = CGAffineTransform(translationX:self.view.bounds.width*0.5*CGFloat(sender.tag-1), y: 0)
            
            self.aryBtn.forEach({$0.tintColor = (sender == $0) ? .appColor(.black) : .appColor(.grey)})
            
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.bounds.width*CGFloat(sender.tag-1), y: 0), animated: true)
        }
    }

}

