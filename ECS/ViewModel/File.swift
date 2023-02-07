import SwiftUI

@MainActor
class CountriesNetwork: ObservableObject{
    @Published var nations: [CountriesAPIElements]?
    var nationSelected = CityViewModel()
    let decoder = JSONDecoder()
    var urlComponents = URLComponents(string: "https://api.api-ninjas.com")
    let token = "IEJHrb7NFphvq/OQLwGvSg==Jw79ivRw0m6pla90"

    func getNation() async {
        do {
            for index in (0...nationSelected.nationsForApi.count)
            {
                urlComponents?.queryItems = [
                    URLQueryItem(name: "name", value: nationSelected.nationsForApi[index]),
                ]
            }
            urlComponents?.path = "/v1/country"
            let url = urlComponents?.url
            var request = URLRequest(url: url!)
            request.httpMethod = "GET"
            request.setValue(token, forHTTPHeaderField: "X-Api-Key")

            let (data, response) = try await  URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200 else { return }
            self.nations = try decoder.decode([CountriesAPIElements].self, from: data)
            
        } catch {
            print(error)
        }
    }
}
