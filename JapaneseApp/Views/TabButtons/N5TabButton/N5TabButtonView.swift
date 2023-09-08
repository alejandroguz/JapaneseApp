//
//  N5TabButton.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 9/5/23.
//

import SwiftUI
import ComposableArchitecture

struct N5TabButtonView: View {
  let store: StoreOf<N5TabButtonFeature>

  var body: some View {
    
    NavigationStackStore(self.store.scope(state: \.path, action: { .path($0) })) {
      NavigationLink(state: N5TabButtonFeature.Path.State.n5KanjiTest(N5KanjiTestFeature.State())) {
        TestButton(title: "Kanji", completionPorcentage: "60%", color: .yellow)
      }

      NavigationLink(state: N5TabButtonFeature.Path.State.n5GrammarTest(N5GrammarTestFeature.State())) {
        TestButton(title: "Grammar", completionPorcentage: "70%", color: .orange)
      }

      NavigationLink(state: N5TabButtonFeature.Path.State.n5ReadingTest(N5ReadingTestFeature.State())) {
        TestButton(title: "Reading", completionPorcentage: "70%", color: .green)
      }

      NavigationLink(state: N5TabButtonFeature.Path.State.n5VocabularyTest(N5VocabularyTestFeature.State())) {
        TestButton(title: "Vocabulary", completionPorcentage: "70%", color: .cyan)
      }

    } destination: { State in
      switch State {
      case .n5KanjiTest:
        CaseLet(/N5TabButtonFeature.Path.State.n5KanjiTest,
                 action: N5TabButtonFeature.Path.Action.n5KanjiTest,
                 then: N5KanjiTest.init(store:))

      case .n5GrammarTest:
        CaseLet(/N5TabButtonFeature.Path.State.n5GrammarTest,
                 action: N5TabButtonFeature.Path.Action.n5GrammarTest,
                 then: N5GrammarTest.init(store:))

      case .n5ReadingTest:
        CaseLet(/N5TabButtonFeature.Path.State.n5ReadingTest,
                 action: N5TabButtonFeature.Path.Action.n5ReadingTest,
                 then: N5ReadingTest.init(store:))

      case .n5VocabularyTest:
        CaseLet(/N5TabButtonFeature.Path.State.n5VocabularyTest,
                 action: N5TabButtonFeature.Path.Action.n5VocabularyTest,
                 then: N5VocabularyTest.init(store:))
      }
    }
  }
}

struct N5TabButton_Previews: PreviewProvider {
  static var previews: some View {
    N5TabButtonView(store: Store(initialState: N5TabButtonFeature.State(),
                             reducer: { N5TabButtonFeature() }))
  }
}
