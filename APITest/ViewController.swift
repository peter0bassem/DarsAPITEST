//
//  ViewController.swift
//  APITest
//
//  Created by Peter Bassem on 11/29/20.
//

import UIKit

class ViewController: UIViewController {
    
    var token: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        
        DispatchQueue.global().async {
            print("home view from background..")
            let Url = String(format: "https://dars.in/api/v1/all-courses?statge_id=5")
            guard let serviceUrl = URL(string: Url) else { return }
            var request = URLRequest(url: serviceUrl)
            request.httpMethod = "POST"
            request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
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
}

