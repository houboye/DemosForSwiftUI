//
//  DemoManager.swift
//  SwiftUIDemos
//
//  Created by BY H on 2023/10/23.
//

import SwiftUI

class DemoManager {
    static let shared = DemoManager()
    
    let items = [DemoItemModel(name: "2048")]
    
    func getCustomView(_ item: DemoItemModel) -> some View {
        switch item.name {
        case "2048":
            return GameView().environmentObject(GameLogic())
        default:
            return GameView().environmentObject(GameLogic())
        }
    }
    
    private init() {
        
    }
}
