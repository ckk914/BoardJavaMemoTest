<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8" />
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
            <title>Memo List</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
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
                    font-size: 16px;
                    line-height: 1.5;
                    margin-bottom: 10px;
                }

                .card-time {
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
                    width: 100%;
                    height: 100px;
                    font-size: 16px;
                    padding: 10px;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    resize: none;
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
            </style>
        </head>

        <body>
            <div style="
        text-align: center;
        margin-top: 30px;
        font-size: 24px;
        font-weight: bold;
      ">
                Memo List
            </div>
            <c:if test="${mList.size() > 0}">
                <c:forEach var="memo" items="${mList}">
                    <div class="memo-wrapper">
                        <section class="card" data-mno="${memo.memoNum}">
                            <div class="card-content">${memo.memoText}</div>
                            <div class="card-time">등록시간: ${memo.regDate}</div>
                            <div class="card-buttons">
                                <button class="edit-btn">수정</button>
                                <button class="delete-btn">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </div>
                        </section>
                    </div>
                </c:forEach>
            </c:if>
            <button class="add-memo-btn">Add Memo</button>
            <form class="add-memo-form">
                <textarea placeholder="Enter your memo"></textarea>
                <button class="saveBtn" type="submit">Save</button>
            </form>

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
                    console.log(`11`);
                    // 서버로 보낼 데이터
                    const payload = {
                        memoText: document.querySelector(".add-memo-form textarea").value,
                    };
                    console.log("payload" + payload);
                    console.log(`22`);
                    const res = await fetch(`${BASE_URL}`, {
                        method: "POST",
                        headers: {
                            "content-type": "application/json",
                        },
                        body: JSON.stringify(payload),
                    });

                    const replies = await res.json();
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
                        console.log("New memo:", memotext);
                        document.querySelector(".add-memo-form").style.display = "none";


                    });

            </script>
        </body>

        </html>