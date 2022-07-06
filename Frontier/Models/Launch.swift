//
//  Launch.swift
//  Frontier
//
//  Created by Songyee Park on 2022/06/23.
//

import Foundation

struct Launch: Codable, Identifiable {
    let id: String
    let url: String?
    let name: String?
    let status: LaunchStatus?
    let lastUpdated: String?
    let net: String?
    let launchServiceProvider: LaunchServiceProvider?
    let rocket: Rocket?
    let mission: Mission?
    let pad: Pad?
    let webcastLive: Bool?
    let image: String?
    let infoURLs: [InfoURL]?
    let vidURLs: [VidURL]?
    
    static func example() -> Launch {
        return Launch(
            id: "859bf952-b4c6-40fb-a7e7-ac12efc386b2",
            url: "https://ll.thespacedevs.com/2.2.0/launch/859bf952-b4c6-40fb-a7e7-ac12efc386b2/",
            name: "Electron | CAPSTONE",
            status: LaunchStatus(
                id: 1,
                name: "Go for Launch",
                abbrev: "Go",
                description: "Current T-0 confirmed by official or reliable sources."
            ),
            lastUpdated: "2022-06-23T23:03:48Z",
            net: "2022-06-30T09:50:00Z",
            launchServiceProvider: LaunchServiceProvider(
                id: 147,
                url: "https://ll.thespacedevs.com/2.2.0/agencies/147/",
                name: "Rocket Lab Ltd",
                type: "Commercial"
            ),
            rocket: Rocket(
                id: 2665,
                configuration: Rocket.Configuration(
                    id: 26,
                    url: "https://ll.thespacedevs.com/2.2.0/config/launcher/26/",
                    name: "Electron",
                    description: "Electron is a two-stage orbital expendable launch vehicle (with an optional third stage) developed by the American aerospace company Rocket Lab. Electron is a small-lift launch vehicle designed to launch small satellites and cubesats to sun-synchronous orbit and low earth orbit. The Electron is the first orbital class rocket to use electric-pump-fed engines, powered by the 9 Rutherford engines on the first stage."
                )
            ),
            mission: Mission(
                id: 1085,
                name: "CAPSTONE",
                description: "CAPSTONE (Cislunar Autonomous Positioning System Technology Operations and Navigation Experiment) is a 12-U cubesat mission to test operations in near rectiliniar halo orbit around the Moon, which is to be used for the Lunar Gateway space station. Mission will verify the  near rectilinear halo orbit characteristics, spacecraft-to-spacecraft navigation services in that orbit, and provide valuable experience of small sat launch to the Moon.",
                launchDesignator: nil,
                type: "Planetary Science",
                orbit: Mission.Orbit(
                    id: 11,
                    name: "Lunar Orbit",
                    abbrev: "LO")
            ),
            pad: Pad(
                id: 185,
                url: "https://ll.thespacedevs.com/2.2.0/pad/185/",
                agencyId: 147,
                name: "Rocket Lab Launch Complex 1B",
                infoUrl: nil,
                wikiUrl: "https://en.wikipedia.org/wiki/Rocket_Lab_Launch_Complex_1",
                mapUrl: "https://www.google.com/maps/place/-39.262833,177.864469",
                latitude: "-39.262833",
                longitude: "177.864469",
                location: Pad.Location(
                    id: 10,
                    url: "https://ll.thespacedevs.com/2.2.0/location/10/",
                    name: "Onenui Station, Mahia Peninsula, New Zealand",
                    countryCode: "NZL",
                    mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_10_20200803142509.jpg",
                    totalLaunchCount: 26,
                    totalLandingCount: 4
                ),
                mapImage: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_185_20200803143540.jpg",
                totalLaunchCount: 1
            ),
            webcastLive: true,
            image: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/electron_image_20190705175640.jpeg",
            infoURLs: [
                // InfoURL(priority: 10, title: <#T##String?#>, description: <#T##String?#>, featureImage: <#T##String?#>, url: <#T##String?#>)
            ],
            vidURLs: []
        )
    }
}

struct LaunchSerializer: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Launch]
}

struct LaunchStatus: Codable, Identifiable {
    let id: Int
    let name: String?
    let abbrev: String?
    let description: String?
}

