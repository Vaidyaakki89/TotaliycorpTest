//
//  ContentView.swift
//  TotalityCorpTest
//
//  Created by AKSHAY VAIDYA on 07/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPress = false
    @State var isDownload = false
    @State var isshowplaybtn = false
    @State var isshowsheet = false
    @State var isshowV1 = true
    @State var isshowV2 = false
    @State var isshowV3 = false
    @State var selectitle = ""
    @State var isshowdownloadbtn = true
    @State var progresswidth:CGFloat = 20
    @State var playpadding:CGFloat = -100
    @State var progressimage = "Cross"
    @State var buttoncolor:Color = .green
    @State var buttontext = "DOWNLOAD\n30 MB"
    @State var updatedWidth:CGFloat = 0
    let imgarr = ["Candy1", "Candy2","Candy3","Candy4","Candy5"]
    
    var body: some View {
        
        VStack(spacing: 0){
            
            if !isPress{
                Text("PLAY")
                    .padding(.vertical, 10)
                
            }
            VStack {
                
                HStack(alignment: .top){
                    
                    Rectangle().foregroundColor(.yellow)
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .padding(.top, 20)
                        .padding(.leading, 20)
                    
                    if isPress{
                        Text("CANDY\nBUST")
                            .font(.system(size: 20))
                            .padding(.top, 20)
                            .padding(.leading, 10)
                        
                        
                        Spacer()
                        
                        Image("Cross")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.top, 20)
                            .padding(.trailing, 20)
                            .onTapGesture {
                              progresswidth = 20
                                buttoncolor = .green
                                buttontext = "DOWNLOAD\n30 MB"
                                playpadding = -100
                                isshowdownloadbtn = true
                                progressimage = "Cross"
                                withAnimation(.spring()) {
                                    isPress = false
                                    isDownload = false
                                    
                                }
                            }
                    }
                    else{
                        Spacer()
                    }
                }
                if isPress{
                    Text("What is the Lorem/Lupsum? Lorem Lupsm is simply dummy text of printing and typesetting?")
                        .font(.system(size: 14))
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                    
                    Text("READ MORE")
                        .font(.system(size: 15))
                        .foregroundColor(.green)
                        .padding(.vertical, 15)
                    
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(imgarr, id:\.self){ item in
                                
                                Image(item)
                                    .resizable()
                                    .frame(width: 200)
                                    .padding()
                                
                            }
                        }
                        
                    }.scrollIndicators(.hidden)
                }
                
                Spacer()
                
                VStack(spacing: 5){
                    if isshowdownloadbtn {
                        HStack(spacing: 5){
                            
                            ZStack(alignment: .leading){
                              
                                DownloadButton(isPress: $isPress, isDownload: $isDownload, isshowdownloadbtn: $isshowdownloadbtn, buttoncolor: $buttoncolor, buttontext: $buttontext, progresswidth: $progresswidth, progressimage: $progressimage, playpadding: $playpadding)
                                
                                if isDownload{
                                    
                                    RoundedRectangle(cornerSize: CGSize(width: 50, height: 50))
                                        .frame(width: progresswidth, height: 60)
                                        .foregroundColor(.green)
                                        .padding(.leading, 20)
                                        .padding(.bottom,20)
                                    
                                    Text("10 MB / 30 MB")
                                        .frame(maxWidth: .infinity, alignment:.center)
                                        .foregroundColor(.white)
                                        .padding(.bottom,20)
                                    
                                }
                            }
                            
                            if isDownload{
                                
                                Image(progressimage)
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding(20)
                                    .background(.yellow)
                                    .cornerRadius(30)
                                    .padding(.bottom, 20)
                                    .padding(.trailing, 20)
                                    .padding(.leading, -15)
                                
                            }
                        }
                        
                    }
              
                     PlayButton(isshowsheet: $isshowsheet, playpadding: $playpadding)
              
                }
                
            }
            .background(isPress ? .white : .orange)
            .cornerRadius(30)
            .padding(isPress ? 0 : 20)
            .onTapGesture {
                withAnimation(.spring()) {
                    isPress = true
                    
                }
            }
            
            .sheet(isPresented: $isshowsheet, onDismiss: {
                isshowV1 = true
                isshowV2 = false
                isshowV3 = false
            }){
                if isshowV1{
                    BottomsheetView(isshowV1: $isshowV1, isshowV2: $isshowV2, selectitle: $selectitle)
                        .presentationDetents([.height(350), .height(350)])
                }
                else if isshowV2 {
                    
                    BottomsheetView2(isshowV2: $isshowV2, isshowV3: $isshowV3, title:selectitle)
                        .presentationDetents([.height(350), .height(350)])
                    
                }
                
                else if isshowV3 {
                    
                    BottomsheetView3(isshowV2: $isshowV2, isshowV3: $isshowV3, title:selectitle)
                        .presentationDetents([.height(350), .height(350)])
                    
                }
               
            }
            
            if !isPress{
                
                VStack{
                    
                    
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(.orange)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .padding()
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}








// Extension for adding rounded corners to specific corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

// Custom RoundedCorner shape used for cornerRadius extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
