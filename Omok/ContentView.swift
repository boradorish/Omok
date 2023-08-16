//
//  ContentView.swift
//  Omok
//
//  Created by snulife on 2023/07/08.
//

import SwiftUI

struct ContentView: View {
    @State var theme = GameTheme.brown
    var body: some View {
        TabView{
            GameView()
                .tabItem {
                    Label("Omok", systemImage: "dot.squareshape.split.2x2")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
