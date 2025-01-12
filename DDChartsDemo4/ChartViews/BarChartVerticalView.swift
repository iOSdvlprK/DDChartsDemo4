//
//  BarChartVerticalView.swift
//  DDChartsDemo3
//
//  Created by joe on 1/5/25.
//

import SwiftUI
import Charts

struct BarChartVerticalView: View {
    let dailySales: [DailySalesType]
    let barColors: [Color]
    let editMode: Bool
    @Binding var selectedDay: String
    
    // dragging related values
    let innerProxyColor: Color = .black.opacity(0.2)
    @State var isDragging: Bool = false
    
    var body: some View {
        Chart {
            ForEach(dailySales) { item in
                BarMark(
                    x: .value("Day", item.day),
                    y: .value("Sales", item.sales)
                )
                .foregroundStyle(by: .value("Day", item.day))
            }
            
            RuleMarkView(
                selectedDay: "Tue",
                salesOnSelectedDay: 323.4567,
                intMode: true
            )
        }
        .chartForegroundStyleScale(range: barColors)
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
                                    
                                    // update selected day
                                    selectedDay = newDay
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
        dailySales: defaultDailySales,
        barColors: defaultBarColors,
        editMode: true,
        selectedDay: .constant("Sun")
    )
}
