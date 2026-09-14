Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D4D427A04
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379684; cv=none; b=PTRd+wiiRyvls0WPSq0tOWPLxzHXw+G4ytqDg7SzUlfixKqTyEgJ3I5+q4qnBVxeDbPMRlcflXGrSpOPls0nwLIu2Fxw9R5csP2mqoEOyEKCxzdQQDOa3/3/nNa3LOi+XzYd9UxA4PO/LdbOCcMiilh5D2gliP1V/jisRiSAaqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379684; c=relaxed/simple;
	bh=kqjXL0izQ8VvgX01VJKYIwgp2NT0UsTtyXJEAWGbUkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pRy4nMTobpYjPXaHIE6+gCHrDYevM+Oi5PFOPMCPnYj/uL3utAUMPgjp5TlxVPQxAmszPpGR9m+j5D55C1Sl14HqeNI3Isl+G/YdWzPUKc/kS02UuP/SF7TMLXzWZaKG+y7cC2XKTlHGjYGm8e/zaQL8whmT+xjD/CBVxhjAfaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ge3q5jCL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZXqWs/vv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ge3q5jCL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZXqWs/vv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nNOY247390
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rBc1rez6FTVnKmfCDZ0DhHQ0xyRgQ7qyunCJVGgXX2M=; b=Ge3q5jCL6/ZhqGgZ
	R5z5RSCYmZkkBN/rZCCBRfQrAev6YexJidez2+xJltzCxJ6qmYA3J/dM+nQnFdfE
	W9SGP8NuP5zV5MFNvAwRnCTf3B1hEWsOelU1iuWa1rh+UoRRYAJ8V4xum+KoHJgB
	T/4b1iq+QqNciMVuZgvOROcQVvp3Z0u7hu3u3kWtORkcjHIM5P9FpHNvYhYYH3ZO
	iYzsy9uIkosEeLwszWVs4fZ5JYMUD2WsjPQrpRVi54orFLdaKFd8jvNYJwS3LjAi
	UNGZAuXvmCS6NG51QwrR704flxQbYyZXV5eoBfLPLjAO8c8Drg2A3LYU0tPExJJz
	fdq9YQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs82dg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:54:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so5568716a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789379681; x=1789984481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBc1rez6FTVnKmfCDZ0DhHQ0xyRgQ7qyunCJVGgXX2M=;
        b=ZXqWs/vvsRnbMyeyNzP8OFTDyIXvp6fBh1RIKavrRBBT2sd/PKcRk684++iw4gBG/+
         GVvJV+7MzYFaa8mfRSjVNK4/j9GMOtaLDJVtW9IKgQjF1/mJbr7AahHY6oqpa+jAW7Tl
         mN6p2iRVsQ1v3IUQNSHF3brp6e29wR0hcyiPlpCNS6ru1d3qVydjvwrt4B1l804z28s8
         TgQ3sv7WnRSt5pHPWCHRnZSP8R8umoH3WT0RRwjy27lHu6++vieYITTH9O+A7Tu1sSEG
         UfX20iumi3FbIvORfItucE/Q4FFRxD3/kjvLTgby/VWe0TQKjubxX5WrYkSv6juHaTqZ
         s35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379681; x=1789984481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBc1rez6FTVnKmfCDZ0DhHQ0xyRgQ7qyunCJVGgXX2M=;
        b=GfBzericrkDl05ivYHsUc3Jy6hkXAXHEzzE+cHyTOh0ZHqW7HkUY7SpPB7+OsqB01c
         NNccjYAZx3J2Mwf/D+k1L/CWJWC8lKmZKvdAf9DpAJClZQ+5HksQbThoeKIgeNVpXCmj
         KZKazDpm398Dz2POuo1zecczzo4Roy2vvUSsCD0F16Vhotz/VsT8W1HDjIHhwb1MP2h3
         ZbNmoKYol2k/qCyY/v8EWlEfBRmjIKobvkQsPPsUKr72LWX1iPNuPvy4dQBLcAsI6lhW
         01BQGwDuRAF0YZSPhoI+IiiT9K9o6m8WDJmCcWOhV8hemGI5d8t4yPPL9xTRlD4s9m6N
         4n+w==
