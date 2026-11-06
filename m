Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007372;
	b=zwNybOzfOQPMr+uQciDXEXH3qXDQ/OcEUBaa5d+jIjq3PhIDCK8f1rP6EQYlzjmK35zp
	 o+dbAPufb1yzT0OwQMfjQ1FpZvh+NKUgRqEAIYYzCZirasNr4SdxaUXFLV6wdV3Gkdaoz
	 pBn7bc1W4LbwHGqhfemkm6U2R5Tmn/E5/CEY4lQVAwFLODcR/4p65m4yE1CH6Z2pPjEjb
	 6+cm7yUOCeFUrxQrah9s6XzEpFrsWwz+0/SNp5vpyQqKjZzjd4Wgjuw3RmtPGqInqjgeL
	 Tuw/5gNeYgd6KoSC/Ae1s5TO+YXVDYVIz0V+od0H6Qkuhwzw63IwYt8iTFZvSjFtfeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007372;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kova2M5LKwqQTwo8zCwpaEugv6qTmVtqzP9NdYn1O9Q=;
	b=JeYwsAzU/khClrfgoWJlOXOm0qsKGKfIYvZilp8PxTP5rhRZE6mDyTbhNdRgyTmPTh3l
	 hC0p4sk4wlJG+lxyy7zTJzT2rJ4VK3jFzTNBoFkWX4pINBVR3VhEXRiVuTkb5lHQfldUB
	 z5N8bMljzmXaoevB9KOfZsf7+bzGuPbLB7N4CAgt8vGZ4T3dD9WYgJXFR+KuOVqyjBrt/
	 Vy7b1Ng9bnOgBhAyQK7Y7ixGujVP2tR5A7XqMAJgqC1caTsblMzOHZSQrRNcRY1+k9/Fk
	 itpIFbp7V9JmnjseEEPnUAaXh2MrKt+ZYuwXu4FtxzJOurqRgmClmj/kZ2NyIxD6z4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dzSRXlqL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VJ7fzAQY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CD8606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 23:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2CD8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dzSRXlqL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VJ7fzAQY
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Mo2P8015789
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 23:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kova2M5LKwq
	QTwo8zCwpaEugv6qTmVtqzP9NdYn1O9Q=; b=dzSRXlqLtK4tSo5oFnZgVnDk1Ep
	FXJmzS+1FKMfPkunILQbwcGEZmfYE+eTJjGYQ0jXfsxL118+tgFesmGw/CDBf6ZB
	G3QGZULoizNlT4AmUpWB91MPwYgvnnnlPK4KMD5PQ1VmDdcBg/EsP/jQJ7YYoKjB
	nAIeyhYQmWMUK2AMF3ZkFkk4yZESG2UwjdVy5KGpKp5AVg13zzws1e+Nmuj/vIlf
	ywKzDP7odkFaab9eSJExiro9b5+RJVNKvibBzz9aK1nRYfhFtErtNMaGYXGIihbv
	O1+mdVgOw46sSYZTqmlUXeSRp1kRewEFLGz8JEB3aTi9qHk9qovfdbCF/zQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmeb0vjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 23:22:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdae1584747so596650a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007370; x=1794612170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kova2M5LKwqQTwo8zCwpaEugv6qTmVtqzP9NdYn1O9Q=;
        b=VJ7fzAQY4N+9Cj9cHrff+6OQFZ9iEU+Od0u6tj/5mPt/scmugTmiDTHh78eeR/RbWr
         fF5S/tdVvMk8bhVsdMtUhmdCxtpB9QbIzbl+RTFmluU9tWrNlZlDhiKBHynkBKoCQ1RB
         RxJRHZc8e02yH0B4EOvRTbU9vwnk0DMHtFZkDle/YDpE93ZSG+aVf52JRNMNFQR+XHsK
         ZcJpL2r1Bd0P77KS2rNPFy7NWOH4yWW2wkNExhyoSlB2hnf1/GpLKFBH1k3rmuwEHpUX
         8n4zYze1AxpiKi6mf5auS6ZU3/WD7DP27S4soQ0OA6ByAeOoxz77kJQzgfoC1FBrvYEh
         mrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007370; x=1794612170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kova2M5LKwqQTwo8zCwpaEugv6qTmVtqzP9NdYn1O9Q=;
        b=QYY/F59j829pBCfMSZ0RndjxRYC0yfcPpydQ0ZUxG75H3o9A8UsRxciCAOUiV3kBIe
         nMFVX2oMYF4vkt3yAwufk3g/w3UD2UmUYlcjzg9lvWYaZ6AYCTHwr1sctib4vYemlIcJ
         fYc9tSgWjELDz81kPEkOkWm74GahyxGm46nCTkOctV/3Vy/RKVLkz3TmILJAKmTZe7qE
         VYObpyqRSW2icmUz+OWLzvH50sMLNZiabPllkSgeiQtKeudiv9SSDyMTYOGUkR5BvKgw
         Z5gyyzN+ugewPkaaV2yzhx/cJrNc3OeD0xdo9DaXYGBV9bR4KTI6QUctn/+8jIP/KXbL
         97TQ==
