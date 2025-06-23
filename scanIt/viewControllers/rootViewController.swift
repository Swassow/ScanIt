//
//  ContentView.swift
//  scanIt
//
//  Created by Ahsan Habib Swassow on 26/8/24.
//

import SwiftUI

struct rootViewController: View {
    @State private var selectedIndex = 1
    
    init() {
            UITabBar.appearance().backgroundColor = UIColor.systemGray6
        }
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            homeViewController()
                .tabItem {
                    Image(systemName: selectedIndex == 0 ? "house" : "house")
                    Text("Home")
                }
                .tag(0)
            
            cameraViewController()
                .tabItem {
                    Image(systemName: selectedIndex == 1 ? "camera" : "camera.fill")
                    Text("Camera")
                }
                .tag(1)
            
            profileViewController()
                .tabItem {
                    Image(systemName: selectedIndex == 2 ? "person" : "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .accentColor(.purple)
    }
}

#Preview {
    rootViewController()
}