struct LaunchServiceProvider: Codable, Identifiable {
    let id: Int
    let url: String?
    let name: String?
    let type: String?
    
//    let countryCode: String?
//    let description: String?
//    let administrator: String?
//    let foundingYear: String?
//    let launchers: String?
//    let spacecraft: String?
//    let launchLibraryUrl: String?
//
//    let totalLaunchCount: Int?
//    let consecutiveSuccessfulLaunches: Int?
//    let successfulLaunches: Int?
//    let failedLaunches: Int?
//    let pendingLaunches: Int?
//    let failedLandings: Int?
//    let attemptedLandings: Int?
//
//    let infoUrl: String?
//    let wikiUrl: String?
//    let logoUrl: String?
//    let imageUrl: String?
//    let nationUrl: String?
}

struct Rocket: Codable, Identifiable {
    let id: Int
    let configuration: Configuration?
    
    struct Configuration: Codable, Identifiable {
        let id: Int
        let url: String?
        let name: String?
        let description: String?
    }
}

struct Mission: Codable, Identifiable {
    let id: Int
    let name: String?
    let description: String?
    let launchDesignator: String?
    let type: String?
    let orbit: Orbit?
    
    struct Orbit: Codable, Identifiable {
        let id: Int
        let name: String?
        let abbrev: String?
    }
}

struct Pad: Codable, Identifiable {
    let id: Int
    let url: String?
    let agencyId: Int?
    let name: String?
    let infoUrl: String?
    let wikiUrl: String?
    let mapUrl: String?
    let latitude: String?
    let longitude: String?
    let location: Location?
    let mapImage: String?
    let totalLaunchCount: Int?
    
    struct Location: Codable, Identifiable {
        let id: Int
        let url: String?
        let name: String?
        let countryCode: String?
        let mapImage: String?
        let totalLaunchCount: Int
        let totalLandingCount: Int
    }
}

/*
 {
       "id": "859bf952-b4c6-40fb-a7e7-ac12efc386b2",
       "url": "https://ll.thespacedevs.com/2.2.0/launch/859bf952-b4c6-40fb-a7e7-ac12efc386b2/",
       "slug": "electron-capstone",
       "name": "Electron | CAPSTONE",
       "status": {
         "id": 1,
         "name": "Go for Launch",
         "abbrev": "Go",
         "description": "Current T-0 confirmed by official or reliable sources."
       },
       "last_updated": "2022-06-23T23:03:48Z",
       "net": "2022-06-27T09:50:00Z",
       "window_end": "2022-06-27T09:50:00Z",
       "window_start": "2022-06-27T09:50:00Z",
       "probability": -1,
       "holdreason": "",
       "failreason": "",
       "hashtag": null,
       "launch_service_provider": {
         "id": 147,
         "url": "https://ll.thespacedevs.com/2.2.0/agencies/147/",
         "name": "Rocket Lab Ltd",
         "type": "Commercial"
       },
       "rocket": {
         "id": 2665,
         "configuration": {
           "id": 26,
           "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/26/",
           "name": "Electron",
           "family": "Electron",
           "full_name": "Electron",
           "variant": ""
         }
       },
       "mission": {
         "id": 1085,
         "name": "CAPSTONE",
         "description": "CAPSTONE (Cislunar Autonomous Positioning System Technology Operations and Navigation Experiment) is a 12-U cubesat mission to test operations in near rectiliniar halo orbit around the Moon, which is to be used for the Lunar Gateway space station. Mission will verify the  near rectilinear halo orbit characteristics, spacecraft-to-spacecraft navigation services in that orbit, and provide valuable experience of small sat launch to the Moon.",
         "launch_designator": null,
         "type": "Planetary Science",
         "orbit": {
           "id": 11,
           "name": "Lunar Orbit",
           "abbrev": "LO"
         }
       },
       "pad": {
         "id": 185,
         "url": "https://ll.thespacedevs.com/2.2.0/pad/185/",
         "agency_id": 147,
         "name": "Rocket Lab Launch Complex 1B",
         "info_url": null,
         "wiki_url": "https://en.wikipedia.org/wiki/Rocket_Lab_Launch_Complex_1",
         "map_url": "https://www.google.com/maps/place/-39.262833,177.864469",
         "latitude": "-39.262833",
         "longitude": "177.864469",
         "location": {
           "id": 10,
           "url": "https://ll.thespacedevs.com/2.2.0/location/10/",
           "name": "Onenui Station, Mahia Peninsula, New Zealand",
           "country_code": "NZL",
           "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_10_20200803142509.jpg",
           "total_launch_count": 26,
           "total_landing_count": 4
         },
         "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_185_20200803143540.jpg",
         "total_launch_count": 1
       },
       "webcast_live": false,
       "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/electron_image_20190705175640.jpeg",
       "infographic": null,
       "program": []
     }
 */
