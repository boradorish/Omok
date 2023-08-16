//
//  SettingsView.swift
//  Omok
//
//  Created by snulife on 2023/07/08.
//

import SwiftUI

struct SettingsView: View {
    let themes = GameTheme.allCases
    @AppStorage("theme") var selectedTheme: GameTheme = .brown
    var body: some View {
        Form{
            Picker("Theme", selection: $selectedTheme) {
                ForEach(themes){ theme in
                    Text(theme.rawValue.capitalized).tag(theme)
                }
            }
//            Menu{
//                Text("hi")
//            } label: {
//                Text("x")
//            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
