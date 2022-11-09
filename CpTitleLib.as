[Setting name="Channel name"]
string channel = "";

int _currentCp = -1;

void Update(float dt) {
    if(CP::get_inGame()) {
        if(CP::get_curCP() != _currentCp) {
            error("currCP: " + CP::get_curCP());
            _currentCp = CP::get_curCP();
            sendUpdatedCp(_currentCp);
        }
    }
}

void sendUpdatedCp(int cp) {
    Twitch::SendMessage(channel, "!cp " + cp)
}
    