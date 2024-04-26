import SwiftUI

struct EditView2: View {
    @Binding var selectedImage: UIImage?
    @State private var title: String = ""
    @State private var content: String = ""
   
    @State private var isShowingImagePicker = false
    @State private var imageSize: CGSize = CGSize(width: 600, height: 217)
    @State private var isEditingImageSize = true
    @EnvironmentObject var dataManager: DataManager
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack {
                    TextField("메인제목을 입력하세요", text: $title,axis: . vertical)
                        .padding()
                        .font(.custom("AppleSDGothicNeo-Bold", size: 33))
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                    
                    if selectedImage == nil {
                        Button(action: {
                            isShowingImagePicker = true
                        }) {
                            Image(systemName: "photo.badge.plus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                                .foregroundColor(.pink)
                        }
                    } else {
                        VStack {
                            Image(uiImage: selectedImage!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: imageSize.width, height: imageSize.height)
                                .background(Color.white)
                            
                            if isEditingImageSize { // Only show sliders when editing image size
                                HStack {
                                    Text("Width: \(Int(imageSize.width))")
                                    Slider(value: $imageSize.width, in: 100...500, step: 1)
                                }
                                
                                HStack {
                                    Text("Height: \(Int(imageSize.height))")
                                    Slider(value: $imageSize.height, in: 100...500, step: 1)
                                }
                            }
                        }
                        .padding()
                    }
                    
                    TextField("당신의 기사를 써주세요!", text: $content)
                        .font(.custom("AppleSDGothicNeo-Light", size: 20))
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                    
                    Spacer()
                }
                .padding()
                .onAppear(){
                    print(selectedImage)
                }
            }
        }
        .navigationBarItems(trailing:
                                Button(action: {
            //            saveTextFieldData()
            //            saveImage()
            dataManager.saveDiaryEntry(title: title, subtitle: content, date: Date(), location: "Some Location", pictureData: selectedImage?.pngData())
            
            
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("완료")
                .foregroundColor(.pink)
        }
        )
        .sheet(isPresented: $isShowingImagePicker) {
            PhotoPickerView(selectedImage: $selectedImage)
        }
    }
    private func saveDiaryEntry() {
        dataManager.saveDiaryEntry(title: title, subtitle: content, date: Date(), location: "Some Location", pictureData: selectedImage?.pngData())
    }

}
        

    
struct EditView2_Previews: PreviewProvider {
    static var previews: some View {
        let selectedImage: UIImage? = UIImage(named: "placeholder_image") // 미리보기에서 사용할 이미지 지정
        return EditView2(selectedImage: .constant(selectedImage))
    }
}
    struct TextFieldData: Codable {
        let title: String
        let content: String
    }

