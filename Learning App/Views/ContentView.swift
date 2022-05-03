//
//  ContentView.swift
//  Learning App
//
//  Created by Anton Nagornyi on 03.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count) { Index in
                        ContentViewRow(index: Index)
                    }
                }
                
                
                
            }.padding()
                .navigationTitle("Learn \(model.currentModule?.category ?? "")")
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
