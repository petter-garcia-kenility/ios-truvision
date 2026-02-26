//
//  CircleButton.swift
//  Truvision
//
//  Created by Petter Jhunior Garcia Infante on 2/25/26.
//


import SwiftUI

struct CircleButton: View {
  let icon: String
  let text: String?
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      if let text {
        VStack(spacing: 2) {
          Image(systemName: icon)
            .font(.system(size: 14))
          Text(text)
            .font(.system(size: 10, weight: .medium))
        }
      } else {
        Image(systemName: icon)
          .font(.system(size: 16))
      }
    }
    .foregroundColor(.black)
    .frame(width: 56, height: 56)
    .background(.white)
    .clipShape(Circle())
  }
}
