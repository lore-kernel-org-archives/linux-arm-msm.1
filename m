Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395191;
	b=Ry818saSTH8/KgLZYQPUYFWxRHJ63Eh2+7R7idERuxbTCV2LGbtpqRY/DN5aAks7l2z/
	 N6H+dAemYAKTZNJkZShOtwmH/lqkMqqklTzSuq9+COggokHer4yINefYQhKAZCYh+4aDB
	 WuLh6xqosvNuqlFo9juvQQlGrS46YmkdJ7BU6e7btMs3NVBisgKZixLmv++y3s7CJZqMn
	 Xf21UTlUsTcCM7qlnkkBu7rfhkclMBIV0rZ2LzKXFjpB8CoR7/186uXV8eH4xzDcQqIjL
	 8hRvgMESWUdFoy8SBG6vAwHNAgBGTFSB6X7Yled8k953pn0ERCJQfjdit4R16J6WHCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395191;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uy4egUIXFTyN8sajHl9qE8lhYFgJx267Ytfjd1RvPh0=;
	b=j6Mf9fSjhmX2wZkIWTtDrXO65ZjCoCohOlkMf+xSP4ts44JNYriQ/Vs03HO3WxykGyZ1
	 e1+zR7pJ2tBaj2icq8dZkJis1H9IuQDhuUQF/cCQFJbXdO6cYlrSzz/xPj33kiBj7T6X+
	 ha6HVE7x6oHBjJvUqTp1EL+2ymVX2FrXp1Zwmyghh9oeIvuctH+HfItA9hpUpkl4ph+TS
	 TU/GDUeVvj82SXYv0fNxihg11oGXsQoZS/9hfV0GyAFSJRRgqadjIc1fLfKowDjIEOzCi
	 WoimtXBcDWWfod6NSznxK6uY5jpUsFWUW/juj8M0+fIwSIuEQBO4ImssJ9Yxp+nxTMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvUkgvx9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HqhAxRZw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A1660A3834
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A1660A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VvUkgvx9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HqhAxRZw
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULDaOA1259485
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uy4egUIXFTy
	N8sajHl9qE8lhYFgJx267Ytfjd1RvPh0=; b=VvUkgvx93RWms59lZ+U3D82kzMU
	+YTUBiwDFAg94CWA9zOVFCdQHFEqIqeNtIELdGxtTvUQCwWqO/VxBRoUUHpaJe7K
	pZmvCAUflCVqzmRipQq4o+BLfuiJeOb9OCll7eEUq5ygexG6APCHs5N0gggLX77O
	2XQGHaUoDgaT/tMJ8WBCJ0XOhQxl24L04Bz3dvUJNCcE58vsrAIJ9ykqaVa0E75K
	BCQyl7YNG9aVqdwF9X/KODUeLg/QiEf4nRWEN7BlI7Q3Y6tK3JFUu8PseUjEs5NY
	fXctSE+V+VCzfA/qCQSyJmomTQ5yllsgsoM76ytZBu465cMGoYlcmDnlIvg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0016p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:50 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdac99e77d0so494592a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395189; x=1793999989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uy4egUIXFTyN8sajHl9qE8lhYFgJx267Ytfjd1RvPh0=;
        b=HqhAxRZwQIu/Z89645orEkrCIlGgq68fBqHKcTleszuDIxW1IGhNiFO08ZHsXVAamj
         ETKclPDA5cQUqDeaOoeETsjNvxiV0+st9LLSMViAyLvSIt3ZUqQNwZKxlUaAH9y3N7ko
         J+FyrnPx12tjU/7QIZ/RH7EG3pl8ME6Wea1lklycO3ZBuuUlMWNzye/JTDfU37OsaK5r
         AJo7b7pGe6x1zBAKd8DFn9HMIae10elKurUGdWxlD0NB6pPpzrDDMZD96IKvs32Y/Qd3
         09Asm5dvMWM1cjcA3pinsxUIsw3aMfufNjACPP76TsizpAjWIbci4o/YMpNU3T85OIaD
         k59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395189; x=1793999989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uy4egUIXFTyN8sajHl9qE8lhYFgJx267Ytfjd1RvPh0=;
        b=aYtGGA3gWN/SeRO5ESZuhIGi7uzXOOlD146vm0MHVSbHWAQxTQ2917rMUKz0q9sFmB
         UmNkQTvKI2ESgTqybFaktANO32dfqtwf3Kq39NA3xGvBocGFIRxRuqCZ3NMPWHaLe/Vx
         OtpAl68+8fxcgQZDS9Icuqd+YNKepPWZR2jyXSZoVm2T9yd/tRdydhLkBIKCaG5bPoWJ
         m5OOTZV0XKLd45Y5TJjjrGInTWtN3fWA28vo8quAf1FIN8CzvXVrmXr5PCpcvW1VRS/6
         jOh87MCOvb+GVy0h6tDrkh0+kGFLCPxqjhs9ZhBfOoaxaAfT8UjkQZ6BvIH/5GpJIsgC
         dQsg==
