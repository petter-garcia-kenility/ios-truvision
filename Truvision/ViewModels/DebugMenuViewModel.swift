//
//  DebugMenuViewModel.swift
//  Truvision
//
//  Created by Petter Jhunior Garcia Infante on 2/25/26.
//

#if DEBUG

import MWDATMockDevice
import SwiftUI
internal import Combine

@MainActor
class DebugMenuViewModel: ObservableObject {
  @Published public var showDebugMenu: Bool
  @Published public var mockDeviceKitViewModel: MockDeviceKitView.ViewModel

  init(mockDeviceKit: MockDeviceKitInterface) {
    self.mockDeviceKitViewModel = MockDeviceKitView.ViewModel(mockDeviceKit: mockDeviceKit)
    self.showDebugMenu = false
  }
}

#endif
