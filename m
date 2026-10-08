Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927144AF699
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 14:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471140; cv=none; b=EGqwn86ZjoRBxoU7Bmmzucqfgt4wfatu7BHIHWlYfGlY52HGWExtCG/dJY7hYv0vLlNGMU+9KzCYdy6rd109Zh5pYWFTSdGCvhgvMzNI62Dwkzm9rUfd9gMR3qwIUsqY4CwThQ72zqIKJBVqMMl8ip9jeeAD0DcSZIJPWTWCcp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471140; c=relaxed/simple;
	bh=snmoRo5HS0kyFUxvozO7OELf5RYInmNN1p5+p0r8xNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lysWtoSLYprQ5fkmBCXQF8sxBE4I06EsohAqnSdI/dq+0mQkI9zhkfZAL+Ryxa9g++Q5ttDXH/S+423BkGJrgc1P3IZua6+kDmErXEDSRY9zxokviwbc0hIKGV9z45t3fsRboBRZyQh1/A4/sjeNhlrrC6ftXhVbobXccvu9VO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4E7fAXo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOe4g+KQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4E7fAXo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOe4g+KQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVYbl1685240
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 14:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Opr8FHV6V8B6f093zDck7K4OReRPdKrGkvoVdzURzF4=; b=b4E7fAXopcW5NS5X
	hoCMsrRiWpT+WFvff1ombTucvUronb9ObLyGbb4wNpojZGpf2FBuqNquvDak07o4
	QffEHeq7+Yp/TSJOZxS2BADt9H+Azst/un8EE9P8Qy3YzMdBHi450/OQfyM/0rk1
	0u80CQUuRhOwal3q4MRMHNDvM9XLtO8UHBbZrN3HhDCczk8McOpOvOVOOdETNv4J
	X72QxdWPdyQeUv+/t/zPIj1T1JM/kgZgtmuSKVSOkWIGM8C2TFAp0KP8jzYlW40/
	A73P7hH7s4b6+uu+H6Lz8qYyBbnQdSyYAlHL/CHThJ9beTtMbbQfNIzRuM+M2Fbb
	WTfS3w==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe33a6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 14:52:04 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8acc7fe346cso72557387b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 07:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791471123; x=1792075923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Opr8FHV6V8B6f093zDck7K4OReRPdKrGkvoVdzURzF4=;
        b=TOe4g+KQ4XqvYpSkt4j1SA1lfDao0PnUyNxsJB1LBDQEqfZAz3ngqLz0+F0AVpRT3a
         dMPocQwcwVrrYEZaYSpBmVg3riOyqpKWl4ncaueqe8Hso/VhOvX65LHIdDW9mthBuwop
         K8C8ssFe5mvvLfHQMEqUK3eQlCOzi998qRE0PsdIg3LQh+WCamJM/iFdopz0YJZIkfCW
         Dirrujtt7PR3AtAuoaE55BPzTaOIFPTwXrdLsTD848N6dpwL6jB81LmpC8kQtfVrhw2W
         6TYr9pJmfOfMpRX4Ox0s8hBn8E6NL9e8UFpPD6tqt1lnETgZviJgnYUmYKKU7qjHAiaN
         pjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471123; x=1792075923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Opr8FHV6V8B6f093zDck7K4OReRPdKrGkvoVdzURzF4=;
        b=a4I1U1532QR9wCNbZnT3GU2yvDLvcfTLjmgpDl7zwirKhp6ElBN+v19cvUbabUR0Tp
         fRFExU3EwP9wbYE9jWrPZ2ML4+HZ4eWApLLZX5XfTRyV56Ra3q65wh2druC6XSebW+Ao
         az20zBZfL8+OPaO5JnEKVq6znMU2yatUg+5u/AMO2YhbZpJ4LEGhWsc0htx4Z0shKX85
         rHRzPac9F8IY5GDQlSSTlb8NiVTNxcbrC4vC7JSOKmONADt12XRCNA68nSxL/xAZqDxQ
         tEErntQ25tLp+DiPz10xOKkXy4B7+kehPNIX0LqLhfi71UfbMKvS0/ZUZlG0KfsDnq/v
         QagA==
X-Forwarded-Encrypted: i=1; AKwUvByyHtOlF8BkyNmIxVpRJH8syTls6iaI8GoL3uwV1ZU9FmCTYFOnSg053O6Nl2WCN9Zk61Uc4E7huK4881VN@vger.kernel.org
X-Gm-Message-State: AFq9FYKUAEUItBXtiYmSu/mfc8yUZhaPEWa1x1hK5nIsY2hAjPZ2vNZs
	ooVxDmi2ou33cnTq9lXk0pzR0DH5fySKOxzNX1UWVxIOB6zYdad1BjXfN+ptjYX/YNIjWBKyiGh
	RY2JfiNLlf+nzbI2bBy3gqy7gUfGY8nOvoukH2P78SYr6m8KCSMftIH6lfaQeqxbIZh5O
