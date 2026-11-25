Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631036;
	b=W50JDjU9GvsEEXq6R5hkhDhqm6lET14qH9jrYnbRX77NdtW4LipvOwQq3OFDqs2w0iJz
	 RFzv/cytynknwn/jxVdN7cO0S4A3MfrrZOYXb+y0EdTF91tgvchD5Jr/7cpzHQ1r5EZLa
	 NRDKNnFJSSyRq+vdqELa/kWXXqd8Ka96GyigXgK6hFIF/k5+sLSzel+jmQMVeqP/fZZvn
	 8O2gU6LabcgIIV5NzUQQhO6+YFrjn+PSRk/2qoFUEdbZoc4SKjsKuLuDrtBIeghSJPzsL
	 C0Qh0ZuPZT5W1mIfWB+f0h+m3hmrsWmdmHcSHNJye2gVRalNqjyTFGPhk2g+r3RYY+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NK6/PcS8uONbf6TCuKFByfP7rgK+6K5oJPKTjEJwaEI=;
	b=DakRW+Ma40QIzeAA2T2q5KP5HpFBF7MzBIgjMynRPr1D5GL2YANN9JgtdOPAeeGWxHGQ
	 Uyoq69A7xAHKWM+/f3MBTBFgwl6Z+PXYjEZcFCobUdmR28tV8vV/Q8ZYdV43iCohdp8dS
	 JMyCKkpBaLQQXoFTVCELTi2gvrc8rysT9e/RqxZXdx3Eknw68tc4u0n9+Xmv5ZBrrPikf
	 H7JAa381l7o+e2p9cXgKDUCeTWFFTDCknc18278/Y3jIduWfjmy4iHscrh/FMXsmstL8e
	 EZfrbxUOfdeP8S/MWdBTi7oiW+MlV5csJerrmaDlAXhuciDMwDmqQWf5MvFobirZ8Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eY7Ec61I;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KeKtbTos;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC3B606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AC3B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eY7Ec61I;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KeKtbTos
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQ8wK999516
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NK6/PcS8uON
	bf6TCuKFByfP7rgK+6K5oJPKTjEJwaEI=; b=eY7Ec61IJ+CmA8Lt65gBegNBa4I
	BxYkj5bRXnfLiHRGZxAQzZ7hqwc4RyHU3SyvY2X1R/nLQFmtpASUDwZj3rG6iVTT
	X97S+E3gufkMOpS2G62yjADsEO/4QcfVOIQq8gyha8AMIAQ7NcvME8plBHNJov3C
	no9gzR/djQBjOI/+BYbgTcMTnjnRGFbSsPLQlY0a/aLus589nWVDjJgcr/SReK4+
	aOgMafToHq67lmANs88/v3z7OJ2UNbV5PfdWSPnt7ut2vu+zyL2Mwcodcv+G2mjz
	ZUmd+wnlM46f77ZU0JWieKifGA5Iv7tl1RBLuFo1+J+lRqJj+g2ZjDNxNow==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5yaxsg88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:55 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b4b2b422c5so56448017b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631034; x=1796235834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NK6/PcS8uONbf6TCuKFByfP7rgK+6K5oJPKTjEJwaEI=;
        b=KeKtbTosKoaCiOxciEh8MA1N4kqaX8piz1SwV3uob1TvvrNv2wyotm8zdYQSz3dmxF
         SRTWleNJEfI8cSOx4xrxnL5yHV4rSsfIyP2pwfH5JbiNqr1mAopVukNfErW5lx5JcvTk
         8nDT/tNGUkaNhftC8+6MVzHgkc9QiPRdcldhUTgMdXqJPtmG/8XKaLSZ+NDV8FbPJV65
         MEm+qhFSKMs6ndZFGCqG3ZbLHXo43UOl8CeT9I0SVx8Lalu8x6lypbo/opbjxoIPN1R+
         WNUt/GwQ7ho8L6WPJpectysXMqSLQn12unJuZt4kD/0kOfrsyMiw83Ku86GQGK3LVs+/
         xh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631034; x=1796235834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NK6/PcS8uONbf6TCuKFByfP7rgK+6K5oJPKTjEJwaEI=;
        b=kJraurgvOmcireM5uQ4+neVZ6wIxJHUcSFW/WwHO6giE6ik318zsv4n4FqoMUIt9sR
         Ok+bGp4pLsxcqJufme/hfHMQ/kDqXit9CeUXxMoIqJhSB7HzwDHO/Hxcz8e3W9+hM8/X
         wOttdQvjRm4ivyjOIxM4zh1pxO9DPyt8Gxo4EloQ7LDeLvx8qlF7OQPhpqDcDJM8PIk3
         XJJg3iIY8sKiFjrH3kKbMZXmdTFQfpsqu12kf7r3U5xlISwnW3PcMI+j+gGvcml0ZhGZ
         bcqGoQ5v7QV8eEz8wXGmU+KE7tTJoxQuoMPhuFTAo9zjyZ/0G/2BVlHybhCX3kIKD7wh
         8D+Q==
