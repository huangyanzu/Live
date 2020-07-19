//
//  HomeViewController.swift
//  DouYuZB
//
//  Created by azu on 2020/7/19.
//  Copyright © 2020 azu. All rights reserved.
//

import UIKit

private let kTitileViewH : CGFloat = 40

class HomeViewController: UIViewController {

    
    
    private lazy var pageTitleView : PageTitleView = {
       
        
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitileViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
       
        
        return titleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    

    
}


extension HomeViewController{
    private func setupUI(){
        
       setupNavigationBar()
        
        
        view.addSubview(pageTitleView)
    }
    
    private func setupNavigationBar(){
      
//        let btn = UIButton()
//
//        btn.setImage(UIImage(named: "logo"), for: [])
//        btn.sizeToFit()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
       
        let size = CGSize(width: 40, height: 40)
        
//        let historyBtn = UIButton()
//
//        historyBtn.setImage(UIImage(named: "image_my_history"), for: [])
//        historyBtn.setImage(UIImage(named: "Image_my_history_click"), for: .highlighted)
//        historyBtn.frame = CGRect(origin: CGPoint.zero, size: size)
//
//        let historyItem = UIBarButtonItem(customView: historyBtn)
        
//        let historyItem = UIBarButtonItem.createItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        
        
//        let searchBtn = UIButton()
//
//        searchBtn.setImage(UIImage(named: "btn_search"), for: [])
//        searchBtn.setImage(UIImage(named: "btn_search_clicked"), for: .highlighted)
//        searchBtn.frame = CGRect(origin: CGPoint.zero, size: size)
//
//        let searchItem = UIBarButtonItem(customView: searchBtn)
        
//        let searchItem = UIBarButtonItem.createItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        
        
//        let qrcodeBtn = UIButton()
//        
//        qrcodeBtn.setImage(UIImage(named: "Image_scan"), for: [])
//        qrcodeBtn.setImage(UIImage(named: "Image_scan_click"), for: .highlighted)
//        qrcodeBtn.frame = CGRect(origin: CGPoint.zero, size: size)
//        
//        let qrcodeItem = UIBarButtonItem(customView: qrcodeBtn)
//         let qrcodeItem = UIBarButtonItem.createItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        let qrcodeItem  = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
        
        
        
        
    }
    
    
}
