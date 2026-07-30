Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C474119E5
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403460; cv=none; b=S4BwzdMMPghKu1adTDeA8mjiy9aoKS3M0WGWqgF4CShsrmzm3b556CHKkuRZ7qp/eWxIAy89JBX2TjKi+JLc+TdDkOtQi7ov6YTr5Enkoh9o8VbS8UlTKsd+YtxJlqi6H17eyZRoScPZWdLS9yrUzqZopGgM4yUjSf9cp75o0vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403460; c=relaxed/simple;
	bh=fFmGrw7nFzxQnrIVNYz77f4Z7iGtRWEKk110+mrBOwY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b0yZSaD8zyzrc0y6hY3ELxj6yllxKEXnzxGbvGfU74Wijt9pZrbvUoljXN43DIaEPFcC+ScTF50EB/1Jcr/GiBEXWSwpTjYHpLrBvoRggf9DXg5AaOmqB5fsqZ4wmWbKUnAW0BD+wKrOBJs1qy8WZ5FJ+IMYs9kUXpmfwo65+5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0q4pdSN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6osqVCi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0q4pdSN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y6osqVCi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U9IQAW184007
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U2iQygbMBEDEjFcsu6VDu/jCcNgEi18VxHqCMcCNMUQ=; b=F0q4pdSN9HuTiDc0
	D9jOuTNl5yRWdMYYT8cY0iY/mUjpTHQv5C7qpAf9gYcESLlOGCdZoML/xK0OxVMk
	jCbn4EtkT54w4bwgNKhsJMcl12b4kwp5mXFST+Xq1e0Z+pfg8vHC7NwqnwTnk0kE
	3cfB71AbdrgKlWuRAac+qdmvy6RgxKrVU9Yvd9Gh0pJXk6zqteXG+XvgksvAAXI5
	jSj3QX3OLvfzc1icrdfjTsWRUWaR29tAh4XziFAqq+xmGIiztnDiufFr4oOH2lJQ
	RjaAidrWbs6yCLCbc8+dEnVjSbUWNnvPTWU9Szz3gKWahOS5D/KS9cQ/HA3p/+qZ
	UXJs7w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3v380ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 09:24:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1eb52e1fso35951261cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 02:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785403457; x=1786008257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2iQygbMBEDEjFcsu6VDu/jCcNgEi18VxHqCMcCNMUQ=;
        b=Y6osqVCiYqwD3HrSBiL2pNgXB49WumMnmw1sPz6EM3lreL0peYAwWjfnH0VZXuhUmF
         q5ST96x9QLRHz+i651C1uhC398OejTmG7gvx2sdh/iZlJLow6T3IfYhbp0H05I5W6RZy
         PI/r0WEgnBRiyWRPYgyCaZHaGBFqoRtzd7cjs5hc4091lpGKbsLGLSTQAJEWYyqPa9Ol
         iivS20x7wUSqZ4YHIJndqUqXWwzYk+lzc+sP57WZg0vo7CLq4HD4hxfyH/6uafKHcRJk
         ckBtJlfPw3IP3jxtASX3eF7DA7ePqN8O+zS1OkYzAzN2R8egR+rpAzhYnparrudBQmHK
         dDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403457; x=1786008257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2iQygbMBEDEjFcsu6VDu/jCcNgEi18VxHqCMcCNMUQ=;
        b=GGNb1spvTFpgIGwGFNEpEuvEoM9+VfOeKkLMgSrvrdiP7ab4lHP9Ih6yx4j2RV612G
         I+2HmRsXiP262k5nI0DNp6ttTwKVayXfq7dwP/F/UMHF6BeRsb/K1Z6dRwTx7pdNEpFE
         otNBtAvhFSAJlZoOOwU53winNwVD5aMnzyZhPUrK/chuMEz+p8UdpJdQOVW6a2HrM6Vt
         qNgrPPa/2hlBvn7dEUZp4sKsGiNHqab1D+t+0DnPCK3QigD+wNVNt0BWqWmcqRy7eJ6v
         bFT2saeOdRGfUtK9SBvrj3TALOFVpSk/6UPSI19NYl6vOTDm335hcBrhLrp9kG6sZc4k
         vygA==
X-Forwarded-Encrypted: i=1; AHgh+RqtmATnSqc+2+3NqMy4rOcviONz5usIAoCL0evpHi2pa5U+nmblTr6k49uu2Rc3sFyybahZk0H/Bv+YCtSo@vger.kernel.org
X-Gm-Message-State: AOJu0YxMNbB+LZAsGKUzGlwrFNH8rmTV0ENazPV27vd+9Rmc5ieIIVsd
	md/goJZRrLbhtddIx8RsmEZtGbluu2g2WiL0uS0HE9d0pMI5PXEY0N5QEXf0YulHaAz7uwFItwb
	KAfzrZ+YB08A4YXmF4HN7eshmI9UVVFshbsg9ZIJQA/gAJpuQ2jxiM9HN1MgLpmAe0Dd8w3o9z4
	oa
