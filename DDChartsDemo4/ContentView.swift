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
    @State var selectedDay: String = "Sun"
    @State var barColors: [Color] = defaultBarColors
    @State var chartType: ChartType = .bar
    let xAxisMarkPosition: AxisMarkPosition = .bottom
    let yAxisMarkPosition: AxisMarkPosition = .leading
    @State private var isVerticalChart = true
    
    @State var title = "Chart Title"
    @State var titleAlignment: HorizontalAlignment = .trailing
    @State var editMode: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation {
                        editMode.toggle()
                    }
                }, label: {
                    Image(systemName: editMode ? "checkmark" : "square.and.pencil")
                })
                
                if !editMode {
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
                if editMode {
                    LeftChartButtonsView(
                        barColors: $barColors,
                        chartType: $chartType,
                        isVerticalChart: $isVerticalChart
                    )
                }
                
                VStack(alignment: titleAlignment) {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                    
                    // the chart
                    if isVerticalChart {
                        switch chartType {
                        case .bar:
                            BarChartVerticalView(dailySales: dailySales, barColors: barColors, editMode: editMode, selectedDay: $selectedDay)
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
