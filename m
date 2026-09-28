Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F8647729B
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591576; cv=none; b=GP7Xs0SVbGhcD0AYw+QKssUh5y9mH8cJhmLy+ZfIJ7iMyBYIxMClvp+I3gr6QBTe7tPz/uJauM3av79VAC4ttw2/MYq6ZcT8Zbyc0ezdhJUriTCiWtU9d/9PYygd6h/DMHgPDeummj0U4a7xB7JZHeYKb9IwtQrob60C6FzJMGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591576; c=relaxed/simple;
	bh=kPn6Dg0bdnYkwCA+6ezajILIS03WVEUaTY+v05K4hXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pE+W15UiY3I4lktohcZ9FK/KnCms3qBVcGz1HNGG4qgMFhi0d7Nsi/IULabakxiTng0PHJYvkYrb1Anpm13aEqmerPkv1skCINzDbOvYUqB1B6j3Zj/bysYxKU972V5Xhkr+XmNxUn5BGAOqGXXn41ol2CYYY0K5exf4aaIrtnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQxAnjX5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gpGvgBro; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQxAnjX5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gpGvgBro"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MFAT1195815
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	btJXwtvrlKSFwnalBRzKZ+u43uNhdzBt0gD3LXAU9eg=; b=NQxAnjX54lWAg1vc
	UXBDSXM0R64YdEj66BuefrKeSD5GW4xWk11zf3gDdLxqccDUtIMjsOVuldvE+tGt
	sS8cyTWoUnqkcQTXp+cf2Xi6YRXZFx1BFNAph1UCiSampV0E/8lPKiMA3HegG9+h
	v6dYUvK9fNyXSRoVA15wJC7Zc94ghotpKJWlx2/5bqhycyOn61aAXL469TvF/wHy
	5aa5xT1hI6gMLjSqluw8KJTcaWqcBZPxbGi/oRHQnaWYggNwiYnnxrKNWLMmFumx
	CS9YmxK+ESZxNKiqEJO/fbB3BAMwJqrUf3PG1HU1bXfwIzIydhKTL+5wuWxcBxbY
	U3/qdw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s140k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:32:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a0bce9739bso4032118a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790591571; x=1791196371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btJXwtvrlKSFwnalBRzKZ+u43uNhdzBt0gD3LXAU9eg=;
        b=gpGvgBroigtWciRS2XcsPv7mSgn3FdAFMnXpUotpWdJZOr4RhG7vPKP1RF3STPzOt2
         gpUiaddwG1Cpnj9SFhZHMKF3jYOIamUOSD/4kwdhh7d8UAAiMli8l0U5jjK4apGKdfRv
         dR8eYprXQB/XJ6FpUm7eF2DtuX1gzM/BDd76l9HvdMRwn/3wwi0Zej6n63/LJTaYKPp9
         PRYBV6rZde11fXDBmTpXvh/Vn0PAFyIs5Qx/eQWg8Auq3XBbEBVHyfPnxvIcr0D0Cz/F
         GVr6Ct14uHeO0Mry8mPzX7Fy7sc2/BhTJqntQLRSUvSnd7mmKcPK7c3UKzY6f1yIByIz
         fS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591571; x=1791196371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btJXwtvrlKSFwnalBRzKZ+u43uNhdzBt0gD3LXAU9eg=;
        b=1JaY3AbQdqezm5NAnq6fim4YhiYTSxP1nKMibF6iL+TZ9oSMSx6vSygxode3ieNInE
         zwQwkwza8y0BwjVxXD8N6CPaUAHc+oFnCGZU+GLNe88qztsRV7+QHc/jz6S07xw8weio
         GWNO6+QtkPiFmsnT1uQ5zqWw+FitIyvlwYWd08UZA9jLGa5bCpklv73IbbLHwBr2rHmF
         pGT2CPWV8Bpz9MFWxw3/t6uJlQVwQyXPkOm4rCtcKMzVreGHYfQ1TNyWh9DcBGWWhcHa
         QWyrPmyCVb0GJ5Bftl2GpMefV53wKKDFkg4X9EuAnk2CDnosgY/f07HvBUaJYPdnfVW3
         5v2Q==
