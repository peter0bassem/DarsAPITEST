//
//  LoginViewController.swift
//  APITest
//
//  Created by Peter Bassem on 11/29/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    var dispatchGroup = DispatchGroup()
    var loginDict: [String:Any]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemRed
        login()
//        homeAPI()
//        getData()
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            let tabBarVC = ViewController()
//            UIApplication.shared.windows.first?.rootViewController = tabBarVC
//            UIApplication.shared.windows.first?.makeKeyAndVisible()
//        }
    }
    
    func getData() {
        dispatchGroup.enter()
        login()
        dispatchGroup.leave()
        
        dispatchGroup.enter()
        homeAPI()
        dispatchGroup.leave()
        
        dispatchGroup.notify(queue: .main) {
            print("============")
            print("finished all tasks")
        }
    }
    
    func login() {
        let Url = String(format: "https://dars.in/api/v1/login")
        guard let serviceUrl = URL(string: Url) else { return }
        let parameterDictionary = ["email" : "kirolosalfy@gmail.com", "password" : "kirolos"]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    print("====================================================================")
                    guard let jsonDict = json as? [String:Any], let token = jsonDict["access_token"] as? String else { return }
                    self.loginDict = jsonDict
                    DispatchQueue.main.async {
                        let tabBarVC = ViewController()
                        tabBarVC.token = token
                        UIApplication.shared.windows.first?.rootViewController = tabBarVC
                        UIApplication.shared.windows.first?.makeKeyAndVisible()
                    }
//                    self.homeAPI()
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    func homeAPI() {
        let Url = String(format: "https://dars.in/api/v1/all-courses?statge_id=5")
        guard let serviceUrl = URL(string: Url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
//        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("Bearer \(token ?? "")", forHTTPHeaderField: "Authorization")
        
//        print("headers", request.allHTTPHeaderFields)
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
