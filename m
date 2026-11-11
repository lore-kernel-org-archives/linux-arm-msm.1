Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416645;
	b=4S4GLAqVm50INvIty57VVP2yLxtI+ILjxSjyGBH0jVKcwOOG7Q5ezSa8NQrpOj8ED1IG
	 0dItUzLG1m+nUo/MxFVLUgaJc+7HVmmaweQ1OO2QFupwetaEJhxmxRQS/mnFeM3jo+Pf1
	 ISgqketkaRnsxs0FpDDvIuCyVaV648tSNoERPgnqT6nnvyDq9kxjjg1qtcBnMduiNTlDc
	 5iKI+661ncQikWraYcSwns1UzrLLhlW6VHGEzatzD3ztePH8CpB1SezTC/MZ0CJGlGim/
	 USLA+jxvY1tTuz9i1Xty6Dx+w0CQfjw6RUO2VY690suN9mWZB0NMphsSg3kKjNCTJyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416645;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=md0AKGLYUZgrZOcHQyk9t/uJqXhe5icAA9MB/evFJSw=;
	b=lcfK9JDHupxLXrLuLkDVfvzEuRi87MaajiNa1xV0MQ6uPskbmklAlLFCRo+NzIaBjbkN
	 uU6fUzoN9LhMSfj8iKk922AV3RKkN7WvTZ90yXPsy0VgTY07lrO3dr1+KvVO7ikBKCeT6
	 uxOT3CSPyuSr+sZjhLi1UKhiec3K3h1Sq43kOdTBCOHVHnPicq699zgPS6Oas4iPp9Wla
	 niK6Jr0LzqQkrJgUP2TgNM2tVZim9G0KlJeb69OF/gSnCIUvt7zfdxLBAM6qIdwACqaeO
	 dF3DPAt70ndskTIWZIpSVK2oXP3m6DPDbLagRcZXc9LWeWnt7CGpZu3MgnO1IMM0zkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=li9c1jqP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B4L1TgRK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AE0606A336
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62AE0606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=li9c1jqP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B4L1TgRK
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0USf2594025
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	md0AKGLYUZgrZOcHQyk9t/uJqXhe5icAA9MB/evFJSw=; b=li9c1jqPOPtZ7Enb
	1MjmBLRdhsK9hApr18LzO9yyftt57qQyTDr+DDOvcqGpSC0vRdMqfsj4W6EZVHFQ
	zH4a0qh+2B/RTGUfAbFf+dFV43UMAXjo4YNwcA+M2bNB6ibkyhHE3p37WCaoFaci
	OT5h17N222INittuUu5nzC6pJK1JnwAyjUp6M8oWVB9SmYcsN8Dn4loW8Fe0FgTU
	9jZxqwjICqs/vKlRLjR5JAybF5sRVZsJndKBnnrQXBQMlz0SFMWa0n4Q30a/5E8s
	HQcvoXKveiJARO4DdYV7y80UGQMmol1jz4YxMHzzvD9Jdxe34IMeeSCUcqM/fR92
	dxY4mQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksma8uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:04:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so3517062a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416644; x=1795021444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=md0AKGLYUZgrZOcHQyk9t/uJqXhe5icAA9MB/evFJSw=;
        b=B4L1TgRKjHL5PGmKyjC+ejXmu7eJWH/dCAloLF+y6EjZDYBArmsf8GGFgFlV0MpyXq
         NCSkAVJP1h8G3PXEo3dCvZtOVJKoK7fZ80ClcMo2Sc6/7Ri1YDB9CFXyJ0YxO+0sIl8n
         IjJVwAds3trL4JqSPkisEo8gIXtDZSvxQqUMoiSoMTogBgd+czCKAe2OYuDpDT0YXpFQ
         HoAO4ohco67g1DpWQFVR3SABNKSoyv6GAhYp/94nOXk8rmaVx6PZ9fA65K6fD+BgjJ7P
         eBhXI4/B1Pn/2ws2oKgauL2NgutJj40w6yUTVgbpoZt8MLj9UlXEnJLm1AwxGUJWVpIp
         rFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416644; x=1795021444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=md0AKGLYUZgrZOcHQyk9t/uJqXhe5icAA9MB/evFJSw=;
        b=naD6U0dz0bdjhmK5+bZ9rmiSd37mJD1yw91DweAJQD0jgT8J5RHi9QAiRJ3GScBmMx
         ID5SRvQbFATlHpWF7atA5sr3WtQklv4b1fo45gdEOaNOdXs37sP7hxwFMMvN/UANHiyO
         uqOKlaYBjp7qSAnXORVIs6IcaIw4p1k5+/ORBLd5PWwveDhGZ0NTpSGeE+mcUsR99spC
         IBOP/GnPcPmmUU+MitMb9LpncJHYhXmzgGKt3x0OhsduRg9RRbATHJ+ng7AcBnnm6Aw3
         NSpoBjEAhqlc45AI0K0jYR90gFbL+3oXfvc8cAp4X4L0SSnsw1x/U3eHGdjCvALHQKAZ
         NTxg==
