//
//  N5TabButton_Feature.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 9/5/23.
//

import ComposableArchitecture
import SwiftUI

struct N5TabButtonFeature: Reducer {
  struct State: Equatable {
    var path = StackState<Path.State>()
  }
  enum Action {
    case path(StackAction<Path.State, Path.Action>)
  }

  struct Path: Reducer {
    enum State: Equatable {
      case n5KanjiTest(N5KanjiTestFeature.State)
      case n5GrammarTest(N5GrammarTestFeature.State)
      case n5ReadingTest(N5ReadingTestFeature.State)
      case n5VocabularyTest(N5VocabularyTestFeature.State)
    }
    enum Action {
      case n5KanjiTest(N5KanjiTestFeature.Action)
      case n5GrammarTest(N5GrammarTestFeature.Action)
      case n5ReadingTest(N5ReadingTestFeature.Action)
      case n5VocabularyTest(N5VocabularyTestFeature.Action)
    }
    var body: some ReducerOf<Self> {
      Scope(state: /State.n5KanjiTest, action: /Action.n5KanjiTest) {
        N5KanjiTestFeature()
      }

      Scope(state: /State.n5GrammarTest, action: /Action.n5GrammarTest) {
        N5GrammarTestFeature()
      }

      Scope(state: /State.n5ReadingTest, action: /Action.n5ReadingTest) {
        N5ReadingTestFeature()
      }

      Scope(state: /State.n5VocabularyTest, action: /Action.n5VocabularyTest) {
        N5VocabularyTestFeature()
      }
    }
  }

  var body: some ReducerOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
      case .path:
        return .none  
      }
    }
    .forEach(\.path, action: /Action.path) {
      Path()
    }
  }
}
