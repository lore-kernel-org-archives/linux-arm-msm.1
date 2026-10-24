Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792834839;
	b=qHcIgMobvwgsf/LLF87eUsLntjXJA3xbyDp19o3e3cf8AQgbtcRWSaTSud7Coturgmpn
	 lDlvnCUz+JEC1wh4GZWxQOeAP8amaZqqQV155CFyQWVV9jtefqWB1b4X5HF9eklv4UbY+
	 W8sc5vsOPs8rXEF9eEleORpHxYSJIs9d5pCqNhMpILTKxn/yF4SlfmfS/DhRAbz9y9r9B
	 AKR/pXyJOFdk954oGhTeKyBLpWuH6Du+PGjKxYdhiIVqNemWhVRP3ZOp/lJLwDgEZndDC
	 G3kM/LTYaMMOid/02FUzRpejHafL485o2nb4vqkoieKWdrLTnKRhALnAxiLq3f6Di5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792834839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VFR0fSKAuE9J983F3nR4TA6iu8SbAHob6dRDH8URmk0=;
	b=AUAh5aqlpmWl3x8zXbPQyA1sbfdy1i+zK4b6Mp6rploqwbzd23gBKwgoa2BgwCe1XI3q
	 u9WJz7VyD72Vlw1s7I+M7sQSyymw0Hq7/dZDzwWfxR9SjiDuZY17hZanUXQm/9KE8tzS0
	 psbxFh5ratnjq19G03F9lHkviFVihdDgeGvEq+QiS1feH6PU2RvENChBs9MFlx4z2urx/
	 eeFo61Ntsg+AElDJU14Q4mOSfL3nA5NR8VzVlud8reWy1icMDOqJnTlj8/3P+3BpqX9Hl
	 XLpTPoXzJY9xnwjepFEPkA6+4dQJO39PwVF35rXREQX22JeGwNZBGTdt8Swj5nXs0Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BDHzIRV8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XhumLcag;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839BF606A330
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 09:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 839BF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BDHzIRV8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XhumLcag
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8o20h253251
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 09:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VFR0fSKAuE9
	J983F3nR4TA6iu8SbAHob6dRDH8URmk0=; b=BDHzIRV8Nl945kBJzWzGbvomScP
	42XGP4nwOfKlRLUnwg87UZzWYGNWIIyozxHhg79EkotB0ccuDymnqDGUQJiPR5Lv
	aky+Arp0o/Si3EDFG/LNOv2QnPEKnSwKtIQzR0KAfUq8kw9uP93/5e3/UEUH9Pbf
	ZDNhAbIHH7hDUsXJIG1GZA9R6wIdBQD0GbA3HvZihWwFDLypeuFnkOAY9I6oTtQc
	SKxIqRnjG/y8rvnL8GOYNuBUciiVHt8TltW5jLTGYXYfEKP0ScV6ynXgAm3LY9zs
	Bhpd9CP6owwq+gk75SgiLCID2rJOkQJ9z7gYlFhrBxC4HgyZF+QWW7tnbhw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9rg8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 09:40:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5339739b343so36407741cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 02:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792834836; x=1793439636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VFR0fSKAuE9J983F3nR4TA6iu8SbAHob6dRDH8URmk0=;
        b=XhumLcag/Q7fCV3OTh64bhU5hQJSpO9cPLehtkK8TwE/aycUIXQdxl96IgRcCzDVpf
         zsjtFZAFiiZGclWJQoGpbv2gtYybekERsECX8jjr9a4KqR9NdXOYUbCKuTqF5Y671tf7
         OGREqn+wLIBJrr3Dyj7PWFnjZCkQK0HKq+GROw4DPRV/QZeie1C1lKda2HjQjMJlhAX9
         +4x0RgRsopuylMyAR0kfI0r7IkGhlme5KCHO0Sa3vGUgL3b3epjuzY70yh7PMnInP7sY
         F5xOytPFeLGNEclFiQaHYxi7GqriAtrmUwO3KiFCiCvd1FG87oJ27WoGNLrDJPIBtYss
         +Kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792834836; x=1793439636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VFR0fSKAuE9J983F3nR4TA6iu8SbAHob6dRDH8URmk0=;
        b=YvDLe5LCOB2EmkwfVDmDBWJ7diKAiCSPaD8tbr9Ih+OFKFIloNpWJKXg61SUM4SCMC
         K2jAbO9RoOK+35P6C44kyVQbxT1bLRNBqA01P7IzzqsaVYnOwnc6kE2aEyIDG2N+p5gH
         c9NLJHfCZ7VFAAM9T/R3N2nDzEqtNDwgBYIcKlMwZwkK8JXSckSF3RbdJMWRbs6DomuH
         YRB6BdG6jQTM3Km6UTxlm9kDBk62llvELX2kmn6dGBLUdu6DMDLevVpIWAQJLZ49iEIw
         SveJlzGmlTRpWXyNRUpTOX5oeBKSNTGbHME/xe5hJSsqXGqbmx3xMmwe+XlnjeO1n9sU
         J8WQ==
X-Forwarded-Encrypted: i=1; AKwUvBzy5cAvB28uiEshQelypPKDqiZy+Uvli49+u7PWps4h+BwPa8aVVq5GtqYfwwWK7mLPmYR/ngDZ2wJxvK92@vger.kernel.org
X-Gm-Message-State: AFq9FYI/4EyQ9UZUQ32JM7kpoEamDwqJuqWBUp3TTsrRhkifaJBRD00i
	oRyJXinB6Pjy6rjk05xxSRgZMbhuJqSNMW/qjgxk0emWJxfl0mYoB8ZzmGxOiwkDAj7joJSUjPy
	US8bhVFDSPWAD75sNmIJml7S62pd4tB1hjNK/LpDHmLks3ZggomNkbiFfPQ/Q726mAP/f
