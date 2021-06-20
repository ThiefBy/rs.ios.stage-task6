import Foundation

class CoronaClass {
    
    var seats = [Int]()
    var lastSeatNumber = 0;
    
    init(n: Int) {
        lastSeatNumber = n-1;
    }
    
    func seat() -> Int {
        var place = 0
        if(seats.count == 1){
            place = seats.first! >= lastSeatNumber-seats.first! ? 0 : lastSeatNumber
        }
        else if (seats.count > 0){
            place = getFreePlace()
        }
        
        seats = (seats + [place]).sorted()
        return place
    }
    
    func getFreePlace() -> Int {
        var (maxDiff, place) = seats.first! >= lastSeatNumber-seats.last!
            ? (seats.first!, 0)
            : (lastSeatNumber-seats.last!, lastSeatNumber);
        
        if (seats.count < 2){
            return place;
        }
                
        for i in (1..<seats.count).reversed() {
            let diff = seats[i] - seats[i-1]
            let possiblePlace = seats[i-1] + diff/2
            let minDiff = min(seats[i]-possiblePlace-1, possiblePlace-seats[i-1]-1)
            
            if(minDiff >= maxDiff){
                maxDiff = minDiff
                place = possiblePlace
            }
        }
        
        return place
    }
    
    func leave(_ p: Int) {
        if(seats.contains(p)) {
            seats = seats.filter() { $0 != p }
        }
    }
}
