//
//  LaunchDetailed.swift
//  Frontier
//
//  Created by Songyee Park on 2022/07/05.
//

import Foundation

struct LaunchDetailed: Codable, Identifiable {
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


struct InfoURL: Codable {
    let priority: Int?
    let title: String?
    let description: String?
    let featureImage: String?
    let url: String?
}

struct VidURL: Codable {
    let priority: Int?
    let title: String?
    let description: String?
    let featureImage: String?
    let url: String?
}





/*
 {
   "id": "859bf952-b4c6-40fb-a7e7-ac12efc386b2",
   "url": "https://ll.thespacedevs.com/2.2.0/launch/859bf952-b4c6-40fb-a7e7-ac12efc386b2/",
   "slug": "electron-capstone",
   "flightclub_url": "https://flightclub.io/result?llId=859bf952-b4c6-40fb-a7e7-ac12efc386b2",
   "r_spacex_api_id": null,
   "name": "Electron | CAPSTONE",
   "status": {
     "id": 3,
     "name": "Launch Successful",
     "abbrev": "Success",
     "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
   },
   "last_updated": "2022-06-28T10:17:04Z",
   "updates": [
     {
       "id": 1991,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/nosudrum_profile_20210217201305.jpg",
       "comment": "Successful Electron launch. Photon's HyperCurie engine will perform apogee raising burns around every 24 hours for five days, before a final burn on the sixth day to set CAPSTONE on a trans lunar injection",
       "info_url": "https://twitter.com/Peter_J_Beck/status/1541725018282795008",
       "created_by": "Nosu",
       "created_on": "2022-06-28T10:17:04Z"
     },
     {
       "id": 1990,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/nosudrum_profile_20210217201305.jpg",
       "comment": "Liftoff",
       "info_url": "https://www.youtube.com/watch?v=JGx400xCDVY",
       "created_by": "Nosu",
       "created_on": "2022-06-28T09:56:16Z"
     },
     {
       "id": 1989,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/nosudrum_profile_20210217201305.jpg",
       "comment": "Webcast live",
       "info_url": "https://www.youtube.com/watch?v=JGx400xCDVY",
       "created_by": "Nosu",
       "created_on": "2022-06-28T09:00:41Z"
     },
     {
       "id": 1988,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/jay_profile_20211216212147.png",
       "comment": "Weather 75%",
       "info_url": "https://twitter.com/rocketlab/status/1541612294429257729",
       "created_by": "Jay",
       "created_on": "2022-06-28T02:47:22Z"
     },
     {
       "id": 1984,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/jay_profile_20211216212147.png",
       "comment": "Adjusting T-0",
       "info_url": "https://blogs.nasa.gov/artemis/2022/06/27/capstone-launch-targeting-june-28/",
       "created_by": "Jay",
       "created_on": "2022-06-27T14:04:03Z"
     },
     {
       "id": 1977,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/cosmic2520penguin_profile_20210817212020.png",
       "comment": "NET June 28",
       "info_url": "https://twitter.com/nasaspaceflight/status/1541077963294359552?s=21&t=rQLuxOvdj18ykKQSZKHKwQ",
       "created_by": "Cosmic_Penguin",
       "created_on": "2022-06-26T15:19:08Z"
     },
     {
       "id": 1949,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/nosudrum_profile_20210217201305.jpg",
       "comment": "Updating T-0",
       "info_url": "https://www.youtube.com/watch?v=JGx400xCDVY",
       "created_by": "Nosu",
       "created_on": "2022-06-24T06:12:15Z"
     },
     {
       "id": 1945,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/cosmic2520penguin_profile_20210817212020.png",
       "comment": "NET June 27",
       "info_url": "https://twitter.com/nasaames/status/1539777532366651392?s=21&t=pGeFwQtquThwCTGNVi2edQ",
       "created_by": "Cosmic_Penguin",
       "created_on": "2022-06-23T02:30:45Z"
     },
     {
       "id": 1911,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/nosudrum_profile_20210217201305.jpg",
       "comment": "Adding T-0 and setting GO",
       "info_url": "https://www.rocketlabusa.com/assets/Uploads/CAPSTONE-Launch-Press-Kit2.pdf",
       "created_by": "Nosu",
       "created_on": "2022-06-16T20:32:30Z"
     },
     {
       "id": 1838,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/nosudrum_profile_20210217201305.jpg",
       "comment": "NET June 25",
       "info_url": "https://terranorbital.com",
       "created_by": "Nosu",
       "created_on": "2022-06-08T21:49:29Z"
     },
     {
       "id": 1837,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/nosudrum_profile_20210217201305.jpg",
       "comment": "No longer targeting June 13. Reverting to TBD June.",
       "info_url": "https://blogs.nasa.gov/artemis/2022/06/08/capstone-mission-launch-no-longer-targeting-june-13/",
       "created_by": "Nosu",
       "created_on": "2022-06-08T21:41:42Z"
     },
     {
       "id": 1770,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/nosudrum_profile_20210217201305.jpg",
       "comment": "T-0 confirmed",
       "info_url": "https://www.rocketlabusa.com/assets/Uploads/CAPSTONE-Launch-Press-Kit.pdf",
       "created_by": "Nosu",
       "created_on": "2022-06-02T14:23:39Z"
     },
     {
       "id": 1759,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/jay_profile_20211216212147.png",
       "comment": "NET June 13 to allow additional time for final prelaunch checks",
       "info_url": "https://twitter.com/RocketLab/status/1531757057698693120",
       "created_by": "Jay",
       "created_on": "2022-05-31T22:05:31Z"
     },
     {
       "id": 1734,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/nosudrum_profile_20210217201305.jpg",
       "comment": "Adding T-0",
       "info_url": "https://spaceflightnow.com/launch-schedule/",
       "created_by": "Nosu",
       "created_on": "2022-05-25T07:23:17Z"
     },
     {
       "id": 1717,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/swgustav_profile_20210218062738.jpg",
       "comment": "NET June 6th",
       "info_url": "https://twitter.com/RocketLab/status/1527777789545283584",
       "created_by": "SwGustav",
       "created_on": "2022-05-20T22:35:48Z"
     },
     {
       "id": 1669,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/swgustav_profile_20210218062738.jpg",
       "comment": "NET May 31st",
       "info_url": "https://twitter.com/NASAAmes/status/1524490053233352704",
       "created_by": "SwGustav",
       "created_on": "2022-05-11T20:54:50Z"
     },
     {
       "id": 1639,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/cosmic2520penguin_profile_20210817212020.png",
       "comment": "NET May 27",
       "info_url": "https://twitter.com/jeff_foust/status/1521199148585963525",
       "created_by": "Cosmic_Penguin",
       "created_on": "2022-05-02T22:14:33Z"
     },
     {
       "id": 1315,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/cosmic2520penguin_profile_20210817212020.png",
       "comment": "NET Spring",
       "info_url": "https://spacenews.com/capstone-lunar-cubesat-mission-to-launch-this-spring/",
       "created_by": "Cosmic_Penguin",
       "created_on": "2022-02-23T00:47:52Z"
     },
     {
       "id": 877,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/spacevogel_profile_20210217192809.jpg",
       "comment": "Launch is NET March 2022.",
       "info_url": "https://twitter.com/NASAAmes/status/1448343622399799303",
       "created_by": "spacevogel",
       "created_on": "2021-10-13T19:33:59Z"
     },
     {
       "id": 871,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/nosudrum_profile_20210217201305.jpg",
       "comment": "Launch now NET early 2022",
       "info_url": "https://twitter.com/jeff_foust/status/1448030403143421952",
       "created_by": "Nosu",
       "created_on": "2021-10-12T21:06:34Z"
     },
     {
       "id": 712,
       "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/spacevogel_profile_20210217192809.jpg",
       "comment": "Launch pad changed from Rocket Lab's launch site in Wallops, Virginia to the one in New Zealand.",
       "info_url": "https://www.rocketlabusa.com/about-us/updates/rocket-lab-to-launch-nasa-funded-commercial-moon-mission-from-new-zealand",
       "created_by": "spacevogel",
       "created_on": "2021-08-06T19:30:08Z"
     }
   ],
   "net": "2022-06-28T09:55:52Z",
   "window_end": "2022-06-28T09:55:52Z",
   "window_start": "2022-06-28T09:55:52Z",
   "probability": 75,
   "holdreason": "",
   "failreason": "",
   "hashtag": null,
   "launch_service_provider": {
     "id": 147,
     "url": "https://ll.thespacedevs.com/2.2.0/agencies/147/",
     "name": "Rocket Lab Ltd",
     "featured": true,
     "type": "Commercial",
     "country_code": "USA",
     "abbrev": "RL",
     "description": "Rocket Lab is an American aerospace manufacturer with a wholly owned New Zealand subsidiary. The company develops lightweight, cost-effective commercial rocket launch services. The Electron Program was founded on the premise that small payloads such as CubeSats require dedicated small launch vehicles and flexibility not currently offered by traditional rocket systems. Its rocket, the Electron, is a light-weight rocket and is now operating commercially. Electron currently launches from only Mahia Peninsula in New Zealand however a second launch complex in the US is under development.",
     "administrator": "CEO: Peter Beck",
     "founding_year": "2006",
     "launchers": "Electron",
     "spacecraft": "",
     "launch_library_url": "https://launchlibrary.net/1.4/agency/147",
     "total_launch_count": 27,
     "consecutive_successful_launches": 7,
     "successful_launches": 24,
     "failed_launches": 3,
     "pending_launches": 13,
     "consecutive_successful_landings": 0,
     "successful_landings": 3,
     "failed_landings": 1,
     "attempted_landings": 4,
     "info_url": "http://www.rocketlabusa.com/",
     "wiki_url": "http://en.wikipedia.org/wiki/Rocket_Lab",
     "logo_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/logo/rocket2520lab2520ltd_logo_20220218075411.png",
     "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_images/rocket2520lab2520ltd_image_20190207032456.jpeg",
     "nation_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_nation/rocket2520lab2520ltd_nation_20190207032456.png"
   },
   "rocket": {
     "id": 2665,
     "configuration": {
       "id": 26,
       "url": "https://ll.thespacedevs.com/2.2.0/config/launcher/26/",
       "name": "Electron",
       "description": "Electron is a two-stage orbital expendable launch vehicle (with an optional third stage) developed by the American aerospace company Rocket Lab. Electron is a small-lift launch vehicle designed to launch small satellites and cubesats to sun-synchronous orbit and low earth orbit. The Electron is the first orbital class rocket to use electric-pump-fed engines, powered by the 9 Rutherford engines on the first stage.",
       "family": "Electron",
       "full_name": "Electron",
       "manufacturer": {
         "id": 147,
         "url": "https://ll.thespacedevs.com/2.2.0/agencies/147/",
         "name": "Rocket Lab Ltd",
         "featured": true,
         "type": "Commercial",
         "country_code": "USA",
         "abbrev": "RL",
         "description": "Rocket Lab is an American aerospace manufacturer with a wholly owned New Zealand subsidiary. The company develops lightweight, cost-effective commercial rocket launch services. The Electron Program was founded on the premise that small payloads such as CubeSats require dedicated small launch vehicles and flexibility not currently offered by traditional rocket systems. Its rocket, the Electron, is a light-weight rocket and is now operating commercially. Electron currently launches from only Mahia Peninsula in New Zealand however a second launch complex in the US is under development.",
         "administrator": "CEO: Peter Beck",
         "founding_year": "2006",
         "launchers": "Electron",
         "spacecraft": "",
         "launch_library_url": "https://launchlibrary.net/1.4/agency/147",
         "total_launch_count": 27,
         "consecutive_successful_launches": 7,
         "successful_launches": 24,
         "failed_launches": 3,
         "pending_launches": 13,
         "consecutive_successful_landings": 0,
         "successful_landings": 3,
         "failed_landings": 1,
         "attempted_landings": 4,
         "info_url": "http://www.rocketlabusa.com/",
         "wiki_url": "http://en.wikipedia.org/wiki/Rocket_Lab",
         "logo_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/logo/rocket2520lab2520ltd_logo_20220218075411.png",
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_images/rocket2520lab2520ltd_image_20190207032456.jpeg",
         "nation_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_nation/rocket2520lab2520ltd_nation_20190207032456.png"
       },
       "program": [],
       "variant": "",
       "alias": "",
       "min_stage": 2,
       "max_stage": 3,
       "length": 18,
       "diameter": 1.2,
       "maiden_flight": "2017-05-25",
       "launch_cost": "6000000",
       "launch_mass": 13,
       "leo_capacity": 300,
       "gto_capacity": null,
       "to_thrust": 162,
       "apogee": null,
       "vehicle_range": null,
       "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/electron_image_20190705175640.jpeg",
       "info_url": "https://www.rocketlabusa.com/electron/",
       "wiki_url": "https://en.wikipedia.org/wiki/Electron_\\(rocket\\)",
       "total_launch_count": 27,
       "consecutive_successful_launches": 7,
       "successful_launches": 24,
       "failed_launches": 3,
       "pending_launches": 13
     },
     "launcher_stage": [],
     "spacecraft_stage": null
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
       "total_launch_count": 27,
       "total_landing_count": 4
     },
     "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_185_20200803143540.jpg",
     "total_launch_count": 2
   },
   "infoURLs": [
     {
       "priority": 10,
       "title": "Mission To The Moon",
       "description": "In 2021 Rocket Lab will launch a CubeSat into lunar orbit for NASA. This historic pathfinding mission supports NASA’s Artemis program which will land the first woman and next man on the Moon by 2024.",
       "feature_image": null,
       "url": "https://www.rocketlabusa.com/missions/lunar/"
     }
   ],
   "vidURLs": [
     {
       "priority": 10,
       "title": "CAPSTONE Launch to the Moon (Official NASA Broadcast)",
       "description": "Watch the launch from New Zealand of CAPSTONE, a new pathfinder CubeSat that will explore a unique orbit around the Moon! The Cislunar Autonomous Positioning...",
       "feature_image": "https://i.ytimg.com/vi/JGx400xCDVY/maxresdefault_live.jpg",
       "url": "https://www.youtube.com/watch?v=JGx400xCDVY"
     }
   ],
   "webcast_live": true,
   "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/electron25202_image_20220624215445.jpg",
   "infographic": null,
   "program": [],
   "orbital_launch_attempt_count": 6425,
   "location_launch_attempt_count": 27,
   "pad_launch_attempt_count": 2,
   "agency_launch_attempt_count": 27,
   "orbital_launch_attempt_count_year": 76,
   "location_launch_attempt_count_year": 4,
   "pad_launch_attempt_count_year": 2,
   "agency_launch_attempt_count_year": 4,
   "mission_patches": [
     {
       "id": 56,
       "name": "CAPSTONE NASA Mission Patch",
       "priority": 9,
       "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/mission_patch_images/capstone2520cu_mission_patch_20210902212131.png",
       "agency": {
         "id": 44,
         "url": "https://ll.thespacedevs.com/2.2.0/agencies/44/",
         "name": "National Aeronautics and Space Administration",
         "type": "Government"
       }
     }
   ]
 }
 */
