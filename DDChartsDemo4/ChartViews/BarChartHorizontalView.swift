//
//  BarChartHorizontalView.swift
//  DDChartsDemo3
//
//  Created by joe on 1/5/25.
//

import SwiftUI
import Charts

struct BarChartHorizontalView: View {
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
            if isDragging {
                RuleMarkForHorizontalView(chartItem: chartItem, salesOnSelectedDay: salesOnSelectedDay)
            }
            
            ForEach(chartItem.dailySales) { item in
                BarMark(
                    x: .value("Sales", item.sales),
                    y: .value("Day", item.day)
                )
                .foregroundStyle(by: .value("Day", item.day))
            }
        }
        .chartForegroundStyleScale(range: chartItem.barColors)
        .chartXScale(domain: min...max)
        .modifier(ChartDragForHorizontalView(chartItem: $chartItem, isDragging: $isDragging))
    }
}

#Preview {
    BarChartHorizontalView(chartItem: .constant(.defaultChartItem))
}
