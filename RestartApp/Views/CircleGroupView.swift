//
//  CircleGroupView.swift
//  RestartApp
//
//  Created by M H on 04/12/2021.
//

import SwiftUI

struct CircleGroupView: View {
	
	// MARK: property
	@State var ShapeColor: Color
	@State var ShapeOpacity: Double
	
	@State private var isAnimating: Bool = false
	
	// MARK: body
	
    var body: some View {
		
		
		
		ZStack{
			Circle()
				.stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
				.frame(width: 260, height: 260, alignment: .center)
			Circle()
				.stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
				.frame(width: 260, height: 260, alignment: .center)
		} // zstack
		.blur(radius: isAnimating ? 0:10)
		.opacity(isAnimating ? 1:0)
		.scaleEffect(isAnimating ? 1:0.5)
		.animation(.easeOut(duration: 1), value: isAnimating)
		.onAppear(perform: {
			isAnimating = true
		})
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
		ZStack {
			Color("ColorBlue")
				.ignoresSafeArea()
			
			CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
		}
    }
}
