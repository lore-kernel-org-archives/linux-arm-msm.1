Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416639;
	b=VVVCRLS2ZSfIAx+QKk4U9SH+pFzyRn9mryGsy+hwLhE5cPoQntDDPgmdpDO68QLYStEP
	 6ny0DlC1RQ797G8F60vHaUPH+RDPLHz8mnem4KLwS4KFLZbugdjef6hJZWqH6FJ/0dfP2
	 f52fzC1W8QHNlIDjxPjzB8/JdcIb9rlI2qBZc3Cp+gSgj1z82p4LJ37QHqk7lcoTL84cR
	 /M3MUkdKiG0swDknXc2DDgCFx8YZE5y+kfz7IibXpOZ2hqV/EZQ/QEh9RqcojjyHBqkBA
	 BgFbiOAhuUGSB+XwCxcaDnSU1pfCmlfWylvH+5OSE27d2uvMXWxaW+GdAk493ICMc6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416639;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
	b=HmQ4k8/3OBEh/DK8NgfFMuA3qo1Uoplte9c9RTriC7W88ehUQAC3lUlWQlkTaIFYbVvo
	 dEBIHYz6CW1WaiWOfzPJXXA3aNeIGU+RCpw4/pdCyRQofimjCobF/G1d2IIC98GoCLanC
	 8DQ8v7FYm6eqw10Aik1r6xNXpdDxk0K8+vjhO8BIYcO3vhwTTYxYSNMLdTjKRTjiBRhKf
	 wrCLoiMLzSp1HaKg7NqMc/rxSik4FXoVFrd8Qp0SLOmzdridZz8zzBc5TgpytITUyPfbY
	 q9Chftvdy5/ZrS+flxyKi1ZvaS1qtVsvF3C0FS6jRNaYoeO72/am2lWbb05pwGhvWrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KPZWpA47;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cZZbcmcn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26575606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26575606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KPZWpA47;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cZZbcmcn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF04pE3597137
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=; b=KPZWpA47NsnsKB7M
	BuFAPswPdt3wKsOnqRbCHz13jsxlFVR8ZlgWmVchtXGpQaPmWrOCFiGW05+lTzmp
	bkpO46GY9vES14qKi6r0uaNJepLRii7lkqVfeOe+ngkFNfSpX9aOkq5lHfPJHZrR
	LYN9PDMqAadhfsPJHh9SNViLDWL7r6hxUwon4cVK0tLfk3dTae6Gaz7o6L+J/pwL
	AP84Ip2VXpDjwBQXI6nY1Xr65To8Fmer+Y21MRsFIfKRrCy9OuFb4NPa2znA/3Ib
	7bU877ZvtH1ilDSrEJxnAHil2yj3Hf+kOu6a24q0HnTNGYkdKMkhGgQzlSOk0LVK
	Wf2Ucg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1u8pua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:03:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so3006879a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416638; x=1795021438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
        b=cZZbcmcnTPmIgwCiU16Ab1AoRRwIRrM6EIZEt9K6ASQSfARed2D07hYSKFUeybCr9+
         XoIR2hhul6KjiMHAB98sAGLa9wnMGeRENpA5/D9aSsfV6K9X+mGfdCL1eyiZYYPPXqR/
         iQ+vJVLQH5O0jyXbhqKPuwG1ZoqoC++DNjgCYX2CjEpqx7gpmw9xIxkyy8lvzZIU/zFU
         vxvI8O/yveWbOWnTlkp4Gt0njj3pC6Bqx4RtAPG4YsqxJLZyZ4n5zkGYxdzHzzWMN+su
         8hB1af7jdMvxm7JUkmM9Zm2Q+RS7r5pk0ENA3Nv7qiwpHuNa0tdwTbbRI3VW4PFwCcOp
         URKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416638; x=1795021438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0rOZNcTYcrzdc2gcQchFoHwvju/C6WWKX7BMUfg8bk=;
        b=vjqYh+hqCQTlah43E2GeaNZVJH76CA03KuHg8U1NOxXJY6ZJqvSuE2BIV5Njrw/sUc
         WZcfJHgubA+WKw/9mVPKjnjkSVe+fkc7l14gv7RPx9XoisSbVPKprZx0MonNK/iDP0JZ
         8UYCWKw82l2z/BnIyLxu7I2StKKjFXDPn7K0+v03/+m4bX//MCjzOnINGABkzIdjPDMD
         4IlcScjBDNBuopFO74FH2/tZlgrRBZOQeXzqBJoHC8+nPWBDn4m8v51On+aa4y4fHUeO
         UDY3GkytM2+lIl0wy52F6RIhrW3aimMTChkP+we4cGJgRbzvUc/p/bb6C9MW2wBwp8OR
         w+mg==
