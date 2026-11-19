Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100685;
	b=2PXnriztRz9CnjRgY/S0PZkn3ke6sgLEMuFS7d20fxX1+75Z2qcHtLwENZblBeVkSBGC
	 Uq4NG/SG3jk5kR/pgRornb4tl9OoIe+LEYL/MhPhCn3ZpHg+FXTkA4KP/gaOZMQBP4yep
	 VIZn1j5Ub1ls3OMfMl2Ew1f9jLscNV4a+2aiW4sG5SgcgzM0lZAJNU5GWpSBlcjtwuTD6
	 +l8VYc3cQr7p8Nk/a9pnrS+CQkF2dEGcY/dCnIukY6tCDbA4iKweZhLd9RbfO0k89/VDz
	 /q8NQ48fKUEr95kUd20D7Ing8zxOUXz3dYWj4ZzA0qpay5dVAqGyaWD/DQ3aoMLkHYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100685;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GYoBHJLEPKsHZjKwmP7sCEveyjRtmqDJjB/uuqAFQ5M=;
	b=MJ1BqkkAMEfwzfIJW17TDjdrEnYkyvKSuL63xaiqimvWSfCogQtPEu49HsSLd0P3vo6A
	 0INA3ZMhJmd2ChPiSAYotlMMzzl4NEKkmTP4Rdi9pgf3j3hHRrw5DRYDdi9lSC3dMUyYX
	 oLk00EmhoFMFWgH24Qxbh/bnivDFViqH+QePFEJv1AUDIr/ChS7NyiVVqSEJx5cJolVs/
	 HI15MMe3v0sxzfHi38Qlw5JUkPc8pi3iTboAzDxRBObeU/LD+4CkjSXh2/NpAqgjItLGV
	 Eurd/ycq8IRZCHc7bTKV7Up7OEd2eXSk0kafsxsKAC8NvjpxdK6SqDJDe7Sb2QxPHqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FKRGeEQx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xrk29Q9c;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FB3606A32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 15:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01FB3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FKRGeEQx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xrk29Q9c
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBkiFo2685286
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 15:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GYoBHJLEPKsHZjKwmP7sCEveyjRtmqDJjB/uuqAFQ5M=; b=FKRGeEQxxoyiPLwr
	oKUnr/JO3wtKMD7WcQixlIjRf5BhFHQ/bh/iVzVycqa/Uws/ozddi362VlGll1W8
	EK6Zm3DVE8MqxoQ4V9Pl0ej5Pk7idDc4FJSI4qsqYEUdR2IouHEKWOqH+ot5MhJT
	ypMet51C6CFlTPOowJTag0G6Uj6hmQ4WUeRiuFhSYgfv7UlanlMv4TcNck9JADFi
	6aZnO+45NB9bst9Id5N98drzQQnbF0xcukw41MloGrkLw3fyjlxc7O6nKshIPoP5
	kUmQqTSApDOK8leKN5eEgrJVkQZHbKjVBxXTlsFPcWgYxT+Qzh/8cmFx23euObnk
	QCmjxQ==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j20gu8rfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 15:04:43 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b4bfc0b441so34118297b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795100683; x=1795705483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GYoBHJLEPKsHZjKwmP7sCEveyjRtmqDJjB/uuqAFQ5M=;
        b=Xrk29Q9cpbi054+SAF14NrsqjzvIbu/DzG2XzGOsDnhfCOgxGXXwioPm+2x3nq5P5K
         hMg6tv6HFmRyHWs5PPJYoeCMMi3L3lVCNg7gph8Xw6dlter45363x9w/Eyt7O59nF4qx
         mBihbkXsvXv+O8Sui73u5SzE4WTI4Dr/D95wtyZtQ8DB0E6Gev67snFaOUNLMhVWa6nm
         3hofuLL1KNY1UiMxfmXnFGLYFJvK7ghp5s+wOaXVm09Jdo2JrjDdaek7uuV0en8TYhxb
         tf6qddViIUj1TvLYUHyGHXXuMGD5g7KHKDVbjqVPfqigbSTVQojP+2wccFw0I3/B51yy
         Sh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100683; x=1795705483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GYoBHJLEPKsHZjKwmP7sCEveyjRtmqDJjB/uuqAFQ5M=;
        b=ABtE88HTyswUU/Em5/b2b9fRyf30BLsIXQVgAXXOdQPXaHK0rAmORQWhrkfnpjmXYG
         HqJL6FxvfKe+6THnAGju2yRc9G1Njxjm2XHcIds64pFCIT8JB02Yrre66ZEN6cWvPu3k
         0DxmnaLUQH7t+NiYTP5iTFdJbvHTE+oVmScKpnGL4/fHufrVlrzWkFTAia0ssxDzeUdd
         oM+fywCaSU07BigJ4MCCVWJwJA21ERYqV3SHw4MdsKYJjIxSyRwluMMslHX/6gtySpOh
         8Utmy0kKwOGE90OnJJlKXBIGBY+qoseDNYTk82+FOtQpfjFs1Sv1Co3JWdiZIhXOAjOA
         WaUQ==
X-Gm-Message-State: APuU4Z8JFHOjObPdRzmauClzqvkOC/YqXK+8p+1YmEG3vUIJ1oZ0zGVs
	eBmKB+nF9HkddXp9zmJO6BR4cPIoVx/Flka+lfFzb3e9RTlE0z4kT+/dVr8o/Z0rD0S3RXJgwSb
	gTjcrbmsQ06ogMcGLcW0mNOT0jClYEAi/Gxw7OGRmlIeVB6h3Nw36Xuiy0eoD+VftKlBNYGOzPD
	jw
