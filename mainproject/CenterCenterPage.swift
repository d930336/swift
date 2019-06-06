//
//  CenterCenterPage.swift
//  mainproject
//
//  Created by Benson Yang on 2019/3/22.
//  Copyright © 2019 Benson Yang. All rights reserved.
//

import UIKit

class CenterCenterPage: UIPageViewController , UIPageViewControllerDataSource{
    
    var list = [UIViewController]()
    
    /* override func viewDidLayoutSubviews() {
     super.viewDidLayoutSubviews()
     
     for v in view.subviews{
     if v is UIScrollView{
     v.frame = v.bounds
     break
     }
     }
     }
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let m0 = storyboard?.instantiateViewController(withIdentifier: "m0")
        let m1 = storyboard?.instantiateViewController(withIdentifier: "m1")
        let m2 = storyboard?.instantiateViewController(withIdentifier: "m2")
        
        list.append(m0!)
        list.append(m1!)
        list.append(m2!)
        
        setViewControllers([list[1]], direction: .forward, animated: true, completion: nil)
        
        
        dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let index = list.index(of: viewController) , index < list.count - 1{
            return list[index + 1 ]
            
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let index = list.index(of: viewController) , index > 0{
            return list[index - 1 ]
            
        }
        return nil
    }
}
