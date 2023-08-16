//
//  TestButton.swift
//  JapaneseApp
//
//  Created by Alejandro Guzman Bolivar on 8/3/23.
//

import SwiftUI

struct TestButton: View {
  let title: String
  var completionPorcentage: String
  let color: Color

  var body: some View {
    Rectangle()
      .fill(color)
      .cornerRadius(20)
      .frame(width: 300, height: 120)
      .overlay {
        HStack {
          VStack(alignment: .leading) {
            Text(title)
              .font(.title)
            Text("\(completionPorcentage) completed")
          }
          .foregroundColor(.white)

          Spacer()
            .frame(width: 50)

          Image(systemName: TestButtonSFsymbol.book.rawValue)
            .font(.largeTitle)
            .foregroundColor(.white)
        }
      }
  }
}

struct TestButton_Previews: PreviewProvider {
  static var previews: some View {
    TestButton(title: "Reading",
               completionPorcentage: "77%",
               color: .pink)
  }
}
