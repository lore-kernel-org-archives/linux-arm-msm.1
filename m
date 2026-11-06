Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948591;
	b=te2U4pACqTRmfYgmTIOmnHPZlujQic0tcG47XBh0GB6J0oNi5MVNMYFhSVROJY0KjGxt
	 oJIypcpv7auBgt618q8FjoLssLGO5kEOZlfiAUjXwtiGDaeRnuc1umIvQbL0ACmd78olQ
	 7HAt54srLMqHXZQ8Prdh92WJFHNspATT45ZCOCaci2Fpe3MY0L8JN8HjvxGQlgBfkri4L
	 Ru+dCBikAFAuxww9t/br+KVgKccewmtn9/e2lrSyfoXHlkW+U7HjMpCwnpQPwsI7MImhf
	 lvkZZH3gnG8FfQTLFBeXMRDxcpYd+zmRd2OYzstplBiRKpZ/IjIPDH4krVlTbwAFyiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HJgFJeGyP2RXmPUrqatqK2hfmi9m5K+BAW+Bimi7a/M=;
	b=MFU+3iqbnrKw2WyN3L1JMJaaosbfZm7ERQkLP4F7UNuAX8eIPd+WhFud7n0n3XNi860t
	 Z4aBO8Ywxs1jQ6Zo2okThWHeEqD2eVZoz/7AWovOaJwhr+/EbnStZ4F9PrNl6OUl0smva
	 OvtgEl2K3rG9b2SywHaGJAqBhPzNeTghLzBlvhq+H6I7ceF1E4QodNAhpUMlOH7tDwgJu
	 8NANF9zdh4RG1uHSToyZpNZ0PqHssaNZW4EyRNn6sKSBAkw/jlCQlw3OSOhXUFS9AfLrV
	 Ex+p6T2haDh3xZMJ+SWDZwAHNGwC33uUaxMPXm0Cqo+F+3yT7A4q+Uf3vrC74n7zjfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vAP9lf4L;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CCB606A328
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 07:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45CCB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vAP9lf4L
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36cad25b8b0so518716eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 23:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793948590; x=1794553390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HJgFJeGyP2RXmPUrqatqK2hfmi9m5K+BAW+Bimi7a/M=;
        b=vAP9lf4LC4FognGLWC813NI09sXXLXgYu+exp7h2HyG1VRhASWFg6ggPWl7g0Fp7Km
         r/OGFfuD06IX8lTQwX2Rl853ZBiZ0HIlpoisbD0b7iSMw8k94MQv8nmtrI9fodGjnFwI
         75A06TjtqLP2IYZy+eose7VvNp3Ph6rNlFpLdMzBXx74UHoCN0WyOjsqxQGivxxHGcAx
         cXWidSUT/WRXmwak6JS+jitRHyc+M1I2Kto+WQvca5ukv0PyhNShhUWceo/lV0ER1MId
         AIGGR/uhVjzKa24nI4x7qyO94PJnq3plxJ5iFj1UIa/TSPM8VR/FOvJjpRCLIwVhvGvC
         M0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948590; x=1794553390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJgFJeGyP2RXmPUrqatqK2hfmi9m5K+BAW+Bimi7a/M=;
        b=FCGYI6EOHhqP/EfChSuNAjNbAcZ+qhx0nU+SUYgYleCd3Jf66jpm3dZWo4x4RiutWJ
         VVxVQZomiHqYD9mUnrLgCxapUC7jIzAg1UByXKNR/6fAkaFg7Ljmokw97pHCnj+sHQ/l
         VzPdt6zTll4w/F8ZyWgaYMy2Hs+x/NPEj1VVm3cm/Jsx0ZFyXbtW2dhkstbD7YREeIcp
         HL4Of8rghF3G/Nr90GM6j3himK/9KZMOImZOy/5cMEyUj2U22Fuj2Q5oeRsNM6BTL9l/
         vybKLvWI6Fll4y5eaz/xM10phFjks3lc/3PafJnmpLcToT43Fgf7x9cVw4oPH3TQtNlt
         dqdg==