X-Gm-Message-State: AFuF++naCc77QKB9SJamaFrKzMiG8IFI6Xt1pb/tk1CiBAbtrfFFSG//
	zFmU+1G2PPe51KZC8+Sdg5y83BdEo4xcuJajTJmFne2XPORnoJpIAQuonvDk0zpVmXgY52Aim2P
	qHeq21OnVBa/FLO4EavHJ5MzCE9O/bJGLtlnvVu/dmxEvWc9Natallbz03RgE6gWWyo/F
X-Gm-Gg: AYBFou3vpIDOtFEsBvUSq1+XiwxuAztYxjlAzI3HFU4jpLIwikWQx4d6a2BqifZRwh5
	iO8AZs0JlcJ018Lk3VNDhxBWpl4mxNRjzpDBMUtXR0HIQvgrQdVimx/xBY5230VgJkA/n1rpdjV
	8f1OK5NW+XjNOk7/YWYvNYTzvipBMJFXuyZhSxFBX4PoGSIqn11fZpTK67Fae5CrBqRZISaFYfB
	VvYzDriblREpJk4JeCq5BxQqvBwiWSj82Wh23JyY6ITqadVr+L4wuQk9QdOUq8JMscU5mWzAbm3
	Kq1d7tGzk0qb3WxgVp6DqypbTBrYQUZoVtPxjYmdX7hamCinWyBrGOFL8NhU+Z8fAkMfmObMClO
	B67N3W726XCUdBTjAxBVfe8UuaAfvXuvGNwlGiEUCquwKSTWTldRZj1LUAnf5mAk3Y7co+Dcn3j
	w=
X-Received: by 2002:a17:90a:2cc6:b0:39d:ee20:1e3b with SMTP id 98e67ed59e1d1-39dee202434mr2052706a91.23.1789379681347;
        Mon, 14 Sep 2026 02:54:41 -0700 (PDT)
X-Received: by 2002:a17:90a:2cc6:b0:39d:ee20:1e3b with SMTP id 98e67ed59e1d1-39dee202434mr2052659a91.23.1789379680914;
        Mon, 14 Sep 2026 02:54:40 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm20664313a91.1.2026.09.14.02.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:54:40 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:54:24 +0800
Subject: [PATCH 2/4] media: iris: Add support for Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_eliza-v1-2-e8ccd9b8cf7a@oss.qualcomm.com>
References: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789379665; l=4797;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=kqjXL0izQ8VvgX01VJKYIwgp2NT0UsTtyXJEAWGbUkc=;
 b=T0MewPDIrY0a8eUo71HUa5OzAwTIL7sV3swqhfSz8Bzy57bMBt4kh5jveS2uBXQiV5kwYjrb2
 +bcfp0PV2GaCkct+dZYGNdgmJ23Tt15VScxfzOUWCF3bW0HOzSRYY82
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0MSBTYWx0ZWRfXweD7M/wUgWwl
 Cc+okD3xoODckkBFY/zPkMzFGRMvgH75WJD6Uy5+jtIM9E3J2kSjJFkdvMOkiOBpooW37L5fxPd
 AVDOQX5W5LideaiSpOH8UWkrjmpi++g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0MSBTYWx0ZWRfX2bObz+bE2Q0L
 BNTE9SZw8qiJpuIVyQMIQr3e8Bg9bd1IpMgjpYCVjeIGYDCcndlDiO8pyYwn5DyGRaHgo6RLZv9
 JhZTKz2kbanf7FRZwIWgTmJQNuVvgFu9QvGn1XXFGjg6Vh5Zpb5HQC9yOXoFrI+4XkUUu3kwtuW
 RY5Py3/+3oNlenQHCMLqzKjL64gTvAKC/LR0yOPnYoHCiXrVaK+RQWH+bcnTaHKq1WcM8myRFgu
 dDeEGjAbYs804/LmIhFfGctgxcGq+nyItJno4lidDPepAx9FOq3lz+mjA6mV+rho0KLbHfFiOFe
 Zn8O0SHIcio47s4DoiW4LJmh0Hd/jKD3ljlObOlY5hVQSN219Ln9/1c+bdYfe9jEujnGxaMeuF3
 yjMYagMo6ExUs16/xCgJyuDekkczRo12oHQcrHq8nWN226oi/YzMnFep0IRMX0fxA/qFeUWU92m
 10pbzKo9do5PkLvdgYA==
