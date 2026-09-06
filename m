Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3B53537CD
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Sep 2026 06:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788675556; cv=none; b=VXFxS2FPzhEJvnYyBIW+yG1XMNJ2233q9gdoA6BZICgZV4RFHDbRX6zCTHA9vXgdSUhzKeSvLxbItzIgeVPmh1gpZShokoXXS8VaWG3EX0j/xi6pEAY3MxJvx199gLwk+I32FxWro1t27KFHFLvg+9Jl6qrA8VcrmI3oJlMOZHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788675556; c=relaxed/simple;
	bh=Ss7geLSo4QMEZ4B3x1S5NF2GS/0eMUyia4inV+Q9JpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTUtrx37RAhCoxsHREZJ6rMBOe8bueyNZo8iHVj6lun0Ii18ZW7tGEmwbaOSWtBisHw7wooj7s0hOhqjPgS+S4f4NFerQA40XJ023V8AB4UfyWNrk9FhkJBxW6Z4n3ZiGq4Wj92GdBKQ9Foa4HrISvO7JlyRVwcLVAQBZ2/7Rfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEOTkpM+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEOTkpM+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ce98cb8165so24880375ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 23:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675554; x=1789280354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSBnT3FwZUixZgWDq520Ci5om1V2mRpux1OuDBHI5/I=;
        b=HEOTkpM+jE97V4Af+GCOwzUytoJoNGfgBxJJSGJFL+WEsRi8dNQHVB25ILq/FUitnq
         TrhcRqD6skTgfy2E4XIW3hmLFfBdswerC4PVQ3U2E4ty6xQzOcH12n9Ep52Shvru494B
         TSTpXZgu1Gn/lRp1Gf3o4t+ixqx7K/5gS74IS3qXgyYB8uYtZ1KpX5g92pWaCzxL3Rdj
         S58Lu+gG+TCQLvWSY2wmgFFbwHLO0TeC0aKg54VDehNe3yMxjDjma1ArhzTPlmycBhlT
         0iQFWfapYY7eS/QfMFyj5iRyqecg2QI6FWoLe4y8JgzM2T/5M48XAl2fftU/6FTJ8fM/
         ogJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675554; x=1789280354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSBnT3FwZUixZgWDq520Ci5om1V2mRpux1OuDBHI5/I=;
        b=GRJjGWUaOhiO5PB4VyFstmJj/9aDMwlEYE3jJBdqWsocRUefNkVI066SRGvnqd0ib5
         GpQDPcgXwr17PZdoY7g9InTvXW+JwZfhyn3xz+cOB8Sskla5XP/cq7SHy1XMbOlz4StJ
         J6V2J0LJyfOIaexmHXkllhInuTSTrS3QzttvTiWZdxa2wED/kkG3Z4hgxNPZspBxne4w
         J1VDor89P2nndl4u5cRx7VdDXP0JqRpmVnUSiAmHEJalSzEEX50BijueXqpgJbh0YSvS
         qAaCnWLkYJsBUn2JndSPlwY3yVOaIRRDDlhhwutELk12HXaM8L3Me0ThmCUB2QQZctDd
         6tIg==
X-Forwarded-Encrypted: i=1; AKwUvBzUlWy8OLsi0Btnc/leDtQYJD3SfG5g0+fNyPWibBZQ8nT8cT/LoeFjRpuFOVH/mwk/qoUDYUYYTBSMv995@vger.kernel.org
X-Gm-Message-State: AFuF++l1TUkldCPqL9OS1sMqlfFsqhMCj7BykvRHbn3XD5LV/ChD6/U/
	sn6FSRdhHJ2z+MIOnIIUAeL0x+iQSFniqTkOhtfB1zSGKmAupYkRz1kg