X-Forwarded-Encrypted: i=1; AL+hErEjEMVU6RMvvDmnZe/hnWZM+c5MzVXshGsKtDhGP6IwpbF0r2bvkrqQBDp3Nq5XIjIqedz/W3ekcIpMAKUz@vger.kernel.org
X-Gm-Message-State: APuU4Z8+4QpmO9fsWwxIiSBOn4cJ+w0L6SSsM8RxmUexYQUo1gav8fVQ
	guPsuwFd8Ylyb2yqZj/h80N6H5viBKHkA3ikMcQK66gk84GJZnOMxGPcJFghvMbVrtL0fGKcuo6
	GIDPk4BnKKUS6cnT4k3xandoyb/y7TOq2HOhxeSxVKpSrI1xlwYiViZSIf7ru81F02FuN
X-Gm-Gg: AZFdTZdq2ucjwapY80gm75VxIffxoUVYdP6Qdw/fveTMu1ylNb04VcPzOZkOPTP+Sh0
	vgnoo/qLiwDXL03ZVeY6gi6nsUU1elX2NdI4QgNUEmEMcdj1MSSsnCfICjZX9VMxqYg3yDV4GBO
	s5RELvy5l+5slxqXtVIa3HSunekLMh8cpX5yJIdofeyeDvS8T91guqvBkAesgvub1toV9CFyOfE
	Rc2Uz73fG/oT4o+ggvzdxtxvt7klsrR/dAaLdVyHQwUU3tH+KBsaXoJyBlrsaZxwpi3PK5Wc9lW
	NuFrXdQUA4IUUww28ITkR3nYuztr8hUlHgUIRKpJXS5RUlUuOuEbHbKnB6JBh54X55HpHAtZVNs
	V2Oiy8V7BrfZFr6Lsk/g3U4OZFgOBFOLpFlp42AkIUmjmIsRfWJIhXeVAZgtCW05rMBTpyDGRvB
	swy5eC
X-Received: by 2002:a05:690c:3749:b0:8a9:d5f2:f5a6 with SMTP id 00721157ae682-8b5204cd1b8mr67206517b3.67.1795631034232;
        Wed, 25 Nov 2026 10:23:54 -0800 (PST)
X-Received: by 2002:a05:690c:3749:b0:8a9:d5f2:f5a6 with SMTP id 00721157ae682-8b5204cd1b8mr67206397b3.67.1795631033569;
        Wed, 25 Nov 2026 10:23:53 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:52 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 07/12] media: qcom: camss: Add streams API support in tpg subdev
