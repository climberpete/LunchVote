package lunchvote

import com.lunchvote.Restaurant

class RestaurantService {

    def getAll(){
        Restaurant.getAll()
    }

    def getRandomOrder(){
        def all = Restaurant.getAll()
        def randomized = []
        def rand = new Random()
        while(all.size()){
            def r = rand.nextInt(all.size())
            randomized.add(all.get(r))
            all.remove(r)
        }
        return randomized
    }

    def serviceMethod() {

    }
}
