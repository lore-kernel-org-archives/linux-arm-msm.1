Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70304383C77
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784376396; cv=none; b=aYvtm+QJi1kydxXljxUan4CgDRG8BEJWVz5MEZfR1Xb43bdDsKTey/znxUfom75FwJVeBCMOYNLCp9rsu781iH6Gz3pZJOuQviWpiJeErg6aLBZHP6wzABFdhONkuVS97nCLIjiSjAzkNQ1qmXpeGnwTCQnJj5dUZ3Cm6Q7AzvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784376396; c=relaxed/simple;
	bh=hwbEZ61VnK2nKsRjLCEmewXTb0y3Wzi0UBMhIY7quxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IxONA9pLuTmcFxLxWyEntMFnEEan+noS3PNoqD9bx8qzovNZah90uZK3XQSJMOYaioeT8yXWOyQPXF0tsODHbdrzuvl84T9wGqzRyPpyeYGN3OC4pBRSr/4R63XtP9T0xUqDX+AwWvI6DQj6w9kjza71Kx6NLfuiAaA6X4IiWsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ENRdstDc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIcic67P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ENRdstDc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DIcic67P"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHGZX178546
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jZWSsCvgKiuo+AJo54olYSKNAIZtjfGBfdSkV0cJL70=; b=ENRdstDcF+MXDYqo
	4/dfDGO6Ee0kpLWggE50hoYukMBjYjFfakv5Ym+RXiYybtVrCP7tgB8PjoGcuixv
	2GYrDfqOoey3MCum4j84poymRAhEVzruFq4f7QPHHeKjWhZfbOAUHJzKCNuGlPqn
	+i35HUdf6GbxcdGNJzgaVyXQTGr8BfAzikDB/Zriv+4WPne+CjDbXkWoQLzc7iis
	kW+xSsDNVFym+r5qnTRQ8N4vRcRI99KTwiQhMpDcrq9n3DeP4Z1gfs0JmNzx7DtN
	fp4uzjn3wvtCLtE2h/JttnJ82v80qmaa5zRxZxvHb+ZluoUzZ2M0GC4Er/LIEH0v
	sTmkZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7rmty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee894b3d8so96246625ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 05:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784376390; x=1784981190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZWSsCvgKiuo+AJo54olYSKNAIZtjfGBfdSkV0cJL70=;
        b=DIcic67PQF/tjH3yEkUdT0Fd33CRIb4zQUYWX7dBRyZX5z/w7osrM99l/WFhESbDLa
         XihyjOy1xQO9A8WnZG2MLIAKD1sK2QMCW5LDyyPPbY2bbpxx2OrNmkK/eTh08eVcq3lb
         0nfQbblDGgJOkWwAKQdbprPBfvi/W4n6djRLOBdYfO/A0xKE7NFH3GP4Ilsw3nWTKV5b
         lgeuALqi5STNqmGvs/WnxqZ7SoQ3qKeFmsQGZR2hH9WvMMRGkmQZ7Mk9b/9IKOFDUYbx
         1192TpeHkvbc8QywId/xUg+TS5bLrR0B6kFAomPp9WdQGJ7IhXVCLP8k7AfL89rh5f9P
         5jrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784376390; x=1784981190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZWSsCvgKiuo+AJo54olYSKNAIZtjfGBfdSkV0cJL70=;
        b=Yr+12TesJSwlwvXlFEF7UEkiT796UYeN8RLl5RiiU47Xsp8u+xK/MwCaeoTOGxaUC1
         STw9ANT0rlYIBweSASSx3ZNsuQyKWHGvGnXrf93sRflwOunjf1FSd+adB7E46DEHxRCp
         v/Sq5Otkgt3h24taR6rOY/QvXXnREo5EnsfAFUKCkOccd0G81momFMqXv3ITiiJmx1fC
         VXu+teuXwewZLcIJWuNPJ/qsHjP80ksVpCrFeUo7hHH0eHWEy8ml3incAKryqzY+f+oR
         3p5it3BekxNYcO0tUJhdJG5OCLa3APD6DTaf0jakN2GM7V28JvDTZ9/ujaTb8jifRx83
         4xIA==
X-Forwarded-Encrypted: i=1; AHgh+Roa2CKPCntdrdvq/qr9fsk6DrDIHyk0+9fHfYvMah6HfEXJbrQhENqVp29BM32SCgHFtyid6lahimfwccqJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzbmCZ5vd4jnO4A7zMs3Ji6BnFWUqGKrXCzWl+xsMTjmOEluLRM
	QFyEVALqy7C4SlBlcqVsdY9ryAS0xYI8laxkFKD9dliC5yYzKTU7yKWqe6SUIoi6cQePCZgSjDv
	OMtJw9v6lPCtgMoLywEUVFVOuf9jU3ivCLLNne1E9kh+h9gUOhv6RIPI3ETvvJ9Os9+Q8
