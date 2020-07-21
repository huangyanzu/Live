//
//  RecommendViewModel.swift
//  DouYuZB
//
//  Created by azu on 2020/7/21.
//  Copyright © 2020 azu. All rights reserved.
//

import UIKit

class RecommendViewModel {
 
    private lazy var anchorGroups:[AnchorGroup] = [AnchorGroup]()
    
    
}

extension RecommendViewModel{
    func requestData(){
        
        
        let urlString = "http://capi.douyucdn.cn/api/v1/getHotCate"
        
        
        // http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1595352656
        
        let param = ["limit":"4","offset":"0","time": NSDate.getCurrentTime()]
        
       
        NetworkTools.requestData(type: .GET, URLString: urlString, parameters: param) { (result) in
            
            guard let resultDict = result as? [String : Any],
                let dataArray = resultDict["data"] as? [[String :Any]] else{
                
                return
            }
            
            for dict in dataArray{
                
                let group = AnchorGroup(dict: dict)
                self.anchorGroups.append(group)
            }
            
            for g in self.anchorGroups{
                
                for a in g.anchors{
                    print(a.nickname)
                }
                
            }
            
        }
    }
}


/*
 // 1.定义参数
 let parameters = ["limit" : "4", "offset" : "0", "time" : Date.getCurrentTime()]
 
 // 2.创建Group
 let dGroup = DispatchGroup()
 
 // 3.请求第一部分推荐数据
 dGroup.enter()
 NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time" : Date.getCurrentTime()]) { (result) in
 
 // 1.将result转成字典类型
 guard let resultDict = result as? [String : NSObject] else { return }
 
 // 2.根据data该key,获取数组
 guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
 
 // 3.遍历字典,并且转成模型对象
 // 3.1.设置组的属性
 self.bigDataGroup.tag_name = "热门"
 self.bigDataGroup.icon_name = "home_header_hot"
 
 // 3.2.获取主播数据
 for dict in dataArray {
 let anchor = AnchorModel(dict: dict)
 self.bigDataGroup.anchors.append(anchor)
 }
 
 // 3.3.离开组
 dGroup.leave()
 }
 
 // 4.请求第二部分颜值数据
 dGroup.enter()
 NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: parameters) { (result) in
 // 1.将result转成字典类型
 guard let resultDict = result as? [String : NSObject] else { return }
 
 // 2.根据data该key,获取数组
 guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
 
 // 3.遍历字典,并且转成模型对象
 // 3.1.设置组的属性
 self.prettyGroup.tag_name = "颜值"
 self.prettyGroup.icon_name = "home_header_phone"
 
 // 3.2.获取主播数据
 for dict in dataArray {
 let anchor = AnchorModel(dict: dict)
 self.prettyGroup.anchors.append(anchor)
 }
 
 // 3.3.离开组
 dGroup.leave()
 }
 
 // 5.请求2-12部分游戏数据
 dGroup.enter()
 // http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1474252024
 loadAnchorData(isGroupData: true, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: parameters) {
 dGroup.leave()
 }
 
 
 // 6.所有的数据都请求到,之后进行排序
 dGroup.notify(queue: DispatchQueue.main) {
 self.anchorGroups.insert(self.prettyGroup, at: 0)
 self.anchorGroups.insert(self.bigDataGroup, at: 0)
 
 finishCallback()
 }
 
 */