X-Forwarded-Encrypted: i=1; AKwUvByrJ6D1wpqhaKVnrCAwyjCdlrY918JFlAtePPyodgeYS8QESyHlq55nwDYahRltVnHZJh444N/7AfCFQKcy@vger.kernel.org
X-Gm-Message-State: AFq9FYKvWYg7AOtZHqHeEfl4VV9VVUwjmUsncbbUKK5IrBsP4hbnC4+Z
	Fw98LAsSkATAOKN5TX7N7YH2zIxWp4eh6rE7e14DwrgaJ77FI4UC6pV9010EoIlnZZ8sPqBseq1
	FWtHoTrf/ASLPcK1JONJqpnwfvn0lptkMYS+3V3MQkZ0HCyN8RgbJJc6i0c9uc/QOGZlS
X-Gm-Gg: AYBFou0Sf9ZCgSJ1Ufu0gyUThIXmGObbZ78cYNCyIR4unKQkViEOp2IxaDIfEVQbq5E
	2IbVAG6RlVHEBl4oLnVFeN2nd6cApBKddZb8+ckd0GfRj/8fmkDxDRvtoUpTNAKxAPS5zcsG02e
	hzl5eGhweOOJYexdHfRiV7jUp/EbeWMjxCV/kzxKr0ExrHJ1ma8SIh/NEsbSysc2M2ZrrUk7O3g
	e/7IOR8mIiDjvYg+maesO0j5Y7X8BfpXSgmrwzlqF+OXFqS2GOj2jo/xki/EJnet1JegUeNkBMZ
	MAy2XR6qAaTFClmgvrKkfaoaNpIWH6T/wHkpDkIzmND97xiWNMAsvRQf0fceOz8TO8iGVC6xa9a
	DVjaOvnuZeAlitdQni32MvDWoRmQ=
X-Received: by 2002:a17:90b:264d:b0:3a0:3673:dbc0 with SMTP id 98e67ed59e1d1-3a0bb6325cemr7283003a91.49.1790591571003;
        Mon, 28 Sep 2026 03:32:51 -0700 (PDT)
X-Received: by 2002:a17:90b:264d:b0:3a0:3673:dbc0 with SMTP id 98e67ed59e1d1-3a0bb6325cemr7282990a91.49.1790591570467;
        Mon, 28 Sep 2026 03:32:50 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efaeb3sm19885131a91.2.2026.09.28.03.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:32:50 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 16:02:22 +0530
Subject: [PATCH 4/5] ASoC: codecs: lpass-wsa-macro: manage clocks in
 runtime PM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-xo-sd-runtimepm-v1-final-v1-4-e3ebade3aeb7@oss.qualcomm.com>
References: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
In-Reply-To: <20260928-xo-sd-runtimepm-v1-final-v1-0-e3ebade3aeb7@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX5v2iCOeFL65A
 rLvtgz4bE1BpW8/42YO0ZGQZVIl10hMNBzlbQ0QC54/hP3K5G7gWA3zf09xvQZOClmNPGd9QB0g
 8f96ZyBa575VDl51hz2cKN2nt9vMfb6tVxUkxR/yEJYxOLGXfQio3ZXdolPuSNqKdGlFosdMovQ
 tICoeHMK0AYKwp6oIfkYsMxin87fTABSQI8IyD74/K9GB7zCQrqh2b4kvyYwkRgWc6OYUk4kFY/
 VZRbAf9N6qoOaGqdjOvC7itnc99bVw47xQ9bW5sb/Qo8leoehwi8vuVNv/p5fmky80RwKQjg0+8
 Y/QX9jF7wvWcdcVT23SkMi4fmi7eNB59OuYzLdmjxL/Zev0qhzTZz3SUsivyqM2SzkuLuPbVejE
 n+AmcOo5A6claR05Qn7YUtK4uOaUtaQTa57qC0qcipSU+quUdoWnokOyFTJgkJnWoOO5478jX/2
 vdch/yCmjChZ5s9UiOg==
X-Proofpoint-ORIG-GUID: i13K0RcVyUeROQnY-N5u7XdFrUUFX88Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX5vzpA7b1MtI1
 MfjsiK3nzlAmiMXPspRC4cUAjAQfPJr+iHKTjCqPC59tX7xlcNQZnJg8J7LoCQBMGfpLWp2yJmJ
 eULMpvyHFzGeHoHh7OyRsFHdCZf0rAU=
X-Proofpoint-GUID: i13K0RcVyUeROQnY-N5u7XdFrUUFX88Z
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba4253 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=0aw6pvlUo1gSDbX1wFsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280041

Replace PM clock framework usage with explicit clock prepare/enable and
disable/unprepare operations from runtime PM callbacks. This keeps the WSA
macro clock prepare state tied to the runtime PM active state, so idle
suspend can release parent clock votes.

