Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45BD43303F
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 08:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856123; cv=none; b=SFkQeW1q/1Nu9xT15LiilY6tRyPwITc70rov5cXBfPkPb9O+wa/THIeJ47QQ5u/w4tlXnvJ234lszp+QP2oosFLDUeQwU9p4IV2lyKcBjOOnCcojWkplKpY3TmII54IKP6TF5FhVtR0rELO+qU8FdJ43mgUAcPW3KiT4jCjfeN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856123; c=relaxed/simple;
	bh=UV6jW6PMil7wWOmF4aoKmw9vf001ePaKteC/8MM4q9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g4lf49PaTLeG+mr46IIztOAF+dVgsGgrRdQUlp8cRwy26IzCS2aMBGWGwbs+r1fIV5r944UmRzwzlU+QdTA2GY4zpOANfewKs+sqcXBFefn7wzexL8gDPYVNKCDNioogncp50tVGqYeri9JZbrSOd1HZOKlMZP0UzlbMaq5RUEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYhXzThO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FayrEodo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYhXzThO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FayrEodo"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M2bo2072278
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 08:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7hxdjuB2VuJ
	ASIx/RNJeFcGgL7NijdNk1gCzSGxAfo4=; b=KYhXzThOSxck3UYlN9f+e1kCMbQ
	VFMseCENxvIDaByXZfg7lE1h13bkZhQ26t3hK1avdwB4oZLSkjpYDZ3GVU8mcLjY
	+VtXXAltAHICROviLOFGYpODaVSNKcDVSjIz5AlfBi4h8Vo09Bgd6gL+qs6C+Dmi
	Nmm+Meh4XAN0GNnV/OgmFoMuRFuq00oaliyPuAMvZdUrnYTj02wcNOZRK3lCzzf6
	AL/6cKGOTqk29BlX3Ej2AfBZWkjS7XBp8tXUNtNHF6XsroLSPqfPZuxvGvSV/GHV
	s+TOBpWyAKvPNUno/IeNdnkpwa9fXbcU/VYLlzCXffA3iLJsLEm5EVWvhqQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfymjye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 08:28:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939c30aa9a0so19479785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 01:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856118; x=1789460918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hxdjuB2VuJASIx/RNJeFcGgL7NijdNk1gCzSGxAfo4=;
        b=FayrEodog4WdHY0S6ykvBRylwYHa5YKf54H2vGyX8P1kue7OyHfwSKQCJWbNa39EGE
         fOK0DjGlpQZeiE3edqANjf6xL4NCw+sWvuiHyxzSAmRpXHMs1DWxJL+ov4VP78/QPJSJ
         R+LbS6hIJbKVMPso0R/rDXwCMmpTpza+YD0oulA6tdUIaHjstzBkO2M7GCpZVWzPorZt
         d/oU1IC0o669SnrPOySmB5YoRjwOfE7QnH1olCjASxybWzgcxgn3PG2tFNnXIWteBkbC
         NRlrZ6Ek3GoUNzZeL+NOJblle3y3CH8xWoW1WycscZQWf/8bJtKQpKExy67Uorto7gmC
         Uc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856118; x=1789460918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hxdjuB2VuJASIx/RNJeFcGgL7NijdNk1gCzSGxAfo4=;
        b=h3HaMiqvamDjnntGNPxmEmvW3IRJAa5ClmUAIdBpV4UJghmJH4FTiTJA2D8w9Fmem7
         xOR3yj9Hj5S5vSZOR2yHFIfnt2OUwYz09qpNEMnahdTWS+cwv/I0XCjjqiDS0oxtT9/9
         J+2Mopxl633wwHj8LfNjsz521qewP9zfgdSGpoOdvnE5aTAIOLmc1UGJJlANxI7Cq8z0
         TPiB4J0UU3PkTXDiVDYpAWJbwCRzl2KHlYL4YHYxPL1246/+BRCjG5bsumqjV1IAsWyO
         Nyji9zaDRgqvit+EUzpUR/1KyBRdVV2gdCeUaRB0JApal6V1dihYSyqKaApGv4YHNF0j
         YNTg==
X-Forwarded-Encrypted: i=1; AKwUvBxXITyWMyPOX/g3JAQZt+6lL/2FVh3fBHXkxEelv1Fd64hzCdFRTOmxj1RR9bJClGE/K03MHV0SCxN8vKti@vger.kernel.org
X-Gm-Message-State: AFuF++kmKlYkucFl0qZPm/LDmd+0EEJ5iCQTOLPJlFfNwu6Pxyp5mrxk
	wN6f3pNuU0zPos016jI/1IAbDNm/IhOOhegTOzjj48BAJknMDiNSqu3sr8d78i/0hw94+wuQAni
	qFoto0qXS+cC1oAXGGVxHHFMfmwuLj+ajjXgFk9WGwj/rg7gBIVuJhU+OELgzfftGkG2v
