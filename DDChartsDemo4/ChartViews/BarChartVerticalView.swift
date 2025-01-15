//
//  BarChartVerticalView.swift
//  DDChartsDemo3
//
//  Created by joe on 1/5/25.
//

import SwiftUI
import Charts

struct BarChartVerticalView: View {
    @Binding var dailySales: [DailySalesType]
    let barColors: [Color]
    let editMode: Bool
    @Binding var selectedDay: String
    let min: Double
    let max: Double
    
    // dragging related values
    let innerProxyColor: Color = .black.opacity(0.2)
    @State var isDragging: Bool = false
    
    var salesOnSelectedDay: Double {
        getSalesOfSelectedDay(
            dailySales: dailySales,
            selectedDay: selectedDay
        )
    }
    
    var body: some View {
        Chart {
            if isDragging {
                RuleMarkView(
                    selectedDay: selectedDay,
                    salesOnSelectedDay: salesOnSelectedDay,
                    intMode: true
                )
            }
            
            ForEach(dailySales) { item in
                BarMark(
                    x: .value("Day", item.day),
                    y: .value("Sales", item.sales)
                )
                .foregroundStyle(by: .value("Day", item.day))
                .annotation(position: .top) {
                    Image(systemName: "circle")
                        .fontWeight(.bold)
                        .foregroundStyle(Color.red)
                        .opacity(editMode ? 0.8 : 0.0)
                }
            }
        }
        .chartForegroundStyleScale(range: barColors)
        .chartYScale(domain: min...max)
        .chartOverlay { proxy in
            GeometryReader { innerProxy in
                Rectangle()
                    .fill(innerProxyColor)
                    .contentShape(Rectangle())
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                // TODO: change
                                if editMode {
                                    isDragging = true
                                    
                                    let location = value.location
                                    let (newDay, sales) = proxy.value(at: location, as: (String, Double).self) ?? ("error", -1)
                                    
                                    print(newDay)
                                    print(sales)
                                    
                                    // update selected day
                                    selectedDay = newDay
                                    
                                    setSalesOfSelectedDay(
                                        dailySales: &dailySales,
                                        selectedDay: selectedDay,
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
    BarChartVerticalView(
        dailySales: .constant(defaultDailySales),
        barColors: defaultBarColors,
        editMode: true,
        selectedDay: .constant("Sun"),
        min: 0.0,
        max: 1000.0
    )
}
