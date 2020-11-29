//
//  ViewController.swift
//  APITest
//
//  Created by Peter Bassem on 11/29/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
        
        let Url = String(format: "http://dars.in/api/v1/all-courses?statge_id=5")
        guard let serviceUrl = URL(string: Url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImZiMTYwYzY3OWI2NzkwZTUwNTdiYjMzM2E4MjNkMGJhZTNiNDZiNDM1ZmFiN2YwMjlkY2M3ZjY3MDg4MWU0OGYxN2E2OGM4Y2E0NWE2N2MxIn0.eyJhdWQiOiI5IiwianRpIjoiZmIxNjBjNjc5YjY3OTBlNTA1N2JiMzMzYTgyM2QwYmFlM2I0NmI0MzVmYWI3ZjAyOWRjYzdmNjcwODgxZTQ4ZjE3YTY4YzhjYTQ1YTY3YzEiLCJpYXQiOjE2MDY2NDA5MzMsIm5iZiI6MTYwNjY0MDkzMywiZXhwIjoxNjM4MTc2OTMzLCJzdWIiOiI0NyIsInNjb3BlcyI6W119.f2o4SmnKIZ6jtGUagDuSoo4iBSOvT3jx3hzp1trrwUEFHy7hGo_jJ-y68OKJJ0sEXQlvzhmd_TBCwSQk04lxlREEcIIFwMLbjCB1D2FcZRm5cqH-RmXXoF5gWv9pYZ5pXFV9LEK78CFZ4bdrWz7v_h3USaNK_J-PCSUUSvF_o-J9kNlmANcU16vG995bFxuFY-3LLuT70PddiuQOCGJ-IiWjcJViNZQ208UbnAj3Qrt65-Wqr2-KRgQEgX7xJBpGOs7Vac0DDj04Nbtmi_g8wm8nenj7LrkIa8FWOYW20u6sNMEIGOIyNFuCd_hCkvka7Co2Gev1r2zkuRm07lzNWeXfyM39HgpCmpDUDFGqfa1Ad4EtwM9vBdU3E4Ep4SmCUgK0xt2kUQl0fMd64sPNK5O-kglrdmWBbXkt5XEhlmfa-1C1WzEX-41GU6IzpAII-2mFqBL1WkQta5rCGF9kz9uFOhyKfjwOBwgB_-9khbylIB12FnRsblyLBnHZKcxMmPp3OrGAu1jFJyPXE3916fsKCWUIRFiquGx0NKIFVu8QOSRMWjtB3MUgKVVbUlChXp4G7nCE5-PLJItjzI5O9srcZVuhod1FszoU1Pvmb7sMpaXP8NYU5fz_uzYNftY1WZTfBQt_HjEOkvHiNI-aMVsB0pe04_n7n9YKQxKRQpw", forHTTPHeaderField: "Authorization")
        
//        print(request.headers)
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

