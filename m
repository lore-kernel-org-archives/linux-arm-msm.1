Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747353B3BE9
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 19:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240353; cv=none; b=aCwzUbE0dLdCkqxuw/Z30/kc1KhtbKRIBhaSiY+vk0p1H/zfvV6xP4IYMnNlQUfxkBkwG6ovEt6phzHFYLQz90fCPOJlRXGzVaXTHdbNGr0T08WhmV1LLMPxmYA5mNN/S2owse2bIyHLo7F1KrAmKMu+HbTmHTCYRqyZJ84OUnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240353; c=relaxed/simple;
	bh=HR71RBZu/09n4yHrzzixKqkYtfz1HyNns5gTwWCUaXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ft+VB+22U/z8mL3lJLhvgKcXbKrTVNxRaXCNbh5Eur3ivHFePFfXAA1xVU+vHzhyUb9EHSzJXPPHEswUo0fmOi2HVoW/LDa473pPAXnkuIACelgITLJUIq6+/bS3jNh4Sj+51Bv0SiXBVecIE/P2h4Y8NUFwzbiC9VZRorzY8ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdAT0VMN; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdAT0VMN"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so914990a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240352; x=1789845152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UabZ98vj5EdaCQmaHDWkq9sH/9g2g8pmLq50Cl5sxiU=;
        b=fdAT0VMNUuUL1nyM5RH81Xay6oNeM+XaucvaFIProyNr6WUNrpqhuMoRz2nt1I3P6+
         TPUej33ANAyvei3e8Ee4C89GdEexMB+PLnhwp84XGGGhpduytSge8uEQR1TCXhS6mPrg
         vJ9rteRiTl7HtiuTFcai7zprwZy65ksZPnCq2e3oS2BkX/4ZBup1aG/27ig2LNwJRdjN
         cy5eblnHORhgR+Q4TXARaHQBg1eFPDF+Ht8flhsPKIMNkPhqxMztRM0E66i6N86gOjXD
         sHc8iWV5B+sEg++m0wyz+wEERX9W9C4H7Cuo+5xaDKWvW3NPW3G7I9MHMLfXbJ9pGqBB
         h1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240352; x=1789845152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UabZ98vj5EdaCQmaHDWkq9sH/9g2g8pmLq50Cl5sxiU=;
        b=GzNrRrHahgzfsbCS2vatHSmzSqQN08Yhsm8SvUu3ChvoqW0K5H5f8JEQCD9wW0USET
         ZTqNWjWJYgHlTAC4jrHhsJ6KaopHC3CUXIXxX6e8XQS28s04K5TMR4lQ11Bjm6oLcVUe
         bzV3Rr3YbAnMKBUhWbD38ytM7xFTAaskDhmFUe8EaAffi/vlY23wdKYsB4oVHXtxS038
         bc+e7d0d/kmkIrBcvJ39Tnirh6PW4pvMM2QmmlN9ZJuL8WlV/ADcRE0NEat5osKIx8hO
         jYFuPUmJkxPU2VqPM41eFScnPgyBq+DNwS8QYZrByx9s3pEQ9TkTntjewPPQ/E4n3mEE
         xGDA==
X-Forwarded-Encrypted: i=1; AKwUvBzX5bfm5iPTP82TqSDlN30TAxtkgVJwaX5rtTnQwtsdR8NzTDN5M5lyJNgYlA5PfVLLdarICLB5aUDXVvn1@vger.kernel.org
X-Gm-Message-State: AFuF++kwNU6AZC4i/QKklTbCvc3yDNQaFtjzt9RaixNHOgChjTxr5tSk
	Kuo3sqQyV4NUzoQrj9xxKMuXFCle5QXr1ckHbTFk5SHTJaLQ6DpYXWIv
X-Gm-Gg: AYBFou0g7S8Kdqxp1sppQRXaz18BYo+zn+pPctFy8JU4jwDyTpJPjYeVag3cm+4OagZ
	yf+zGh+LKxZFtRK8V15KxHor/XFHUqpFE1TdYp6dckwvaJTxH1EOVOH/08RVIBtZaJxW8cq9wuc
	iaXfNa5N8jKgFeT+uAaDBCVRMzbpazQQeykdkzXEVfE8t4VgGaIGmpAzJ+INUeXAaJMYI1EjB0t
	ldAJ6eZrZgTDSUs6GAU/9Gstfc3Ldt7e00TlHIZGoBsONSiWBypk/uoxKMd1tG6/qbS5FdL6B64
	AGGzOYlIK0NKETIdKbKPEGcrr8lvfpNrJ8WX4aiPlViQvPprtleLTdlCDJnyAtx2uQRwqC/9G+Z
	2/pEJhjShqZfIwmREeJQlmkmS8XP+0KOEImYpSGcdiH/NBms+7Eux7TTD3ShUbXehxLB4hRDRmM
	NU3Tdy/6xQEVTAgOEVMlRsTUrW+k6TNldX2Ywmh6Nynr4XFZWXMvBF70waKv7GGBjRB2ti
