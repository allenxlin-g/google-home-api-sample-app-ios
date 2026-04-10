// Copyright 2026 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import AVKit
import SwiftUI

/// A view that plays an MP4 video extracted from the history event payload.
public struct HistoricalPlaybackView: View {

  @State private var player: AVPlayer?

  /// - Parameters:
  ///   - url: The URL of the historical video to play.
  public init(url: URL?) {
    if let validURL = url {
      self._player = State(initialValue: AVPlayer(url: validURL))
    } else {
      self._player = State(initialValue: nil)
    }
  }

  public var body: some View {
    if let player = player {
      VideoPlayer(player: player)
        .aspectRatio(contentMode: .fit)
        .onAppear {
          player.play()
        }
        .onDisappear {
          player.pause()
        }
    } else {
      Text("No Video Available")
    }
  }
}
