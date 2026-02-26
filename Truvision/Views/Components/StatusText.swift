//
//  StatusText.swift
//  Truvision
//
//  Created by Petter Jhunior Garcia Infante on 2/25/26.
//

import SwiftUI

struct StatusText: View {
  let isActive: Bool
  let activeText: String
  let inactiveText: String
  let activeColor: Color
  let inactiveColor: Color

  init(
    isActive: Bool,
    activeText: String,
    inactiveText: String,
    activeColor: Color = .green,
    inactiveColor: Color = .secondary
  ) {
    self.isActive = isActive
    self.activeText = activeText
    self.inactiveText = inactiveText
    self.activeColor = activeColor
    self.inactiveColor = inactiveColor
  }

  var body: some View {
    Text(isActive ? activeText : inactiveText)
      .foregroundColor(isActive ? activeColor : inactiveColor)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
}
