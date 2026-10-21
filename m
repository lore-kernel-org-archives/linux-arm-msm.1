Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615966;
	b=DUtm9BoO/AASbsCDKPdxZf9sKDkrKzhy8SsKbRoAGZMAMYWqj3viXlJjR0QMaq+Mjxaz
	 vnm86HvXwX6ykezbwSpSX/CsCzxVtajrA9+fa9wbBmM9FTxDpCxpb8+E8MgCNDUeB4oVw
	 3XHeD+kdVwxO0c/4zdA63xqvmKiYxo8zetNc+IbBSMLq3553g1udBmjUstMuoLEuLDjwR
	 rT/kFUKMhXAVRTSLSAS+CoOfBsuzDOo9D5x/a4VnTv9zHFjL3Yfq/BfotloizqBhgMp/a
	 p3TAnRh/3Kee5sv+ohU7SXjobY2mAFyaw5/vJZv1bZfCk7xC5EGT2tIWnrOGj5G9giQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615966;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jo2sX9VXnBmxIbRFzoUIj/cFn9yYdevX1yQtu2aR0ms=;
	b=i7yn6irhqHOYoLyqgbZkX4JLSfGcCV+sAI+HxMo/mV0esbPJCUkgA4JnxEAKhVHEgLfI
	 TOjy1pXr1rJ8ciIRTr4+vWsYtQrjJoxjZqckvDd1dl0YTeO9/Q27bpkOcdUADGCjwliSq
	 HuEipXA6AYuzRklAaE6husCjdwfB44BukAew3dMcPZJEOqZHT01QPgrMAHkNkmzA4svFP
	 knJMbbzlZg2Wkv4ZVXAJq3pK69xMv9AIeVCW6jZRusE7Yrr60KvlHrbNrGy22bFnLA1Bg
	 33qwkc9cidxmH6VCV88X17km6ST+d5S7kXEgadZKl5f131P12FIMDF0yPY1x5a+HJnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KomGYbzb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1A7Nrli;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7793606A333
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7793606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KomGYbzb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1A7Nrli
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKe2vk1721751
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jo2sX9VXnBm
	xIbRFzoUIj/cFn9yYdevX1yQtu2aR0ms=; b=KomGYbzb3jXoGHSGWEuHqRomgpd
	NampVVt4ix6+D6ZppcScq7msdaj2lBWsMeOcy/NLdI/X+F0rbHKHkMPpvICyjqx6
	5i82WPVqVzcYBesDi45N67vPlR4O3lMHCKpGkgRNdcgoPNabdKxLLxD58Tp5rBNK
	6xFzMaMpFRnrdK2EyVYq3DOTSY2v9mgsiAyvR0OeYC4Pcw+d9W44c2wa/9sf8iIY
	gpXT0Y0tcUihMCHVuVQDNgpc5nekpzf53YuMX8JsRMASz5uRrpbZCp8pmyFo8LNB
	d/NNhl9vE8REIXA1HjEYPrPnKqEqBnABDY3u6mTNqWWY7dLnUAcsxdDhLJA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj4arwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:52:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0522cdaf3so826898b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615964; x=1793220764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jo2sX9VXnBmxIbRFzoUIj/cFn9yYdevX1yQtu2aR0ms=;
        b=i1A7Nrlixo99z6JJu2MRJTdlqG60jFV6f8oc07XRatIKeqYbDW3go/0XwVQiqBgEti
         KHmU3BoqK0BYwD4ZbBzdldI6hapQw6ulj6ncowp977NXXTe2hZt1vZf0RD095pOH4Zsb
         8DqeSQX9jerf0vGTewof8Q61+QIQ2+PMtJuyaRaxl2kf0a2a8XbMfDfD+iASqhXOA45A
         6H9J0pnlCsfFylFd8R/nQ3/Jx5q+h/Dt7HwkSBqmDANQ0x+VJNa2gpTAaycAsy6/K9hd
         3QBH1+5Ond/q+4pywxSp7LasH8t/yy2KcWvrqFBRXfro4A60LnfkKKZAyBR6INLVg+vV
         6RHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615964; x=1793220764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jo2sX9VXnBmxIbRFzoUIj/cFn9yYdevX1yQtu2aR0ms=;
        b=xPdEFHSZRPfwotykOEw/9x1M3xijVhNHfdPI/oi4VtJKdo/GGzxFmtDSg21qrrdSNs
         h22i8he7tI+oa2g6vzlyKff9XQOnY7q3+lP6nkTXovxcy2xXAl74DyvHgLb3Gp3dy1ho
         gaVXF5mHsyqGBuX8DLDCjbayeP4KbTIeAh1Baef5l0VAOGcDN+7Pnl1ErQap2mwsvacY
         f2mjA17V5pJe1dT3zU9HyUUCNuVPK8EtEdr1KuUTljL/+rQLqOP6hW9IHATa/e5vtoRR
         PsGes7Dvw1r6kw5h0Cn2Jb21bSObUxDxOADhAf+kLkCkWiGYpdF+u/2tIG4S9JXHc7vx
         Z32g==
