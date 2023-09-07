//
//  CustomTabBarContainerView.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 8/14/23.
//

import ComposableArchitecture
import SwiftUI

struct CustomTabBarFeature: Reducer {
  struct State: Equatable {
    var selectedTab = TabButton(image: "N5samurai", text: "N5")
    var tabs: [TabButton] = [
      TabButton(image: "N5samurai", text: "N5"),
      TabButton(image: "N4samurai", text: "N4"),
      TabButton(image: "N3samurai", text: "N3"),
      TabButton(image: "N2samurai", text: "N2"),
      TabButton(image: "N1samurai", text: "N1")
    ]
    var n5Tab = N5TabButtonFeature.State()
  }

  enum Action {
    case tabTapped(TabButton)
    case n5Tab(N5TabButtonFeature.Action)
  }

  var body: some ReducerOf<Self> {
    Scope(state: \.n5Tab, action: /Action.n5Tab) {
      N5TabButtonFeature()
    }

    Reduce<State, Action> { state, action in
      switch action {
      case .tabTapped(let tab):
        state.selectedTab = tab
        return .none

      case .n5Tab:
        return .none
      }
    }
  }
}
