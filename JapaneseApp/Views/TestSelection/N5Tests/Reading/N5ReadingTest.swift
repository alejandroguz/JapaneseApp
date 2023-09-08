//
//  N5ReadingTest.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 9/8/23.
//

import SwiftUI
import ComposableArchitecture

struct N5ReadingTest: View {
  let store: StoreOf<N5ReadingTestFeature>

  var body: some View {
    Text("N5 Reading Test")
  }
}

struct N5ReadingTest_Previews: PreviewProvider {
  static var previews: some View {
    N5ReadingTest(store: Store(initialState: N5ReadingTestFeature.State(), reducer: { N5ReadingTestFeature() }))
  }
}
