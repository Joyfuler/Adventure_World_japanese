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
- Open Source : jquery-3.7.1, jqueryUI, Bootstrap-Arcodion UI, Kakao Map Api, Ckeditor API, summernote editor API, KakaoPay / KCP API / Iamport API (for test payment)
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
![screenshot61](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/9b382d4f-a018-42c6-963a-09095853d0a5)
![슬라이드27](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/9fefac66-1bd2-432a-8a84-697805b144db)
![슬라이드28](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/52cd7f6e-e8b0-4428-8380-fc6a3da40c39)
![슬라이드29](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/78359dd4-f296-4db8-8f0a-387190965a29)
![슬라이드30](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/0669a363-17b0-497b-af88-ad9362e3e422)
![슬라이드31](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/fa65cc63-816f-4b1b-b49a-b11ceb49a63d)
![슬라이드32](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/ec14ceb4-2e8c-471b-a4ae-b4c7d3807ff4)
![슬라이드33](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/5b2e6b6b-8df2-4493-8cc6-c1ffbb10d0d2)
![슬라이드34](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/7b1a5fde-e6bd-4985-8c7e-843fedace7b2)
![슬라이드35](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/2718bc2c-a896-4b3e-bb1d-9b4b076ecb4c)
![슬라이드36](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/b8b229f6-00bd-479d-a869-bb82140dfa2d)
![슬라이드37](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/dcb1cf30-bb8a-4e81-b63f-23d57e5970e5)
![슬라이드38](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/e6a88b07-5c5e-437f-8b8b-fe569c8e0121)
![슬라이드39](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/7a9f1c9d-5d67-498c-83d4-48dcd0ed210a)
![슬라이드40](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/2725ee1f-c0d2-40be-8163-3cc7802ba374)
![슬라이드41](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/a48ab511-6918-4d18-b7d7-2c86cc917e86)
![슬라이드42](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/a03a37e3-f741-4cd7-af48-2f1c180bc184)
![슬라이드43](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/5b45a2e2-6e08-446e-bb3c-1048f8383562)
![슬라이드44](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/6e30e832-b285-4d8a-8b70-1d21a9cfd43f)
![슬라이드45](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/9f1543cb-93cb-41ef-b979-ba5bf064d687)
![슬라이드46](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/c03686ac-40e2-414d-befa-9ae3d79c3ef4)
![슬라이드47](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/8f8e7afe-6466-4846-84c4-9c83232500a1)
![슬라이드48](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/72c4a329-bc8b-497b-90b2-806922682fc4)
![슬라이드49](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/de3954eb-04ed-4246-9330-007b995055a7)
![슬라이드50](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/2e3298dc-67f0-49f1-8f03-097357e75b45)
![슬라이드51](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/c0f32675-72d9-4f3a-9d31-4577ac4a535c)
![슬라이드52](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/446b6901-4be2-4fb5-8592-688239ab6b7f)
![슬라이드53](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/6e2de826-7035-4039-83f2-4b1d6762b340)
![슬라이드54](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/62a3d263-6821-438d-975f-1edf9cc92f8b)
![슬라이드55](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/5985df10-46e5-4179-93a9-44063b83e802)
![슬라이드56](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/b7bc6d31-5685-4ef9-a977-83b81c107e70)
![슬라이드57](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/e52ff4a0-ab73-43b8-a663-ac59ecfc5b84)
![슬라이드58](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/d1616cfd-94f1-4b3c-9035-f5d8b731f4b6)
![슬라이드59](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/43682084-d26a-44df-98e5-807158cc213b)
![슬라이드60](https://github.com/Joyfuler/2ndTeamProject/assets/137759165/f2a2542e-a78f-4179-acb0-15fe47526681)
![스크린샷 2024-05-18 120320](https://github.com/Joyfuler/Adventure_World_japanese/assets/137759165/974e0761-9ea6-4da5-86d8-ded1321799a1)
