//
//  ContentModel.swift
//  Learning App
//
//  Created by Anton Nagornyi on 01.05.2022.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    var styleData : Data?
    
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            self.modules = modules
            
        } catch {
            print("Couln't parse data")
        }
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        do {
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
        } catch {
            print("Couln't parse styles")
        }
        
        
        
    }
    
}