X-Gm-Message-State: APuU4Z8RdeY5YWAbI61nvnxO9wBlvKODFFPRJVR0+v4NfjTGCc+JQobJ
	dvJIwEnyBjTPzsSxYn7QzVZ94+7/4+d2p4TWazcu8QD2dWwYAgW+9krKzIV1k1FSUQYVAJPnsmL
	MGbcvwSQ21yzkAlqUKOiw8lpUfj702lx4Up2MUO3GXQ5ZuB7el8LiaixgPQN3AiE5R1HF
X-Gm-Gg: AYBFou38r9wiJyz7XkPIGKmkzM3eauN29FgsPK6KM/utDxmKVIIQBKzCMfFYL8ZpYQN
	YC6iGTWLvuhg6FXl1S7PCwvj4E3gh+8czgrbCwmw/vaIrZJXNoKe38UomHsBiDUpb6cCG45/plf
	c+VXjR/QenELWeprwDVxKXX0vr/fpOw+NlpiaT5seLpD6ebXbqOp1yblFmiDG2cKru7eGYRjqwh
	+i0MaDEZzrKeKXDd0rjHisgIwAIiRHbj6eECRevu84QeId3jlXI036RzVPzoxJjG/n1w+w2As8H
	E4wHGMvy2HDfdZT0e7axyCtsXSkxh0Knn8q8kx3pjtQS/oT2GQR9HkPm0C1ouaYJ3jY4dcm6zOp
	RMBNgc81Fr7q1zZCXWrEY+YS0dCTf6ahsTOtjmux6gdNNujIJK8LB79rMB0IfPVPblb4=
X-Received: by 2002:a17:90b:57ec:b0:3ad:b8c8:4a84 with SMTP id 98e67ed59e1d1-3b182f267f4mr3087855a91.26.1794416637521;
        Wed, 11 Nov 2026 09:03:57 -0800 (PST)
X-Received: by 2002:a17:90b:57ec:b0:3ad:b8c8:4a84 with SMTP id 98e67ed59e1d1-3b182f267f4mr3087809a91.26.1794416636929;
        Wed, 11 Nov 2026 09:03:56 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm84920a91.8.2026.11.11.09.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:03:55 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 22:32:53 +0530
Subject: [PATCH v4 4/7] mfd: qcom-pm8008: Drop GPIO support
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
Message-Id: <20261111-pm8010_i2c_support-v4-4-4549cab1c8e4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794416603; l=2884;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=+08zcnHr6A7yFclGJxbZHZCi6ixkui2rq8+7R3gOZmU=;
 b=xzvPfdQghclKk0q/pB7QkkPMalyellw/TxY0YjbTIMhwDnvrlZZuKyilv06UzkgTWlHqKNRuY
 SUPnvNock5rAB53CkN+/pRAaCUxIY26LdK098CCexFzYwUq7UwqvUif
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX99JzbucJJXw4
 gbGwL8/IwCdp3f5Yd3B/imU7n1kL6OLErShXuaqn0JR0kbtKKztZD73ELScsmbJ5YfIoInaLpnw
 LdR72obiAmkgCy5FY9/oyYN/1WIAhaM=
X-Proofpoint-GUID: pDUrTf5p_qcY5AGtD0Zfgb1ob5jkG7So
X-Proofpoint-ORIG-GUID: pDUrTf5p_qcY5AGtD0Zfgb1ob5jkG7So
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX8l081kkhe0tj
 GaLKgO7WotVt3o2/4fKfePIACfew4NthnZhRaBj1Gieu5H+pVoy0+81+GYOU+93N5/d8YNQ27f5
 qBMtTdKvhWVBtRTWNphSAk1RXiV5hcRq53/ICA6eDPD9Mwyg/tRyu2gA4SJWzvVonq6eKU2g2IY
 RgZ1fB/Nb+eObg22LMnxg77+DLnbimMcp+XPsXHH3490yZQDKtn6vkSUbeX9q1Y9MacUeHA38w5
 Q8TVtANPQUy/8q6dX4b3GNR3N8bqembWWec29S8UYPxkVJD1BTX1mu++c0LVSIcocINX5AGFnlp
 EF3FvQBZC5Bl1k/HkK4F45GpLi7Q+cNVLzWeyuaQ8SXc06ggxjy8oSMCiFLzNG6RUWocpO7+F5M
 Fo5TsC9/MbgKLMYRCrB0Qm+ndeGHa2Gsnr3o86FZDGN+oV23v/2eDDAqmY43Te2bO0AHxKBIjpb
 c/BQBs7kb0GoaMLbUpA==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af49ffe cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=-NFQ3DzUh64S9De9z5UA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110067

GPIOs used on PM8008 and also the upcoming PM8010 have fixed
functions (reset and interrupt input functionality) so it is
not useful to expose them for general-purpose usage. Drop the
GPIO MFD cell and associated peripheral definitions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)
Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
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

