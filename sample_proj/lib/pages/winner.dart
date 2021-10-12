bool winLogic(List arr) {
  if (arr[0] != 0 && arr[0] == arr[1] && arr[1] == arr[2]) {
    return true;
  } else if (arr[3] != 0 && arr[3] == arr[4] && arr[4] == arr[5]) {
    return true;
  } else if (arr[6] != 0 && arr[6] == arr[7] && arr[7] == arr[8]) {
    return true;
  } else if (arr[3] != 0 && arr[3] == arr[0] && arr[3] == arr[6]) {
    return true;
  } else if (arr[1] != 0 && arr[1] == arr[4] && arr[4] == arr[7]) {
    return true;
  } else if (arr[2] != 0 && arr[2] == arr[5] && arr[5] == arr[8]) {
    return true;
  } else if (arr[0] != 0 && arr[0] == arr[4] && arr[4] == arr[8]) {
    return true;
  } else if (arr[2] != 0 && arr[2] == arr[4] && arr[4] == arr[6]) {
    return true;
  } else {
    return false;
  }
}
