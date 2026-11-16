Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809667;
	b=argcTWZsnUGHTdAjkeumIsAHezaprYdU8YzcfV6lj8kA+c0arsDfzskZVcQi/m+RgnDg
	 qqd1saCYfDrkWGvGE5wL+jI+rqnoMZrXqXTGKMCRNHW5pVILJCYzXiQuVzhuhT0xxAN/n
	 LonZ1rGB4iS1ml8bMnHZ5ksnz5V/rKc4a5YShMCqD7jM0OV9LkbWKnSRSBLJw5OsIG1z5
	 bSX8Ur78prDfks/oCWMtIdUl4oEcKNn8WbLn+iaA2/cenRu+j0XOv+caKwnG7iU53MoMQ
	 0UKNQJ/PjROAqDEdEhjaIVW3sxKf0qbtjol8B+7d1I/EB6vW72HUPTMMHDoC0udlVoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809667;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=quFqhC3AFLCeVG613t358vO+Tbv3j9opYxwnp7KC0vo=;
	b=vfiViucEvnD1lU3FB1pDjptrPaWAB5PJMKk6T40VTyOyrEaCbmtqRHaF/zFNRSpxCZw2
	 KHKtLP4BP/otHK7U49/sj0vNkmN9CtaspXIfbSffOl4GxTy79+DKd9XMq9t3K6hNoWkEO
	 u0gZlbS1FhOoa89FmWv3Sx74lb3aH7xSP6LGak2ISlnVN5J95AfwI2jjSfyWiwNJFQ+e8
	 YkCXAIwlqMcs3hTWgZSCxxsDZKuuljQZ92ZzWM1JN+W9j+8tAAXimaDtrOQEMm3o4PToi
	 zlwNM4ZlD5J2XznWXuaEn2Di0UkwiEAbMHXOMMwsHXpADPAXB9sUKnKsD77M7+EBR8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OgapWimU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbCYztRs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF2E606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBF2E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OgapWimU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NbCYztRs
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LSNY2880937
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	quFqhC3AFLCeVG613t358vO+Tbv3j9opYxwnp7KC0vo=; b=OgapWimUbgAKCYOI
	WMidKLEaimc7JqkRnrHN8neEilUXsYErFV0nuF55SY3raQbm8YqCkbIwvzpmOPGL
	YeSpx90uP6ihjjzADHLdSSPBfy3ldRT9vV+HKRuoJ7o2dhW2byeaok6l85xZHIwf
	Aa1VwgbE6tL3A/LF+96YC8S1Cw5FcolooIk2HW4knwT6VknxAAqlXG3uLOqnmefc
	+B0wnwMcU+8Xb0wfel8PY+b77mYWeloO8bo8k1hIPqQhmIG9hVZhAVxx9Ts7WIuB
	n3Haohw8v+lix+RCedVjJS0/0POmrrD1XOC/qxhQAuGoK5izrpCcGaqSI3Rt/E8b
	M3WaLA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj453h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:14:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb8b260bb4so1520312a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 22:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809665; x=1795414465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quFqhC3AFLCeVG613t358vO+Tbv3j9opYxwnp7KC0vo=;
        b=NbCYztRsTatOmB1DpUx5G3qJi8aWBVQwDSkderFiK6AMAbvlCvh70dBwL0KMJJ38EE
         LwzmA/chieUVDDvepZytV59ESoF2SD+FpNyxFyOTpail5puJlur5T8Fd2fXL3W/jQy/Z
         klgJ/ewy32hEqZl5j74i7n2tyEbibRrO1dHjWrRuvecsjQsbiIIm+LhHdYEvLxQ+59vm
         wfg41YGQKNlERh2FcNlAcmuHfcXS7J2RYcqemX4++O2nS+X6vaGSnQdSvIpOikAu6Lap
         6zF9rzSjMqxD+RCWQXIf5Le1onmCSHJpCmXpDYO2K2D6XSdy/n6zR1WK2ViAKM16/MDc
         tkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809665; x=1795414465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quFqhC3AFLCeVG613t358vO+Tbv3j9opYxwnp7KC0vo=;
        b=blI6E/bUBxynhrJvlO/8UcH4v2WcGb8NOLVMt6nYOD6FCRIBtUIORBXQIt0yukGuyf
         lFbLJFB/XWnMpkkhsnF6eURCZmBAp7w7sV3E7IFgwb5KlxcNiC2g18NjC7qLGwlOBgD3
         hEmtLR8U3XVZYkSbmoSqYMw7FohT98M1BPIqfBcd2d17w1pXjXEUE9+2UltkTepVRSrc
         IyTqC/pAxZyYuVpXrgIOclnEkR2dMGf6tncgRwX2Jq2RBNYKIDF6OPDuh7ml8+dZbJEg
         rDYG1yIHdKAv4hDzII3e2oyvBIdLskr5vBEmaMh04XGEAn6EDoYX00FqVjHIz5y8kUzs
         jRPQ==
