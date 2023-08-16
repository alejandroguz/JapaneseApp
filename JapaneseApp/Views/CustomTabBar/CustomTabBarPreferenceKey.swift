//
//  CustomTabBarPreferenceKey.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 8/15/23.
//

import Foundation
import SwiftUI

struct TabItemPreferenceKey: PreferenceKey {
  static var defaultValue: [TabButton] = []

  static func reduce(value: inout [TabButton], nextValue: () -> [TabButton]) {
    value += nextValue()
  }
}

struct TabItemViewModifier: ViewModifier {
  let tabiButton: TabButton

  func body(content: Content) -> some View {
    content
      .preference(key: TabItemPreferenceKey.self, value: [tabiButton])
  }
}

extension View {
  func tabBarItem(tab: TabButton) -> some View {
    self.modifier(TabItemViewModifier(tabiButton: tab))
  }
}