Use DEFINE_RUNTIME_DEV_PM_OPS() so system suspend forces the same runtime
suspend path for an active device.

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-wsa-macro.c | 80 +++++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 4242366601a5..bc0ff467c822 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -12,7 +12,6 @@
 #include <linux/clk-provider.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <linux/pm_clock.h>
 #include <linux/pm_runtime.h>
 #include <linux/of_platform.h>
 #include <sound/tlv.h>
@@ -424,6 +423,53 @@ struct wsa_macro {
 };
 #define to_wsa_macro(_hw) container_of(_hw, struct wsa_macro, hw)
 
+static void wsa_macro_disable_clocks(struct wsa_macro *wsa)
+{
+	clk_disable_unprepare(wsa->fsgen);
+	clk_disable_unprepare(wsa->npl);
+	clk_disable_unprepare(wsa->mclk);
+	clk_disable_unprepare(wsa->dcodec);
+	clk_disable_unprepare(wsa->macro);
+}
+
+static int wsa_macro_enable_clocks(struct wsa_macro *wsa)
+{
+	int ret;
+
+	ret = clk_prepare_enable(wsa->macro);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(wsa->dcodec);
+	if (ret)
+		goto err_dcodec;
+
+	ret = clk_prepare_enable(wsa->mclk);
+	if (ret)
+		goto err_mclk;
+
+	ret = clk_prepare_enable(wsa->npl);
+	if (ret)
+		goto err_npl;
+
+	ret = clk_prepare_enable(wsa->fsgen);
+	if (ret)
+		goto err_fsgen;
+
+	return 0;
+
+err_fsgen:
+	clk_disable_unprepare(wsa->npl);
+err_npl:
+	clk_disable_unprepare(wsa->mclk);
+err_mclk:
+	clk_disable_unprepare(wsa->dcodec);
+err_dcodec:
+	clk_disable_unprepare(wsa->macro);
+
+	return ret;
+}
+
 static const struct wsa_reg_layout wsa_codec_v2_1 = {
 	.rx_intx_1_mix_inp0_sel_mask		= GENMASK(2, 0),
 	.rx_intx_1_mix_inp1_sel_mask		= GENMASK(5, 3),
@@ -2791,14 +2837,6 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_pm_clk_create(dev);
-	if (ret)
-		return ret;
-
-	ret = of_pm_clk_add_clks(dev);
-	if (ret < 0)
-		return ret;
-
 	pm_runtime_set_autosuspend_delay(dev, 100);
 	pm_runtime_use_autosuspend(dev);
 	ret = devm_pm_runtime_enable(dev);
@@ -2844,16 +2882,9 @@ static int wsa_macro_probe(struct platform_device *pdev)
 static int wsa_macro_runtime_suspend(struct device *dev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
-	int ret;
 
 	regcache_cache_only(wsa->regmap, true);
-
-	ret = pm_clk_suspend(dev);
-	if (ret) {
-		regcache_cache_only(wsa->regmap, false);
-		return ret;
-	}
-
+	wsa_macro_disable_clocks(wsa);
 	regcache_mark_dirty(wsa->regmap);
 
 	return 0;
@@ -2862,9 +2893,9 @@ static int wsa_macro_runtime_suspend(struct device *dev)
 static int wsa_macro_runtime_resume(struct device *dev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
-	int ret, sret;
+	int ret;
 
-	ret = pm_clk_resume(dev);
+	ret = wsa_macro_enable_clocks(wsa);
 	if (ret) {
 		regcache_cache_only(wsa->regmap, true);
 		regcache_mark_dirty(wsa->regmap);
@@ -2876,20 +2907,15 @@ static int wsa_macro_runtime_resume(struct device *dev)
 	if (ret) {
 		regcache_cache_only(wsa->regmap, true);
 		regcache_mark_dirty(wsa->regmap);
-		sret = pm_clk_suspend(dev);
-		if (sret)
-			dev_err(dev,
-				"failed to suspend clocks after regcache sync failure: %d\n",
-				sret);
+		wsa_macro_disable_clocks(wsa);
 		return ret;
 	}
 
 	return 0;
 }
 
-static const struct dev_pm_ops wsa_macro_pm_ops = {
-	RUNTIME_PM_OPS(wsa_macro_runtime_suspend, wsa_macro_runtime_resume, NULL)
-};
+static DEFINE_RUNTIME_DEV_PM_OPS(wsa_macro_pm_ops, wsa_macro_runtime_suspend,
+				 wsa_macro_runtime_resume, NULL);
 
 static const struct of_device_id wsa_macro_dt_match[] = {
 	{

-- 
2.34.1

