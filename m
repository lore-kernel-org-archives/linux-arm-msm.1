Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793227771;
	b=v1i1ulOAR2KxkmPQN5KeapYeUIUd8XjWiFskx4CM18HWRBHlFIBl96tTi8zwE4Y6Hbq+
	 E6UHFIGsk9E0UFgAZbpxxAwLrCOd4E3EkXvZv3JV97dODJ9cgF0TsPTOS2g7Jo7c8+EP+
	 YooDtcRa9f6n+3D9qAIFlmfjDfoqMhcVHaQUSOrjHktGAX9BRhngkIGX8FufR5FRfZM3g
	 0UW9V+3EooMu0YLZExm+/ZL02B1B7+BDzPvwP4vB2iokLj3Knt+ytKdx7FCsZ7CgKZ0X1
	 UrZYZ0oJdGquBrArYjCbAULql69/C1oyDnjejjjnJlRoyc2TcTtQtxZOMUTvmizVBCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793227771;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=xdi613cw/xFloJy23B/sfPOsV6/BpzP122gtrpKo4nY=;
	b=aJc05VNevY4zrdTkPPO+R3ovLDj+9zryeKyCfC3dXVcXOSinEQGpjKtfrcQ11KaS3YHZ
	 +edWwoLTaPa+Lb1fF9S8C4oz9opq4+zHxH7LjPXiMz+X7WBTOVYAvqAlu0JkQT2pVbW/D
	 +itJpDns9LblXFjLrrwruIu3u/Xu8FzULtjRjFg1d+IE2t6oE90mvkxDBbMTp7JlRkkNj
	 UbH/G8QXunVRyi1+UBdGv2xM8dCi6f4H+KxxaYX9sR6puBIk/JKWevX5nJ27FzQNnUapC
	 B6E4vLcdJ5pOc/oWf4YkZVXJ01K37RlerHzYRgeKY7S+EQ1bP7cRKq4YupdPHNhlLbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=bTHRUcgm;
	arc=none smtp.remote-ip=185.70.43.170
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB0E606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 22:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEB0E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=bTHRUcgm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1793227768; x=1793486968;
	bh=xdi613cw/xFloJy23B/sfPOsV6/BpzP122gtrpKo4nY=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=bTHRUcgmJIHSpSCu9oE47TJqAYtGLUQrYRXsGp8QhAI1vAhoCEar842owzsOgWbz6
	 /bTrN0VNOGHORwWKiVoUpekk6WlYHPfE8yw+HbKVHSY6BTCDhh79jdy4Te45ij6RwI
	 xqYkPgQEfJf/ZlvbGmrSEhGqgP4xtTjo3kg6fX8u0DwELWd0xaCE0fODWXd5rZ0EBe
	 5S246/hQj8MOUgx2rUefeQbFPY2lUq3Fo/wZpUBuR+vIauJ90vE3tXk6Epfqajhf2Q
	 GZRTiMqTVoeefsB11fLdYnBD+ulT8j+yt2PqVO3LJ4msKZJt5HO2fotEDKQVV4cw2l
	 HV+sKvsOwG6uQ==
X-Pm-Submission-Id: 4jFMxL04NNz2Scmh
From: Michael McAllister <me@michaelmcallister.org>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-bluetooth@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Michael McAllister <me@michaelmcallister.org>
Date: Wed, 28 Oct 2026 22:34:38 +0000
Subject:
 [PATCH 1/4] Bluetooth: qca: Restore flow control after a failed power pulse
Message-ID: <179322687811.94538.3167666394055235284.wcn3950-poweroff-v1-1@michaelmcallister.org>
In-Reply-To: <179322687810.94538.4628148055419456389.wcn3950-poweroff-v1-0@michaelmcallister.org>
References: <179322687810.94538.4628148055419456389.wcn3950-poweroff-v1-0@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

qca_send_power_pulse() disables hardware flow control before writing to
the UART. If the write fails, it returns without restoring flow control.

Restore flow control on the error path as on success.

Fixes: f9558270b85c ("Bluetooth: hci_qca: use wait_until_sent() for power pulses")
Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 drivers/bluetooth/hci_qca.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 7089e9b63..8705c4543 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1424,6 +1424,7 @@ static int qca_send_power_pulse(struct hci_uart *hu, bool on)
 	ret = serdev_device_write_buf(hu->serdev, &cmd, sizeof(cmd));
 	if (ret < 0) {
 		bt_dev_err(hu->hdev, "failed to send power pulse %02x", cmd);
+		hci_uart_set_flow_control(hu, false);
 		return ret;
 	}
 
