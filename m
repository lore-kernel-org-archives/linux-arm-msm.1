Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197117;
	b=J7YfhE7Gr9UEf50rB9OFyv/CQLntyveWN4zWSVP5izH43eyIl9OMdkMHeUf4zIzBCNzW
	 6c2/JOhpDQOP+p0BLOc4o9KhW85N+FqbIiHdPNNVl8N4IHHO3u0+1S1QpoWTqCVCiE1WS
	 vcTIS8MylPzDSBvF50tv+VC16Ih66z08J/OCx8z5Z+cI1kH4xR9s18mrZ7EjPAWCIWlu3
	 KAVHiJn4EejcQ2ax5YgBUTNM67J6rkjTLuEc/4dmFGeol0/WKXj06+hOz7etVjelgKgL7
	 Vjjc1Q9yf+Hdm+fPUMtHeQSInOHdST2w8YVz2TEI7BEQztchwu5HgfNskSAOzztSFmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n++rx2vPRlANelrrltmpXRwH4hFgG58r1hhbvby3m58=;
	b=aQYgJ8EHy7z75n8Moe+o9mMeLn586gi4QIuv1fBzrIdQRF3F9Hb7JOEgB1cazvU84GFV
	 VYU6dXGcHv1V2uXaPf8a3uWb9TU93RTynBvcioBYyb8la36Uk6j1YWX7QRvwaHKjc3/Kg
	 PxVliIcL/Uff8EoBeAKcU9vGRc6yQQhlx4LwmR80fGc6oO57iB0GApcUyA4yLQB4JDTrC
	 crJznfghn52xn+KF1y2i9zLO1dNCJyydcSHOo0L3S5w9nufClc6zLExfKIHjxkeo+H8pn
	 Glx9vhvMD6iynVUrSrZTZ6UiRekQ6E52LCnFvsa4yRNwKBLSvHuAEb6sCdfDhX7jXsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I5gKMrwa;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6805E606D801
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 04:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6805E606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I5gKMrwa
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so219627a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 20:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197117; x=1794801917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n++rx2vPRlANelrrltmpXRwH4hFgG58r1hhbvby3m58=;
        b=I5gKMrwa19rWO9uB+yyStHKDiGnBXW/aY0L4wNFgNdUPc9Wa0HLrFNtNp7gDLaz8lz
         SUuHx6sALRlnpVJ/D/vnH7eNXbTUmvpD45oBmN1pLC7kIKvPbV5b+OVKcmP+9+opQkOK
         1jBNih8MgTlwHniTr0T+8bAZFkfjKDoPSzNGi6lPX7zre6ntCnsHqfhoQLXSs0qwN3dd
         niotTAQrSz+TSVH0+Px0iWPdOsvp108jwt6v0d9IU1bVTUEVWnf7GOGrC/JzWqDrheGG
         a7f9ayH04ssJ1QTvXRDWU7I6BUXFNJKrmRk+NZkIVKIZaLtijvg7pf7oM/DRYchaWJJY
         z8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197117; x=1794801917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n++rx2vPRlANelrrltmpXRwH4hFgG58r1hhbvby3m58=;
        b=DJ0xvT7Gu2qkMcZq98Kpncte8sq/zXSmhemJ1h0oQxSacWymspetAjoZlOxncK1hYI
         gKCjXBvCpThatxP0E5YD5M2AD+WiR8BKwZUFdFv1+RaHMJCX0NsPVjkqAiP8uxIj6lgZ
         gpCrcKsOHttRceD8GWoa3wwXtTfvjwQen0qSItpQrVyxvq7+Yy1G7oMQtWQHw+KJIiUX
         qoqyywEle6TnO2/k5+pf+B0x7pDyPj3RV3oJs+at3zmzVlna84uJIY2a+n3eoPbwzjhQ
         Clw1D7SwjIr5pBHMSS4RHjnXR8cPTnXx0VxU3+XEgC4Yo72tZ5ZH0kDCes04B45o8UzX
         u18g==
X-Forwarded-Encrypted: i=1; AL+hErGDI2D0bb/eknAs9tdrY7SZ23NP+lLhMCnFTFVuzNyQr9E5PcDprzyAGTq3eLABIyLE4PdWVBwKMtxcadox@vger.kernel.org
X-Gm-Message-State: APuU4Z/j/ynDPrmlJB4S2QeKba/P4rrekLOSTUJlh1K0q4XauElnEfQF
	SNHxqnXiODDpUDWf+ZQtGMWB/3B+L6R7n46qZJrB17ra4i6MpVLYfesD
X-Gm-Gg: AYBFou3ylgTWUnz8Bs3wpmzUJbFVamTwJqFzmbNr7zc5hQ//FHJeF/Ib+rt3vOO4iGr
	p98LDwVDd4HaCgnl5AknO2BPbZqTE4kZps3wCEUyAYBC/f/jbSED8yKUQj/k20wEurVGjCDjLwX
	An2krlikzNArRo9+Y8mveblJI+P45VmoT35lRIlHxglRudHWoiRi1P/1MlT8xYZ6KV+wzBmWkoW
	Pc8JWS8stwOx2kxcODUoTtpaDxb5umw8QxVUMrlGyUTAbVdcRv4/x9jWt6863uCFNEAEIQafHyh
	qjy4VTDNHnYvKoypj/rqpmRwbTE5rkm3GpeEFBfm6oJ6iPQsQQYI4If4NVKmdl1jv4juOrsZuCB
	8Yru3EVAepEpUOR2ZHVyE1VDo/UFG+uhbBno6uupgIkRApMbH36HGJg2crbkl0Lv2WOTUJgtvta
	i8Ax9OxU7RnCF/BwsxlD74qRZiACh9zvbboNIk+Vtkw7LzraC27gj17u5PkkNjkBKuNhx2DfbBi
	usrik+HeHpWQQ/3lcUz882g+t1iU80M/f8Pb4kXd2JJBA/Z5HtO+rVTjTZRYdS+N75IRIeoKHxW
	oxjRRoydrpQg5cJ9nh3f9+xvszhHzU4fjTFa964wtcJ5xFackgSP3PJIaLHzzxyd6NMCqweSe0a
	fyx4L0f3psDVaGZVgqFbK4J2vP5EDx/1o2I6AT67TSYeVKTnNy4y/DqaqzdeMsy2M7ew4ZutuEn
	2xNF7H5Z7eGbes9VzCx4rycSY=
X-Received: by 2002:a17:90a:fc4d:b0:3ad:25f6:1dd0 with SMTP id 98e67ed59e1d1-3b12d444739mr2752350a91.11.1794197116640;
        Sun, 08 Nov 2026 20:05:16 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127891fa4sm5116170a91.4.2026.11.08.20.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:05:15 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Alban Bedel <albeu@free.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/2] phy: ath79-usb: support the analog reset
Date: Sun,  8 Nov 2026 20:04:51 -0800
Message-ID: <20261109040451.114135-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109040451.114135-1-rosenp@gmail.com>
References: <20261109040451.114135-1-rosenp@gmail.com>
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

