import { useState } from "react";
function LikeButton() {
  let [isLiked, setisLiked] = useState(false);
  let [countLike, setcountLike] = useState(0);
  let toggleLike=()=> {
    setisLiked(!isLiked);
    if (!isLiked) {
      setcountLike(countLike + 1);
    }
  }
  let likeStyle = {
    color: "red",
  };
  return (
    <div>
      <h1>Click to like</h1>
      <h1 onClick={toggleLike}>
        {isLiked ? (
          <i className="fa-solid fa-heart" style={likeStyle}></i>
        ) : (
          <i className="fa-regular fa-heart"></i>
        )}
      </h1>
      <h5>No.of clicked {countLike}</h5>
    </div>
  );
}

export default LikeButton;