X-Gm-Gg: AYBFou2x1S8yzomM9XMxkkAbjwVqgUGzIVkgQpkgdrCpSgTXhzLlyfHgrGOpqohADE3
	zBBF9JYkBSoozrFvuc0hzkqG5l6zaWgVfXnFBhfySDZnPqqa0prkEzIqhAlAvU3kDFvPkOL8P9n
	zNO2zJUG3WKOzkee+TDVesNUyC92wNB2BW/KCcAY2YqxT+hkARtyDTvkhr0xhJX95OyzgZb3iEr
	kALRDkXUdtxSHYJdoNW288Ct8ogSpzXEKfNvwG7D0DP3j9ltuL4SyTaXPVzShT4KaqLS8XpiY6p
	S7cgNMFEmGLGhIGDFUETo8RokTyFykUWq0dlIlZOmwRzGPuCPRklRPQ5wasg1ojMxedRwKaNaJc
	i/sMZzIFgOrN8Kb51TCO6pyoN
X-Received: by 2002:a05:622a:2a0b:b0:536:55c7:a1d7 with SMTP id d75a77b69052e-5383b5992a2mr17141081cf.54.1792834836419;
        Sat, 24 Oct 2026 02:40:36 -0700 (PDT)
X-Received: by 2002:a05:622a:2a0b:b0:536:55c7:a1d7 with SMTP id d75a77b69052e-5383b5992a2mr17140841cf.54.1792834835969;
        Sat, 24 Oct 2026 02:40:35 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3bcdsm2857166f8f.13.2026.10.24.02.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:40:33 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] media: qcom: camss: clamp VFE clock rates to the highest level
Date: Sat, 24 Oct 2026 12:40:23 +0300
Message-Id: <20261024094027.3095475-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: 4fuEEQe6SdyVgAABOBgTZPKTndA1xOPM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX0rYDxi1gKXcc
 y95PHV0Gc4NlJ8pbqLLq9HkBlp0CuLRb7cDUoj8I8McnyJVaKkAtRaTFBUn9QtCDxbW1F3+xmyW
 SMQsUaYstqtJt3QEauUQcjiiehpWq4WaXHWmZsAaKwH9gMZQ1jvoo2A/V3z45B1GnGFs9JIaHyz
 Ffp1zu80TVQuqAgX/SfJvnjsLcwHqydBuB5NKBqz5dqERoFDkf93NS4l7xWXuj0DplsCnFHjgrs
 0sJLLB5iHajDRx8Wolt6CSpzBLJy5etXrVUUY2BtNPO+mtR8ZvCIwRJpySuNwM5TjHC6CDk9FSC
 etaByCF0HOSHvifLZwBGnTFfV1K7E9rRO3OhVsVhyHPwIR86lTvLktC5jA6FftrlJ+tMk6uYMuO
 wka7jh39ChKuqbjplyVJJLrFESy0TSnc6EVuaRJRCRcF8rnPX2PyQIuKR5xtMySZczw3hpEHZkV
 Fe5muSd1GWqU3v7fgNg==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6adc7d15 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=yH3Gd9U0UaHnWrszFSEA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 4fuEEQe6SdyVgAABOBgTZPKTndA1xOPM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzOCBTYWx0ZWRfX9/IlAjo7HV0B
 Vz+Py1geZU52W3zLdlu8t84V9Nqav4TZHHLH025VHc+558azYAtpfsk0QmV3Jmq54J86LF5KRV/
 dyhQNOMcLDQ/HRkViiQRXZn9wzYM2jI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240038

The VFE fails to power on when the pixel rate exceeds the highest rate
listed for any of its clocks. The rate tables of the VFE clocks are
independent and need not have the same number of levels, so a clock
with a lower top rate than the VFE core clock, such as the SC7280
camnoc_axi clock, makes the VFE reject pixel rates the core clock
still supports.

Clamp each clock to its highest listed rate instead, and warn that the
pixel rate exceeds it when the clock lists more than one rate. Take the
clamp into account when another line powers on an already running VFE,
so that a clock running at its highest rate does not reject the
request.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 59be37f83df3..359b5942df89 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -996,15 +996,13 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
 			long rate;
 
-			for (j = 0; j < clock->nfreqs; j++)
+			for (j = 0; j < clock->nfreqs - 1; j++)
 				if (min_rate < clock->freq[j])
 					break;
 
-			if (j == clock->nfreqs) {
-				dev_err(dev,
-					"Pixel clock is too high for VFE");
-				return -EINVAL;
-			}
+			if (clock->nfreqs > 1 && min_rate >= clock->freq[j])
+				dev_warn(dev, "Pixel clock is too high for VFE clock %s\n",
+					 clock->name);
 
 			/* if sensor pixel clock is not available */
 			/* set highest possible VFE clock rate */
@@ -1046,9 +1044,15 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
 			unsigned long rate;
+			long max_rate;
+
+			/* A clock already at its highest rate cannot go higher */
+			max_rate = clk_round_rate(clock->clk, clock->freq[clock->nfreqs - 1]);
+			if (max_rate < 0)
+				return max_rate;
 
 			rate = clk_get_rate(clock->clk);
-			if (rate < min_rate)
+			if (rate < min_t(u64, min_rate, max_rate))
 				return -EBUSY;
 		}
 	}
-- 
2.34.1

