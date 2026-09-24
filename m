Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BDA49C4CA
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251762; cv=none; b=lOZKCdNeo3c82TADknUy/BVNmqtGKbE5RCK5Jj3RHA9j457vG1ito9hHybfwvFGqZmrbv29J+98+WolFQyp7Su/1GnsVE4njuvfkbmWdlHX51uOQVZzbXnlTZByLF7Tor3PhKVihANpDI0qdCcBtKpbj8dqv7ZADwPEm4P1XyDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251762; c=relaxed/simple;
	bh=+UM0Iz72EwmjnHaCMh960dF5RvV27yJ/jffRcq438PM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fUoNkAhX0CiuBF/p3TBvRh+flW9qeDIgVV15egJXjejYo2zqqY+ep3fcNvKXA8ehwemU72yzPu5lE4xlTmevtp4vUL2NWycrFEzFdPhCgJ3o76hEOk6FFwyMBsS2Xb0yiV5sqMwsc0OvJT2cudTp7WJm8/DGkMheTAr9DXGyaK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kNiF4GSt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUUj+wUf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kNiF4GSt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUUj+wUf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC5Bf01430342
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MevRHPZU6PeFsKVCB5vLjtUmc6J8ZAcrLv1nQ2mJKgs=; b=kNiF4GStAs+pUu4L
	pEq8YhqZCAkvCtftyGMc04snms2o8HpGuuhK4qaJcjPklFq9cLDnrwT+z8WvOTo0
	r2Y10IQrfdZOt14BO7QSNeFsCDU+LDUhpcOsFn9FN16Trqcs16zZ2RW03f/e63Rj
	fnwRD8BoFlKqTdoOW0Z6PG8HeKU8ssfuD20g4BEq4QTXOCuNpz6WTU169171RKXu
	8cYegTA4gWretinYnhQoyO0ocezUMc73sSqh5WWHX4GHkq5uBOWiLUOs+MHBg65h
	4Ovr4Ov8gh+7wuuHuXbzuE0T4tjdY1hQdw6WEaUhX3CzFmoYzArfBMeG1dCIvw/R
	/4UU/g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh9vqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:19 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c9ebae1b10so627264e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251758; x=1790856558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MevRHPZU6PeFsKVCB5vLjtUmc6J8ZAcrLv1nQ2mJKgs=;
        b=YUUj+wUf8Bx4ZkfR5fiNXRym/jvQ6ELKQ2oJ/S+I4LnWg4L15TrzN/qlODedVieKKu
         324cjLxz2x297gJgh3PdpC6akIyYJJnpbDeQdOY1uiCLOhTMpTKhgAFR4FE0kkkcI9vu
         L5rTvFXbP47wCiVKXpiqyRpk+H9woQcNT1m4NhsiJz0cpq7ahspvbkgx1/akcy4R0Hid
         ERtOiJlnyEPvqbQW92Hk2h867iBNqe5eDuzWUxrWQ7SitLITZOi+fpuXV4l6zFrUEADw
         i+YmXLgaX39lu5ycv4rAhS/30c5C7RPLQern6OmnmFHgvWvruVGvbkAGV5WU9GjJH5+P
         ZvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251758; x=1790856558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MevRHPZU6PeFsKVCB5vLjtUmc6J8ZAcrLv1nQ2mJKgs=;
        b=RKmCiYPgUPH1+AxK7FxXqF61ekt3RIb+LXIWDY5QnOwU1di2b/7kDOtSWIOeThK3zE
         0yYpgHCjh69uKnswP5fvsFPpw/GhjWYep/xUSOIx+0foF3mxFLSDU/nvBHuR1P4yEGwj
         ZjfaiLh8jWZs5gVF2/wZb0nDtM++OkNTL1gr9AWOH5vDmwfzQTtjHxmOCxmXNqhPpZeZ
         TDfBBjM0HLG2jLjZgFmnCAEXQ3ZS4G82kalAYXSjKcIO30O3+GGgq6SZBl+97JbvfJ4n
         A3v2oVm0BpXRhFQ4s3443ianPL1u5lip2gHp/F2B+EjH75luJCjMrcZ/NqiIQwAOvYNf
         zypQ==
X-Gm-Message-State: AFuF++kvRBTo6M0U31gPssRHsCnXzc0rNPpbW0ZRlGY1/Oo4qcFRu0tD
	zNRfSwIwVowWRfcyg3j5XQ7sxYQepOzPjAqfOx+fpU4ja61gr5m2pczQQ0cTJaWQ07yrtpQM2z9
	az55xLZ0m4qMX/YoURJe3Cn1Yu7CbPwPaOvcVYEstg9+ZUgevzWXPpudFXtEiqRXU/5hK
X-Gm-Gg: AYBFou0kCFjEVB7IjGKkNkxh72xJyHJ66qnCjBJad3YSKGwag4QhqKpwFBWE8T6H6L0
	S972iLvild1plcxM7uEoiB1Uu5aJIV+dInLwa4waibHj+Pin4P3E7UsyIp1ZIF4jH+VNxibrmkV
	Wfh/UAEtzCn8iNlqk9SG2eIHlYpoajkeX+dg2xVSkyFBL98mk7CgMqZREUoM4i3P+A9c1zxM6pL
	AutsgVXezICTxldonXyc7ppbD+jbCnHUzquysTDuRZMoM0Mr2/Ia/MhPIhqk0cFFgQUe10lIrBV
	ecByKGbOwNMdUA6332SXKLKxKsPP0M/QASZODA/U8MZzXXsZxCtAD8dgdGLjPgIL41aBd6zrHa5
	LqSEYwPln