X-Forwarded-Encrypted: i=1; AKwUvBzxjXPrasts3DpP13HodHxW0Ul0Eez3cf6jMAtTLdAwqcms0LIuH4V0+eXEZf/vrOk/1ZUi2lcmrbgj9GPC@vger.kernel.org
X-Gm-Message-State: APuU4Z9XMlwONYzm0wE/CFUh2Z98mxJ95ng8I4SkMwtCw3rM2Q5BNkSt
	xNM0pUPycms1KVWyBt5eMOyK3VFGDlRXoX+N2QMaNdzVbtRblzYtsr0=
X-Gm-Gg: AYBFou3M+FPvwIX3bUOQ3xwiN3ZMBI/pPUADF5m5ZfJHC5HJH7ESIkJZONNE7HHstUH
	NkuHT7Fiy78TZoYGGUMc21VJHHYGbpQSjqXyx69NBAtCCFbN76u6tNWxBvOuW0dQVAnl3zX97n2
	43HpQ0QhfTgMWAkjQWdNMqyEhbeSCsMMLz8vKYSAV8ljfnVG4GXWfJ/Vrv2LA32Q6LK7fJ6apK1
	kHoOjdwQAOOOarDQPOK0iDc0w6bVjsQN9YbU1RK5fbfzsnV1tVGEh+6BpKWTjhZj+8mQFSj+c/3
	QTvx7CHq0w1Z60C8bHdIGxr8yfKIneXm5Mdmmlfptc0o7/gCYRF4JBRMDl7qNIJ5Y7AzzhYvgb4
	RorEoZ3Enf21+earmrtEaDYuexRGqWUN1Noe8mCyNbU/BnXtpr5AJOKczACu62XqxpbeiriPla2
	9CzrvacJLcrh9KNdu28PJdGM+ucau96hqNepNHWipoPJRH1SFtPgc92rMw4kNdjhmXx46y+WoVb
	gCwA+BVMjKnXhcZ3xWxcPk62Te+3OBu9FuGJVH/LVOcxpei8SRUITr9CjjkmHk9qOczgm23Kxoe
	uACfGcBSA1HCHhfH+YZw7XwKMUIan9XIPf2WMrJJ2Qv8c0N+4WQ=
X-Received: by 2002:a05:7300:ea95:b0:36a:18d2:8c79 with SMTP id 5a478bee46e88-36f76117e58mr2224940eec.19.1793948590001;
        Thu, 05 Nov 2026 23:03:10 -0800 (PST)
