//
//  RegistrationView.swift
//  Truvision
//
//  Created by Petter Jhunior Garcia Infante on 2/25/26.
//

import MWDATCore
import SwiftUI

struct RegistrationView: View {
  @ObservedObject var viewModel: WearablesViewModel

  var body: some View {
    EmptyView()
      // Handle callback URLs from the Meta mobile app
      // This is essential for completing DAT SDK registration and permission flows
      .onOpenURL { url in
        guard
          let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
          // Check if this URL is related to DAT SDK workflows (contains metaWearablesAction query param)
          components.queryItems?.contains(where: { $0.name == "metaWearablesAction" }) == true
        else {
          return // URL is not related to DAT SDK - ignore it
        }
        Task {
          do {
            // Pass the callback URL to the DAT SDK for processing
            // This handles registration completion and permission grant responses
            _ = try await Wearables.shared.handleUrl(url)
          } catch let error as RegistrationError {
            viewModel.showError(error.description)
          } catch {
            viewModel.showError("Unknown error: \(error.localizedDescription)")
          }
        }
      }
  }
}
