Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAB848643D
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251689; cv=none; b=bFQTu5FA4iGgNbdvV/R4uRz8RAFasaS6ByLjErGGY93cp9pz+AgmFGzA7aaK41UofuWCX74OThvZayxWJWVuNs62QRqNuqolvr3sGk8iYSj8ckQsG3YRFfSlRfKVUbFGsuAZlc8WwUBBgRmKuMho2utI8a2vPMS5Mx3Fb8Mo0NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251689; c=relaxed/simple;
	bh=2vywdcT8KOy7PEWrQfNdsIA4czQkQ1OxXcYuKXe3UwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pUrk3V6O+tdyvqGFNCUIO/Hxa0+Od9qdpdtDYrhUOcjG7XAkYnOMtYnUVbBCwAZNHj9sNnNWljDgZzBikahSBZuu242xytDI7Yywt+V5h0YEt765ImgUv0xdsHphIE+fP+Vjx+OToNeFWXn/VSgLE0cCWSsCSxByseAEMZ+LMGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oOuIQsU/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBOxV0Um; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oOuIQsU/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBOxV0Um"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC51mL1430168
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5pDk/RHiyQFi83pfCI/NTaT5GCCo9P8LK834R+NcSvM=; b=oOuIQsU/gceEW8pk
	30+hLQi/KC381B3Nq8SCDIVLmQEujZEr+ApHttzH+9MfAObII7m6zCET8Mos6n7T
	JKxib1wd1V5J3C7GJVXyj6la0GDSHg0daDQGhJD0FzyWqNCJs/WwsloqNd/bFulD
	V7AM81GFmlUeu64MjRfjnZdR/Ukb98UKabzFQ68CaRGLbX1vAreBXF4SG4Z1wfWD
	lAkwV8ZIxUFrHa3jDH0INvTLKbms6vjfnYkbsUzKvB8FZ8GdDABGqu6SsxWpNJSN
	pAe7fuWw8G/E3KbVjSE5G0QKPKFmJ4nhbPzo+c7I9eogVYGbM2oeXnrCjtjPD7NX
	2Fg/EQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvvgh9vh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:01 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78a5a291af3so1819093137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251680; x=1790856480; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pDk/RHiyQFi83pfCI/NTaT5GCCo9P8LK834R+NcSvM=;
        b=dBOxV0Um0LaH2mirtTb+91mv+Go5xjS/zsJUU3POIepD9OfnhUGO4DpIoEe9Y4onck
         NaAndlNQ6BK8vyExgtdgavyLayVATIRO3gVxUQN869lq/elmkXLTXW8I34nSpFU1uxmm
         KW31Cu0WVFpbVHOBIoKyqwiC2Zg83MxudQv4st6vdedsz+gQjmIYePnuRPJzPuqPZxB/
         zKgN5xwtbHQIR9gtwPoqk+03JMsdTB2ESdA8WCHkwlh3P7xa/ZElGQH0lF0OpxmKaDcD
         t7uyfvt4W1QlEtQ//tOb0tnyeQKNRGZLknznITnbaK+RWcOSn+E66RyXkQzx6anhtYSM
         YCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251680; x=1790856480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5pDk/RHiyQFi83pfCI/NTaT5GCCo9P8LK834R+NcSvM=;
        b=nMQlUtFurQcu0ophCbYf0UOLHHeYEx4hNu+De7veHmiyrwGCzF/3T4/gfcmnvLDd94
         Q7Okxx5tcT1Y1FuI/d4dlEkbyaNudoWt8nsO8BNTs2/JNtZSJzS59Qlz21M6owfzTP54
         NBih8XGA0ZF0rih9gf87b/gD/xFtK20nn7dOcbyXkBDcQRH2KN6QQqMSg1hFeOAfuQ0m
         2gO7uVgYDVJ3+1BcSfjKuhRK57CRZ7iBAG0rpItp9hWDlMMRX98X8UIBkfyw/9EekTrT
         jgILCItqHZ9wQvBlpGsv2ixikm2okGnjMCTdU187itQABywGCfSLNuMCKMNcMI3WbIPQ
         d7PQ==
