//
//  MealDBApp.swift
//  MealDB
//
//  Created by Lingga Kusuma Sakti on 17/10/21.
//

import SwiftUI
import Firebase
import PartialSheet
import GoogleSignIn

@main
struct MealDBApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let injection = Injection()
    
    let homeUseCase = Injection.init().provideHome()
    let searchUseCase = Injection.init().provideSearhMeal()
    
    var homePresenter: HomePresenter{ HomePresenter(homeUseCase: homeUseCase)}
    var searchPresenter: SearchPresenter { SearchPresenter(searchUseCase: searchUseCase)}
    
    let sheetManager: PartialSheetManager = PartialSheetManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(homePresenter)
                .environmentObject(searchPresenter)
                .environmentObject(sheetManager)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
