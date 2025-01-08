//
//  LeftChartButtonsView.swift
//  DDChartsDemo4
//
//  Created by joe on 1/8/25.
//

import SwiftUI

struct LeftChartButtonsView: View {
    @Binding var barColors: [Color]
    @Binding var chartType: ChartType
    @Binding var isVerticalChart: Bool
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    chartType = .bar
                }
            }, label: {
                Text("BAR")
            })
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    chartType = .line
                }
            }, label: {
                Text("LINE")
            })
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    chartType = .area
                }
            }, label: {
                Text("AREA")
            })
            
            Spacer()
            
            ColorfulButtonView(
                colors: $barColors,
                dim: 30,
                offset: 10,
                action: {}
            )
        }
        .padding()
    }
}

struct LeftChartButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            LeftChartButtonsView(
                barColors: .constant(defaultBarColors),
                chartType: .constant(.bar),
                isVerticalChart: .constant(true)
            )
            
            Spacer()
        }
        .previewInterfaceOrientation(.landscapeRight)
    }
}

//#Preview {
//    ChartButtonsView(
//        barColors: .constant(defaultBarColors),
//        chartType: .constant(.bar),
//        isVerticalChart: .constant(true)
//    )
//}
