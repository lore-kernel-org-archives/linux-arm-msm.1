Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1FF483BF9
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251670; cv=none; b=ppnHqTjyINrgOFssb9piuavYouGiS9EMFI/iWxmUx1dP9/sjAkBiSltx4ZQUD3rI0euYuEhn9mnMY9q57NXlMeSdWFxa/Bop0bXK+Ly4RAUbavwLWiPcBzgFMg3EJsaZ0JhvQZoKAcwQDyEA6pDXFlOQUjV4wS9dYAVL3n4970U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251670; c=relaxed/simple;
	bh=4qZgZvfQ1UVNLqQ1DQ+DesEZn6jUeXUBklv9SGrgPXk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jwGqAKhoHD2dxI+vjNR8KwiMEyMz9jVsKbYh34wao+iGAa4OAaz4us/M00/ljodtzJzmFQpelDY6hp+TEAWuTgNrX5PRG/OHWITQ8MgrXRHC5SyRuLJbHdwybqltvHikKeAIPxCO5UrFd41cn1ovHwoipA86bHcLP9FKmyZ1PKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fu4QGQdL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dfilKwrl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fu4QGQdL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dfilKwrl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4ZnV2594179
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OWnd8o6a3F8+dW3ewYtgcqbzJQnTNjuMNsusaTfXk/k=; b=Fu4QGQdLCX2euCKA
	BxIB2CCbFsHudmBqbEBgVifCPBa/1J2FWhMXwKqVmPSoTe1HMLC6/myH+fz4RAp2
	q+iHl0KJTgz+3UsQ407IrsptzQ0qJ6qqcbGxcN605iZ73YUbDOU9AnwhfwNGVm41
	02pnRetRtNhM1W3nLN8gfD8iqu6NxfSGudMpzFyeg5BcYClk6Epcq997j6nV3uWf
	clrK+7VaVggax5F9KJHaAkLtQcIx7YG3eNjztHHPUAV7gxmJQuy8RLEVDVeRVl4C
	xcxtw0xGkhsADXdq+rBd90kJr3giqlv3HrEMWMg2j31pzX4mrNlojG9OX+6pLy1J
	4q3eYw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjge7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:45 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a9378b844dso599677137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251665; x=1790856465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWnd8o6a3F8+dW3ewYtgcqbzJQnTNjuMNsusaTfXk/k=;
        b=dfilKwrl7GCy5iviiSYJuBOysx/VCtQvwaL53ydOSyIwiO8mc2gHgZ3/gv2cRrMSPy
         wtzazvJGqOttDCOoq7iS6HlHesf41QilfRAe8ZcH9C6mZ/oSXpyzUW17TG+6IzPKLyCP
         zncxzG2n+8ZQe7iHRwCZT3OvSGdlfiVytiITQEL10bg4fVp9Mf56ZfVP8NylLPBSd+1s
         Udh4PFTS3fgzqEvjFar3PaIcKODwLQPlFA2do2Z7yU4DqNcUQX1HFyenvyEoKfChwI8b
         aNv/xA0QMpjKxLxWXQbEnqkTg7JwvmpyvFpDbiaSbVBuB0ejSM/h1kYZGYe6QzSZY6Sj
         Eh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251665; x=1790856465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWnd8o6a3F8+dW3ewYtgcqbzJQnTNjuMNsusaTfXk/k=;
        b=odWNunBMTryGgAwooTay5RxbtFSylmLlCnNZrpowijpaT2ItopUTZOTiemOiFqQ1pR
         Sw5YJyXn+Ww1Eb7/QZqvLRItLP04eUkfALt3EXnIu+epuTLAgImMnvNulOUd6+MyxMb2
         3kXc6n5kZxip61du9i2jjwFIBpwNMSngQa/uVW6CiXOJjzHW2XddEPYRnqw3Of9Pkuw9
         uzXy67Bn40/UawUjc6HGIsR8PEJYOdWqdBBEqx6hYMHoiMH5TAy1DsOudCzBjZARobf9
         ihCO0VhD3GKZimtGqpWFwMUX0ZgcLNobCfE2XJgW2eimnjJKsQukD+u6qlBmRTI2dGP6
         r8Jw==
X-Gm-Message-State: AFuF++lq70OB5B05xF3SvaU785+eObOkN/pInXOqqtfqkWH91AaZiAXo
	O+S3zdR1k3eE29O2l1jnEfdNUTW7znNSgb4tp7l2Gza2VsBoovDwRn225AhtAe+1icYujOVSl1N
	/vRjcOZ8QYMKmL9mVIT2Mh9x9BM6gDx6Q4Cpi/tl/E072AP4uwKnmiECkP/FahcpcAQAw
X-Gm-Gg: AYBFou3iUhr0CsdbGvn0hsSkDppHsmxjG9a0WF4c303u6UJuYTBiGLgRTtGiBdipYXk
	NKzAimO2X1dU8VN3Or991lgMdh4F/CkhcJ4mBSB/sOYIr1Utgpqpnc6ayaE8Ururnf9NtoUXJ5a
	kmnJv7f1veuYV/YgosUkIRzrshdSdxoZT9yOmYMcGnu3Znq7YbYrWpFCSiA4tlqu2QGwBsRt+Rm
	SyVECUhSIB+AzEhTJo6lVqEhd2shVY7LnQKE1Oh/qRUjddCZzbZQel/BD7aqeEteXyzmBK1jAjt
	f2i+Q1bqPNOo9R2IwVO39YAiQ/czU8HO0Ec8Wah/1/ylO4LQfDnnyAEQOjdOxnOxG7jFTmQpMen
	2ATbf97KW
