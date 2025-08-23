script {
    use sidkris::message;
    use std::string::{String, utf8};
    use std::signer;
    use aptos_framework::account;

    fun main(account : &signer) {
        let account_address = signer::address_of(account);
        let msg : String = utf8(b"Hello there!");

        if (!account::exists_at(account_address)) {
            message::create_message(account, msg);
        }
        else {
            message::update_message(account, msg);
        }
    }


}