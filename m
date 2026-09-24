Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912B449B5DF
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251759; cv=none; b=cd7M17S4Fn2PL9jzu2fsAK/ar8E/GXHPXZrH/rV7Z6m3sZt4F/jzxIRLS842ygvF7UmOHUkddSHmEq6UY/igOSvcOiKq2kRRDmI5wvGJ5S085yVp4+QbjMGQjwLJK9TSjbeKOwRUFXaFAjJ0ion741q1x2Z54UYH3ZcFG8UPYSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251759; c=relaxed/simple;
	bh=Ur9XMo8/WNsqyrpM/jASCNCoKeitv6aKZHCBTi8YLvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/NKMMEuXWTzhWmwR1Cu7GOPyD9pVLSveLxT/J7YvyuT4D9hlbnc7r7OP3yET9iuqFPQW6VHajUvBa/cE+7uECwVznSNyet2KR8XpV8dpEmxL5LPZaPUlsbUQdEYzLU9PrKHAoRaZ5OVgCq1eqzAChvZ3K/IJYVkIGWJS6JjFKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FmFzFtmP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fo05IBzk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FmFzFtmP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fo05IBzk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4UTh3282819
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ublmzr0ZA26jmxEwj6p7kovHMeaRLc8XdUhY8Td12pM=; b=FmFzFtmPGKMLdObj
	SMKAf/R143wIpdvRc9ZVsedb8gnz3FVa5AfqJJiqLj0Dr3jNt7XWDFXGgxvRz4Mi
	uJ16omqoO/WYQWOvDyVAc2T3VDvxqVTPM4WZtoUboqEFmjJxL6yEUO0F9dvVX60/
	1xtFuy1ZWHYOBGrUMKEa/bBDQA7pL/ORCpvX/zH1DgNQ330OIjt4rYZXV69tk1IB
	vyu/PPrrSJZF4EPHE+ZQVOE/ZQizur4QohsimTp6z6fOu5MJgF2x38f7+FjIBrJy
	0CqXR+8Ych8LR+mx/eLFTrlFpjRWVhQtdHjuaG4/9sV1QqyC+9+r2AkqLvTiWib4
	xI+1HQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstujfyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:16 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7ac2663eba2so1495550137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251756; x=1790856556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ublmzr0ZA26jmxEwj6p7kovHMeaRLc8XdUhY8Td12pM=;
        b=fo05IBzkYvr7UIo+bW4Y50rbLnBGXeBCtQ539g5PasL7s8U2yy53ZCfkQS9dcDxRtz
         hgaH1FMQVYZA6WNKJveEWi1PJUyo5NIoDDcSJikEPtOdoGmP/DDlgk0lclBLc0+ZItXp
         xAdO8S6QGWyH/WVkerTlsCxFkvgPDgmlZNcd0rrV3YJIqOUc9+uzCfZRiQqu6/rydIQj
         HczHzI5vPIAq/FgsZLciIpT/JfGyVqABCcld4BpU6vlnGmZKb0nVIL0/q7RtP+Uw1CN3
         IqWJk+dzF1borUiOKSApbB81c2I6xhaARi+DdH66a7wOhrDga0hBJ2nxmYYQW9XOHma3
         x4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251756; x=1790856556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ublmzr0ZA26jmxEwj6p7kovHMeaRLc8XdUhY8Td12pM=;
        b=C4ka8FMmdEL7KghHIazjMPe9KAigel2Cdn7YIvRu6HlTYBAgCgCnaNBtOR4B1phSW7
         YJkNCD4b8Dm6+3w3N5+xDQLCzh25cyu8mSnJLgAsFhFxU7dX3alvc57AMM+pw3pDwGMP
         SH30xF4F85C4gUeNaY1UltAR6N2ij8VQHIMcnlwH6E8z4e6ZdRNmDXKK2HpcUp4SXjcm
         rHLPSFrqb38C06FMiMV9FLZ0OymO21I+jaLw5EvxBw4lk0kDP7ZMhuMObdWZ1AETDsi5
         AktUJlxjsEHtW2XtsntcFELKPeB7QmC1MK81IQaSghkZvOBGMAgDylBqQjop2429vLoQ
         0VhQ==
