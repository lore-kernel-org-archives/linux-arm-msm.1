Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593625;
	b=rWgWZwFwgOW0ZL4dsjvn3f4si1gjp5s0pRBLbsVvOH1dw36T5iJ/dmJyQj5Bpwl6DsKJ
	 QWX+nzIVWpaD8eT9YY+PvNP3zUl+z1NqxCzGBzYsPmB2A0e8MlGN1kbpKsKf8mtHf0IdZ
	 JxoGjx8lzzUkiBxlgi6/tjaQuRtYy1xhJCvOJt1kyZxUlN7eCoJRMa3xu5YvmPF0aUtEK
	 6dSC0ViRihii1d3as3kk8CTslQ1ydP8G92T1slIXX9uN8e81Z7H9LfboZgD448s/BWYe/
	 X2aiBkiwuc8UhreFLL7X8/W0lmEB4DmEORq64vJXKeICSfUs05E4cCtuDfwGVYSNstg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593625;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E8makF8FM1RabaNV+Vat/DWzk+BJa7APz9oiRRwMMUc=;
	b=xgtbIwbr+Iukl7DgRg8/uacQyFv1sQ9yuQQhXsIf6RD5FkCdftLEeEoCc5bgb1ZfyrIh
	 JevSpXaAHUG8pxNmZrDAP1YyUEKB8wV9pTtHENwgK/qtZpX1sGcm0xg5KNpdOGBkCsooC
	 no9Pf5eE+rxNiqPj90PlzGN/TkaExq68gf6hQv0IbP/AUNi2G5VeZiYyj1Tu6hsRJrFvr
	 Ecq5fORIbHNhjtwIz2PCbZt1FmZcpn+Yi8cxQcq1JNbx/OkctnSFWs58bt3q6rdPoY3+r
	 BGBPOynP2zKXa53vZgQek3ZACNzZ2vNzhuz8w+p5kaowZhCh00enBS97x513VNKnbVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MB1nAShb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6406D60A2634
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6406D60A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MB1nAShb
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68XIK300008
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E8makF8FM1R
	abaNV+Vat/DWzk+BJa7APz9oiRRwMMUc=; b=MB1nAShb0YngRFbK/b2GGN+iqoj
	x0NLSeiX2LpC+1Nk+pwZ4eOpeVamc3tCac0ZhZRVI2a+Pyg+O/OnLEqvM2L4OjEV
	j7fF9FpvURfwX1msXv++ubB4evykAeiwQGSvN2pBLRcApmbBVDdtYTTEsBNIfzAG
	O/xhSrGHbXne5IshdA6rAu5FVWwjysdklV9Q+IIvm6ccvms4onJ51YVh3KEuaz2R
	yFfgBKdZqn2KkAodn9KJhnPc3lETh2qzHclqD1OmMufVWu0SZ1hI6aWgKXBxnqHF
	BfFkOQI+1V/PbHPvXoVDy4OlwXAsmrTMN6zSexymVTxVRNcdqQYJst43Ocw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rsfam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so1029231385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:00:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593623; x=1796198423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8makF8FM1RabaNV+Vat/DWzk+BJa7APz9oiRRwMMUc=;
        b=KT585sy+gP78u4NFJzw0GwtOe+mjRwguwV2Hgo/pq+dForO146nah2eWkuNmiW8X1u
         t5WwFvn8wYPMXUQodcvcmjweCFTbEinSEQvufJ5s8/dH3X5p2qvSpz4hecywWapX6fYD
         v+XOM7tUt5FymHlViFC7zuMqYbqk+JprnNkkuV1MigPoj5liBg/kpmNrglkqphyryneP
         kSvUzWrYCm3ocW97p2tI1dHRcaOs50+qZtw0owhwE6saER/s64WH6iiQD1CKa6yTfBSR
         msR+GPSOFych4J9tOVOPSX2EuCAaH2hf4/ai6vheunpMot9RvbanyMBt165UfN2XdTXz
         AijA==
