//
//  BarChartVerticalView.swift
//  DDChartsDemo3
//
//  Created by joe on 1/5/25.
//

import SwiftUI
import Charts

struct BarChartVerticalView: View {
    @Binding var chartItem: ChartItem
    
    var min: Double { chartItem.min }
    var max: Double { chartItem.max }
    
    // dragging related values
    let innerProxyColor: Color = .clear
    
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
                RuleMarkForVerticalView(chartItem: chartItem, salesOnSelectedDay: salesOnSelectedDay)
            }
            
            ForEach(chartItem.dailySales) { item in
                BarMark(
                    x: .value("Day", item.day),
                    y: .value("Sales", item.sales)
                )
                .foregroundStyle(by: .value("Day", item.day))
                .annotation(position: .top) {
                    Image(systemName: "circle")
                        .fontWeight(.bold)
                        .foregroundStyle(Color.red)
                        .opacity(chartItem.editMode ? 0.8 : 0.0)
                }
            }
        }
        .chartForegroundStyleScale(range: chartItem.barColors)
        .chartYScale(domain: min...max)
        .modifier(ChartDragForVerticalView(chartItem: $chartItem, isDragging: $isDragging))
    }
}

#Preview {
    BarChartVerticalView(chartItem: .constant(ChartItem.defaultChartItem))
}
