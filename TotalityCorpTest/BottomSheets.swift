//
//  BottomSheets.swift
//  TotalityCorpTest
//
//  Created by AKSHAY VAIDYA on 07/09/23.
//

import Foundation
import SwiftUI



struct BottomsheetView:View{
    
    @State var paddingleft:CGFloat = 1000
    @State var padding2:CGFloat = 20
    @State var showgames = false
    @State private var scale = 1.0
    @State private var scale2 = 0.5
    @Binding var isshowV1:Bool
    @Binding var isshowV2:Bool
    @Binding var selectitle:String
  
    
    var body: some View{
        
        VStack{
            
            Text("PLAY GAME")
                .font(.system(size: 20, weight: .bold))
                .padding(.top, 40)
                .scaleEffect(scale2)
                .animation(.linear, value: scale2)
            
          //  if showgames{
                
                HStack(spacing: 30){
                    
                    
                    VStack{
                        
                        Image("candy")
                            .resizable()
                            .frame(width: 100,height: 100)
                            .clipShape(Circle())
                        
                        Text("Candy Crush")
                        
                        Text("$ 10")
                        
                    }
                    .onTapGesture {
                        selectitle = "Candy Crush"
                        isshowV1 = false
                        isshowV2 = true
                    }
                    
                  
                    
                    VStack{
                        
                        Image("oswald")
                            .resizable()
                            .frame(width: 100,height: 100)
                            .clipShape(Circle())
                        
                        Text("Oswald")
                        
                        Text("$ 15")
                        
                    }
                    .onTapGesture {
                        selectitle = "Oswald"
                        isshowV1 = false
                        isshowV2 = true
                    }
                 
                    
                }
               
              
                .offset(x: showgames ? 0 : 500)
                .animation(.easeInOut, value: showgames)
            
          
      
            
            Spacer()
            
            Button(action: {
                // isDownload = true
             
                isshowV1 = false
                isshowV2 = true
            }, label: {
                
                Spacer()
                
                VStack{
                    
                    Text("NEXT")
                        .foregroundColor(.white)
                    
                }
                
                Spacer()
                
            })
            .padding(.vertical, 20)
            .background(.green)
            .cornerRadius(50)
            .padding(.vertical, 20)
            .padding(.horizontal, 20)
        }
        .onAppear(){
         //  padding2 = 420
         
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                showgames = true
                scale2 += 0.5
            }
        }
        
    }
}


struct BottomsheetView2:View{
    
    @State var paddingleft:CGFloat = 1000
    @State var padding2:CGFloat = 20
    @State var showgames = false
    @State private var scale = 1.0
    @State private var scale2 = 0.5
    @Binding var isshowV2:Bool
    @Binding var isshowV3:Bool
    @State var sphere1:Color = .green
    @State var sphere2:Color = Color(red: 229/255, green: 229/255, blue: 234/255)
    @State var sphere3:Color = Color(red: 229/255, green: 229/255, blue: 234/255)
    @State var balance = 100
    var title = ""
    
