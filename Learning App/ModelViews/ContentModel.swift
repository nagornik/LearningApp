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
    
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    @Published var currentLesson: Lesson?
    var currentLessonIndex = 0
    
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
    
    func beginModule(_ moduleId:Int) {
        
        for index in 0..<modules.count {
            
            if modules[index].id == moduleId {
                
                currentModuleIndex = index
                break
            }
        }
        currentModule = modules[currentModuleIndex]
    }
    
    func beginLesson(_ lessonIndex:Int) {
        
        if lessonIndex < currentModule!.content.lessons.count {
            currentLessonIndex = lessonIndex
        } else {
            currentLessonIndex = 0
        }
        
        currentLesson = currentModule!.content.lessons[currentLessonIndex]
        
    }
    
    func hasNextLesson() -> Bool {
        return (currentLessonIndex+1 < currentModule!.content.lessons.count)
    }
    
    func nextLesson() {
        currentLessonIndex += 1
        if currentLessonIndex < currentModule!.content.lessons.count {
            currentLesson = currentModule!.content.lessons[currentLessonIndex]
        } else {
            currentLesson = nil
            currentLessonIndex = 0
        }
    }
    
}
