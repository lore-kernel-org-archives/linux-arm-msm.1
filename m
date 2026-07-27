Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF7440A92F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156717; cv=none; b=ENeVJOCeI3W/o9yyUpY+ptvGojnD6KkwHpansewDbChIB54a2iw8cI2Kj9O7rEO53aF296HDOydYsHJ2NLORrm80gYjeT9lzoUlJ49tHNuOHc2PZYnowJGpgsii7j0SgvVOJQV5XdtoEQ4Bs5Oz7irWWTL/Z4akR/CcpP85VyrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156717; c=relaxed/simple;
	bh=xKkW8JkAQ1Vhl3TZIzNa8+ozFoj7WCUtudLFKvNQfj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BeHWzCHm7g8l02TNe6y6sakX3wy3Kjidefv4hS+HeJMni5ioYRUEp4qgrBMQ8GQ0B4DzK7bzr+ib6VbH7/y6ACsAiRuzMc+TahCj5teF9YBB4ykCj9oQij0Cb0lZBellYtrWlUfWxBDZZ6vVHOFkXIIprWEDenFS4/N3Dhwd16Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h+88sDt0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvNG6o6v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h+88sDt0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvNG6o6v"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAMDXU3604275
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=; b=h+88sDt0aquIG0eM
	yMvveWmrKbg6SKiyLfDu/fRzlJSaWAoIgGrCqmOuxHh12vogi088v83Exj4uNM0J
	13CS/bCpCHnF2UZwjgdqGkTl0Bae+9+o2lYNatHQRilMJQLJDXSAeeP/DEAUNSmk
	orNcxhE0jAsaRqgSevXJ7obZIh8A9kEOQSm0eNg2Clkpk1oT/oPu6QDJEWfrRHgG
	Qx2YQMqpgxugMF2N/VsVGZ9Z+7Uq1t7Rx87p04fxQHjkUEIkXs99uJyIUzgCQgiS
	MhQ8B9O9NKn4fN0AFuXx1Jzd+zgX9yOOXQLXgQ4iq6GbPAk3KGLSuTZBkb3I5R1X
	RdZLog==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngysugx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:51:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso4706912a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785156714; x=1785761514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=;
        b=WvNG6o6vv26WCWX1xjDaLoiAgmBnyu0rQDDBipNYu9S7XeRwk98jxVGfESA2Exr/5i
         pG2HvNANx/As7R97wq/8h9d7EzZqvTjM17uqPMdwUIodN4KXHIwl9UNBEyX1fTC+fsWa
         vym+VCktKijJleSjhPf/2PMZlZaOy1uKsQF4zI2vYCvHYDgcynzHofHLFqesF8ejqG7T
         krisNg6mADmnGvYFLkywQGJ0Kt5W4QDZEg6es1OPS34scsuMWJyDHFZEe+1liMD4Uo3h
         BX0DfJRM76TbhlFiMwlz+I7PBHVI6Bu8gDCk9xQzUSUTcIrUzN2wIiPPvZtVBdQUMByH
         I1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156714; x=1785761514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ht5fvyfbePHEIlm/98arjAMGkHBafuoSDc2M14Bf44I=;
        b=pQk6v6+/sTFEmHEGB2E+ytn9c6JfqfftQ1u791NNL9jh10YEtv3if3PgiG6utrEz8n
         Q83OMx3BlyxRvk4ElmxHFq9MahxxdmYwpQp2u4+faHdkGpGYkpiJ87h2SlQDMTsGo3IB
         bPjzZ/t2nFvYYmGDw42z5zqNm/hjEs8lrIHR9uRLpvoyUKwEjZCrQ19xCSZrozkfawBw
         BxfBLVR+7RlxCtVum3zwf5Pd9Xfgt/t3b+RpXdme+rFiioLFpJOsyjgEbMClA5ecIQ8C
         SF3mKVLiie/pkOJBmiRwUDwicXSwxPlNRUa12afyKcd29V210DxWCXF2vkzZMbOfaVrV
         2iSA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9zSZtyux6QtS626ZZVX+Oyyf0oaVApegddZPmuSYchDT/ocjI+bkc+SQ2CirWs+VZpYxbSjBqa2gGK44B@vger.kernel.org
X-Gm-Message-State: AOJu0YxpvECdR5gjLZCmw5qZ2aDf+CUsoI2o05ru/TKGU5DmKxnVICDq
	C/J3/mv1kyI7Mbqjn1VB/0maSOiM+FQCRhdFALZub/QZXttkbNW8s/DRrOsgAH+MolT7XyyfBcf
	Y53WWumnpgVR36Y7dOGuCilMK6iygNRGdiWOyQtRsST+ubARA9eTzoUT/K/GW0tY7OyDS
