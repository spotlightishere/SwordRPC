//
//  SwordRPCTests.swift
//
//
//  Created by Deltaion Lee on 7/16/24.
//

@testable import SwordRPC
import XCTest

class SwordRPC_DiscordTests: XCTestCase, SwordRPCDelegate {
    // Use Ongaku's app ID.
    let rpc = SwordRPC(appId: "402370117901484042")

    override func setUp() {
        super.setUp()

        // Connect to the Discord client.
        rpc.connect()
    }

    // Example RPC test
    func testPresence() {
        // Create Rich Presence object.
        var presence = RichPresence()

        // Assign state & details.
        presence.state = "Love Me Again"
        presence.details = "John Newman – Tribute"

        // Assign image properties.
        presence.assets.largeImage = "big_sur_logo"
        presence.assets.largeText = "Apple Music"
        presence.assets.smallImage = "play"
        presence.assets.smallText = "Playing"

        // Create timestamps.
        presence.timestamps.start = Date()
        presence.timestamps.end = Date(timeIntervalSinceNow: 240)

        // Push over RPC to client.
        rpc.setPresence(presence)

        // Hold main thread for five seconds.
        rpc.log.notice("Now waiting five seconds...")
        Thread.sleep(forTimeInterval: 5)
    }
}