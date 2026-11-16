Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846401;
	b=mQVeDHVCe7fM1y4kuMOSLD3y5evbASIbSeDRNZ21R8vjEdC5uBYvBloKMFe+sKqJ31lr
	 ckeuWZryO2gTl+4eYpc7Dz4FAC2E2/g1aamGEkl807G6RNcEic+MnIeT3zvOih23lAg6x
	 tVR9GXxwHHv2ZqPNs4EeJH87BmgwX5Jzvgkr90jatUTaqjSvSi7JTPfLwnYm8W7sl3+fK
	 Dt+iIzcZBFZtQAxmsj8TC7PnGJCN1zZ26GfRKVQyxKVKjttyyVhmdyGSjOOBEDH8qSx0u
	 hmvUZmOPEmaztBpAWunkqXQMJQ4DyiXjyhoVjO1O3NarjW7lxh04QXhMVDB3h4OYKAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846401;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=dmDChotEha0iFqm+8jnyADjXLoziwfDG7A+l0ZouVYg=;
	b=MXKz20Dp7kpOXuOlg365FqytLR97WwKriGb8XlUqKgcyva4uyzmSC587sVmo/njHQTsw
	 rPsF8qlYxqqtpgU6E4DX0vtuEwvAAmvgz2Yl9xwm6vyArj53UdesoHrxGNdeScTyZfCdP
	 ClYuCPLIxxHYIV4FMEDpF4YmTZ/qoqUa0Ov3Cqf8jksKjJwan5JnmjlZulfxMxpG/YoDR
	 BFLfWIudiDPFrrVDhUR2607tHmH8n6pPhKPF4KJYwV1NhVvdTvCXaRSpHThBsPBy38HdQ
	 LCRvbfxjuBKN18Wdiy0ZO8nZUwfv962bA9JK0u6aovXPgMSkP3pP6iM4TpqQeCahrtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=sTyVA0aV;
	arc=none smtp.remote-ip=185.70.43.170
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52695606A882
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 16:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52695606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=sTyVA0aV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1794846399; x=1795105599;
	bh=dmDChotEha0iFqm+8jnyADjXLoziwfDG7A+l0ZouVYg=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=sTyVA0aVUz4LmdT0TlQlZlGGqbuFziWiwo1RpgZeGEfcv5DbH4dsDgJQK/N6v8FDa
	 oxdnj9vohi4sOUXKEvb9Z2V6BYtTswGzeuaTy5HY7bwM27raYsV6d7DORmD8SYr/cv
	 sVrR3nCvkYLVnsnx2/x8jgjAAnuLDELAUGgeNVz/o4yzAK+oHG6j9iwEwhrF9LjH40
	 y+BA9vmrtwB6/KgQ86lsVFL1PoFQv1aAEMO1WbL54Kiel+Oz7f9WHVY5GFhmCbl3VC
	 e552IHHBPak2JYIG4Jd7rTXirYb1r4JNNT9MPOoxLxCJ0FkRR8OgMHZBjymzx8FrV/
	 fdSY6abCXoVPg==
X-Pm-Submission-Id: 4jStXr49zgz1DF5G
From: Michael McAllister <me@michaelmcallister.org>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: brgl@kernel.org, linux-bluetooth@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_bgodavar@quicinc.com, lumag@kernel.org, mka@chromium.org,
 me@michaelmcallister.org, markus.probst@posteo.de,
 shuai.zhang@oss.qualcomm.com, enderaoelyther@gmail.com
Date: Mon, 16 Nov 2026 16:26:21 +0000
Subject: [PATCH v3 4/5] Bluetooth: qca: Handle failed power-pulse writes
Message-ID: <179484638195.54009.8260068189701829762.wcn3950-poweroff-v3-4@michaelmcallister.org>
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

A failed UART write leaves hardware flow control disabled. A zero-byte
write is also treated as success even though no pulse was queued.

Require the one-byte pulse to be accepted and restore flow control on
the error path, returning -EIO for a zero-byte write.

Fixes: f9558270b85c ("Bluetooth: hci_qca: use wait_until_sent() for power pulses")

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 drivers/bluetooth/hci_qca.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index ddbeb0787..6642af781 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1430,9 +1430,10 @@ static int qca_send_power_pulse(struct hci_uart *hu, bool on)
 	serdev_device_write_flush(hu->serdev);
 	hci_uart_set_flow_control(hu, true);
 	ret = serdev_device_write_buf(hu->serdev, &cmd, sizeof(cmd));
-	if (ret < 0) {
+	if (ret != sizeof(cmd)) {
 		bt_dev_err(hu->hdev, "failed to send power pulse %02x", cmd);
-		return ret;
+		hci_uart_set_flow_control(hu, false);
+		return ret < 0 ? ret : -EIO;
 	}
 
 	serdev_device_wait_until_sent(hu->serdev, timeout);
-- 
2.39.5

