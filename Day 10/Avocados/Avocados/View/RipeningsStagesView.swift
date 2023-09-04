//
//  RipeningsStagesView.swift
//  Avocados
//
//  Created by Emre Tekin on 4.09.2023.
//

import SwiftUI

struct RipeningsStagesView: View {
    
    var ripeningStages: [Ripening] = ripeningData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 25) {
                    ForEach(ripeningStages) { stage in
                        RipeningView(ripening: stage)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 25)
                Spacer()
            }
        }
    }
}

struct RipeningsStagesView_Previews: PreviewProvider {
    static var previews: some View {
        RipeningsStagesView(ripeningStages: ripeningData)
    }
}
