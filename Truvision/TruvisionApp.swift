//
//  TruvisionApp.swift
//  Truvision
//
//  Created by Petter Jhunior Garcia Infante on 2/25/26.
//

import SwiftUI
import MWDATCore

#if DEBUG
import MWDATMockDevice
#endif

@main
struct TruvisionApp: App {
    #if DEBUG
     @StateObject private var debugMenuViewModel = DebugMenuViewModel(mockDeviceKit: MockDeviceKit.shared)
    #endif
    private let wearables: WearablesInterface
    @StateObject private var wearablesViewModel: WearablesViewModel
    
    init() {
        do {
            try Wearables.configure()
        } catch {
            print("Error configuring Wearables: \(error)")
        }
        let wearables = Wearables.shared 
        self.wearables = wearables
        self._wearablesViewModel = StateObject(wrappedValue: WearablesViewModel(wearables: wearables))

    }

    var body: some Scene {
        WindowGroup {
              // Main app view with access to the shared Wearables SDK instance
              // The Wearables.shared singleton provides the core DAT API
              MainAppView(wearables: Wearables.shared, viewModel: wearablesViewModel)
                // Show error alerts for view model failures
                .alert("Error", isPresented: $wearablesViewModel.showError) {
                  Button("OK") {
                    wearablesViewModel.dismissError()
                  }
                } message: {
                  Text(wearablesViewModel.errorMessage)
                }
                #if DEBUG
              .sheet(isPresented: $debugMenuViewModel.showDebugMenu) {
                MockDeviceKitView(viewModel: debugMenuViewModel.mockDeviceKitViewModel)
              }
              .overlay {
                DebugMenuView(debugMenuViewModel: debugMenuViewModel)
              }
                #endif

              // Registration view handles the flow for connecting to the glasses via Meta AI
              RegistrationView(viewModel: wearablesViewModel)
            }
    }
}
