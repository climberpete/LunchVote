package com.lunchvote

class VoteController {

    def voteService

    def index() {
        redirect action: "votes"
    }

    def create(){
        def vote = new Vote()
        vote.selectionName = params.restaurant
        vote.username = params.username
        vote.save()
        redirect action: "votes"
    }

    def submit(){
        def restaurantList = params.restaurants // get votes from params
        def username = params.username
        //handle single vote
        if(restaurantList instanceof String){
            restaurantList = [restaurantList]
        }
        restaurantList.each{ restaurant ->
            def votes = Vote.findAllBySelectionNameAndUsername(restaurant, username)
            if(votes.size() == 0){
                def vote = new Vote()
                vote.selectionName = restaurant
                vote.username = username
                vote.save()
            }

        }
        redirect action: "results"
    }

    def clear(){
        def voteList = Vote.findAllByUsernameAndWeight(params.username, 1)
        voteList.each{ vote ->
            vote.delete()
        }
        redirect action: "votes"
    }

    def clearAll(){
        def voteList = Vote.findAll()
        voteList.each{ vote ->
            vote.delete()
        }
        redirect action: "votes"
    }

    def votes(){
        def distinct = voteService.getDistinct()
        render(view: "vote", model: [restaurantList: distinct])
    }

    def results(){
        def votes = voteService.getDistinct()
        def results = []
        results.add(['"Restaurant"', '"Votes"'])
        votes.each {
            results.add(['"' + it.selectionName + '"', it.weight])
        }
        render(view: "results", model: [results: results])
    }

    def lotteryWinner(){
        def votes = voteService.getDistinct()
        def weightSum = 0
        votes.each{ vote ->
            weightSum += vote.weight
        }
        def winner
        def random = new Random();
        def minimum = 0
        def maximum  = weightSum
        def randomValue = (random.nextLong() % (maximum - minimum)) + minimum
        votes.each{ vote ->
            weightSum -= vote.weight
            if(weightSum < randomValue) winner = vote
        }

        render(view: "lotteryWinner", model: [winner: winner])
    }

    def majorityWinner(){
        def votes = voteService.getDistinct()
        def winner
        votes.each{ vote ->
            if(!winner || vote.weight > winner.weight) winner = vote
        }
        render(view: "majorityWinner", model: [winner: winner])
    }
}
