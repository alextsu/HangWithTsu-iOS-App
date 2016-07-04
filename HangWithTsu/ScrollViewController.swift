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
    
    
    let numberOfPages = 3
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    func setupView () {
        
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width * CGFloat(numberOfPages), self.scrollView.frame.size.height)
        self.scrollView.pagingEnabled = true
        self.scrollView.delegate = self
        self.scrollView.bounces = false
        
        for index in 0...(numberOfPages-1) {
            let infoViewController : InfoViewController = self.storyboard?.instantiateViewControllerWithIdentifier("InfoViewController") as! InfoViewController
            infoViewController.view.tag = index
            
            self.addChildViewController(infoViewController)
            infoViewController.view.frame = CGRectMake(CGFloat(index) * self.view.frame.width, -1 * self.navigationController!.navigationBar.frame.height, self.view.frame.width, self.scrollView.frame.height + self.navigationController!.navigationBar.frame.height)
            self.scrollView.addSubview(infoViewController.view)
            
        }
        

        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        scrollView.contentOffset.y = 0.0
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
