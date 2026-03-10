//
//  ContentView.swift
//  WifiGrapher
//
//  Created by 岩本　翔 on 2026/03/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "wifi")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Wi-Fi Grapher")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
