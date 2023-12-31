//
//  HabitListView.swift
//  Habits


import SwiftUI

struct HabitListView: View {
    var habitItemList: [HabitItem]
    var onPressed: (HabitItem) -> Void

    var body: some View {
        ScrollView {
            ForEach(self.habitItemList) { habitItem in
                HabitRowView(habitItem: habitItem, onPressed: onPressed)
            }
        }
    }
}

struct HabitRowView: View {
    @ObservedObject var habitItem: HabitItem
    var onPressed: (HabitItem) -> Void
    
    var body: some View {
        Button(action: {
            self.onPressed(habitItem)
        }) {
            HStack {
                Rectangle()
                    .fill(habitItem.theme)
                    .frame(width: 10)
                
                Image(systemName: habitItem.iconName)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(habitItem.theme)
                    .padding(.trailing, 10)
                
                Text(habitItem.name)
                    .font(Font.system(size: 20))
                    .lineLimit(2)
                    .foregroundColor(.black)
                
                Spacer(minLength: 10)
                
                HStack(spacing: 5) {
                    ForEach(0..<7) { index in
                        Image(systemName: habitItem.checkList[index] ? "checkmark.circle" : "circle")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(habitItem.theme)
                    }
                }
            }
            .padding(EdgeInsets(top: 15, leading: 20, bottom: 0, trailing: 20))
        }
    }
}
