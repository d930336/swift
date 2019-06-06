
import UIKit
import SwiftCharts

class CenterCenter: UIViewController {
    
    var chartView : BarsChart!
    
    @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.background.layer.shadowOpacity = 1
        self.background.layer.shadowColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        self.background.layer.shadowOffset = CGSize(width: 5 ,height: 5)
        self.background.layer.shadowRadius = 5
        
        
        let chartConfig = BarsChartConfig(
            valsAxisConfig : ChartAxisConfig(from:0 , to:100 ,by:10)
        )
        
        let frame = CGRect(x : 50 , y : 50 ,width:self.view.frame.width/1.5,height:80)
        
        let  chart = BarsChart(
            frame : frame,
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
        
        
        self.view.addSubview(chart.view)
        self.chartView = chart
        
    }
    
    
    
    
}