Date: Wed, 25 Nov 2026 20:23:21 +0200
Message-Id: <20261125182326.2767771-8-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qkM_3eV8kv13u93iohHAX_ogjwCc0tPx
X-Proofpoint-ORIG-GUID: qkM_3eV8kv13u93iohHAX_ogjwCc0tPx
X-Authority-Analysis: v=2.4 cv=ULpIjyfy c=1 sm=1 tr=0 ts=6b0727bb cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=B3zJfmbLvRk507KYyW4A:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX5PmaI7L/fVVG
 ADiLTuIgznwaaNCFm5j6GN2WmrjQ4PEXzA08NAlN2dmeW6LWRPcMx2NKvNMiBEHesWDjBglxxU0
 rDE4AAQ642ReXBNBkGtV7aGYVCC31UFCRMWqIVZlhHbR0klN4hf4FQytl/uBHnLBb+KEoFpJtha
 6ia18HB4KE3aVsZD5Ed1demTxx8BI3guUCO3ErGzwTXVKBL+SwYoAqHTLKYxSLkZsClHG1KCvrg
 0xx/ppGaaQBSgkLSaZUXAxSbYzYjMeKVjJWeoKa4SMHrdJSFBqmfY+9WcxnfW62xuA7XvqpdBol
 6y6HLyA/iQ924zHAlvL0Yb4iusPfkR80yhE/qX3hGb7Xd823BMchI13gNOYgK6wAAgETUJzFfcU
 t1xDrn+si5/na5tvBMpt3KPx7sgFQptndpFjU3pQGAAsfEtCylNtg+CUsPOzs9mOKCwJxt6NlpZ
 CdTHqoyAJMEj+tQ3Bmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX9s5B94FQf6R6
 oywTDnPFGuezDT41oHCZ/mA0o/WVKEphi7o1D3ykP9sO9L+meuejvD6SqIYcdLUEuVVCrcMtAMZ
 FjkKisCUT5xCJWzzVfHqeQtjkcgtXH4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

Add support for the TPG subdevice to generate multiple concurrent
virtual channels under the streams API. Replace the single fmt field
with a per-stream array sized MSM_TPG_MAX_STREAMS and track the set
of active streams in a new enabled_streams bitmask.

Add tpg_pad_enable_streams()/tpg_pad_disable_streams() pad ops that
update enabled_streams and (re)configure the hardware, a
tpg_get_frame_desc() implementation that reports one CSI-2 frame
descriptor entry per active route with VC equal to the stream index,
and a tpg_init_state() internal op that sets up one default route per
stream.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-tpg-gen1.c      |  63 +++---
 drivers/media/platform/qcom/camss/camss-tpg.c | 179 +++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-tpg.h |   6 +-
 3 files changed, 205 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..22fdeef8e76f 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -5,6 +5,7 @@
  *
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
+#include <linux/bitops.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 
@@ -106,13 +107,16 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	u8 payload_mode = (tg->mode > TPG_PAYLOAD_MODE_DISABLED) ?
 			   tg->mode - 1 : 0;
 	u8 lane_cnt = tpg->res->lane_cnt;
-	u8 vc, dt, last_vc = 0;
+	u8 vc, last_vc = fls64(tpg->enabled_streams) - 1;
 	u32 val;
 
