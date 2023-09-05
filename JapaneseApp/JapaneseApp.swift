//
//  JapaneseAppApp.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 8/3/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct JapaneseAppApp: App {
    var body: some Scene {
        WindowGroup {
          CustomTabBarView(store: Store(initialState: CustomTabBarFeature.State(),
                                        reducer: { CustomTabBarFeature() }))
        }
    }
}
