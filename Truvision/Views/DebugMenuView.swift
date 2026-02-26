//
//  DebugMenuView.swift
//  Truvision
//
//  Created by Petter Jhunior Garcia Infante on 2/25/26.
//

#if DEBUG

import SwiftUI

struct DebugMenuView: View {
  @ObservedObject var debugMenuViewModel: DebugMenuViewModel

  var body: some View {
    HStack {
      Spacer()
      VStack {
        Spacer()
        Button(action: {
          debugMenuViewModel.showDebugMenu = true
        }) {
          Image(systemName: "ladybug.fill")
            .foregroundColor(.white)
            .padding()
            .background(.secondary)
            .clipShape(Circle())
            .shadow(radius: 4)
        }.accessibilityIdentifier("debug_menu_button")
        Spacer()
      }
      .padding(.trailing)
    }
  }
}

#endif
