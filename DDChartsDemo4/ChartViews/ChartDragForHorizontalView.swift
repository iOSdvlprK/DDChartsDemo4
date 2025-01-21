//
//  ChartDragForHorizontalView.swift
//  DDChartsDemo4
//
//  Created by joe on 1/21/25.
//

import SwiftUI

struct ChartDragForHorizontalView: ViewModifier {
    @Binding var chartItem: ChartItem
    @Binding var isDragging: Bool
    
    var min: Double { chartItem.min }
    var max: Double { chartItem.max }
    
    func body(content: Content) -> some View {
        let innerProxyColor: Color = .clear
        
        content
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
