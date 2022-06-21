//
//  SunView.swift
//  SunLightAnimation
//
//  Created by Андрей Барсук on 21.06.2022.
//

import SwiftUI

struct SunView: View {
    @Binding var sunIsUp: Bool
    private let size = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            SunDiscView()
                .frame(width: size / 3, height: size / 3)
                .blur(radius: 35)
                .scaleEffect(sunIsUp ? 1 : 0.5)
                .animation(.easeInOut.repeatForever(autoreverses: true), value: sunIsUp)
            InnerRaysView()
                .frame(width: size / 3.4, height: size / 3.4)
            InnerRaysView()
                .frame(width: size / 3, height: size / 3)
            ZStack {
                SunDiscView()
                    .frame(width: size / 3, height: size / 3)
                    .blur(radius: 35)
                SunDiscView()
                    .frame(width: size / 4, height: size / 4)
            }
        }
    }
}

struct SunView_Previews: PreviewProvider {
    static var previews: some View {
        SunView(sunIsUp: .constant(false))
    }
}
 