X-Gm-Gg: AR+sD11pG2wtHxiM8AaQ1fTPLaurH0ZmDP1eP15rWIpWgjkuv+aR/B0koR3YDAHrlC+
	2ZECOESwDTyT5kv9VXSe2ZBETWsNBReVVRFyywSwFvrkuJ/zRQU2lacSEY2gSUJcSowaUrMDRx2
	hCW7UUpZ1Y4O6pN/v8DWweKe8ye9d0/r2c62SXYnYsFOybxoPLa4/nyPUMftG+rhr+1JwtEyZ+F
	OIy3+aUVF32G41ePsmurtMdfTcdphZL3NPgAd8tGJNT5JwWcMv4K3f/XWO0yFINt9+sdLUe+6ae
	9ENgG73X8zEui+YAxGHd0peGjHdSIwfxCgvdeaGVWd9C3DV5p7G12bVM8G6Neh1aAhFZWBNW2B6
	NGYPb2cnJBYLmwzB61d/4V1wTl3sZn589KcxYtedEMNJ12NlGne0tAF5Iur0X5ioDcCACp8hWls
	jd+6Ac5xcjJe+zQr0fq3+ZebmJ/aMreS3Rkj+R8PPp8TecgTeckzep
X-Received: by 2002:a05:622a:551a:b0:51a:8c86:bd3c with SMTP id d75a77b69052e-52b38673fc6mr19454691cf.57.1785403457016;
        Thu, 30 Jul 2026 02:24:17 -0700 (PDT)
X-Received: by 2002:a05:622a:551a:b0:51a:8c86:bd3c with SMTP id d75a77b69052e-52b38673fc6mr19454531cf.57.1785403456601;
        Thu, 30 Jul 2026 02:24:16 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d3831basm411483a12.15.2026.07.30.02.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:24:15 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:24:11 +0200
Subject: [PATCH v3 3/4] media: qcom: camss: Drop top_ahb/ahb/axi from
 QCM2290 subdevice clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-camss-version-v3-3-74a87302dd9f@oss.qualcomm.com>
References: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
In-Reply-To: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 4tgekBT9KkNXKg_BWH7iKePh6jYzRLWu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfXxEKsv2kewesN
 shtDs3wTa5kbB0u/0cj8/Bq9nd0ma2YdmZA/4kpBr1Gm4nQOBUDjMj2EztsRIl1OqbTl07IRC9W
 ik1JejWjroLLIC2LnGkmze7NwEDQhM0=
X-Authority-Analysis: v=2.4 cv=bZlbluPB c=1 sm=1 tr=0 ts=6a6b1842 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=RNuhJxbiNEtIex8kAdYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX93ZjtlQjAzTE
 /1l5JkbFCv+8pCGfuXralpgUe/SvD7MDqZ0tLZWgxfUTKtXasAEiv8S/ufboQiCXJ1t4Lz9OmaL
 9Srx2FMrOTGEP8+RwWRWix4BzPI0UnhWRiU0NvVnn7MW373jaoK80XsEEyHG2bOx6y7S0KIRDRR
 Wg6tt52SAcpcEaPA3gcK2olge/v/j0+/ByhtGUZQrDfCz3Z6nZ4vktUO9tW4wtHTklPpMcabu5g
 mQZdUxnzL8jKQt0nK3bNu95AZ1GHltZayOMMO6g07slEvN6vJg3JNazVJiPAvmj4PbspX2/fJ8J
 2g/adS8XVA4qntXtnBUzp/juha9djTq2ucAS0lHavLoD0kHyzSepvxMwufKv/qFhm1S6AXzhqi9
 bYQ6xAA/GCVyToa6skid/D6Kgq1a8sopD2bUd56TEepbQbAxwrC0O3Re11VhhWIMbEZeIxMquab
 e7E9n4eyhexCPOOYEww==
X-Proofpoint-GUID: 4tgekBT9KkNXKg_BWH7iKePh6jYzRLWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300069

Remove the top_ahb, ahb and axi clocks from QCM2290 subdevice clock
lists. These clocks are now handled centrally as global CAMSS PM clocks
and are automatically enabled when CAMSS is runtime resumed.

This avoids redundant clock references in individual subdevices and
ensures consistent clock management across the CAMSS pipeline.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 38 ++++++++++---------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 7e755184b3c67573752c9d6f21d4436143b3701c..2301aa3868d26692c0c67034ebccac2a4f9abc4a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -688,10 +688,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
 			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
 		},
-		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 240000000, 341330000, 384000000 },
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
@@ -708,10 +706,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
 			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
 		},
-		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 240000000, 341330000, 384000000 },
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
@@ -727,10 +723,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 192000000, 240000000, 384000000, 426400000 },
+		.clock = { "csi0", "vfe0_cphy_rx", "vfe0" },
+		.clock_rate = { { 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
@@ -745,10 +739,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 192000000, 240000000, 384000000, 426400000 },
+		.clock = { "csi1", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = { { 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
@@ -765,11 +757,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
-				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+		.clock = { "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },
 		.reg = { "vfe0" },
@@ -785,11 +774,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
-				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+		.clock = { "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },
 		.reg = { "vfe1" },

-- 
2.34.1

