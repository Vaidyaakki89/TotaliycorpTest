//
//  ActionButtons.swift
//  TotalityCorpTest
//
//  Created by AKSHAY VAIDYA on 08/09/23.
//

import Foundation

import SwiftUI

struct DownloadButton:View{
    
    @Binding var isPress:Bool
    @Binding var isDownload:Bool
    @Binding var isshowdownloadbtn:Bool
    @Binding var buttoncolor:Color
    @Binding var buttontext:String
    @Binding var progresswidth:CGFloat
    @Binding var progressimage:String
    @State var updatedWidth:CGFloat = 20
    @Binding var playpadding:CGFloat
    
    var body: some View{
        
        VStack{
            
            Button(action: {
                // isDownload = true
                if isPress{
                    buttoncolor = Color(red: 207/255, green: 236/255, blue: 209/255)
                    withAnimation(.spring()) {
                        isDownload.toggle()
                        buttontext = "\n"
                        //  buttoncolor = .green
                        
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                        withAnimation(.linear(duration: 2)){
                            
                       progresswidth = updatedWidth
                           
                            //  isshowplaybtn = true
                            // playpadding = 20
                        }
                        
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()+3){
                        progressimage = "Tick2"
                       
                        
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()+4){
                        
                        withAnimation(.linear(duration: 0.5)){
                            
                            isshowdownloadbtn = false
                            playpadding = 20
                        }
                    }
                    
                }
            }, label: {
                
                Spacer()
                
                VStack{
                    
                    Text(buttontext)
                        .foregroundColor(isPress ? .white : .clear)
                    //                            Text("30 MB")
                    //                                .foregroundColor(isPress ? .white : .clear)
                    
                    
                }
                
                Spacer()
                
            })
            .padding(.vertical, 10)
            .background(    GeometryReader { proxy in
               buttoncolor
                
                    .onChange(of: proxy.size.width, perform: {_ in
                        
                        print(proxy.size.width)
                        
                     
                                
                                updatedWidth = proxy.size.width
                                
                       
                        
                    })
                        
                       
                    
            })
            .cornerRadius(50)
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            
            
        }
        
    }
    
}



struct PlayButton:View{
    
    
    @Binding var isshowsheet:Bool
    @Binding var playpadding:CGFloat
    
    var body: some View{
        
        VStack{
            
            Button(action: {
                // isDownload = true
                isshowsheet = true
                
            }, label: {
                
                Spacer()
                
                VStack{
                    
                    Text("PLAY")
                        .foregroundColor(.white)
                    
                }
                
                Spacer()
                
            })
            .padding(.vertical, 20)
            .background(.blue)
            .cornerRadius(50)
            .padding(.horizontal, 20)
    
            .padding(.bottom, playpadding)
            
        }
        
    }
    
}
