//
//  ContentView.swift
//  RestartApp
//
//  Created by M H on 04/12/2021.
//

import SwiftUI

struct ContentView: View {
	@AppStorage("onboarding") var inOnboardingViewActive: Bool = true
	var body: some View {
		ZStack{
			if inOnboardingViewActive {
				OnboardingView()
			} else {
				HomeView()
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
