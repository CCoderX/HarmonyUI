//
//  SearchView.swift
//  HarmonyUI
//
//  Created by user on 8/26/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit

class SearchView: UIView {
    var imagesState = [false,false,false,false,false,false]
    
    @IBOutlet var activitesImageViews: [UIImageView]!
    
    //    override init(frame: CGRect) {
    //        super.init(frame: frame)
    //        configure()
    //    }
    //
    //    required init?(coder aDecoder: NSCoder) {
    //        super.init(coder: aDecoder)
    //        configure()
    //    }
    //
    //    override func draw(_ rect: CGRect) {
    //        super.draw(rect)
    //        configure()
    //    }
    @IBAction func savePressed(_ sender: Any) {
        self.removeFromSuperview()

    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.removeFromSuperview()
    }
    func configure(){
        
        print(activitesImageViews.count)
        for image in activitesImageViews {
            print(image.tag)
            let imagesTabGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imagePressed(gest:)))
            image.addGestureRecognizer(imagesTabGestureRecognizer)
        }
        //        Bundle.main.loadNibNamed("SearchView", owner: self, options: nil)
        //        addSubview(contentView)
        //
        //        contentView.frame = self.bounds
        //        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //        Bundle.main.loadNibNamed("SearchView", owner: self, options: nil)
        //        self.addSubview(self.contentView);
    }
    @objc func imagePressed(gest: UITapGestureRecognizer) {
        let imageIndex = (gest.view as! UIImageView).tag
        imagesState[imageIndex] = !imagesState[imageIndex]
        setImages()
        print(imageIndex)
    }
    func setImages() {
        for counter in 0...5 {
            if !imagesState[counter]{ activitesImageViews[counter].backgroundColor = .clear
            }
            else {        activitesImageViews[counter].backgroundColor = .gray
            }
        }
    }
    
}
//extension UIView {
//
//    @discardableResult   // 1
//    func fromNib<T : UIView>() -> T? {   // 2
//        guard let contentView = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {    // 3
//            // xib not loaded, or its top view is of the wrong type
//            return nil
//        }
//        self.addSubview(contentView)     // 4
//        contentView.translatesAutoresizingMaskIntoConstraints = false   // 5
//        contentView.layoutAttachAll(to: self)   // 6
//        return contentView   // 7
//    }
//}