X-Forwarded-Encrypted: i=1; AL+hErFIL5t2OrlHpSbT4t4x2Aw8z07mWrPxhN/AktxVnz/7AX04P77ip8Iy6JUvbfpHLoHvGEfSQyYqLEie/Nbu@vger.kernel.org
X-Gm-Message-State: APuU4Z/CyCLTdJVmj9JzCGkQR090eOgqoxg4ipv78cO548UnNLeRI2dS
	dWKAXWNkLpfA7WtG6fz8/URwXOeIroqR8pufGO1SK17ZXyiIdUiQlXvOLNIDxVZxRi9yuVpLTcg
	oWP7VbwoWLH9G2eDNUOnprXPUa0C2Du9IUF9YI3yynMvG3fbLfJbXDuH33/AKPbVQL6q0
X-Gm-Gg: AZFdTZcBpGxBjBHR5OmrY3cR1ji6SoWIC6WrNFHAW4pm3y8qwCoNI4KZAM+6d3pRGWa
	Z3bjr7UunhcLzYUPN1dsToRy53yEQj2Lir9D7mgTyZnwv6wvvbKxcYVa+sFk0IveZVpIJoWiNH7
	VA/8UTl1tSijKPBeKroJcOaR3vsxyAdPaiJHFGKPjXJsYM90g5r7ykgzGlX3EwuytVNHnXTUOWd
	rPgqjuNdyj3RuoG6gIdt7cqct6eueY9AzvJWKJucNBjBw8giG9VhSfmLIJ5v/TdVG3OIos4LxMT
	LE3CwQUz4m4CTS35b5nVfGbTY5D9S/vw432+nJ+VE8rX8NoZIphWN40kOrM2SJ8IMJ/kJ+SNuXJ
	ce+dW2MKZWXloDLup1Q==
X-Received: by 2002:a05:620a:f04:b0:949:3ba5:15d1 with SMTP id af79cd13be357-949ba8239b2mr2982726485a.4.1795593619798;
        Wed, 25 Nov 2026 00:00:19 -0800 (PST)
X-Received: by 2002:a05:620a:f04:b0:949:3ba5:15d1 with SMTP id af79cd13be357-949ba8239b2mr2982709285a.4.1795593618711;
        Wed, 25 Nov 2026 00:00:18 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:17 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 07/12] media: qcom: camss: Add streams API support in tpg subdev
Date: Wed, 25 Nov 2026 09:59:56 +0200
Message-Id: <20261125080001.2540101-8-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX0qMh07d3Fxz4
 xXrkW0oT3xPnoz5p9eCcD/ycKc20nITqSE2M0rESL4yu7XcybyAj9lMxZxTLH+IvZRydLYgvVqo
 /Tg05w3aNLPCABvXn3tI/LSnvTmXarK4uhqlGeJjVxsSMim2MtbMOR9tRcIpuT4MTtskIzY3EHO
 LaTOSSYQCh0GzDkfflqd6MsN0zL20pWSd4y7hHXAEG4XeXAV6MQGww2saLVHKVAL/z1Sb7DgqMk
 9Mzz/XfuHiHr10VE3ymKDmV8NbijEF84Xgsj4gOE5aIKdEvb+xSlREodcuiYpM9vIXZjhZoBIi1
 4/XxFYW2y/MUAMXaBSpAlO8dW5o0EIxQfaICkd953w4lg93I0yEwfb9aBn1TS6Sg9RcPWfIb21v
 mvRAT3diyOXck4y7Uc17pwUqtrCTnMac06Kh+aPTtUo/7Dlpfb1uD+6MyiexbwWaEigohM4P7F0
 7Kh1WlsebbhFb5msWDg==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b069598 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=CAsIyaI2BfGF7LVpe1AA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: yLqm66PWv0qN7irY_x9706th5El7QlGT
X-Proofpoint-ORIG-GUID: yLqm66PWv0qN7irY_x9706th5El7QlGT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX/5F2u0nlNzW1
 crc6DQmSQOcNtAHbM1tPdStYMMlUMYcP1W8dc/XDwpH4xQf3eCUsUmGklm9hyhb2ECGA/fACW9B
 2Ppfd3m9MjN+QBgPsZcFySzJzXnXhhg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

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

