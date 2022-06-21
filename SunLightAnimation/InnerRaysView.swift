//
//  InnerRaysView.swift
//  SunLightAnimation
//
//  Created by Андрей Барсук on 21.06.2022.
//

import SwiftUI

struct InnerRaysView: View {
    var body: some View {
        ZStack {
            ForEach(0..<9) { iteration in
                InnerRayView()
                    .rotationEffect(.degrees(Double(10 * iteration)))
            }
        }
    }
}

struct InnerRaysView_Previews: PreviewProvider {
    static var previews: some View {
        InnerRaysView()
            .frame(width: 200, height: 200)
    }
}
