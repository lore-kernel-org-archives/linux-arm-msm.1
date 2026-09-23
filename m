Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F8642FCDB
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161443; cv=none; b=OdXSNMyx+vpNCGOAnbXam3zWSAUA5cB+ItlhyhnMLYTpQUImVEMW9M1Qg+hTgolHerBx1oN2i+sM5rWqiEXqRGpwLf+DHL7uBEy2rHq1mMKFDbaY0Q8tOR2sZCjVlPXYrV/RaJVYu2hW80n50SKvi1vbzm9FW1oYoaoPPIei4T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161443; c=relaxed/simple;
	bh=iJM2z0qsnL05GXSDRfJ5G90wHLYBWbDvSL1z2DwYY8A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pijpIXrtPsPA1s1I1FSqL77TJe+zijqEuBZQNSdaSdXrLUB0SM/2bfUx3VU1aqSmXg7XDq1J9dtgVMCBd4JECK8Zmqs3mpRzcQe+8MilJUF9eUkCb0+zrPUHvNOtsfR1zJ9oOojlwwzJSJtOvKTR7NTPI07Ml67S236BxPKt7eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HF0t24ae; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HwV9aSSQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HF0t24ae";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HwV9aSSQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3hbU1623771
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UGr4IyU+Z+9aGHRA2Rqd5DughbJWkaPEYhQfeyzXQPA=; b=HF0t24aesAOCMUir
	eyTT+dbBYHuI7mO75/Q5wLSoRsizUyHmVOK78oj3p9he0BdwS7xGTAaC3Z0puSv2
	d2glSWqY3gcoluj/yrhf0AyT4EXwF6tEfbCljAZ14d33192zpSF+g+PEono2eUKS
	jJbd7U7qkgBPWPUAOL+3fia5ohuDRW5tEnwzcKWOlLb9XWN4iiGS1m6BnyWWmqDX
	vD9l4V0jNJBzmCx/TtpNxqACDZ3TtYSsbEkyEY4Or24We5Wcqw7P1Sf/DBdNqxnD
	n0gW9sQSBA6WAz4D1PXsdGXD6SGtrGkyWEk2Vgr3m4fIJ7A6JMMC9y/XTBhaX4mr
	Qw3pVA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma3hkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 11:03:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33310847fcaso1358802eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 04:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161436; x=1790766236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGr4IyU+Z+9aGHRA2Rqd5DughbJWkaPEYhQfeyzXQPA=;
        b=HwV9aSSQEOOSyHG3nzwoNjw/s9pKviYKYifO5qTBtycL0MQFaRW23koEgAsQYARh+x
         V3mNeK0CBkkeI2+dpD5mTU1liNae/zPvgLtNx554T2cX2/biiwRktKuMgnyARlllo68w
         Bxx56DTUDUK/8LmgF3WBqJRRqBc6sqMtGQJnsGCW53fQm5Q67zbUyWb56jyhhiyffxoR
         6KUtvKdROF8TUNsQJ0tcW6TgczgVdUspeSr5jNxMk/bh+GUKYaNhBrLyLDUClK59EsTg
         j4BJL4dZJaDi7dwuXsu0pevOB/ITHi9Ej4cingBE/WLZJTyffLAcldaKyKDIDVlc3yQ9
         WRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161436; x=1790766236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UGr4IyU+Z+9aGHRA2Rqd5DughbJWkaPEYhQfeyzXQPA=;
        b=peTb/VY51ezKN70KS6H7rglfWqLlzdKmSvNjoPFFTyvtl2VvAR+Amj6VlTbA7bDnjm
         OwGwPwdqhsNi3U8j2nlkR1X7dPFerdhbbAN7NYCtbSpPRDWa7Vzvb8G8ShIlLnLdhW+0
         37rVRsvvdKoxEqnzVsvDKOeSLV1RSvxagqjNKiCt9/Cvh6nem8MBXQ348vUh/3OA4FlQ
         2c5ImfQXZWtgJ5Wx0nCwN/ln6uYgyGWpOGh+LO0ZHrcWAKYwM/ccTzEIzDnCsJ+WWsG6
         ngxgcHEyHZqC0XS4kpflt+waOT4lcNAoEY8XceA+yTh7DCxzUgia1e+WDPoD+wVY+aAZ
         Y7HA==
