Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794681668;
	b=nQKwXJeFJmP3opo9JH4EmibzGFCYUT6CCY9N7KT73HxrRlCQCegG73vm1fowpoUfkHdE
	 oVw81fgcC16pxjR57dqV+mR7tldiEL2gxdgyTZjshG3boed9gG1EW12RIqjUNEOnYzMrn
	 XuN/PoLoFLIgdx0KFD0enGvjwRE+aG8CfpkQMXfN3o6gVinl6khM/De0o8KBaNdghXJ9K
	 o1DRLnk3sEpI0hHrHYRw6k3H0aEkUCFJCrgO0wL1M76ffgMnKtGpZVcH7rG6CZIyOcK9+
	 Q5XjRG3EOgP1Tu4P3dGHN84e8seBFHIU6Bf+aBdLePg/bQAtUdoELtMVcKYA4jk79jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681668;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Message-ID:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3D0u6TnXn7cU9TzO0Oe/RHRjfSNFZVI4UOig4klv+f0=;
	b=aXbG6HvP1S8AzFgRGvIZ2kouTb/3pUnP/lrEbEnlbdJY55XcrbJ7o6j8wE5BKrddL5Pw
	 EeRm42xVJ1MPOl9NNEPZ/88ClktymzvGJLS+DLMpDu9obK186oMUHv9pEEDW02G903GX9
	 DC3r2wx8UbUPkDmLyBeKZ+VV3YHHPpn2ZzizcuSCNX1z0zTz4Yl56gXYe9iEvX+bpabxp
	 ovuK8KH0WekWN7DXvVyMD9buPwosUi4rSQKJQ4AVsVRRIrszTuab78XDp5I0CRsalA8n3
	 fnMUGEg/qPYyuXx/2O/Qf3XuXSwJaqD5oxFXwC7yvSjL4yvyQZh8SyBw/yoKVDzhwVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=owvH1950;
	arc=none smtp.remote-ip=185.70.43.172
Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch [185.70.43.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793CB60A2630
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 18:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 793CB60A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=owvH1950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1794681664; x=1794940864;
	bh=3D0u6TnXn7cU9TzO0Oe/RHRjfSNFZVI4UOig4klv+f0=;
	h=From:To:Cc:Date:Message-ID:Subject:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=owvH1950Gqqr2UFMAo0Hjg/0UDn94Sg07TKdsNAvSoUTMf4uYxGZ0tCIRK1XaWKbN
	 Z3fv3Yk8/5+D+G0lPhmjVPYTQNnGDK7P+/y57yqpBbko69HMJ7qYc44CUVU+JgOQFL
	 llxiAOskad7t2ckuJo/0YYBKMvM1fw/4WShHrzlButnNEMY0fvG+GYO3JAVoTHi9op
	 l30Wdn5S6pl9SBXaz9JSbhoG+/qIt3pTQqv/N/zxrZi5/bc4Aykna1MhgkRxNu9XXZ
	 BhttytXMVt2C3Par2PaOTVhD8qaEU8s5QYvVS3bsD0LfcP+KwO8+KB8IS9eaYtBT0Z
	 i6L1rHwkQzs/g==
X-Pm-Submission-Id: 4jRjct4MJWz1DF4s
From: Michael McAllister <me@michaelmcallister.org>
To: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: brgl@kernel.org, linux-bluetooth@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_bgodavar@quicinc.com, lumag@kernel.org, mka@chromium.org,
 me@michaelmcallister.org, markus.probst@posteo.de,
 shuai.zhang@oss.qualcomm.com
Date: Sat, 14 Nov 2026 18:39:54 -0000
Message-ID: <179468159400.2456.1620455624350858393.wcn3950-poweroff-v2-4@michaelmcallister.org>
Subject: [PATCH v2 4/4] Bluetooth: qca: Power off WCN3950
In-Reply-To: <179468159400.2456.8302096233933976388.wcn3950-poweroff-v2-0@michaelmcallister.org>
References: <179322687810.94538.4628148055419456389.wcn3950-poweroff-v1-0@michaelmcallister.org>
 <179468159400.2456.8302096233933976388.wcn3950-poweroff-v2-0@michaelmcallister.org>
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

Turning Bluetooth off on the Moto G10 leaves the WCN3950 regulator
votes enabled. qca_power_off() handles the other WCN39xx controllers
but omits WCN3950 from both switches.

Add it to the existing power-off pulse and regulator-disable paths.

Fixes: d5712c511cb3 ("Bluetooth: qca: add WCN3950 support")

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 drivers/bluetooth/hci_qca.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 6642af781..bd8cfe95c 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2283,6 +2283,7 @@ static void qca_power_off(struct hci_uart *hu)
 	power = qcadev->bt_power;
 
 	switch (soc_type) {
+	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
@@ -2303,6 +2304,7 @@ static void qca_power_off(struct hci_uart *hu)
         }
 
 	switch (soc_type) {
+	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
-- 
2.39.5

