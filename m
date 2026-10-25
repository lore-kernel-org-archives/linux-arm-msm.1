Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960316;
	b=nZAGznQd6O+BhNSQdVanlMWUxyWPERDG/M2xiSwa2vSFpd/vyGbkGOYDCf48Hdw45e+K
	 O9GuIkh2FG8p8hwKR/Ya5CDRigSW2o84q8/l0IkaAh5U304oGqwVkZPQrF8y0e1RKIFyq
	 FmxlVfIY0vBKiDCu3o+7/ZABzWJvvBz9Hjv+Yhk0nKwaWKdu5VRTn3uEdSCiHCh1907A5
	 ng8ZfMcuqA70RbRrxFlAoCy8/7XKb6XP5902OISuguBojilIgsVNWMMhz/qr4Q2A9nS51
	 WJkXrWJE/XPsNRRqVvLBay36NvkPsYQRj20w729ti3ZH1oMyRwt/U2V4jgWQPUIL9HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Be2Qj5VPj3anKQUTdbqSapQ73mXLTFDSUDurM06zZss=;
	b=oSr3mZlLMcCdRWs72fviYdNWUALBKl/8TEgV7lNgcdVZu95cVP5bNOjxkzRLaVmhoZ37
	 kO84WaJ3g8pS2Sz60QLu+x+4a7yAC6xnPYiEc+9/x0VMaHXxSTxcNYPnAuMNUQNlGfVI/
	 5epG++TzWzl8l9lMkNuiFiVJk1cCJMf8gf7LIdLXhVeaLXiSVXADW7/48wOtAcvaPiha9
	 pMUijsWh9CxzicvBgHOWZgz3diKaJuEH36GabW6+6ggVHMoMQAI7c8EFwjbODLm9HIzIF
	 6VMKSKVGsXV0Uh65pwPg8uIaZ3KCWE463BEQe70NEa8GihKp8hQLVZBb77MVHIAdNgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K6aBLVdw;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EB5606A31A
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 20:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83EB5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K6aBLVdw
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso3607790a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792960315; x=1793565115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Be2Qj5VPj3anKQUTdbqSapQ73mXLTFDSUDurM06zZss=;
        b=K6aBLVdwCtDvNVXrUDErFoAr+HRy4mh7AvlIq94sT2SQL9nyA0N0K9H5ArPFI4co+s
         Hr62gpQP70mBYNeGejcjmoM+Cfj3qhkDcel7pq7QbZsdI0VbAbD6rDdyyY4kvpsHlHUv
         iyzeHlGZwXYYHFOqfgle5UBdOdTPCbKp7wAxs9Mw3zsMWCfZHMsRvOP2eVfXmTACkLBo
         lYLIOPAIRQABc4UuQ7pnKwWy378A7RpZE6pdLZ7SNuijZrhAmeIIV+RqlgtNgxXrBTlr
         GjuvAgHMD07GeL3Pq8U3S5MLlyf8PMp0+5yvMvFbjZs9lpzvib0qYA9zy8nH4IwyQayl
         RFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792960315; x=1793565115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Be2Qj5VPj3anKQUTdbqSapQ73mXLTFDSUDurM06zZss=;
        b=19aG/46tkBm44yTL02dqblmKbtOZldqREAcLb46kmSUHdXa5pugP4n3qiObeoqhg8Q
         7v7Bhqb5bzGMI+LMrtFT1N5dFSXsfFjp+DP5QsSlJ0VrYrpMw/H+8BWx3ZB9zFSu2q1V
         MOeRimADNfMHHGPiJAnzpIw6vfs8w/3ChnteU0aQWlrGLM9ID3isqgz+ltLU20OZo2jR
         zgm4G9BILX1AzS5rYiIe7oKXK1hlhKpSAL8b/wXTpFw0JAjKWPzwZ//+sqe8fbfutCdH
         eCY9nj/Lt9uKVA8pnkWygBsu+gdzU9OLVNZM1nmfgixO0TUEnLxrox5npN56yX+xuDS9
         hhEQ==
X-Gm-Message-State: AFq9FYK2Q8uf0VUscOdhQHgR6OFJOfHK6v5ml7we+0gING2uo7bByxI5
	wxv87Cj0tLH3GHd3FKDw4IniC2ca1zxbZWTXPl1jdYtQ8XtfRtsveNHsCXsolVDrxwI=
X-Gm-Gg: AYBFou2qM4YyFDi35TrWh91ahYrb4fHKNYyFmr0yFo2FW+NiU5uN71fo6Grcw5KNOR4
	mKHU7IiwP3NAylFgtlH0naBrZnpEyl7s+PewNWmTlNHbj6VCul1wNmt+L02kb2CBbq1eyRV+Zqr
	bD6mFmT9gqv4w5bEp28HhhpFazi6PB4KS6bU0No1onhoI8Yy3bca0tWnACN27H8gEzE0W/ipz6v
	UOKAdxW2RqdAUwa5Lpe0eXGrLt8El85uvnZrtLpyN3qLmdngB/zAMsV/aMBbsDpPwdg3lkPvItf
	5mztNl7HSOI0TkJIorgRXDAFwKSCGXwnp3utk3ZzYUKGGmWl3LCV3yPFwNu9sxgcgjnCMd1pt1f
	/5CA04cvUhS6pxS+2RT7pWjNQ7nO+aGF/npulgw4rm3WemlAlyQ1UkGvlF6INAZ0RGsruPJp/TJ
	+OMFE9g7x7FvgK3AqgrxXQ0cJtV4vDkTWt1Qk3ZEnFSmyLK6Dr9+rst4JHCjZgQSjjbdcqQ//7d
	c9m2i9Znun1tL6s/mGQfWTDp09mgM9Eut+VcbBY9ubY5rQZqOjHf1kKeE4GSzHniBEe3LcpyvVi
	LKJoyrhUJQxMuOXGEPd2/r1zITM+UuMQdsjDKmGELv7GrEGEsnwlNUIsrkBylFbibu5Vbe66Z4S
	RgGER+7G5QTF8nvfUq8XQ6siwqFI8JzaDFlYHw8d/5fWx
X-Received: by 2002:aa7:d286:0:b0:6b3:8018:7643 with SMTP id 4fb4d7f45d1cf-6b44300a8d3mr4496308a12.45.1792960314732;
        Sun, 25 Oct 2026 13:31:54 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44595df8fsm2802175a12.11.2026.10.25.13.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:31:54 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] usb: typec: tcpm: qcom: fix connector fwnode_handle leak in qcom_pmic_typec_port_probe()
Date: Sun, 25 Oct 2026 22:31:51 +0200
Message-ID: <20261025203151.455062-1-mashikiselby@gmail.com>
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

In qcom_pmic_typec_port_probe(), device_get_named_child_node(dev,
"connector") acquires a reference to the connector fwnode_handle to pass
to_of_node(connector) to devm_of_regulator_get_optional(), but never
releases the reference.

Call fwnode_handle_put(connector) immediately after
devm_of_regulator_get_optional() to fix the leak.

Fixes: 506927b6bf29 ("usb: typec: tcpm: qcom: prefer VBUS supply from the connector node")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index bf985efe1..b89495315 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -728,6 +728,7 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
 	pmic_typec_port->vdd_vbus = devm_of_regulator_get_optional(dev,
 								   to_of_node(connector),
 								   "vbus");
+	fwnode_handle_put(connector);
 	if (pmic_typec_port->vdd_vbus == ERR_PTR(-ENODEV))
 		pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
 	if (IS_ERR(pmic_typec_port->vdd_vbus))
-- 
2.56.0
