Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FC03C1418
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609488; cv=none; b=L9KRtI83lEbND7iK4Xc126z+esZcKSoZPk7QUy8ksNwuhkqUNPU32THRLCEj2I4KZvUAgxzs5aY37dWyJyqmQnYSudB3HaY01NNGUH/RZhCqNJV+jy/nJVEDjqg1tY029rQnuJQJm5MoFjLAuNdq/rrv2/erl5PkJ9lhAmbR2bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609488; c=relaxed/simple;
	bh=pONsM4EuQsGA9NQOzxr4UZvpHxsXc7px5zY/ELNEGAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCQN6oryBeYzADYs+VvbyX1Auf+99RWNBBjZQCzs7dd8xc2+wA06PznLsdHwz2Qad4gespQf1AbVCY6OGlG2c8jDo72Ztu1C/7By1t59oMHdmTznb1/Zg64I3B4FHuhyvcySFq1IfW4qH6+pHSI+rYZmKFspOPVOFr1W9MkwnvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hs/OIS0k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnqZIaig; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hs/OIS0k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnqZIaig"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNCMe74106900
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5GVF+uRSRQ94wVrav2MQRIQW1QzzZcdjUP2/gECutMo=; b=Hs/OIS0kEtp11n1g
	s1uuSwYHKhceP67EQ+FyaXa5ixEw8bMFytBTMO1ZG0dyJGaGBVWCFnng+JbMCP75
	HnjkCjzqtTRpC8bpbry25G8UChhNmcbXzI4Vt4I12DWkoIJwjUB7vFOGUdMBUETC
	fIfmECM45AZzoZJVbzIbeD2Nr4C/VoEZxtxJPxOKYSgbFcow5g3D9FGsIkXZsPSq
	BVOWcFXUHj6sNUcRby+gy+MDRrZbWSKzTzZa6Bl6LPzvHhm66fhKMP5fTazc6Ex/
	7VDcZeB/mmWOPvlVab4shy5qvgUEba94sutC85VwsPFes5YFNTeaY8NoaRcegV+M
	OuSeHg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn94a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:51:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so5783433a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609485; x=1785214285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5GVF+uRSRQ94wVrav2MQRIQW1QzzZcdjUP2/gECutMo=;
        b=VnqZIaigTIm0x7E4192J2aRjxCkJZIMewy6WfSqX0kkwgZ5JPl3FPksngpfLwV5idG
         kqjvO7Qy/NX2RpsmnbX2Mp9qG96fyx5VNFD+vVHGV9lIII2F1fXKplzvrBecwZtnZIoM
         CV93FopvaHl1yNceu1uXndcYcPPuufpWqDvp/i/8XJ4ziMsuwIo8h/fqxvvc1BBOxddS
         dGEmkmnkk9S9SEIzKE3mW0ye/MF7e2pdp4Lf9MDBExoHhiW4CRRXBlxvVpHj7rLTS/EO
         s2fftdjN46JMALZbPIhmFxglG8n1AK+AGM+2pIIeucYETbsD4OqE8eQDGYSVCJtq1uEC
         RwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609485; x=1785214285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5GVF+uRSRQ94wVrav2MQRIQW1QzzZcdjUP2/gECutMo=;
        b=MbqKf6d/a/cI6DrrlCAdECsrTgqTBok40DHjobSWt8RuJF3derUUFAxG3V82diFW21
         8KOliKaOBwtPquJbgZ0VIll7EaEQRlI0GjgMugxtpoH8RR2rcA07yXUtlxbdukoDSlqE
         zNZo1Se9X4o5MQhxc1RR5zMNnmqmW83O3DUbFGDq8ev4DX+R0EhgHFj8xzlfSGp+mtDb
         nE1QXi8xIhdRPaiusVynKPlqFy4RfeufI8M41PMlmQSZTGxPZrZTwMEQClPz1320SLcY
         D6Kq7eOAGDAeLxMB3fD7XPgfyIa+Nr9ssUFc3GAS7EgWLi6hDH+bsle2DlTyAfDpnmGl
         K65w==
