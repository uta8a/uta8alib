// name   : kaito_tateyama (uta8a)
// tag    : "tag"
// comment: ""

#[test]
fn char2integer_test() {
    assert_eq!(char2integer('c'), 99);
}
fn integer2char_test() {
    assert_eq!(integer2char(99), 'c');
}
fn integer2char_concat_test() {
    assert_eq!(integer2char(char2integer('c') + 1), 'd');
}