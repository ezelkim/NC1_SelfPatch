////import SwiftUI
////
////struct EditView: View {
////    @State private var title: String = ""
////    @State private var content: String = ""
////    @Environment(\.presentationMode) var presentationMode
////    
////
//    @State private var selectedImage: UIImage? = nil
//    @State private var isShowingImagePicker = false
////
////    var body: some View {
////        NavigationView {
////            VStack {
////                Spacer()
////                TextField("여기에 기사 제목을 쓰시오", text: $title)
////                    .font(.custom("AppleSDGothicNeo-Bold", size: 40))
////                    .foregroundColor(.black)
////                    .padding(.leading,16)
////                    .padding(.trailing,16)
////                
////                Button(action: {
////                    isShowingImagePicker = true
////                }) {
////                    Image(systemName: "photo.badge.plus")
////                        .resizable()
////                        .aspectRatio(contentMode: .fit)
////                        .frame(width: 40, height: 40)
////                        .padding()
////                        .foregroundColor(.pink)
////                }
////               
////                
//                PhotoView(selectedImage: $selectedImage, isShowingImagePicker: $isShowingImagePicker)
//                
////                
////                TextField("기사 내용을 입력하세요", text: $content)
////                    .font(.custom("AppleSDGothicNeo-Light", size: 20))
////                    .foregroundColor(.black)
////                    .padding()
////            }
////           
////            .navigationBarItems(leading:
////                Button(action: {
////                self.presentationMode.wrappedValue.dismiss()
////            }) {
////                Image(systemName: "arrow.left")
////                    .foregroundColor(.pink)
////                }
////            )
////            .navigationBarItems(trailing:
////                Button(action: {
////                
////                // 저장하는 로직은 여기에 기입하면 되셔요
////                // ex: saveNote()
////                self.presentationMode.wrappedValue.dismiss()
////                }) {
////                    Text("완료")
////                        .foregroundColor(.pink)
////                }
////            )
////            .onAppear {
////                loadNote()
////            }
//            .sheet(isPresented: $isShowingImagePicker) {
//                PhotoPickerView(selectedImage: $selectedImage)
//            }
////        }.navigationBarBackButtonHidden()
////    }
//////    
//////    private func saveNote() {
//////        UserDefaults.standard.set(title, forKey: "savedTitle")
//////        UserDefaults.standard.set(content, forKey: "savedContent")
//////        print("Note saved: \(title)")
//////        print("Content saved: \(content)")
//////    }
//////
//////    private func loadNote() {
//////        if let savedTitle = UserDefaults.standard.string(forKey: "savedTitle") {
//////            title = savedTitle
//////        }
//////        if let savedContent = UserDefaults.standard.string(forKey: "savedContent") {
//////            content = savedContent
//////        }
//////    }
//////}
////
////struct Edit_Previews: PreviewProvider {
////    static var previews: some View {
////        EditView()
////    }
////}
