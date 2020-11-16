class Clock {
  constructor() {
    let date = new Date();
    let time = date.toString().split(' ')[4];
    [this.hour, this.minute, this.second] = time
      .split(':')
      .map((el) => parseInt(el));
    this._tick();
  }
  printTime() {
    console.log(
      `${this.hour < 10 ? `0${this.hour}` : this.hour}:${
        this.minute < 10 ? `0${this.minute}` : this.minute
      }:${this.second < 10 ? `0${this.second}` : this.second}`
    );
  }

  _tick() {
    setInterval(() => {
      this.second += 1;
      if (this.second == 60) {
        this.second = 0;
        this.minute += 1;
        if (this.minute == 60) {
          this.minute = 0;
          this.hour += 1;
          if (this.hour == 24) {
            this.hour = 0;
          }
        }
      }
      this.printTime();
    }, 1000);
  }
}

const clock = new Clock();
