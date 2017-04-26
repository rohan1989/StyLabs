//
//  ViewController.swift
//  StyLabs
//
//  Created by Rohan Sonawane on 26/04/17.
//  Copyright © 2017 Rohan Sonawane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let width = UIScreen.main.bounds.width
    fileprivate let height = UIScreen.main.bounds.height
    
    //stores description label texts
    fileprivate let descriptionTextArray:Array<String> = ["Your shopping companion", "A wide range of products curated\nby professional stylists only for you.", "We’ll personalize your feed based on your wishlist.", "300+ Brands and 50+ websites to shop from."]
    
    //stores heading label texts
    fileprivate let headingTextArray:Array<String> = ["Curated", "Personalised", "All in one platform"]
    
   
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageWidth = width*2
        containerView.frame = CGRect(x: 0, y: 0, width: imageWidth, height: imageWidth)
        imageView.frame = CGRect(x: 0, y: 0, width: imageWidth, height: imageWidth)
        containerView.center = CGPoint(x: width, y: height)
        
        initializeScrollView()
    }
    
    
    //adds all the labels to scroll view
    func initializeScrollView() {
        
        
        var xCoordinate : CGFloat = 0.0
        let yCoordinate : CGFloat = 0.0

        scrollView.contentSize = CGSize(width: (width * CGFloat(4)), height: height)
        
        for counter in 0...3 {
            xCoordinate = (width * CGFloat(counter))
            
            let view = UIView()
            view.backgroundColor = UIColor.clear
            view.frame = CGRect(x: xCoordinate, y: yCoordinate+100, width: width, height: 100)
            
            
            let descriptionLabel = getDescriptionLabel(view: view)

            switch counter {
            case 0:
                //add logo
                let logoImageView = UIImageView(image: UIImage(named: "Styfi Logo"))
                logoImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 25)
                logoImageView.contentMode = UIViewContentMode.scaleAspectFit
                logoImageView.center = CGPoint(x: view.center.x, y: logoImageView.center.x)
                view.addSubview(logoImageView)
                
                
                descriptionLabel.text = descriptionTextArray.first
                descriptionLabel.frame = CGRect(x: 0, y: view.frame.size.height - 30, width: width, height: 30)
                
                break
                
            case 1...3:
                let headingLabel = getHeadingLabel(index: counter-1)
                view.addSubview(headingLabel)
                
                descriptionLabel.text = descriptionTextArray[counter]
                
                break
                
            default: break
                
            }
            
            
            view.addSubview(descriptionLabel)
            scrollView.addSubview(view)
        }
    }
    
    
    //provides description label to scrolll view
    func getDescriptionLabel(view:UIView) -> UILabel {
        
        let label:UILabel = UILabel()
        label.frame = CGRect(x: 0, y: view.frame.size.height - 50, width: width, height: 50)
        label.numberOfLines = 2
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.textColor = UIColor.gray
        label.font = UIFont(name: "AvenirNext-Regular", size: 16)
        return label
    }
    
    
    //provides heading label to scroll view
    func getHeadingLabel(index:Int) -> UILabel {
        
        let label:UILabel = UILabel()
        label.text = headingTextArray[index]
        label.frame = CGRect(x: 0, y: 10, width: width, height: 30)
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        label.textColor = UIColor.black
        label.font = UIFont(name: "AvenirNext-Medium", size: 25)
        return label
    }
}


extension ViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //image rotation logic
        self.containerView.transform = CGAffineTransform(rotationAngle: ((scrollView.contentOffset.x/self.width)*CGFloat(M_PI/2)))
    }
    
}

