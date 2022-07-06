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
}

struct JSONReader {
    func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
}

extension Launch {
    static func localJSONExample() -> Launch {
        guard let data = JSONReader().readLocalFile(forName: "Launch") else {
            return Launch.example()
        }
        do {
            let localLaunch = try JSONDecoder().decode(Launch.self, from: data)
            return localLaunch
        } catch {
            return Launch.example()
        }
    }
    
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
                type: "Commercial",
                countryCode: "USA",
                description: "Rocket Lab is an American aerospace manufacturer with a wholly owned New Zealand subsidiary. The company develops lightweight, cost-effective commercial rocket launch services. The Electron Program was founded on the premise that small payloads such as CubeSats require dedicated small launch vehicles and flexibility not currently offered by traditional rocket systems. Its rocket, the Electron, is a light-weight rocket and is now operating commercially. Electron currently launches from only Mahia Peninsula in New Zealand however a second launch complex in the US is under development.",
                administrator: "CEO: Peter Beck",
                foundingYear: "2006",
                launchers: "Electron",
                spacecraft: "",
                launchLibraryUrl: "https://launchlibrary.net/1.4/agency/147",
                totalLaunchCount: 27,
                consecutiveSuccessfulLaunches: 7,
                successfulLaunches: 24,
                failedLaunches: 3,
                pendingLaunches: 13,
                consecutiveSuccessfulLandings: 0,
                successfulLandings: 3,
                failedLandings: 1,
                attemptedLandings: 4,
                infoUrl: "http://www.rocketlabusa.com/",
                wikiUrl: "http://en.wikipedia.org/wiki/Rocket_Lab",
                logoUrl: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/logo/rocket2520lab2520ltd_logo_20220218075411.png",
                imageUrl: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_images/rocket2520lab2520ltd_image_20190207032456.jpeg",
                nationUrl: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_nation/rocket2520lab2520ltd_nation_20190207032456.png"
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
            infoURLs: [],
            vidURLs: []
        )
    }
}