    var body: some View{
        
        VStack(spacing: 0){
            
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .padding(.top, 30)
                .scaleEffect(scale2)
                .animation(.linear, value: scale2)
            
            Text("Subscription")
                .font(.system(size: 16, weight: .regular))
                .padding(.top, 20)
                .padding(.bottom, 15)
                .scaleEffect(scale2)
                .animation(.linear, value: scale2)
            
            HStack(spacing: 20){
                
                Text(" 5")
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(.white)
                    .padding(30)
                    .background(sphere1)
                    .clipShape(Circle())
                    .onTapGesture {
                        sphere1 = .green
                        sphere2 = Color(red: 229/255, green: 229/255, blue: 234/255)
                        sphere3 = Color(red: 229/255, green: 229/255, blue: 234/255)
                    }
                
                Text("10")
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(.white)
                    .padding(30)
                    .background(sphere2)
                    .clipShape(Circle())
                    .onTapGesture {
                        sphere2 = .green
                        sphere1 = Color(red: 229/255, green: 229/255, blue: 234/255)
                        sphere3 = Color(red: 229/255, green: 229/255, blue: 234/255)
                    }
                
                Text("15")
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(.white)
                    .padding(30)
                    .background(sphere3)
                    .clipShape(Circle())
                    .onTapGesture {
                        sphere3 = .green
                        sphere2 = Color(red: 229/255, green: 229/255, blue: 234/255)
                        sphere1 = Color(red: 229/255, green: 229/255, blue: 234/255)
                    }
            }
            .offset(x: showgames ? 0 : 500)
            .animation(.easeInOut, value: showgames)
            
            HStack(spacing: 70){
                
                Text("Wallet balance: \(balance)")
                    .font(.system(size: 15))
                
                Image(systemName: "video.fill")
                    .resizable()
                    .frame(width: 50, height: 20)
                    .foregroundColor(Color(red: 229/255, green: 229/255, blue: 234/255))
                    
                  
                
            }.padding(.top, 30)
                .offset(y: showgames ? 0 : 50)
                .animation(.easeInOut, value: showgames)
            
            
            Spacer()
            
            Button(action: {
                // isDownload = true
                isshowV2 = false
                isshowV3 = true
                
            }, label: {
                
                Spacer()
                
                VStack{
                    
                    Text("NEXT")
                        .foregroundColor(.white)
                    
                }
                
                Spacer()
                
            })
            .padding(.vertical, 20)
            .background(.green)
            .cornerRadius(50)
           // .padding(.trailing, 500)
            .padding(.vertical, 20)
            .padding(.horizontal, padding2)
        }
        .onAppear(){
         //  padding2 = 420
         
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                showgames = true
                scale2 += 0.5
            }
          
        }
        
    }
}


struct BottomsheetView3:View{
    
    @State var paddingleft:CGFloat = 1000
    @State var padding2:CGFloat = 20
    @State var showgames = false
    @State private var scale = 1.0
    @State private var scale2 = 0.5
    @Binding var isshowV2:Bool
    @Binding var isshowV3:Bool
    @State var sphere1:Color = .green
    @State var sphere2:Color = Color(red: 229/255, green: 229/255, blue: 234/255)
    @State var sphere3:Color = Color(red: 229/255, green: 229/255, blue: 234/255)
    @State var balance = 100
    var title = ""
    
    var body: some View{
        
        VStack(spacing: 0){
            
            Text("Ready To Play?")
                .font(.system(size: 20))
                .lineSpacing(5)
                .padding(.top, 30)
                .scaleEffect(scale2)
                .animation(.linear, value: scale2)
            
            Text(title)
                .font(.system(size: 20))
                .lineSpacing(5)
                .padding(.top, 10)
                .scaleEffect(scale2)
                .animation(.linear, value: scale2)
            
            Text("Select Level")
                .font(.system(size: 16, weight: .regular))
                .padding(.vertical, 15)
               
                .scaleEffect(scale2)
                .animation(.linear, value: scale2)
            
            HStack(spacing: 15){
                
                Text("LEV 1")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(20)
                    .background(sphere2)
                    .cornerRadius(30)
                   
                
                Text("LEV 2")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(20)
                    .background(sphere2)
                    .cornerRadius(30)
                 
                
                Text("LEV 3")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(20)
                    .background(sphere3)
                    .cornerRadius(30)
                  
            }
            .offset(x: showgames ? 0 : 500)
            .animation(.easeInOut, value: showgames)
            
            HStack(spacing: 70){
                
                Text("Wallet balance: \(balance)")
                    .font(.system(size: 15))
                
                Image(systemName: "video.fill")
                    .resizable()
                    .frame(width: 50, height: 20)
                    .foregroundColor(Color(red: 229/255, green: 229/255, blue: 234/255))
                    
                  
                
            }.padding(.top, 20)
                .offset(y: showgames ? 10 : 0)
                .animation(.easeInOut, value: showgames)
            
            
            Spacer()
            
            Button(action: {
                // isDownload = true
             
                
            }, label: {
                
                Spacer()
                
                VStack{
                    
                    Text("Confirm")
                        .foregroundColor(.white)
                    
                }
                
                Spacer()
                
            })
            .padding(.vertical, 20)
            
            .background(.black)
            .cornerRadius(50)
            .padding(.vertical, 20)
           // .padding(.trailing, 500)
            .padding(.horizontal, padding2)
        }
        .onAppear(){
         //  padding2 = 420
         
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                showgames = true
                scale2 += 0.5
            }
          
        }
        
    }
}
