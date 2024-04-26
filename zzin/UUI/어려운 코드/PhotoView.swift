//
//  PhotoView.swift
//  UUI
//
//  Created by Kim minju  on 4/16/24.
//

import SwiftUI

struct PhotoView: View {
    @Binding var selectedImage: UIImage?
    @Binding var isShowingImagePicker: Bool

    var body: some View {
        GeometryReader { geometry in
            if let uiImage = selectedImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: 200)
                    .clipped()
            }
        }
    }
}
