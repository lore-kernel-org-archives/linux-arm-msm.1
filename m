Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416658;
	b=xHTmHSQcKxQMC5SjF9OUkpzyNvbSUFGx09aoEgXU6hg9jP0elAgcB6C4iCRw0bLe9XU0
	 xvhjZrXvEO1jaFoQOUpKX0DPuhf4IRF3gy7uEQLoYHEXjiTzcJI0zS0Rzu0HXLhFPExqO
	 0jcVNg3uyAd41Qmy8n00BImxL7mJfkHdyskZiHd+UWm45j/zrRQl0TeLM5HFMEgZWRZ2D
	 SJ+kzEWvfo/qGy1oOcGMzGrP9FVV22g/Wb998QDQ6jpss6R0UN+mDZI6eJi/TxiSkNI2O
	 QVBmuQSfbH9h5ZgJXJGOdn1tAkAn0I4g1L65ytzKkwZeB84LHHeOJbOO1MZY4dEuPlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416658;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=quFqhC3AFLCeVG613t358vO+Tbv3j9opYxwnp7KC0vo=;
	b=WFBovdO7AsordRxbThQpZ5fXztXZ5UOWJsHXTDihwMFrUvzVO1WR6Ihai0Vbcbbn4hQ2
	 vZGHNNX64XRfwK3LSpXYtebQTmnNs1td5bAajFRgTwpvwYtzJ6aql+YoVHThwEigw4uLR
	 A4pAu89r74RwuWu++ZtevgZtkQXWmxjI2BSGIuCeTNXpwkWcLkUz2TZOh9rgEsn4TOE8S
	 9LgvETO2i/TIpk9cRdNNwYrLJZ+vkfE2cVvep8w/jrx7ENr6EUZvE3oDbrP4z+9QaXoHU
	 5Twjwhw+t4BLqLoINNjqmGqZj//TnKLeYmZq8yDUZ6KQw9lR6YZL3GikayVnNRbyUSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BSL+3uUU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jeePNPoC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6B8606A8BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC6B8606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BSL+3uUU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jeePNPoC
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0XVA1012806
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	quFqhC3AFLCeVG613t358vO+Tbv3j9opYxwnp7KC0vo=; b=BSL+3uUUU7PSjLUb
	EIdXgPNwgNerp+danDrC0RSeTAei3ZG4Ww+w5q12weaGjSZAEJ/IbMCu4E2zCHaW
	dIJBZXjy5qP27uq0VQ6Ppwl+6bJ0XGnJbyjsyfRXJFjaJJOwkCoJ+TDF3KhBsKYn
	9GG9yQdOP2J5JiVbEaTkEZHqAJr7BBaSFGJNUAEtW/aoQXd8DboGAiZwX1mSlJBT
	Cp6FV7mTLtQo5NMXXDg8VpccA7+E+qzTiEIXJt8nd54irE1smTaiJzLE+DN32ubG
	7RBx2gsoqkWDGKd40qOLl4L6xCQkq0Zx04yj+zZJi+2k4aICKVjMqwvkr7Dj8XO2
	A0Cfeg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b34jv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:04:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so1427038a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416656; x=1795021456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quFqhC3AFLCeVG613t358vO+Tbv3j9opYxwnp7KC0vo=;
        b=jeePNPoCNWEGTjLXM0fxbc0OMihc6gQwHrKHPCZ/5d8NSvo/4Lkc3uWpP/jidlkXiX
         sDczQUrIbPqlW+DCWi278t7IZa3/9cCl+Drr7xTzrTGv2VaUjSPD5ppt2Gud/hBa4mTb
         cN9uLE0zGRHJy/iDBzahw+5IRnZekeKeqo7TP36GOInaApiq7DEpC+hkiS2gc7Gzrapq
         r9vdzZIlo+humcX5+zLdoY5teJZEt+Ey41sEPD6WE/ccr+8m9Kb3icGPMU3B+X0euLIO
         WxKipWLjuy+mLmNQg0NBNL3N5X1g9zSk42Cq5voCUr0yKSiQ4YEZjjCxekNIKFEmUkIf
         lLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416656; x=1795021456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quFqhC3AFLCeVG613t358vO+Tbv3j9opYxwnp7KC0vo=;
        b=hKV/pJD4y4zwVhV369Vy3qW1LDMozHiN91eWYsofRrgYA7/PzqKcV5xec5cHSXy1jc
         EmC6pKA1MjRPIjPe8dn/zL3SRs7tNIe6PqdKyJFJdRDfR3UZ31eVAGuJR5XmbDlIZzyu
         waHHhqA7uxtKhlEVO/V313OeWlgG1EBb48WGqqKrkq30WUe0T59JH72OtSM7hPwk7yNc
         lb6ONwYxodB3IA8YeMZDrhPcvO/XxEhSWE01388bW9GOt/MAyCG3cScF/4c3SmnY5eEq
         fMjX8hrIOq4NlO74O8pbm15XL/Pd/ibxQgRn1jeWJnhCkvU/5BrcXLTtnhzDhlFY7OUZ
         NpFw==
