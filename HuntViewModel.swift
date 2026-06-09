import SwiftUI
import Combine

// This class controls the app data, progress, item status, and reward messages.
class HuntViewModel: ObservableObject {
    
    // Stores all scavenger hunt items and updates the screen when an item changes.
    @Published var items: [HuntItem] = sampleHuntItems
    
    // Shows an alert after the user simulates taking a picture.
    @Published var showCameraAlert = false
    
    // Shows an alert after the user submits their results.
    @Published var showSubmitAlert = false
    
    // Counts how many items have been found.
    var foundCount: Int {
        items.filter { $0.isFound }.count
    }
    
    // Displays the user's progress.
    var progressText: String {
        "\(foundCount) out of \(items.count) items found"
    }
    
    // Gives the correct reward based on how many items were found.
    var discountMessage: String {
        if foundCount == 10 {
            return "Congratulations! You found all 10 items. You receive a 20% discount code and entry into the $5000 grand prize draw."
        } else if foundCount >= 7 {
            return "Great job! You found 7 or more items and receive a 20% discount code."
        } else if foundCount >= 5 {
            return "Good work! You found 5 or more items and receive a 10% discount code."
        } else {
            return "Keep hunting! Find at least 5 items to earn a discount code."
        }
    }
    
    // Marks an item as found after the user taps the camera button.
    func markAsFound(item: HuntItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isFound = true
            showCameraAlert = true
        }
    }
    
    // Simulates submitting the results online.
    func submitResults() {
        showSubmitAlert = true
    }
}
