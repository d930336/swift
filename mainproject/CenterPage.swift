//
//  CenterPage.swift
//  mainproject
//
//  Created by Benson Yang on 2019/4/11.
//  Copyright © 2019 Benson Yang. All rights reserved.
//

import UIKit
import SwiftCharts


class CenterPage: UIViewController {

    var chartViewLeft : BarsChart!
    var chartViewRight : BarsChart!
    @IBOutlet weak var LastMouth: UIImageView!
    
    @IBOutlet weak var ThisMouth: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.LastMouth.layer.shadowOpacity = 1
        self.LastMouth.layer.shadowColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        self.LastMouth.layer.shadowOffset = CGSize(width: 5 ,height: 5)
        self.LastMouth.layer.shadowRadius = 5
        self.LastMouth.layer.cornerRadius = 15
        
        self.ThisMouth.layer.shadowOpacity = 1
        self.ThisMouth.layer.shadowColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        self.ThisMouth.layer.shadowOffset = CGSize(width: 5 ,height: 5)
        self.ThisMouth.layer.shadowRadius = 5
        self.ThisMouth.layer.cornerRadius = 15
        
    
    
    let chartConfig = BarsChartConfig(
        valsAxisConfig : ChartAxisConfig(from:0 , to:100 ,by:10)
    )
    
    let frameLeft = CGRect(x : 30 , y : 630 ,width:138,height:31)
    let frameRight = CGRect(x : 210 , y : 630 ,width:138,height:31)
        
        
    let  chartLeft = BarsChart(
        frame : frameLeft,
        chartConfig : chartConfig,
        xTitle : "",
        yTitle : "",
        bars :[
            ("",50)
        ],
        color:UIColor.init(displayP3Red: 0.05, green: 0.18, blue: 0.23, alpha: 1),
        barWidth: 30
        
    )
    let  chartRight = BarsChart(
            frame : frameRight,
            chartConfig : chartConfig,
            xTitle : "",
            yTitle : "",
            bars :[
                ("",50)
            ],
            color:UIColor.init(displayP3Red: 0.05, green: 0.18, blue: 0.23, alpha: 1),
            barWidth: 30
            
        )
        
        
    _ = ChartGuideLinesDottedLayerSettings(linesColor: UIColor.clear, linesWidth: 0)
    // let guidelinesLayer = ChartGuideLinesDottedLayer(xAxisLayer: ChartAxisLayer, yAxisLayer: ChartAxisLayer, settings: guidelinesLayerSettings)
    
    
    self.view.addSubview(chartLeft.view)
    self.chartViewLeft = chartLeft
        
    self.view.addSubview(chartRight.view)
    self.chartViewRight = chartRight
    
}

   
}
