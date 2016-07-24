//
//  ScrollViewController.swift
//  HangWithTsu
//
//  Created by Alexander Tsu on 7/3/16.
//  Copyright © 2016 Alexander Tsu. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    let numberOfPages = 6
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        setupView()
    }
    
    func setupView () {
        
        self.pageControl.numberOfPages = numberOfPages
        self.pageControl.currentPage = 0
        
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.width * CGFloat(numberOfPages), self.scrollView.frame.size.height)
        self.scrollView.pagingEnabled = true
        self.scrollView.delegate = self
        self.scrollView.bounces = false
        
        
        for index in 0...(numberOfPages-1) {
            let infoViewController : InfoViewController = self.storyboard?.instantiateViewControllerWithIdentifier("InfoViewController") as! InfoViewController
            infoViewController.view.tag = index
            
            self.addChildViewController(infoViewController)
            
            //infoViewController.view.frame = CGRectMake((CGFloat(index) * (self.scrollView.frame.width)), -1 * self.navigationController!.navigationBar.frame.height, self.scrollView.frame.width, self.scrollView.frame.height + self.navigationController!.navigationBar.frame.height)
            
            infoViewController.view.frame = CGRectMake((CGFloat(index) * (self.scrollView.frame.width)), 0, self.scrollView.frame.width, self.scrollView.frame.height)
            
            self.scrollView.addSubview(infoViewController.view)
        }
        
        print("ScrollView Width \(scrollView.frame.width) & Screen Width \(self.view.frame.width) ")
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        scrollView.contentOffset.y = 0.0
        let approxPage = self.scrollView.contentOffset.x / self.view.frame.width
        self.pageControl.currentPage = Int(approxPage)
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
