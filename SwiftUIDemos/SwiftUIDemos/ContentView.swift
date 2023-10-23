//
//  ContentView.swift
//  SwiftUIDemos
//
//  Created by BY H on 2023/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(DemoManager.shared.items) { item in
                NavigationLink(destination: DemoManager.shared.getCustomView(item)) {
                    HStack {
                        Text(item.name)
                    }
                }
            }
            .navigationTitle("Demos" )
            .navigationBarTitleDisplayMode(.automatic)
            
        }
    }
}

#if DEBUG
#Preview {
    ContentView()
}
#endif
