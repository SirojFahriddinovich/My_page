//
//  API.swift
//  Examen_Last
//
//  Created by Macbook Air on 23/04/22.
//

import UIKit

//enum MyPath : String {
//
//    case news = "api/v1/news"
//    case bottomAnnouncement = "api/v1/announcement"
//    case topAnnouncement = "api/v1/announcement/random-recommended-new-building"
//    case developers = "api/v1/developer"
//    case cellType = "api/v1/sell-type"
//
//}

class API {
    
    static let shared = API()
    
    let base = "https://aparto.albison.software/"
    let celltypeUrl = URL(string: "https://aparto.albison.software/api/v1/sell-type")
    let complexUrl = URL(string: "https://aparto.albison.software/api/v1/announcement")
    let popularUrl = URL(string: "https://aparto.albison.software/api/v1/announcement/random-recommended-new-building")
    let developerUrl = URL(string: "https://aparto.albison.software/api/v1/developer")
    let newsUrl = URL(string: "https://aparto.albison.software/api/v1/news")
    
    
    let houseImgs = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "4"),UIImage(named: "5"),UIImage(named: "12"),UIImage(named: "13"),UIImage(named: "14"),UIImage(named: "14"),UIImage(named: "16"),UIImage(named: "7"),UIImage(named: "8"),UIImage(named: "9"),UIImage(named: "10"),UIImage(named: "15"),UIImage(named: "11")]
    
    let popularHouses = [UIImage(named: "20"),UIImage(named: "21"),UIImage(named: "23")]
    
    
    ///Get type from API. This function returns CellTypeDM
    func getCellType(comleation : @escaping ([CellTypeDM]) -> Void) {
        
        Req.shared.getApiDetelies(base_url: celltypeUrl!, method: .get) { data in
            if let data = data {
                var cellType = [CellTypeDM]()
                for i in data["data"].arrayValue {
                    let type = CellTypeDM(name: i["name"]["ru"].stringValue, seo: i["seo"].stringValue)
                    cellType.append(type)
                }
                comleation(cellType)
            } else {
                print("[][][][]")
                comleation([])
            }
        }
    }
    
    ///Hanging houses for sale from API
    func getComplexHouse(compleation : @escaping ([ComplexDM]) -> Void) {
        
        Req.shared.getApiDetelies(base_url: complexUrl!, method: .get) { data in
            if let data = data {
                var complexses = [ComplexDM]()
                for i in data["data"].arrayValue.enumerated() {
                    let house = ComplexDM(image: self.houseImgs[i.offset]!, price: i.element["price"]["amount"].stringValue, title: i.element["title"].stringValue, status: i.element["status"].stringValue)
                    complexses.append(house)
                }
                compleation(complexses)
            } else {
                print("[][][][]")
                compleation([])
            }
        }
    }
    
    ///Hanging popular houses for sale from API
    func getPopularHouse(compleation : @escaping ([PopularDM]) -> Void) {
        
        Req.shared.getApiDetelies(base_url: popularUrl!, method: .get) { data in
            if let data = data {
                var populars = [PopularDM]()
                for i in data["data"].arrayValue{
                    let house = PopularDM(image: (self.popularHouses.randomElement() ?? UIImage(named: "32"))!, price: "\(i["minPrice"].stringValue) - \(i["maxPrice"].stringValue) сум / м²", title: i["title"].stringValue, status: i["status"].stringValue)
                    populars.append(house)
                }
                compleation(populars)
            } else {
                compleation([])
            }
        }
    }
    
    ///
    func getDeveloperDetails(compleation : @escaping ([DeveloperDM]) -> Void) {
        
        Req.shared.getApiDetelies(base_url: developerUrl!, method: .get) { dev in
            if let dev = dev {
                var devs = [DeveloperDM]()
                for i in dev["data"].arrayValue {
                    let dev = DeveloperDM(name: i["firstName"].stringValue, desc: i["officeDescription"].stringValue, phone: i["phoneNumber"].stringValue)
                    devs.append(dev)
                }
                compleation(devs)
            } else {
                compleation([])
            }
        }
        
    }
    
    ///
    func getNews(compleation : @escaping ([NewsDM]) -> Void) {
        
        Req.shared.getApiDetelies(base_url: newsUrl!, method: .get) { data in
            if let news = data {
                var newsArr = [NewsDM]()
                for i in news["data"].arrayValue {
                    let new = NewsDM(title: i["title"]["ru"].stringValue, desc: i["description"]["ru"].stringValue)
                    newsArr.append(new)
                }
                compleation(newsArr)
            } else {
                compleation([])
            }
        }
    }
}
