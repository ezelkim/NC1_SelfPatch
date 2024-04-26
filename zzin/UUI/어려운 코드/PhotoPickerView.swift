import SwiftUI
import UIKit

// UIImagePickerController를 SwiftUI에서 사용할 수 있도록 하는 사용자 정의 함수
struct PhotoPickerView: UIViewControllerRepresentable {
    // 선택한 이미지를 알려주는 바인딩 속성
    @Binding var selectedImage: UIImage?

    // UIViewControllerRepresentable 프로토콜의 요구사항을 충족시키기 위해 구현해야 하는 메서드들
    
    // UIViewController 인스턴스를 생성하여 반환하는 메서드
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator // Coordinator를 UIImagePickerController의 델리게이트로 설정
        picker.sourceType = .photoLibrary // 앨범에서 이미지 선택하도록 설정
        return picker
    }

    // UIViewController가 업데이트되었을 때 호출되는 메서드
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    // UIImagePickerController를 관리하기 위한 Coordinator 클래스
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // Coordinator 클래스
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: PhotoPickerView // 부모 PhotoPickerView에 대한 참조

        init(_ parent: PhotoPickerView) {
            self.parent = parent
        }

        // 사용자가 이미지를 선택했을 때 호출되는 UIImagePickerControllerDelegate 메서드
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // 선택한 이미지를 가져와 selectedImage 바인딩 속성에 할당
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            picker.dismiss(animated: true, completion: nil) // UIImagePickerController 닫기
        }
    }
}
