//
//  MockDeviceKitView.swift
//  Truvision
//
//  Created by Petter Jhunior Garcia Infante on 2/25/26.
//

#if DEBUG

import Foundation
import SwiftUI

struct MockDeviceKitView: View {
  @ObservedObject var viewModel: ViewModel

  var body: some View {
    NavigationView {
      ScrollView {
        VStack(spacing: 16) {
          CardView {
            VStack(spacing: 8) {
              HStack {
                Text("Mock Device Kit")
                  .font(.title2)
                  .foregroundColor(.primary)
                Spacer()

                Text("\(viewModel.cardViewModels.count) device(s) paired")
                  .font(.subheadline)
                  .foregroundColor(.green)
              }

              Text("This screen handles simulating devices, mocking capabilities, and states")
                .font(.body)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)

              Divider()

              MockDeviceKitButton("Pair RayBan Meta", disabled: viewModel.cardViewModels.count > 2) {
                viewModel.pairRaybanMeta()
              }
            }
            .padding()
          }

          ForEach(viewModel.cardViewModels, id: \.id) { cardViewModel in
            MockDeviceCardView(
              viewModel: cardViewModel,
              onUnpairDevice: {
                viewModel.unpairDevice(cardViewModel.device)
              }
            )
          }

          Spacer()
        }
        .padding()
      }
      .background(Color(.systemGroupedBackground))
    }
  }
}

#endif
