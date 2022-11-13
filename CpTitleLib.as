[Setting name="Channel name"]
string channel = "";

[Setting name="Delay (seconds)"]
int delay = 5;

int _currentCp = -1;

void sendUpdatedCp(int cp) {
    sleep(delay*1000);
    Twitch::SendMessage(channel, "!cp " + cp);
}


void Main() {
    while(true) {
        if(CP::get_inGame()) {
            if(CP::get_curCP() != _currentCp) {
                error("currCP: " + CP::get_curCP());
                _currentCp = CP::get_curCP();
                sendUpdatedCp(_currentCp);
            }
        }
        yield();
    }
}