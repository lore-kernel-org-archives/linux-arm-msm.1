Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793929378;
	b=nffXdyeZuVcjJ1LGM3ZBPBWPuWhkaxVapK6kH7NQd5YpKgIqvz3Gx3U6oR/UnfNodqR6
	 7gUQ3pUrVmdFm1fQJug9lvUCCeL6lpjRnTAeCmMNPvOMiGaDcS4X9lE5Xcs6YgyTLU/ji
	 Eix6gb8C3KacCF3O1vJ6U+8R7TS3Av7uBq8PAOLbjbaAfzlh4oms8hnNQBAPXq+pyeOLf
	 UwoOWSFw6FRkGcm8kJcFZp95xp6qk6qYsf7vJNORAg5DiK3GPjCp2a1GN9zCDG951aXAr
	 EKjqUyOKPdFnV7g3f4ZXbdeGjjGh6ybZ86b46tO197s4o1gg3zACvcNDolWh6E6Nybg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793929378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n++rx2vPRlANelrrltmpXRwH4hFgG58r1hhbvby3m58=;
	b=zWq8xhf2GQ8t2kGWHZjPe5DApM1VpqEyUoxsk3rqGBYjMkxn2N4iG1X5NSOzTlOh9kfC
	 35VRrZWQ2iVT8aiqYXLF4I8ceJxTcPlgobSeAssUFkCYMxgJS5yHIF640pc8ngXWyHlOy
	 vFp1QvwOZAjR86ndCCl4azH3z6AkNRO6gs0nkMl/2yMMzNukv7Cu7bJADOk+sA8FgZt5q
	 T1qkAQz5mGhMIjXL0DpTiISRM/o2ESdEuoK0Sn9TqZzoC186XtGMShF4o61I/K0161gA3
	 1LhrGsIzoWLcAIQUMwKj50t7kcxmC+JNiGAedsySoOVmROZto8phJ/xbbyOJIl7SqZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HaHAd0so;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15B0606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 01:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E15B0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HaHAd0so
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so55754a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 17:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793929377; x=1794534177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n++rx2vPRlANelrrltmpXRwH4hFgG58r1hhbvby3m58=;
        b=HaHAd0soOlAW4xzktGagX/fsOKIBTHrUK2I/D74+/s6cDhxTtgZMsU9EWYTFEga3Gg
         K74l4ODs8nRIMvZtTornOwqcKn2Fd+4Xx0436T0L1zxqJtzEBWXv0eoioPjccGm0oB2F
         r9qpV36SOBqGXJS7KWxI/CnjPEO62vFusou4g5aCegr3lojny3x7JwmpEwgO+IOB0bri
         aUtiIv3gXwuVMLAkrpfp7IJsXa5BcqNGubydO8MVdUVkuCXJAzWzSEiW1QUfGD36f8yh
         RPeaiuGNUekSmSuXj5X+Io75F+S1X9oKE/gBzUfF0wWXaYaMwQWvsCEA8LsgO7CjLiVM
         XgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793929377; x=1794534177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n++rx2vPRlANelrrltmpXRwH4hFgG58r1hhbvby3m58=;
        b=rzzLLsv/+by9Rx1lxb12j0lR6u6xqOd80jR9uVgesqnYNytx//mWKShmOqp7xz9bEk
         CzIUCM2NS7KyuAAExRmHjbSm8jgd9nmXwWEO33TeL7L2T552d2ObQ3FYK0BR34eBlZXS
         vVmEr7F829VmTRAhVP4HYdIqlYT9zd986hTZTBe3Gg2m4ZgBFh+NeaTFzNWuFpTpbF8V
         g4KYltR3qR21HX1CHx8xMKDcW4oJ7824JablFCSQwyjJpHTm7fZYdxyVFU1L08U2ugdu
         jNXZX0lfjDXKFCSaLbZRFmKiATFkE7RJP6ozegNVVPls3izM9Foxgy+i4RkmzXPClGRI
         QEuA==
X-Forwarded-Encrypted: i=1; AL+hErHnOfduHCDWqLJiKMUS0Qe3jEXxD+l+Nk0VoEvsCSgaldbdikZWfFJSbJG5XFPmd9ocpjZVP2mNhHjaTwMH@vger.kernel.org
X-Gm-Message-State: APuU4Z+bURgmmdJWpNaVR6TVP2Oq1FbCyRPZU1zSVesDqcMrMVSwa3Hy
	HTGlsMbBksDlrm+sQZzPes7Ozt0s4gsfEeBKAA9lMJKAeallmGpywznU
