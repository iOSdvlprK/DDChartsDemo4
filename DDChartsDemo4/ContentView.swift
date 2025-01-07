//
//  ContentView.swift
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
    
    var body: some View {
        VStack {
            Text("Chart Demo 4")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
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
            
            // chart buttons
            HStack {
                ColorfulButtonView(
                    colors: $barColors,
                    dim: 30,
                    offset: 10,
                    action: {}
                )
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        chartType = .bar
                    }
                }, label: {
                    Text("BAR")
                })
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        chartType = .line
                    }
                }, label: {
                    Text("LINE")
                })
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        chartType = .area
                    }
                }, label: {
                    Text("AREA")
                })
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        isVerticalChart.toggle()
                    }
                }, label: {
                    Image(systemName: "chart.bar.fill")
                        .rotationEffect(.degrees(isVerticalChart ? 90 : 0))
                })
            }
            .padding()
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
