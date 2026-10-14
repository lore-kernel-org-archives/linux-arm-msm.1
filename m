Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE9A4D0CDA
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974025; cv=none; b=nbFuTCewmGbMsHIVLcIza0B8pcjattPtmoItdvDCXloviw0aSLqhNccBqC8YkK7BXUmWbDnBunSVQh7nBNB56bVC7JBLTHXZ9WSPa/WO+ci46AvBAxDIZJwViyZOld3K5G8uMnHjDRopxK3PWmbFdZ+B+yUpLcwuJdSaIAoVGpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974025; c=relaxed/simple;
	bh=hxIjusSCBorTVqOq5RuZvSDPBIP7IUeJuk1QW4jovkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kSH6CasAGIe5tqmR7Tjw5D77+C+RfDFSGHAn+wat3Ro+5W3uE/U5/yVKrJOoROb1dEuW3x2oUPBsaL+UiDR1TYhq25qHChWu4cYjnMqgnF6O16nOTeGaEqBrg+zgO24ViOcViaxkcK2yetn6f7VkPwuce7D5XcbrRbsqoqqlmg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kAH/+4HA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDTVZXcD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kAH/+4HA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDTVZXcD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67iBG2685307
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uYOdaRlpvFiyZRi9h6nqtF0wDEGaCkKokf+siSEe6Go=; b=kAH/+4HAiNunpkmQ
	QTW4kTAfdcM5OQpSxHhwyyLB69YptJeAANXSBbpsX8ZRLCfYXYJqKZGuiDhiURp+
	LDuzZ9OdshcuIVQd9/C7hKG7MN0CaHQt3OZpp63gLHYZOPh7t33Le0XC887NoE1U
	4MpsuRoJtA7Yvb3Jx2DjG6DIp+OJq3dlsMjtMoxiyZP/3/ZWS0Dvc+IFa5A5UrTD
	QwamdLLhf1YWdV16oJw3QMQ65R+J9IH7k+Cw71pVQZcOocViE3pfBBHBe2wtUMZY
	IsgNcvRClptPAr2CXFr4/p1kFqch/IJcFefZh5l/xZTESFksP6dSaNA4tIYanoeR
	8+99cw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u1382-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:33:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so5198141a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 03:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791974019; x=1792578819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYOdaRlpvFiyZRi9h6nqtF0wDEGaCkKokf+siSEe6Go=;
        b=TDTVZXcDQXxBhCHfk0wwkbcGEHCP908vtFTzhTFYlbBE5Xr20xNEW75vCf9CrQK2ay
         /1rEaTckX2hCaySt1Q62g6GcwCQV8yDQifyMxWJ2TzCGGHrHtnxhtoDVss+kKY+CLS62
         8RDkE91ig/SlB80QPnjO+tvejIn7Pu+dYkVrtu85sryoLpQAYWljqTFLgOmuUe7THlyQ
         uqo57ZPX7XvIeO/IwzJinQY4SlOeIb4CK4cYZcupFudJPxprGnPR+6PZ6g109IPgwlq0
         4dAmvKdURLw3U6C/i8u+ybG3QHrvzTJHDz5PH8APcZ8jPCKFfV6TD1KgW/ZUPGFi5BFa
         qwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974019; x=1792578819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYOdaRlpvFiyZRi9h6nqtF0wDEGaCkKokf+siSEe6Go=;
        b=u+5rWnlidl4ejdRKHNNBDU/xnv9VaxSEEviCJyz45KPrSK+sng6izRzl3srtsEmptL
         lK4fUMTNQYJ5hdFaegq3Fr+R7NVCXvDWffF9MmExqm5uG1TMu2/FrbsrC/R1f3Xl5HOq
         jOSwDMfK0KfM5yNmZf07RgESL8SXqdqmlhmIL3msupPnAe7I+NaNtYfXc4xW6adH6zLG
         jAcYASNr7fUcXGUHrZZgvqDsoRzYLxqaaFYehLiawvRwWcOMRZOQ/bTZ+X7b7lJ3lugp
         r6WCu0LrRdrCVHtku4oHwHYDP2yIAnLJRgKUBfQwL81N/qPGu7oW3mw8T8CQJuV8jthg
         IdEA==
