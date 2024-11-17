<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8" />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
      <link rel="icon" href="https://img.icons8.com/?size=100&id=JWpT8cAn8G0V&format=png&color=000000" />

      <!-- font -->
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">

      <title>Memo List</title>
      <style>
        body {
          /* font-family: Arial, sans-serif; */
          font-family: 'Black Han Sans', sans-serif;
          background-color: #f2f2f2;
          margin: 0;
          padding: 0;
        }

        .memo-wrapper {
          display: flex;
          justify-content: center;
          margin-top: 20px;
        }

        .card {
          background-color: white;
          border-radius: 8px;
          box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
          padding: 20px;
          width: 400px;
          margin: 10px;
        }

        .card-content {
                     width: 91%;
                   padding: 12px 16px;
                   border-radius: 8px;
                   resize: none;
                   color: #212121;
                   <%-- height: 96px; --%>
                  <%-- border: 1px solid #414141; --%>
                   background-color: transparent;
                   font-family: inherit;
        }

        .card-time {
            padding-top: 8px;
          font-size: 14px;
          color: #888;
        }

        .add-memo-btn {
          display: block;
          background-color: #4caf50;
          color: white;
          padding: 10px 20px;
          border: none;
          border-radius: 4px;
          cursor: pointer;
          font-size: 16px;
          margin: 20px auto;
        }

        .add-memo-btn:hover {
          background-color: #45a049;
        }

        .add-memo-form {
          display: none;
          background-color: white;
          border-radius: 8px;
          box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
          padding: 20px;
          padding-right: 50px;
          width: 400px;
          margin: 20px auto;
          /* 수정: 가운데 정렬 */
          text-align: left;
          /* 수정: 텍스트 영역 왼쪽 정렬 */
        }

        .add-memo-form textarea {
          <%-- width: 100%;
          height: 100px;
          font-size: 16px;
          padding: 10px;
          border: 1px solid #ccc;
          border-radius: 4px;
          resize: none; --%>
          width: 100%;
          padding: 12px 16px;
          border-radius: 8px;
          resize: none;
          color: #4d8350;
          height: 96px;
          border: 1px solid #414141;
          background-color: transparent;
          font-family: inherit;
        }

        .add-memo-form button {
          display: block;
          background-color: #4caf50;
          color: white;
          padding: 10px 20px;
          border: none;
          border-radius: 4px;
          cursor: pointer;
          font-size: 16px;
          margin-top: 10px;
          margin-left: 174px;
          /* 수정: 버튼 왼쪽 정렬 */
          margin-right: 0;
          /* 수정: 버튼 왼쪽 정렬 */
        }

        .add-memo-form button:hover {
          background-color: #45a049;
        }

        .card-buttons {
          display: flex;
          justify-content: flex-end;
          margin-top: 10px;
        }

        .edit-btn {
          background-color: #4caf50;
          color: white;
          padding: 5px 10px;
          border: none;
          border-radius: 4px;
          cursor: pointer;
          font-size: 14px;
          margin-right: 3px;
        }

        .edit-btn:hover {
          background-color: #45a049;
        }

        .delete-btn:hover {
          background-color: #ff0000;
        }

        .delete-btn {
          background-color: #ff4d4d;
          color: white;
          padding: 5px 10px;
          /* 버튼 내부 여백 조정 */
          border: none;
          border-radius: 4px;
          cursor: pointer;
          font-size: 14px;
          display: flex;
          margin-right: 5px;
          /* 버튼 내부 요소 수직 중앙 정렬 */
          align-items: center;
          /* 버튼 내부 요소 수직 중앙 정렬 */
        }

        .delete-btn i {
          font-size: 16px;
          margin-right: 4px;
          /* 아이콘과 텍스트 사이 여백 추가 */
        }

        .edit-btn i {
          font-size: 16px;
          color: white;
        }

        .edit-btn i {
          margin-right: 4px;
        }

        #toggleMode:hover {
            background-color: #45a049;
            transform: scale(1.05);
            transition: all 0.2s ease-in-out;
        }

        #toggleMode i {
            margin-right: 5px;
        }
      </style>
    </head>

    <body>
        <button id="toggleMode" style="position: fixed; top: 20px; right: 20px; z-index: 1000; padding: 10px 20px; border-radius: 5px; border: none; cursor: pointer; background-color: #4caf50; color: white;">
            <i class="fas fa-moon"></i> 다크모드
        </button>
      <div style="
        text-align: center;
        margin-top: 30px;
        font-size: 24px;
        font-weight: bold;
      ">
        Memo List ⟦<span style="color: rgb(97, 164, 14);" font-weight:400;>${mList.size()}</span>⟧
      </div>
      <div class="memo-total-List">
        <c:if test="${mList.size() > 0}">
          <c:forEach var="memo" items="${mList}">
            <div class="memo-wrapper">
              <section class="card" data-mno="${memo.memoNum}">
                <div class="card-content">${memo.memoText}</div>
                <div class="card-time">등록시간: ${memo.regDate}</div>

                <div class="card-buttons">
                  <button class="edit-btn">
                    <i class="fas fa-pencil-alt"></i>
                  </button>
                  <button class="delete-btn">
                    <i class="fas fa-trash-alt"></i>
                  </button>
                </div>
              </section>
            </div>
          </c:forEach>
        </c:if>
      </div>
      <button class="add-memo-btn">Add Memo</button>
      <div class="add-memo-form">
        <textarea class="ta" placeholder="Enter your memo"></textarea>
        <button class="saveBtn" type="submit">Save</button>
      </div>

      <script>
        const BASE_URL = `http://localhost:8383`;

        //폴딩
        document.querySelector(".add-memo-btn").addEventListener("click", () => {
          const addMemoForm = document.querySelector(".add-memo-form");
          if (addMemoForm.style.display === "none") {
            addMemoForm.style.display = "block";
          } else {
            addMemoForm.style.display = "none";
          }
        });

        const fetchMemoPost = async () => {
          // console.log(`11`);
          // 서버로 보낼 데이터
          const payload = {
            memoText: document.querySelector(".add-memo-form textarea").value,
          };
          console.log("payload" + payload);
          // console.log(`22`);
          const res = await fetch(`${BASE_URL}`, {
            method: "POST",
            headers: {
              "content-type": "application/json",
            },
            body: JSON.stringify(payload),
          });

          const replies = await res.json(); //받는 것 (json 타입)
          console.log(replies);
          document.querySelector(".ta").value = null; //
          GetAllReplies(replies); //최신화
          // console.log(replies.length);
        };
        //제출
        document
          .querySelector(".saveBtn")
          .addEventListener("click", async (e) => {
            console.log(e.target);
            e.preventDefault();
            console.log(`test`);
            const memotext = document.querySelector(
              ".add-memo-form textarea"
            ).value;

            await fetchMemoPost();
            //
            document.querySelector(".add-memo-form").style.display = "none";
          });
        // 가져올 함수
        function GetAllReplies(replies) {
          //객체 안의 replies 였다면{replies} 로 받아야함.
          // 댓글 목록 렌더링
          let tag = "";
          // replies가 null이 아니거나 0보다 클때
          if (replies && replies.length > 0) {
            // reply_no: rno  => reply_no를 rno로 받아서 처리하겠다.
            replies.forEach(({ memoNum, memoText, regDate }) => {
              // console.log(memoNum + " " + memoText + " " + regDate)
              tag += `
            <div class="memo-wrapper">
                        <section class="card" data-mno=\${memoNum}>
                            <div class="card-content">\${memoText}</div>
                            <div class="card-time">등록시간: \${regDate}</div>
                            <div class="card-buttons">
                                <button class="edit-btn">
                             <i class="fas fa-pencil-alt"></i>
                                  </button>
                                <button class="delete-btn">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </div>
                        </section>
                    </div>
            `;
            });
          } else {
            console.log("메모가 없습니다.");
          }

          // console.log("tag=" + tag);
          // console.log(
          //   "query=" + document.querySelector(".memo-total-List").innerHTML
          // );
          document.querySelector(".memo-total-List").innerHTML = tag; //전체 태그 교체 부분
          // 로드된 댓글 수 업데이트
          // loadedReplies += replies.length;
        }
        //삭제 클릭
        // document.querySelector(`.delete-btn`).addEventListener(`click`, async (e) => {
        //     console.log(`삭제 클릭`);
        // });

        // # 삭제 #

        // const deleteBtns = document.querySelectorAll(".delete-btn");

        // deleteBtns.forEach((btn) => {
        //랜더링 문제 없게 반복되지 않는 곳에 클릭을 걸어준다.
        document
          .querySelector(".memo-total-List")
          .addEventListener("click", async (e) => {
            e.preventDefault();

            // console.log('dd  ' + e.target.classList.contains(`fa-trash-alt`));
            console.log("click=>", e.target.classList);

            if (
              e.target.classList.contains(`fa-trash-alt`) ||
              e.target.classList.contains(`delete-btn`)
            ) {
              // 각 버튼에 대한 처리 로직 작성
              const mno = e.target.closest(`.card`).dataset.mno;
              console.log(mno);
              fetchDeleteMemo(mno); //삭제 호출.!
            } else if (
              e.target.classList.contains(`edit-btn`) ||
              e.target.classList.contains(`fa-pencil-alt`) ||
              e.target.classList.contains(`fa-check`)
            ) {
              //# 수정
              // console.log("수정 클릭!!");

              if (
                e.target.classList.contains(`edit-btn`) ||
                e.target.classList.contains(`fas`)
              ) {
                const $card = e.target.closest(`.card`);

                const $cardFirstChild = $card.firstElementChild;
                console.log("card=>", $card);
                const $cardButtons = $card.children[2];
                console.log("cb=>", $cardButtons);
                const $editButton = $cardButtons.children[0];
                console.log($editButton);

                const $icon = $editButton.children[0];

                if ($icon.classList.contains("fa-pencil-alt")) {
                  //아이콘 변경
                  $icon.classList.remove("fa-pencil-alt");
                  $icon.classList.add("fa-check");
                  // 태그 변경
                  console.log($cardFirstChild);
                  var newSpan = document.createElement("textarea");
                  newSpan.classList.add("card-content");
                  newSpan.textContent = $cardFirstChild.textContent;
                  $cardFirstChild.parentNode.replaceChild(
                    newSpan,
                    $cardFirstChild
                  );
                } else if ($icon.classList.contains("fa-check")) {
                  console.log("저장 ㄱ");
                  $icon.classList.remove("fa-check");
                  $icon.classList.add("fa-pencil-alt");

                  //UI 업데이트
                  const $cardFirstChild2 = $card.firstElementChild;
                  var newSpan = document.createElement("div");
                  newSpan.classList.add("card-content");
                  newSpan.textContent = $cardFirstChild2.value;
                  console.log("바꿀내용:", $cardFirstChild2.value);
                  $cardFirstChild2.parentNode.replaceChild(
                    newSpan,
                    $cardFirstChild2
                  );

                  //db 처리를 위한 넘버 소환!
                  const mno = $card.dataset.mno;
                  console.log(mno);
                  const newText = $cardFirstChild2.value;
                  fetchModifyMemo(mno, newText);
                }

                // console.log('editList=>', $icon.classList);
                // const $editBtn = $cardButtons.closest(`.edit-btn`);
                // console.log('sss=>', $editBtn);
                // const content = $mno.firstElementChild.content;
                // console.log(e.target.classList);
                // console.log($card);
              }
            }
          });
        // });

        const url = `http://localhost:8383`;
        //# 삭제
        const fetchDeleteMemo = async (mno) => {
          const url2 = url + "/" + mno;
          const res = await fetch(`\${url2}`, {
            method: `DELETE`,
          });
          console.log("res_status" + res.status);
          if (res.status !== 200) {
            alert(`삭제에 실패했습니다!`);
            return;
          }
          const responseData = await res.json(); //응답 처리./
          console.log(responseData);
          GetAllReplies(responseData); //최신화
        };

        // # 수정
        const fetchModifyMemo = async (mno, newText) => {
          const payload = {
            mno: mno,
            newText: newText,
          };
          console.log("payload", payload);
          console.log("url", url);
          const res = await fetch(url, {
            method: "PUT",
            headers: {
              "content-type": "application/json",
            },
            body: JSON.stringify(payload),
          });

          if (res.status === 403) {
            alert("로그인이 필요한 서비스입니다.");
            // window.location.href = '/members/sign-in';
            return;
          }
        };

        // 🌚다크모드 토글 기능
        const toggleButton = document.getElementById('toggleMode');
        let isDarkMode = false;

        toggleButton.addEventListener('click', () => {
            if (!isDarkMode) {
                // 다크모드 적용
                document.documentElement.style.filter = "invert(100%) hue-rotate(180deg)";
                document.documentElement.style.webkitFilter = "invert(100%) hue-rotate(180deg)";
                toggleButton.innerHTML = '<i class="fas fa-sun"></i> 라이트모드';
                isDarkMode = true;
            } else {
                // 라이트모드로 복귀
                document.documentElement.style.filter = "none";
                document.documentElement.style.webkitFilter = "none";
                toggleButton.innerHTML = '<i class="fas fa-moon"></i> 다크모드';
                isDarkMode = false;
            }
        });
      </script>
    </body>

    </html>