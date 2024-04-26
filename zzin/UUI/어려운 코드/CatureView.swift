import SwiftUI
import Photos

struct CaptureView: View {
    @Binding var capturedImage: UIImage?
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Spacer()
            Button(action: {
                takeScreenshot()
            }) {
                Text("저장")
            }
            .padding()
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
    
    // 스크린샷을 캡처하고 저장하는 함수
    func takeScreenshot() {
        guard let windowScene = UIApplication.shared.connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .compactMap({ $0 as? UIWindowScene })
                .first,
              let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return
        }


        UIGraphicsBeginImageContextWithOptions(window.frame.size, false, UIScreen.main.scale)
        window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
        guard let screenshot = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()

        capturedImage = screenshot
        UIImageWriteToSavedPhotosAlbum(screenshot, nil, nil, nil)
    }
}


