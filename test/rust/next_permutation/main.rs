// name   : kaito_tateyama (uta8a)
// tag    : "tag"
// comment: ""

#[test]
fn lexical() {
    let mut data = [1, 2, 3];
    data.next_permutation();
    assert_eq!(&data, &[1, 3, 2]);
    data.next_permutation();
    assert_eq!(&data, &[2, 1, 3]);
    data.prev_permutation();
    assert_eq!(&data, &[1, 3, 2]);
    data.prev_permutation();
    assert_eq!(&data, &[1, 2, 3]);
    assert!(!data.prev_permutation());
    let mut c = 0;
    while data.next_permutation() {
        c += 1;
    }
    assert_eq!(c, 5);
}
