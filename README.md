# Java EE 課程實作指南

## 介紹
本專案是 Java EE 課程的實作範例，包含以下核心技術：
- **JSP**：動態表格顯示與篩選功能
- **Servlet**：處理請求並更新表格
- **WebSocket**：即時通訊功能
- **購物車應用介面**：使用 Session 管理購物車

## 環境需求
- **JDK 11 或以上**
- **Apache Tomcat 9+**
- **Maven 3+**
- **MySQL 8+ (可選)**

## 專案架構
```
java-ee-project/
│── src/main/java/com/example/
│   │── controller/         # Servlet 控制器
│   │── websocket/          # WebSocket 處理類別
│   │── model/              # 資料模型 (如商品、用戶)
│   └── dao/                # 資料庫存取
│
│── src/main/webapp/
│   │── WEB-INF/            # JSP 頁面與設定檔
│   │── assets/             # CSS/JS
│   └── pages/              # 各個功能頁面
│
│── pom.xml                 # Maven 設定
└── README.md               # 說明文件
```

## 功能說明
### 1. JSP 表格與篩選功能
- 使用 **JSP + JSTL** 來動態生成商品表格。
- 透過 **Servlet** 處理篩選條件 (如價格、分類)。
- **範例程式碼**：
```jsp
<table>
    <tr>
        <th>商品名稱</th>
        <th>價格</th>
    </tr>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.name}</td>
            <td>${product.price}</td>
        </tr>
    </c:forEach>
</table>
```

### 2. WebSocket 即時通訊
- 設計一個 WebSocket 伺服器來處理即時通知。
- **範例程式碼**：
```java
@ServerEndpoint("/ws")
public class NotificationWebSocket {
    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<>());

    @OnOpen
    public void onOpen(Session session) {
        clients.add(session);
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        for (Session client : clients) {
            client.getAsyncRemote().sendText(message);
        }
    }

    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
    }
}
```

### 3. 購物車應用介面
- **Session 管理**：每個用戶的購物車資訊儲存在 Session 中。
- **Servlet 處理邏輯**：新增/刪除購物車項目。
- **前端 JSP 顯示購物車內容**。
- **範例程式碼**：
```java
HttpSession session = request.getSession();
List<Product> cart = (List<Product>) session.getAttribute("cart");
if (cart == null) {
    cart = new ArrayList<>();
    session.setAttribute("cart", cart);
}
cart.add(selectedProduct);
```

## 部署與執行
1. 使用 Maven 構建專案：
   ```sh
   mvn clean package
   ```
2. 部署至 Tomcat：
   - 將 `target/java-ee-project.war` 放入 `Tomcat/webapps/`。
   - 啟動 Tomcat (`startup.sh` 或 `startup.bat`)。
3. 訪問 `http://localhost:8080/java-ee-project/` 測試應用。

## 相關資源
- [Jakarta EE 官方文件](https://jakarta.ee/)
- [Tomcat 官方網站](http://tomcat.apache.org/)