X-Gm-Gg: AR+sD12H7bQ3KFpuVnC9OV63qfXgyN6ZmSuPzx2Eh8vJkglVLrUTOzVQFKhsQ0q0JH3
	3R/r8FyGd+5ViYyvu8IXfIr5Y4sT0Yud4McAj0XqVBBsPK4DWzrpbOyeJc8a+6AN9sgL+tgavLG
	35a2r4TwUBrW6Ysa1gsEZkeHGJjHWZnqX3IFPH+DNUbh3w28qlUWybCj+qSIdYRJ1ATayjW4XmJ
	JXfOh5VXForjw0rosbHbgiZHluu/lE2UcPaWeGm9v3IxnuLYDQFndNAY+9vPtvHzKLDyCx+R107
	xZ2eoQVEHiZO+ZDEeulFG+1ZZGPi+TFRKv0paG5rOehFmt8/AkHjLeZ78fpXdJDTf+vWwOMchqE
	0RDwF1eDJ33CRiJhe1DSswTJai7WBmaEYu5ffGEbGOJlm8sfnJqRqROtJZWpisw1f
X-Received: by 2002:a17:90b:3d4d:b0:38d:f710:63f0 with SMTP id 98e67ed59e1d1-38f298a4c6amr7268500a91.43.1785156713883;
        Mon, 27 Jul 2026 05:51:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3d4d:b0:38d:f710:63f0 with SMTP id 98e67ed59e1d1-38f298a4c6amr7268470a91.43.1785156713468;
        Mon, 27 Jul 2026 05:51:53 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e878esm32263425eec.3.2026.07.27.05.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 05:51:53 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 05:51:42 -0700
Subject: [PATCH v3 5/5] soc: qcom: ubwc: Add Kalambo UBWC config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-b4-kalambo-crd-v3-5-25280faceece@oss.qualcomm.com>
References: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
In-Reply-To: <20260727-b4-kalambo-crd-v3-0-25280faceece@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785156707; l=1205;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=xKkW8JkAQ1Vhl3TZIzNa8+ozFoj7WCUtudLFKvNQfj0=;
 b=dD589cveu5MMfr6VCcV6+v8cFQ4j/zyZWsE/fClsyNuObjtpPQOEKIlnJbX7gnHiBzLsDMp6k
 y9NmyeWwfZVDzvzllKlaoGvq8WGqL9VYq1PEhTrKKGprFf7cUwDlMdF
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfX2G1lu0cZ/Vq7
 vxiEGtTo/WS3RDQE31G5ymYgibwwVAua7/mKgT1mvEN9bXJPLWALKih90zbfE1lKcrQ7w7wSujy
 5ogcM1VPWbSxzhlC9hS38tP53BSMJDHfNv16pEaIndro2GuyUVbEWpFaR4lpiGs1EOJyfZyrlSU
 47hCFiFlzIHG72/okgDjXf0ogyyZ9KN8I2OzT6PWLKvEp88b+KZuvQqLvVQ2Di32kntcCI+ZE2S
 2/Hh02ic8UtrSMR9k/TPYBmhx5rQK1qZIoc2oNOfCOvqBPMyxIoTic5dF2MtCDRI9DyJcpQMhPz
 YrZAOt6CR3zwk7k3PmRXiOjVYdj7dh+ukJqARX2ScOz9VoRxYSx8CrI+CKCXxjXEuHw0kx0fRt4
 WK66aq+ij3jklnwVmR345E1wV8S0eAl0gADebmqfFnf51ZP56mElOlsp7pHXc5eegh/WqDhQOZC
 TtaEzbXhOdPP1+lVPXg==
X-Proofpoint-GUID: SUxKa9oRueKb8c_WJiLTPsdbCLzFEipQ
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a67546a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vwhQhcXuLYmSI6hVBhoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEyNSBTYWx0ZWRfXzu7oQCxvFtPp
 eUKs+JMo4ETTrJELmcBdvJjPaIY66NVdLL0zKIQ+lDDulNuzPiCK1pWvsou2Z+PmRpM5B3/4Msu
 50Yoo9NiBwwivjsjdjNpOoDV8rEnGCQ=
X-Proofpoint-ORIG-GUID: SUxKa9oRueKb8c_WJiLTPsdbCLzFEipQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270125

Qualcomm Kalambo is a derivative of the Mahua SoC and shares the same
Universal Bandwidth Compression (UBWC) configuration. Add the Kalambo
compatible to the UBWC configuration table to enable support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 0209a02c390f..c5f79210ad52 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -112,6 +112,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,eliza", .data = &ubwc_5_0_hbb15 },
 	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
+	{ .compatible = "qcom,kalambo", .data = &glymur_data },
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
 	{ .compatible = "qcom,milos", .data = &milos_data },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },

-- 
2.34.1

