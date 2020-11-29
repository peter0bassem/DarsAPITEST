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
        
        let Url = String(format: "https://dars.in/api/v1/all-courses?statge_id=5")
        guard let serviceUrl = URL(string: Url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjhkMWU0MWI3ZTY4MjEzYTJkODk3ZWUyNjhmYTIzNjA4NzFmMjU3NDI5OGExYTVkNmE1NTc0ZTA2NzQyNjE1MThjMGE0MDIzNzcwYWY2MTU5In0.eyJhdWQiOiI5IiwianRpIjoiOGQxZTQxYjdlNjgyMTNhMmQ4OTdlZTI2OGZhMjM2MDg3MWYyNTc0Mjk4YTFhNWQ2YTU1NzRlMDY3NDI2MTUxOGMwYTQwMjM3NzBhZjYxNTkiLCJpYXQiOjE2MDY2NTgzMjUsIm5iZiI6MTYwNjY1ODMyNSwiZXhwIjoxNjM4MTk0MzI1LCJzdWIiOiI0NyIsInNjb3BlcyI6W119.HSoxjIWkiYW4YrZ-2ujBqsWV3MujoojiK1f9mEUMYxxWAFEDSwh7rWWTRJZgANuFLrPvDNbPXrJg25iaRa5rLjhcJv6iHtKlOEaHtbUkdzym1SKfg39KXK0H1gTiSLeGFEwXrt9nBQJ45qPeFR3tvkGxw1aXx0pRWSFbNfgop-P808hPvw_e6kSZu_XdCVdBrlRbK8VPAI6Pcc_cWl9WX4H4TqZVJyFsvisslz9Kmfjm30Td7VKDh7GMV0ooh9sUaziHTmB1kzcOYwWlLg_caNAs2eQ_o3Q1wSj9tk_TgNyDTBxzSZmAkCd3nw3mP2ot-hN6QmiTHCKno1yUm1wav24KnDvdGXb2ZoEPrFw-qlaLJq-hz8JmTuP8eNwtcCJXQpEhVIVvXWJdByxD1S2dPSRCfXN_lMIi-mehdZcbnPUh2d7buyk65luS9pmkIblP4qvUI_E9e4KZ-TBBvTPgiTIpIkm5acB7r4H8jr8w7LrVxBGI4L90KqFc_EiLf1CwHtqTAe_rM8cOch060q_APfmK-P5FrI-4ZjuUcKkfQCstxU8bHIz1f77_h5xv5SpkZh00l1_ev5gA2QSPdKnmRxbPH3mxKQhV5w77_LGSQyZKzvyFuGg8kSwBmXaNZT03wzJAnCMai0pq24dnd1jXYx4UE_1dDiiw75tdYV0zIaw", forHTTPHeaderField: "Authorization")
        
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

