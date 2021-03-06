//
//  ContentView.swift
//  Learning App
//
//  Created by Anton Nagornyi on 01.05.2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        
        
        NavigationView {
            VStack (alignment: .leading) {
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                ScrollView {
                    LazyVStack {
                        ForEach (model.modules) { module in
                           
                            NavigationLink(tag: module.id, selection: $model.currentContentSelected) {
                                ContentView()
                                    .onAppear(perform: {model.beginModule(module.id)})
                            } label: {
                                HomeViewRow(image: module.content.image, title: "Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                            }

                            

                            
                            
                            HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Questions", time: module.test.time)
                            
                        }.padding(.horizontal)
                        .padding(.top)
                    }
                        
                }
            }.navigationTitle("Get Started")
        }
        .accentColor(.black)
        .navigationViewStyle(.stack)
    }
    
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