X-Gm-Message-State: AFq9FYL02ZQO+SWA0r4eQWdQQBVdbrPQUw4/QJxsvzg+CM7MX/cpZDnL
	LCqLciN0UtGDLXyQzAzEfnJ0Mx2hCDFXbysXzAB904T/hXFVT7kuk4LxUAqnXt3RzjueDmO4gwH
	AvO8z7+JYGT3vW44du0+IWxIteoiDvWOSOhjHKuFgwp2cxmw/cz3bAVrvF24++SXYTTz7elnMGS
	Uy
X-Gm-Gg: AYBFou0BVXQpUiilKxKZlGpRHAF3meeiSqQ4E0pAabCBi8PS7ir6k0ZtpM177njVe0y
	q/t2uKJQI5P52vi7yP/eVIB/Er6sAC4jsd/RcTDkkyzPoy8j/YOh9a3zolM1irWOa13d31HDwHC
	ujbjx7a+haJbBEh1O8UWHpJMk3SC9EFsgD/zEzXInzcDtwcvzmlznF0IU9hk//jTbEG3UwZdqsT
	r3SFvcz2cTj6nFofNPSBhGdB8jjPDziRXa0T27RKTL1mzHEIM0oa+A7UAQbTXB2DUOsfgi5kpZ/
	9LMO6K7i7KAKmPI/6Kgdz6WOiw3nISO5PXUDiCZnaFx0iwTO+nc8g2aNzOvGMyjEVvfDT34e4qj
	5IBt+gSkQ3Ua2J6RZW68=
X-Received: by 2002:a17:90a:c885:b0:3ac:7c98:dda5 with SMTP id 98e67ed59e1d1-3ac7c98e242mr456425a91.51.1791974018512;
        Wed, 14 Oct 2026 03:33:38 -0700 (PDT)
X-Received: by 2002:a17:90a:c885:b0:3ac:7c98:dda5 with SMTP id 98e67ed59e1d1-3ac7c98e242mr456410a91.51.1791974018007;
        Wed, 14 Oct 2026 03:33:38 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm6822382a12.9.2026.10.14.03.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:37 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:01 +0530
Subject: [PATCH v2 4/7] mfd: qcom-pm8008: Drop GPIO support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pm8010_i2c_support-v2-4-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
In-Reply-To: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973985; l=2664;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=hxIjusSCBorTVqOq5RuZvSDPBIP7IUeJuk1QW4jovkQ=;
 b=AElc/WvIvPXIUJVp0/t2t/wfMdZneAGVDMqv6c1eqg/ofRpLZRnZCcWvDZpBFXFjwNWwthwB/
 qvtaWtqShfSDU/dqcmBCTSGlT4kRgk90gPSK8IDpPe0RlysHN7nvVKc
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX4OBkYbdqe51g
 VIgNR05x7NZwDwHEmCak3Zn7Z7CeSCCSELKDVA4ZcyknwEWW1EEkl6HRuULe1duYsd004asaLVI
 SHY+N2apZgndvky2aoClTCHf1WLVu4o=
X-Proofpoint-GUID: UosH3ZQL51D7YaGMZCFXLf2fKd_FCyMl
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf5a83 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-NFQ3DzUh64S9De9z5UA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX14DNAT1J/vZp
 NjXg0Aw554A0oJ7aF/JhMa5llCEtPE6M+3XadUd2hEtAWjThuKbKpwnKulbFpo0OfS65LqDDAFE
 rYQsNEM1NsjUPyHuPyGtZ93Fxn4yPHzYQMt1V+KBz/WXJsTKrl5cV1458wpGhMoimqFpeDnicw2
 XkT0+4efM6eaKEcrxGuf8sSk1sDtfNaAQDnwSu4dJ9dsKlfpZuFL6mcpnTxwCKnIiDqS/wBTf4f
 7Ql84yBcXWTNO52Dhr7oeFovYSBfrZ1gRcnpIIGhkmh3cBbEMS8JOPKwiCP3Zivw2/GgjmgPZVu
 u8rr5DF82HAQYU375lTy8wp8C2fgpqcSeJ+AI9ci4MX34oG2qyJhcM49D3FnrQFP/F3JPdDrHha
 PQ9RYCWQCBrDlSI/U+CDdxu+T57hP4x0qufYGgr2if276+vRAH1+B68XcP6bEoPXvNDXgtjium6
 BwC8UxhxekRDo1Yczfw==
