//
//  pageviewcontroller.swift
//  mainproject
//
//  Created by Benson Yang on 2019/3/14.
//  Copyright © 2019 Benson Yang. All rights reserved.
//

import UIKit

class pageviewcontroller: UIPageViewController , UIPageViewControllerDataSource{

    var list = [UIViewController]()
  /*
    override func viewDidLayoutSubviews() {
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

        
        let p0 = storyboard?.instantiateViewController(withIdentifier: "p0")
        let p1 = storyboard?.instantiateViewController(withIdentifier: "p1")
        let p2 = storyboard?.instantiateViewController(withIdentifier: "p2")
        
        list.append(p0!)
        list.append(p1!)
        list.append(p2!)
        
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

 /*
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return list.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 1
    }
    */
    
 
    
    /*
    // MARK: - Navigation

     
     
     
     
     
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