-	for (vc = 0; vc <= MSM_TPG_ACTIVE_VC; vc++) {
-		last_vc = vc;
-
-		input_format = &tpg->fmt;
+	/*
+	 * The hardware generates traffic for VC 0 up to last_vc as a
+	 * contiguous block, so every VC in that range must be configured
+	 * with a valid format, not just the ones actually streaming.
+	 */
+	for (vc = 0; vc <= last_vc; vc++) {
+		input_format = &tpg->fmt[vc];
 		format = tpg_get_fmt_entry(tpg->res->formats->formats,
 					   tpg->res->formats->nformats,
 					   input_format->code);
@@ -120,7 +124,8 @@ static int tpg_stream_on(struct tpg_device *tpg)
 			return -EINVAL;
 
 		/* VC configuration */
-		val = FIELD_PREP(TPG_VC_n_CFG0_NUM_ACTIVE_DT, MSM_TPG_ACTIVE_DT) |
+		val = FIELD_PREP(TPG_VC_n_CFG0_VC_NUM, vc) |
+		      FIELD_PREP(TPG_VC_n_CFG0_NUM_ACTIVE_DT, 0) |
 		      FIELD_PREP(TPG_VC_n_CFG0_NUM_FRAMES, 0);
 		writel(val, tpg->base + TPG_VC_n_CFG0(vc));
 
@@ -136,31 +141,29 @@ static int tpg_stream_on(struct tpg_device *tpg)
 		writel(TPG_COLOR_BARS_CFG_STANDARD, tpg->base + TPG_VC_n_COLOR_BARS_CFG(vc));
 
 		/* DT configuration */
-		for (dt = 0; dt <= MSM_TPG_ACTIVE_DT; dt++) {
-			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT,
-					 input_format->height & 0xffff) |
-			      FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH,
-					 input_format->width & 0xffff);
-			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_0(vc, dt));
-
-			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_1_DATA_TYPE, format->data_type);
-			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_1(vc, dt));
-
-			if (tpg->hw_version == TPG_HW_VER_2_0_0) {
-				val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, payload_mode) |
-				      FIELD_PREP(TPG_V2_0_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
-						 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
-				      FIELD_PREP(TPG_V2_0_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
-						 format->encode_format);
-			} else if (tpg->hw_version >= TPG_HW_VER_2_1_0) {
-				val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, payload_mode) |
-				      FIELD_PREP(TPG_V2_1_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
-						 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
-				      FIELD_PREP(TPG_V2_1_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
-						 format->encode_format);
-			}
-			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_2(vc, dt));
+		val = FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT,
+				 input_format->height & 0xffff) |
+		      FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH,
+				 input_format->width & 0xffff);
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_0(vc, 0));
+
+		val = FIELD_PREP(TPG_VC_m_DT_n_CFG_1_DATA_TYPE, format->data_type);
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_1(vc, 0));
+
+		if (tpg->hw_version == TPG_HW_VER_2_0_0) {
+			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, payload_mode) |
+			      FIELD_PREP(TPG_V2_0_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
+					 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
+			      FIELD_PREP(TPG_V2_0_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
+					 format->encode_format);
+		} else if (tpg->hw_version >= TPG_HW_VER_2_1_0) {
+			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, payload_mode) |
+			      FIELD_PREP(TPG_V2_1_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
+					 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
+			      FIELD_PREP(TPG_V2_1_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
+					 format->encode_format);
 		}
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_2(vc, 0));
 	}
 
 	/* Global TPG control */
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/media/platform/qcom/camss/camss-tpg.c
index 5764a60fa34c..a7ef6d2bb4e8 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg.c
@@ -200,22 +200,78 @@ static int tpg_set_stream(struct v4l2_subdev *sd, int enable)
 				"could not sync v4l2 controls: %d\n", ret);
 			return ret;
 		}
+
+		tpg->enabled_streams = BIT_ULL(0);
+	} else {
+		tpg->enabled_streams = 0;
 	}
 
 	return tpg->res->hw_ops->configure_stream(tpg, enable);
 }
 
+static int tpg_pad_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	bool start = !tpg->enabled_streams;
+	int ret;
+
+	if (pad != MSM_TPG_PAD_SRC)
+		return -EINVAL;
+
+	tpg->enabled_streams |= streams_mask;
+	if (!start)
+		return tpg->res->hw_ops->configure_stream(tpg, 1);
+
+	ret = v4l2_ctrl_handler_setup(&tpg->ctrls);
+	if (ret < 0) {
+		tpg->enabled_streams &= ~streams_mask;
+		return ret;
+	}
+
+	ret = tpg->res->hw_ops->configure_stream(tpg, 1);
+	if (ret)
+		tpg->enabled_streams &= ~streams_mask;
+
+	return ret;
+}
+
+static int tpg_pad_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   u32 pad, u64 streams_mask)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+
+	if (pad != MSM_TPG_PAD_SRC)
+		return -EINVAL;
+
+	tpg->enabled_streams &= ~streams_mask;
+
+	/*
+	 * Growing the active VC range live is safe, but shrinking it while
+	 * the generator is still running for the remaining VCs corrupts its
+	 * state machine. Only touch the hardware when the last VC disables.
+	 */
+	if (tpg->enabled_streams)
+		return 0;
+
+	return tpg->res->hw_ops->configure_stream(tpg, 0);
+}
+
 static struct v4l2_mbus_framefmt *
 __tpg_get_format(struct tpg_device *tpg,
 		 struct v4l2_subdev_state *sd_state,
-		 unsigned int pad,
+		 unsigned int pad, u32 stream,
 		 enum v4l2_subdev_format_whence which)
 {
+	if (pad != MSM_TPG_PAD_SRC || stream >= MSM_TPG_MAX_STREAMS)
+		return NULL;
+
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_state_get_format(sd_state,
-						    pad);
+		return v4l2_subdev_state_get_format(sd_state, pad, stream);
 
-	return &tpg->fmt;
+	return &tpg->fmt[stream];
 }
 
 static void tpg_try_format(struct tpg_device *tpg,
@@ -282,7 +338,7 @@ static int tpg_get_format(struct v4l2_subdev *sd,
 	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->which);
+	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->stream, fmt->which);
 	if (!format)
 		return -EINVAL;
 
