//
//  App.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 9/6/23.
//

import SwiftUI
import ComposableArchitecture

struct RootFeature: Reducer {
  struct State: Equatable {
    var path = StackState<Path.State>()
  }
  enum Action {
    case path(StackAction<Path.State, Path.Action>)
  }

  struct Path: Reducer {
    enum State: Equatable {
      case testSelection(TestSelectionFeature.State)
    }
    enum Action {
      case testSelection(TestSelectionFeature.Action)
    }
    var body: some ReducerOf<Self> {
      Scope(state: /State.testSelection, action: /Action.testSelection) {
        TestSelectionFeature()
      }
    }
  }

  var body: some ReducerOf<Self> {
    Reduce { state, action in
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
