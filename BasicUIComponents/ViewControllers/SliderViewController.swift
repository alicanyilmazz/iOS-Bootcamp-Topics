//
//  SliderViewController.swift
//  BasicUIComponents
//
//  Created by alican on 20.09.2021.
//

import UIKit

class SliderViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    private var counter : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
        // Do any additional setup after loading the view.
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipedByUser(_:)))
        leftSwipeGesture.direction = .left
        self.view.addGestureRecognizer(leftSwipeGesture)
        
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipedByUser(_:)))
       rightSwipeGesture.direction = .right
        self.view.addGestureRecognizer(rightSwipeGesture)
    }
    

    @objc func leftSwipedByUser(_ gesture : UISwipeGestureRecognizer){
        if counter < _images.count-1 {
            counter += 1
            setNew(new: _images[counter])
        } else {
            counter = 0
            setNew(new: _images[counter])
        }
    }
    
    @objc func rightSwipedByUser(_ gesture : UISwipeGestureRecognizer){
        if counter == 0 {
            counter = _images.count-1
            setNew(new: _images[counter])
        } else {
            counter -= 1
            setNew(new: _images[counter])
        }
    }
    
    
    func setNew(new : Images){
        
        imageView.image = new.imageView
        pageControl.currentPage = counter
    }
    
    func setupView(){
        setNew(new: _images[0])
        pageControl.numberOfPages = _images.count
    }

}
