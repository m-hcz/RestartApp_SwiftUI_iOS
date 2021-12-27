//
//  HomeView.swift
//  RestartApp
//
//  Created by M H on 04/12/2021.
//

import SwiftUI

struct HomeView: View {
	// MARK: property
	@AppStorage("onboarding") var inOnboardingViewActive: Bool = false
	
	@State private var isAnimating: Bool = false
	
	// MARK: body
	var body: some View {
		VStack(spacing: 20){
			
			// MARK: header
			Spacer()
			ZStack {
				CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
				Image("character-2")
					.resizable()
					.scaledToFit()
					.padding()
					.offset(y: isAnimating ? 35:-35)
					.animation(.easeInOut(duration: 4).repeatForever(),value: isAnimating )
			} // zstack
			
			// MARK: center
			Text("The time that leads to mastery is dependet on the intensity of your focus.")
				.font(.title3)
				.fontWeight(.light)
				.foregroundColor(.secondary)
				.multilineTextAlignment(.center)
				.padding()
			
			// MARK: footer
			Spacer()
			
			
			
			Button(action:{
				withAnimation{
					playSound(sound: "success", type: "m4a")
					inOnboardingViewActive = true
				}
			}) {
				Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
					.imageScale(.large)
				Text("Restart")
					.font(.system(.title3,design: .rounded))
					.fontWeight(.bold)
			}
			.buttonStyle(.borderedProminent)
			.buttonBorderShape(.capsule)
			.controlSize(.large)
		} // vstack
		.onAppear(perform: {
			DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
				isAnimating = true
			})
		})
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