X-Gm-Message-State: AFq9FYL0HzMzqXlo3f2z3wzhb9yyE1Hj6+A/SMlaECWyL61CTrrZMZGm
	KDjg4C9R2G6h0Id0EM8SiwKtlFFKHylZe2REvJRYfEqbC/gYoSV2WtTf/lIdzSDeriy9GFykj6A
	g6RCJeC5oJjKj0L7uO7jVbmg9rF6WyB0Firpc1YoawUFmkLIwIphuTwsvevyGxZ4Ov80R
X-Gm-Gg: AYBFou24EUkrUYx4g0wWKoR6WH++BPmcmmpZ15OkfwQYQA+zsI2CmkMZyUBJiSWHL2v
	cCUsyB4ZlRV4WaIDOY8E+8hmzH2+Qe1twCYm3tnFWSePndxqrRVvko574BR6pJTTr46XIZwRH2q
	+KX7pVLJmBNckBbrors9HF6m9X+7ZEZUcDIY7vgrJdn5RK/r5vf5m+lX22nuu6avCV2hwSbT+/J
	Cqw/cdPl692lkJAkao7nAzIC5Ehmn0Nv2//Tqy7bArLZJP954thD1tx1uHlvZPGNpnZgJFpbc+G
	/SddY4lecrA+n+o1xHi/MA0uXPSDlnTehs1CVNRXDe6sq8ceXiKTbfqbZJn70O6AlIm8mLXVwYL
	HEhE7VcP2NjHcDMdrL6AG+zRZTnaxR6KE4ReO1S6VenGIppDf3w==
X-Received: by 2002:a05:6a00:6088:b0:886:5938:cdd4 with SMTP id d2e1a72fcca58-8a089cdffccmr2433980b3a.19.1792615964328;
        Wed, 21 Oct 2026 13:52:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:6088:b0:886:5938:cdd4 with SMTP id d2e1a72fcca58-8a089cdffccmr2433953b3a.19.1792615963890;
        Wed, 21 Oct 2026 13:52:43 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895db551sm1362064b3a.34.2026.10.21.13.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:43 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 05/14] drm/msm/a8xx: Add missing a850 ifpc reglist entries
Date: Wed, 21 Oct 2026 13:41:30 -0700
Message-ID: <20261021204244.67160-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: MSzZBBvsPan-nqq4Wukx1sKYEyGSjI6v
X-Proofpoint-GUID: MSzZBBvsPan-nqq4Wukx1sKYEyGSjI6v
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad9261d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=h-8skOKhzxl6Lr9m04UA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX748iZA0mLdDj
 CcrNi3dE3TJP9x8mX1VdNhKWKjEaPYQrfXVwZuk3uj2OgcDEgRS+BO97L27VurgOP2SDCzfDBJg
 sQvi1jcXl/vrGCtMtyo1eckRrqB9KmW7Z7r2k9qSS0wlMb8TB0kzFzHjm7Waof/o2cHZwpudYwd
 eiNWd5SGlI1aYgAYK2gs4A/WTEzmq8kukh8RFxWFDo/OXu/cXc4GqbwPxyFLtjPLHSyT9YeaNrC
 GXxWN8aP0NmGILGrwgepmK9QanAiuHgNz2fOR8g+8ARN+GXWiTL15QX/IQ5IFEWlE12pPChBCyg
 nuYr2QbMwUVH1O86X8+fWNAnXTOqAVkgcWFVcr8Jkrj5Y3HWC+Osu5Fii+ZV1wO5WSvgir1K8M4
 zPsvhuHBn+SmDKnmoa4dvs2ktQq7T/6ROd9iyuREeaLcKeVnp8ln11exA+HFUz7LIZ4aike2/fs
 s7LThFCImkd0zBjbQ3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX43no+0Rnxl2a
 cDyqYi1axe/a9NwfztHtDTdR/AP5W5tZaO8OmLrwx8/qBZdNX3MvSyrK5Z+N0IdW7+kLpc1Z+2C
 TkMDxBiNHN5uEPMdyAhkwjpiTGspazQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210083

We want to save/restore all of the CP_PROTECT regs across IFPC.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 55a805ab438c..45cd986ad4b5 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -1477,6 +1477,13 @@ static const u32 a850_ifpc_reglist_regs[] = {
 	REG_A8XX_CP_PROTECT_GLOBAL(53),
 	REG_A8XX_CP_PROTECT_GLOBAL(54),
 	REG_A8XX_CP_PROTECT_GLOBAL(55),
+	REG_A8XX_CP_PROTECT_GLOBAL(56),
+	REG_A8XX_CP_PROTECT_GLOBAL(57),
+	REG_A8XX_CP_PROTECT_GLOBAL(58),
+	REG_A8XX_CP_PROTECT_GLOBAL(59),
+	REG_A8XX_CP_PROTECT_GLOBAL(60),
+	REG_A8XX_CP_PROTECT_GLOBAL(61),
+	REG_A8XX_CP_PROTECT_GLOBAL(62),
 	REG_A8XX_CP_PROTECT_GLOBAL(63),
 };
 DECLARE_ADRENO_REGLIST_LIST(a850_ifpc_reglist);
-- 
2.56.0

