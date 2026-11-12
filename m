Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794511218;
	b=YuSR4wZ62AWtRPVry/TUTQIalIZNJr8xWuVPL72+5PiW4CbZIkMBG/F1YToR8XOUT1DA
	 F3qGUealNdXtUJHdAlAbpr5GxKa4FixDZbWQpfej9y+JFU2EVE9gNt4GZHsCXU51x64i5
	 ZWoZTc+SIYDBL9E1LrLpZZd3wNZrkIykkjbINFvRU2nyTOpBphovGf6V7XIvKBV721KWB
	 NAd1WybQ6snhP8R04sHFavGo7X1OkqbZ95abXsR9Eyi9ad66hoGuVnxb1+tpXgEoOH0qj
	 KSNX8XogHXA23AfIUgp9VgGT69eMkBTuDtIJ7SCkS71qDWkBT4EmBjn5IG1S9Ek7KQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794511218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PVPJ6zKdJ7kgvRyUlRiPX5ovk6pUYsEuwV1lOtnjEfA=;
	b=Apjo7Wpz8nITlttjHe7sTbJy3/0JucEOOFlIkBYbMd6owzaSiM/hvTyuDKahkyoUjER8
	 mlk+V/Pf9rFnTtxXUfyFP3DQ/jRFLJCTdFVHzNK6/MbWf172gr/zZpRhkdh4CCL/31nhi
	 aYCiQtsjfk1KeDwfesll685gm0TrEfytEcsWYUf/+4sYfNnoJSdLF/2iut195U522baFz
	 N2u6uCSNMyTJAgX2Op6CxZj83Qm2fZUuaHgVBgJiFDwEwgZHn6yZGsg7fpwRY03V7uYEG
	 vcBPSMRdRMu2UY3j7AxN3UR0Jz+IB5FOiEHTUBOfIqBiebPIW6EdRlLnto2Vr/KtYdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BFbfdZRs;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BF8606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 19:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0BF8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BFbfdZRs
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37071c0f42aso333902eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794511217; x=1795116017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PVPJ6zKdJ7kgvRyUlRiPX5ovk6pUYsEuwV1lOtnjEfA=;
        b=BFbfdZRsrkf/O6yYdWUn/qjrTGRP1SnCuPyAnUf2g31z+r8f7LYKu4p1+7P9M286HU
         rBcyk3gcIDdHrIYRAqc+TxMKHp87rsNzKzXKXZvJyeukjWLefmDIOk+d3F07qpOrczbF
         l6hPPcQqjo5KuDUR09wdAGQFYzn682P6Udnbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511217; x=1795116017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVPJ6zKdJ7kgvRyUlRiPX5ovk6pUYsEuwV1lOtnjEfA=;
        b=Qfdf0VK1ECgVXG9maGW8DoxIXsCHuqhzZaBU1ebABWRNzSwqwJLudGGK7ul7QANiHj
         7YkMiDts9zAP/hUgV2MlYhCTOle/L5fIpLO+lf1NIuLzwwwnTJ7YL58ze+PD5Q8WoFJL
         hgBdGwuyOWNOtoqDLGSEJLhjbFGxvXZM5SC1IrorkO2fhYKM1tTH06fx+eJpZ2I0HoTB
         QDGWJvO4vOHQXcfG2Qa77Ofrd+ePsuinqvGaLXWNmW1TDsK5GcT1Ff/Nk/r1si5WCNnn
         bNHJvrVPEJ1P6tN5vRpu+IIXT0ir+7F9mNTb78VnO1GvxBtfJK+4JT1iuyFPzJWkgVkY
         YErg==
X-Forwarded-Encrypted: i=1; AL+hErH4H0FHdmnGXq669BvrLFq4cy758ur4AxJB3Lea0T/LmKWlpSjCODrrNIBw1e/PhPYTAogRlYbkjrbqFlU3@vger.kernel.org
X-Gm-Message-State: APuU4Z91pdfKAkIzo5hlmSDCcJZT5t41nAzOqiN9Psop+f74Cdrbjiq6
	vkk/8Wx4gWdEHWOw9srM4UsiAaPX6Jt+wf37ysFT93viZjocteVopPOgiTbX3g4Z1Q==
X-Gm-Gg: AYBFou2Yi2xKHGr8io67fI64G9woSxPqEV9XIOPEVAwNoBifQ/OhcWYT188ui4dUafC
	tWc7wxG61NH3c2wlWwuKkqOt1sg0w5MmgGMR03+7bdA6hm650WmAw1PmpOTSxwZ3ttI/0hxJMa5
	Oy7xZa2hJEX3cTxaXYpnPNvX50ExeE4/m+5ZvMSp8dlogGg/Ce4NLJCEXD3KatqcujDpmafgB9O
	hICGUM19PfTYp4nHoNW17c/pKcYJux/8c04GJem4DIHkJOBpTn6cwrXzxoLK7HLhVnWYzSBkeAb
	0WLXvrLicSLi1cFhjAFqzQ1gBPpS0q4oJdYyhZsruIIjlDoESyqhZmdj4NDX9dT5061n58ysdJU
	+MTS/P3eVercItWQTrzlNQ0kE1no9X7XaAsOeqCwEb5HLnYpGP1Do1yI+KuYgXWziFGS9ARxdIO
	Q/zPauEL1KyZesrqSsV+/6iPaEfpwaWOgMFyWAEIqrDnJPMk84vefjHX6ur4zxQjzB0kSlgyR38
	rRIqbizS9luHF0OsiwrQJipNWxbMxuxE3T12xWcoF3jFRVGy29JvE8yhkOlsUIXoKdGJC4SJ6jE
	tKs2GHVNy7BK0SMLX0GUIc1+DGCfuiJXgHjeHXliXzbTIa+zOFhbOvWt2vLg5UeWdBxr
