// winner.rs

use std::io::{self, Write};

fn main() {
    println!("참가자 숫자를 입력해 주세요.");
    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("입력 오류");
    let participants: u32 = input.trim().parse().expect("유효한 숫자를 입력해 주세요.");

    let winner = generate_winner(participants);
    println!("당첨자는 {}번째 참가자입니다.", winner);
}

fn generate_winner(participants: u32) -> u32 {
    let mut rng = thread_rng();
    rng.gen_range(1..=participants)
}
