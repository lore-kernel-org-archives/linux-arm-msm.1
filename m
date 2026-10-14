Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FC84F0520
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974044; cv=none; b=qD9MOrxFK9EcJsUiY3pQFXje8N1GJ8c2h15J2/YJTC+6hKztBVsWBnqaII31LEeNuMDS0MRYRTYwu4GHPKQe4kS7LeAiTQfpc9rrwFyIwL9DgI4oWX7EOnJQJUWdO0/yDP2eTK6NTnDTKugajCrFa//YTSt6heidRTedAfXYeIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974044; c=relaxed/simple;
	bh=E/wYzVG3xDf7L/w2N4suf4ZX/BwoomQCbfZ6b/N9VQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ssal917zPmalfZ2lrYVk6Hqgk1kmIqu0t7HyCGbwaBDD59KgvwJJBuB6lCXbOPwDZs5ds0nYUvjLrL5mZA7sCCvD0qbTMZy+hEpW6rXz/k8JZZvDn2OoLQaNogaFKpglU+KmjthGkGStdz+NJltWAzvOgJjIGci48Bk+KjDPBZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBkc0T4P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUmEq2Ej; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBkc0T4P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUmEq2Ej"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E663ZS3365335
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2uo7sfnxHaYE31FkIynvT/aOThmlUMaQFUS2p5R3dF0=; b=XBkc0T4PI68bdEB5
	KiUIEws4IZXjDCC1z0q10FPKtckZMhlz8emo9SHOoAibyR/WnwTeDFrcACip9iWT
	rOqmCM4UiiYeG7W2P1poLJwkQ6ALi3MlBbNJMdOk0+8FOHbhaCMnx5JeOvbdWhER
	nxqn7gaDzWT7gS2fRKjYt0eE7ryLIm2sLq18Rxhb5PejAlJWm3BUFaWVkJ8DuWoZ
	YoQtrOCimOznemd5V9OJng1YTQ2vGCMVsxuvD9ZUSa25d46pTcKpSz7Zxh1G7f8L
	0ieDzL0ge5yz+FLojURxKbH4ZfLNYJDJhWyEXkYZkfAuTJ+nLmdch77I5Ds7F6ci
	44N1Cw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46213se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:34:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so209630a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 03:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791974039; x=1792578839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2uo7sfnxHaYE31FkIynvT/aOThmlUMaQFUS2p5R3dF0=;
        b=NUmEq2Ejkx6cdBaKK4DfyJHS+G6IvAqaFH4JGrcCnm1lk6Tgec6xRfatVUM6ie63W9
         b2Wc5f2LMQhaI2PCQURcMwwnHAQ3f82CrKC9bzA1eWdY/xdtukj4zIN4f7WHelH/9v7a
         BZkFqXYGSPG/m2QzdIgEDbugkSQQsCd3OAkWzvBr+UkatTw0zmNi5+gsP40OrjyOecht
         DV8SmlRQFkeT4cCO66GiV+KSjN6Zo1heQA7i6sWYZterOLEzkuLD1juub1vEycgXi50l
         eMXdrFdwHrKidP9Z8w423HwrRI1oKxdOW8+cm7XGGPjS06EqtaX3ML3rTogpOpYZzFZe
         C1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791974039; x=1792578839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2uo7sfnxHaYE31FkIynvT/aOThmlUMaQFUS2p5R3dF0=;
        b=IrOdFzcVr2l3GBHtsYsokZJMJTNPrFc/jf1eZo1w0mtie/dXmRnYP5lZ3clkbECvj6
         Ww606aVWEoUxobrP2JClZQpPlLoF3HNnhFBggN72sE3YL0RpHJmiDsCb+EqHU51h7P9/
         xtSpDrfQjmzMs6iwQJ7B3JownSTO9odiXECyZY866atzWYivb+m3iFo85fY2xh2SX+e8
         lwePlgnInV26tHPFNQrsypm6b9i908qXwftA5Z0ksDA2z7VP2S6G7LPxP0kcOji74k9h
         1SnPOVvT/y60svTHTC1OVDD7SLqEtR83VWFBuopD/DMblltKOKfms2w19lnEouSSsvss
         tuog==