X-Gm-Message-State: APuU4Z8EZSBYAnTTa4/h4s+0rFMq9yRhq5YTHXU+V8f9wqq4OA3LjUxH
	XxJFaBCeCJFg0T6zTRXGcZUSCN4Ke72REL74nj1PNOFJFDZevsMp9EKRhjArw49fE1nhSciQbPD
	hSaOTOFHxuo8+8Gb7wZIvx/1XE55ViXweuDLrnv49z9zanZ9xef2DzYuDtH6dtwlS+FhF
X-Gm-Gg: AYBFou0U1BEyxV8GxKKVjlh4fLF9osuPUKAuCEdRO0P29VW/9fCe3Hx7zkzF9CvnIvM
	PRLXX9Rqw4C8q00vXVz8lepn2o8SH/jMilqeCG33tZfza1jIwfU8YQVLMDbK9BKnhJnTSvTTDt/
	y7i3aB81+nD+4tLd5y6NYVzDA/MPwULvUxp4BdN3NmGIjS6XLO+UNT1IXM7hm5SUsunPylS+/jC
	It9467DJYlTRYG0nmSEWbSPkn+/ksh9xOLffC9NCP6W61b+Oyhy89kcZHT8M40dUnatKKnwAyiH
	03jDXPXsjtD68EGkMDYTshTUWf7eT2yTrcmRw6Lse3AeM2e2A8VL2TCibuy5V6R3Gbdpqk/nJnR
	aimt3scDsJnXKgbB4wEcfroOIfK9u6RRjP82N17yO0ihuNTOCbPJ02pKlKtm2scCkct8=
X-Received: by 2002:a17:90b:3848:b0:3a8:5d1f:59ad with SMTP id 98e67ed59e1d1-3b182f235b8mr3273348a91.43.1794416643718;
        Wed, 11 Nov 2026 09:04:03 -0800 (PST)
X-Received: by 2002:a17:90b:3848:b0:3a8:5d1f:59ad with SMTP id 98e67ed59e1d1-3b182f235b8mr3273327a91.43.1794416643353;
        Wed, 11 Nov 2026 09:04:03 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:04:02 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:32:54 +0530
