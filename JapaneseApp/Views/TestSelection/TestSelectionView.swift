//
//  TestSelectionView.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 9/5/23.
//

import SwiftUI
import ComposableArchitecture

struct TestSelectionView: View {
  let store: StoreOf<TestSelectionFeature>

  var body: some View {
    Text("Hello, World!")
  }
}

struct TestSelectionView_Previews: PreviewProvider {
  static var previews: some View {
    TestSelectionView(store: Store(initialState: TestSelectionFeature.State(),
                                   reducer: { TestSelectionFeature() }))
  }
}