X-Gm-Message-State: AFuF++kzu+92QW/HFz3Ffe71ejoSXU5zF07e4AEOmyNmWz2Ur2CPZT5X
	A3BVKF8rdsCSpawtchrfXhV355aZ214aVM/e67RafCYY1UAvPLhiOhNrIMpute0vZkWocCJF22Z
	5dPLz8oUndMAIO7kVQcEMSvdeLswdngBBz5kI+FtEtPMbaV4XTyokzvKUxfB6sMBVKZfS
X-Gm-Gg: AYBFou04Bx4BuzNdTQsy5RMgiR2mXeqWJXS7vI6HcdBAzeiInGW9o6JvzPcExeePA23
	MMX0md0vIaaRPbvYc/7ra/midRl/xdMBtZ9H9bwHQ5c7IUjiEHGnyDn1qufRPOLFaFdlt2wMGkd
	d7V7j1IcNWGnHr7j0IF3EJxBVTqM8LAafFMwBqS0Ty38zltcOcrNdLy9r1oA8TOhSlnSAV+g6Kz
	XhTDhX3GsHwUR0OpM7vpLAD/4v3zPHgoPsZb/CVccIgGh7HfKReGj1m0hE2NBhcRh/4CAKF1lqi
	IQcp1aOYwyuCWCOJ1EBM3NAC9EEgQiJigjRRyqjvPnTNmOoe6saicow0hLj8Eagk4ZWYfsEeMkf
	b5xe6fFlU
X-Received: by 2002:a05:6102:8647:20b0:7af:7e52:c7cc with SMTP id ada2fe7eead31-7af7e52cef0mr403114137.34.1790251755523;
        Thu, 24 Sep 2026 05:09:15 -0700 (PDT)
X-Received: by 2002:a05:6102:8647:20b0:7af:7e52:c7cc with SMTP id ada2fe7eead31-7af7e52cef0mr403099137.34.1790251754946;
        Thu, 24 Sep 2026 05:09:14 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:55 +0300
Subject: [PATCH v2 43/48] clk: qcom: lpasscorecc-sc7180: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-43-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2598;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ur9XMo8/WNsqyrpM/jASCNCoKeitv6aKZHCBTi8YLvU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJrThymT6e0LgYFngocqyzSCyAxLkjvP7ec4
 YqG0tsLAgeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSawAKCRAbX0TJAJUV
 Vgk0D/4v4cL3cgN+frv1v1B6nuwbjXJfmjDb3QOvH+8XJ3pV8yI+wLLGVwzidmiYDYggshSuLMa
 NXkq0X2sRH7P3NCr+VOg7DcwyNx3sPgkMAJN3Q7Ugj9PEVvb4N0KfHuhg+Qp5F1TVvkJvfrk/jw
 S9SjhaCjm//TAnGO3GuRC5/gVIhEfXAzFRVYX0VyqUADufJH2alCrwsWuPRlsWkmoifwi5jqNKO
 djdLeyRAN9kWiZw3g7jsyBsOHwZ+/nbYAsKCI+6WjubskYWsnbTiW6pJ6PbSKID2UMN6eFtCfA3
 HaF15w6gGDInsXe4BKmf99P77S67uUWqRBG9xbmnT0d/+n6ooiQ4MzM8OuVA5LP8NVPiHj6g4qi
 3nWt5mldze8tngE/N89Lx/J3bN83a+4TYHoTS4IV+19wKeKYJ31p5cvXIB7AISyKXFqiU+aWuP1
 axw7YiOkttBRmHy5WD/T40uXeMf88uQd85C7bfrxkvQ9L6ypII57KdJdZa5CHD/5J5H0PEYN8bZ
 CXgaGHBYcmKS5sW3DV7gtMh2uW+hUiq6STSMGH9KaTf1MlyHVzYhxTinC39d5QinMUMCG0P6+Bk
 GWuP52A6cm5gEBWqs+Jm77+fuNiXKQ4+tzaSfh2vXWQH9xv2957JUEcOMQdwlodYXJuEGIGjKb/
 yqDYk5/7EDt04sw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX/AfkA0KqzK06
 pGN4ZXveb0Ttx2QzPbPL//4NtpDkc0jV1nwwer/my3mAsVXbl29JmWMAbxMA3ogCAw/qso4L41R
 dkzSYwS7/YEIhBOUB2iaCP/NL5/RzN0=
