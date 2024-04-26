//
//  Main2View.swift
//  UUI
//
//  Created by Kim minju  on 4/16/24.
//
import SwiftUI

struct Main2View: View {
    
    @EnvironmentObject var dataManager: DataManager
    @State private var capturedImage: UIImage?
    @State private var showAlert = false
    
    
    var body: some View {
        
        
        
        ScrollView(){
            VStack{
                
                VStack(alignment:.leading){
                    
                    Spacer()
                    
                    Text("“쌍둥이와 원숭이, 재미있는 집스의 일상 이번엔 MC1 생활, 사진 찍는걸 즐기며 브이 [JIPS] ")
                        .font(Font.custom("AppleSDGothicNeo-Bold", size: 28))
                        .lineSpacing(8)
                        .foregroundColor(.black)
                        .padding(.bottom,3)
                        .padding(.leading, 15)
                        .padding(.trailing, 15)
                    
                    VStack{
                        Text("포항공대 C5,2024-4-2")
                            .font(Font.custom("AppleSDGothicNeo-light", size: 12))
                            .lineSpacing(1)
                            .foregroundColor(.gray)
                            .padding(.leading, 15)
                    }
                    
                }
                .padding(.leading,16)
                .padding(.trailing,16)
                
                Spacer()
            }
            
            HStack{
                Image("몽숭이")
                    .resizable()
                    .frame( width: 398, height: 215)
                    .padding()
            }
            
            Spacer()
            
            
            Text("집스의 멤버 몽피,이젤(본인),웬디가 함께 찍은 사진을\n공개했다. \n\n브릿지 기간동안 자신만의 역량을 갖춘건지 아닌지는 \n잘 모르겠지만, 스스로들 만족하며, 뜻깊은 시간을\n 보냈다. \n\n특히 이젤(본인)과 웬디의 옷이 비슷하여 뜨거운\n인기를 얻었는데, 무려 세명의 파파라치들에게 \n사진을 찍히며, 큰 인기를 누렸다. \n\n몽피는 원숭이 같이 사진이 찍혀 수위조절이 각별히\n필요하다.")
            
                .font(Font.custom("AppleSDGothicNeoM00", size: 17))
                .lineSpacing(15)
                .foregroundColor(Color(red: 0.31, green: 0.31, blue: 0.31));
        }
        .navigationBarTitle("이번달 메인 기사", displayMode: .inline)
        .navigationBarItems(trailing:
                                
                                Button(action: {
            showAlert.toggle()
        }) {
            Image(systemName: "square.and.arrow.down")
                .foregroundColor(.pink)
                .padding()
        }
     
        )
        .alert(isPresented: $showAlert) {
            Alert(title: Text("현재화면을 저장하시겠읍니가?"), message: Text("그래도 진짜 하시겠읍니까?"), primaryButton: .default(Text("Cancel"), action: {
            }), secondaryButton: .default(Text("OK"), action: {
                takeScreenshot()
            }))
        }
    }
    
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


#Preview {
    ContentView()
      
}


