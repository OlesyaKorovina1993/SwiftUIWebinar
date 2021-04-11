//
//  ContentView.swift
//  SwiftUIWebinar
//
//  Created by user on 09.04.2021.
//

import SwiftUI

//@State private var showingVideoView = false

struct ContentView: View {
    @State private var showingVideoView = false
    
    @ObservedObject var dataModel = DataModel()
    
    @EnvironmentObject var channelData: ChannelData
    
    var body: some View {
        NavigationView{
            VStack (alignment: .leading) {
                GeometryReader{ geometry in
                    HStack(spacing: 20.0) {
                        NavigationLink(
                            destination: ChannelView(),
                            label: {
                                Text("Edit channel")
                            })
                            .frame(width: geometry.size.width/2 - 10,height: 50)
                            .accentColor(Color.init(.white))
                            .background(Color.gray)
                            .cornerRadius(10.0)
                        Button(action: {
                            print ("12345")
                            self.showingVideoView.toggle()
                        }, label: {
                            Text("Edit content")
                        })
                        .sheet(isPresented: self.$showingVideoView, content: {
                            VideoView(videoTitle: self.$dataModel.title, videoDescription: self.$dataModel.description)
                                .environmentObject(self.channelData)
                        })
                        .frame(width: geometry.size.width/2 - 10, height: 50)
                        .accentColor(Color.init(.white))
                        .background(Color.gray)
                        .cornerRadius(10.0)
                        
                    }
                    
                }
                .padding()
                .frame(height: 50)
                .padding()
                Divider()
        HStack{
            Image("apple")
            //если картинка большая:
            //.resizable()
            //.frame(width: 120, height: 120)
            VStack (alignment: .leading){
                Text("Title: \(dataModel.title)")
                    .font(.title)
                    
                Text("Description: \(dataModel.description)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                //.padding()
                   }
                }
        .padding()
                Spacer()
            }
            //.navigationBarTitle("SwiftBook.ru")
            .navigationBarTitle("\(channelData.channelName)")
       }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ChannelData())
    }
}
