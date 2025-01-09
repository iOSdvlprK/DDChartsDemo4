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
    @Binding var titleAlignment: HorizontalAlignment
    
    var body: some View {
        VStack(spacing: 50) {
            Button(action: {
                withAnimation {
                    isVerticalChart.toggle()
                }
            }, label: {
                Image(systemName: "chart.bar.fill")
                    .rotationEffect(.degrees(isVerticalChart ? 90 : 0))
                    .foregroundStyle(Color.black)
                    .opacity(0.7)
            })
            
            TitleAlignmentButton(titleAlignment: $titleAlignment)
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
                isVerticalChart: .constant(true),
                titleAlignment: .constant(.center)
            )
        }
        .previewInterfaceOrientation(.landscapeRight)
    }
}

//#Preview {
//    RightChartButtonsView()
//}
