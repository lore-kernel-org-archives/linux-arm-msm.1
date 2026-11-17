Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897293;
	b=qw22AEK2vohVN+e7PW0LJTZuAs6HGz2Z8VsMB5Fr/Ta+za6jVvgpVtoo8p9s5loKKuZ9
	 4qj698ssn72MwyRBRIf6WEPf5MR7zoeXawuKCVWbYLI0SsOsq+EcWBbKALbnPAjqTOaGq
	 5bfUtWFh0d9ddLnTFaFat1ks495X0QHVlvABF7o73CyXwPAeKcJW6xQZS+746ql09GE8o
	 Q8BFkLVh6NZkPcPcOjwe+abY+lg4oGxTI3IJyocofZXD6ziBYpVIsvxatdp6lRbmAv6vv
	 gd+8Z2SqWUEEQfKwT6m1kDh1KNqi32cgDgbGO0S88YtZvMR7yyujFfhPMn2hnlybNIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AI2GRKz7Yv9WAlYECN+gWlj9BFMyJ5aDuyLddx1B2XU=;
	b=pMBQn+5rmIJ5EqFA5jv6Iu20ySVtYmz6Itwe93jofttsGIV0NM1Qnv02/XbwJAZSFNLI
	 m5/D8Cc56ykTyA9lALeQION2ZmVuNJCUzCsNn3BLjtjsnQi3+s8Q+PndVe1Hb2AJyd26n
	 IPMs8NgN4BqNeaF7gJqOf/SGaIbXAUGHOjBIRNAAf1ntRU+QZ1BI3aK4m9s5hENJ+ft/I
	 TQ8digrEgd1IobBnL3WEexkyB8F++vdcR+l3aiucm7bExw0Afx5IqH3AQQ/HDAmcLQLra
	 xsXQEY+HddgyA2ANYg2v7FyUyQkH3Vxbet04FtV7hd2FHzn51AcHgkRkvzem/cpmF7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VA25vg0k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBX+YZHb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5829F606A335
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5829F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VA25vg0k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBX+YZHb
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aQpu844341
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AI2GRKz7Yv9WAlYECN+gWlj9BFMyJ5aDuyLddx1B2XU=; b=VA25vg0k3YoUptSe
	S8x8WTXBJnwEzBta/nVvRNqbWEjq+EimeyA/UMXaed+smIcbBOS+ib4rWfgEiIFD
	GLKKbF3nNlavgXqIS7RxpAsqIjzDKqMDk638qbTH51CldOByuE85/T2BDAxVR6Ae
	BQLcJAt5cuy82EoNORnVw19Cwg+3wtv/S6M2XWTWCgaeLyP6wP66vs2JT7na8FTR
	bTuIxSTZAh3nX7i15eDpsROJWWaE+E0HaCI64im2rzAQV1CiRl4BgxK20de3f4If
	NtVCnHU5kWbiEz8+cZGj7W/K+7x8WbfEKj64V4Hbf+5X5Cg5x0jVmp//ygKPoLwI
	U/PSKw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h14ng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:34:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cde00369ef5so1021532a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 22:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897291; x=1795502091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AI2GRKz7Yv9WAlYECN+gWlj9BFMyJ5aDuyLddx1B2XU=;
        b=GBX+YZHbJId62Ee9is3txR9l2+hZz/KtFervLJtDs0LQ0Qne+pHVRx+YCFHwqViv/L
         854cZR8+wc3ZT0jaDGuWfOQSHeBkJxOQR4e+5kc4qZ+kOj04Nfl5Uh7lYAWselRoLfKG
         W39QarjLaNtZDCSbgPQrJU/A/86dGewXftUmtBTdjK6M7LhyGrv095bhtaijkzSWFSAv
         KJzHJdF6kIKvtyRcio6y6HD2ZM6KBz+/ijM8fOfmcz0mFvhP/HjT83XMHoYi/gj7BwQR
         rM+V/i2pTfZlQSl+pA4vmABgmwWr8ZodI2cNSIZqTXqXLTmOl/Q4oupZCxAtf9Zmtoir
         SYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897291; x=1795502091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AI2GRKz7Yv9WAlYECN+gWlj9BFMyJ5aDuyLddx1B2XU=;
        b=P1Dhq4PRcIm37z4sCxMWg1qRL5++CwS0faNRXOv7k8cqB6VQhrwi1V1gXplmUKa1l8
         33SzqIr1orXDuOrX5eHnx+cjW3aVWIo+cxigNKI+OJyMjl7pacRciPIjXq0AmDbZ+YiN
         7PuApFqZNYFoBsiaAYLcAJk08n86JMhxrRE+VxlD8sQgiCzdV3cIvfEbK/lIhrQf8AqW
         uQaYCtFDUt+YmR496aVvPBZOqvZo+8QW4syrlDxvbMMUOlL9H7ceQKtMdIRYGyGz3OTT
         XQEQQ70U40pv2S+yx/YzKwyVz6AGggc/Cnzsw5GJIaGCXpveant7ApqDuw4aPN9aevw5
         No7w==
X-Gm-Message-State: APuU4Z+iwZWRYCOZRooAsADHoMNt9s8iy2w71BT8vG0lwTsciKokfqZh
	U29YLUOpG6lKdx7t463zKX8EjjqZmlp33y1c1qD9h0oJLwW3rPjsN7oUQCaErgtHe8aOirvBttM
	atoGQ22253JQUWEoQ00m4udmda+BrSt9repsbIaAYRjmyNd+W+J+gijuhyTFbtYxsMMHU