X-Gm-Gg: AfdE7cnDZbpjCe4OkE6UvnTZLxFzC6UfDoEv5iVcH/Sh/YXed5nSMhZqVNB8j3O4TcD
	f8Qd2+g3hX6e4ykt/8FfMLZcEOTCRcjLIcn/hNoKYopG4ee5maSIvqWXsBbPOnPe8jwFoxeI4Au
	0d6ysxyNyS63Gn0ukowpDz+9xQ+RzTkexrEAtF8KSeEe4Xug+6YhlLrR7cc/7CoPRYq7KfpP6SE
	Q+AxeQucY4Q73yPu4XY3CO5vvZ6c+Q3Do8niXZX0sBWBlhxaXWCzjRREGo7r42zFvIl4mrftNSM
	XsRqSJXyPVrZC5ih5sX1+Rg2HHn2+Dlx/6FNUtHQNFQ9rXe4v9wx22ueSOdLGTU9rJiSrtE3u2Z
	yg4S6ABsIiloHfRtthXQg913hG2Hovh+5i3eay5zkZDvhDpOut8XWciV2PN/EnCKU
X-Received: by 2002:a05:6a20:4303:b0:3c3:92aa:4302 with SMTP id adf61e73a8af0-3c3adab4e3bmr7238294637.70.1784376390538;
        Sat, 18 Jul 2026 05:06:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:4303:b0:3c3:92aa:4302 with SMTP id adf61e73a8af0-3c3adab4e3bmr7238247637.70.1784376390038;
        Sat, 18 Jul 2026 05:06:30 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm17666314eec.0.2026.07.18.05.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:06:29 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 05:06:25 -0700
Subject: [PATCH 5/5] soc: qcom: ubwc: Add Kalambo UBWC config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-b4-kalambo-crd-v1-5-a1069b5a2757@oss.qualcomm.com>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
In-Reply-To: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784376384; l=1077;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=hwbEZ61VnK2nKsRjLCEmewXTb0y3Wzi0UBMhIY7quxA=;
 b=g8UW8Dsic1c49ffwsKY4JRINpR2pyk3c9xaK3A6YqJK8OndCS7fTZr0RrRnPDccYjJ7EKX2RG
 d4OcWfT9DegCUw/BwkpMbVeJVaLsykRXuuVMlsFFZyV4fww4wls9icE
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX4+lSMK2JH0XQ
 AFUK3+OkK2/vOvtVgJE2FSfUlig49tBVNmpveqzlrvqD68/IiELAnuwroxAdQCV6zps0SN+I42S
 dFPwLiAg6ViOKF51y2gJh3jfTC20ys5jKmgMwCXpNSVygM4qlP3HvN+RT6q6qRRqo4o6WFfza8Z
 AVFS2UDGy2RICpV8Ay+BBqHw7oG8zNqTtsEcs+DTdJICzkPINn01Xue9mosCgfPN7EnMzt60lXs
 UBedO6Nq5IJgtA9OXdUfToXK7ZpKR55rR02RSTcZ8yyQGt5NBX2li4xLlxJ1F8yricER1t8ppvV
 A9dP9zy+7QBe9c3NtGv8MX1r67vVQYb0GQunQzBQaVzCSrs/6I0uPplPOerwjWy+fyDN9eFXR4D
 MK91KAwRBpjrIOZcvXQH8lAlkfcEmwDXIiT8WY4WmWK2nZOX32yEarHPIl0nSNVc74hffYMZwh8
 9dUJ8KAYEasBWQvzt8A==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5b6c47 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vwhQhcXuLYmSI6hVBhoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: sZxoxAlS-PfEv8N4h8ifQH4GwBGxjTPZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX+IJEBfEXsZL2
 4sN56z1lm1LjxlYZbfx0zdaHgBJ145gSWgH742OL7KSSxhb5lQImoRM01umHSBOv3TeZDbVCk2w
 6EuXcWDFlW9xQGbth7NQApC8iSCVvHA=
X-Proofpoint-GUID: sZxoxAlS-PfEv8N4h8ifQH4GwBGxjTPZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180122

Qualcomm Kalambo is a derivative of the Mahua SoC and shares the same
Universal Bandwidth Compression (UBWC) configuration. Add the Kalambo
compatible to the UBWC configuration table to enable support.

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

