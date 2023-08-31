//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Emre Tekin on 31.08.2023.
//

import SwiftUI

struct NewTaskItemView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @Environment(\.managedObjectContext) private var viewContext
    @State private var task: String = ""
    @Binding var isShowing: Bool
    
    @FocusState private var taskIsFocused: Bool
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
            } catch {
                
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            
            task = ""
            isShowing = false
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                TextField("New Task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .focused($taskIsFocused)
                    .padding()
                    .background( isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button {
                    addItem()
                    playSound(sound: "sound-ding", type: "mp3")
                    feedback.notificationOccurred(.success)
                    taskIsFocused = false
                } label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                }
                .disabled(isButtonDisabled)
                .onTapGesture {
                    if isButtonDisabled {
                        playSound(sound: "sound-tap", type: "mp3")
                    }
                }
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .background(isButtonDisabled ? Color.blue : Color.pink)
                .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background( isDarkMode ?
                         Color(UIColor.secondarySystemBackground) :Color.white)
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        }
        .padding()
        
    }
}

struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
    }
}