X-Gm-Gg: AZFdTZdy9ljdVSpBvN9hRzO54nY7lbsetIS9Moy2JF8og43x+8+BWjLfWLna6ossvw0
	ax8/zzgX63PPoCjd9vPk8/RRe/x5g1YjvN+aPFWT3VQ+6fNcDZia1o4jBIv06DU+9UfSZSCfyyQ
	kP2ChtO+Nv/rzoiacNI8QVJI+AoqpR9Y7WuOPIkd48R7g0yGTET0sUvS4SAURucY3pezBxlmW9g
	thnD4rJ05BWh19I5zV3+JCL4a5sI8eenq/AcKHIslzrOtSVwq8ABaGYHaKsQ+6+5CHEWiGobkFq
	FmfPuoBBdwvX+QpAxev4KoeXdsI0OM9Vwfr1N5IhSR6tP8NtTwcZNV1SJU1lp8P8pBE4SUnC0c+
	rM7dV3Owv2wm2UN4J9ZLLSYoKZV3Sw8ytxzb6lcMq8TvGcmgBrUddR68vvrqTbrjo2WG/+NLUOw
	sL0gbmlcwbkXoZt1UHW3CqLN/dCQ1FdXa9ffpib77jelouzD4i
X-Received: by 2002:a17:90b:33cc:b0:3b1:2237:3c93 with SMTP id 98e67ed59e1d1-3b1b0a42bd2mr12201503a91.18.1794897290748;
        Mon, 16 Nov 2026 22:34:50 -0800 (PST)
X-Received: by 2002:a17:90b:33cc:b0:3b1:2237:3c93 with SMTP id 98e67ed59e1d1-3b1b0a42bd2mr12201474a91.18.1794897290024;
        Mon, 16 Nov 2026 22:34:50 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:34:49 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:34:31 +0800
Subject: [PATCH v3 2/5] media: iris: Add support for Eliza
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-add_iris_for_eliza-v3-2-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
In-Reply-To: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=4891;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=lQP3CRUQYrnJxA/r+Wb5Mk4D+GCuhW/fdH6ujAAKVxU=;
 b=/AxlZ0UyBdyqb4BGTVCBmBFu86q2syu87MWGpKSr1wcvrRQC1bCkzVIUjFdOTdqsSYfRXFtAO
 widnJN0klymBEVvGibbhf8Tg3ket7I/RCTzjRvKSU7XGPGkVJ2M1/fS
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: ySnZyg40mIhrN7YbQlOoCnL3NFqVFJ_T
X-Proofpoint-ORIG-GUID: ySnZyg40mIhrN7YbQlOoCnL3NFqVFJ_T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX8H1qm1FKyRDU
 FU9aHcB4PEeFqmXwHYGMmg+5mMfAuqE1WRoKYgnwLE+unbzrYdGkqzoNVmq8wrc25xZ49ySmnXZ
 N/kJXQCCeCkJuM8Utxs3/4eIaZFk7qs7pOc8eRWelUZqVT/kB8+qKV1USZDAg7tUUh5fzszK/bG
 BXKPlk3Q8HW5sP9Y/t3ifidAKWf7TsVj8eThmgFkWWJti6SajQjn0gF6dxvBph9ZUF/o4sO9hEk
 uX2buoejhVqAhQm2Jgg5qtnpK7bpRRjDH8RTkPdRxmWJA3M9iBu7YyLlg53RWPNtJ1+YhVAZdRI
 T09wowGg3cjUU5a+93XTP9MwqbG/nP2QlJO1p01BIkrl+pQWtSsUKctd5x25HN0yv+Z1E9FrUoi
 sIqzp9F7uGnscIrT/qLO78Q+J+xBgMp6m44oNKbitK4aXGs0pCaK8sZk+QhhIUVnJP6I63GPSRb
 7QyHgZJ9HF5oAgrba2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX3qMJnBVbl7Pt
 gspf9kSeFW6DDY752fuNMJhpvNa+om67L7+/BkFaYTP7xnzROiptMsHMY2qghIkdk1Bm2S5jHFS
 mWyNMHWK7bX7iDJk5M/J8W2SWG+JHlY=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afbf58c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=keAPckw3ocdkVcR2fkAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170025

Add support for the Eliza Iris video codec. Eliza uses the VPU3.3 hardware
with a dedicated vpu33_p2_s7 firmware variant and SM8650-compatible
clock/reset tables. Key differences from SM8550:

- firmware_desc_gen2: vpu33_p2_s7 (SM8550 uses vpu30_p4)
- vpu_ops: iris_vpu33_ops
- clk_rst_tbl: sm8650_clk_reset_table
- controller_rst_tbl: sm8650_controller_reset_table
- inst_caps: platform_inst_cap_qcs8300 (4K capable, 2 VPP pipes)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 45 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 3 files changed, 50 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cddab9a9c375abc6f803f98272619ecde8ea7873..dbfb4d2cb7c38a0fd12804b519ba579692916e19 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -62,6 +62,7 @@ extern const struct iris_firmware_data iris_hfi_gen2_ar50lt_data;
 extern const struct platform_inst_slice_caps iris_vpu2_vpu3x_slice_caps;
 extern const struct platform_inst_slice_caps iris_ar50lt_slice_caps;
 
+extern const struct iris_platform_data eliza_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcm2290_data;
 extern const struct iris_platform_data qcs8300_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index e963cb116313f8e7619dc0686257801c09c7925d..f16f94a2dacc6f63d5ec40a8f2cba909a0d04e0a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -44,6 +44,12 @@ static const struct iris_firmware_desc iris_vpu33_p4_gen2_desc = {
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
@@ -87,6 +93,45 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
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
index 343e44c6b9c46190a4fb3a0055ba012b16011235..6bf6b2886f151036c34645aa2c6daf3f85f53908 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -418,6 +418,10 @@ static const struct dev_pm_ops iris_pm_ops = {
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