X-Gm-Message-State: APuU4Z8Liu00mWhuAX7KCm7kqebyBMlmgz0KP7D3PlwztxnxLyNIM96i
	dZQVxaXAkcM/d2x1XEpPXE6tJcwuVDq1tBGD6+usvvxAefn08l8bgd66VlwUUr/DqzSwNfhHn/m
	10MNnBxTnO+nldTWyftAMJ9KgmoNPa0lLQoPgnoeB7ihnMx63fa3qlYafxuM3ToXyGg8l
X-Gm-Gg: AZFdTZcpIneFwOnohTaThoN6A2g5aqp1rUHvWLrfahAWNCOOBiL+PLk2t1zHLKX9DoP
	YZfWB6q4h7pAn0jUDhWO2ePROUdwdzZe7zAmMTbr0Jb7zAEaSQAUFJ85Zw85JbmNUg1fXN92qpG
	xn08bN106iCjPoWDBhLCXSzReWYo46oQh+k2nVEj2LFTGesCYcUX1BXAMEX1EBYzsL4JYQxqVB1
	iZDZCAK31PGQlPm6jJkkXfjK3IIIb21q/Mr4wzI5QPoDtlGQXQk9jgsIi2axf76an8Hxf9JhU/P
	LMD/iIaRO6LyaJA/nqg/ERLD286M00CWXQabxKyREiqb/J4x1shHVVKoEsORlXOYbPXkgWSYgRi
	QtI1OPom+7DdAYtqsg/Ki0e5jsRwDCzhfOTrFVTw3eZNAdjegW+S5MFGPRWB9ppS8arGX
X-Received: by 2002:a17:90b:2f0c:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b1b0b89c42mr8719338a91.49.1794809664940;
        Sun, 15 Nov 2026 22:14:24 -0800 (PST)
X-Received: by 2002:a17:90b:2f0c:b0:3b1:8300:f48e with SMTP id 98e67ed59e1d1-3b1b0b89c42mr8719319a91.49.1794809664441;
        Sun, 15 Nov 2026 22:14:24 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:14:24 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:25 +0530
Subject: [PATCH v5 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
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
Message-Id: <20261116-pm8010_i2c_support-v5-7-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
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
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=4405;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=EfuTwFmhnLDuS09J9v0oeKJL4sbTdb1eqdg7aPMRmLk=;
 b=OEJXp9gJIgC0dnPTSo3KyclUz9p2h480OeYiZshte1kpbiYf+tHX/glu5qKYRAIABK0GiZcBP
 WGDp/gNihrDAfDgxpNyKDcjxIIlak3AKNxRmt5uAkk0JYEXPkzOMNGX
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX2Q9QagrcL0hj
 mWOyn7cWNsX5ZTF7R9CWtaKc5ZbOpKo1pRQT5o0R68JNtuwlvONDD/UfBElf2GyLVQg7wUMXkpK
 dWPd1rjRykAX0mP59z2zqsF58M1WufxygpiPyubAe7ZyCS8WmIIFn3da0D5WIMWsm0Lf5DSAUe+
 NAKsq5824k2oCE4MdIX2QcTu11JH8Gbq3m2nB1RQVKYfP23AARqWFYZ6zjYBMJ0j6+t6hHdSGxZ
 fVOe3rvH84xSzI4vLMplhMCVlFqH5FXHzXSJrdJ2xzyF9ZPAlf7vuLHhdlKO/e5zZGj/gdo7bih
 pQ2cKD4eUjXrEtnVNfQgUNo7+hmVdqy6VA4G7Hod/LWUJ5GFuh4KYGqFjbQbHzQ/zFhW7depD7h
 yp96BrMX4yydd5ErYFbZmiABq3bWd+1gPAmHQAZi5Rj/0GIOL56n0MN9LQtoqAtheEUwCj/K1fP
 GxU6nCqDjw3zlxkijfQ==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afa9f41 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=lbcZtXRpr0qBkvjFNboA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: G3tBDB40u4nCDdlHRJSogOVFEBiV4q5W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX3bqIqZEGmhyn
 SjJVQnYcZF4xOrWHBI1d5EyxNgxYybTyRn6JpPZOEyhN1bV643ZhwxbTvu48oFTw7X2uVrshfS3
 7GxY68SE7difo12egeefSmfxWpOYvQ0=
X-Proofpoint-ORIG-GUID: G3tBDB40u4nCDdlHRJSogOVFEBiV4q5W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is often wired up with the interrupt pin tied to ground. Only
register the IRQ infrastructure if we have a parent irq.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Tested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> # Glymur CRD
Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 82 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 60 insertions(+), 22 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 39fae8d48e46..9ebbecb90b0f 100644
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
@@ -215,20 +223,51 @@ static void devm_irq_domain_fwnode_release(void *data)
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
 	const void *match_data;
 	int num_mfd_cells;
-	char *name;
 	int ret;
 
 	match_data = of_device_get_match_data(dev);
@@ -255,6 +294,19 @@ static int pm8008_probe(struct i2c_client *client)
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
@@ -285,25 +337,11 @@ static int pm8008_probe(struct i2c_client *client)
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

