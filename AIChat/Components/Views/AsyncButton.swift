//
//  AsyncButton.swift
//  AIChat
//
//  Created by Jansen Ducusin on 12/15/25.
//

import SwiftUI

struct AsyncButton: View {
    var isLoading: Bool = false
    var title: String = "Save"
    var action: () -> Void

    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
                    .tint(.white)
            } else {
                Text(title)
            }
        }
        .callToActionButton()
        .customButton(.press) {
            action()
        }
        .disabled(isLoading)
    }
}

private struct PreviewView: View {
    @State private var isLoading: Bool = false

    var body: some View {
        AsyncButton(
            isLoading: isLoading,
            title: "Finish") {
                isLoading = true

                Task {
                    try? await Task.sleep(for: .seconds(2))
                    isLoading = false
                }
            }
    }
}

#Preview {
    PreviewView()
        .padding()
}
