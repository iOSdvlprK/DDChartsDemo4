//
//  SimpleTitleButtonView.swift
//  DDChartsDemo4
//
//  Created by joe on 1/9/25.
//

import SwiftUI

struct SimpleTitleButtonView: View {
    @Binding var titleAlignment: HorizontalAlignment
    let myAlignment: HorizontalAlignment
    let iconName: String
    
    let selectedOpacity = 1.0
    let deselectedOpacity = 0.3
    
    var body: some View {
        Button(
            action: {
                withAnimation {
                    titleAlignment = myAlignment
                }
            }) {
                Image(systemName: iconName)
                    .foregroundStyle(Color.black)
                    .opacity(titleAlignment == myAlignment ? selectedOpacity : deselectedOpacity)
            }
    }
}

struct SimpleTitleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Spacer()
            
            SimpleTitleButtonView(titleAlignment: .constant(.center), myAlignment: .center, iconName: "align.horizontal.left.fill")
        }
        .previewInterfaceOrientation(.landscapeRight)
    }
}

//#Preview {
//    SimpleTitleButtonView(titleAlignment: .constant(.center), myAlignment: .center, iconName: "person")
//}