X-Gm-Gg: AZFdTZcTa2YFmzefybi4fQB12C/vK3IlgkKfpcnnsERgwqGDdCJ0ssZ11+XftioH1o5
	c6neEVPabkvTzO3XqUQOn1SucV4wWdN1YD+icXIFVJL7/g662wFEBBsz0WNZ5Y2hS9Cxf1LIrSS
	m0xloW3ye+dQgvjrwg4mgtqks/4kUH65+4Gq58TPHgumb15GkAJbtocWjJ26PeLZKiN9A6SHPR+
	lBhBDLE+ZrAwXmGfFSXO2GMBqGDYf8vtSLmTzr2hXqgvS2YY61kOKJ/2n/KRqWXELQmOZ8gZTtW
	YdNdDpEkyurIxKcDyIg3VkmhKsQ8gzDM+TvtRE7K+rCARmcJOfSkde234/gMDLyYrC+dP2Shhc6
	8bJLEyZyhJsx2QD/Ggia+tWNZP45X6Su/PGDx6TQsMqr/C7oF/g4Mxr2JODFiC9J7GQJ6P4Qtub
	68L+nt
X-Received: by 2002:a05:690e:4505:10b0:67d:ba3f:a9a8 with SMTP id 956f58d0204a3-67dd3f19d44mr1681204d50.17.1795100683200;
        Thu, 19 Nov 2026 07:04:43 -0800 (PST)
X-Received: by 2002:a05:690e:4505:10b0:67d:ba3f:a9a8 with SMTP id 956f58d0204a3-67dd3f19d44mr1681168d50.17.1795100682589;
        Thu, 19 Nov 2026 07:04:42 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33d64a0sm79790d50.22.2026.11.19.07.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:04:42 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 20:34:23 +0530
Subject: [PATCH v3 2/2] media: qcom: camss: Add Glymur-specific resources
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
Message-Id: <20261119-glymur_camss-v3-2-71ab966c41c9@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
In-Reply-To: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795100665; l=3001;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=LkKU/5caJ33b9m9zssUcTUTSHeMK5b7phJlOZN55tHI=;
 b=aFDUgvoA8JY42DYFSM99ia+Ajfy0myvu6U4a+MGw8di9+q9zhdvq4+AIVa9W6i95YWxizgQO0
 RCfrimVm8Y2CMuovQkrWQpRorb6vHhYs1EmcQE7YLSj0+BjVVcHcdbI
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfX3DmqMGb9D5ex
 Tj2EaVz+BOlfnseVGC6/dhEp1l0KVqigmBhK91rM7G/GdWk2VY1hbi3lR1l2SZ54UpUjFTTY5Oa
 sANsYJXet6mV0BRMpY8tLOc+nDDc9gE=
X-Proofpoint-ORIG-GUID: L0_kfmnWrdajboOYt4BACi_C7fG4Ue_S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfX+C0UqVxMtovN
 0hXx3PyxlWGmcUQ/L+52JG3dEQZmTxwpGBEaacqfzyWwBxvI+o8n33iAuK0iibtOdvXq5Dq1h+B
 al5Q80OiMa8RGJR0SA3sf1HbZZQtic8F30t4Gh3TO2ZNjn/7AWsvBztqbNPIWA7ko7dz4Wir/k1
 Fjk38cuSidSMZVLU2w2JwjmuvcIQ17hcPItfTYbR8c2tOQn1thwIRIgAK5JNk9UbjjR3GAGQIri
 KWq1gblmCYhWo0r1KKZ9DkY3ifH70Y2djrqDiyi4VlJpgAwCcUjw7Owrsrw6kp/TroorsOtOK8u
 CTtipB/dFNalKKyiow24IgQB5r514CZWx13nCAZhjKIY9z86aMw9afb2fnwk2ZOqKyLxYIF/hje
 /nRrkbzU+GBVc7W1ErAU9uOOrfjaa3ZJOA204WexaHnvmTm53RItJE20XN6MhwapdMNTHPlqFPZ
 gXPeHDzxr0tNNpoZCuA==
X-Proofpoint-GUID: L0_kfmnWrdajboOYt4BACi_C7fG4Ue_S
X-Authority-Analysis: v=2.4 cv=XutvqlF9 c=1 sm=1 tr=0 ts=6aff100b cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kynvpes75VyIlZD-ELwA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190059

Glymur previously reused the X1E80100 CAMSS resources, where port@3
selected CSIPHY4 through x1e80100 csiphy_res[3].csiphy.id.

Add Glymur-specific CSIPHY resources so ports 0, 1 and 2 map to hardware
PHY ids 0, 1 and 4. The remaining CAMSS resources continue to reuse the
X1E80100 CAMSS resources.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 42 ++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..f3cab9ecef04273e09b81ee0cd4e31ca45d1c915 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4103,6 +4103,30 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_glymur[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.csiphy = {
+			.id = 1,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
@@ -5572,6 +5596,22 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources glymur_resources = {
+	.version = CAMSS_X1E80100,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_glymur,
+	.tpg_res = tpg_res_x1e80100,
+	.csid_res = csid_res_x1e80100,
+	.vfe_res = vfe_res_x1e80100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_x1e80100,
+	.icc_path_num = ARRAY_SIZE(icc_res_x1e80100),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_glymur),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1e80100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5806,6 +5846,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,glymur-camss", .data = &glymur_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
@@ -5824,7 +5865,6 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
-	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
 

-- 
2.34.1

