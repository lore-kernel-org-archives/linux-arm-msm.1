Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846395;
	b=LsF7EKLb7dhj5/DBEDNBG7Aezrw/syzp5SxIlQn/UBtNsZ6GLTuRjAkM9fUVHA60CRYR
	 ekbCKYcysPyBQvqHNj3+1Q1yT14ZEnIpNhK0yo5jxdZxKc6OMjEGqoTvp2FO3eVzOmeT0
	 QQHr/T6hJZRxFVXiWMuhQMRiGION6HK2+YVPxVyYUjlSTl8rPm6wsZnqvkmCo0ODLOwha
	 fkEXX8peYETF34LRr1E1VqWMnYx4gXg3ip9yNgYVGAGngGQj6GIHH9eZ2JzdCnIW+xcjg
	 J4G6pLNwIsYemB7zCMuK+RTCrRC6dN/OxsR53luZUAxU+FY7e3ESFRZ3EQ5D7fkwinA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846395;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=vMf+Yb0CsLok2gkRTe5LcYjNsttCLqgkVtGLQgQa3n8=;
	b=4T5ajsPATZnsmFIX78Kl322aEr9Hu57zxE5NQjiWtlXhUXODu40BW+S7JHeJZVboQLa/
	 m4evJeUPCRhayz3LtBh3v8nL+/YKTlc7fxj7IhUUD10WIaRQWI6nBdYDuPc7Zn75WaGFr
	 JiH+wJJhsXGsl1YKflG8i+Ha0J9dqMyIuOznO/2FPBjpbwHgiKrkDjY75C9lsBmJIxM23
	 3Gv3Jak3Dn9+holJrpnGVf3Rm2CRjIohV8Hk9x36tdk+eg7Z6rrN1h084CYaNd8mWh/Lo
	 ytg1pO69ZI3nCsnUV5TVyrRpqG7g0QCXcBA7AAE4JyxNGJ1bpNNl0uGr6ABZUfRMOXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=Adnreco9;
	arc=none smtp.remote-ip=109.224.244.107
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CFA606A32F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1CFA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=Adnreco9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1794846392; x=1795105592;
	bh=vMf+Yb0CsLok2gkRTe5LcYjNsttCLqgkVtGLQgQa3n8=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Adnreco9kgzlamRHjFAAu2NOLhNARO1duSFqjommQESa1VqFeW8uYbNNFrMVoNJnH
	 QNkSywu/7ZaIfUxTAiLTv3hizKIMd2suHIVz4gBPQHfpTC5wBn6TBUl0osRWGVsyXx
	 zBQSgrCJ3uBw7GHqnPRboFGiLq9t9ROqy9kWzPpn0QIKkSLcffalEA1OM2Wesn9ziP
	 41tKzpZ26LhW02W1M7M1Hqy0IdGlO9peqtiurMNnUwdWlUJlVxgB+ngoUwkbpGyFRL
	 tr1zelDi7KFljps3Tf8jnzbbBAPGExTPdqb0JNrrKDM7Jgv0imY+UkvvdbXgEdaZje
	 eiM8SDKAr/hBw==
X-Pm-Submission-Id: 4jStXk53pVz1DF5P
From: Michael McAllister <me@michaelmcallister.org>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: brgl@kernel.org, linux-bluetooth@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_bgodavar@quicinc.com, lumag@kernel.org, mka@chromium.org,
 me@michaelmcallister.org, markus.probst@posteo.de,
 shuai.zhang@oss.qualcomm.com, enderaoelyther@gmail.com
Date: Mon, 16 Nov 2026 16:26:21 +0000
Subject: [PATCH v3 1/5] Bluetooth: hci_serdev: Unregister HCI before freeing
 the TX buffer
Message-ID: <179484638195.54009.16928291772826938293.wcn3950-poweroff-v3-1@michaelmcallister.org>
In-Reply-To: <179484638195.54009.1916641645532262287.wcn3950-poweroff-v3-0@michaelmcallister.org>
References: <179484638195.54009.1916641645532262287.wcn3950-poweroff-v3-0@michaelmcallister.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Unregister frees hu->tx_skb before hci_unregister_dev() waits for an
in-flight HCI close or reset. That path can still flush the same frame,
causing a use-after-free or double free.

Unregister HCI first, before clearing protocol readiness and cancelling
write_work. Skip the HCI flush and close callbacks during unregister;
the transport teardown frees the frame and closes the protocol and port
once setup and HCI close have finished.

Fixes: 21139b3ac62a ("Bluetooth: hci_serdev: Fix use-after-free in hci_uart_unregister_device()")
Cc: stable@vger.kernel.org
Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 drivers/bluetooth/hci_serdev.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/hci_serdev.c b/drivers/bluetooth/hci_serdev.c
index d2c48df34..e0e969228 100644
--- a/drivers/bluetooth/hci_serdev.c
+++ b/drivers/bluetooth/hci_serdev.c
@@ -97,6 +97,9 @@ static int hci_uart_flush(struct hci_dev *hdev)
 
 	BT_DBG("hdev %p serdev %p", hdev, hu->serdev);
 
+	if (hci_dev_test_flag(hdev, HCI_UNREGISTER))
+		return 0;
+
 	if (hu->tx_skb) {
 		kfree_skb(hu->tx_skb); hu->tx_skb = NULL;
 	}
@@ -144,6 +147,9 @@ static int hci_uart_close(struct hci_dev *hdev)
 
 	BT_DBG("hdev %p", hdev);
 
+	if (hci_dev_test_flag(hdev, HCI_UNREGISTER))
+		return 0;
+
 	if (!test_bit(HCI_UART_PROTO_READY, &hu->flags))
 		return 0;
 
@@ -402,6 +408,10 @@ void hci_uart_unregister_device(struct hci_uart *hu)
 	/* Wait for init_ready to finish to prevent registration races */
 	cancel_work_sync(&hu->init_ready);
 
+	/* Drain HCI setup before clearing protocol readiness. */
+	if (test_bit(HCI_UART_REGISTERED, &hu->flags))
+		hci_unregister_dev(hdev);
+
 	proto_ready = test_bit(HCI_UART_PROTO_READY, &hu->flags);
 	if (proto_ready) {
 		/* Clear HCI_UART_PROTO_READY under the write lock so a
@@ -423,17 +433,14 @@ void hci_uart_unregister_device(struct hci_uart *hu)
 	cancel_work_sync(&hu->write_work);
 
 	/* Free any partially transmitted frame left over by write_work now
-	 * that the transmit path is fully quiesced. hci_uart_close() would
-	 * skip hci_uart_flush() because HCI_UART_PROTO_READY is cleared.
+	 * that the transmit path is fully quiesced. The HCI close and flush
+	 * callbacks leave transport teardown to us during unregister.
 	 */
 	if (hu->tx_skb) {
 		kfree_skb(hu->tx_skb);
 		hu->tx_skb = NULL;
 	}
 
-	if (test_bit(HCI_UART_REGISTERED, &hu->flags))
-		hci_unregister_dev(hdev);
-
 	/* Close the protocol before freeing hdev (intrinsically purges queues).
 	 * Some protocol close handlers (e.g. qca_close) may still access the
 	 * serdev device, so keep the serdev port open until this completes.
-- 
2.39.5