X-Gm-Gg: AYBFou3uxYzq16GZqN3P6E61pZA58agn3JW638bddEkX846VhpWGtbqy2zSA2DzkB+n
	8tiMnrXT9fOgIzOigkkRzJ69KPvfzgMUIkA12+pXQFShUNJ965Wqv3E3u5xbZD5uV+53LtFUgzQ
	udDkn1d9VnAK489uLVoQNqQPPEIMrQIYele5KbNB1p5R4nk4wXsCGa3uPwNtqhB6m2btHkZbg4U
	X8s3c5hIvV08einIwDiO4KrKpsOU+81ddF18F07H/KYyvdWBIHIPwuU3I+ehU/1UHpr1B5jef/m
	ei+d5bE3LhZMhsFXhH1QOgdzS1v8XEV+PfdQx7i6NFdsT5c9Rep8Ld2M96hSpI68Jm/rfVGaOoE
	B8XrUI727Eo5n6N+uO5Ggh1BxlOwcGN7AbFDS/UFBHeg=
X-Received: by 2002:a05:690c:560c:b0:8ac:46ff:d3a5 with SMTP id 00721157ae682-8b05b0b8182mr28244577b3.64.1791471123103;
        Thu, 08 Oct 2026 07:52:03 -0700 (PDT)
X-Received: by 2002:a05:690c:560c:b0:8ac:46ff:d3a5 with SMTP id 00721157ae682-8b05b0b8182mr28244497b3.64.1791471122680;
        Thu, 08 Oct 2026 07:52:02 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab62607sm20903407b3.22.2026.10.08.07.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:52:02 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 07:51:42 -0700
Subject: [PATCH net-next 10/11] net: ethernet: qualcomm: ppe: Add IPQ5424
 service code configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-qcom_ipq5424_ppe-v1-10-16caf43e44ee@oss.qualcomm.com>
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
In-Reply-To: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791471094; l=4414;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=snmoRo5HS0kyFUxvozO7OELf5RYInmNN1p5+p0r8xNo=;
 b=mfqn0eMZjgl0qcDtAaOljzgAQtAIopcpZ7Fj+DlBKeHCyNpVD/BCVjx+EDWkvCXTfPgZm30ho
 n9YwSI0Y9ByAMx+71l0CgS/1xHMDNkoIqtn7u8PGfLY3rUWdwAE5Y/7
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX9NDgZPW/VzZb
 8w2FUPM9P1ZCBcMheboSpZlStJZDfbsRVA41sepfapwTOmNyujnwt3Ji0Gop9ncKo15I4GrI0WA
 2jzRGOGQcGGqODKpUsfy3sl2bzlgo2aZN+6YKc/HeSFVwLKY06igDz8QermmLI4VLzgBbZsRXJa
 z2jsaK4dYJtC2bv3PmwkQJ5PL88rtAW8R2ele5V1ZMHQ728HC0vcSpuoQjOzWYoC9z3hI9UWnfM
 oMl7f3EPZ6uTSvk6kUKqTHRW3grU2AuLbdPb6d60soF/gVdNBZhd2SHzE16oec876RtidvSO5df
 8rCv3wXB2ObwafFRvKM0PApzG6InXHgOhPplJFZN5PZFCKSGubi57SGhXsmiDvPh0iYnlm+xRxt
 n7IJSlvH3xUyidBpoNMx/fKShBcDU0GJZ4LxZJzLaSEOm3kVnVr9hAYmR23T6C2xORQs6JE142/
 3mDwmliuF79Q68cqUEQ==
X-Proofpoint-ORIG-GUID: E8NPslLNqmJYNIlT76uIBibCDvyR-6nq
X-Proofpoint-GUID: E8NPslLNqmJYNIlT76uIBibCDvyR-6nq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX2h5mjg7xE4j1
 KoNRrW0ZOJyrve3YaOULsKD5v4BuvlTiZhs8B0x96QAQjolA7tB77JPjoOvPr9abWORElFJ++lP
 KiIZlyyKIcqR/1KWddZEZDzn5HipvoI=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac7ae14 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Pd_C_hmTYow6CwTwDaoA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080059