X-Gm-Message-State: AFuF++kJn60wokGFtafd6zBpsN8YHkcG6T1gDZ8ABKtFYn3AHoPqjgWF
	/l7A1KoCMruREUF1LuAL0PH+WO4R3pCNHtBXq6lWCsZvIpQKGdDrX8cswpIGiyhWlfLUtKRZ8SY
	OvFaNKJLc/RJ4g1p0KBYflsu/ztNpJcVRHUh7nLL4ZcXisjkbKXh3dNDlti3CUPM/MoMI
X-Gm-Gg: AYBFou33c1gxGp95M6+v1GwdmQuJENm1rPX+90UmFqEv95h9bW3aIzZOIFpT80Qv6D6
	93iMkKXb2YQUeOa/6XqI1bbeX/JM/P58PrG4mjrnfpH0kO8dCG9wiBGZUwOEtOAvEMT8DHw6jS3
	gJxzBr+7Zck5nOjFYULRrFqnXQJKM8ENKGRS/1HGfAJIBSmQ9PcZvcjg7WQqealA5NJ7XzxPxEB
	JqDtzyHTVDtBA/J85enpK1oAIAlvPZS17x5J361AyAGAwNLP7kO0kwGRmfbIlJj31SVOWnaVkWJ
	Jm79U/xj0+qGH2izV2w/cimq/NTwIcelrpkulRJjtHZ6YfXOJhgf8/9kvQjcp5LqOjPjzoGytIC
	gx9pOTU+44OMRVYX4A3mqrZ7sHcUg8EX/C3HlDZ+l
X-Received: by 2002:a05:693c:2518:b0:339:794b:c068 with SMTP id 5a478bee46e88-33e8e6a0a3amr2246063eec.40.1790161435318;
        Wed, 23 Sep 2026 04:03:55 -0700 (PDT)
X-Received: by 2002:a05:693c:2518:b0:339:794b:c068 with SMTP id 5a478bee46e88-33e8e6a0a3amr2246031eec.40.1790161434619;
        Wed, 23 Sep 2026 04:03:54 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm5905377eec.13.2026.09.23.04.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:03:46 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:32:36 +0530