X-Gm-Message-State: APuU4Z/L3HP4HLhmK5tbKxEgFhSX8aMfxJsKYd55P0QbNWZJS0RY5r8h
	F1a1bXpnfNCGMNVkeL210RcLO4UyXnsLnZuwMuvSGHmZxhxXmyc9+Y9qLLJ4fRzIpaJCD5V4boo
	/QpJy4p8DcyFWTIb9hSFy6s0MXSDhsO3nPxazf8JwTj1vSYJV+fMYQZJf10KcFivkJ77J
X-Gm-Gg: AYBFou2NV+aWTf5ZjFaacBam7XUw17/vLVk3MvPSur/eMMTM+XkZc/+VZg+FVXFMmzS
	e+3vOED/pbSOIK+UiTbSvUJblB+9UpUt5S3jFLTUdX7+yBvOwH+arm+GIN7hcjVCGZfnIcaBSuy
	KrBrt2GlMf/2/nV/FHtzrYIokBcDgfhxGIWn5BlItgC7qr3+CemLOP723DebbDzGcub6GOyLCuO
	vaxpXJ8wkMBHBAUJNdX/8inpcj/rN/vq2dn5q1jQdwM2quwIp5P8xWXIVTrSr/tKahPC6prij3c
	0BgNNqrnu6qDWoAs5hRO1lGmcUUJL50FegNaCkVRYBoyJbPHMQMmxluW1324ncU7yYht0WrrtY3
	diV/QnGCX7Tuyjll0lX+De+E4Z74KDbaryUZ4m+Pqq/liaey6mvgByJCZJmkcCPdUwC4=
X-Received: by 2002:a17:90b:1e4a:b0:3b1:6f2:a188 with SMTP id 98e67ed59e1d1-3b182f14e11mr3059325a91.55.1794416656522;
        Wed, 11 Nov 2026 09:04:16 -0800 (PST)
X-Received: by 2002:a17:90b:1e4a:b0:3b1:6f2:a188 with SMTP id 98e67ed59e1d1-3b182f14e11mr3059287a91.55.1794416656080;
        Wed, 11 Nov 2026 09:04:16 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:04:15 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:32:56 +0530
Subject: [PATCH v4 7/7] mfd: qcom-pm8008: Tolerate missing interrupt
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
Message-Id: <20261111-pm8010_i2c_support-v4-7-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
In-Reply-To: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=4405;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=EfuTwFmhnLDuS09J9v0oeKJL4sbTdb1eqdg7aPMRmLk=;
 b=gAfkj0yBJYo8RtKBB6tTtIgSHIBH+pATCqy04DvBUvdVsOFkFPTE5snXDexCicsVmPPqqgcvL
 BSxhyPLjIUABQfXqeem4JwPFGg0C0WHQz4N+36b7NuLmakytymONriu
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af4a011 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=lbcZtXRpr0qBkvjFNboA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX3X2GIUZ+CnW3
 ptjN+SDXoo5vcelLREk67pljh/e0/cuFx8mivIRwg0gTnwVE3TqQg/lPN8fGuwXqzaAwnN7qWoC
 TgPsD1dlIObnAAfSutN2LhfRx9qwJgkVncPcPROBGyvNUMGXCC5ZwMszCn8P/WDRrJ1UW//49Wi
 1QX9cdynR/nOhjGCvv+9JkfPTeWmNJeDtr45wTAH7XmKFkXqXOBeJlr4CVJ4Xfn7VxGg08xf2pV
 CvBOl2vp3T8eQEp8U8NeIVIEjRF0N9WWUFQOkSLpCHpycg5C4JjXvQaXn8jp+5rqSOtEsXcxO6n
 l1UIeCpFxgvlQhDQ/EUG+VJaX9snLQwB/x15F5SZYm7adYSg0+HjrMgCiqp62bWcae8DENaIAWR
 ZIxmYo4g3okvzdBtzYao88HNzlV5S8UYmEIodREiEC7eCJHisLaIBL6wNXvpsl0PWlDyG9/SK4E
 t1B0IiA4/pd//dPHW+g==
X-Proofpoint-GUID: 3axmXLuRntKQGmoPvTVXgbVO6aBkHk-1
X-Proofpoint-ORIG-GUID: 3axmXLuRntKQGmoPvTVXgbVO6aBkHk-1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfXz/x8yDwsfhRM
 9OLdovHasrzmvngQDbN5fce0GKY/6+acoLl9AYqcPm/O21WM0dB0Z/InoFHCCSCW2JDRNsWpYNR
 hYjcfE/JGUIxBxE9pRtllqP5quKq4jQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

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

