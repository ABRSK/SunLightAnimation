//
//  OuterRaysView.swift
//  SunLightAnimation
//
//  Created by Андрей Барсук on 21.06.2022.
//

import SwiftUI

struct OuterRaysView: View {
    var body: some View {
        ZStack {
            ForEach(0..<18) { iteration in
                OuterRayView()
                    .rotationEffect(.degrees(Double(5 * iteration)))
            }
            
        }
    }
}

struct OuterRaysView_Previews: PreviewProvider {
    static var previews: some View {
        OuterRaysView()
            .frame(width: 200, height: 200)
    }
}