X-Received: by 2002:a05:6102:5801:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-7af1c99cf51mr930685137.6.1790251757561;
        Thu, 24 Sep 2026 05:09:17 -0700 (PDT)
X-Received: by 2002:a05:6102:5801:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-7af1c99cf51mr930666137.6.1790251756901;
        Thu, 24 Sep 2026 05:09:16 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:56 +0300
Subject: [PATCH v2 44/48] clk: qcom: videocc-sa8775p: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-44-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+UM0Iz72EwmjnHaCMh960dF5RvV27yJ/jffRcq438PM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJs00KJnymJqUgjbfq3B9kSnPRA8ZXa8JR9y
 Z7kcCWUWj2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSbAAKCRAbX0TJAJUV
 Vn/fD/9WqZnc/DGIvl3QIZrDXWIMjJlDbe6zgSMfHWK5xhRsz1mpow0+rkSX7hqGD6XQVvjZENO
 uCwzHkCCe+4l2RciSvqM6Kl76wQc7w6fj/II9gjMuWelv22gz7eJpVg+553cuYsXl827n3sOReN
 WpzWEDsejgi2peuHv4W27Kbr9c1pAFz+VlbFhs1esYb/94tNYIVi0XOi9K1oNbFrkGZiRcQlY6t
 2Qm+/2rPiNxkitB7nP9VGg5G2PV1uJelPaJ/ddp7Qfvkc5y6Y8WaZ6EZktf+rcIbXuwLhxpItAI
 U75ERYXbMGql1GZBGOhEfyEIXAwQvVKWAg7Taax5OWC/tNvpLzknguCymz0aTYbuyhL+nHrBn+Z
 eaW2tPR8ANPgTeu9aZ82SiaQsLTORPFK0wOYZAZePnxMb2mIZgftfjrj4xqj4ntlbLzbuokAACw
 wXfbAHf8t2sLRNEqwDpDDtFRysLxT4SSPdYNZch4tRaBjJJyXsT0GyE8Z99YM3f0n02Z6PNpm/m
 sBVo95/DJahp1L1F/X34Y/ETtIQ/La+7T1U7TxOWBqhPymWbssEYJKeM/TD8EkSRIfQsXLUvzKA
 5NHHTmbUdCkbBfu243I47y+/DeQ11cOYCixd8yLNDcYnYB2BSrHkl/jZ/JM8eBd8VdH8Ivo3i6e
 KIuPKjcMoPU0FCA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab512ef cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=i-6CURGfGzB18q9V7KIA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: htaol8ADYE0l6wuAMtgNYO7RGZMKUxkf
X-Proofpoint-ORIG-GUID: htaol8ADYE0l6wuAMtgNYO7RGZMKUxkf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX5Ws/UybhTWFB
 0dq2TnmT2yXMevnMCc7+nu5PUjxMU1GsLP0uGa+krJ51yhqKI0LpEYWypQR0VHp1e8rohWYcgm7
 If/mwT8jytiEgxKZ72VTbhazdLHna44=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXxF4uRBHxJkUP
 rzGeTMHjQuiQyqS2w3M6i2MgTj5zi/p1dqmK+1rGr8OhhaqN1EFPy2SAUHzw4HyD84SC9+lgWGo
 +njcbNhjmxpUqlSvxrvdfpOZh2/eOlL/ariLqpx4vAuy9YurDGaIOszLy/dZ7Z6dkDl8uk5LvUF
 baypQBYR6Eq7DD0v/Tc88rWfIWNtpMSWMy6J1Na6g7tSAI5M3mbFhiCKK1+ulctPvL3oWPF+MPx
 FMg+6RL616d1g8EGtm2Jc7DBUZ4di2NSAthqnc6RWASRDj+0nkwkb8Sv3lbJ6jHdRk/ZP2tywCS
 1pVX0QXuY4RqbFDpc8ULSWL18M11NESH/05PQ/7JK3EDISPWoeWtpszAo5iJUDJh6TANeLPpWho
 61Il1SNb86ickpNFBusC/TCCCYYylLherMAcIrkjFZH4LY/GgnemX6mLn42cTTUP/bi4wChG7hx
 uWT+/x/grnT1XvTKKRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/videocc-sa8775p.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sa8775p.c b/drivers/clk/qcom/videocc-sa8775p.c
index 65a2d5bafea6..2ca78af8c20c 100644
--- a/drivers/clk/qcom/videocc-sa8775p.c
+++ b/drivers/clk/qcom/videocc-sa8775p.c
@@ -511,7 +511,19 @@ static const struct regmap_config video_cc_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 video_cc_sa8775p_critical_cbcrs[] = {
+	0x80ec, /* VIDEO_CC_AHB_CLK */
+	0x8144, /* VIDEO_CC_SLEEP_CLK */
+	0x8128, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data video_cc_sa8775p_driver_data = {
+	.clk_cbcrs = video_cc_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sa8775p_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc video_cc_sa8775p_desc = {
+	.driver_data = &video_cc_sa8775p_driver_data,
 	.config = &video_cc_sa8775p_regmap_config,
 	.clks = video_cc_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sa8775p_clocks),
@@ -557,11 +569,6 @@ static int video_cc_sa8775p_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-videocc"))
 		regmap_write(regmap, video_cc_mvs0c_div2_div_clk_src.reg, 2);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x80ec); /* VIDEO_CC_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x8144); /* VIDEO_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0x8128); /* VIDEO_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sa8775p_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

