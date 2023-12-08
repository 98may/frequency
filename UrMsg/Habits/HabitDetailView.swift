//
//  HabitDetailView.swift
//  Habits


import SwiftUI

class DayOfWeek: Identifiable {
    var day: String = ""
    
    init(day: String) {
        self.day = day
    }
}

let dayList: [DayOfWeek]  = [
    DayOfWeek(day: "Mon"),
    DayOfWeek(day: "Tue"),
    DayOfWeek(day: "Wed"),
    DayOfWeek(day: "Thu"),
    DayOfWeek(day: "Fri"),
    DayOfWeek(day: "Sat"),
    DayOfWeek(day: "Sun"),
]

struct HabitDetailView: View {
    @Binding var habitItem: HabitItem

    var onDelete: (Int) -> Void
    var onDissmis: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("habit name").font(.title).padding(.top, 50)
                
                HStack {
                    Image(systemName: habitItem.iconName)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.trailing, 10)
                    Text(habitItem.name).font(.title)
                }.foregroundColor(habitItem.theme)
                
                Text("details").font(.title)
                
                ForEach(0 ..< 7) { index in
                    Toggle(isOn: self.$habitItem.checkList[index]) {
                        Text(dayList[index].day)
                    }
                }
                
                Spacer()
                
                Button(action: {
                    self.onDissmis()
                }) {
                    Text("record").frame(minWidth: 0, maxWidth: .infinity)
                }
                    .accentColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                
                Button(action: {
                    self.onDelete(self.habitItem.uuid)
                }) {
                    Text("delete").frame(minWidth: 0, maxWidth: .infinity)
                }
                    .accentColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
                
                
                Spacer(minLength: 50)
            }.padding(.leading, 20).padding(.trailing, 20)
            
        }
    }
}