X-Proofpoint-ORIG-GUID: JYpwSN62Rsxbe8e6d-5-HxuNq69cj3Ka
X-Proofpoint-GUID: JYpwSN62Rsxbe8e6d-5-HxuNq69cj3Ka
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXyXdDeJZlPwUR
 xHK2A2uJlevZwxyEim4lGbZPEtCxIvF00RT9QIAgTFKrsFhYgrx0ULCgv29tPWwA/YkXWWU5JKx
 WAJk1Gnffl0yjv1h5oGlB5L2GP9sNSXh6SUWqG7UEFH6lUjAOnoro2Vh1Glsd5IK4WOUZnZ8Hnb
 dHpcuxbAtK0OUcKKfi0+DSV3j9H7UnQfqHYpbJe3zwrP5EkyHzzEC26K090EMQT2q1KfMp+PXF4
 KsPWpxFBa1WJabbKlW2y11s8zUn13RWg1uMvRRDNTSjLJ85PC8DzTl70KDv8eCxN5vFszuVZcZX
 2MOpBY72kAMvs6o5T1t7263vAmXy6fRzjJ5qyhrocS2blUj8YvIiwi5HzgdJd4IONo5LPQC2L66
 JRevk2tBCKzf3NIXMeiqqvanOjka27bGDEVfxtJFR6fZpYc4NkMxaSlQh/INerxBUr0QNZbxshn
 32Y8z6rtmlKAExgmDDw==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab512ec cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6y-cbsPRrUJUYPj_W9gA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Move the PLL register setup into the clk_regs_configure callback so it
still follows the SYSNOC branch enable. Attach this data only to the
LPASS core clock controller descriptor.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/lpasscorecc-sc7180.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 5174bd3dcdc5..af28da5f04b3 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -343,7 +343,28 @@ static const struct qcom_cc_desc lpass_core_hm_sc7180_desc = {
 	.num_gdscs = ARRAY_SIZE(lpass_core_hm_sc7180_gdscs),
 };
 
+static const u32 lpass_core_cc_sc7180_critical_cbcrs[] = {
+	0x24000, /* LPASS_AUDIO_CORE_SYSNOC_SWAY_CORE_CLK */
+};
+
+static void lpass_core_cc_sc7180_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* PLL settings */
+	regmap_write(regmap, 0x1008, 0x20);
+	regmap_update_bits(regmap, 0x1014, BIT(0), BIT(0));
+
+	clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
+			      &lpass_lpaaudio_dig_pll_config);
+}
+
+static const struct qcom_cc_driver_data lpass_core_cc_sc7180_driver_data = {
+	.clk_cbcrs = lpass_core_cc_sc7180_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(lpass_core_cc_sc7180_critical_cbcrs),
+	.clk_regs_configure = lpass_core_cc_sc7180_regs_configure,
+};
+
 static const struct qcom_cc_desc lpass_core_cc_sc7180_desc = {
+	.driver_data = &lpass_core_cc_sc7180_driver_data,
 	.config = &lpass_core_cc_sc7180_regmap_config,
 	.clks = lpass_core_cc_sc7180_clocks,
 	.num_clks = ARRAY_SIZE(lpass_core_cc_sc7180_clocks),
@@ -400,16 +421,6 @@ static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
 		goto exit;
 	}
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x24000); /* LPASS_AUDIO_CORE_SYSNOC_SWAY_CORE_CLK */
-
-	/* PLL settings */
-	regmap_write(regmap, 0x1008, 0x20);
-	regmap_update_bits(regmap, 0x1014, BIT(0), BIT(0));
-
-	clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
-				&lpass_lpaaudio_dig_pll_config);
-
 	ret = qcom_cc_really_probe(&pdev->dev, &lpass_core_cc_sc7180_desc, regmap);
 
 exit:

-- 
2.54.0

