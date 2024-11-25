// class StaticValue{
//   static String baseURL = "newsapi.org";
//   static String apiKey = "a25a0c0b883c4f389ff5c23da0f9dfea";
//   static String dummyData = '''
//   {
//     "status": "ok",
//     "totalResults": 8099,
//     "articles": [
//         {
//             "source": {
//                 "id": null,
//                 "name": "Yahoo Entertainment"
//             },
//             "author": "Steve Dent",
//             "title": "Tesla Semi fire required 50,000 gallons of water to extinguish",
//             "description": "California firefighters needed to spray 50,000 gallons of water to extinguish a roadside Tesla Semi fire, the US National Transportation Safety Board (NTSB) announced in a preliminary report. Crews also used an aircraft to drop fire retardent in the \"immediat…",
//             "url": "https://consent.yahoo.com/v2/collectConsent?sessionId=1_cc-session_2b92179c-f86d-4df6-9cc9-bc8e925e97db",
//             "urlToImage": null,
//             "publishedAt": "2024-09-13T12:00:06Z",
//             "content": "If you click 'Accept all', we and our partners, including 239 who are part of the IAB Transparency &amp; Consent Framework, will also store and/or access information on a device (in other words, use … [+678 chars]"
//         },
//         {
//             "source": {
//                 "id": "the-verge",
//                 "name": "The Verge"
//             },
//             "author": "Andrew J. Hawkins",
//             "title": "Tesla will need some Hollywood magic for its robotaxi reveal",
//             "description": "Tesla is gathering data in Hollywood and elsewhere in California in advance of its robotaxi reveal. But the company’s strategy still has several glaring holes.",
//             "url": "https://www.theverge.com/2024/9/3/24234785/tesla-robotaxi-event-warner-bros-mapping-data-musk",
//             "urlToImage": "https://cdn.vox-cdn.com/thumbor/QJ0sPBAZ8DVpTMNZJ77XG9idZcw=/0x0:2040x1360/1200x628/filters:focal(1020x680:1021x681)/cdn.vox-cdn.com/uploads/chorus_asset/file/10752835/acastro_180430_1777_tesla_0001.jpg",
//             "publishedAt": "2024-09-03T16:13:32Z",
//             "content": "Tesla will need some Hollywood magic for its robotaxi reveal\r\nTesla will need some Hollywood magic for its robotaxi reveal\r\n / The company is reportedly mapping Warner Bros. movie studio lot for its … [+6461 chars]"
//         },
//         {
//             "source": {
//                 "id": "the-verge",
//                 "name": "The Verge"
//             },
//             "author": "Andrew J. Hawkins",
//             "title": "EV charging sucks — can smart cameras make it better?",
//             "description": "Revel teamed up with computer vision startup Juice to use cameras at its EV chargers to create an easier, less stress-inducing process for its rideshare customers.",
//             "url": "https://www.theverge.com/2024/9/18/24247452/revel-juice-ev-charging-computer-vision",
//             "urlToImage": "https://cdn.vox-cdn.com/thumbor/mI-JxuNzIOxc-0RNJLkgNBMEj58=/0x0:1080x771/1200x628/filters:focal(540x386:541x387)/cdn.vox-cdn.com/uploads/chorus_asset/file/25061726/Revel_charging_station.png",
//             "publishedAt": "2024-09-18T13:00:00Z",
//             "content": "EV charging sucks  can smart cameras make it better?\r\nEV charging sucks  can smart cameras make it better?\r\n / Revel is joining forces with Juice to use computer vision to initiate headache-free EV c… [+6374 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Gizmodo.com"
//             },
//             "author": "Matthew Gault",
//             "title": "Two Cybertrucks Drove from Florida to the Arctic Circle and It Looks Like a Nightmare",
//             "description": "The journey is an endurance test for the embattled electric vehicle that reveals a lot about North America's shoddy charging infrastructure.",
//             "url": "https://gizmodo.com/two-cybertrucks-drove-from-florida-to-the-arctic-circle-and-it-looks-like-a-nightmare-2000493507",
//             "urlToImage": "https://gizmodo.com/app/uploads/2024/09/CyberTruckArctic.jpg",
//             "publishedAt": "2024-09-02T11:00:06Z",
//             "content": "A group of friends in two different Cybertrucks are currently driving the electric vehicles through the Arctic Circle. The plan is for the trucks to light out from Dawson City, Yukon through the Nort… [+4212 chars]"
//         },
//         {
//             "source": {
//                 "id": "ars-technica",
//                 "name": "Ars Technica"
//             },
//             "author": "Jonathan M. Gitlin",
//             "title": "Hyundai updates Ioniq 5 with bigger battery, Tesla-style port",
//             "description": "There's also an off-road focused variant called the Ioniq 5 XLT.",
//             "url": "https://arstechnica.com/cars/2024/09/hyundai-ioniq-5s-will-be-made-in-usa-with-native-tesla-style-ports/",
//             "urlToImage": "https://cdn.arstechnica.net/wp-content/uploads/2024/09/Large-63188-2025IONIQ5XRT-760x380.jpg",
//             "publishedAt": "2024-09-03T17:48:22Z",
//             "content": "Enlarge/ The lifted, rugged, off-road version-of-normal trend has come to the Ioniq 5 with the new XLT.\r\n28\r\nThe Hyundai Ioniq 5 is one of our favorite electric vehicles. It offers excellent efficien… [+3014 chars]"
//         },
//         {
//             "source": {
//                 "id": "ars-technica",
//                 "name": "Ars Technica"
//             },
//             "author": "Jonathan M. Gitlin",
//             "title": "Tesla Full Self Driving requires human intervention every 13 miles",
//             "description": "It gave pedestrians room but ran red lights and crossed into oncoming traffic.",
//             "url": "https://arstechnica.com/cars/2024/09/tesla-full-self-driving-requires-human-intervention-every-13-miles/",
//             "urlToImage": "https://cdn.arstechnica.net/wp-content/uploads/2024/09/GettyImages-1415090444-760x380.jpg",
//             "publishedAt": "2024-09-25T15:31:16Z",
//             "content": "Enlarge/ An independent automotive testing company has evaluated Tesla FSD, and it found some concerning results.\r\n60\r\nTesla's controversial \"Full Self Driving\" is now capable of some quite advanced … [+2398 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Gizmodo.com"
//             },
//             "author": "Lucas Ropek",
//             "title": "Cops Are Towing Teslas to Recover Crime Scene Footage",
//             "description": "It turns out that Elon Musk's cars are perfect surveillance devices for cops.",
//             "url": "https://gizmodo.com/cops-are-towing-teslas-to-recover-crime-scene-footage-2000494504",
//             "urlToImage": "https://gizmodo.com/app/uploads/2024/09/A-Blue-Tesla-at-a-Charging-Station-.jpg",
//             "publishedAt": "2024-09-04T12:30:50Z",
//             "content": "Teslas are notable for being giant rolling surveillance devices, decked out with cameras and sensors that capture a huge amount of information about what’s happening all around them. In recent years,… [+2265 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Yahoo Entertainment"
//             },
//             "author": "Tori Gaines",
//             "title": "One dead after box truck crashes into Tesla on I-880, one arrested on suspicion of DUI",
//             "description": "CHP says that a white Tesla Model Y crashed alongside a white Tesla Model 3 and a red Toyota Rav4. The driver of the Tesla Model 3 was arrested for suspicion...",
//             "url": "https://www.yahoo.com/news/one-dead-box-truck-crashes-212855865.html",
//             "urlToImage": "https://s.yimg.com/ny/api/res/1.2/t9wfro..SiqTAio7UZicCw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD01Mzg-/https://media.zenfs.com/en/ktvu_fox_local_articles_961/4623fedd95ed4a946dcd62908706389e",
//             "publishedAt": "2024-09-01T21:28:55Z",
//             "content": "One person died after a suspected drunk driver behind the wheel of a Tesla Model 3 on Sunday morning was involved in multi-vehicle crash in Oakland, according to the California Highway Patrol Oakland… [+796 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Dan DeFrancesco",
//             "title": "The tech industry is ready for robot taxis. But are the rest of us willing to go along for the ride?",
//             "description": "Driverless cars are gaining momentum, with Tesla betting big on them. But safety concerns still remain among some people.",
//             "url": "https://www.businessinsider.com/waymo-robot-taxis-driverless-cars-ai-tesla-robotaxi-2024-8",
//             "urlToImage": "https://i.insider.com/66a90e9a1a227600e632ca38?width=1200&format=jpeg",
//             "publishedAt": "2024-09-04T12:48:22Z",
//             "content": "Waymo's fully autonomous Jaguar I-PACEBlue Planet Studio/Getty Images; Waymo; Derek French/BI\r\n<ul><li>This post originally appeared in the Insider Today newsletter.</li><li>You can sign up for Busin… [+7724 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Theron Mohamed",
//             "title": "Elon Musk is  100 billion richer than in April thanks to Tesla's stock surge — and worth more than McDonald's or Pepsi",
//             "description": "Tesla CEO Elon Musk has staged a  100 billion comeback after a  65 billion wealth drop in the spring.",
//             "url": "https://www.businessinsider.com/elon-musk-net-worth-tesla-stock-mcdonalds-ev-wealth-billionaires-2024-9",
//             "urlToImage": "https://i.insider.com/66f5430e75c877a99b60abdb?width=1200&format=jpeg",
//             "publishedAt": "2024-09-26T12:10:02Z",
//             "content": "Tesla CEO Elon Musk has added over  100 billion to his fortune since April.Carina Johansen/AFP/Getty Images\r\n<ul><li>Elon Musk is worth more than Salesforce or Pepsi after a  100 billion wealth gain … [+2944 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Grace Kay",
//             "title": "What it's like working at Tesla's Autopilot labeling facilities, where your keystrokes and bathroom breaks are tracked",
//             "description": "Business Insider spoke with 17 former and current Tesla employees who labeled data to help train the company's Autopilot system.",
//             "url": "https://www.businessinsider.com/tesla-autopilot-fsd-labeling-facilities-jobs-2024-9",
//             "urlToImage": "https://i.insider.com/66cf6794397a168972021438?width=1200&format=jpeg",
//             "publishedAt": "2024-09-03T11:08:02Z",
//             "content": "Much of Tesla's data annotation is done at its facility in Buffalo, New York.Frank Franklin II\r\n<ul><li>Tesla's driver-assist software relies on hundreds of data annotators to train it.</li><li>The t… [+8410 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Tom Carter",
//             "title": "Former 'Top Gear' host drove the Cybertruck for the first time. He says it's 'ballsy,' but he wouldn't want to own one.",
//             "description": "A UK TV presenter has given his verdict on the Cybertruck, and has a request for Tesla CEO Elon Musk.",
//             "url": "https://www.businessinsider.com/tesla-cybertruck-review-top-gear-host-likes-style-wouldnt-buy-2024-9",
//             "urlToImage": "https://i.insider.com/66e411e2d17aa3c7b2b2580a?width=1200&format=jpeg",
//             "publishedAt": "2024-09-13T10:47:31Z",
//             "content": "Former \"Top Gear\" presenter James May.Stuart C. Wilson/Getty Images\r\n<ul><li>Former \"Top Gear\" host James May took a Cybertruck for a spin.</li><li>The presenter praised the vehicle as \"very ballsy,\"… [+1883 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Beatrice Nolan",
//             "title": "Elon Musk is on track to become the world's first trillionaire by 2027, report says",
//             "description": "Musk's wealth, which is closely tied to his Tesla stake, has fluctuated over the past few years.",
//             "url": "https://www.businessinsider.com/elon-musk-trillionaire-first-2027-tesla-wealth-money-2024-9",
//             "urlToImage": "https://i.insider.com/66dec47083b8099cf9fcaa34?width=1200&format=jpeg",
//             "publishedAt": "2024-09-09T10:26:40Z",
//             "content": "Elon Musk endorsed Trump in July.Steve Granitz/FilmMagic via Getty Images\r\n<ul><li>Elon Musk is projected to become a trillionaire by 2027, per Informa Connect Academy.</li><li>The report's predictio… [+2124 chars]"
//         },
//         {
//             "source": {
//                 "id": "ars-technica",
//                 "name": "Ars Technica"
//             },
//             "author": "Jennifer Ouellette",
//             "title": "These 3D-printed pipes inspired by shark intestines outperform Tesla valves",
//             "description": "Prototypes control fluid flow in a preferred direction with no need for moving parts.",
//             "url": "https://arstechnica.com/science/2024/09/these-3d-printed-pipes-inspired-by-shark-intestines-outperform-tesla-valves/",
//             "urlToImage": "https://cdn.arstechnica.net/wp-content/uploads/2024/09/valve2-760x380.jpg",
//             "publishedAt": "2024-09-26T17:52:05Z",
//             "content": "Enlarge/ Shark intestines are naturally occurring Tesla valves; scientists have figured out how to mimic their unique structure.\r\n6\r\nScientists at the University of Washington have re-created the dis… [+6008 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "[Removed]"
//             },
//             "author": null,
//             "title": "[Removed]",
//             "description": "[Removed]",
//             "url": "https://removed.com",
//             "urlToImage": null,
//             "publishedAt": "2024-09-04T11:15:02Z",
//             "content": "[Removed]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Katherine Tangalakis-Lippert,Lloyd Lee",
//             "title": "Waymo and Tesla have opposite problems as they compete for driverless tech dominance",
//             "description": "Waymo and Tesla have opposite hurdles to clear to determine a winner in the battle for market dominance in driverless tech.",
//             "url": "https://www.businessinsider.com/waymo-tesla-opposite-problems-driverless-cars-technology-competition-market-dominance-2024-9",
//             "urlToImage": "https://i.insider.com/66de29ba5444ffafa7638816?width=1200&format=jpeg",
//             "publishedAt": "2024-09-13T23:31:44Z",
//             "content": "Waymo and Tesla are competing to see who can dominate the driverless tech market — but the companies have opposite hurdles to clear before a winner can be determined.GLENN CHAPMAN/AFP via Getty Image… [+5212 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Lauren Edmonds",
//             "title": "Rivian CEO explains why he made 'a very intentional effort' not to copy Tesla's strategy",
//             "description": "Rivian CEO RJ Scaringe spoke about Tesla during a podcast episode published Monday, saying Elon Musk's  automotive company is \"absolutely inspiring.\"",
//             "url": "https://www.businessinsider.com/rivian-ceo-intentional-effort-to-not-copy-tesla-strategy-2024-9",
//             "urlToImage": "https://i.insider.com/66da597aa0ff598b26651ba4?width=1200&format=jpeg",
//             "publishedAt": "2024-09-06T01:24:35Z",
//             "content": "Rivian CEO RJ Scaringe spoke about Elon Musk and Tesla on the \"Grit\" podcast.Phillip Faraone/Chesnot/Getty Images\r\n<ul><li>Rivian CEO RJ Scaringe spoke about Elon Musk and Tesla on the \"Grit\" podcast… [+2255 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Benjamin Zhang",
//             "title": "Buying a used car? These brands make the most reliable options, experts say",
//             "description": "Consumer Reports' new used car study found that Lexus and Toyota are the most reliable, while Chrysler, Dodge, and Tesla are the least reliable.",
//             "url": "https://www.businessinsider.com/best-used-cars-consumer-reports-2024-9",
//             "urlToImage": "https://i.insider.com/66ce252b43b5e59d16b5b499?width=1200&format=jpeg",
//             "publishedAt": "2024-09-02T10:58:02Z",
//             "content": "A 2019 Lexus ES350.Lexus\r\n<ul><li>Consumer Reports released an analysis of which car brands have the most reliable used cars.</li><li>The study evaluated the reliability of five to ten-year-old used … [+3316 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Kelsey Vlamis,Erin Snodgrass",
//             "title": "So, a Tesla Cybertruck outfitted with a stripper pole is driving around Vegas",
//             "description": "A Tesla Cybertruck with a pole and dancers on the back has been driving around Vegas as a promotional stunt for a strip club.",
//             "url": "https://www.businessinsider.com/tesla-cybertruck-with-stripper-pole-dancers-is-driving-around-vegas-2024-9",
//             "urlToImage": "https://i.insider.com/66e231c1cfb7f307e570bc7c?width=1200&format=jpeg",
//             "publishedAt": "2024-09-12T23:07:21Z",
//             "content": "A Tesla Cybertruck with a stripper pole has been seen driving around the Vegas strip.BrandBomb PR\r\n<ul><li>A black Cybertruck affixed with a stripper pole is driving around the Las Vegas strip.</li><… [+2344 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Thibault Spirlet",
//             "title": "Elon Musk spent hundreds of thousands of dollars trying to unseat a Texas prosecutor, report says. It didn't work.",
//             "description": "Tesla CEO Elon Musk funneled money to a PAC to oppose José Garza in Texas, The Wall Street Journal reported, but it failed to make a difference.",
//             "url": "https://www.businessinsider.com/musk-spent-big-trying-to-unseat-texas-prosecutor-failed-report-2024-9",
//             "urlToImage": "https://i.insider.com/66e4124ecfb7f307e5714968?width=1200&format=jpeg",
//             "publishedAt": "2024-09-13T12:50:29Z",
//             "content": "Elon Musk channeled hundreds of thousands of dollars to a Texas PAC to try to unseat a Texas prosecutor, per The Wall Street Journal.Jared Siskin/Patrick McMullan via Getty Images\r\n<ul><li>Elon Musk … [+2389 chars]"
//         },
//         {
//             "source": {
//                 "id": "ars-technica",
//                 "name": "Ars Technica"
//             },
//             "author": "Jonathan M. Gitlin",
//             "title": "Tesla workers in Germany complain about home visits from their bosses",
//             "description": "The rate of sick leave reached 17 percent in August, far above industry average.",
//             "url": "https://arstechnica.com/cars/2024/09/tesla-workers-complain-about-culture-of-fear-at-german-factory/",
//             "urlToImage": "https://cdn.arstechnica.net/wp-content/uploads/2024/09/GettyImages-1550685993-760x380.jpg",
//             "publishedAt": "2024-09-27T16:21:32Z",
//             "content": "Enlarge/ Tesla's factory in Gruenheide, Germany.\r\n43\r\nTesla's German car factory on the outskirts of Berlin allegedly operates under a \"culture of fear,\" and its workers take sick leave at more than … [+2122 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Ana Altchek",
//             "title": "Elon Musk's Robotaxi event will reportedly be different from recent Tesla reveals in a key way",
//             "description": "It looks like Elon Musk is headed to Hollywood for Tesla's Robotaxi event, which reportedly could happen on October 10 at the Warner Bros. studio lot.",
//             "url": "https://www.businessinsider.com/elon-musk-tesla-robotaxi-event-warner-bros-discovery-studio-report-2024-9",
//             "urlToImage": "https://i.insider.com/66d729511d8d2deb96b827fc?width=1200&format=jpeg",
//             "publishedAt": "2024-09-03T17:02:46Z",
//             "content": "Tesla's Robotaxi event will be hosted on October 10 at Warner Bros Studios in Burbank, California.Suzanne Cordeiro/Getty\r\n<ul><li>Tesla CEO Elon Musk is headed to Hollywood's Warner Bros Studios for … [+3111 chars]"
//         },
//         {
//             "source": {
//                 "id": "the-verge",
//                 "name": "The Verge"
//             },
//             "author": "Andrew J. Hawkins",
//             "title": "Volvo is giving itself another decade before it commits to selling only EVs",
//             "description": "Volvo says it will only sell electric vehicles by 2040, after previously committing to a deadline of 2030. Now the company says it will sell more hybrids in the next decade.",
//             "url": "https://www.theverge.com/2024/9/4/24235793/volvo-ev-only-sales-deadline-2040-hybrids",
//             "urlToImage": "https://cdn.vox-cdn.com/thumbor/0BOP11zsuTK8SoAFqqN_INQsFW4=/0x0:5100x3400/1200x628/filters:focal(2550x1700:2551x1701)/cdn.vox-cdn.com/uploads/chorus_asset/file/25603299/332052_New_Volvo_EX90_on_the_road.jpg",
//             "publishedAt": "2024-09-04T16:35:55Z",
//             "content": "Volvo is giving itself another decade before it commits to selling only EVs\r\nVolvo is giving itself another decade before it commits to selling only EVs\r\n / The automaker previously said it would be … [+2219 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Jyoti Mann",
//             "title": "Tesla's found a sweet spot in China — and may be planning a 6-seat Model Y",
//             "description": "Tesla's sales in China surged in August, driven by increased government rebates and may produce a six-seat Model Y in Shanghai by late next year.",
//             "url": "https://www.businessinsider.com/tesla-china-sales-boost-model-y-elon-musk-evs-2024-9",
//             "urlToImage": "https://i.insider.com/66d6daba289b805d1db37a3a?width=1200&format=jpeg",
//             "publishedAt": "2024-09-03T10:31:40Z",
//             "content": "Tesla sales in China are on the up.VCG\r\n<ul><li>Tesla's EV sales in China surged in August, marking its best month of the year to date.</li><li>The boost follows a global demand slowdown and increase… [+2021 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Tom Carter",
//             "title": "A Russian warlord who seemingly put a machine gun on a Cybertruck says Elon Musk 'remotely disabled' the militarized EV",
//             "description": "Ramzan Kadyrov previously claimed the pickup was a gift from Musk and suggested he might send it into war against Ukraine.",
//             "url": "https://www.businessinsider.com/chechen-warlord-says-elon-musk-disabled-his-cybertruck-2024-9",
//             "urlToImage": "https://i.insider.com/66c0c7745da406397bf6bcec?width=1200&format=jpeg",
//             "publishedAt": "2024-09-20T10:43:52Z",
//             "content": "Ramzan Kadyrov, leader of the Russian Republic of Chechnya, stands on top of a Tesla Cybertruck with what appears to be a machine gun mounted to it.Ramzan Kadyrov/Telegram\r\n<ul><li>A Chechen warlord … [+2353 chars]"
//         },
//         {
//             "source": {
//                 "id": "ars-technica",
//                 "name": "Ars Technica"
//             },
//             "author": "Jonathan M. Gitlin",
//             "title": "Driver assists become de facto autopilots as drivers multitask, study finds",
//             "description": "As drivers become familiar with the systems, they exploit them.",
//             "url": "https://arstechnica.com/cars/2024/09/tesla-autopilot-and-other-assists-increase-distracted-driving-study-finds/",
//             "urlToImage": "https://cdn.arstechnica.net/wp-content/uploads/2024/09/GettyImages-1633254374-760x380.jpg",
//             "publishedAt": "2024-09-17T15:00:59Z",
//             "content": "Enlarge/ Lane keeping systems let you take your hands off the wheel while you drive. \r\n18\r\nThe seductive lure of cars that drive themselves has led to an awful lot of hype over the past decade. Not e… [+4576 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Hipertextual"
//             },
//             "author": "Quelian Sanz",
//             "title": "El Tesla Model Y Juniper dará la sorpresa: se filtra un cambio totalmente inesperado",
//             "description": "Tesla estaría preparándose para darle una vuelta de tuerca a su esperado Model Y Juniper. Según informan desde Reuters, la división de la marca en China estaría planteándose la fabricación de una nueva versión con un interior mucho más espacioso que pondría s…",
//             "url": "http://hipertextual.com/2024/09/el-tesla-model-y-juniper-dara-la-sorpresa-se-filtra-un-cambio-totalmente-inesperado",
//             "urlToImage": "https://imgs.hipertextual.com/wp-content/uploads/2024/02/model-y-juniper-2.jpg",
//             "publishedAt": "2024-09-03T09:14:19Z",
//             "content": "Tesla estaría preparándose para darle una vuelta de tuerca a su esperado Model Y Juniper. Según informan desde Reuters, la división de la marca en China estaría planteándose la fabricación de una nue… [+1954 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Hipertextual"
//             },
//             "author": "Gabriel Erard",
//             "title": "Tesla promete, otra vez, que la conducción autónoma total llegará a Europa el próximo año",
//             "description": "La conducción autónoma total se lanzará en Europa en 2025, ha prometido Tesla. A través de X (Twitter), la empresa de Elon Musk ha revelado la hoja de ruta de lanzamientos de su equipo de inteligencia artificial. Entre los objetivos se ha incluido el debut de…",
//             "url": "http://hipertextual.com/2024/09/tesla-promete-conduccion-autonoma-total-europa-2025",
//             "urlToImage": "https://imgs.hipertextual.com/wp-content/uploads/2024/09/Conduccion-autonoma-total-Tesla-scaled.jpg",
//             "publishedAt": "2024-09-05T21:17:27Z",
//             "content": "La conducción autónoma total se lanzará en Europa en 2025, ha prometido Tesla. A través de X (Twitter), la empresa de Elon Musk ha revelado la hoja de ruta de lanzamientos de su equipo de inteligenci… [+2244 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Hasan Chowdhury",
//             "title": "X is banned in Brazil and China, but Elon Musk is only in a spat with one. The secret? Tesla.",
//             "description": "Elon Musk has been critical of Brazil's decision to ban X on free speech grounds, but has long remained silent on China's decision to do the same.",
//             "url": "https://www.businessinsider.com/elon-musk-brazil-x-ban-china-tesla-2024-9",
//             "urlToImage": "https://i.insider.com/66d9b9ce5444ffafa762697a?width=1200&format=jpeg",
//             "publishedAt": "2024-09-06T09:02:49Z",
//             "content": "Elon Musk's attack on Brazil over its ban on X contrasts his silence on China, where the app has been blocked since 2009.Beata Zawrzel/NurPhoto/Getty Images\r\n<ul><li>Elon Musk has been busy attacking… [+5741 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Grace Kay",
//             "title": "I work on Tesla's Autopilot team. I watch hours of customers' driving videos every day and am monitored constantly.",
//             "description": "A worker on Tesla's Autopilot team described what it's like labeling the influx of driver videos.",
//             "url": "https://www.businessinsider.com/tesla-autopilot-data-annotation-specialist-job-experience-buffalo-2024-9",
//             "urlToImage": "https://i.insider.com/66db6c155444ffafa7637549?width=1200&format=jpeg",
//             "publishedAt": "2024-09-08T09:07:02Z",
//             "content": "Tesla's Autopilot team helps teach the company's AI to drive.Chris Walker/Chicago Tribune/Tribune News Service via Getty Images\r\n<ul><li>Tesla's Autopilot team in Buffalo, New York reviews footage to… [+5238 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Nora Naughton",
//             "title": "GM's EV drivers are finally getting access to the Tesla Supercharger network",
//             "description": "General Motors is only the third company to get access to Tesla's vast Supercharger network as a flood of announcements gave way to slow adoption.",
//             "url": "https://www.businessinsider.com/gm-chevy-tesla-supercharger-ev-charging-2024-9",
//             "urlToImage": "https://i.insider.com/66e9d07bd17aa3c7b2b37abb?width=1200&format=jpeg",
//             "publishedAt": "2024-09-18T12:01:01Z",
//             "content": "GM drivers now have access to Tesla Superchargers.ANDREW TRAHAN PHOTOGRAPHY LLC\r\n<ul><li>GM is the latest company to get access to Tesla's Superchargers.</li><li>Most major automakers said last year … [+2657 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Yahoo Entertainment"
//             },
//             "author": "Keith Barry",
//             "title": "Which EVs Can Charge at a Tesla Supercharger?",
//             "description": "Many of Tesla's Superchargers are now open to electric cars from other automakers, but NACS adapters are slow to arriveThe 2025 Hyundai Ioniq 5 will become...",
//             "url": "https://www.yahoo.com/news/evs-charge-tesla-supercharger-155200812.html",
//             "urlToImage": "https://media.zenfs.com/en/autos.consumerreports.org/08e8cda1b2f2dc9710b4699501e28adf",
//             "publishedAt": "2024-09-11T15:52:00Z",
//             "content": "Many of Tesla's Superchargers are now open to electric cars from other automakers, but NACS adapters are slow to arrive\r\nThe 2025 Hyundai Ioniq 5 will become the first non-Tesla vehicle with a built-… [+18790 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "WPIX 11 New York"
//             },
//             "author": "Lauren Cook",
//             "title": "2 killed in fiery Tesla crash in White Plains, NY",
//             "description": "WHITE PLAINS, N.Y. (PIX11) – Two people died in a fiery crash involving a Tesla in White Plains on Monday. The crash happened on Battle Avenue near Waldo...",
//             "url": "https://pix11.com/news/local-news/2-killed-in-fiery-tesla-crash-in-white-plains-ny/",
//             "urlToImage": "https://media.zenfs.com/en/wpix_new_york_city_ny_articles_672/353a115c8060ce96cfa4c50a7d432bca",
//             "publishedAt": "2024-09-16T20:14:22Z",
//             "content": "WHITE PLAINS, N.Y. (PIX11) Two people died in a fiery crash involving a Tesla in White Plains on Monday.\r\nThe crash happened on Battle Avenue near Waldo Avenue. The 70-year-old driver of the Tesla lo… [+1461 chars]"
//         },
//         {
//             "source": {
//                 "id": "wired",
//                 "name": "Wired"
//             },
//             "author": "Joel Khalili",
//             "title": "Yes, You Can Now Bet on Elections in the US",
//             "description": "A US judge has overturned a moratorium that stopped gambling companies from letting people bet on election results.",
//             "url": "https://www.wired.com/story/yes-you-can-now-bet-on-elections-in-the-us/",
//             "urlToImage": "https://media.wired.com/photos/66e1d6f96cc50627cd363ab0/191:100/w_1280,c_limit/Betting-On-Elections-Business.jpg",
//             "publishedAt": "2024-09-12T16:34:09Z",
//             "content": "A federal judge has cleared the way for betting on election results in the US for the first time in the modern era, overturning a prohibition imposed on gambling companies by the Commodities Futures … [+2856 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Tom Carter",
//             "title": "Another blow for electric vehicle drive as battery startup Northvolt lays off 1,600 workers",
//             "description": "Swedish battery maker Northvolt said on Monday it was cutting a fifth of its workforce and scaling back expansion plans in response to \"headwinds.\"",
//             "url": "https://www.businessinsider.com/northvolt-european-battery-startup-cutting-jobs-sweden-ev-tesla-2024-9",
//             "urlToImage": "https://i.insider.com/66f18858ce3009a0fac86faa?width=1200&format=jpeg",
//             "publishedAt": "2024-09-23T15:28:17Z",
//             "content": "Peter Carlsson is the cofounder and CEO of battery startup Northvolt. Northvolt\r\n<ul><li>European battery firm Northvolt said on Monday it would lay off 1,600 workers.</li><li>The startup, founded by… [+1797 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Yahoo Entertainment"
//             },
//             "author": "Alyssa Ochs",
//             "title": "Tesla launches new Cybertruck sale and test drive opportunities: 'More ... being sold each month than Ford and Rivian EV trucks combined'",
//             "description": "Tesla has been reducing prices for popular models, making them more affordable than standard new cars powered by air-polluting gasoline.",
//             "url": "https://autos.yahoo.com/tesla-launches-cybertruck-sale-test-103052806.html",
//             "urlToImage": "https://s.yimg.com/ny/api/res/1.2/oBRIp38_KCt6ImL2MEo65Q--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD04MDA-/https://media.zenfs.com/en/the_cool_down_737/8ca1899bbedf396ddb3c246790361e9c",
//             "publishedAt": "2024-09-12T10:30:52Z",
//             "content": "Canadians can now order Tesla Cybertrucks and expect them to be delivered by October.\r\nAs Teslarati reported, the EV manufacturer officially opened up orders for customers in Canada with a starting p… [+2141 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Yahoo Entertainment"
//             },
//             "author": "Robert English",
//             "title": "JD Power sheds light on consumers' experience with the latest vehicle models — and one brand's scores are 'practically in a league of its own'",
//             "description": "\"Is anyone surprised?\"",
//             "url": "https://autos.yahoo.com/jd-power-sheds-light-consumers-104511565.html",
//             "urlToImage": "https://s.yimg.com/ny/api/res/1.2/Lu0Xi3RB5vsmZShkvlHeqg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD04MDA-/https://media.zenfs.com/en/the_cool_down_737/96395a746b472cd83417cd7fc01877da",
//             "publishedAt": "2024-09-30T10:45:11Z",
//             "content": "J.D. Power, a global data analytics and consumer intelligence company, released its 2024 U.S. Tech Experience Index (TXI) Study, and Tesla received high marks for tech innovation, as reported by Tesl… [+2348 chars]"
//         },
//         {
//             "source": {
//                 "id": "ars-technica",
//                 "name": "Ars Technica"
//             },
//             "author": "Jonathan M. Gitlin",
//             "title": "EV sales remain healthy despite online doom and gloom",
//             "description": "Battery EVs are expected to account for more than 8 percent.",
//             "url": "https://arstechnica.com/cars/2024/09/ev-sales-remain-healthy-despite-online-doom-and-gloom/",
//             "urlToImage": "https://cdn.arstechnica.net/wp-content/uploads/2024/09/ev-sales-up-760x380.jpg",
//             "publishedAt": "2024-09-26T17:40:35Z",
//             "content": "13\r\nBattery-electric vehicles accounted for 8 percent of new vehicle sales in June and July of this year and should be above 8 percent for September, according to estimates from S&amp;P Global Mobili… [+2754 chars]"
//         },
//         {
//             "source": {
//                 "id": "the-verge",
//                 "name": "The Verge"
//             },
//             "author": "Andrew Liszewski",
//             "title": "Backup by BioLite is a beefy emergency battery for your big appliances",
//             "description": "For  1,999, you can hide a Backup by BioLite panel behind a fridge and keep it powered for hours. For  2,999, you can pair a couple panels and keep it running for days.",
//             "url": "https://www.theverge.com/2024/9/18/24243688/backup-biolite-power-battery-emergency",
//             "urlToImage": "https://cdn.vox-cdn.com/thumbor/T4ltGRE2_0maCn1XrNhwOZCWOLo=/0x0:1742x1161/1200x628/filters:focal(871x581:872x582)/cdn.vox-cdn.com/uploads/chorus_asset/file/25618910/backupbiolite1.jpg",
//             "publishedAt": "2024-09-18T04:00:00Z",
//             "content": "Backup by BioLite is a beefy emergency battery for your big appliances\r\nBackup by BioLite is a beefy emergency battery for your big appliances\r\n / Now, theres a Kickstarter for this  1,999 battery th… [+2768 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Nora Naughton",
//             "title": "3 questions Elon Musk will need to answer at Tesla's highly anticipated robotaxi event",
//             "description": "Investors have a lot of questions for Elon Musk heading into Tesla's robotaxi day on Oct. 10.",
//             "url": "https://www.businessinsider.com/tesla-robotaxi-release-date-elon-musk-stock-price-2024-9",
//             "urlToImage": "https://i.insider.com/66f45d1af9f6733e4bdf9519?width=1200&format=jpeg",
//             "publishedAt": "2024-09-26T09:30:02Z",
//             "content": "Tesla's robotaxi day is scheduled for October 10.SOPA Images/Getty Images\r\n<ul><li>Investor expectations are high heading into Tesla's big robotaxi reveal.</li><li>Investors are looking for details a… [+4632 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Gizmodo.com"
//             },
//             "author": "Lucas Ropek",
//             "title": "Google DeepMind Taught a Robot to Tie Shoes Very Poorly",
//             "description": "I don't really think you'd want DeepMind's robot lacing up your kicks.",
//             "url": "https://gizmodo.com/google-deepmind-taught-a-robot-to-tie-shoes-very-poorly-2000498136",
//             "urlToImage": "https://gizmodo.com/app/uploads/2024/09/shoe.png",
//             "publishedAt": "2024-09-12T20:10:08Z",
//             "content": "Google DeepMind has announced that it has taught one of its robots how to tie a shoe. Unfortunately, the robot isn’t very good at it yet. In fact, the bot’s shoe-tying abilities arguably rank quite l… [+2460 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Gizmodo.com"
//             },
//             "author": "Matt Novak",
//             "title": "Cybertruck Brutally Mocked for Making Seattle Look Like a Low-Budget Post-Apocalyptic Movie Set",
//             "description": "The truck keep racking up those Ls.",
//             "url": "https://gizmodo.com/cybertruck-brutally-mocked-for-making-seattle-look-like-a-low-budget-post-apocalyptic-movie-set-2000496544",
//             "urlToImage": "https://gizmodo.com/app/uploads/2024/09/cybertruck-tesla-logo.jpg",
//             "publishedAt": "2024-09-10T11:30:06Z",
//             "content": "When Tesla CEO Elon Musk announced the Cybertruck, he said he wanted the future to “look like the future.” Well, he got his wish in some respects. The Cybertruck has made America’s major cities look … [+2105 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Yahoo Entertainment"
//             },
//             "author": "Lawrence Nga, The Motley Fool",
//             "title": "1 Solid AI Stock That's Not Nvidia or Palantir to Focus On in the Next Few Years",
//             "description": "This AI company could reach trillions of dollars in market capitalization.",
//             "url": "https://finance.yahoo.com/news/1-solid-ai-stock-thats-111500631.html/",
//             "urlToImage": "https://s.yimg.com/cv/apiv2/social/images/yahoo_default_logo.png",
//             "publishedAt": "2024-09-19T11:15:00Z",
//             "content": "Artificial intelligence (AI) is probably one of the biggest trends that will change our daily lives in the coming decades. While AI is still in its early development stage, companies like Nvidia and … [+5665 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Nora Naughton",
//             "title": "5 of my favorite features on the Chevrolet Equinox EV that make it a perfect family SUV",
//             "description": "I drove the new Chevy Equinox EV for a few days and put it to the test with suburban activities like shopping and family hauling.",
//             "url": "https://www.businessinsider.com/chevy-equinox-ev-features-family-suv-2024-9",
//             "urlToImage": "https://i.insider.com/66f6f2f7de59ade1a3b560bc?width=1200&format=jpeg",
//             "publishedAt": "2024-09-29T09:56:02Z",
//             "content": "The Chevrolet Equinox EVNora Naughton, Business Insider\r\n<ul><li>Access to Tesla Superchargers is a game-changer.</li><li>Little details in design make the Equinox EV feel special.</li><li>Equinox EV… [+4441 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Tom Carter",
//             "title": "A California police department spent at least  140,000 on a custom Cybertruck: report",
//             "description": "Elon Musk has expressed support for Cybertruck cop cars, but it's unclear how effective they'd be.",
//             "url": "https://www.businessinsider.com/california-police-buy-100k-cybertruck-cyberbeast-customized-report-2024-9",
//             "urlToImage": "https://i.insider.com/66e2b7e1bf0250c214929506?width=1200&format=jpeg",
//             "publishedAt": "2024-09-12T10:40:12Z",
//             "content": "Tesla's Cybertruck has had a rocky rollout since it launched last year.Graham Rapier/Business Insider\r\n<ul><li>A California police department spent at least  140,000 on a Cybertruck, per a Forbes rep… [+2888 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Xataka.com"
//             },
//             "author": "Javier Pastor",
//             "title": "El modo FSD de Tesla nunca ha estado disponible en Europa. Comenzará a estarlo muy, muy pronto",
//             "description": "Aunque el controvertido sistema FSD (Full Self Driving) ha sido desde sus inicios uno de los grandes reclamos de Tesla, jamás ha salido de Estados Unidos. En la Unión Europea había problemas regulatorios, pero una actualización del mismo abría las puertas a l…",
//             "url": "https://www.xataka.com/movilidad/modo-fsd-tesla-nunca-ha-estado-disponible-europa-comenzara-a-estarlo-muy-muy-pronto",
//             "urlToImage": "https://i.blogs.es/d2b90b/tesla-fsd/840_560.jpeg",
//             "publishedAt": "2024-09-06T11:31:50Z",
//             "content": "Aunque el controvertido sistema FSD (Full Self Driving) ha sido desde sus inicios uno de los grandes reclamos de Tesla, jamás ha salido de Estados Unidos. En la Unión Europea había problemas regulato… [+2498 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Yahoo Entertainment"
//             },
//             "author": "Audrey Brewer",
//             "title": "Tesla increases charger production in bid to expand Supercharger network to new EVs — here are the brands listed as 'coming soon'",
//             "description": "Expanding access to charging will vastly help customers who have been hesitant to switch to EVs.",
//             "url": "https://autos.yahoo.com/tesla-increases-charger-production-bid-110028581.html",
//             "urlToImage": "https://s.yimg.com/ny/api/res/1.2/seItGsdpw47TuqLipC0SLw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD02NzU-/https://media.zenfs.com/en/the_cool_down_737/da13342b4ae5aea7d2f86536a5934825",
//             "publishedAt": "2024-09-23T11:00:28Z",
//             "content": "Tesla has pretty much set the standard for electric vehicles through its design and its Supercharger network, and now other vehicles will be able to benefit from the developments.\r\nElectrek reported … [+2016 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Yahoo Entertainment"
//             },
//             "author": "Aja Seldon",
//             "title": "'Lost for words': Mom killed in Oakland DUI crash on I-880",
//             "description": "A woman killed early Sunday in a crash on Interstate 880 in Oakland by a driver suspected of being under the influence was on her way to work.",
//             "url": "https://www.yahoo.com/news/lost-words-mom-killed-oakland-195833541.html",
//             "urlToImage": "https://media.zenfs.com/en/ktvu_fox_local_articles_961/e7b9c7bd4576f3863cfbbe50f3ba1408",
//             "publishedAt": "2024-09-05T19:58:33Z",
//             "content": "OAKLAND, Calif. - A woman killed early Sunday in a crash on Interstate 880 in Oakland by a driver suspected of being under the influence was on her way to work.\r\nMichael Dela Rosa said on a GoFundMe … [+1687 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Yahoo Entertainment"
//             },
//             "author": null,
//             "title": "Hgen draws on lessons from Tesla and SpaceX to drive down the cost of hydrogen",
//             "description": null,
//             "url": "https://consent.yahoo.com/v2/collectConsent?sessionId=1_cc-session_460b1ae5-abf9-4d51-b0ef-2917e965bbfa",
//             "urlToImage": null,
//             "publishedAt": "2024-09-17T13:00:00Z",
//             "content": "If you click 'Accept all', we and our partners, including 239 who are part of the IAB Transparency &amp; Consent Framework, will also store and/or access information on a device (in other words, use … [+678 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Yahoo Entertainment"
//             },
//             "author": null,
//             "title": "Two reasons why Tesla shouldn't be viewed as an AI play",
//             "description": null,
//             "url": "https://consent.yahoo.com/v2/collectConsent?sessionId=1_cc-session_9c843be9-8195-487f-92e2-a1e3b489d834",
//             "urlToImage": null,
//             "publishedAt": "2024-09-03T11:00:37Z",
//             "content": "If you click 'Accept all', we and our partners, including 239 who are part of the IAB Transparency &amp; Consent Framework, will also store and/or access information on a device (in other words, use … [+678 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Notateslaapp.com"
//             },
//             "author": "Karan Singh",
//             "title": "Tesla FSD no longer offered for purchase",
//             "description": "Tesla changes how they advertise and sell FSD on their website, we look to see what the future might bring. Read on inside.",
//             "url": "https://www.notateslaapp.com/news/2245/tesla-updates-fsd-package-can-now-only-buy-fsd-supervised",
//             "urlToImage": "https://www.notateslaapp.com/img/containers/article_images/2021/fsd-beta-10-5.jpg/07c9a5c546a48af7f26de413139335d7.jpg",
//             "publishedAt": "2024-09-10T00:11:13Z",
//             "content": "September 9, 2024 \r\nTesla has changed how they advertise and sell Full Self-Driving on their website. Although the text changes are small, this change could have greater implications in the future.\r\n… [+8308 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Theron Mohamed",
//             "title": "Mark Zuckerberg could become the richest person on the planet after a  51 billion wealth surge this year",
//             "description": "Meta CEO Mark Zuckerberg has gained an unmatched  51 billion in net worth this year, and could surpass Elon Musk and Jeff Bezos with a bit of luck.",
//             "url": "https://www.businessinsider.com/mark-zuckerberg-meta-net-worth-wealth-rich-list-musk-bezos-2024-9",
//             "urlToImage": "https://i.insider.com/66e05e3fa0ff598b266622d5?width=1200&format=jpeg",
//             "publishedAt": "2024-09-11T09:23:47Z",
//             "content": "Meta CEO Mark Zuckerberg.Getty\r\n<ul><li>Mark Zuckerberg could become the world's wealthiest person after surging up the rich list.</li><li>The Meta CEO has gained  51 billion this year and recently r… [+3700 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Brent D. Griffiths",
//             "title": "SEC is unhappy that Elon Musk did not give testimony to the financial regulator to attend a SpaceX launch",
//             "description": "The US Securities and Exchange Commission isn't happy that Elon Musk missed court-ordered testimony for its Twitter probe to attend a SpaceX launch.",
//             "url": "https://www.businessinsider.com/sec-unhappy-musk-no-testimony-spacex-launch-court-documents-2024-9",
//             "urlToImage": "https://i.insider.com/66edf516cfb7f307e573bbfd?width=1200&format=jpeg",
//             "publishedAt": "2024-09-21T01:58:40Z",
//             "content": "Elon Musk has a fraught history with the US Securities and Exchange Commission. Slaven Vlasic/Getty Images\r\n<ul><li>The US Securities and Exchange Commission isn't happy with Elon Musk.</li><li>The f… [+3631 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Autoblog"
//             },
//             "author": "Insider",
//             "title": "22 Tesla features that make them unlike any other electric cars",
//             "description": "Filed under:\n Green,Tesla\n Continue reading 22 Tesla features that make them unlike any other electric cars\n22 Tesla features that make them unlike any other electric cars originally appeared on Autoblog on Sun, 8 Sep 2024 19:25:00 EDT. Please see our terms f…",
//             "url": "https://www.autoblog.com/2024/09/08/22-tesla-features-that-make-them-unlike-any-other-electric-cars/",
//             "urlToImage": "https://edgecast-img.yahoo.net/mysterio/api/57DA9D4CF57D33C8C73926C76F7BA56A67C656DDFA29CDBBC1FD9E0B7D8A4E66/autoblog/resizefill_w1200_h675;quality_85;format_webp;cc_31536000;/https://o.aolcdn.com/images/dims3/GLOB/legacy_thumbnail/1062x597/format/jpg/quality/100/https://media.zenfs.com/en/business_insider_articles_888/d11bea5d74cf93e7c38358b06337382a",
//             "publishedAt": "2024-09-08T23:25:00Z",
//             "content": "All Tesla models are equipped with a driver assistance system called Autopilot.\r\nThe feature enables a car to steer, accelerate, and brake automatically within its lane. The function does not replace… [+501 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Xataka.com"
//             },
//             "author": "Ricardo Aguilar",
//             "title": "Llamar a un Tesla para que te recoja de forma 100% autónoma ya es posible. Si vives en Estados Unidos, claro",
//             "description": "En octubre de 2019, Tesla lanzaba en fase beta la función 'Smart Summon'. Esta, permitía invocar a nuestro coche de forma completamente autónoma utilizando nuestro smartphone. Como podía preverse en una función aún en fase beta, los primeros accidentes no tar…",
//             "url": "https://www.xataka.com/movilidad/llamar-a-tesla-te-recoja-forma-100-autonoma-posible-vives-estados-unidos-claro",
//             "urlToImage": "https://i.blogs.es/6d8fbb/tesla/840_560.jpeg",
//             "publishedAt": "2024-09-03T09:01:28Z",
//             "content": "En octubre de 2019, Tesla lanzaba en fase beta la función 'Smart Summon'. Esta, permitía invocar a nuestro coche de forma completamente autónoma utilizando nuestro smartphone. Como podía preverse en … [+2987 chars]"
//         },
//         {
//             "source": {
//                 "id": "wired",
//                 "name": "Wired"
//             },
//             "author": "Lily Hay Newman",
//             "title": "The US Could Finally Ban Inane Forced Password Changes",
//             "description": "Plus: The US Justice Department indicts three Iranians over Trump campaign hack, EU regulators fine Meta  100 million for a password security lapse, and the Tor Project enters a new phase.",
//             "url": "https://www.wired.com/story/nist-password-guidance-improvements/",
//             "urlToImage": "https://media.wired.com/photos/66f71df9f2d2c6098e413b67/191:100/w_1280,c_limit/Security_Roundup_Password_GettyImages.jpg",
//             "publishedAt": "2024-09-28T10:30:00Z",
//             "content": "Researchers found a vulnerability in a Kia web portal that allowed them to track millions of cars, unlock doors, honk horns, and even start engines in seconds, just by reading the car's license plate… [+4741 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Gizmodo.com"
//             },
//             "author": "Lucas Ropek",
//             "title": "Elon Musk Is Feuding With a Billionaire Over a California Beach",
//             "description": "Why are two billionaires yelling at each other on X?",
//             "url": "https://gizmodo.com/elon-musk-is-feuding-with-a-billionaire-over-a-california-beach-2000502161",
//             "urlToImage": "https://gizmodo.com/app/uploads/2024/09/Elon-Musk-at-the-U.S.-Open-1.jpg",
//             "publishedAt": "2024-09-23T20:40:30Z",
//             "content": "Professional troll Elon Musk usually leverages his shitposting prowess toward rather stupid, rightwing ends but, once in great awhile, he actually puts his trollish powers to good use. Such was the c… [+2648 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Gizmodo.com"
//             },
//             "author": "Lucas Ropek",
//             "title": "Hyperloop Company Says It Has Successfully Propelled A Vessel Through a Loop",
//             "description": "The dream of being shot through a subterranean tunnel at frightening speeds is one step closer to being realized.",
//             "url": "https://gizmodo.com/hyperloop-company-says-it-has-successfully-propelled-a-vessel-through-a-loop-2000496604",
//             "urlToImage": "https://gizmodo.com/app/uploads/2024/09/A-Hyperloop-tube-.jpg",
//             "publishedAt": "2024-09-10T13:09:02Z",
//             "content": "Will America ever get a Hyperloop? The answer is: maybe. The dream of packing people into underground shuttles like sardines and then firing them through airless tunnels at untold speeds may seem biz… [+3004 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "PBS"
//             },
//             "author": null,
//             "title": "Experiments with Alternate Currents of High Potential and High Frequency (1892)",
//             "description": "Nikola Tesla - Experiments with Alternate Currents of High Potential and High Frequency",
//             "url": "https://www.pbs.org/tesla/res/res_art05.html",
//             "urlToImage": null,
//             "publishedAt": "2024-09-23T21:22:01Z",
//             "content": "I cannot find words to express how deeply I feel the honor of addressing some of the foremost thinkers of the present time, and so many able scientific men, engineers and electricians, of the country… [+212761 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Gizmodo.com"
//             },
//             "author": "Matt Novak",
//             "title": "Belief That EVs Are Better for the Environment Drops",
//             "description": "Back in 2022, 63% of Americans believed EVs were greener. Now it's 58%.",
//             "url": "https://gizmodo.com/belief-that-evs-are-better-for-the-environment-drops-2000502376",
//             "urlToImage": "https://gizmodo.com/app/uploads/2024/09/tesla-vehicle-charging-pasadena-sept-23-2024.jpg",
//             "publishedAt": "2024-09-24T15:30:59Z",
//             "content": "The number of Americans who believe electric vehicles are better for the environment than cars that run on fossil fuels has dipped 5% in the past two years, according to a new poll conducted by Ipsos… [+3561 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Xataka.com"
//             },
//             "author": "Rubén Andrés",
//             "title": "X ha vuelto a poner en jaque a Tesla: Elon Musk se verá obligado a vender acciones para salvar su red social",
//             "description": "Por mucho que Elon Musk trate de darles un aura de independencia, las empresas de Elon Musk siempre han funcionado como una colmena, y la historia reciente nos ha dejado buenas muestras de ello. Las declaraciones de Elon Musk en X y sus problemas con los anun…",
//             "url": "https://www.xataka.com/empresas-y-economia/x-ha-vuelto-a-poner-jaque-a-tesla-elon-musk-se-vera-obligado-a-vender-acciones-para-salvar-su-red-social",
//             "urlToImage": "https://i.blogs.es/001f9d/tesla-elon-musk/840_560.jpeg",
//             "publishedAt": "2024-09-17T13:30:16Z",
//             "content": "Por mucho que Elon Musk trate de darles un aura de independencia, las empresas de Elon Musk siempre han funcionado como una colmena, y la historia reciente nos ha dejado buenas muestras de ello. Las … [+4397 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Xataka.com"
//             },
//             "author": "Alejandro Alcolea",
//             "title": "Tesla quería que su piloto automático condujera como un humano. Así que le enseñó a ignorar algunas señales de tráfico",
//             "description": "El segmento de la automoción tiene dos grandes objetivos por delante. También dos grandes retos. Por un lado, conseguir que los vehículos de combustión sean cosa del pasado, algo que se antoja clave de cara a conseguir las metas de descarbonización a nivel gl…",
//             "url": "https://www.xataka.com/movilidad/tesla-queria-que-su-piloto-automatico-condujera-como-humano-asi-que-le-enseno-a-ignorar-algunas-senales-trafico",
//             "urlToImage": "https://i.blogs.es/698b9f/tesla-senales/840_560.jpeg",
//             "publishedAt": "2024-09-14T13:31:21Z",
//             "content": "El segmento de la automoción tiene dos grandes objetivos por delante. También dos grandes retos. Por un lado, conseguir que los vehículos de combustión sean cosa del pasado, algo que se antoja clave … [+7668 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Yahoo Entertainment"
//             },
//             "author": "Dan Levine and Kristina Cooke",
//             "title": "California passes requirements on carmakers and domestic violence",
//             "description": "Lawmakers in the most populous U.S. state approved a proposal that requires automakers selling internet-connected cars to do more to protect domestic abuse...",
//             "url": "https://www.yahoo.com/news/california-passes-requirements-carmakers-domestic-175046678.html",
//             "urlToImage": "https://media.zenfs.com/en/reuters.com/812ed84564ce0276a8f5be5b01032e88",
//             "publishedAt": "2024-09-10T17:50:46Z",
//             "content": "By Dan Levine and Kristina Cooke\r\n(Reuters) - Lawmakers in the most populous U.S. state approved a proposal that requires automakers selling internet-connected cars to do more to protect domestic abu… [+1786 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Theron Mohamed",
//             "title": "Oracle's Larry Ellison is now the world's 4th-richest person after a  57 billion wealth surge this year",
//             "description": "Larry Ellison has overtaken LVMH's Bernard Arnault, Microsoft's Bill Gates and Steve Ballmer, and Google's Larry Page in wealth gains this year.",
//             "url": "https://www.businessinsider.com/larry-ellison-oracle-wealth-tesla-stock-billionaires-rich-list-ai-2024-9",
//             "urlToImage": "https://i.insider.com/66e94f57d17aa3c7b2b33ae2?width=1200&format=jpeg",
//             "publishedAt": "2024-09-17T10:22:32Z",
//             "content": "Larry Ellison also owns a stake in Tesla worth about  10 billion.Justin Sullivan/Getty Images\r\n<ul><li>Larry Ellison surged past LVMH chief Bernard Arnault to become the world's fourth-richest person… [+2190 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "heise online"
//             },
//             "author": "dpa",
//             "title": "Tesla Grünheide: Hausbesuche wegen hohen Krankenstands",
//             "description": "Tesla beklagt einen zu hohen Krankenstand, der Personalchef macht unangekündigte Hausbesuche. Werksleiter Thierig hält das nicht für ungewöhnlich.",
//             "url": "https://www.heise.de/news/Tesla-Gruenheide-Hausbesuche-wegen-hohen-Krankenstands-9954614.html",
//             "urlToImage": "https://heise.cloudimg.io/bound/1200x1200/q85.png-lossy-85.webp-lossy-85.foil1/_www-heise-de_/imgs/18/4/6/7/6/8/4/9/4_GigafactoryBerlinBrandenburg_04-6ca3c94e1d8a3ac4.jpg",
//             "publishedAt": "2024-09-26T13:43:00Z",
//             "content": "Der Leiter des Tesla-Werks in Grünheide hat Hausbesuche bei Mitarbeitern wegen häufiger Krankschreibungen verteidigt. Knapp 12.000 Beschäftigte stellen dort seit mehr als zwei Jahren Elektroautos her… [+3091 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Digital Trends"
//             },
//             "author": "Ronan Glon",
//             "title": "You can now charge your General Motors EV at a Tesla Supercharger",
//             "description": "Owners of a General Motors-built EV can now charge at any Tesla Supercharger station after buying an adapter.",
//             "url": "https://www.digitaltrends.com/cars/general-motors-adds-tesla-supercharger-compatibility/",
//             "urlToImage": "https://www.digitaltrends.com/wp-content/uploads/2024/09/GM-opens-up-access-to-more-than-17800-Tesla-Superchargers-3.jpg?resize=1200%2C630&p=1",
//             "publishedAt": "2024-09-19T15:40:21Z",
//             "content": "Taking a road trip in a General Motors-built electric car just got a lot more convenient. EVs made by Chevrolet, GMC, and Cadillac are now compatible with Tesla’s Supercharger charging stations, thou… [+1742 chars]"
//         },
//         {
//             "source": {
//                 "id": "wired",
//                 "name": "Wired"
//             },
//             "author": "Simon Hill",
//             "title": "All the Top New Gadgets at IFA 2024",
//             "description": "A phone with magnetic mods, a new handheld gaming console, and a robot vacuum that can climb stairs. Here’s the best new gear announced at IFA in Berlin.",
//             "url": "https://www.wired.com/story/all-the-top-new-gadgets-at-ifa-2024/",
//             "urlToImage": "https://media.wired.com/photos/66da52e730c2cca5a2497abf/191:100/w_1280,c_limit/IFA-Messedamm-SOURCE-Simon-Hill.jpg",
//             "publishedAt": "2024-09-06T09:30:00Z",
//             "content": "To start, HMD is making a handful of these outfits. Theres a gaming controller outfit that adds controls to the sides of the phone, turning it into a gaming handheld of sorts. Some mods are simple, l… [+4999 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "CarScoops"
//             },
//             "author": "Thanos Pappas",
//             "title": "Oakland Police Are Towing Teslas for Crime Scene Footage",
//             "description": "If you own a Tesla, you might be unintentionally involved with a crime scene if your vehicle was parked nearby",
//             "url": "https://www.carscoops.com/2024/09/california-police-might-use-your-teslas-sentry-video-to-solve-nearby-crimes/",
//             "urlToImage": "https://www.carscoops.com/wp-content/uploads/2024/09/Tesla-Car-Witness.jpg",
//             "publishedAt": "2024-09-03T21:02:32Z",
//             "content": "If you own a Tesla, you might be unintentionally involved with a crime scene if your vehicle was parked nearby \r\n<ul><li>Oakland Police request footage from Teslas parked near crime scenes to aid inv… [+3235 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Yahoo Entertainment"
//             },
//             "author": "Michael Stallone",
//             "title": "New Jersey wrong-way crash leaves at least 5 injured; person in custody",
//             "description": "According to police, at least five people were injured, including two who were trapped in one of the vehicles.",
//             "url": "https://www.yahoo.com/news/jersey-wrong-way-crash-leaves-110725699.html",
//             "urlToImage": "https://s.yimg.com/ny/api/res/1.2/mrckp2pceRTLzsRocSzsgQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTEyMDA7aD02NzU-/https://media.zenfs.com/en/wnyw_fox_local_articles_540/a2a71e21a45c9614e849418607d4ad7e",
//             "publishedAt": "2024-09-16T11:07:25Z",
//             "content": "NEW JERSEY - One person is in custody after a wrong-way crash on Route 4 in Teaneck, NJ left multiple people injured, police said.\r\nThe crash happened on Sunday around 11:30 p.m.\r\nA wrong-way crash o… [+916 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Substack.com"
//             },
//             "author": "Motorhead",
//             "title": "The Tesla Files Unveil More Accounting Fraud Than Imagined",
//             "description": "The recent filing in the \"Greenspan v. Musk et al\" lawsuit reads like a great crime novel. But it's all likely real based on Tesla's internal data",
//             "url": "https://bradmunchen.substack.com/p/the-tesla-files-unveil-more-accounting",
//             "urlToImage": "https://substackcdn.com/image/fetch/w_1200,h_600,c_fill,f_jpg,q_auto:good,fl_progressive:steep,g_auto/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fc1851a2c-1d04-4e3c-9f61-29c78c43541c_780x785.jpeg",
//             "publishedAt": "2024-08-31T15:19:18Z",
//             "content": "I was preparing my usual Tesla Weekly until Aaron Greenspan dropped his explosive filing on Wednesday against Musk and Tesla, which highlighted loads of details from the Tesla Files on their egregiou… [+16800 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Xataka.com"
//             },
//             "author": "Rubén Andrés",
//             "title": "Cheste tiene previsto construir un megapolígono industrial: Tesla e Inditex ya le han echado el ojo",
//             "description": "Cheste, con una población de apenas 9.000 habitantes, puede convertirse en un punto de interés estratégico para corporaciones de la talla de Tesla o Inditex. Lo que ha despertado ese interés de las empresas de Elon Musk y Amancio Ortega son los planes para co…",
//             "url": "https://www.xataka.com/empresas-y-economia/cheste-tiene-previsto-construir-megapoligono-industrial-tesla-e-inditex-le-han-echado-ojo",
//             "urlToImage": "https://i.blogs.es/57d94a/tesla-inditex-y-cheste/840_560.jpeg",
//             "publishedAt": "2024-09-27T15:01:38Z",
//             "content": "Cheste, con una población de apenas 9.000 habitantes, puede convertirse en un punto de interés estratégico para corporaciones de la talla de Tesla o Inditex. Lo que ha despertado ese interés de las e… [+3846 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "heise online"
//             },
//             "author": "Stefan Grundhoff",
//             "title": "Mit dem Tesla Cybertruck in die Everglades: Jenseits des Gewöhnlichen",
//             "description": "Tesla liefert mit dem Cybertruck einen Pick-up, der stärker polarisiert als alle Konkurrenten. Wie fährt sich dieses ungewöhnliche Elektroauto?",
//             "url": "https://www.heise.de/tests/Mit-dem-Tesla-Cybertruck-in-die-Everglades-Jenseits-des-Gewoehnlichen-9862186.html?wt_mc=rss.red.ho.ho.atom.beitrag.beitrag",
//             "urlToImage": "https://heise.cloudimg.io/bound/1200x1200/q85.png-lossy-85.webp-lossy-85.foil1/_www-heise-de_/imgs/18/4/6/6/6/1/0/2/01-14820d731d800acf.jpg",
//             "publishedAt": "2024-09-09T13:54:00Z",
//             "content": "Inhaltsverzeichnis\r\nEin Export nach Europa scheint in der derzeitigen Form ausgeschlossen, und dennoch bekommt der Tesla Cybertruck auch hierzulande eine Menge Aufmerksamkeit. Design und Dimensionen … [+6295 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Yahoo Entertainment"
//             },
//             "author": null,
//             "title": "Fleet operator reveals astonishing performance of Tesla Semi in 6,000-mile trial: 'Electric trucks will take over fleets'",
//             "description": null,
//             "url": "https://consent.yahoo.com/v2/collectConsent?sessionId=1_cc-session_b8ab6868-356a-47b0-a58f-70eca523abaf",
//             "urlToImage": null,
//             "publishedAt": "2024-09-27T11:00:57Z",
//             "content": "If you click 'Accept all', we and our partners, including 240 who are part of the IAB Transparency &amp; Consent Framework, will also store and/or access information on a device (in other words, use … [+678 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Yahoo Entertainment"
//             },
//             "author": "Leo Sun, The Motley Fool",
//             "title": "Could Rivian Automotive Become the Next Tesla?",
//             "description": "The electric pickup truck maker still needs to overcome a lot of challenges.",
//             "url": "https://finance.yahoo.com/news/could-rivian-automotive-become-next-114000324.html/",
//             "urlToImage": "https://s.yimg.com/cv/apiv2/social/images/yahoo_default_logo.png",
//             "publishedAt": "2024-09-22T11:40:00Z",
//             "content": "When Rivian Automotive(NASDAQ: RIVN) went public in November 2021, many optimistic investors thought it could become the next Tesla(NASDAQ: TSLA). Rivian was already manufacturing thousands of electr… [+6460 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "BBC News"
//             },
//             "author": null,
//             "title": "Trump says Musk could head 'government efficiency' force",
//             "description": "In a speech at an economic club Thursday, the former president endorsed the Tesla boss's idea for a task force on government spending",
//             "url": "https://www.bbc.com/news/articles/c74lgwkrmrpo",
//             "urlToImage": "https://ichef.bbci.co.uk/news/1024/branded_news/0845/live/8a18f5d0-6bbc-11ef-b970-9f202720b57a.jpg",
//             "publishedAt": "2024-09-05T20:04:40Z",
//             "content": "Donald Trump said he would enlist Elon Musk to run a government efficiency commission if he wins a second term as US president.\r\nSpeaking to the Economic Club of New York on Thursday, Trump said the … [+3633 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Autoblog"
//             },
//             "author": "Insider",
//             "title": "Tesla boosts sales in China — and may be planning a 6-seat Model Y",
//             "description": "Filed under:\n Government/Legal,Green,Volkswagen,Emissions,Diesel Vehicles\n Continue reading Tesla boosts sales in China — and may be planning a 6-seat Model Y\nTesla boosts sales in China — and may be planning a 6-seat Model Y originally appeared on Autoblog o…",
//             "url": "https://www.autoblog.com/2024/09/03/tesla-boosts-sales-in-china-and-may-be-planning-a-6-seat-model-y/",
//             "urlToImage": "https://edgecast-img.yahoo.net/mysterio/api/F5FB75D2CE9C3889642965BFB5BB461B54A37CC89CC13F50839CFFCB0C42BB70/autoblog/resizefill_w1200_h675;quality_85;format_webp;cc_31536000;/https://s.aolcdn.com/images/dims3/GLOB/crop/3555x2000 0 213/resize/1200x675/format/jpg/quality/100/https://media.zenfs.com/en/business_insider_articles_888/cd9f1f3f30014b7636ede16b0cd4a3be",
//             "publishedAt": "2024-09-03T10:31:00Z",
//             "content": "Tesla sales in China are on the up.VCG\r\nThings are beginning to look up for Tesla in China.\r\nAfter a global demand slowdown, Tesla saw a boost in electric vehicle sales and had its best month of the … [+1694 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "heise online"
//             },
//             "author": "Christoph M. Schwarzer",
//             "title": "heise+ | Wo Tesla nachholen muss (und es auch tun wird)",
//             "description": "Tesla legt zurzeit den Fokus auf Skalen- und Kosteneffekte statt auf Innovation, manches stagniert dadurch. Beispiele zeigen, wo neues Potenzial entsteht.",
//             "url": "https://www.heise.de/hintergrund/Wo-Tesla-nachholen-muss-und-es-auch-tun-wird-9858694.html?wt_mc=rss.red.ho.ho.atom.beitrag_plus.beitrag_plus",
//             "urlToImage": "https://heise.cloudimg.io/bound/1200x1200/q85.png-lossy-85.webp-lossy-85.foil1/_www-heise-de_/imgs/18/4/6/6/4/2/6/1/Tesla_Model_Y_das_aktuell_meistverkaufte_Auto_der_Welt_2-4db8ee2d5c80246c.jpg",
//             "publishedAt": "2024-09-06T05:30:00Z",
//             "content": "Inhaltsverzeichnis\r\n100.006 Exemplare: Das Tesla Model Y war im ersten Halbjahr das meistverkaufte Elektroauto in Europa. Laut der Analyse von Schmidt Automotive Research folgt das Model 3 mit 53.239… [+1917 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Xataka.com"
//             },
//             "author": "Rubén Andrés",
//             "title": "El presidente de Chechenia tiene un Tesla Cybertruck con ametralladora. Cómo ha llegado hasta ahí es un misterio",
//             "description": "Ramzán Kadírov es uno de los mandatarios más fieles al presidente ruso Vladímir Putin dentro de Rusia. Jefe de la República de Chechenia desde 2007, se ha hecho célebre durante los últimos años por su peculiar percepción de la música y por la represión hacia …",
//             "url": "https://www.xataka.com/movilidad/lider-checheno-afirmaba-que-elon-musk-le-habia-regalado-cybertruck-ametralladora-ahora-le-acusa-bloquearselo",
//             "urlToImage": "https://i.blogs.es/f03174/tesla-checheno/840_560.jpeg",
//             "publishedAt": "2024-09-28T12:01:44Z",
//             "content": "Ramzán Kadírov es uno de los mandatarios más fieles al presidente ruso Vladímir Putin dentro de Rusia. Jefe de la República de Chechenia desde 2007, se ha hecho célebre durante los últimos años por s… [+3609 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Tom Carter",
//             "title": "Chinese EVs you can buy in Europe — but not in the US",
//             "description": "China's electric vehicle giants were effectively shut out of the US in May when the government imposed crippling tariffs.",
//             "url": "https://www.businessinsider.com/chinese-electric-cars-you-can-buy-in-europe-not-us-2024-9",
//             "urlToImage": "https://i.insider.com/66e048585444ffafa763f117?width=1200&format=jpeg",
//             "publishedAt": "2024-09-11T10:03:03Z",
//             "content": "The BYD Dolphin is one of China's best-selling cars, and is available in Europe.John Keeble/Getty Images\r\n<ul><li>Chinese EV firms like BYD have been effectively shut out of the US thanks to high tar… [+3790 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Hasan Chowdhury",
//             "title": "Uber is reviving its robotaxi dreams — with help from some former rivals",
//             "description": "Uber is partnering with the likes of Wayve and Cruise to offer robotaxis to customers on its platform.",
//             "url": "https://www.businessinsider.com/uber-robotaxi-wayve-dream-rivals-cruise-byd-2024-8",
//             "urlToImage": "https://i.insider.com/66d1cc8e1d8d2deb96b7a062?width=1200&format=jpeg",
//             "publishedAt": "2024-08-31T11:04:02Z",
//             "content": "Uber CEO Dara Khosrowshahi is ramping up Uber's robotaxi ambitions again.Spencer Platt\r\n<ul><li>Uber's getting serious about robotaxis again.</li><li>It sold its self-driving unit in 2020, but is par… [+4835 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Yahoo Entertainment"
//             },
//             "author": "Danny Gallagher",
//             "title": "FAA wants to impose more than  630K in fines for SpaceX launch violations",
//             "description": "The Federal Aviation Administration (FAA) alleges that SpaceX committed three safety violations by failing to follow its license requirements during two of its space launches in 2023. If the full fines are imposed, SpaceX faces a bill of  633,009, according t…",
//             "url": "https://consent.yahoo.com/v2/collectConsent?sessionId=1_cc-session_3119154d-0725-42f6-8e12-5b21b84bc28e",
//             "urlToImage": null,
//             "publishedAt": "2024-09-17T22:34:09Z",
//             "content": "If you click 'Accept all', we and our partners, including 239 who are part of the IAB Transparency &amp; Consent Framework, will also store and/or access information on a device (in other words, use … [+678 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Yahoo Entertainment"
//             },
//             "author": "Danny Gallagher",
//             "title": "The X TV app is out now and yes, it really sucks",
//             "description": "X has entered the streaming wars, sort of. Owner Elon Musk\r\n announced that the X TV app — teased earlier this year\r\n — is available now for some Amazon Fire TVs, Google TVs and some LG panels.\nIf your TV doesn’t fit into one of those categories, don’t fret. …",
//             "url": "https://consent.yahoo.com/v2/collectConsent?sessionId=1_cc-session_2e1ec5df-1db1-44a0-b2ef-b8d854ca4ff4",
//             "urlToImage": null,
//             "publishedAt": "2024-09-03T20:49:32Z",
//             "content": "If you click 'Accept all', we and our partners, including 239 who are part of the IAB Transparency &amp; Consent Framework, will also store and/or access information on a device (in other words, use … [+678 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Lian Kit Wee",
//             "title": "Take a look inside the LA home Elon Musk is foreclosing on, which once belonged to Hollywood royalty",
//             "description": "The Bel-Air home is facing foreclosure, with Elon Musk's team moving to reclaim the property after missed payments from Wilder's nephew and his wife.",
//             "url": "https://www.businessinsider.com/pictures-los-angeles-home-elon-musk-foreclosing-gene-wilder-belair-2024-8",
//             "urlToImage": "https://i.insider.com/66d1987f1d8d2deb96b795c3?width=1200&format=jpeg",
//             "publishedAt": "2024-09-01T00:00:02Z",
//             "content": "The home that once belonged to Gene Wilder, and later Elon Musk, is listed at nearly  13 million.Drew Meyers\r\n<ul><li>The Bel-Air home of Gene Wilder, the late star of \"Willy Wonka & the Chocolate Fa… [+2901 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Jordan Hart",
//             "title": "Elon Musk explains his 80/20 prediction for what AI means for humans",
//             "description": "Elon Musk there's a better chance that AI results in a better future — but he thinks there's still a 20% chance of \"human annihilation.\"",
//             "url": "https://www.businessinsider.com/elon-musk-all-in-podcast-ai-prediction-2024-9",
//             "urlToImage": "https://i.insider.com/66e1a83a5444ffafa7645821?width=1200&format=jpeg",
//             "publishedAt": "2024-09-11T19:14:38Z",
//             "content": "Elon Musk said robots will outnumber humans in about 30 years.All-In Podcast/Getty Images\r\n<ul><li>Elon Musk predicted an 80% chance of prosperity and 20% risk of annihilation in the future.</li><li>… [+2628 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Brent D. Griffiths",
//             "title": "Secret Service is investigating Elon Musk's 'Biden/Kamala' assassination tweet",
//             "description": "The Secret Service investigates threats, even perceived ones, made against the president, though Elon Musk is unlikely to face serious repercussions",
//             "url": "https://www.businessinsider.com/secret-service-elon-musk-investigation-tweet-biden-kamala-assassination-2024-9",
//             "urlToImage": "https://i.insider.com/66ec509bcfb7f307e5731bcd?width=1200&format=jpeg",
//             "publishedAt": "2024-09-19T16:56:50Z",
//             "content": "Tesla CEO Elon Musk has said that a tweet questioning why no one was trying to kill President Joe Biden or Vice President Kamala Harris was a joke.Marc Piasecki/Getty Images\r\n<ul><li>The Secret Servi… [+3502 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Xataka.com"
//             },
//             "author": "Ricardo Aguilar",
//             "title": "BYD continúa con su plan para conquistar Europa: Alemania será su principal puerta de entrada",
//             "description": "BYD ha llegado a un acuerdo con Hedin Mobility Group para adquirir su división Hedin Electric Mobility. Este es el principal distribuidor de vehículos y repuestos de BYD en Alemania, el intermediario al que acudir para hacernos con sus coches.\n<!-- BREAK 1 --…",
//             "url": "https://www.xataka.com/movilidad/byd-continua-su-plan-para-conquistar-europa-alemania-sera-su-principal-puerta-entrada",
//             "urlToImage": "https://i.blogs.es/e1acaa/byd/840_560.jpeg",
//             "publishedAt": "2024-09-03T14:31:26Z",
//             "content": "BYD ha llegado a un acuerdo con Hedin Mobility Group para adquirir su división Hedin Electric Mobility. Este es el principal distribuidor de vehículos y repuestos de BYD en Alemania, el intermediario… [+1910 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Yahoo Entertainment"
//             },
//             "author": null,
//             "title": "Here's What Consumer Reports Thinks Of The Tesla Cybertruck",
//             "description": null,
//             "url": "https://consent.yahoo.com/v2/collectConsent?sessionId=1_cc-session_1bb15fa5-259c-437b-813f-c7f8f3846bbc",
//             "urlToImage": null,
//             "publishedAt": "2024-09-30T16:30:00Z",
//             "content": "If you click 'Accept all', we and our partners, including 240 who are part of the IAB Transparency &amp; Consent Framework, will also store and/or access information on a device (in other words, use … [+678 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Xataka.com"
//             },
//             "author": "Enrique Pérez",
//             "title": "Xpeng llega a España: la marca china aterriza con tres coches eléctricos que apuntan directamente contra Tesla",
//             "description": "El fabricante de coches eléctricos chino Xpeng acaba de anunciar su llegada oficial a España. Lo hace con tres modelos de gama media-alta, que apuntan directamente contra algunos de los modelos más populares de Tesla.\n<!-- BREAK 1 -->\nNo es el primer país eur…",
//             "url": "https://www.xataka.com/movilidad/xpeng-llega-a-espana-marca-china-aterriza-tres-coches-electricos-que-apuntan-directamente-tesla",
//             "urlToImage": "https://i.blogs.es/17ebe0/xpeng-g6/840_560.jpeg",
//             "publishedAt": "2024-09-25T09:27:43Z",
//             "content": "El fabricante de coches eléctricos chino Xpeng acaba de anunciar su llegada oficial a España. Lo hace con tres modelos de gama media-alta, que apuntan directamente contra algunos de los modelos más p… [+3817 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "NPR"
//             },
//             "author": "Terry Gross",
//             "title": "What Musk's Twitter takeover could tell us about a possible government appointment",
//             "description": "After buying Twitter in 2022, Elon Musk instituted sweeping changes — including rebranding the social media platform as \"X.\" Authors Kate Conger and Ryan Mac recount the takeover in Character Limit.",
//             "url": "https://www.npr.org/2024/09/11/nx-s1-5107969/elon-musk-twitter-x-trump-audit",
//             "urlToImage": "https://npr.brightspotcdn.com/dims3/default/strip/false/crop/6300x3541+0+240/resize/1400/quality/100/format/jpeg/?url=http%3A%2F%2Fnpr-brightspot.s3.amazonaws.com%2Fa4%2Faa%2Fbcfb958d4f16a308a1ceb399e516%2Fgettyimages-1782225491.jpg",
//             "publishedAt": "2024-09-11T19:43:27Z",
//             "content": "Former President Donald Trump has said that if reelected, he will appoint Elon Musk to head up a new efficiency commission with the mission of conducting an audit of the entire federal government and… [+11343 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Golem.de"
//             },
//             "author": "Andreas Donath",
//             "title": "Patentanträge: Tesla plant offenbar kabellose Ladestation",
//             "description": "Tesla hat mehrere Patente für eine kabellose Ladefunktion für die heimische Garage oder für Robotaxis eingereicht. Noch fehlt ein konkretes Produkt. (Tesla, Elektroauto)",
//             "url": "https://www.golem.de/sonstiges/zustimmung/auswahl.html?from=https%3A%2F%2Fwww.golem.de%2Fnews%2Fpatentantraege-tesla-plant-offenbar-kabellose-ladestation-2409-188790.html&referer=https%3A%2F%2Ft.co%2F7cd5e6da74",
//             "urlToImage": null,
//             "publishedAt": "2024-09-09T06:59:01Z",
//             "content": "Besuchen Sie Golem.de wie gewohnt mit Werbung und Tracking,\r\n indem Sie der Nutzung aller Cookies zustimmen.\r\n Details zum Tracking finden Sie im Privacy Center.\r\nSkript wurde nicht geladen. Informat… [+607 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Golem.de"
//             },
//             "author": "Andreas Donath",
//             "title": "Elon Musk: Kadyrow beschuldigt Tesla der Cybertruck-Sabotage",
//             "description": "Ramsan Kadyrow behauptet, dass Tesla seinen Cybertruck aus der Ferne deaktivieren ließ. Er wollte ihn im Krieg einsetzen. (Tesla Cybertruck, Elektroauto)",
//             "url": "https://www.golem.de/sonstiges/zustimmung/auswahl.html?from=https%3A%2F%2Fwww.golem.de%2Fnews%2Felon-musk-kadyrow-beschuldigt-tesla-der-cybertruck-sabotage-2409-189142.html&referer=https%3A%2F%2Ft.co%2F7eac43fa3d",
//             "urlToImage": null,
//             "publishedAt": "2024-09-20T07:01:02Z",
//             "content": "Besuchen Sie Golem.de wie gewohnt mit Werbung und Tracking,\r\n indem Sie der Nutzung aller Cookies zustimmen.\r\n Details zum Tracking finden Sie im Privacy Center.\r\nSkript wurde nicht geladen. Informat… [+607 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Journal du geek"
//             },
//             "author": "Olivier",
//             "title": "Tesla améliore l’ouverture mains libres du frunk",
//             "description": "Comment ouvrir le coffre avant de sa voiture quand on a les bras chargés de courses ? Tesla a trouvé la solution avec une nouvelle fonction d’ouverture mains libres du frunk (ou coffre avant). Cette mise à jour incluse dans le dernier logiciel 2024.32.3, vien…",
//             "url": "https://www.journaldugeek.com/2024/09/16/tesla-ameliore-louverture-mains-libres-du-frunk/",
//             "urlToImage": "https://www.journaldugeek.com/app/uploads/2024/07/voiture-electrique-tesla.jpg",
//             "publishedAt": "2024-09-16T06:00:11Z",
//             "content": "La nouvelle mise à jour 2024.32.3 du logiciel Tesla intègre une fonctionnalité très pratique pour les propriétaires de véhicules équipés de la technologie ultrawideband (UWB). Celle-ci est présente s… [+2256 chars]"
//         },
//         {
//             "source": {
//                 "id": "business-insider",
//                 "name": "Business Insider"
//             },
//             "author": "Lakshmi Varanasi",
//             "title": "The first thing OpenAI CTO Mira Murati's mother asked ChatGPT is hilarious",
//             "description": "Mira Murati's mother used ChatGPT to investigate the OpenAI executive's personal life.",
//             "url": "https://www.businessinsider.com/openai-cto-mira-murati-personal-life-husband-married-2024-9",
//             "urlToImage": "https://i.insider.com/66dcaed25444ffafa7638163?width=1200&format=jpeg",
//             "publishedAt": "2024-09-07T20:27:46Z",
//             "content": "OpenAI CTO Mira Murati shared her mother's first interaction with ChatGPT.Bloomberg/ Getty Images\r\n<ul><li>Mira Murati is OpenAI's influential chief technology officer.</li><li>Murati, an engineer, h… [+1545 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "heise online"
//             },
//             "author": "Christoph M. Schwarzer",
//             "title": "heise+ | Elektroauto BYD Seal im Test: Was der Model-3-Rivale leistet",
//             "description": "Der BYD Seal hinterlässt im Test einen ordentlichen Eindruck. An einigen Schwächen arbeitet die Marke gerade, und das ist auch notwendig.",
//             "url": "https://www.heise.de/tests/Elektroauto-BYD-Seal-im-Test-Insgesamt-gelungen-mit-markanten-Schwaechen-9860223.html?wt_mc=rss.red.ho.ho.atom.beitrag_plus.beitrag_plus",
//             "urlToImage": "https://heise.cloudimg.io/bound/1200x1200/q85.png-lossy-85.webp-lossy-85.foil1/_www-heise-de_/imgs/18/4/6/6/5/0/8/7/SEA01-c2a3dfbb0b5636e3.jpg",
//             "publishedAt": "2024-09-11T07:00:00Z",
//             "content": "Inhaltsverzeichnis\r\nBYD ist nicht zufrieden: 1432 Neuzulassungen bis inklusive Juli und über alle Baureihen sind zu wenig. Stella Li, die dem Europageschäft vorsteht, hat sich von der Hedin-Gruppe al… [+2484 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "heise online"
//             },
//             "author": "dpa",
//             "title": "Musk erklärt hohen Krankenstand in Grünheide zur Chefsache",
//             "description": "Teslas Personalchef in Grünheide macht Hausbesuche bei häufig krankgeschriebenen Beschäftigten. Jetzt hat sich auch CEO Elon Musk zu Wort gemeldet.",
//             "url": "https://www.heise.de/news/Musk-erklaert-hohen-Krankenstand-in-Gruenheide-zur-Chefsache-9956507.html",
//             "urlToImage": "https://heise.cloudimg.io/bound/1200x1200/q85.png-lossy-85.webp-lossy-85.foil1/_www-heise-de_/imgs/18/4/6/7/7/8/2/3/shutterstock_1837404886-9ed0bcc1df406f1b.jpg",
//             "publishedAt": "2024-09-28T09:40:00Z",
//             "content": "Wegen des hohen Krankenstands im Tesla-Werk in Grünheide will sich Firmenchef Elon Musk persönlich ein Bild von der Lage machen. \"Das klingt verrückt. Ich schaue mir das an\", kommentierte er einen X-… [+1227 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Autoblog"
//             },
//             "author": "Associated Press",
//             "title": "Experts say Tesla's 'Full Self-Driving' system is dangerous",
//             "description": "Filed under:\n Government/Legal,Tesla,Driving,Safety,Technology,Autonomous Vehicles\n Continue reading Experts say Tesla's 'Full Self-Driving' system is dangerous\nExperts say Tesla's 'Full Self-Driving' system is dangerous originally appeared on Autoblog on Sat…",
//             "url": "https://www.autoblog.com/2024/08/31/experts-tesla-full-self-driving-dangerous/",
//             "urlToImage": "https://edgecast-img.yahoo.net/mysterio/api/47B3DA24609BF40B5202ED6058069EA9120167ABC9C6C9FD216C89AE11E73687/autoblog/resizefill_w1200_h675;quality_85;format_webp;cc_31536000;/https://s.aolcdn.com/images/dims3/GLOB/legacy_thumbnail/1200x675/format/jpg/quality/100/https://s.aolcdn.com/os/ab/_cms/2020/07/22104208/Tesla-Model_31.jpg",
//             "publishedAt": "2024-08-31T15:00:00Z",
//             "content": "DETROIT Three times in the past four months, William Stein, a technology analyst at Truist Securities, has taken Elon Musk up on his invitation to try the latest versions of Teslas vaunted Full Self-… [+8409 chars]"
//         },
//         {
//             "source": {
//                 "id": "die-zeit",
//                 "name": "Die Zeit"
//             },
//             "author": "ZEIT ONLINE: News -",
//             "title": "Protest gegen Tesla-Werk: Polizeieinsatz am Tesla-Camp - Protest aber nicht betroffen",
//             "description": "Hier finden Sie Informationen zu dem Thema „Protest gegen Tesla-Werk“. Lesen Sie jetzt „Polizeieinsatz am Tesla-Camp - Protest aber nicht betroffen“.",
//             "url": "https://www.zeit.de/news/2024-09/24/polizeieinsatz-am-tesla-camp-protest-aber-nicht-betroffen",
//             "urlToImage": "https://img.zeit.de/news/2024-09/24/polizeieinsatz-am-tesla-camp-protest-aber-nicht-betroffen-image-group/wide__1300x731",
//             "publishedAt": "2024-09-24T06:00:09Z",
//             "content": "Am Protestcamp in der Nähe des Tesla-Werks in Grünheide ist seit den frühen Morgenstunden die Polizei im Einsatz. «Im Rahmen von Baumaßnahmen der Deutschen Bahn wurde die Polizei Brandenburg zur Absi… [+1559 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Slashdot.org"
//             },
//             "author": "BeauHD",
//             "title": " 1 Billion Solar and Battery Storage Project Breaks Ground In Utah",
//             "description": "rPlus Energies has broken ground on a  1 billion solar + battery storage project in east-central Utah. Electrek reports: The Green River Energy Center in Emery County, Utah, is a 400-megawatt (MW) solar and 400 MW/1,600-megawatt-hour battery storage project t…",
//             "url": "https://hardware.slashdot.org/story/24/09/23/2327225/1-billion-solar-and-battery-storage-project-breaks-ground-in-utah",
//             "urlToImage": "https://a.fsdn.com/sd/topics/power_64.png",
//             "publishedAt": "2024-09-24T02:10:00Z",
//             "content": "Check out the new Slashdot job board to browse remote jobs or jobs in your areaDo you develop on GitHub? You can keep using GitHub but automatically sync your GitHub releases to SourceForge quickly a… [+228 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Jalopnik"
//             },
//             "author": "Lawrence Hodge",
//             "title": "Police Catch Man With  100,000 In Drugs After He Fell Asleep Behind The Wheel Of His Tesla On Autopilot",
//             "description": "A Tesla driver learned the hard way that yes, you still need to keep your hands on the wheel in a Tesla and yes, you really aren’t allowed to smuggle drugs. Read more...",
//             "url": "https://jalopnik.com/police-catch-man-with-100-000-in-drugs-after-he-fell-a-1851640339",
//             "urlToImage": "https://i.kinja-img.com/image/upload/c_fill,h_675,pg_1,q_80,w_1200/cd52cc88c4fd0351514eabc62b7c33ab.jpg",
//             "publishedAt": "2024-09-05T15:00:00Z",
//             "content": "A Tesla driver learned the hard way that yes, you still need to keep your hands on the wheel in a Tesla and yes, you really arent allowed to smuggle drugs. \r\nFirst spotted by Road &amp; Track, the in… [+1717 chars]"
//         },
//         {
//             "source": {
//                 "id": null,
//                 "name": "Autoblog"
//             },
//             "author": "Insider",
//             "title": "Tesla's summon feature just got a lot smarter — and a cheeky new name",
//             "description": "Filed under:\n By the Numbers,Design/Style,Volvo,Crossover,SUV,Electric,Future Vehicles,Sedan\n Continue reading Tesla's summon feature just got a lot smarter — and a cheeky new name\nTesla's summon feature just got a lot smarter — and a cheeky new name original…",
//             "url": "https://www.autoblog.com/2024/09/04/tesla-summon-feature-just-got-a-lot-smarter-and-a-cheeky-new-name/",
//             "urlToImage": "https://edgecast-img.yahoo.net/mysterio/api/6D33627B60CBDF2C045E193566CAB0D7F69016BB67B45BDDAFDFE1A6ACD34258/autoblog/resizefill_w1200_h675;quality_85;format_webp;cc_31536000;/https://o.aolcdn.com/images/dims3/GLOB/legacy_thumbnail/1062x597/format/jpg/quality/100/https://media.zenfs.com/en/business_insider_articles_888/80875e5ec3e2d97bac816e13f007628c",
//             "publishedAt": "2024-09-04T16:04:00Z",
//             "content": "Tesla launched their Actual Smart Summon feature.SOPA Images/Getty Images\r\nTesla's car lineup just got a cheeky upgrade with a dose of classic Elon Musk humor.\r\nThe company has finally begun rolling … [+2380 chars]"
//         }
//     ]
// }''';
// }

class StaticValue{
  static String username = "";

//esewa
  static var CLIENT_ID = "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R";
  static var SECRET_KEY = "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==";
}