Subject: [PATCH v4 5/7] mfd: qcom-pm8008: Add PM8010 support
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
Message-Id: <20261111-pm8010_i2c_support-v4-5-4549cab1c8e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=5611;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=166k5Fjo+XzrjC/k6aDFuh8Bh5vkTImFiY/av/N3V9E=;
 b=F7Fv857eeeihZ0NGe86QVV84N4cxJRh65RY1ZmMTJTxRui9Dny7wZU2a2kp8qcu8KNxs82ggQ
 JOdmJkDLCtAA+k6id8+F3hlCewb9hWcCRWqdP5D390Zdd0bA4gsaomV
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: z0Hz-O9rCcgIPc_GYc4V1nkcyaRCP7IE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX2yZHB9CStfiA
 cuyx6bahX4i8wElcyMpYjW5fd8knKm59WKu7CwqiK7fQmpPl//CzpoKD/obYg5bHSgNwLnV8uTF
 PtP5JoxVYX+ynkoxR+PEf2pUbdYjG3+02vRq0+Jq6PAus2391doXrRoEe/vFrEiZsQIIPnLtlGc
 1HeRF6jyKrr87itnAa1zhMJoTOx12mDFhJb62hIqo1RSZnWw7JCOwVPH7Tmfh2g1wtn+k/SFJ10
 0cF2jPADgMyFWxBFE31u6iVlKNRb+SYwKCNe3DZURhsm9Qkep6cUmp6sod1viUC6/f/z0VtEmKh
 mX+sR8TNb6mZY2hi/g2vnYB+yKJKJ11k5lTTLKZCu8F68EdGI/whTWB65dVlISlt3k6USJQw1iR
 uXvbXkgDyN8WSARQwydiZmDRcD4SXY4b1I1RoNZ+ez5InQ8y8Mm3trxBNQukZLo3vn9Kcw5mBsq
 pnuw0tYHwQ9eebFWiAw==
X-Proofpoint-ORIG-GUID: z0Hz-O9rCcgIPc_GYc4V1nkcyaRCP7IE
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af4a004 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=LamtlsxKl8ZIB2y8LWQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX+DSFS9wVhdbR
 9HZkIF/rcnWfimCvVeR3iKU9/7bpfX6G70dcYpyO3Q0MJJo5gBIVcLNCx+jzmPo2VcVIqHXevgs
 DUpjl/2hynCK3MZcuiKWCVg8GlR7Yuo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

PM8010 is effectively the next generation of PM8008. The device is
generally designed to serve the exact same function - power camera
sensors and the associated supporting hardware.

PM8010 supports both I2C and SPMI communications. The latter case is
already handled, since it reuses the same peripherals as other PMICs.
The I2C front-end is more less the same to the one of PM8008.

Plumb in the necessary changes to support it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 drivers/mfd/qcom-pm8008.c | 76 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 72 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 2d6c01cf54f3..39fae8d48e46 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -34,6 +34,11 @@ enum {
 	PM8008_NUM_PERIPHS,
 };
 
+enum pm8008_chip_type {
+	TYPE_PM8008 = 1,
+	TYPE_PM8010,
+};
+
 #define PM8008_PERIPH_0_BASE	0x900
 #define PM8008_PERIPH_1_BASE	0x2400
 
@@ -47,6 +52,9 @@ enum {
 #define PM8008_IRQ_MISC_LDO_OCP	4
 #define PM8008_IRQ_TEMP_ALARM	5
 
+#define PM8010_IRQ_MISC_MBG_FAULT	0
+#define PM8010_IRQ_MISC_LDO_OCP		4
+
 enum {
 	SET_TYPE_INDEX,
 	POLARITY_HI_INDEX,
@@ -78,6 +86,12 @@ static const struct regmap_irq pm8008_irqs[] = {
 	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), IRQ_TYPE_SENSE_MASK),
 };
 