X-Gm-Gg: AYBFou1Lyb9vfuQEJcIwumIDWfLPGFijl2YzvVIo85GIuSRNDOciGxBvbriHepKTVFG
	sfmdHQa4Q+Dj6US6QifnWoGINOiOxNXyn6HvQb9jWNj2/Rl/R9DbDCYeJJvTvOFWTjO3jAtdXGV
	JO/ymMv0gW4MVo2jfSH2LEnaEKpeJ+o6X1piJYRR5OZF4buxELNggKDc1zM9qces5P66YaLj+Y6
	v1HBmSi2I6nmW+MQU49UAcX38ysaqw4pSafh1ZVlsaxf6HZgJ8tPjw8sIp0FTJzmCmtYv1BUktD
	SvM8EkSHECRnH54Wut2ilP8E8UIjqHpi/pcfFcF1o62toEC6pl2mMnHy3njETgxuzm3YtB9Ehz9
	lMkfKENK6RNKQxrygUkP8nskn1hkFjYReyMUdGFEaFHBPy7zROt0MwV0xCPadoVdk7Zz5KFVd9U
	LDofCnlHHoHnVsftZQFfdnzcQ8ENmr0i5Zm4LlfzPlasVR/ETEwar2ixyvNB8HxJfkC/yB3zYmD
	O4iRP2SEmYOUuq+EG4Ml15FsX0PEO+m2tIvdhCKQz7H8lgC4y1NUsLvn8peB3rWoQpUa6hrvvF3
	icyUWVAe20Cnq+3MXB8bBsoGk2c/SyJlxLmAaD3HqRSJk1gxJjJOKI53B0oODtVBesI0azvHNtI
	Ofn6BSyWf0j+Lu5tV6HmYUAeJagRmOafSbCYich2HspHdj2jXwN1s6QyuKvtemht4mc5jXPgybM
	ZIHQ==
X-Received: by 2002:a17:90b:3b8f:b0:3b0:ad42:dcb3 with SMTP id 98e67ed59e1d1-3b0db6e4166mr802421a91.14.1793929377014;
        Thu, 05 Nov 2026 17:42:57 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3265a52sm5407994a91.10.2026.11.05.17.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 17:42:56 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Alban Bedel <albeu@free.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] phy: ath79-usb: support the analog reset
Date: Thu,  5 Nov 2026 17:42:54 -0800
Message-ID: <20261106014254.544923-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From AR934x on, the analog part of the USB PHY has its own reset. The
old platform code released it after the PHY reset on AR934x, and left
it to the bootloader on QCA955x.

Take it as an optional "phy-analog" reset, release it after the PHY one
when powering on, and assert it first when powering off. This is the
reset handling OpenWrt has used on its AR934x, QCA955x and QCA956x
boards.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/phy/qualcomm/phy-ath79-usb.c | 33 +++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-ath79-usb.c b/drivers/phy/qualcomm/phy-ath79-usb.c
index 8e9565846b2f..1e7868fc0b5f 100644
--- a/drivers/phy/qualcomm/phy-ath79-usb.c
+++ b/drivers/phy/qualcomm/phy-ath79-usb.c
@@ -12,6 +12,7 @@
 
 struct ath79_usb_phy {
 	struct reset_control *reset;
+	struct reset_control *analog_reset;
 	/* The suspend override logic is inverted, hence the no prefix
 	 * to make the code a bit easier to understand.
 	 */
@@ -30,7 +31,19 @@ static int ath79_usb_phy_power_on(struct phy *phy)
 	}
 
 	err = reset_control_deassert(priv->reset);
-	if (err && priv->no_suspend_override)
+	if (err)
+		goto err_suspend_override;
+
+	err = reset_control_deassert(priv->analog_reset);
+	if (err) {
+		reset_control_assert(priv->reset);
+		goto err_suspend_override;
+	}
+
+	return 0;
+
+err_suspend_override:
+	if (priv->no_suspend_override)
 		reset_control_deassert(priv->no_suspend_override);
 
 	return err;
@@ -41,14 +54,22 @@ static int ath79_usb_phy_power_off(struct phy *phy)
 	struct ath79_usb_phy *priv = phy_get_drvdata(phy);
 	int err = 0;
 
-	err = reset_control_assert(priv->reset);
+	err = reset_control_assert(priv->analog_reset);
 	if (err)
 		return err;
 
+	err = reset_control_assert(priv->reset);
+	if (err) {
+		reset_control_deassert(priv->analog_reset);
+		return err;
+	}
+
 	if (priv->no_suspend_override) {
 		err = reset_control_deassert(priv->no_suspend_override);
-		if (err)
+		if (err) {
 			reset_control_deassert(priv->reset);
+			reset_control_deassert(priv->analog_reset);
+		}
 	}
 
 	return err;
@@ -78,6 +99,12 @@ static int ath79_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->no_suspend_override))
 		return PTR_ERR(priv->no_suspend_override);
 
+	/* AR934x and later also hold the analog part in reset */
+	priv->analog_reset = devm_reset_control_get_optional(&pdev->dev,
+							     "phy-analog");
+	if (IS_ERR(priv->analog_reset))
+		return PTR_ERR(priv->analog_reset);
+
 	phy = devm_phy_create(&pdev->dev, NULL, &ath79_usb_phy_ops);
 	if (IS_ERR(phy))
 		return PTR_ERR(phy);
-- 
2.56.0