X-Gm-Message-State: AFq9FYLMxhOz4dE3sASIcT4tYclcV9CbOnMLz6vbFygF1G1IUN6a9Eij
	Co7v2ZNJ1j5IssxMS7oE5/MmK3BYVIqhYO0Q7BgriCwhFl8PGcdRCVH0IQyA4r0xfqoNxqZJXOX
	A+R4/hXdGwzbPKPZsm+rQMlLFeOVOlels/jUObOvbLt6j5/KcgT+H4IEKH3WeifWiuq57
X-Gm-Gg: AYBFou3on3ZvPl8/5uy5FjALztPT/0bcM+L42wVVYNrvwW5zy7td17OYSc4MWCG5mRW
	TUWQW8Gzrl7KLy9KDbOUX/JaeLJOi7QiB6cotBiPc+VNazSDk2S4b+njZEmJwTPdaeABZ98ws4y
	NpucrK1XcaIJAyr/xIAz+tTZ+r3zFRNqbVIwWhW8M7RXhtwOvx/eWOremestiitFdII/+ydgvfy
	uvhZvwqgISZDB72GerpItrgYb6zLUYdcxQ6yZxnNmXLTGA+v/v+T9Gkfp5XM1+Q8DIqAYX+K/g3
	J41rbif+lElB9kHm2mHA4ht3hfHhcmaixwmKph4DVZ9M23iBBKRhN0UnFdBWevc3yHrYQCCtdlN
	tb/FSvTkdi1Tcfv2+/CPkXP0e2INWS6Ye1HHQoEqg45MoXauANeB9gUnJhcxwGaR9xR2AGh8a5F
	6YiHXUd+lLIlqpdMNbiBGXs4w=
X-Received: by 2002:a17:90a:f6c7:b0:3ac:a521:960 with SMTP id 98e67ed59e1d1-3ae89536bc3mr1943626a91.1.1793395189430;
        Fri, 30 Oct 2026 14:19:49 -0700 (PDT)
X-Received: by 2002:a17:90a:f6c7:b0:3ac:a521:960 with SMTP id 98e67ed59e1d1-3ae89536bc3mr1943605a91.1.1793395188916;
        Fri, 30 Oct 2026 14:19:48 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84577911sm5376432a91.7.2026.10.30.14.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:48 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 08/19] drm/msm/adreno: Fix PROTECT span length
Date: Fri, 30 Oct 2026 14:18:10 -0700
Message-ID: <20261030211928.45761-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: YcsfqWXdLpZt3U2-GqFMcLfOrGiVCg4b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX9GEefRz4zdmb
 ZNURhNUruwtsdMTpLNgqHGAXGHu2YskU3nqsTbUqUOU64k3vhKEEpp8L5jPnSGLdEJi8K2zY4ab
 AgAk/ZbX8/dNa0tBI/bHE/H4wjy8o3nqqo4qbCt8WPY323NDCuznlZVk1wXoIr2VYt+NrUk8rgT
 cbS/ebCrpZ2/d39SzWTvZZ+vHwJdYJdKXA5XQZ9LA5SevkWCHoIBlqsqu49qwI5uhBOYBiBrg8k
 KxJ8cu+EIWURraPJdhvBKM1eCkdIPFIgw70oUBxhJEpUDyV0CjEVKhdPo6iBNXbDvQ96vD5wEoV
 Bwkvqhuz4eAyF3gkWdfKMsghiLKGhRli62V4IQ6RUSbcy1mJS91HcFV5C7TqI9quV/ej3d0FONX
 U3aa0vyDBtFFmL/CO0uMmaj757frx+DkBN3E90FPaoVHye2acktiKLyFdjSnBVJhNB7aKp5sn+b
 QYLqnxxcNaoSypFIOVQ==
X-Proofpoint-GUID: YcsfqWXdLpZt3U2-GqFMcLfOrGiVCg4b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX6IKy57tbPy1c
 Rff2CWcpbUBqrP/nwm0bWmFTw68dCLAuOp6tpFDjC2tAx2dBu0kM51iVh+x/hIpcSk9rejuwQ4J
 AXTQKIE3VoUvnStHK5KXsdZzvqUXDMo=
X-Authority-Analysis: v=2.4 cv=FvOQbGrq c=1 sm=1 tr=0 ts=6ae509f6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=MJDCpJTP__1aPQla-tsA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

Don't let the length bleed into b31.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 6b23d301c144..c49301be504b 100644
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

