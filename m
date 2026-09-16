Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F9E4FB9C1
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554674; cv=none; b=QwzULJSm1Zb1VK4AcO+MlOYw2gmlIcmroDtNjZRKtVs4YiPb6qy/I9/rRVR0NVcj69iJAwhsCzOdcXp0pV4OE6po8jffyu/EDgSXHliJix9WW4yf32BUi8iP2GMQEIsLM+nqWsSWxWDd6AAmAna4wPPTrrTZ02P7FfS0U8kzplc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554674; c=relaxed/simple;
	bh=jZ1F4WC21Az3jEkyItdyWmwptqda8S/3m5px6frmneM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a19K/oIKTzwp7WuktYpTuZjCgH3SHwu/Jy6eGqzxQ8YfMKdxBs/Ch/3OLCMXrYqJGOWX6n0DwsMA6VFhlLy49LNvuYhKvUj5unMNWcsEq3pV98/l8eqVyP4EQNLbBa4KylxUXZzhiZrkib24B7l8kCeiSKMr1y6Od1hvKPz6S14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EivbjGY3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hAhjQ9Bi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EivbjGY3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hAhjQ9Bi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92qBF3377426
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EV82cBN71TZEmGHMYnfIYynbqB0wUkL/qmo9KXqyVRA=; b=EivbjGY34PWMqlv0
	hxhoJUtCXyp5eNzh99ZFLxbsKcXNvOem4QlJpPxdOtQAVfyEq1ld5gYd6Tj4kYbr
	6Y8o3tx5yjJw4R/QqoKgGmRYZIMiZlMLx56H+bZ4xGU8nxPuuiTkE6mFTY22+sz7
	Tt6Dxd98nA329Or7eYswJs5nONZuik27WFVZ4ijAG7NSmE4ErDWhKH00Rz6/bkZC
	xZlvga6vVEdRdeuaFVx6VJUtaSnKZvFiP3SrpYWdhXTkQIzGp9w75Vhk7blxxamK
	dRIS+SIJi1ARKXvfgxrxN0PXlWpGmExEfN8E+mE+ipX2CoBA0MIrqGYiY1Uzoi2Y
	x/+kcw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefpanq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936e393061dso868275585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554634; x=1790159434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EV82cBN71TZEmGHMYnfIYynbqB0wUkL/qmo9KXqyVRA=;
        b=hAhjQ9Bir6k6+1C2rCx+KPVRmzyMymMc4zOVWtpq5fd9bvoaPnI1tTufrxkv1pihxB
         ANNO0m3YKzNDCIs6PBgMIfsgLyLABjPLGGYvQJF75vcYyiR4+xVWupiV1lfuFw/bRnh/
         BfQcj6G0cXdOvmUf/qhJBRyRMeTqVaolwlD04s7IDV597a77zdqd6A4ofGxOUboEm+wR
         GH4hW5uM9drcCeoa0aBv0cnZCS+BkNoEvdBvKLKkFgRuowPOoVMPjrM5suQ1CNpKjAq0
         ZiIlVcs08uC8vee7F6LbliVZ4B+sqDqD2p6ydYadnJrD7XYc55r0wMQhXvNFFk36ZSwr
         yEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554634; x=1790159434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EV82cBN71TZEmGHMYnfIYynbqB0wUkL/qmo9KXqyVRA=;
        b=aWnPzcU0SjflYkie/wkNuBc6AIz2GJwIZlYI/zRpOhP7BZan6waDJQsFRRcRYI/HyD
         Cl+KQ4Ts1629DusdSSzOYHHfS8fmUsnM2iuSNqvdi/4N9YToiTeKvf+ZKo2XovY9mcuH
         7PYEINnK2uwZqaPvwSOXOR35dGTkW8L9dOQdsYjJTynYXV9MJo3d0Vc6twg90WUaqlhD
         9g0oQvdjukN3zzoeBjsBokvcmIz73gm8GWAdlzb8ekKFOLa2yHdtfxzxQecFxTpLvmrH
         BM49KNtN9fUqDZlBnEsF7szrqnXeXc7nrcz0BNn4+rmVpSOvuznNZ+iI/hJNaXT3D8uC
         XKMA==
