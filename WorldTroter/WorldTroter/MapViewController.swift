//
//  MapViewController.swift
//  WorldTroter
//
//  Created by yxhuang on 2018/1/13.
//  Copyright © 2018年 yxhuang. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController{
    var mapView: MKMapView!
    
    override func loadView() {
        mapView = MKMapView()
        
        // Set it as "the" view of this view controller
        view = mapView;
        
        // 创建 UISegmenteControl
        let segmentedControl = UISegmentedControl(items:["标准", "混合", "卫星"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        // segmentControl 的点击事件
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged), for: UIControlEvents.valueChanged)
        // 设置约束锚点（Anchors）
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
//        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        // 设置边距
        let margins = view.layoutMarginsGuide;
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false; // 为了兼容老系统的布局
        view.addSubview(segmentedControl)
        
        // 激活锚8
        topConstraint.isActive = true;
        leadingConstraint.isActive = true;
        trailingConstraint.isActive = true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
    
    // 改变地图的类型
    @objc func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = MKMapType.standard
        case 1:
            mapView.mapType = MKMapType.hybrid
        case 2:
            mapView.mapType = MKMapType.satellite
        default:
            break
        }
    }
    

}