The entries of the L2 service code table are 0x20 apart on IPQ5424, instead
of 0x10 on IPQ9574. Each IPQ5424 entry also has a second word holding the
extended egress bypass bitmap, which adds the bypass of the source MAC
multicast drop, L2 flooding and tunnel exception counter control. Add the
L2 service code table stride and the extended egress bypass bitmap for
IPQ5424.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 13 ++++++++++---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.h |  4 ++++
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   | 12 +++++++++++-
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index 83e1f2d30258..94885240166b 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -1476,7 +1476,7 @@ int ppe_port_resource_get(struct ppe_device *ppe_dev, int port,
  */
 int ppe_sc_config_set(struct ppe_device *ppe_dev, int sc, struct ppe_sc_cfg cfg)
 {
-	u32 val, reg, servcode_val[2] = {};
+	u32 val, reg, servcode_val[2] = {}, in_l2_val[2] = {};
 	unsigned long bitmap_value;
 	int ret;
 
@@ -1490,9 +1490,16 @@ int ppe_sc_config_set(struct ppe_device *ppe_dev, int sc, struct ppe_sc_cfg cfg)
 			  test_bit(PPE_SC_BYPASS_COUNTER_RX, cfg.bitmaps.counter));
 	val |= FIELD_PREP(PPE_IN_L2_SERVICE_TBL_TX_CNT_EN,
 			  test_bit(PPE_SC_BYPASS_COUNTER_TX, cfg.bitmaps.counter));
-	reg = PPE_IN_L2_SERVICE_TBL_ADDR + PPE_IN_L2_SERVICE_TBL_INC * sc;
+	reg = PPE_IN_L2_SERVICE_TBL_ADDR + PPE_IN_L2_SERVICE_TBL_INC(ppe_dev) * sc;
 
-	ret = regmap_write(ppe_dev->regmap, reg, val);
+	in_l2_val[0] = val;
+
+	bitmap_value = bitmap_read(cfg.bitmaps.egress, PPE_SC_BYPASS_EGRESS_SMAC_MC_DROP,
+				   PPE_SC_BYPASS_EGRESS_SIZE - PPE_SC_BYPASS_EGRESS_SMAC_MC_DROP);
+	in_l2_val[1] = FIELD_PREP(PPE_IN_L2_SERVICE_TBL_W1_BYPASS_BITMAP_EXT, bitmap_value);
+
+	ret = regmap_bulk_write(ppe_dev->regmap, reg, in_l2_val,
+				PPE_IN_L2_SERVICE_TBL_WORDS(ppe_dev));
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.h b/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
index 60493e51e0a4..e7cdab9d963a 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
@@ -163,6 +163,10 @@ enum ppe_sc_egress_type {
 	PPE_SC_BYPASS_EGRESS_FAKE_MAC_DROP = 21,
 	PPE_SC_BYPASS_EGRESS_TUNL_CONTEXT = 22,
 	PPE_SC_BYPASS_EGRESS_FLOW_POLICER = 23,
+	/* Values 24-26 are only supported by IPQ5424. */
+	PPE_SC_BYPASS_EGRESS_SMAC_MC_DROP = 24,
+	PPE_SC_BYPASS_EGRESS_L2_FLOODING = 25,
+	PPE_SC_BYPASS_EGRESS_TUNNEL_EXP_CNT_CTRL = 26,
 	/* This must be last as it determines the size of the BITMAP. */
 	PPE_SC_BYPASS_EGRESS_SIZE,
 };
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
index 441e8e04a80b..089aa34b7732 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
@@ -223,13 +223,23 @@
 /* PPE service code configuration for destination port and counter. */
 #define PPE_IN_L2_SERVICE_TBL_ADDR		0x66000
 #define PPE_IN_L2_SERVICE_TBL_ENTRIES		256
-#define PPE_IN_L2_SERVICE_TBL_INC		0x10
+#define PPE_IN_L2_SERVICE_TBL_IPQ9574_INC	0x10
+#define PPE_IN_L2_SERVICE_TBL_IPQ5424_INC	0x20
+#define PPE_IN_L2_SERVICE_TBL_INC(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_IN_L2_SERVICE_TBL_IPQ5424_INC :	\
+					  PPE_IN_L2_SERVICE_TBL_IPQ9574_INC)
+#define PPE_IN_L2_SERVICE_TBL_IPQ9574_WORDS	1
+#define PPE_IN_L2_SERVICE_TBL_IPQ5424_WORDS	2
+#define PPE_IN_L2_SERVICE_TBL_WORDS(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_IN_L2_SERVICE_TBL_IPQ5424_WORDS :	\
+					  PPE_IN_L2_SERVICE_TBL_IPQ9574_WORDS)
 #define PPE_IN_L2_SERVICE_TBL_DST_PORT_ID_VALID	BIT(0)
 #define PPE_IN_L2_SERVICE_TBL_DST_PORT_ID	GENMASK(4, 1)
 #define PPE_IN_L2_SERVICE_TBL_DST_DIRECTION	BIT(5)
 #define PPE_IN_L2_SERVICE_TBL_DST_BYPASS_BITMAP	GENMASK(29, 6)
 #define PPE_IN_L2_SERVICE_TBL_RX_CNT_EN		BIT(30)
 #define PPE_IN_L2_SERVICE_TBL_TX_CNT_EN		BIT(31)
+#define PPE_IN_L2_SERVICE_TBL_W1_BYPASS_BITMAP_EXT	GENMASK(7, 0)
 
 /* L2 Port configurations */
 #define PPE_L2_VP_PORT_TBL_ADDR			0x98000

-- 
2.43.0