X-Gm-Message-State: AFuF++m7ccrF59t4IujWUHrJrgV/p71JNAeJfM0PPifboa04ayMDnWPn
	pKGWExvB2yRJE5HxCe9JBeQY6TIZoaTqZcLzpxlUJiw7FZM1St7GuWM44yRyrQlsKTe9jT0nOZ0
	A+2bYV95Ll0H9Lrrl7ys+R7TaWUauoXSECw9BqHlAkqlDcAIfpWB6D7bluJ3fAT8ur/lo
X-Gm-Gg: AYBFou3uOPcCcmYyMUBseJNlfxJJfEACh94DnGEzU0BZ6RfsajXB7uYA3V9DOiSvHxB
	qawtcYecxd9rA4ahCk3vBWoUaLj+lsv7uaUackC9vCidfgmOgjf4IDxbZ4UWHcsrNNQdfsL3Cun
	vBDIXOtMvWZ2oZHWK2FXAp0mrMfhNIrx44VQmYFi0jE775nZ4gBQwBy8yny0bi8138ivj3W8Imk
	V6xiS+67PCfC+BbxyPyn7PQe+a82dUUdZDA152rcqYSDu69ZRtctxkh84dWBr7Z7O4OOoxtj7Uu
	OQIxRh8AwQtouu6ZgQM3k3mFTIMXTIATmYxplyZPqLwW+bUuS7A1hiPr8Yo6n8eCB5+U+HEFK0T
	9p88wbuzV
X-Received: by 2002:a05:6102:358d:b0:79e:2b00:b4da with SMTP id ada2fe7eead31-7af1c692c06mr1291243137.6.1790251680267;
        Thu, 24 Sep 2026 05:08:00 -0700 (PDT)
X-Received: by 2002:a05:6102:358d:b0:79e:2b00:b4da with SMTP id ada2fe7eead31-7af1c692c06mr1291234137.6.1790251679790;
        Thu, 24 Sep 2026 05:07:59 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:58 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:28 +0300
Subject: [PATCH v2 16/48] clk: qcom: gcc-qcs615: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-16-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3441;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2vywdcT8KOy7PEWrQfNdsIA4czQkQ1OxXcYuKXe3UwA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJRSIDl1aGyH8eABWLYWX0VRM+gAa/KIQpW3
 Ac17iZ1+w2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSUQAKCRAbX0TJAJUV
 VmKmEACrmJ2afaOR7a73HwrO8Y28H/FuChEyE7W4byCXCv+Yae77dw8oCNs1GFybzfUhZC7ryJi
 kGgIlTo3YrosPBju/pCwqq+hncVMvS7eVhtzsAlK231cOCdEE3c1Z3esRzRmNu1Vogt3jezaW7X
 arUN9U9wcBc1WCwceyOROvwSVxvY7eqqMVvW1oMsRJMokti27mJH9KMRQvbhRxsKpoOlgWQamr0
 7qki9jLDcPvijYzs1uT6LuGqclf0kAj4gj7jKHjAfsaRhbHqVkZD/mKmUA11vTJeH9myto8Ig10
 7CjKgz1nWu6wzsEvBfZ2v7O4+ULr3emh1mAcge58M0ht34dN33k3JMjTjJik4c7ucpYrdH2gaQ1
 9k6tsdlCG4MClU++2Hk8PQmaKsRxbKoX51wMan0rVEWkcvXcy22I2OJgYQdsp1u6pS7CoCisGxY
 GRbIYl1l0ycfcJSWfgO+ynq22LEci8EhPbGPZjrl7KCT4pdteOQZfOrVCNRCsab4t1dslGNmjKB
 L5wPONay3IyRGCvXtqLjyqTiqUjmM2nK+FB4Ip80qEqJnYCVzH5GvDQksUaf+aoTLAVBZu8U29i
 2o7juy4/Mmy9RwAx+qISws74mL4Hw7Nv6QEr1umpva+PH22ag/urAi7Ghu+pGPTHTjamMQQIWP3
 7O9jQ6IPGoeIhoQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=KYhHIgYD c=1 sm=1 tr=0 ts=6ab512a1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3W-9O9G7v02zwTbmxhoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: NeJoxN8GtThBpwfQXpm3Z_7AlZl6hhsL
