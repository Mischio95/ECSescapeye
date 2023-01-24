//
//  CountriesAPIViewModel.swift
//  ECS
//
//  Created by Kiar on 17/01/23.
//

import Foundation

@MainActor
class CountriesData: ObservableObject
{
    @Published var nation: [CityApi]?
    {
        didSet
        {
            print(nation ?? "")
        }
    }
    let decoder = JSONDecoder()
    var urlComponents = URLComponents(string: "https://api.api-ninjas.com")
    let token = "IEJHrb7NFphvq/OQLwGvSg==Jw79ivRw0m6pla90"

    func getNation() async {
        do {

            urlComponents?.queryItems = [
                URLQueryItem(name: "name", value: "Napoli"),
                ]

            urlComponents?.path = "/v1/country"

            let url = urlComponents?.url

            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.setValue(token, forHTTPHeaderField: "X-Api-Key")


//            request.httpMethod = "GET"


            let (data, response) = try await  URLSession.shared.data(for: request)

            print(String(data: data, encoding: .utf8))


            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200 else { return }

            self.nation = try decoder.decode([CityApi].self, from: data)


        } catch {
            print(error)
        }
    }
    
//        @Published var countries: NasaJ? {
//            didSet {
//                print(countries)
//            }
//        }
//
//        let decoder = JSONDecoder()
//        var urlComponent = URLComponents(string: "https://api.nasa.gov/%22")
//
//        func getNation() async {
//            do{
//    //            urlComponent?.path = "/v2"
//                urlComponent?.queryItems = [
//                    URLQueryItem(name: "date", value: "1995-07-19"),
//                    URLQueryItem(name: "api_key", value: "gEeVimM5mRKCTrHL33hWlZTQsYiEFcvtpNqqb1T4"),
//                ]
//
//                urlComponent?.path = "/planetary/apod"
//
//
//
//                let url = urlComponent?.url
//
//                let request = URLRequest(url: url!)
//
//
//                let (data, response) = try await URLSession.shared.data(for: request)
//
//               // print(String(data: data, encoding: .utf8))
//
//
//                guard let response = response as? HTTPURLResponse,
//                      response.statusCode == 200 else { return }
//
//                self.countries = try decoder.decode(NasaJ.self, from: data)
//                print(countries?.date)
//
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
    }

