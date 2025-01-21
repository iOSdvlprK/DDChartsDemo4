//
//  LineChartHorizontalView.swift
//  DDChartsDemo3
//
//  Created by joe on 1/5/25.
//

import SwiftUI
import Charts

struct LineChartHorizontalView: View {
    @Binding var chartItem: ChartItem
    
    var min: Double { chartItem.min }
    var max: Double { chartItem.max }
    
    @State var isDragging: Bool = false
    
    var salesOnSelectedDay: Double {
        getSalesOfSelectedDay(
            dailySales: chartItem.dailySales,
            selectedDay: chartItem.selectedDay
        )
    }
    
    var body: some View {
        Chart {
            ForEach(chartItem.dailySales) { item in
                LineMark(
                    x: .value("Sales", item.sales),
                    y: .value("Day", item.day)
                )
                .foregroundStyle(chartItem.lineAreaColor)
                .symbol() {
                    Annotate_Line_Area_Graph(chartItem: chartItem)
                }
            }
            
            if isDragging {
                RuleMarkForHorizontalView(chartItem: chartItem, salesOnSelectedDay: salesOnSelectedDay)
            }
        }
        .chartXScale(domain: min...max)
        .modifier(ChartDragForHorizontalView(chartItem: $chartItem, isDragging: $isDragging))
    }
}

#Preview {
    LineChartHorizontalView(chartItem: .constant(.defaultChartItem))
}
