//
//  RightChartButtonsView.swift
//  DDChartsDemo4
//
//  Created by joe on 1/8/25.
//

import SwiftUI

struct RightChartButtonsView: View {
    @Binding var barColors: [Color]
    @Binding var chartType: ChartType
    @Binding var isVerticalChart: Bool
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    isVerticalChart.toggle()
                }
            }, label: {
                Image(systemName: "chart.bar.fill")
                    .rotationEffect(.degrees(isVerticalChart ? 90 : 0))
            })
        }
        .padding()
    }
}

struct RightChartButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Spacer()
            
            RightChartButtonsView(
                barColors: .constant(defaultBarColors),
                chartType: .constant(.bar),
                isVerticalChart: .constant(true)
            )
        }
        .previewInterfaceOrientation(.landscapeRight)
    }
}

//#Preview {
//    RightChartButtonsView()
//}
