//
//  Photos.swift
//  InfiniteSearch
//
//  Created by Poonam on 22/03/25.
//

/*
 "photos": {
     "page": 1,
     "pages": 1557,
     "perpage": 100,
     "total": 155642,
     "photo": [
       {
         "id": "54399734847",
         "owner": "53731740@N07",
         "secret": "a86e156664",
         "server": "65535",
         "farm": 66,
         "title": "Epic Winter Panorama Grand Teton National Park Snowcapped Tetons Mountains Fine Art Landscape Nature Photography Jackson Wyoming Snow Teton Viewpoint! Fuji GFX100s Medium Format Fine Art Landscapes 45EPIC Elliot McGucken Master Luxury Photography WY Art",
         "ispublic": 1,
         "isfriend": 0,
         "isfamily": 0,
         "url_s": "https://live.staticflickr.com/65535/54399734847_a86e156664_m.jpg",
         "height_s": 101,
         "width_s": 240
       },
 */

struct Photos:Codable {
    var photos: Photo
}


struct Photo : Codable {
    var page: Int
    var pages: Int
    var perpage: Int
    var total: Int
    var photo : [NestedPhoto]
}

struct NestedPhoto: Codable, Identifiable, Sendable {
    var id: String
    var owner: String
    var secret: String
    var server: String
    var farm: Int
    var title: String
    var ispublic: Int
    var isfriend: Int
    var isfamily: Int
    var url_s: String
    var height_s: Int
    var width_s: Int
    
}