X-Gm-Message-State: AFuF++lqZmFGCenOLKzcf5TPSfMQ9ymRlaGlWNcWebHMB1ImFwKbhBgD
	SDWK7PeNrpnbkRDexPTO5zl0vCb1/7UiIcpzYkoRu957/Oc6owff2VrN9T4lsQ2VWTxPnIpq36V
	uuV1jHd2Dbc9pr5JJ5EFF6fVW3smuTOKcEYykVVKkTyA/TfltJTok8vJ73XMw3kSGGTI6
X-Gm-Gg: AYBFou29kznWear5zInpmt8c+SjZBTuBoE9GyXwx/vIOLsjXJ+Avx5I/c/bSZffeHvD
	zDnDryOfxoYxzNCkq35h2NQ5kLVLNBzTgg1Z4x2vgYLI5FYGK7aDKDZnY41j1itC+JTDYJ9KL7u
	91ysSaY0S0xomZqllGdLqwhSCr3uAtC8vnk6fawjD4+yMh/Qb8mYfEzd31Y7p2C3DSrFZrapQ3I
	mtAYwGJKgAuFVuXm6h2DlM+9pjUcdRYqp0v2y85w0HwmGQ7ljcFMQk0fV3us572V536VmISgoii
	r8ttJqB8ljsE77Q9bVW+QwTgAo20/EsigITqRcO7k1GcIQ35aAwf53nT080UkOhRm9SjaGTvxOv
	gg+eICts=
X-Received: by 2002:a05:620a:800e:b0:939:e5a3:10dd with SMTP id af79cd13be357-93bb76e2cfcmr326485485a.2.1789554633599;
        Wed, 16 Sep 2026 03:30:33 -0700 (PDT)
X-Received: by 2002:a05:620a:800e:b0:939:e5a3:10dd with SMTP id af79cd13be357-93bb76e2cfcmr326476785a.2.1789554633097;
        Wed, 16 Sep 2026 03:30:33 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:31 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:53 +0300