Subject: [PATCH RFC 05/15] media: qcom: camss: Add Hawi compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-maili-camss-v1-5-cbbb42e534ef@oss.qualcomm.com>
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790161355; l=8899;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=vfBi2Z6O0KBBgnAVJ76dDpc0hfAW4T1TilF2lfzaBw4=;
 b=li/tbb6Bgn5nt3xBRoDmCwcH4riswTfieSaosyTvUXUO20WKbBhHYzl7OV+3dd9k8o3TStyju
 makGVAsThsUA52qERRqd9ibgknTYSWLjM9XUIISEfXiI+3UCy1V/mKL
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: aebz9MycSo-5DJmRsStPN6gjuQu40imM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MyBTYWx0ZWRfX+tqFYuf+nGvW
 5NAfbFQUqp1IuZiwOTOAf4bIdrrRINxfve9gsAUg90bt2fMcyuqtcUH/8EkzmNgKXn0D0Vy4Di1
 1Mqv/2vaOIiVsV5H9c9S/yZpExtd38s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MyBTYWx0ZWRfX0C+iJapbolld
 9Jkpwe8w1MF7YEcpWBt8yLuCs84FX1BX/hafJUrzBjpIvbTI/sI7hGm1PXN+mZV0DhaBCcH8nNV
 YIC8RiVTjykQ/RlJnJ2Crl1DeSucbaNOLUUrTI8OmCedtbfXLt4Kt282ywmwmETMbsHQSWVwCk3
 ANBv6KzR4dwTLv6FUVfgXSSyJIk3h34/IJaQfcWT/Qpm30AdDhLqLCSqoq6ZNzfN/5g2dqERUW/
 /MaZqipMqk4hkEQc+Of6iX85xIIvnANLKpPn+eA5qNMfi2VnMwthRLhqJcVLQhd9bQImqZl/Owq
 JZXPJUVugvGnyRx3B+3UbFvru76MTJYHqCGNbw/rSdkZl0sPh6zWn5UVo+qWeT3I/+SlepV4ORX
 lILu8Faf1vNOMeG/VdC382KfuFb+nswkAy1dftMcKaww/aeGpp6/wFn/EGhDHX8bY6ZGZm64GWu
 ehIwXo6Y/A9r3+GVHLg==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab3b21c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rd6-Pq6jOnJN5tgnlYcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: aebz9MycSo-5DJmRsStPN6gjuQu40imM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230043

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add support for Hawi in the camss driver. Hawi reuses the CSIPHY
resource table from Kaanapali and the TPG resource table from
X1E80100. The CSID and VFE resource tables are Hawi-specific.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 259 ++++++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |   1 +
 2 files changed, 260 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index b862f067936c481408e1e8e1660c8aaf71b065a4..d0cb66ea850e33783912722ef60c97c2148d0ad5 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4476,6 +4476,249 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources vfe_res_hawi[] = {
+	/* VFE0 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe0_fast_ahb", "vfe0", "cpas_vfe0",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo",
+			   "cpas_mnoc_hf", "cpas_mnoc_sf" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 238200000, 397000000, 440000000, 480000000,
+				  630000000, 750000000, 833000000 },
+				{ 0 },
+				{ 171428571, 240000000, 300000000, 400000000,
+				  480000000, 600000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe1_fast_ahb", "vfe1", "cpas_vfe1",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo",
+			   "cpas_mnoc_hf", "cpas_mnoc_sf" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 238200000, 397000000, 440000000, 480000000,
+				  630000000, 750000000, 833000000 },
+				{ 0 },
+				{ 171428571, 240000000, 300000000, 400000000,
+				  480000000, 600000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe2_fast_ahb", "vfe2", "cpas_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo",
+			   "cpas_mnoc_hf", "cpas_mnoc_sf" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 238200000, 397000000, 440000000, 480000000,
+				  630000000, 750000000, 833000000 },
+				{ 0 },
+				{ 171428571, 240000000, 300000000, 400000000,
+				  480000000, 600000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE3 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe_lite_ahb", "vfe_lite", "cpas_vfe_lite",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo",
+			   "cpas_mnoc_hf", "cpas_mnoc_sf" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 400000000, 480000000 },
+				{ 0 },
+				{ 171428571, 240000000, 300000000, 400000000,
+				  480000000, 600000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE4 - IFE Lite */
+	{
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe_lite_ahb", "vfe_lite", "cpas_vfe_lite",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo",
+			   "cpas_mnoc_hf", "cpas_mnoc_sf" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 400000000, 480000000 },
+				{ 0 },
+				{ 171428571, 240000000, 300000000, 400000000,
+				  480000000, 600000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
+static const struct camss_subdev_resources csid_res_hawi[] = {
+	/* CSID0 */
+	{
+		.clock = { "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 480000000 },
+				{ 480000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen4,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.clock = { "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 480000000 },
+				{ 480000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen4,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.clock = { "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 480000000 },
+				{ 480000000 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.is_lite = false,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen4,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE0 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 480000000 },
+				{ 480000000 } },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen4,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE1 */
+	{
+		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 480000000 },
+				{ 480000000 } },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.hw_ops = &csid_ops_gen4,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
+static const struct resources_icc icc_res_hawi[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 38400,
+		.icc_bw_tbl.peak = 76800,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -6116,6 +6359,21 @@ static const struct camss_resources sm8650_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
 };
 
+static const struct camss_resources hawi_resources = {
+	.version = CAMSS_HAWI,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
+	.tpg_res = tpg_res_x1e80100,
+	.csid_res = csid_res_hawi,
+	.vfe_res = vfe_res_hawi,
+	.icc_res = icc_res_hawi,
+	.icc_path_num = ARRAY_SIZE(icc_res_hawi),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_hawi),
+	.vfe_num = ARRAY_SIZE(vfe_res_hawi),
+};
+
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
@@ -6151,6 +6409,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
+	{ .compatible = "qcom,hawi-camss", .data = &hawi_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index fadba57c5efaacb39ed3a55b107111528fd3182b..a92aea37c016db8066de392c40405303b74575fc 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_HAWI,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };

-- 
2.34.1

