//
//  ContentView.swift
//  DDChartsDemo4
//
//  Created by joe on 1/7/25.
//

import SwiftUI
import Charts

enum ChartType {
    case bar, line, area
}

struct ContentView: View {
    @Binding var chartItem: ChartItem
    
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading
    
    var body: some View {
        // the chart
        if chartItem.isVerticalChart {
            switch chartItem.chartType {
            case .bar:
                BarChartVerticalView(chartItem: $chartItem)
            case .line, .area:
                LineAreaChartVerticalView(chartItem: $chartItem)
            }
        } else { // horizontal
            switch chartItem.chartType {
            case .bar:
                BarChartHorizontalView(chartItem: $chartItem)
            case .line, .area:
                LineAreaChartHorizontalView(chartItem: $chartItem)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(chartItem: .constant(.defaultChartItem))
        .previewInterfaceOrientation(.landscapeRight)
    }
}

//#Preview {
//    ContentView(
//        dailySales: defaultDailySales,
//        min: 0.0,
//        max: 700.0
//    )
//    .previewInterfaceOrientation(.landscapeRight)
//}
