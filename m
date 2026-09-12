Received: from mail-pz2-f25.google.com (mail-pz2-f25.google.com [74.125.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1597D3A6F09
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 19:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240390; cv=none; b=lHBgveepjNcxmk2WFDsX7J+Vwxi5Hzz3L+bDUJS0lCboCCWJo7aTEQCgdoBmX6qmL3S+zcHEjdSMPlbQtb4wuMVMH78jPQM2HnAJbd/mGrtXx3l1jv3bZ4EwSKHeArlaoxSsRd9zIu/0QDG70SUxRL3LltK1ZW4HacyKP2t7RFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240390; c=relaxed/simple;
	bh=3EjLPMtvKg2GmNImlqYJqrTo1wBe3j2XE35A47khzrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GyXkcZADeFj4eqL22taCJ3UXGl6iFE7UMDkrQnqUt7FydObf2+rgdcgJ91CRpOG1gy/MhnVNkpFwQfeITo+wjwhKHPVTN1MWHchmM6qdODX3D71Q6brbYYRPoUEp9/C4r6yuJlZNYKl5SFbXYZL5W0nhgsxzcj0QHgt5g+5L7kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oxUnVPSY; arc=none smtp.client-ip=74.125.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oxUnVPSY"
Received: by mail-pz2-f25.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso863260a12.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240388; x=1789845188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/HIyoexeJaOf4GZ5Mzi02CK37U3A8OAhoynQEmxQpvQ=;
        b=oxUnVPSYBtPggWEn+MOfo9FXtx4DX3lANkbForUWBr8rbfzzKFho2+GfJafWnmw4OL
         n3vHsJjXCFk3o4Q7FgAN83gZjSajGkp+GqDPoEcpb376qaFj9h/yV8raEBElqhKe5t/K
         ryVsIKWdnwyeIv8PB+AHTIdsfhAOWJmlKQVqaUq5fZk95m3ysHWXL/SmfmF0858VsKKq
         k+LhXNRLAIZI0+GtKMaENAeT/9rNZQs9GmE1A5ATzVN2TVDvUTShl750BD6Lsux4UvBT
         u7QcRLVe93kQpOGgHVjWbbQLoisJAk9k/y7okfNpbRMehmsUX3x3KEsmwGTLQQl0kPDP
         AZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240388; x=1789845188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/HIyoexeJaOf4GZ5Mzi02CK37U3A8OAhoynQEmxQpvQ=;
        b=VWCEduTxEi0O1Tuc+32tUMphngkgGwuv+9UlOdFLXI0vAn4Ayde4lfVGSuSAbnR2bO
         VOH4kHUcYHPvE3Q7D7F+rrK/bH2E+xP/B8Yk2U4g8wWAEIrcZ43jjGhNn67omYm8R16P
         ATK0x8jTSPnx3WfO2K9NX/HkQvpO0EQV6jMMJHv8GTg7mIiG+9o0chnUF4nG6QgWsb7U
         FlvaKwiVaTSqzAR8T30xaNkn1AsgXSRuD4bqzg9jD5tD8oUX5wvccpQ+8bRvqayYtrpj
         MCio8CSVokXgBo5OmLgTDUuPVA2aMK29SmOOyVoRaL9WjRJICh8XyD2//cTp74FPzD4C
         1oLg==
X-Forwarded-Encrypted: i=1; AKwUvBwEn8vGGHfIVRx/KODfjJj0hggQEOyaoTwl0KY/pyPQQ/eEwO2qSsm7LLtCSF4/fBiKOcFnB1V2DxZIkx5c@vger.kernel.org
X-Gm-Message-State: AFuF++mQ0enmY2/lFrnya1nU5ufuRUqj5lJEVCp0jJC9/VLVLy1/gKDS
	o55RiXKPR5l7mpMeS/TilvnZo4ibyJRjUHfvuRruwVO2P0yIbfIe6Lk2
X-Gm-Gg: AYBFou2S0xlZQb8SD+qWLV3n1S8xsafP3PXYxNJsou4GXXHODF7UHLpb0kKg77gC/jz
	vepDQntIy3xSQ2LwiVRBBGqRluZnkA3G4mVNqskTmtcWxcUVUnPThrFDQJizVPS3i9i4H1PXZvU
	hXPJDwjhYqe6zcod/BBCjKqWpFCRhf/eSUjyEiRT6BHsOQC3YUR6lod8GQp4tELOsRAcsCxy048
	JAdt3Yu0nNMUN9IdAC5mPxXeIHjoXVmMvdBO7m+Es/B8oFgW2ec3VEdyD+m0ic9zoVBOsDDnYJA
	DIfmocsiMwJ1b8sOrRcAHm8gIihBByOpgaAyCrs79haR1FDCBqIZF5dc0ERcgA5NPjfU7NgEoKp
	wF3fiTnqrv5WMv/0ZDOOSETgC5Kskfll9fTXJuM82MDAVkJUq2huZgDxGoepSmvUn1XETXF7MTN
	lFZe7s70NLPk+U6d2Og2eyAh4JQlsIjk8X08gWyUsKVdy9P3I7EyD3uWutzgVgjwRk4WiH
X-Received: by 2002:a05:6a20:d807:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3daed15f5b6mr20435411637.8.1789240388372;
        Sat, 12 Sep 2026 12:13:08 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:13:07 -0700 (PDT)
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
Subject: [PATCH v2 4/5] thermal: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:54 +0530
Message-ID: <20260912191156.185448-5-sumeet4linux@gmail.com>
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

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to pr_err() and dev_err(). The %pe format specifier prints a symbolic error
name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
falls back gracefully and prints the raw integer value. This makes messages
more readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/thermal/cpufreq_cooling.c        | 4 ++--
 drivers/thermal/devfreq_cooling.c        | 4 ++--
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index 768859a7aed0..856d619370db 100644
--- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -661,8 +661,8 @@ of_cpufreq_cooling_register(struct cpufreq_policy *policy)
 
 		cdev = __cpufreq_cooling_register(np, policy, em);
 		if (IS_ERR(cdev)) {
-			pr_err("cpufreq_cooling: cpu%d failed to register as cooling device: %ld\n",
-			       policy->cpu, PTR_ERR(cdev));
+			pr_err("cpufreq_cooling: cpu%d failed to register as cooling device: %pe\n",
+			       policy->cpu, cdev);
 			cdev = NULL;
 		}
 	}
diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index 0330a8112832..9ada52cbf7dd 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -156,8 +156,8 @@ static unsigned long get_voltage(struct devfreq *df, unsigned long freq)
 		opp = dev_pm_opp_find_freq_exact(dev, freq, false);
 
 	if (IS_ERR(opp)) {
-		dev_err_ratelimited(dev, "Failed to find OPP for frequency %lu: %ld\n",
-				    freq, PTR_ERR(opp));
+		dev_err_ratelimited(dev, "Failed to find OPP for frequency %lu: %pe\n",
+				    freq, opp);
 		return 0;
 	}
 
diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index af72db6299cd..4554a6fa55d1 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -680,8 +680,8 @@ static int adc_tm5_register_tzd(struct adc_tm5_chip *adc_tm)
 				continue;
 			}
 
-			dev_err(adc_tm->dev, "Error registering TZ zone for channel %d: %ld\n",
-				adc_tm->channels[i].channel, PTR_ERR(tzd));
+			dev_err(adc_tm->dev, "Error registering TZ zone for channel %d: %pe\n",
+				adc_tm->channels[i].channel, tzd);
 			return PTR_ERR(tzd);
 		}
 		adc_tm->channels[i].tzd = tzd;
-- 
2.43.0

