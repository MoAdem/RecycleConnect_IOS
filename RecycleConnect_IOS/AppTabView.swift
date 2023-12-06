//
//  ContentView.swift
//  Appetizers
//
//  Created by Sean Allen on 11/8/20.
//

import SwiftUI

struct AppTabView: View {
    

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            EventListView()
                .tabItem {
                    Label("Events", systemImage: "calendar")
                }
            NewsListView()
                .tabItem {
                    Label("News", systemImage: "newspaper.fill")
                }
        }
        .accentColor(Color("ColorGreen"))
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