X-Gm-Message-State: AFq9FYJ/Y9Qz5SWYw/HEMsnm83KhyMs5nAKUvixVeG57AynZ8BD1ZcpC
	tbjpnLb5IZ3FcRQ589t/5COfyHmfu4aTk2DE6t5JVzw4KM9x15rVeyAbM+sW6cDe633e2B+GWGq
	Zy5nzr3jQgRq3MOyIZQw6afM+63jW+dUMUi4iwBDIWL1Vnb1K1bzWWMIkNj+5YDhq9zGWEhYavo
	zP
X-Gm-Gg: AYBFou0lVZsVNihQIaVcF0Sy/ldp1aX6UHTbWNBD8kB23+BdzsZ39O0gyHEo4DypP6C
	/8UPSavjbGUkajn2t4xrrl+JI2nl93HLyICHsrgFBOwNNaV9ua8uQ2Ysdx3JY41YFa9AmorpeQk
	OYZeNxP0W73lPnbw/WPyseAGLAXRWVz9yL23ywJ3Mw3eeg+L3tlZV2u5GhfAjb1TcOVhKQN/X3K
	sbCqNgSd3x6NThAUhIGDoZ9oORjQNYHvQUWMLx6GXzGGftKZ4gQwyVQ967Axxq29q6syPOup1uD
	Ase/7D2yyzyOpZsDPqrCnimwlBsQ7840QXdW+NXXHzQLU//S/bIa67giV+7HfpWytHvU/DBQfRN
	rgYlNaY0U0mUpWR+Y1pU=
X-Received: by 2002:a17:90b:5343:b0:39e:4c81:6c5f with SMTP id 98e67ed59e1d1-3ab3a953758mr11614678a91.26.1791974039251;
        Wed, 14 Oct 2026 03:33:59 -0700 (PDT)
X-Received: by 2002:a17:90b:5343:b0:39e:4c81:6c5f with SMTP id 98e67ed59e1d1-3ab3a953758mr11614648a91.26.1791974038675;
        Wed, 14 Oct 2026 03:33:58 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e08905sm6822382a12.9.2026.10.14.03.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 03:33:57 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:02:04 +0530