X-Received: by 2002:a05:6102:41a9:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7af1e4f6363mr992992137.17.1790251664998;
        Thu, 24 Sep 2026 05:07:44 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7af1e4f6363mr992978137.17.1790251664460;
        Thu, 24 Sep 2026 05:07:44 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:23 +0300
Subject: [PATCH v2 11/48] clk: qcom: dispcc-sm8550: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-11-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=4qZgZvfQ1UVNLqQ1DQ+DesEZn6jUeXUBklv9SGrgPXk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJMQcDPMs9FBoowBl/FRyf6SnT/oHvfXI1Wo
 VTPiF1JKGuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSTAAKCRAbX0TJAJUV
 VrYIEACwW0+Rrz1sX0qpkjBslo782/gpdPx8+JiFBriFNAboypzZQWguW34vKJzoyQ2ACbSNHkj
 TKC3h8aY8ece55kbba5L+69wBSu4TRtQYiScX263SECpCingz+apxwFyg2Ic5LUIlP9GWTww7do
 VtqUc0+hpu2gWtaqz5LkiiCj95XlNRR9N4ixurvMxvzwpaU1WpylWLtdTBkmbdiJkGgXZgTBo5/
 gnChPKpMyKVbXFr2alg2dwloV+GPNs3XSucrs5ZqNYVqsCrg7RscD1D1TbyvgfDf41vH72x7REs
 fkh4rQr6PC9Ajj+yRrydvWa0g0wMCzlCDN0da040lk+/CFfbWOmk6F1UL7yYaDQIiZ4ELTGs4Ej
 yMQ/wVDeqCKTZL1XqcsBrCKW/JVaaTK9MbXAxCdPnqQB+0JtYjitXAbh4IeVSkua/TBs//NG8Wy
 l22Hb6+llzxqVUZa7DfT3Z0YSZ7jkMLMcgzvUukF/gJ/K1PBnmSMzQpNjBV9iko7udH2XpoNhlc
 pB8vukuOOnTgz8fcJtns57I8I3M9AfjLOxE/2Lu1ttxC69aR2hjth63G0ztXcE3aFu4aNk+WhyI
 2DOy+YZTZ/rVuJj19leSmaJR9t1S8V5wChNNuTtfx/HUT8W2SgzovqagV2B7sZmKMNkVskqfMn8
 65xqD6pVed1lOYQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: ywwXRFmB4xJF_ZC31hFl0Yk8Xgqi-mnc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX40IseakFH4u8
 yT40nfXQbzYPv9kTkCVblkJNHKQde5vkJ/aKxsdw9qWUdwAlOpdm6ww034S4m6/viO83E4gDWNK
 WEar8DjEI4WRi37dWsslf3Z8H4a1BZr/Wai/xaJSvyUxtGxtB/SZxIQRsQ6lGussU2kRD+61Poc
 v7U3BjGCrTNNSPsBXdoLljsMWW8La18N73iDB2Ya0en5low4gi3R6xinLs0qhRHAdHcc8Yver7w
 xXuQ1wXUmbRo04oI35bnt5lOhUCLjE8+R91cb2H3E0TE3pJcXePiktu81aFprLiCAr4jDRgJlE4
 j2swxRXyoRby0wtxAB/2tQ1WVONHgwWAXsMX8U6A/O/0PmWd8dtsK31XPFu3y2QjBnvTj+PtEyP
 hprDpI+W69rcSzza3sOqjOzH//CM43me1sbNspD/PqcSV85t7zuFuCvWxqGUkx5Wo1IDHGmQ7h9
 F+uPOllI+pXPPi3cRVQ==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab51291 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Mkos_PfpLiWYs3bmBbQA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: ywwXRFmB4xJF_ZC31hFl0Yk8Xgqi-mnc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX2L29Q8KUpy4N
 xKY6LWF8aECLmI4L2+dZ6B76OStPsxDncsu82vksrq2fGBJj5SK+SX5/Dm3FQs0OKx8K+T1LLOf
 vnJ9RbfytrYffQlPaCJTosJyaCnBIKk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm8550.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 418dcea20f00..030fc7ef1fbf 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -1744,7 +1744,17 @@ static const struct regmap_config disp_cc_sm8550_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sm8550_critical_cbcrs[] = {
+	0xe054, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm8550_driver_data = {
+	.clk_cbcrs = disp_cc_sm8550_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm8550_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm8550_desc = {
+	.driver_data = &disp_cc_sm8550_driver_data,
 	.config = &disp_cc_sm8550_regmap_config,
 	.clks = disp_cc_sm8550_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm8550_clocks),
@@ -1800,9 +1810,6 @@ static int disp_cc_sm8550_probe(struct platform_device *pdev)
 	/* Enable clock gating for MDP clocks */
 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xe054); /* DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_sm8550_desc, regmap);
 	if (ret)
 		goto err_put_rpm;

-- 
2.54.0

