const EventEmitter = require('events');

class MyEmitter extends EventEmitter {}

const myEmitter = new MyEmitter();

myEmitter.on('event', () => {
  console.log('an event occurred!');
});

myEmitter.addListener('event', () => {
    console.log("추가 이벤트");
});

const callback = () => {
    console.log("another event");
};
myEmitter.on('event', callback);

myEmitter.once('event', () => {
    console.log("once");
});

myEmitter.emit('event');
myEmitter.emit('event');
myEmitter.removeListener('event', callback);
myEmitter.emit('event');
console.log('End');