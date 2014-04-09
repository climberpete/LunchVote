package lunchvote

import com.lunchvote.Vote

class VoteService {

    def getDistinct() {
        def voteList = Vote.getAll()
        def distinctVotes = []
        voteList.each{ vote ->
            def found = false
            distinctVotes.each{ distinct ->
                if(vote.selectionName == distinct.selectionName){
                    distinct.weight += vote.weight
                    found = true
                }
            }
            if(!found)distinctVotes.add(["selectionName": vote.selectionName, "weight": vote.weight])
        }
        return distinctVotes
    }

    def awardWinner(String winner){
        def voteList = Vote.findAllBySelectionName(winner)
        voteList.each{ vote ->
            vote.delete(flush: true)
        }
        voteList = Vote.findAll()
        voteList.each{ vote ->
            vote.weight = vote.weight/2
            vote.save()
        }
    }

    def save(Vote vote){
        if(vote.weight == null){
            vote.weight = 1
        }
        vote.save()
    }

    def delete(Vote vote){
        vote.delete()
    }

    def getDistinctVoters(){
        def voteList = Vote.getAll()
        def distinctVoters = []
        voteList.each{ vote ->
            def found = false
            distinctVoters.each{ distinct ->
                if(vote.user == distinct.user){
                    distinct.weight += vote.weight
                    found = true
                }
            }
            if(!found)distinctVoters.add(["user": vote.user, "weight": vote.weight])
        }
        return distinctVoters
    }
}
