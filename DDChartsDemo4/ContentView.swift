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
    @State var chartItem: ChartItem
    
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation {
                        chartItem.editMode.toggle()
                    }
                }, label: {
                    Image(systemName: chartItem.editMode ? "checkmark" : "square.and.pencil")
                })
                
                if !chartItem.editMode {
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            // TODO: sharing
                        }
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                    })
                }
            }
            
            HStack {
                // left chart buttons
                if chartItem.editMode {
                    LeftChartButtonsView(
                        barColors: $barColors,
                        chartType: $chartType,
                        isVerticalChart: $isVerticalChart
                    )
                }
                
                VStack(alignment: chartItem.titleAlignment) {
                    Text(chartItem.title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                    
                    // the chart
                    if chartItem.isVerticalChart {
                        switch chartItem.chartType {
                        case .bar:
                            BarChartVerticalView(dailySales: $dailySales, barColors: barColors, editMode: editMode, selectedDay: $selectedDay, min: 0.0, max: 1000.0)
                        case .line:
                            LineChartVerticalView(dailySales: dailySales, barColors: barColors)
                        case .area:
                            AreaChartVerticalView(dailySales: dailySales, barColors: barColors)
                        }
                    } else { // horizontal
                        switch chartItem.chartType {
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
                if editMode {
                    RightChartButtonsView(
                        barColors: $barColors,
                        chartType: $chartType,
                        isVerticalChart: $isVerticalChart,
                        titleAlignment: $titleAlignment
                    )
                }
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
