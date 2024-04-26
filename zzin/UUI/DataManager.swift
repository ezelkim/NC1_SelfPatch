//
//  DataManager.swift
//  SelfPatch
//
//  Created by Kim minju  on 4/18/24.
//

import SwiftUI
import Foundation
import CoreData

class DataManager: ObservableObject {
    private let container: NSPersistentContainer
    @Published var Title: [Selfpatch1] = []
    
    init() {
        container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Core Data stores failed to load with error: \(error.localizedDescription)")
            }
        }
        fetchDiaryEntries()
    }
    
    func saveDiaryEntry(title: String, subtitle: String, date: Date, location: String, pictureData: Data?) {
        let context = container.viewContext
        let diaryEntry = Selfpatch1(context: context)
        diaryEntry.title = title
        diaryEntry.subtitle = subtitle
        diaryEntry.date = date
        diaryEntry.location = location
        diaryEntry.picture = pictureData
        
        do {
            try context.save()
            fetchDiaryEntries() // 업데이트된 다이어리 항목들을 다시 불러옴
        } catch {
            print("Error saving diary entry: \(error.localizedDescription)")
        }
    }
    
    func fetchDiaryEntries() {
        let request: NSFetchRequest<Selfpatch1> = Selfpatch1.fetchRequest()
        
        do {
            Title = try container.viewContext.fetch(request)
        } catch {
            print("Error fetching diary entries: \(error.localizedDescription)")
        }
    }
    
    func updateDiaryEntry(_ diaryEntry: Selfpatch1, withTitle title: String, subtitle: String, date: Date, location: String, pictureData: Data?) {
        let context = container.viewContext
        diaryEntry.title = title
        diaryEntry.subtitle = subtitle
        diaryEntry.date = date
        diaryEntry.location = location
        diaryEntry.picture = pictureData
        
        do {
            try context.save()
            fetchDiaryEntries() // 수정 후 다시 불러옴
        } catch {
            print("Error updating diary entry: \(error.localizedDescription)")
        }
    }

    func deleteDiaryEntry(_ diaryEntry: Selfpatch1) {
        let context = container.viewContext
        context.delete(diaryEntry) // diaryEntry 객체를 삭제합니다.
        
        do {
            try context.save()
            fetchDiaryEntries() // 삭제 후 다시 불러옴
        } catch {
            print("Error deleting diary entry: \(error.localizedDescription)")
        }
    }
}
