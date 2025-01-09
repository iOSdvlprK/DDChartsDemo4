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
    let dailySales: [DailySalesType]
    let min: Double
    let max: Double
    @State var barColors: [Color] = defaultBarColors
    @State var chartType: ChartType = .bar
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading
    @State private var isVerticalChart = true
    
    @State var title = "Chart Title"
    @State var titleAlignment: HorizontalAlignment = .trailing
    
    var body: some View {
        VStack {
            HStack {
                // left chart buttons
                LeftChartButtonsView(
                    barColors: $barColors,
                    chartType: $chartType,
                    isVerticalChart: $isVerticalChart
                )
                
                VStack(alignment: titleAlignment) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    
                    // the chart
                    if isVerticalChart {
                        switch chartType {
                        case .bar:
                            BarChartVerticalView(dailySales: dailySales, barColors: barColors)
                        case .line:
                            LineChartVerticalView(dailySales: dailySales, barColors: barColors)
                        case .area:
                            AreaChartVerticalView(dailySales: dailySales, barColors: barColors)
                        }
                    } else { // horizontal
                        switch chartType {
                        case .bar:
                            BarChartHorizontalView(dailySales: dailySales, barColors: barColors)
                        case .line:
                            LineChartHorizontalView(dailySales: dailySales, barColors: barColors)
                        case .area:
                            AreaChartHorizontalView(dailySales: dailySales, barColors: barColors)
                        }
                    }
                }
                
                // right chart buttons
                RightChartButtonsView(
                    barColors: $barColors,
                    chartType: $chartType,
                    isVerticalChart: $isVerticalChart,
                    titleAlignment: $titleAlignment
                )
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            dailySales: defaultDailySales,
            min: 0.0,
            max: 700.0
        )
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
