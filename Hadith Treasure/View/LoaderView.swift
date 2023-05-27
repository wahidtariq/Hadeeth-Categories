//
//  LoaderView.swift
//  Hadith Treasure
//
//  Created by wahid tariq on 27/05/23.
//

import SwiftUI

struct CircularView: View {
    
    @State private var rotationAngle = 0.0
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.8)
            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
            .frame(width: 50, height: 50)
            .foregroundColor(Color.blue)
            .rotationEffect(.degrees(rotationAngle))
            .repeatAnimation(rotationSpeed: 1) { rotationAngle = 360.0 }
            .padding()
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        CircularView()
    }
}

extension View {
    
    public func addLoader(loading: Bool) -> some View {
        ZStack {
            self
            if loading {
                CircularView()
            }
        }
    }
    
    
    /// Short-hand modifer that help to perform animation forever
    /// - Parameters:
    ///   - rotationSpeed: Indicates the ring rotation. Lower the number will be faster rotation speed
    ///   - action: Closure where you can add values that needed to be animated
    func repeatAnimation(rotationSpeed: Double, _ action: @escaping () -> Void) -> some View {
        let animation = {
            Animation.linear(duration: rotationSpeed).repeatForever(autoreverses: false)
        }()
        return onAppear {
            withAnimation(animation) {
                action()
            }
        }
    }
}