+static const struct regmap_irq pm8010_irqs[] = {
+	_IRQ(PM8010_IRQ_MISC_MBG_FAULT, PM8008_MISC, BIT(0), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8010_IRQ_MISC_LDO_OCP, PM8008_MISC, BIT(4), IRQ_TYPE_EDGE_RISING),
+	_IRQ(PM8008_IRQ_TEMP_ALARM, PM8008_TEMP_ALARM, BIT(0), IRQ_TYPE_SENSE_MASK),
+};
+
 static const unsigned int pm8008_periph_base[] = {
 	PM8008_PERIPH_0_BASE,
 	PM8008_PERIPH_1_BASE,
@@ -146,6 +160,25 @@ static const struct regmap_irq_chip pm8008_irq_chip = {
 	.get_irq_reg		= pm8008_get_irq_reg,
 };
 
+static const struct regmap_irq_chip pm8010_irq_chip = {
+	.name			= "pm8010",
+	.main_status		= I2C_INTR_STATUS_BASE,
+	.num_main_regs		= 1,
+	.irqs			= pm8010_irqs,
+	.num_irqs		= ARRAY_SIZE(pm8010_irqs),
+	.num_regs		= PM8008_NUM_PERIPHS,
+	.status_base		= INT_LATCHED_STS_OFFSET,
+	.mask_base		= INT_EN_CLR_OFFSET,
+	.unmask_base		= INT_EN_SET_OFFSET,
+	.mask_unmask_non_inverted = true,
+	.ack_base		= INT_LATCHED_CLR_OFFSET,
+	.config_base		= pm8008_config_regs,
+	.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
+	.num_config_regs	= PM8008_NUM_PERIPHS,
+	.set_type_config	= pm8008_set_type_config,
+	.get_irq_reg		= pm8008_get_irq_reg,
+};
+
 static const struct regmap_config qcom_mfd_regmap_cfg = {
 	.name		= "primary",
 	.reg_bits	= 16,
@@ -170,6 +203,11 @@ static const struct mfd_cell pm8008_cells[] = {
 	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
 };
 
+static const struct mfd_cell pm8010_cells[] = {
+	MFD_CELL_NAME("pm8010-regulator"),
+	MFD_CELL_RES("qpnp-temp-alarm", pm8008_temp_res),
+};
+
 static void devm_irq_domain_fwnode_release(void *data)
 {
 	struct fwnode_handle *fwnode = data;
@@ -180,14 +218,43 @@ static void devm_irq_domain_fwnode_release(void *data)
 static int pm8008_probe(struct i2c_client *client)
 {
 	struct regmap_irq_chip_data *irq_data;
+	const struct regmap_irq_chip *irq_chip_desc;
 	struct device *dev = &client->dev;
+	const struct mfd_cell *mfd_cells;
 	struct regmap *regmap, *regmap2;
 	struct fwnode_handle *fwnode;
 	struct i2c_client *dummy;
 	struct gpio_desc *reset;
+	unsigned long pmic_type;
+	const void *match_data;
+	int num_mfd_cells;
 	char *name;
 	int ret;
 
+	match_data = of_device_get_match_data(dev);
+	if (!match_data) {
+		dev_err(dev, "Failed to get driver match data\n");
+		return -EINVAL;
+	}
+
+	pmic_type = (unsigned long)match_data;
+
+	switch (pmic_type) {
+	case TYPE_PM8008:
+		irq_chip_desc = &pm8008_irq_chip;
+		mfd_cells = pm8008_cells;
+		num_mfd_cells = ARRAY_SIZE(pm8008_cells);
+		break;
+	case TYPE_PM8010:
+		irq_chip_desc = &pm8010_irq_chip;
+		mfd_cells = pm8010_cells;
+		num_mfd_cells = ARRAY_SIZE(pm8010_cells);
+		break;
+	default:
+		dev_err(dev, "Unknown device type: %lu\n", pmic_type);
+		return -EINVAL;
+	}
+
 	dummy = devm_i2c_new_dummy_device(dev, client->adapter, client->addr + 1);
 	if (IS_ERR(dummy)) {
 		ret = PTR_ERR(dummy);
@@ -233,19 +300,20 @@ static int pm8008_probe(struct i2c_client *client)
 		return ret;
 
 	ret = devm_regmap_add_irq_chip_fwnode(dev, fwnode, regmap, client->irq,
-				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
+				IRQF_SHARED, 0, irq_chip_desc, &irq_data);
 	if (ret) {
 		dev_err(dev, "failed to add IRQ chip: %d\n", ret);
 		return ret;
 	}
 
-	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, pm8008_cells,
-				ARRAY_SIZE(pm8008_cells), NULL, 0,
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, mfd_cells,
+				num_mfd_cells, NULL, 0,
 				regmap_irq_get_domain(irq_data));
 }
 
 static const struct of_device_id pm8008_match[] = {
-	{ .compatible = "qcom,pm8008", },
+	{ .compatible = "qcom,pm8008", .data = (void *)TYPE_PM8008, },
+	{ .compatible = "qcom,pm8010-i2c", .data = (void *)TYPE_PM8010, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, pm8008_match);

-- 
2.43.0

