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
        .chartOverlay { proxy in
            GeometryReader { innerProxy in
                Rectangle()
                    .fill(innerProxyColor)
                    .contentShape(Rectangle())
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                // TODO: change
                                if chartItem.editMode {
                                    isDragging = true
                                    
                                    let location = value.location
                                    let (sales, newDay) = proxy.value(at: location, as: (Double, String).self) ?? (-1, "error")
                                    
                                    print(newDay)
                                    print(sales)
                                    
                                    // update selected day
                                    chartItem.selectedDay = newDay
                                    
                                    setSalesOfSelectedDay(
                                        dailySales: &chartItem.dailySales,
                                        selectedDay: chartItem.selectedDay,
                                        sales: sales,
                                        min: min,
                                        max: max
                                    )
                                }
                            }
                            .onEnded { value in
                                isDragging = false
                            }
                    )
            }
        }
    }
}

#Preview {
    BarChartHorizontalView(chartItem: .constant(.defaultChartItem))
}
