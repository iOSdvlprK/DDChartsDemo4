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
    @State var chartItem: ChartItem = .defaultChartItem
    
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
                    LeftChartButtonsView(chartItem: $chartItem)
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
                
                // right chart buttons
                if chartItem.editMode {
                    RightChartButtonsView(chartItem: $chartItem)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