X-Proofpoint-GUID: XMv2wHisnyidiDIR2wMioJeh_q6saZvy
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7c462 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=keAPckw3ocdkVcR2fkAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: XMv2wHisnyidiDIR2wMioJeh_q6saZvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140141

Add support for the Eliza Iris video codec. Eliza uses the VPU3.3 hardware
with a dedicated vpu33_p2_s7 firmware variant and SM8650-compatible
clock/reset tables. Key differences from SM8550:

- firmware_desc_gen2: vpu33_p2_s7 (SM8550 uses vpu30_p4)
- vpu_ops: iris_vpu33_ops
- clk_rst_tbl: sm8650_clk_reset_table
- controller_rst_tbl: sm8650_controller_reset_table
- inst_caps: platform_inst_cap_qcs8300 (4K capable, 2 VPP pipes)

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 45 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 3 files changed, 50 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9748095091461ba13443c63955a42906fa4f050c..69c239c60b9d763e5e2fd0c16de0e95482414b58 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -54,6 +54,7 @@ extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
 extern const struct iris_firmware_data iris_hfi_milos_data;
 
+extern const struct iris_platform_data eliza_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 74626b35d9cb35cef91ba4d0608bd1eb58ba7194..4c6d565bfa6c7e176aa41aabf27ade8c95be2fa7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -42,6 +42,12 @@ static const struct iris_firmware_desc iris_vpu33_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu33_p4.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu33_p2_s7_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu33_p2_s7.mbn",
+};
+
 static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
@@ -85,6 +91,45 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
 	},
 };
 
+/*
+ * Shares most of SM8550 data except:
+ * - firmware_desc_gen2 to iris_vpu33_p2_s7_gen2_desc
+ * - vpu_ops to iris_vpu33_ops
+ * - clk_rst_tbl to sm8650_clk_reset_table
+ * - controller_rst_tbl to sm8650_controller_reset_table
+ * - inst_caps to platform_inst_cap_qcs8300 (4K capable, 2 VPP pipes)
+ */
+const struct iris_platform_data eliza_data = {
+	.firmware_desc_gen2 = &iris_vpu33_p2_s7_gen2_desc,
+	.vpu_ops = &iris_vpu33_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = sm8650_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
+	.controller_rst_tbl = sm8650_controller_reset_table,
+	.controller_rst_tbl_size = ARRAY_SIZE(sm8650_controller_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
+	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.clk_tbl = sm8550_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
+	.opp_clk_tbl = iris_opp_clk_table_vpu3x,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_qcs8300,
+	.tz_cp_config_data = tz_cp_config_vpu3,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
+	.num_vpp_pipe = 2,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_4K * 2,
+	.max_core_mbps = NUM_MBS_4K * 60,
+};
+
 /*
  * Shares most of SM8550 data except:
  * - inst_caps to platform_inst_cap_qcs8300
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 4bdb078d83b5c331869dab2409bc4d10ab302737..9e601ee802097ec31531fcae85d0b17a7944686d 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -427,6 +427,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,eliza-iris",
+		.data = &eliza_data,
+	},
 	{
 		.compatible = "qcom,milos-iris",
 		.data = &milos_data,

-- 
2.43.0

