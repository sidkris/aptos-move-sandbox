module sidkris::voting {
    use std::signer;
    use std::vector;
    use std::string;

    /// A struct to store votes for each candidate
    struct Voting has key {
        candidate_names: vector<string::String>,
        candidate_votes: vector<u64>,
    }

    /// Initialize voting with candidate names
    public entry fun initialize(account: &signer, candidates: vector<string::String>) {
        let votes = vector::empty<u64>();
        let i = 0;
        while (i < vector::length(&candidates)) {
            vector::push_back(&mut votes, 0);
            i = i + 1;
        };

        move_to(account, Voting {
            candidate_names: candidates,
            candidate_votes: votes,
        });
    }

    /// Cast a vote for candidate at `index`
    public entry fun vote(account: &signer, index: u64) acquires Voting {
        let voting = borrow_global_mut<Voting>(signer::address_of(account));
        let current = *vector::borrow(&voting.candidate_votes, index);
        *vector::borrow_mut(&mut voting.candidate_votes, index) = current + 1;
    }

    /// Read votes
    public fun get_votes(account: address): vector<u64> acquires Voting {
        let voting = borrow_global<Voting>(account);
        voting.candidate_votes
    }
}