@@ -299,10 +355,13 @@ static int tpg_set_format(struct v4l2_subdev *sd,
 	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->which);
+	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->stream, fmt->which);
 	if (!format)
 		return -EINVAL;
 
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE && tpg->enabled_streams)
+		return -EBUSY;
+
 	tpg_try_format(tpg, &fmt->format);
 	*format = fmt->format;
 
@@ -326,6 +385,69 @@ static int tpg_init_formats(struct v4l2_subdev *sd,
 	return tpg_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 }
 
+static int tpg_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+			      struct v4l2_mbus_frame_desc *fd)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *route;
+	unsigned int i = 0;
+
+	if (pad != MSM_TPG_PAD_SRC)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	for_each_active_route(&state->routing, route) {
+		const struct tpg_format_info *format;
+
+		format = tpg_get_fmt_entry(tpg->res->formats->formats,
+					   tpg->res->formats->nformats,
+					   tpg->fmt[route->source_stream].code);
+		if (IS_ERR(format))
+			continue;
+
+		fd->entry[i].stream = route->source_stream;
+		fd->entry[i].flags = 0;
+		fd->entry[i].bus.csi2.vc = route->source_stream;
+		fd->entry[i].bus.csi2.dt = format->data_type;
+		i++;
+	}
+
+	fd->num_entries = i;
+	v4l2_subdev_unlock_state(state);
+
+	return 0;
+}
+
+static int tpg_init_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev_route routes[MSM_TPG_MAX_STREAMS];
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+	struct v4l2_mbus_framefmt fmt = {
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.width = 1920,
+		.height = 1080,
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(routes); i++) {
+		routes[i].sink_pad = MSM_TPG_PAD_SRC;
+		routes[i].sink_stream = i;
+		routes[i].source_pad = MSM_TPG_PAD_SRC;
+		routes[i].source_stream = i;
+		routes[i].flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
+		tpg->fmt[i] = fmt;
+	}
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing, &fmt);
+}
+
 static int tpg_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct tpg_device *tpg = container_of(ctrl->handler,
@@ -433,16 +555,36 @@ static const struct v4l2_subdev_pad_ops tpg_pad_ops = {
 	.set_fmt = tpg_set_format,
 };
 
+static const struct v4l2_subdev_pad_ops tpg_streams_pad_ops = {
+	.enum_mbus_code = tpg_enum_mbus_code,
+	.enum_frame_size = tpg_enum_frame_size,
+	.get_fmt = tpg_get_format,
+	.set_fmt = tpg_set_format,
+	.get_frame_desc = tpg_get_frame_desc,
+	.enable_streams = tpg_pad_enable_streams,
+	.disable_streams = tpg_pad_disable_streams,
+};
+
 static const struct v4l2_subdev_ops tpg_v4l2_ops = {
 	.core = &tpg_core_ops,
 	.video = &tpg_video_ops,
 	.pad = &tpg_pad_ops,
 };
 
+static const struct v4l2_subdev_ops tpg_streams_v4l2_ops = {
+	.core = &tpg_core_ops,
+	.video = &tpg_video_ops,
+	.pad = &tpg_streams_pad_ops,
+};
+
 static const struct v4l2_subdev_internal_ops tpg_v4l2_internal_ops = {
 	.open = tpg_init_formats,
 };
 
+static const struct v4l2_subdev_internal_ops tpg_streams_internal_ops = {
+	.init_state = tpg_init_state,
+};
+
 static const struct media_entity_operations tpg_media_ops = {
 	.link_setup = tpg_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
@@ -453,12 +595,15 @@ int msm_tpg_register_entity(struct tpg_device *tpg,
 {
 	struct v4l2_subdev *sd = &tpg->subdev;
 	struct device *dev = tpg->camss->dev;
+	bool streams_api = tpg->camss->res->streams_enable;
 	int ret;
 
-	v4l2_subdev_init(sd, &tpg_v4l2_ops);
-	sd->internal_ops = &tpg_v4l2_internal_ops;
+	v4l2_subdev_init(sd, streams_api ? &tpg_streams_v4l2_ops : &tpg_v4l2_ops);
+	sd->internal_ops = streams_api ? &tpg_streams_internal_ops : &tpg_v4l2_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 		     V4L2_SUBDEV_FL_HAS_EVENTS;
+	if (streams_api)
+		sd->flags |= V4L2_SUBDEV_FL_STREAMS;
 	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
 		 "msm_tpg", tpg->id);
 	sd->grp_id = TPG_GRP_ID;
@@ -497,15 +642,27 @@ int msm_tpg_register_entity(struct tpg_device *tpg,
 		goto free_ctrl;
 	}
 
+	if (streams_api) {
+		ret = v4l2_subdev_init_finalize(sd);
+		if (ret) {
+			dev_err(dev, "Failed to finalize subdev: %d\n", ret);
+			goto media_cleanup;
+		}
+	}
+
 	ret = v4l2_device_register_subdev(v4l2_dev, sd);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register subdev: %d\n", ret);
-		media_entity_cleanup(&sd->entity);
-		goto free_ctrl;
+		goto subdev_cleanup;
 	}
 
 	return 0;
 
+subdev_cleanup:
+	if (streams_api)
+		v4l2_subdev_cleanup(sd);
+media_cleanup:
+	media_entity_cleanup(&sd->entity);
 free_ctrl:
 	v4l2_ctrl_handler_free(&tpg->ctrls);
 
@@ -515,6 +672,8 @@ int msm_tpg_register_entity(struct tpg_device *tpg,
 void msm_tpg_unregister_entity(struct tpg_device *tpg)
 {
 	v4l2_device_unregister_subdev(&tpg->subdev);
+	if (tpg->camss->res->streams_enable)
+		v4l2_subdev_cleanup(&tpg->subdev);
 	media_entity_cleanup(&tpg->subdev.entity);
 	v4l2_ctrl_handler_free(&tpg->ctrls);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.h b/drivers/media/platform/qcom/camss/camss-tpg.h
index 7fb35a97dd06..5a6e9e726716 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg.h
+++ b/drivers/media/platform/qcom/camss/camss-tpg.h
@@ -26,8 +26,7 @@
 #define ENCODE_FORMAT_UNCOMPRESSED_24_BIT	0x7
 
 #define MSM_TPG_PAD_SRC		0
-#define MSM_TPG_ACTIVE_VC		0
-#define MSM_TPG_ACTIVE_DT		0
+#define MSM_TPG_MAX_STREAMS		4
 
 #define TPG_MIN_WIDTH   1
 #define TPG_MIN_HEIGHT  1
@@ -89,11 +88,12 @@ struct tpg_device {
 	struct camss_clock *clock;
 	int nclocks;
 	struct tpg_testgen_config testgen;
-	struct v4l2_mbus_framefmt fmt;
+	struct v4l2_mbus_framefmt fmt[MSM_TPG_MAX_STREAMS];
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *testgen_mode;
 	const struct tpg_subdev_resources *res;
 	u32 hw_version;
+	u64 enabled_streams;
 };
 
 struct camss_subdev_resources;
-- 
2.34.1

