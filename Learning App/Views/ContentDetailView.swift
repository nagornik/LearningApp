//
//  ContentDetailView.swift
//  Learning App
//
//  Created by Anton Nagornyi on 03.05.2022.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var module: ContentModel
    
    
    
    var body: some View {
        let lesson = module.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        
        VStack {
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            CodeTextView()
            
            
            if module.hasNextLesson() {
                
                Button {
                    module.nextLesson()
                } label: {
                    
                    
                    ZStack {
                        
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        
                        Text("Next Lesson: \(module.currentModule!.content.lessons[module.currentLessonIndex+1].title)")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
            } else {
                
                Button {
                    module.currentContentSelected = nil
                } label: {
                    
                    ZStack {
                        
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        
                        Text("Complete")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
            }
        }.padding()
            .navigationBarTitle(lesson?.title ?? "")
        
        
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