X-Received: by 2002:a17:90b:28d0:b0:398:9bd4:d18 with SMTP id 98e67ed59e1d1-39d9c3f2ba7mr19386123a91.23.1789240351619;
        Sat, 12 Sep 2026 12:12:31 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:12:31 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	krzk@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH v2 1/5] power: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:51 +0530
Message-ID: <20260912191156.185448-2-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace PTR_ERR() and %ld/%li with %pe and pass the original pointer
directly to dev_info(), dev_Warn and dev_dbg(). The %pe format specifier
prints a symbolic error name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME
is enabled, otherwise it falls back gracefully and prints the raw integer
value. This makes messages more readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/power/reset/macsmc-reboot.c        | 4 ++--
 drivers/power/supply/cpcap-charger.c       | 4 ++--
 drivers/power/supply/intel_dc_ti_battery.c | 2 +-
 drivers/power/supply/qcom_smbx.c           | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/power/reset/macsmc-reboot.c b/drivers/power/reset/macsmc-reboot.c
index 9fc36fa68676..7b8460a55e9d 100644
--- a/drivers/power/reset/macsmc-reboot.c
+++ b/drivers/power/reset/macsmc-reboot.c
@@ -221,8 +221,8 @@ static int macsmc_reboot_probe(struct platform_device *pdev)
 		if (IS_ERR(cell)) {
 			if (PTR_ERR(cell) == -EPROBE_DEFER)
 				return -EPROBE_DEFER;
-			dev_warn(&pdev->dev, "Missing NVMEM cell %s (%ld)\n",
-				 nvmem_names[i], PTR_ERR(cell));
+			dev_warn(&pdev->dev, "Missing NVMEM cell %s (%pe)\n",
+				 nvmem_names[i], cell);
 			/* Non fatal, we'll deal with it */
 			cell = NULL;
 		}
diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cpcap-charger.c
index 34a57dd5c3cf..d423a8bdc0c2 100644
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -808,8 +808,8 @@ static void cpcap_charger_init_optional_gpios(struct cpcap_charger_ddata *ddata)
 		ddata->gpio[i] = devm_gpiod_get_index(ddata->dev, "mode",
 						      i, GPIOD_OUT_HIGH);
 		if (IS_ERR(ddata->gpio[i])) {
-			dev_info(ddata->dev, "no mode change GPIO%i: %li\n",
-				 i, PTR_ERR(ddata->gpio[i]));
+			dev_info(ddata->dev, "no mode change GPIO%i: %pe\n",
+				 i, ddata->gpio[i]);
 			ddata->gpio[i] = NULL;
 		}
 	}
diff --git a/drivers/power/supply/intel_dc_ti_battery.c b/drivers/power/supply/intel_dc_ti_battery.c
index cb6fa8d88b43..5819df23a543 100644
--- a/drivers/power/supply/intel_dc_ti_battery.c
+++ b/drivers/power/supply/intel_dc_ti_battery.c
@@ -349,7 +349,7 @@ static int dc_ti_battery_probe(struct platform_device *pdev)
 
 	chip->vbat_channel = devm_iio_channel_get(dev, "VBAT");
 	if (IS_ERR(chip->vbat_channel)) {
-		dev_dbg(dev, "devm_iio_channel_get() ret %ld\n", PTR_ERR(chip->vbat_channel));
+		dev_dbg(dev, "devm_iio_channel_get() ret %pe\n", chip->vbat_channel);
 		return dev_err_probe(dev, -EPROBE_DEFER, "Waiting for VBAT IIO channel\n");
 	}
 
diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
index 67fdb4335338..c8e242341d04 100644
--- a/drivers/power/supply/qcom_smbx.c
+++ b/drivers/power/supply/qcom_smbx.c
@@ -613,7 +613,7 @@ static int smb_get_iio_chan(struct smb_chip *chip, struct iio_channel *chan,
 	}
 
 	if (IS_ERR(chan)) {
-		dev_err(chip->dev, "Failed to chan, err = %li", PTR_ERR(chan));
+		dev_err(chip->dev, "Failed to chan, err = %pe", chan);
 		return PTR_ERR(chan);
 	}
 
-- 
2.43.0

