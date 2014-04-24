package com.lunchvote

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USER'])
class VoteController {

    def voteService
    def restaurantService
    def springSecurityService

    def index() {
        redirect action: "votes"
    }

    def create(){
        def user = User.get(springSecurityService.principal.id)
        def vote = new Vote()
        vote.selectionName = params.restaurant
        vote.user = user.id
        voteService.save(vote)
        redirect action: "votes"
    }

    def submit(){
        def restaurantList = params.restaurants
        def user = User.get(springSecurityService.principal.id)
        //handle single vote
        if(restaurantList instanceof String){
            restaurantList = [restaurantList]
        }
        restaurantList.each{ restaurant ->
            def restaurantId = new Long(restaurant)
            def votes = Vote.findAllByRestaurantIdAndUserAndWeight(restaurantId, user.id, 1)
            if(votes.size() == 0){
                def vote = new Vote()
                vote.restaurantId = restaurantId
                vote.user = user.id
                voteService.save(vote)
            }
        }
        redirect action: "results"
    }

    def clear(){
        def user = User.get(springSecurityService.principal.id)
        def voteList = Vote.findAllByUserAndWeight(user.id, 1)
        voteList.each{ vote ->
            voteService.delete(vote)
        }
        redirect action: "votes"
    }

    def clearAll(){
        def voteList = Vote.findAll()
        voteList.each{ vote ->
            voteService.delete(vote)
        }
        redirect action: "votes"
    }

    def votes(){
        def restaurants = restaurantService.getRandomOrder()
        render(view: "vote", model: [restaurantList: restaurants])
    }

    @Secured(['permitAll'])
    def results(){
        def votes = voteService.getDistinct()
        def results = []
        results.add(['"Restaurant"', '"Votes"'])
        votes.each {
            def restaurant = Restaurant.read(it.restaurantId)
            results.add(['"' + restaurant.name + '"', it.weight])
        }
        render(view: "results", model: [results: results])
    }

    def lotteryWinner(){
        def votes = voteService.getDistinct()
        def weightSum = 0
        votes.each{ vote ->
            weightSum += vote.weight
        }
        def winner = null
        def randomValue = Math.random()*weightSum
        votes.each{ vote ->
            if(!winner){
                weightSum -= vote.weight
                if(weightSum < randomValue) {
                    winner = vote
                }
            }
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

    def awardWinner(){
        voteService.awardWinner(params.winner)
        redirect action: "votes"
    }

    def showVoters(){
        def voters = voteService.getDistinctVoters()
        render(view: "showVoters", model: [distinctVoters: voters])
    }

    def addUser(){
        def user = new User()
        user.username = params.username
        user.password = params.password
        user.save(flush: true)

        def userRole = new UserRole()
        userRole.user = user
        userRole.role = Role.findByAuthority('ROLE_USER')
        userRole.save(flush: true)

        redirect action: "results"
    }

    def changePassword(){
        def password = params.password
        def confirm = params.confirmPassword
        if(password == confirm  && password.length() > 0){
            def user = User.get(springSecurityService.principal.id)
            user.password = password
        }
        redirect action: "votes"
    }

    def editRestaurant(){
        def restaurant = Restaurant.get(params.editRestaurantId)
        restaurant.description = params.editDescription
        restaurant.website = params.editWebsite
        restaurant.imageUrl = params.editImageUrl
        restaurant.save()
        redirect action: "votes"
    }

    def addRestaurant(){
        def restaurant = new Restaurant()
        restaurant.name = params.addName
        restaurant.description = params.addDescription
        restaurant.website = params.addWebsite
        restaurant.imageUrl = params.addImageUrl
        restaurant.save()
        def vote = new Vote()
//        vote.restaurantId = restaurant.id
//        vote.weight = 1
//        vote.user = springSecurityService.principal.id
//        vote.save()
        redirect action: "votes"
    }
}
