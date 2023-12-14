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
            categorielist()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            EventListView()
                .tabItem {
                    Label("Events", systemImage: "calendar")
                }
            ProfileView(user: User(_id: "", username: "", email: "", address: "", password: "", telephone: 5658742, role: "", __v: 0))
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
            NewsListView()
                .tabItem {
                    Label("News", systemImage: "newspaper.fill")
                }
           categorielist()
                .tabItem {
                    Label("Categories", systemImage: "calendar")
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
