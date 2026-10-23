Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775887;
	b=nvx8O1otLM7TEEhTygFUzZwi0Umn9y9LsYf4Kv8fjvH8GlSyvctiF6H4rfjYdi+eXkMX
	 P27YZhax6MZEHS00sqtS0Y8gA4LQkMNf8UJPR5KteVN1mvzYdDXXRlFBG7pfy/aLnsXlK
	 RL3Ksacst60LajhI/hwHHRm8JdxKd5No9vBzIFhhFX7xFn1L94CUKsGSHo3Yfq6P4PY+o
	 RH++rr4ngW/b0MaEDe1VjlmBhWG40RhS22tm+pJupjQBGqjaAtYeC3MIzp7EIHzTMWUOd
	 FWZsPWmuCcvi54wdYBlIc/czBF1PWdjGUhrSUzahZ3//BZ//M6EUDeT0hdnxuO4O9EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5T+eklRSuPXOFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=;
	b=5JgDSEqZitXcRxJbt45FzDjiAMKHh3fMvY/qTeJfWvt61GZlp/w9eHw/EfTEgSrlNkDr
	 AhJIF+yDono2mJ4W6oZJUWY/WVg9tsOPw+ZVSQnPBbaha9FPgoZHhrb7V0lkHl11sJIFH
	 BHAfvEN+3OjUqZy4Uqhj/6R+q9nWsYRr1NloRjOzt8pyyPtwBT/g4rSM769KVoEwoR0Vu
	 ZnLPUUj3ROIBf7346XTYTifWvK3HtZf5Qex8pEGyqUYVbez9Wpu3QDPtr5H9PgVcxgjs1
	 97W82ajwv9XuC++wKxYgy3XnDbabzddr3/U/1iB/LBVzVN5s6nsd9Xm0Js4lcGJ1Dtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHBfgWfY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JlF5tTdT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6360E60A5BE1
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6360E60A5BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CHBfgWfY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JlF5tTdT
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NG33043734686
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5T+eklRSuPX
	OFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=; b=CHBfgWfYo193RQkrldZ8J0KogoN
	ppn3J4x+BoXgvo6Ii7dPPtTab9kJlel/eIEE3Ed4Yw5Gn5UH1K7296cuSUfGjMoF
	5FqcMZPKI1ZjQr/CrVJdnjfn9c3w+agHBix8+6C9hfSe2TNEdFc//hPs4ZI3g7Lz
	GruvMK/PUYuQcKTpkhyte4Et8bY3H2va6T8bEJQRPQcsYyosF4jiapUgwYBbNnkn
	dbk+79V0OCQAsjEPsWsXUc1yPrr2A3DBTqBccndaaII8kugvthM+40TQB1uZCC3M
	y0M2d+sgDmbSe4552H1MiZF2YG9l81R7luns2EHgwUjN8gZFtGBWBzFxe2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgarug9d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:18:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ecdc701a2so151554285a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792775885; x=1793380685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5T+eklRSuPXOFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=;
        b=JlF5tTdToMf1M8+qngUfLf4dSVnbTeDbH1qstrEDxu32HlUsDBNjqDidKGJvKgGtzZ
         B9UGPi4rPk9XwIByN3B4JoArAbOlx/14pl23T8aMlRtA+ZRIomrOUY3Z0+wU1qEF7dxs
         CnhzVSz7tl2rodGPYDBvOxz8jCCogqlN7DZPwivOnvAM5yGu2X8FXFjuvaoiEOJi01sU
         /620IM9o4qk2SJ+rxCO87/1/iWrJr1QpJ4GxBHy30hm/Y3TTotHfxC7qyARBaqSab/l7
         dg4tatfmnuUGIUW2V0ZFK6RXlpP+f98LCjovVJvsvne6VyPR17KZyvoMm58ZCH9qu8BJ
         trdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775885; x=1793380685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5T+eklRSuPXOFCyqOwoiO+bLFastCsJoWvpm+QdwBPI=;
        b=jPgmk5vZKQ44C4BebhFgQSpCUCgR3TcoP9p2TIt2ZQAhJjHs54V7PJTJBTVitB9JgV
         Rb22M1Ziv17hDHNeIcd2Qg2AnXu9DmosUWGAPrILg0WCJ/89vtdeGSLLND9rvyBfD8CK
         kNb1O8VuqyS8ZINReeOneU4tt3EL9/hblQ0VWgp5O2dLNWQbghp+W9BMANHXjLn86nHy
         h13NXFH3GUF12zQO4n5aC4eLe9TOQvUiiadjgqOJ2fIv7Yn6knZSnX2CnhH1I8E4N0cH
         vkxdpd2Q6EjokHpoqOQT5FQntrU/ZD/nPszMfu3DAgh/8YelA62ipzJ+DGUgZ3Z+um3R
         Gs3g==
