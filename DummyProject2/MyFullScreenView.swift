//
//  MyFullScreenView.swift
//  DummyProject2
//
//  Created by amglobal on 10/9/26.
//

import SwiftUI


struct MyFullScreenView: View {
    // 3. Use the environment dismiss action to close the cover
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea() // Fills the entire screen
            
            VStack(spacing: 20) {
                Text("Full Screen Cover")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Button("Dismiss") {
                    dismiss() // 4. Call dismiss() to close it
                }
                .font(.title2)
                .buttonStyle(.borderedProminent)
                .tint(.white)
                .foregroundColor(.blue)
            }
        }
    }
}



//#Preview {
//    MyFullScreenView()
//}