X-Proofpoint-ORIG-GUID: NeJoxN8GtThBpwfQXpm3Z_7AlZl6hhsL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX8fNLaYIiFfiR
 g++4CTH1AtHMaMiccvi4oEhVtEj98szo2kcdwzGSux/kHdLbQWsE4nFyCog0Krf39N17N6j47aK
 yLklGPWx2f5i1D48q6M0UTHSMQhuaSk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX2VE9Sb10juxV
 3vHdBA/mPpv2L1fKhw04i61NaxwprZyjzINIad+21yUURe26+3SABXyDccobO5CssX7UCSUxcCk
 4Ksr1UY+bg303sXMXSpl/7b8RcDM7nZ2tgAVfk8PF69jceJln1fd2Qh1lFgEIzMKkDk1eOuRIYV
 yUa7WqRjiLebnocQO2QLcMTqDDWIUetCDTZznFRTBtM/Nnn6CFytSORkZdEZABEdU8Ib7462Nta
 qfx6cJEwvMmq/F0niVicRZ7JYhilbXzyPmSlw9hACBOTEkjB2n4UHKQx6X1d+8Zjky2hZvtLtYH
 RJYJWXg9ea2SWKOhS6efHpfKqg+9b7XaSSfcYueUgcwy8vWd9KPJ1KyWYY+vxW30Wp2pOhmWl3/
 sKsCW/MBw8ouUHXY6xySNlAo4w+fF4iqqS5vXwu59cFoTbSHHh9F9tbEO9Kf7nqgroQ0uiUW2K4
 Ov4f+1hRyGwgRTN0h0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c | 57 +++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index 8910a8badc27..e096af7d82bf 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -2958,7 +2958,34 @@ static const struct regmap_config gcc_qcs615_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_qcs615_critical_cbcrs[] = {
+	0xb008, /* GCC_CAMERA_AHB_CLK */
+	0xb044, /* GCC_CAMERA_XO_CLK */
+	0xb00c, /* GCC_DISP_AHB_CLK */
+	0xb048, /* GCC_DISP_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0xb004, /* GCC_VIDEO_AHB_CLK */
+	0xb040, /* GCC_VIDEO_XO_CLK */
+	0x48004, /* GCC_CPUSS_GNOC_CLK */
+};
+
+static void gcc_qcs615_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Disable the GPLL0 active input to MM blocks and GPU via MISC registers. */
+	regmap_update_bits(regmap, 0x0b084, BIT(0), BIT(0));
+	regmap_update_bits(regmap, 0x9b000, BIT(0), BIT(0));
+}
+
+static const struct qcom_cc_driver_data gcc_qcs615_driver_data = {
+	.clk_cbcrs = gcc_qcs615_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_qcs615_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_qcs615_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_qcs615_desc = {
+	.driver_data = &gcc_qcs615_driver_data,
 	.config = &gcc_qcs615_regmap_config,
 	.clk_hws = gcc_qcs615_hws,
 	.num_clk_hws = ARRAY_SIZE(gcc_qcs615_hws),
@@ -2978,35 +3005,7 @@ MODULE_DEVICE_TABLE(of, gcc_qcs615_match_table);
 
 static int gcc_qcs615_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_qcs615_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-	/*
-	 * Disable the GPLL0 active input to MM blocks and GPU
-	 * via MISC registers.
-	 */
-	regmap_update_bits(regmap, 0x0b084, BIT(0), BIT(0));
-	regmap_update_bits(regmap, 0x9b000, BIT(0), BIT(0));
-
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xb008); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xb044); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0xb00c); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xb048); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xb004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xb040); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x48004); /* GCC_CPUSS_GNOC_CLK */
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_qcs615_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_qcs615_desc);
 }
 
 static struct platform_driver gcc_qcs615_driver = {

-- 
2.54.0