Subject: [PATCH v2 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pm8010_i2c_support-v2-7-b395d2b3f668@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791973985; l=4159;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=D8X2HHkS4eWp17tH1OYI+/2C5p80XJqz6bAm/yAKm08=;
 b=w91wQB2tKJUl8m1aQDfMJUVNcJlGTFOU2Eh7prP3mXuHTryQqDw4nsiNrNtzQOyJH2qgRB6xL
 jshtG0L/ZhMBzRUyA4jsNZd9ZBkTJ6KcncXPB72g7t/re3N82g3b3/N
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: qvdC-9rfJnS59Ia88VSiZ-guDWEifx52
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX2yyveRR70Ihf
 to6IhrII/C009sHjUEAEZmc3NIU0UsEa3TUH0uUi9++cxday9q/Jum9oQY8PxWC6Y1/AZZjTuQ1
 dwc1wISWzGgBRcZdMNatgZ3cQCmkv7GEgMnRl9DJcqjaA9E19ti5hq/MDGU0UCL576pzamSiCC6
 0QdbwYJMuCZaMKWxCVX5KBlclPS3o4/+In5rb5927GklOMyspjD2JTM334gWDw9wHAGWyqeBHO+
 1tRxJ4sjIOK5TbykXHef8JzYlHWRcDoVpLHPMXRpZB2Veq2R4qNA0615TqHoKYi7gAgF0dQUueE
 gJt6jXIyMYZcXO84Gi88AZ3Yt6VPKQNwnxBLwTvbuVYj8CE2Yr08UbS9w/IQ8UxdPbn5SnenICS
 MzRGgJ3U3H9jcV4rxk2U6blw8JXPFsNbV7tgqytPiWOC+8K0NaxS6jH9UqbiZTjDcpEXsWgUPG/
 RnUrQBfilnT+Qk3SC2A==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf5a98 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=lbcZtXRpr0qBkvjFNboA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0MSBTYWx0ZWRfX09y8oc2dbaBR
 uWpdNghYCjxxcLvjwcHlyxm4nvEDoos3zyAHrPPFQ7LbvaofB/SHy0T7aX3xcEH8/Kp7oNJGX/w
 gRgLyPRd7LIjPa8xD5HS6/XjZ/mPcuM=
X-Proofpoint-GUID: qvdC-9rfJnS59Ia88VSiZ-guDWEifx52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140041

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is often wired up with the interrupt pin tied to ground. Only
register the IRQ infrastructure if we have a parent irq.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 82 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 22 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 4179427f3891..8b1bbb4052a7 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -208,6 +208,14 @@ static const struct mfd_cell pm8010_cells[] = {
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
 };
 
+static const struct mfd_cell pm8008_no_irq_cells[] = {
+	MFD_CELL_NAME("pm8008-regulator"),
+};
+
+static const struct mfd_cell pm8010_no_irq_cells[] = {
+	MFD_CELL_NAME("pm8010-regulator"),
+};
+
 static void devm_irq_domain_fwnode_release(void *data)
 {
 	struct fwnode_handle *fwnode = data;
@@ -215,19 +223,50 @@ static void devm_irq_domain_fwnode_release(void *data)
 	irq_domain_free_fwnode(fwnode);
 }
 
+static int pm8008_irq_config(struct device *dev, int irq, struct regmap *regmap,
+			     const struct regmap_irq_chip *irq_chip_desc,
+			     struct regmap_irq_chip_data **irq_data)
+{
+	struct fwnode_handle *fwnode;
+	char *name;
+	int ret;
+
+	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
+	if (!name)
+		return -ENOMEM;
+
+	name = strreplace(name, '/', ':');
+
+	fwnode = irq_domain_alloc_named_fwnode(name);
+	if (!fwnode)
+		return -ENOMEM;
+
+	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
+	if (ret)
+		return ret;
+
+	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, irq,
+					      IRQF_SHARED, 0, irq_chip_desc,
+					      irq_data);
+	if (ret) {
+		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int pm8008_probe(struct i2c_client *client)
 {
-	struct regmap_irq_chip_data *irq_data;
+	struct regmap_irq_chip_data *irq_data = NULL;
 	const struct regmap_irq_chip *irq_chip_desc;
 	struct device *dev = &client->dev;
 	const struct mfd_cell *mfd_cells;
 	struct regmap *regmap, *regmap2;
-	struct fwnode_handle *fwnode;
 	struct i2c_client *dummy;
 	struct gpio_desc *reset;
 	unsigned long pmic_type;
 	int num_mfd_cells;
-	char *name;
 	int ret;
 
 	pmic_type = (unsigned long)of_device_get_match_data(dev);
@@ -248,6 +287,19 @@ static int pm8008_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
+	if (!client->irq) {
+		switch (pmic_type) {
+		case TYPE_PM8008:
+			mfd_cells = pm8008_no_irq_cells;
+			num_mfd_cells = ARRAY_SIZE(pm8008_no_irq_cells);
+			break;
+		case TYPE_PM8010:
+			mfd_cells = pm8010_no_irq_cells;
+			num_mfd_cells = ARRAY_SIZE(pm8010_no_irq_cells);
+			break;
+		}
+	}
+
 	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
 	if (IS_ERR(dummy)) {
 		ret = PTR_ERR(dummy);
@@ -278,25 +330,11 @@ static int pm8008_probe(struct i2c_client *client)
 	 */
 	usleep_range(1000, 2000);
 
-	name = devm_kasprintf(dev, GFP_KERNEL, "%pOF-internal", dev->of_node);
-	if (!name)
-		return -ENOMEM;
-
-	name = strreplace(name, '/', ':');
-
-	fwnode = irq_domain_alloc_named_fwnode(name);
-	if (!fwnode)
-		return -ENOMEM;
-
-	ret = devm_add_action_or_reset(dev, devm_irq_domain_fwnode_release, fwnode);
-	if (ret)
-		return ret;
-
-	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
-	if (ret) {
-		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
-		return ret;
+	if (client->irq) {
+		ret = pm8008_irq_config(dev, client->irq, regmap, irq_chip_desc,
+					&irq_data);
+		if (ret)
+			return ret;
 	}
 
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,

-- 
2.43.0