X-Forwarded-Encrypted: i=1; AKwUvBzPkHo6dle386m2LKNGolq+Eprgx/avSBi89FWbJm7/YBaJCyurN038HL16vmYO2svqv3CT9eNuK1LEMNhC@vger.kernel.org
X-Gm-Message-State: AFq9FYKqiVR4GqJ5ZL+4K97A0z0z6oCe7+/akPm4O4pH1bJm8IzUEODf
	Z4qnOU1Ied3nO7t/i0UaCkq7lIMWaJJm4e9UQH21WfAnp6oQeuNMWduzm6SPo//4rK+nzxUN5ow
	LUUR7HyllxR0gYYOTtyX3Dfr7ArDedhahKSAA8Hnv+4QhOzK1EBRPZTwG60RDIQvoTBhj
X-Gm-Gg: AYBFou3hNcLRyIhhX17xY99djd2QqkVLfPuhLWincKngmw8ESnZVh9euOwZgxwlwh/i
	+0B5yYZbs88FgrLwFLL4nAhIIdeDicwZ7z8obp7vTME97ju6Y4VowtS2525cVTr2t8L5r1RVXpD
	Junva/egq430zVmdGvSwe7ehCA6blSqxHpFQjsIS0y3joenUCYUIXRFyQ6AB9A0DGCyhe0D2O8N
	QMW562soA6vFlMcDIyRjOzrgtWr3kGFKrEZfOYVXdiXyz/aVWdNsng9CvfQ9GgCY0GuxjMI22go
	HNnA8/bNjqjKSFU+sP8hn/ffaSN8igS5MQGq0iseIEWmd3LVc0JqXf95WvNOBCpA27j0wq7D/nq
	UA9yrluHEDCFb
X-Received: by 2002:a05:620a:6403:b0:93e:a71a:5de0 with SMTP id af79cd13be357-93f6f908691mr502263585a.26.1792775884593;
        Fri, 23 Oct 2026 10:18:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6403:b0:93e:a71a:5de0 with SMTP id af79cd13be357-93f6f908691mr502259185a.26.1792775884048;
        Fri, 23 Oct 2026 10:18:04 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d41e0fesm937475f8f.46.2026.10.23.10.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:18:03 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RFC PATCH 10/23] ASoC: qcom: audioreach: support up to four speakers in VI feedback
Date: Fri, 23 Oct 2026 18:14:20 +0100
Message-ID: <20261023171433.820092-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfXxI1EZni2tYcO
 IDBpLkewL6QYEh4T5CbTrColXzTWqUlHRTKBDDqvh9+BADGzKbgm9zleHPiuHmLbHetkl8Tq+kU
 g/7qB9MnAYJfnRsSHAfUYUX3QzQC4Z4=
X-Proofpoint-GUID: xJn49FZm3-0pHqYroGYIxdv70EONVlVC
X-Authority-Analysis: v=2.4 cv=SK7Xx+vH c=1 sm=1 tr=0 ts=6adb96cd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=0B2h0znxLllEwdGFOn4A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: xJn49FZm3-0pHqYroGYIxdv70EONVlVC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2NyBTYWx0ZWRfX0tAY9L/XI2wS
 2U7JOE0+5pD+c0YQJ9yc3RImYGtZZgKfALlGkpwkXhCJKkvUTI0PU3xXC3F78Ez8gpb/tlbMSd8
 R9wtAaEOjpXUecA21A5WB9r718Ggx4cSD6w5YtZHrTCJnzdM6Fnu7X8reHNQLlXgXVQBk0KBryi
 yjTnrMpdUqyxZvHdMyWIBrDoSPbL29igo1OOl6ICFmbAWzS3DfzK8laoS7SSU0bkbQI3zGy3I/B
 yF+Rh81IMlnfZr6vPcjJh6HpWr3/kW8PzeTj4ZG+EgP8PqVL0fSkTpZsCWhx3QAgyLMs4b5WBOE
 xjwd7hlKNOfNKfQ5lQg7rR19A9IQdpHXzVsb8p1L/UHKU9TklDQxZFEk3QMBYaev40s8y/YKys4
 7AAVdEqPn4UPW2iwmTIua47OD8kx35rxV89/3d2bWgdY84L5AqyvWqgRK2GFgIk7z5gkJkcUc3y
 nkO7uhaizZ534BEap1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230067

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

audioreach_speaker_protection_vi() rejects more than two channels,
although the rest of the function scales with the channel count.
Laptops with four speakers need four.

Raise the limit to MAX_SP_VI_SPEAKERS (4).

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 2 +-
 sound/soc/qcom/qdsp6/audioreach.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 75995426b9f6..24198cde8158 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1508,7 +1508,7 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
 	u32 num_speakers;
 	void *p;
 
-	if (num_channels > 2) {
+	if (num_channels > MAX_SP_VI_SPEAKERS) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
 		return -EINVAL;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 4744d3117010..c8c7fa4f6f70 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -696,6 +696,8 @@ struct param_id_sp_op_mode {
 
 /* Speaker Protection VI */
 
+#define MAX_SP_VI_SPEAKERS			4
+
 #define PARAM_ID_SP_VI_OP_MODE_CFG		0x080011f4
 #define PARAM_ID_SP_VI_OP_MODE_NORMAL		0
 #define PARAM_ID_SP_VI_OP_MODE_CALIBRATION	1
-- 
2.47.3

