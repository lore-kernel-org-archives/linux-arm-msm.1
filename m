Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719611;
	b=zzK8BsZCQN9eqPbQ089qpIp1KTWmLc5rk4szosqg2OO9N9ngCJw3dA3K0f+BS4QsdROp
	 BJDuUg8v1hJSIIMWcRTJPcCDwOEEP+/Cd8h7+c70Mqg05deC5PXXMMabq/dy894apn0OP
	 wo1p4P2L3MpVrnxtbOkgZ9iHAuk1GluWUJmFk6n1wFa0rXs5M557kGD4ytmbaBc2YgitN
	 /0O/4/LmHoQMUTgtT0B2sHF8r5HAJzbai/LL/nnbjN/fEklqMKa7xAWMUzURejB/JNbin
	 3eC00gobz3sz1MLBzU6fW2hg4kD1V7sQJxfobvPktVVgWDmiolKvIClL650IQWHBzFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719611;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=AfU3oT4m8InMNUbGKQABQ8Ng63sjdtH6zKwdFH/dzU8=;
	b=MJSdaClH/ug5L+kEcK1Ia6rJWLH7SIrldim5GI1xnSjD4X2/8Y9wOYwN6KwtAnpB6PlI
	 tUXk2gvgHl0Zzc3oEWiRFx32YQ3ViFvo4Aw3BNuHEH1FgSI6eu86mvyIEJKLxMvJaHYx1
	 IWMwexBq0M6oL9oeR9qJN9dMtUCR7PY/1eEDn/MN/8fanoQVcodwmnaP4rYuQi57Y2fci
	 /86RfuQFwHQHTLZ2DX6ERKSsAzZeeuJYBCeI49DAdSM44s8mTAQ4h5NUfMUvEfhKDkVqS
	 MCkM+clSegtnURqApsuo0Xu93CWK/Iypk6i00nJSY6gRnXITzwh7dU6rgs6eDFsNkSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=SpZ14eVW;
	arc=none smtp.remote-ip=185.70.43.171
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81687606A68B
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81687606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=SpZ14eVW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1795719608; x=1795978808;
	bh=AfU3oT4m8InMNUbGKQABQ8Ng63sjdtH6zKwdFH/dzU8=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=SpZ14eVWAOpNlBxeMylViwjY1jSDJEXxT07214fuG5ZvU8Vif+mQyErsDUcWKbtbw
	 P5zFnKZ9PdfD7fpGq6QIAsav2V8GOlCZ1g7X8AhQ7qRx4sb1z3vN+WDMoJ6nKvnQpl
	 v0QO1ZI95S62/T12m2cS2oY+N9fxtmMAFHjV9WQHSspS2SIbLFAz4zpBiYfbJKnPrZ
	 wyQxOn55J6kihpUQyhfruy8b4s9Bu3GkR03NTvHDtTu/BobcXOk3YOry5DceLzlA0r
	 JP0WwbZFWf0n6fOmTApi313cIY4+px8Y+/3kkj1spULxpLnLRgbJSUoGkui2Y/sOan
	 e1Dz6vSrbmvZQ==
X-Pm-Submission-Id: 4jb5TL5p7Cz2ScXb
From: Michael McAllister <me@michaelmcallister.org>
To: marcel@holtmann.org, luiz.dentz@gmail.com
Cc: brgl@kernel.org, enderaoelyther@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 lumag@kernel.org, markus.probst@posteo.de, mka@chromium.org,
 phone-devel@vger.kernel.org, quic_bgodavar@quicinc.com,
 shuai.zhang@oss.qualcomm.com, zhaojinming@uniontech.com,
 me@michaelmcallister.org
Date: Thu, 26 Nov 2026 18:59:41 +0000
Subject: [PATCH v4 4/4] Bluetooth: qca: Power off WCN3950
Message-ID: <179571958170.81221.16178314106519621947.wcn3950-poweroff-v4-4@michaelmcallister.org>
In-Reply-To: <179571958163.81221.3368253997777320112.wcn3950-poweroff-v4-0@michaelmcallister.org>
References: <179484638195.54009.1916641645532262287.wcn3950-poweroff-v3-0@michaelmcallister.org>
 <hvwqozj3r7n7igxw5qogu7xxya4fkhqanb334sroj37ufzdizu@qarvtlkkulmj> <179571958163.81221.3368253997777320112.wcn3950-poweroff-v4-0@michaelmcallister.org>
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
index d341481cd..898c7a980 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2284,6 +2284,7 @@ static void qca_power_off(struct hci_uart *hu)
 	qcadev = serdev_device_get_drvdata(hu->serdev);
 
 	switch (soc_type) {
+	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
@@ -2304,6 +2305,7 @@ static void qca_power_off(struct hci_uart *hu)
         }
 
 	switch (soc_type) {
+	case QCA_WCN3950:
 	case QCA_WCN3988:
 	case QCA_WCN3990:
 	case QCA_WCN3991:
-- 
2.39.5

