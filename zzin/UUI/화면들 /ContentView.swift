import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var selectedImage: UIImage? = nil
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 35, height: 35)
                    Text("셀프패치")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading, 5)
                        .foregroundColor(.black)
                    Spacer()
                    NavigationLink(destination: EditView2(selectedImage: .constant(nil))) {
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.pink)
                            .frame(width: 25, height: 25)
                            .padding(.trailing, 23)
                    }
                }
                .padding(.top,10)
                .padding(.leading, 28)
                .padding(.bottom, 15)
                .background(Color.white)
                
                // Main Content
                ScrollView {
                    VStack {
                        HStack{
                            Text("이번달 메인 기사")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.black).padding(.leading,13)
                            Spacer()
                        }
                        

                        
                        ForEach(dataManager.Title, id: \.self) { entry in
                            if let title = entry.title {
                                RectangleView(text: title)
                            }
                        }
//                        .padding(.horizontal, 30)
//                        .padding(.vertical, 20)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 1, y: 1)
                        .padding(.top, 14)
                    }
                    .padding()
                    .background(Color(red: 0.967, green: 0.970, blue: 0.970))
                }
            }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environmentObject(DataManager()) // DataManager를 Environment로 전달
        }
    }
    
    struct RectangleView: View {
        var text: String
        
        var body: some View {
            NavigationLink(destination: Main2View()) {
                Text(text)
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.black)
                    .padding(20)
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(8)
        }
    }
