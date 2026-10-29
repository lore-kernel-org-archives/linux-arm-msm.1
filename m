Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305115;
	b=uW3ECU0O658OBqNpKKKQlM50lAaMSkLltnzkQ7lUMZfWaPIYFyuZnaA5rFnIYMQTIt8m
	 4Yshr/vbDnQTVlWJ7uJR68ctwv5n8sC4u4ToAlQ/SAm+NJnmG8saUuaVflPLRYjMf7MHy
	 1jQrm+6MFo0iBS4uSaV7IYnuxy8FejBV32FiahYoT5qQeSdz32WVjiYOvl+kGuzGVpRyq
	 kDcE/oRazvvuRSo1sJhThfD6HGDTXBZhS6U5/2ah7UwvurdTezgJ0uhtBWhub4yAK8bR+
	 H8dVRQsIaGbgkSZ5WN90Rt/aRH1O7Uf+wDYTYxRR5buT9nwiJ9m7qXAnlVL5OBCw7gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
	b=MbeD/M/Ki1VFa+HcCzC7e7ImsjyciruaAFHWxiYZfIwWWGH3hwLSofUm0npv4VZEaI5c
	 HARLNAOwH8s9DXS+5CyqEMz7oWNzB+q1hyTx58iU2dgdSEflWRvFW/Kn50vNdkFtQHJnj
	 2pmAtUSbbYgVSvk9SH/Qnn2zmh8DfMzxkm1KKTsWiMXsAsA0wMmDS56tw/1YRSlkZ26n9
	 5vY+4eTH20pII3g3hAX+Skjw82iF8NOhF09Y+3un+SAMDCW4VBWd9k604m+WB7V/o2HTQ
	 qOgpav/OlxXRGO6wzekr55KMgOZjvVNFyA6VcGO8LHP2FcRus8ByyeTpFvkA3UGbQxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZ4FsQGE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BbY/djjx";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D1860A261F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79D1860A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZ4FsQGE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbY/djjx
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJkP9G775670
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QK2V0ULW7LP
	9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=; b=CZ4FsQGEN+P6F1229Rha5XiM/C4
	dp5HvPnCQThF0buZ9fZlDGWhTANiNDt2RZpnJAnpsAuIjmYMjxMlBICy4f+w4+uz
	mpElpmjJEtgBHP1gd0SaM6wa+kjZUlYWt4gjkzWcRgZXBjLILh0DpWa6banTSgdE
	VKsukQeJbTOeNDFtyIzpFMmChSRhH4RkClka+yTsd2cTFbAka3mV8OGZLEZy374f
	l09Jc0XpPCzhkx4BckMrzpY+ysGZrNjjz7ypFHewgoxXlUjfJl9A/lzPlg5dQPo3
	g2yREVd6+26cV41a2wyASfI2+Rzb75O4RcLvb3wk7D5moeIdv39DDLpacHA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmchhr4a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9572e892dso161215ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305113; x=1793909913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
        b=BbY/djjxRPfCi34dz77ZzbZtXAQhKuEunRHs6CpU1ee5Vl2V3I2QoP/8gZWwjDdnwY
         4wSkNiLJCayDnG2VCg/ouVISEmA1YLaYjSkAdCA1nA0V4iPJB0gWPTQJ6+P5lyngSla3
         RIH+nmK+nW6Ix/t8C+gVol1W0nCViYPZk+ZppTmMnjiEv4i7ZjumgbuZwEVkeIFqOtjL
         C+5f7YOhTqVCOpIlH6Vt4r3NQskbbCot5rZr4ASZU6G9Ye5em2PoqQV5vbfiH+WdZcnB
         an1fBYeZsLwb1Kb/qiEAwHB3hCyaQh55JTqh80CF/wv/khFANmjsNAKzOC4EiJcaV1j+
         Jz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305113; x=1793909913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
        b=r4FL/U6M3GFc/+6Nicn7R9/ZZck3GlUwayM1BFipG5IZOISdZ+tm8kwj4mwb/i+QUn
         g2VBsJL3vn1yTmddYBhjiY6h0CoKNqo2BH2jhGCIUIGj7VGNR1VO4zYhUbzG2BZDi2kK
         cMxIMtL2ZjN4hRZv8Jo/300pyFjy8tdCGlb7dJAcFufWeiNvf9BSvtcfApAuEM0iUMX9
         QrGwew2l8hSw1wT2A+KxNA6fMBZa3tr/gH21n4v2gcUGQe9Kb72Wz02AbM14ka4RRE1L
         brGfm+txvZHu9PmPgVE9Uw14LpTIqSW9ib+yrYIFfdWqZAx+8mf6TXVHrw4RsIeGNdv4
         UjWg==
