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