Subject: [PATCH 37/48] clk: qcom: gpucc-sc7280: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-37-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2086;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=jZ1F4WC21Az3jEkyItdyWmwptqda8S/3m5px6frmneM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9uR24WEoaYzlFM9U0lA3l1k4QFzmiD3Q8Ba
 jsLXqsPk4SJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvbgAKCRAbX0TJAJUV
 VoEOD/sF8rRigchS5Y9B3F4XifcZuTcbaKr/HANbNCmrvYfVUuKagOKBCwlF47rh3EZ8hDyCzVx
 fLyweH0FOgJNxvowq4b0NxJQyd3+r5YfDoWCCiHxUSRrcQZ93uQ7waDUHrWzbWtrDwblM1LcVkp
 aszrBtW/dARUc0IMPdSs9jP8gi2gBxcZr0xYVjvsAzjgy5T/6t17Ag3g79IULiPPHD7qsIK5f66
 Q5LAJc+dRkNt2mu/7xxGzRDzeU6/C3Eq74JKKwBpZebcTItB/UhgoBqZDc6QFI0QokKa09WsCqb
 1Hn3qgxKlhDKyVBmH0E7uXmyDz4aFqDw/upFRWlZ665UKp5+DJnN0g07dFmY7VxygPRDd2DLuD6
 73iOeSuORDdLILxThMLfQ4hni82ipEiE7i5dzd74lTh3q1HL2oQi96mEthmicks05uLWFWnP3hZ
 zedpodgzt+nkJpO6fZWNyiGawethDGDqli0jQo9vDrJcq2LXQvY+cPOiOQaOOpjs1Eq+9s+EQJD
 OA8WIncS75pdAPmEPJxbHvn1aRP8STmZhjx/c6qLe/n8EfanYSlozwvAK73GNELSZERW6xe+jc6
 mXbn47MCUBQvzGOsaZT7hTKwjlZ3WG5Gls6hhRVsFwNh937R146yLW7s2JUSjYWDB/yVAxlR4Xg
 d16G6lckvgz+CSw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX7rxvb7vamzBZ
 b+a38LYVpdILCGUbrd9HJbErqNpyn5GQew/xrr2Clv4L02iKF4BooWGU5qMpsmzXPpVJ5tho8Mg
 wQIzBQNN2ILTgZ713xyI77VUo7BD7rI=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa6fca cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=W2O9Cv0nt9n2xGTIkqUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: uf-6dlyt5lFzmgU8jCsmVI8V4U-VgV3g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXzzxDWZ0jz3fg
 hLPltUJLXskWCXh6T+TsWaaLORMVOM2tlE2fW/mmi31rMxwSsTk7CgO52lzu4Cd72GH5Y0Tzg+L
 Us7OjOQOAvOpCxiB1tPC+GH3cQpBLVBQIVtFNEuNSg1mDyk1dR8zDQE2Cu2RsWSgOvTBP1vcPNG
 /lUwSmnkjJ4hEMN2LoAvocxi1Cad1WDXJDbF3tG33hABFUNWX+chi6hLzspvOTwZlc8kT7t6oLg
 7EvO4DFMpbS0BrqUQsFooLv1u6dVuzph42Fvdjwclxq9Lp4AA0JGsc5zDWdb1ppS5VYzKTc/YIF
 ZQq2YFTHD4kO2tpDIPaPoWWyHTQDgt13e6XGev7k+e11UctL5vF+5tY2OAyYT4DlSdxLYA3jqTj
 UH7yfbthwtbE4PG1Zkw4+ki3irSVCMFlxoYcaunt++C0uXTxTIhalCuCQgzADeKY5MPQJ0G+WSm
 MHs3dDB1LgW596qfo9A==
X-Proofpoint-GUID: uf-6dlyt5lFzmgU8jCsmVI8V4U-VgV3g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Move the GMU branch register update into the clk_regs_configure callback
so it still follows the always-on branch enables.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sc7280.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
index bd699a624517..9b267276eac7 100644
--- a/drivers/clk/qcom/gpucc-sc7280.c
+++ b/drivers/clk/qcom/gpucc-sc7280.c
@@ -440,7 +440,24 @@ static const struct regmap_config gpu_cc_sc7280_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sc7280_critical_cbcrs[] = {
+	0x1170, /* GPU_CC_CB_CLK */
+	0x1098, /* GPUCC_CX_GMU_CLK */
+};
+
+static void gpu_cc_sc7280_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	regmap_update_bits(regmap, 0x1098, BIT(13), BIT(13));
+}
+
+static const struct qcom_cc_driver_data gpu_cc_sc7280_driver_data = {
+	.clk_cbcrs = gpu_cc_sc7280_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sc7280_critical_cbcrs),
+	.clk_regs_configure = gpu_cc_sc7280_regs_configure,
+};
+
 static const struct qcom_cc_desc gpu_cc_sc7280_desc = {
+	.driver_data = &gpu_cc_sc7280_driver_data,
 	.config = &gpu_cc_sc7280_regmap_config,
 	.clks = gpu_cc_sc7280_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sc7280_clocks),
@@ -464,11 +481,6 @@ static int gpu_cc_sc7280_probe(struct platform_device *pdev)
 
 	clk_lucid_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x1170); /* GPU_CC_CB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x1098); /* GPUCC_CX_GMU_CLK */
-	regmap_update_bits(regmap, 0x1098, BIT(13), BIT(13));
-
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sc7280_desc, regmap);
 }
 

-- 
2.54.0