X-Gm-Message-State: APuU4Z8zclewXirfJhKZzA6pMk21XWaDT81+3v2Oe8jNdAEO7Si+s1td
	LOtYr1EPKf/tGFWAOO3VI3ltqt+uEV6ucMiaxc9Rye8H4ZjTt+d38MHGPC4ebdowXOXkuONIjKE
	TSRKSIOZSfE+Oyywfcz8gthkgAVFxILcVi6FtoBaaFCTHrIiSyEeWsjxD+JwTpYX5d1tE
X-Gm-Gg: AYBFou17cMJUdqKRpdTW5O/2IjbWz/z//Iys1C4RM30zpjajO4rNY0jiTw0Kq6sYMU/
	HK6Uj1t6swtSlbNUmaMimnVdWYvKz9PoJOsZ4Y8j3rSPNoJbv/LpcMuVXLO5FeG03bXpHNTTEsF
	0ZpH0fTSiqCNk7xFCFgfbSu2Mfe+DAvsU0UCpzGK8AsDTzbVxj4diYylXx/aaNIEJsAl5OeRYZm
	YYyJxuOZsjX+IXXApknqLsJQG14ha3g4FcNOhZLr0Z64Bt8qRLLJKvpuA57G4iGs0FFviGARc7+
	8yJATPvsShEPIAKm0hGZ9YpsuOmLMk3zq0H0SYoZQ36J3Sk2WfthZX/ZgfWVzrMbDhYhm/SyllF
	k1+vj/vRmCxoYE/aQyjPxpHzSgNbzzMsdZ3r5z9zehgvwmXcKaLJZeTRaeBEGjGpTglpUETLqOi
	71r3Wv09x6s3bQUBUfGipd/qIqVAcx1VAhy3STyTENCnwnosUyWBsykGXvLfSaRw==
X-Received: by 2002:a17:90b:3ec7:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3b0db6d78f1mr3995898a91.10.1794007369616;
        Fri, 06 Nov 2026 15:22:49 -0800 (PST)
X-Received: by 2002:a17:90b:3ec7:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3b0db6d78f1mr3995881a91.10.1794007369158;
        Fri, 06 Nov 2026 15:22:49 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057c2bc8sm664748a91.3.2026.11.06.15.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:48 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 08/15] drm/msm/adreno: Fix PROTECT span length
Date: Fri,  6 Nov 2026 15:21:00 -0800
Message-ID: <20261106232220.47602-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
References: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: MqT8JGFdo3f721O6vD_Bz7kf9KRyFFaz
X-Authority-Analysis: v=2.4 cv=DOAacCNb c=1 sm=1 tr=0 ts=6aee614a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=MJDCpJTP__1aPQla-tsA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX08iwHe/Iq8TO
 PNCW1rFSyvjCC17z9pa4Aa9bHFO3DwZI8hFL03/Vn3Dg7+GaS0RetE+Wx1WxS23Arb3MPvyP+H2
 BgroOJsUGB8ruNt9ySAEnN3b36JrV9s=
X-Proofpoint-ORIG-GUID: MqT8JGFdo3f721O6vD_Bz7kf9KRyFFaz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfXx07gXJ4OpX06
 FCFCnCZ600yjCbsSV9w/cSm/YrsSxkzGSIbBkwd+8bf1yFeghaNk6+02VmEGRtHqhrCiPWlm2np
 ZoHKFwL+Hn7Hj9+BtHiSJorneVH/ARqQj4V2lySPGof3+FQsSQIQnRHWoaggvZoefz16uU5PylE
 vHm1LONLhf9MUFGF/4lBGcfED/+Mv3VyxoLv9u/0X7zkijjKXVmZac7oG6+41S4BFmuxIwJsMEl
 iOcv5+0ncefAZiVZlioCj8eR5g2Ykp0gAjc6lBKmc6X/4GCDvdRPDSA05PYtiHRyZYlyuh1UFTT
 kwrlw2l1K0UO1a/Lw+ImH6VsTcwDpV+doqsrDmUFuqo9sQGonFvRSoHOsEeAzd9NmOvxY8RPoqE
 qJkBWYUB7sMk7mZQhI3akoq3O4TvMVujxmCsTT3FMXfR473Jal6/bzyssporKRgcOTEbXbIODlo
 aYKASqnCuoUohUcoKJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060093

Don't let the length bleed into b31.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 4a3898e58aee..cfe7a3ed44c4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -244,7 +244,7 @@ struct a7xx_cp_smmu_info {
  */
 #define A6XX_PROTECT_NORDWR(_reg, _len) \
 	((1 << 31) | \
-	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	(((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 /*
  * Same as above, but allow reads over the range. For areas of mixed use (such
@@ -252,7 +252,7 @@ struct a7xx_cp_smmu_info {
  * single register
  */
 #define A6XX_PROTECT_RDONLY(_reg, _len) \
-	((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	((((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
 extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;
-- 
2.56.0