X-Gm-Message-State: AFq9FYKbtBur31mgaKjREu4PfUHiFYwDzPAYwev1waYnv6F0vLBTPiwU
	V5U+638p+j4P2C55qHiIf09ovIONdN7oX1IScziKuS7dlSmA6qZCof903nRYmnjjlyXkAo6uoKD
	RvsnUqX1+uG1Uk86C2EQoohakhZWUmd8/X5n2SScELQ9c/FblwMteg08XQKajtVEyxpPq
X-Gm-Gg: AYBFou12mlrvoZNbj8PgCWv/xPZbaN8HlC60NADxRbijv82mZwPJm/Ah+/ELup2oCN/
	0yJm6FQbsiC96mQq/RTwZ46DbUZbvzRzljfhw6TscofUWSm22lN19NcV3t+MziFli3PX6K4Eq5C
	FX3wIe3Ab2aaEtD3OozHRtJpoAhDFrRCQ3P16nzkh+0otMu7IuuQUHJa5AKq/5vpIL7/kT5JyDo
	4V1/UanXVXyEao1U8JaPrNlSZv54MIzpfZDAJVI10sQKCjXi4sJpJL8a83Bh6M37H7uiiTAqoNk
	2DyGjQ6b05Hi6uILdx2TjwDYl4xyTCMEnMibDx85lYC1mLU1WoYH4Ze6WCPOM4zLw1FQi2kJs08
	wPYq0zwOxTfquScwdqcvRNDAJBiGuipI8gXGtKE5yyYuAMhZKBUwSbo4KFTTXQjS61Ap6nyYkWz
	8+Zy2b89BcvKX0CcpCnY8nEA==
X-Received: by 2002:a17:903:1b25:b0:2e9:6972:54d2 with SMTP id d9443c01a7336-2eb3649bc17mr4538155ad.12.1793305112545;
        Thu, 29 Oct 2026 13:18:32 -0700 (PDT)
X-Received: by 2002:a17:903:1b25:b0:2e9:6972:54d2 with SMTP id d9443c01a7336-2eb3649bc17mr4537925ad.12.1793305112136;
        Thu, 29 Oct 2026 13:18:32 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb369304efsm555475ad.29.2026.10.29.13.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:18:31 -0700 (PDT)
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
Subject: [PATCH v3 16/16] drm/msm/adreno: Remove temporary __maybe_unused
Date: Thu, 29 Oct 2026 13:16:26 -0700
Message-ID: <20261029201730.151754-17-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX6NX3x6fVHkRK
 k8l5vBDkQIhyuZSD1IwFFxES2Hj9cU3A/DN0XHxZKZk5L2szeZyA2uqb4SScGQBDGLxz5e8Iqgr
 5Yok2PJHPW1bhDT+CMdBZafHU2vLfz0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX6aasG+Qkz5ca
 zhs9ax874lTEZF7OGB2VW+nVxhc0YKVfdDURH0bQFfmGavAyx+DF+6AOTeH7U8FDDvo6AD4Ftgg
 BXIqWpAlSBVMq2r3dwNK3fCri4GogO9ihSWrsb40dSxgg0ywHp69PFoaq1WLf6e0Y4nrgqo0sFf
 nmB64H6pO7a45eW7y3x1ljL6dqLk6QHNYiSK3xS/T1/tl7WKNYkLWwxpKLOWHv/HhWvpslKnDVL
 EvjzWXGk1HDtcjaNBy8zWVemm5SVCJWELEGR/axAADnUybF4VYcuNL6s7KbhExXoB/G901/KqvL
 U1fKZ/DRyQMt408pCUnu3tiV1AoAVK0R9AcaPayxPwuwS0mbEG/7ag5gavFhXzcSQkBdGiH6Uc8
 /YjP87uxnrb8iLS+qqGcx8tBlFBjwGdGXMd0sM/Y4mMvt6Dz9SnT8qHTmyatduX3ulHLxA/PZ5h
 EsrFXQydKwNyUuildxg==
X-Proofpoint-ORIG-GUID: hQ7fkle7G6ZvA6tpJ_KoVd3ZRlHhQJ4m
X-Authority-Analysis: v=2.4 cv=ffc4WEQF c=1 sm=1 tr=0 ts=6ae3aa19 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: hQ7fkle7G6ZvA6tpJ_KoVd3ZRlHhQJ4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

Now that is unneeded.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ed83dd927b54..3ef3ac2d86f9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -170,7 +170,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name __maybe_unused = {		\
+static const struct adreno_protect name = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