X-Received: by 2002:a05:7301:2a9c:b0:372:79a0:e8a3 with SMTP id 5a478bee46e88-37963374fdemr130138eec.1.1794511216522;
        Thu, 12 Nov 2026 11:20:16 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:5446:563c:ac92:43a8])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-379558231eesm516606eec.12.2026.11.12.11.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:20:15 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-pm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Brian Norris <briannorris@chromium.org>,
	linux-arm-msm@vger.kernel.org
Subject: [RESEND PATCH 1/3] ASoC: codecs: lpass: Discard pm_runtime_put_autosuspend() return values
Date: Thu, 12 Nov 2026 11:19:37 -0800
Message-ID: <20261112111937.RESEND.1.I5cd238b1d4516d4d6980565e0a4e1b83d9abce63@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
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

Printing warning messages on pm_runtime_put_autosuspend() returning
negative values is not particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

Accordingly, update the LPASS macro codec drivers to simply discard the
return value of pm_runtime_put_autosuspend().

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
This patch was originally sent as part of a larger series here:
https://lore.kernel.org/all/20261006161337.9.I5cd238b1d4516d4d6980565e0a4e1b83d9abce63@changeid/

I expect it should be merged by subsystem maintainers, and we can make
the return type change later.

 sound/soc/codecs/lpass-rx-macro.c  |  4 +---
 sound/soc/codecs/lpass-tx-macro.c  |  4 +---
 sound/soc/codecs/lpass-va-macro.c  | 17 ++++-------------
 sound/soc/codecs/lpass-wsa-macro.c |  8 ++------
 4 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index ab8a1c2b0489..c703275fc442 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3919,9 +3919,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_rpm_put;
 
-	ret = pm_runtime_put_autosuspend(dev);
-	if (ret < 0)
-		dev_warn(dev, "runtime PM put failed after probe: %d\n", ret);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index def7dcc2058d..26e8486ce041 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2370,9 +2370,7 @@ static int tx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_rpm_put;
 
-	ret = pm_runtime_put_autosuspend(dev);
-	if (ret < 0)
-		dev_warn(dev, "runtime PM put failed after probe: %d\n", ret);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 61b24a1e4dde..a090b3e7b5e1 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1352,7 +1352,7 @@ static int fsgen_gate_enable(struct clk_hw *hw)
 {
 	struct va_macro *va = to_va_macro(hw);
 	struct regmap *regmap = va->regmap;
-	int ret, rpm_ret;
+	int ret;
 
 	ret = pm_runtime_resume_and_get(va->dev);
 	if (ret < 0)
@@ -1360,11 +1360,7 @@ static int fsgen_gate_enable(struct clk_hw *hw)
 
 	ret = va_macro_mclk_enable(va, true);
 	if (ret) {
-		rpm_ret = pm_runtime_put_autosuspend(va->dev);
-		if (rpm_ret < 0)
-			dev_warn(va->dev,
-				 "runtime PM put failed in fsgen enable unwind: %d\n",
-				 rpm_ret);
+		pm_runtime_put_autosuspend(va->dev);
 		return ret;
 	}
 	if (va->has_swr_master)
@@ -1378,7 +1374,6 @@ static void fsgen_gate_disable(struct clk_hw *hw)
 {
 	struct va_macro *va = to_va_macro(hw);
 	struct regmap *regmap = va->regmap;
-	int ret;
 
 	if (va->has_swr_master)
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
@@ -1386,9 +1381,7 @@ static void fsgen_gate_disable(struct clk_hw *hw)
 
 	va_macro_mclk_enable(va, false);
 
-	ret = pm_runtime_put_autosuspend(va->dev);
-	if (ret < 0)
-		dev_warn(va->dev, "runtime PM put failed in fsgen disable: %d\n", ret);
+	pm_runtime_put_autosuspend(va->dev);
 }
 
 static int fsgen_gate_is_enabled(struct clk_hw *hw)
@@ -1693,9 +1686,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		goto err_rpm_put;
 	}
 
-	rpm_ret = pm_runtime_put_autosuspend(dev);
-	if (rpm_ret < 0)
-		dev_warn(dev, "runtime PM put failed after probe: %d\n", rpm_ret);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index e3fe8d0af8be..6d330bd4eddb 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2559,9 +2559,7 @@ static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 				   CDC_WSA_SWR_CLK_EN_MASK, 0);
 		wsa_macro_mclk_enable(wsa, false);
 
-		ret = pm_runtime_put_autosuspend(wsa->dev);
-		if (ret < 0)
-			dev_warn(wsa->dev, "runtime PM put failed: %d\n", ret);
+		pm_runtime_put_autosuspend(wsa->dev);
 	}
 
 	return 0;
@@ -2833,9 +2831,7 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_rpm_put;
 
-	ret = pm_runtime_put_autosuspend(dev);
-	if (ret < 0)
-		dev_warn(dev, "runtime PM put failed after probe: %d\n", ret);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 err_rpm_put:
-- 
2.56.0.611.g1030f0b940-goog

