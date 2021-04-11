//
//  VideoView.swift
//  SwiftUIWebinar
//
//  Created by user on 09.04.2021.
//

import SwiftUI
import Combine

struct VideoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding <PresentationMode> //чтобы по нажатию кнопки был переход
    @EnvironmentObject var channelData: ChannelData
    //@State var videoTitle: String
    @Binding var videoTitle: String
    //@State var videoDescription: String
    @Binding var videoDescription: String
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                TextField("Video title", text: $videoTitle )
                TextField("Video title", text: $videoDescription)
                Divider()
                Button {
                    print("13579")
                    self.presentationMode.wrappedValue.dismiss() //сворачивание экрана по нажатию на кнопку
                } label: {
                    Text("Dismiss this VC")
                }
                Spacer()
            }
            .padding()
            //.navigationBarTitle("SwiftBook.ru")
            .navigationBarTitle("\(channelData.channelName)")
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(videoTitle: Binding.constant(DataModel.init().title), videoDescription: Binding.constant(DataModel.init().description))
            .environmentObject(ChannelData())

   }
}