X-Gm-Message-State: AOJu0YyzjanNRQjLRMiBKMXIXuvrqVSq3ueoueG1k6nJDzpPl5hPnHHE
	o94XLs6SIynzCct2oXyi5RCk8qLh+3GscsVkl4wpWA1eZUUMwTOO9BDqiI/hSRbVxDarGF/4bVE
	CRmk6v95xgl2zkyySrLPkq3s0W0vp/BckRJpb5wIRWuU8712acaW6SD7AsEZJjTiRYxUC
X-Gm-Gg: AfdE7ckDAF+EfNjDZhBYQr30xvXfByxKwHnpvFsdyj3sq/KTsbblkHin9LIftcx8ZAM
	wjWZYu0+uAuqeHizAwrs5V9JU/d5G5ZqGsFf8s1Ovo6KDBYRF2N+ilWy3NY03l6uMQYYnCT8kfQ
	inoldXprKfMxGmHuPA4COAdqi2Tcg27LQgfJOOYglyC0DhaxjSbR/5QNezuSwUmnWKZG4FMW2cM
	Oew9ILPYmL4RqcEiW4UZr4Lscr2qQBOSky9vtPY2CzGEMOSxOmSpRp7loMVN34gcJRiRUYFwdDz
	Q8yke6Kn7aRPYhO/oGYoLgZq6nn3p2jxw/YdMx/djsxJpXCtyE1GBdp5PNViny300PJoQ0urAry
	nkxSuHrGCj05723zJksspiXGa5aeFsCMbt4cXK4FeqCkWQO/xmng/yOQ=
X-Received: by 2002:a05:6a21:3981:b0:3c0:adec:b3bd with SMTP id adf61e73a8af0-3c3ad9646afmr19057425637.49.1784609485275;
        Mon, 20 Jul 2026 21:51:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:3981:b0:3c0:adec:b3bd with SMTP id adf61e73a8af0-3c3ad9646afmr19057408637.49.1784609484821;
        Mon, 20 Jul 2026 21:51:24 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2ddfb35sm37963183c88.14.2026.07.20.21.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:51:23 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:50:36 -0700
Subject: [PATCH v15 3/8] media: qcom: camss: Add Kaanapali compatible camss
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kaanapali-camss-v15-3-c0b1c1167c5d@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
In-Reply-To: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfX6aN+M1LPlXyz
 e1Brr0ruuP0go9nU/Iinh6yDoZhDf3mw2AUJtAfXUIXS0no+COfLimz57Ds+4pVMwNGFu1+5Q+f
 oCX/b6P1ZMXeOJ8VxGZhc/U4FCqNh2FrHPD6s8xw1VijNg7xyqW3NI0mDwFNlVDe0B0g5UIlYeR
 ipvqhSzzRw1lyzEg8blIBh3uV4LbsfJRCKBcbJl94Jz7QBrtzhbzn/FjgyG4LKrKjntFyifRrfO
 B7bjwnaarKnUcxOOlLFvASU5FyH4TsqcDqW/xhRm5fQ8Xu8P5Lq3sK8la/prijKmSKWQEFAceCF
 Dz7HMmdL7jWzAZpjhkAY/FeGImQ2YjDwRbpl0Lm0umRWfljshCum/fkCVpAzTToFNjtqJ3nv0Du
 2UbRTOMx391W9RazzSRL6D6NWrur9UNfmMuAwpMnyGIh8hgMmXBRc/pPryEhaX+MDzZ+7Zn+3IR
 p8H4O1LqHjBNXt80nZg==
X-Proofpoint-ORIG-GUID: MB0x-tq525z4lCCzIh8l1IGxOJOYM7r-
X-Proofpoint-GUID: MB0x-tq525z4lCCzIh8l1IGxOJOYM7r-
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5efacd cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfXzC92g6nptPIC
 QrDMdN6NjO2RkA9cyVhTHm2cdtvSkhKePhcOWlJ+HcMtV1Ye2w4YSwB3ivcD3+Ew8EsmAnJj5GU
 fuQ4vpvTVK0SJJEtAn7k/1B+CyW56jo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210046

Add support for Kaanapali in the camss driver. Add high level resource
information along with the bus bandwidth votes. Module level detailed
resource information will be enumerated in the following patches of the
series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f360b2c99bf8..d41ac42919f2 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -35,6 +35,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5532,6 +5546,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.legacy_phy = true,
@@ -5781,6 +5802,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 698694d3064e..cea213dc36eb 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1

