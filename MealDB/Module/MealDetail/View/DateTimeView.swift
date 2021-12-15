//
//  DateTimeView.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 15/12/21.
//

import SwiftUI
import UserNotifications
import PartialSheet

struct DateTimeView: View {
    @State var selectedDate = Date()
    @ObservedObject var presenter: MealDetailPresenter
    @EnvironmentObject var partialSheetManager: PartialSheetManager
    
    var body: some View {
        VStack {
            Text("Choose date for remember to cook")
                .font(.title3)
                .bold()
                .foregroundColor(.black)
            DatePicker("", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute]).frame(alignment:.center)
            
            Button(action: {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("authorization granted")
                    }
                }
                
                let content = UNMutableNotificationContent()
                content.title = "MealDB"
                content.subtitle = self.presenter.nameMeal
                content.body = "Let's cook now"
                content.sound = UNNotificationSound.default
                
                var dateInfo = DateComponents()
                dateInfo.day = Calendar.current.dateComponents([.day], from: selectedDate).day ?? 0
                dateInfo.month = Calendar.current.dateComponents([.month], from: selectedDate).month ?? 0
                dateInfo.year = Calendar.current.dateComponents([.year], from: selectedDate).year ?? 0
                dateInfo.hour = Calendar.current.dateComponents([.hour], from: selectedDate).hour ?? 0
                dateInfo.minute = Calendar.current.dateComponents([.minute], from: selectedDate).minute ?? 0
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                
                UNUserNotificationCenter.current().add(request)
                
                self.partialSheetManager.closePartialSheet()
            }) {
                HStack(alignment: .bottom) {
                    Text("Set Reminder")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                }.padding(16)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .circular))
            }.padding(.top, 32)
        }.padding()
    }
}
