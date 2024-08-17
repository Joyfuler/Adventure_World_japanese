Adventure World（アドベンチャーワールド）
=================
> チームプロジェクト

- プロジェクト名 : Adventure World (遊園地のチケット予約・レビューサービス提供) <br>
- プロジェクト人数 : 3人 (リーダー：張鎭旭(チャン・ジヌク） / メンバー：イ・ジョンジン / パク・ジェヨン)
- 進行期間 : 2023.11.20 ~ 2023.12.04 (二週間) ／日本語訳進行中（2024.05.16 ~ 終了時間は未定）<br>
- DBMS : Oracle 11g Express Edition <br>
- 使用言語 : Java SE 8 Platform, HTML5, CSS, CSS3, JavaScript <br>
- フレームワーク: Spring, Mybatis
- Tools : Spring Tool Suite 3.9.13 / Sqldeveloper 19.2, eXERD
- Open Source : jquery-3.7.1, jqueryUI, Bootstrap-Arcodion UI, Google Maps api, Ckeditor API, summernote editor API, KakaoPay / KCP API / Iamport API (for test payment)
- プロジェクト紹介: 本プロジェクトは、遊園地サイトのチケット予約を再現し、「カートに入れる・決済」までのプロセスを具現しました。また、サイト内の活動を応じてメンバーシップポイントを獲得し、チケット予約の際決済額から割引ができるように企画しました。ポイント制度でサイト内にユーザの活動を促し、割引で更にチケットを予約するよう試みます。

![스크린샷 2024-05-17 171115](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/1df04f18-c558-4fe8-a476-da8e066b3f61)

# 目次
[1. テーマと目的、参考にしたサイト](https://github.com/Joyfuler/Adventure_World_japanese/blob/japanese/README.md#1-%E3%83%86%E3%83%BC%E3%83%9E%E3%81%A8%E7%9B%AE%E7%9A%84)<br>
[2. 開発環境](https://github.com/Joyfuler/Adventure_World_japanese/blob/japanese/README.md#2-%E9%96%8B%E7%99%BA%E7%92%B0%E5%A2%83)<br>
[3. 作業分解構造図　(WBS)](https://github.com/Joyfuler/Adventure_World_japanese/blob/japanese/README.md#3-%E4%BD%9C%E6%A5%AD%E5%88%86%E8%A7%A3%E6%A7%8B%E9%80%A0%E5%9B%B3-wbs) <br>
[4. 作業工程表 Gantt Chart](https://github.com/Joyfuler/Adventure_World_japanese/blob/japanese/README.md#4-%E4%BD%9C%E6%A5%AD%E5%B7%A5%E7%A8%8B%E8%A1%A8-gantt-chart) <br>
[5. 要件定義書](https://github.com/Joyfuler/Adventure_World_japanese/blob/japanese/README.md#5-%E8%A6%81%E4%BB%B6%E5%AE%9A%E7%BE%A9%E6%9B%B8) <br>
[6. ユースケース図](https://github.com/Joyfuler/Adventure_World_japanese/blob/japanese/README.md#6-%E3%83%A6%E3%83%BC%E3%82%B9%E3%82%B1%E3%83%BC%E3%82%B9%E5%9B%B3) <br>
[7. シーケンス図](https://github.com/Joyfuler/Adventure_World_japanese/blob/japanese/README.md#7-%E3%82%B7%E3%83%BC%E3%82%B1%E3%83%B3%E3%82%B9%E5%9B%B3) <br>
[8. 機能定義及び設計](https://github.com/Joyfuler/Adventure_World_japanese/blob/japanese/README.md#8-%E6%A9%9F%E8%83%BD%E5%AE%9A%E7%BE%A9%E6%9B%B8%E5%8F%8A%E3%81%B3%E8%A8%AD%E8%A8%88) <br>
[9. DFD (Data Flow Diagram)](https://github.com/Joyfuler/Adventure_World_japanese/blob/japanese/README.md#9-dfd-data-flow-diagram) <br>
[10. データベース設計 (ERD)](https://github.com/Joyfuler/Adventure_World_japanese/blob/japanese/README.md#10%E3%83%87%E3%83%BC%E3%82%BF%E3%83%99%E3%83%BC%E3%82%B9%E8%A8%AD%E8%A8%88erd)<br>
[11. UI画面と機能の説明](https://github.com/Joyfuler/Adventure_World_japanese/blob/japanese/README.md#11-ui%E7%94%BB%E9%9D%A2%E5%8F%8A%E3%81%B3%E6%A9%9F%E8%83%BD%E8%AA%AC%E6%98%8E)<br>


## 1. テーマと目的
![스크린샷 2024-05-15 173740](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/d0354b32-2c49-4727-83d5-6dde8847cd8f)
![스크린샷 2024-05-15 173750](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/34ebd967-a3ca-48e8-aa91-abbd988a0645)


## 2. 開発環境
![스크린샷 2024-05-15 174712](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/6a7d1421-5278-497f-b67b-54107062bbdb)


## 3. 作業分解構造図 (WBS)
![스크린샷 2024-05-15 183642](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/cc8c9e55-463b-4978-953c-4e8113b4a2a2)
![스크린샷 2024-05-15 184914](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/477b93c9-bc8d-4aae-a35a-e8126e2fa765)
![스크린샷 2024-05-15 184925](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/c57beaae-9943-431c-bd15-9d230761fb40)


## 4. 作業工程表 Gantt Chart
![1515](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/c8eb09dc-b885-40b0-9b38-380e838e8246)


## 5. 要件定義書
![스크린샷 2024-05-17 105858](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/71d7e21d-fb1f-4ee0-9559-679d5162dd10)


## 6. ユースケース図
![스크린샷 2024-05-17 132150](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/e3833a65-240f-49ae-a959-d7f6e4761524)


## 7. シーケンス図
![KakaoTalk_20231205_164534997](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/cda5c52a-b98d-4598-9571-4d3940d846ac)
![KakaoTalk_20231205_164534997-Page-1의 복사본 drawio](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/8c5aaf67-2559-4fa1-944e-1e2bc0c66a06)


## 8. 機能定義及び設計
![스크린샷1](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/cda11a9f-8c96-4260-a62e-1cdab1fa484a)
![스크린샷2](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/ebb738fb-2c33-42bf-a74a-590a389ca449)
![스크린샷3](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/397be8e2-a54e-46ed-a8c7-c3f5317796fe)


## 9. DFD (Data Flow Diagram)
![스크린샷 2024-05-18 113006](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/4da07645-93b3-40f8-9001-7628a1fbe93b)
![스크린샷 2024-05-18 113018](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/7a141940-74fe-4b11-94b0-84f6e4b70fc4)
![스크린샷 2024-05-18 113026](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/4a5de02f-c0e8-41ef-9ac3-a74d4fe41ad7)
![스크린샷 2024-05-18 113043](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/893fc6a0-2616-4b8a-83ba-1ea3ce6491c6)


## 10.データベース設計(ERD)
![스크린샷 2024-05-18 113636](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/d1a256ca-d05b-4998-89da-6ded13505480)
![스크린샷 2024-05-18 113808](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/def15ca3-d844-48fe-85f0-ed9f4ca0964f)


## 11. UI画面及び機能の説明
![스크린샷 2024-05-20 101712](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/eb48cb42-7431-4c9d-8e8f-8b69fd5dd1c4)
![스크린샷 2024-05-20 101723](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/d536e8b5-02da-4c5a-9931-13bd2f97d76e)
![스크린샷 2024-06-03 135407](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/50f6f8b6-d0b0-4d5d-9ad7-3b9f15bdd7b4)
![스크린샷 2024-05-21 144718](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/21b676bc-33b5-41bc-b523-418c098ce9ea)
![스크린샷 2024-05-30 112052](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/abed8843-5d46-4a29-af55-e7c4d56fa56c)
![스크린샷 2024-06-03 134358](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/f374707d-1604-423b-9048-4b21722d6946)
![스크린샷 2024-06-04 154955](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/97b8aab3-8aa5-4735-ae68-85706bef5ac3)
![스크린샷 2024-06-04 164043](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/00e1d8e6-82f9-4f25-a253-2a46fbd3de6f)
![스크린샷 2024-07-16 235538](https://github.com/user-attachments/assets/1a169c71-e0d5-46bd-ab02-411c7827c211)
![스크린샷 2024-07-17 233839](https://github.com/user-attachments/assets/737e8284-5986-4117-ba16-2d83117cb636)
![스크린샷 2024-07-18 221250](https://github.com/user-attachments/assets/2b7f769a-1dcb-4cff-8808-134391134b71)
![스크린샷 2024-07-19 222802](https://github.com/user-attachments/assets/26a9e00b-9fc7-4db0-85cd-81e3de3e9d51)
![스크린샷 2024-07-20 223708](https://github.com/user-attachments/assets/585a8844-892e-499f-99ab-8e74b1524beb)
![스크린샷 2024-07-21 231637](https://github.com/user-attachments/assets/626c139d-34e9-4635-9148-c12bd91d6eb7)
![스크린샷 2024-07-22 221945](https://github.com/user-attachments/assets/756884c2-2657-4f10-b18b-3a708de52fdf)
![스크린샷 2024-07-23 232426](https://github.com/user-attachments/assets/70dd96d9-897d-4b26-bb91-ad70c885ac28)
![스크린샷 2024-07-24 233420](https://github.com/user-attachments/assets/48fff3c8-f77d-4e21-aa6e-2ac91a853880)
![스크린샷 2024-07-28 235644](https://github.com/user-attachments/assets/c8fbb4bd-8bdb-4676-af67-90e3d2029ac3)
![스크린샷 2024-07-29 225905](https://github.com/user-attachments/assets/6074b035-1751-46e8-8137-0d949638565e)
![스크린샷 2024-07-30 231355](https://github.com/user-attachments/assets/1c7a18f6-2870-43ce-ba6b-2f10f5f27c2c)
![스크린샷 2024-07-30 231404](https://github.com/user-attachments/assets/bed68398-81c1-4b60-890a-1c97cc5c6d0b)
![스크린샷 2024-07-31 230400](https://github.com/user-attachments/assets/10d2a17d-7f18-4491-98b6-28ad6a8b9113)
![스크린샷 2024-07-31 230406](https://github.com/user-attachments/assets/63f451c5-090d-4f67-8678-e2f010d6e269)
![스크린샷 2024-08-01 231540](https://github.com/user-attachments/assets/07a14585-b09c-4832-89c0-57d2af379eef)
![스크린샷 2024-08-02 221545](https://github.com/user-attachments/assets/c09fbc96-03f1-4fe0-ac6b-e939469db37f)
![스크린샷 2024-08-05 224652](https://github.com/user-attachments/assets/384fa753-3422-4949-8f84-f1cac783847a)
![스크린샷 2024-08-06 233559](https://github.com/user-attachments/assets/35f744a5-5552-4ccc-808c-c81d06b170d4)
![스크린샷 2024-08-07 233855](https://github.com/user-attachments/assets/be3aa979-e324-4e23-94ec-1470a4f9bc93)
![스크린샷 2024-08-13 222643](https://github.com/user-attachments/assets/dca01762-3bb5-4f7c-a1fa-192bd6ce8ce5)
![스크린샷 2024-08-16 000427](https://github.com/user-attachments/assets/15cadbce-97f0-480e-994d-d7c1cd5a8d83)
![스크린샷 2024-08-16 223928](https://github.com/user-attachments/assets/c6012a31-f6ea-4e7b-a3d2-d30ddfc08517)
![스크린샷 2024-08-18 005144](https://github.com/user-attachments/assets/146b6434-d066-4e5f-b547-3920f7b23f39)
![슬라이드56](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/b7bc6d31-5685-4ef9-a977-83b81c107e70)
![슬라이드57](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/e52ff4a0-ab73-43b8-a663-ac59ecfc5b84)
![슬라이드58](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/d1616cfd-94f1-4b3c-9035-f5d8b731f4b6)
![슬라이드59](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/43682084-d26a-44df-98e5-807158cc213b)
![슬라이드60](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/f2a2542e-a78f-4179-acb0-15fe47526681)
![스크린샷 2024-05-18 120320](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/974e0761-9ea6-4da5-86d8-ded1321799a1)
