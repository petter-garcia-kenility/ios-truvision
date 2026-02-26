//
//  CardView.swift
//  Truvision
//
//  Created by Petter Jhunior Garcia Infante on 2/25/26.
//

import SwiftUI

struct CardView<Content: View>: View {
  let content: Content

  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }

  var body: some View {
    VStack(spacing: 0) {
      content
    }
    .background(Color(.systemBackground))
    .cornerRadius(12)
    .shadow(
      color: Color.black.opacity(0.1),
      radius: 4,
      x: 0,
      y: 2
    )
  }
}
