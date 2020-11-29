//
//  LoginViewController.swift
//  APITest
//
//  Created by Peter Bassem on 11/29/20.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemRed
        
        let Url = String(format: "http://dars.in/api/v1/login")
        guard let serviceUrl = URL(string: Url) else { return }
        let parameterDictionary = ["email" : "kkk@kk.com", "password" : "kirolos123"]
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
//                    print(json)
                    DispatchQueue.main.async {
                        let tabBarVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabBarVC")
                        UIApplication.shared.windows.first?.rootViewController = tabBarVC
                        UIApplication.shared.windows.first?.makeKeyAndVisible()
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