X-Gm-Gg: AYBFou37mtPBdd3kMIKumk5fOUxShduwz2v9CNFb6CGhRRtC1GV3eRtYO7yNzuq3gGT
	6bmH6RHHanRNc0Wdu+5lRY/U8EZwwuehD0PJwp8NM8fG+vNmyQZvJl6Fs0R4yDWgOx48zoK05HR
	mckZLOzq9sbmf2YsAp73oNBf4wEAM7ZIjAgH/r3H4kdbn18pa6i4uMOgWbydcwVdp/RKSITuOIn
	S1X/IEN18vKqdH4HdexC+NG1vM0ScNt9x7rJmAGGa9/KdyhoiN9IWXLeto4QLQsb4888QxC0y1R
	Ta61gW7Ce9vizMpXds/+VXXbivYwWbbrIaD05S9vxsec7L2lW9JTNI8wVGc45pbuGVOHho+GzLA
	38yhInnriKzI3KKYZBOuPsSc/z6XFed3Oop5KZ8PV15m0oQFhtYUqwRUqMWamlvc/nn3w9/bPLf
	VznFpIUXAAiZv1iPj+UcZ3kPV4DQ8SqAz1PdJ9YuNOLlmD2/EeBDxPA8/TIMI=
X-Received: by 2002:a17:902:da85:b0:2bd:2c3a:2a36 with SMTP id d9443c01a7336-2dafad14a8fmr205668835ad.0.1788675553947;
        Sat, 05 Sep 2026 23:19:13 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:19:13 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	krzk@kernel.org,
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
Subject: [PATCH 5/5] power: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:54 +0530
Message-ID: <20260906061755.5103-6-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906061755.5103-1-sumeet4linux@gmail.com>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace PTR_ERR() and %ld/%li with %pe and pass the original pointer
directly to dev_info(), dev_warn(), dev_err() and dev_dbg(). The %pe
format specifier prints a symbolic error name (e.g. -ENOMEM) when
CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls back gracefully
and prints the raw integer value. This makes messages more readable
without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/power/reset/macsmc-reboot.c        | 4 ++--
 drivers/power/supply/axp20x_battery.c      | 4 ++--
 drivers/power/supply/cpcap-charger.c       | 4 ++--
 drivers/power/supply/cw2015_battery.c      | 4 ++--
 drivers/power/supply/intel_dc_ti_battery.c | 2 +-
 drivers/power/supply/qcom_smbx.c           | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

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
diff --git a/drivers/power/supply/axp20x_battery.c b/drivers/power/supply/axp20x_battery.c
index ee8701a6e907..915b6f6881db 100644
--- a/drivers/power/supply/axp20x_battery.c
+++ b/drivers/power/supply/axp20x_battery.c
@@ -1123,8 +1123,8 @@ static int axp20x_power_probe(struct platform_device *pdev)
 						       axp20x_batt->data->bat_ps_desc,
 						       &psy_cfg);
 	if (IS_ERR(axp20x_batt->batt)) {
-		dev_err(&pdev->dev, "failed to register power supply: %ld\n",
-			PTR_ERR(axp20x_batt->batt));
+		dev_err(&pdev->dev, "failed to register power supply: %pe\n",
+			axp20x_batt->batt);
 		return PTR_ERR(axp20x_batt->batt);
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
diff --git a/drivers/power/supply/cw2015_battery.c b/drivers/power/supply/cw2015_battery.c
index 1bcb60cf763d..48643f7bf503 100644
--- a/drivers/power/supply/cw2015_battery.c
+++ b/drivers/power/supply/cw2015_battery.c
@@ -658,8 +658,8 @@ static int cw_bat_probe(struct i2c_client *client)
 
 	cw_bat->regmap = devm_regmap_init_i2c(client, &cw2015_regmap_config);
 	if (IS_ERR(cw_bat->regmap)) {
-		dev_err(cw_bat->dev, "Failed to allocate regmap: %ld\n",
-			PTR_ERR(cw_bat->regmap));
+		dev_err(cw_bat->dev, "Failed to allocate regmap: %pe\n",
+			cw_bat->regmap);
 		return PTR_ERR(cw_bat->regmap);
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