Received: from localhost.localdomain ([155.69.103.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm3508887eec.29.2026.11.05.23.03.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 23:03:09 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-i2c@vger.kernel.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2] i2c: qup: Release DMA channels if interconnect lookup fails
Date: Fri,  6 Nov 2026 15:03:02 +0800
Message-ID: <rc-review-20261106-v2-vc48-group-8e29ee9ee1f6@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qup_i2c_probe() acquires both BAM DMA channels before getting its
interconnect path. If devm_of_icc_get() fails, the direct return skips
the DMA cleanup and leaks both channels, including when probe is
deferred. A later probe can no longer acquire those channels.

Use devm_dma_request_chan() so probe failure automatically releases the
channels. Group the two requests so a failed RX request also releases
TX immediately before probe falls back to PIO. Keep reusing the acquired
pair when the transfer path calls qup_i2c_req_dma() again.

Close the successful group so it can be released explicitly at the
existing probe unwind and remove sites without releasing later device
resources. Release the group directly in remove, preserving the channel
pointer state there. The direct interconnect error return is covered by
the automatic devres cleanup.

Fixes: d4f35233a634 ("i2c: qup: Vote for interconnect bandwidth to DRAM")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Changes in v2:
- Use devm_dma_request_chan(), as suggested by Konrad.
- Group TX/RX requests to preserve immediate rollback before PIO fallback.
- Reuse an existing pair in the transfer path and release the closed group
  at the existing probe unwind and remove sites.

v1: https://lore.kernel.org/r/rc-review-20261105-vc-48-dbf6a486c74f@gmail.com

Based on linux-next next-20261102 (2637bdec0535).
Validated this package on arm64: the W=1 i2c-qup module build and
a DMA_ENGINE-disabled driver build passed without warnings.
QEMU KUnit/KASAN passed 11 expected observations using real
DMAengine/devres code and a synthetic DMA provider. These checks
do not execute QUP hardware transfers or prove concurrent unbind
safety. No QUP/BAM hardware test was available.
AI assistance was used for analysis and patch preparation.

 drivers/i2c/busses/i2c-qup.c | 54 +++++++++++++++++++++-----------------------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index ce30634e1f402ddbc092d9b220532d76455fc047..865c03d9aa891b9fc38538ae184541f74c0a2819 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -637,10 +637,7 @@ static int qup_sg_set_buf(struct scatterlist *sg, void *buf,
 
 static void qup_i2c_rel_dma(struct qup_i2c_dev *qup)
 {
-	if (qup->btx.dma)
-		dma_release_channel(qup->btx.dma);
-	if (qup->brx.dma)
-		dma_release_channel(qup->brx.dma);
+	devres_release_group(qup->dev, qup);
 	qup->btx.dma = NULL;
 	qup->brx.dma = NULL;
 }
@@ -649,27 +646,32 @@ static int qup_i2c_req_dma(struct qup_i2c_dev *qup)
 {
 	int err;
 
-	if (!qup->btx.dma) {
-		qup->btx.dma = dma_request_chan(qup->dev, "tx");
-		if (IS_ERR(qup->btx.dma)) {
-			err = PTR_ERR(qup->btx.dma);
-			qup->btx.dma = NULL;
-			dev_err(qup->dev, "\n tx channel not available");
-			return err;
-		}
+	if (qup->btx.dma && qup->brx.dma)
+		return 0;
+
+	if (!devres_open_group(qup->dev, qup, GFP_KERNEL))
+		return -ENOMEM;
+
+	qup->btx.dma = devm_dma_request_chan(qup->dev, "tx");
+	if (IS_ERR(qup->btx.dma)) {
+		err = PTR_ERR(qup->btx.dma);
+		dev_err(qup->dev, "\n tx channel not available");
+		goto err_release_group;
 	}
 
-	if (!qup->brx.dma) {
-		qup->brx.dma = dma_request_chan(qup->dev, "rx");
-		if (IS_ERR(qup->brx.dma)) {
-			dev_err(qup->dev, "\n rx channel not available");
-			err = PTR_ERR(qup->brx.dma);
-			qup->brx.dma = NULL;
-			qup_i2c_rel_dma(qup);
-			return err;
-		}
+	qup->brx.dma = devm_dma_request_chan(qup->dev, "rx");
+	if (IS_ERR(qup->brx.dma)) {
+		err = PTR_ERR(qup->brx.dma);
+		dev_err(qup->dev, "\n rx channel not available");
+		goto err_release_group;
 	}
+
+	devres_close_group(qup->dev, qup);
 	return 0;
+
+err_release_group:
+	qup_i2c_rel_dma(qup);
+	return err;
 }
 
 static int qup_i2c_bam_make_desc(struct qup_i2c_dev *qup, struct i2c_msg *msg)
@@ -1952,9 +1954,7 @@ fail:
 	qup_i2c_disable_clocks(qup);
 fail_dma:
 	if (qup->btx.dma)
-		dma_release_channel(qup->btx.dma);
-	if (qup->brx.dma)
-		dma_release_channel(qup->brx.dma);
+		qup_i2c_rel_dma(qup);
 	return ret;
 }
 
@@ -1962,10 +1962,8 @@ static void qup_i2c_remove(struct platform_device *pdev)
 {
 	struct qup_i2c_dev *qup = platform_get_drvdata(pdev);
 
-	if (qup->is_dma) {
-		dma_release_channel(qup->btx.dma);
-		dma_release_channel(qup->brx.dma);
-	}
+	if (qup->is_dma)
+		devres_release_group(qup->dev, qup);
 
 	disable_irq(qup->irq);
 	qup_i2c_disable_clocks(qup);

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