X-Proofpoint-ORIG-GUID: UosH3ZQL51D7YaGMZCFXLf2fKd_FCyMl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140041

GPIOs used on PM8008 and also the upcoming PM8010 have fixed
functions (reset and interrupt input functionality) so it is
not useful to expose them for general-purpose usage. Drop the
GPIO MFD cell and associated peripheral definitions.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 60204cc9a2dc..2d6c01cf54f3 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -31,19 +31,13 @@
 enum {
 	PM8008_MISC,
 	PM8008_TEMP_ALARM,
-	PM8008_GPIO1,
-	PM8008_GPIO2,
 	PM8008_NUM_PERIPHS,
 };
 
 #define PM8008_PERIPH_0_BASE	0x900
 #define PM8008_PERIPH_1_BASE	0x2400
-#define PM8008_PERIPH_2_BASE	0xc000
-#define PM8008_PERIPH_3_BASE	0xc100
 
 #define PM8008_TEMP_ALARM_ADDR	PM8008_PERIPH_1_BASE
-#define PM8008_GPIO1_ADDR	PM8008_PERIPH_2_BASE
-#define PM8008_GPIO2_ADDR	PM8008_PERIPH_3_BASE
 
 /* PM8008 IRQ numbers */
 #define PM8008_IRQ_MISC_UVLO	0
@@ -52,8 +46,6 @@ enum {
 #define PM8008_IRQ_MISC_OTST3	3
 #define PM8008_IRQ_MISC_LDO_OCP	4
 #define PM8008_IRQ_TEMP_ALARM	5
-#define PM8008_IRQ_GPIO1	6
-#define PM8008_IRQ_GPIO2	7
 
 enum {
 	SET_TYPE_INDEX,
@@ -84,15 +76,11 @@ static const struct regmap_irq pm8008_irqs[] = {
 	_IRQ(PM8008_IRQ_MISC_OTST3,   PM8008_MISC,	BIT(3), IRQ_TYPE_EDGE_RISING),
 	_IRQ(PM8008_IRQ_MISC_LDO_OCP, PM8008_MISC,	BIT(4), IRQ_TYPE_EDGE_RISING),
 	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), IRQ_TYPE_SENSE_MASK),
-	_IRQ(PM8008_IRQ_GPIO1,	      PM8008_GPIO1,	BIT(0), IRQ_TYPE_SENSE_MASK),
-	_IRQ(PM8008_IRQ_GPIO2,	      PM8008_GPIO2,	BIT(0), IRQ_TYPE_SENSE_MASK),
 };
 
 static const unsigned int pm8008_periph_base[] = {
 	PM8008_PERIPH_0_BASE,
 	PM8008_PERIPH_1_BASE,
-	PM8008_PERIPH_2_BASE,
-	PM8008_PERIPH_3_BASE,
 };
 
 static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
@@ -180,7 +168,6 @@ static const struct resource pm8008_temp_res[] = {
 static const struct mfd_cell pm8008_cells[] = {
 	MFD_CELL_NAME("pm8008-regulator"),
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
-	MFD_CELL_NAME("pm8008-gpio"),
 };
 
 static void devm_irq_domain_fwnode_release(void *data)
@@ -252,9 +239,6 @@ static int pm8008_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	/* Needed by GPIO driver. */
-	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
-
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
 				ARRAY_SIZE(pm8008_cells), NULL, 0,
 				regmap_irq_get_domain(irq_data));

-- 
2.43.0

