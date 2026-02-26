//
//  MockDeviceKitView.swift
//  Truvision
//
//  Created by Petter Jhunior Garcia Infante on 2/25/26.
//

#if DEBUG

import Foundation
import MWDATMockDevice
internal import Combine

extension MockDeviceKitView {
  @MainActor
  class ViewModel: ObservableObject {
    private let mockDeviceKit: MockDeviceKitInterface
    @Published var cardViewModels: [MockDeviceCardView.ViewModel] = []

    init(mockDeviceKit: MockDeviceKitInterface) {
      self.mockDeviceKit = mockDeviceKit
      self.cardViewModels = mockDeviceKit.pairedDevices.map { MockDeviceCardView.ViewModel(device: $0) }
    }

    // Add a new mock Ray-Ban Meta device
    func pairRaybanMeta() {
      let mockDevice = mockDeviceKit.pairRaybanMeta()
      cardViewModels.append(MockDeviceCardView.ViewModel(device: mockDevice))
    }

    func unpairDevice(_ device: MockDevice) {
      if let idx = cardViewModels.firstIndex(where: { $0.id == device.deviceIdentifier }) {
        cardViewModels.remove(at: idx)
        mockDeviceKit.unpairDevice(device)
      }
    }
  }
}

#endif
