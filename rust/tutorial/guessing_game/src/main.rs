use std::io;
use std::cmp::Ordering;
use std::cmp::min;
use rand::Rng;

fn main() {
    println!("1에서 100까지 랜덤 숫자 맞추기 게임!");

    let secret_number = rand::thread_rng().gen_range(1..=100);
    let mut lucky_point = rand::thread_rng().gen_range(60..=100);

    let max_tries = 5;
    let mut tries = 0;
    let mut suceeded = false;

    while tries < max_tries {
        tries += 1;
        println!("시도 {tries}: 숫자를 입력해 주세요...");        

        let mut guess = String::new();

        io::stdin()
            .read_line(&mut guess)
            .expect("Failed to read line!!");

        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("잘못 입력하셨습니다. 올바른 숫자를 입력해 주세요.");
                continue;
            }
        };        

        println!("입력한 숫자: {guess}...");

        match guess.cmp(&secret_number) {
            Ordering::Less => println!("작군요!"),
            Ordering::Greater => println!("큽니다!"),
            Ordering::Equal => {
                println!("정답!");
                suceeded = true;
                lucky_point = min(lucky_point + 40 * tries / max_tries, 100);
                
                break;
            }
        }
    }

    if !suceeded {
        println!("장덥은 {secret_number} 였습니다!");
        println!("Try again next time!");
    }

    println!("오늘의 행운 점수: {lucky_point}");
}