X-Gm-Gg: AYBFou22M+gk05bmvh/CKegQXawJVEncWrOBpOxCP/Xz62606y2G0GJ83hICTlJ4QZf
	ncxF6UnINHOEJo7bGegzlNkNHDM9MfUeiLmxpPMTBuMSMYpAA9RC3yOcvc/JEJS7aOjN25pmBUs
	tA4EWmRpAfjzlxuFCv7UNOl3t2To4q/HKsgesG+QdG3eQtD9w/MQpMnMhXSIsg/+mNUlSuHykfF
	Xa7ImxZqEfb9eN1d2b9fXBABQf+WlHoJiGeOSRjLwtFTOchF8Cx6G+QB6SMMqclHoEJqyAFzi9B
	w9yJl74FC2H/b48H2dgIj03/5Ma3nQMrCsu6pfGVeIuHrp1qkK7nT4RvK0kH5jErwQRHAti81cQ
	8s0ugXqIqWmpO1g==
X-Received: by 2002:a05:620a:4887:b0:939:6de9:208c with SMTP id af79cd13be357-93980586029mr2943829085a.49.1788856118456;
        Tue, 08 Sep 2026 01:28:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4887:b0:939:6de9:208c with SMTP id af79cd13be357-93980586029mr2943825285a.49.1788856117945;
        Tue, 08 Sep 2026 01:28:37 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm369414605e9.12.2026.09.08.01.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:28:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 6/6] ASoC: codecs: lpass-va-macro: switch cache to REGCACHE_MAPLE
Date: Tue,  8 Sep 2026 09:28:06 +0100
Message-ID: <20260908082806.648797-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260908082806.648797-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: q1oCtjCFPGY90Jx5TwGfyullLG9ulpA8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX2a/248SW01q7
 W9E7F3ifbrLzzDo0qjtg14Mnah6nqFfmibiLrx79CIFXyK94Heo2DlBlLmXx6Amwvx6pu63jqqx
 Wpg/ADlxjy6USrrsXDwghjFW27rr/ACWYggiFRcgDJxDm9jhUdHQqKFxxz6eTJ1FP+YsR+x5SHa
 COFFcGf+LJgpDDH/R2e5BSlL6es6AOy2gmWuyikfMWs+AahH9BbilavNMFPZX64xVO2000Mr2sT
 Ra5eNbmq4vIc2YUJkC5cZgJ96QnX7eMCNm1tJF6fxRsHPKoeUtMQxHKDQ8Pd1Oo2KDwtmaRZEYQ
 m/9R+gpGOmA5SfqbYitJOWFqnctuPIKILjQFUNSKK9dBRCYu/z+FlANl+D8LbELKeYz37GngKDQ
 NvPnoY1uCg2TXe26yumz9pYIutE8wCBXGeo5/UVGHI7i5NRXGvxZ6GmmXj2P1M9DleWR/PhxE+9
 +QyWRaz7eq+OYtVakBA==
X-Proofpoint-GUID: q1oCtjCFPGY90Jx5TwGfyullLG9ulpA8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX5AHYjT3+pg2u
 x/6AAGPNVW0kdtXpQV9cj9ZsD2530MdOfO1JIbhEjP7HHbf3diFbwhEcQs7ZVJTsVA/I/c/HHwn
 R3+b5CaTUuChnLrPG8p9gQptQYvdVB8=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9fc737 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=_mTl3-Sb4fPHxIs9D7QA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080088

REGCACHE_FLAT hides missing-default reads by returning the zero-
initialised cache slot instead of doing a bus read.  The caller
can't tell that value apart from a real hardware value, so any
un-defaulted, readable, non-volatile register that gets read
silently returns wrong data.  Since commit e062bdfdd6ad ("regmap:
warn users about uninitialized flat cache") regmap dev_warn_once()s
the first such miss, but any subsequent miss stays silent.

Switch to REGCACHE_MAPLE.  A cache miss returns -ENOENT and the
regmap core falls back to a real bus read, so the caller always
gets the true hardware value.  Write-cache behaviour is unchanged.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-va-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index dbc5795b9273..f0797715ab54 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -454,7 +454,7 @@ static const struct regmap_config va_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.cache_type = REGCACHE_FLAT,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = va_defaults,
 	.num_reg_defaults = ARRAY_SIZE(va_defaults),
 	.max_register = VA_MAX_OFFSET,
-- 
2.53.0

