Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234088;
	b=rgoazdhzveXGsIbjdW4TsF+KjsD9KL8uRITLlWxxYq+uvm0Lhj0jEVmUsEfiss7aQJ1/
	 XEBh4XXjxY59i0nxLkGfytCDg+BBINDpHgBxK1N/Fi+ORvHsKt0BRDYTSZ2p6p4YBeUmY
	 k9pSLEDmr7Qw4YEit2ZyXfoOuIvFxea6tw/HBtvnAWvjR0gk7s1eNzPgY/m+saaV/dZdm
	 0EG9AqZ0e4CCbSMev4wG0BxOh1Ts/+UYedNfgB+Ze+VrbAqWQoZLCMXVesOdzYd/UhgB8
	 ytS8rJ6FNr6GSMs4zL5520kZTYYooJ54qmYT7M/xNcjiCfaoV2bOfo0d1CnmKk2Mmgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234088;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PPgnV+/icpoFhI/kUPr3+TxF1BiCW4u9d+dKLSBISVI=;
	b=mWU7mo5fjiyjvpiYFG7SFci+/JSQ5vDgGNUrf5P6GhHCl/we/z/rkpHEHDkZUS+ifQER
	 +m86IweNAoyvAgHfWNGMwLr34l5FSpqiH955g+UoYRF9G62SVrepghF6kFgD9gU5eAaHN
	 W/R7d7OO75GxHdfMXVULbo+AGH6tL4/rusIrYBXVOvASeeVtf329T7qjHvMFEW8vNOu/s
	 wwZsYpTOhzCLf1aSUd5LTPotQk+i9Tjrq+tFnSGG20TqQW+VDfIUL1I5q+YxyJ/byD+5n
	 HspAOJ67fc0iVmui4IRNM5CEFNED9CIHPoRrZ2MgciYBvyhgrwGBtN2tRz7iWO3RDEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kXxHoCG+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gLTwVmOT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FE8606EE82
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21FE8606EE82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kXxHoCG+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gLTwVmOT
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DErvE336359
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PPgnV+/icpo
	FhI/kUPr3+TxF1BiCW4u9d+dKLSBISVI=; b=kXxHoCG+Xttwc8hCkIJVvGo7EQs
	w+kN3W/7RVITeOjWsYXS63qrJKHzJlAiYaxsR0w4rhNZaH4QJB5CEaoekDie8Jg1
	qfTnJr8VRfvmEWIKjnlVQuVpecC0vkxJILMS7bYAnRUGfGNP8jmCfvmLtdE4d1eb
	SQvc5LNqmKcoNlYOhsWL69BDdenNWKff4pRBugTBjo6QwY3RmTK76zJrxf2JZndW
	bv0ox3Y6Tih+IGDBimxTcITqmeNg/kJpOdiY44uzUDURkgemlnkKD84O4pP8zGmC
	bxXO3XC7IQYZ7Wl/zRihV7q6/kMiYK0+xKqy768KCxZJHVjdmSy0fjhKXWw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rp2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:21:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso807983a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234087; x=1794838887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPgnV+/icpoFhI/kUPr3+TxF1BiCW4u9d+dKLSBISVI=;
        b=gLTwVmOT+O32+xxc+HIg4w9FkhRJ2ms4g3HorRVpQiJsS31ISpigoDFpRZL3nMRqFM
         rfiJTAZsMYT437lrzSCCllm5A3NXb3u+osh318oQhN5Fd+dHxYQ6KvJr45pWWDGsOore
         OIqGw/z0msqWUIay+SNqJ35rKqoZ7jUB8Y82EqIY1mut/20IadkvB55lBY9yMdKbk1Ry
         MIfo1l4I7sp+G1UbG+CFLuC7hHGdTajLRLgnxJ8bK6JDc1x/8xwASjXKnBJzjpWvo1bv
         YlNIn5TMI/KtIG+JfY0wLLpNj+Xndd0yF8M7f9SCNbu0zKMNS48p3hP+XcZupA2Rj0N+
         XTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234087; x=1794838887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PPgnV+/icpoFhI/kUPr3+TxF1BiCW4u9d+dKLSBISVI=;
        b=U81c0YaRo+HbLUz9LnzlEpVlFeb+9ua0fP8DRRaMyo9OR4N96w6TQ5caz/W6f0YDLr
         PsnDHR2YJLj8USWkYQCT6ymdYOdXYgFPkn3bPMS+G0E0wP7xXK2jC19bw/d3GklAfa54
         iOr1aT5Bs+LXLTU91/n4s3+HgE1O5y6EvSLxCjZR0ihSJ/bnvih0Krc955iIG+/3ruRg
         o2tHBbhskYj+FQaw2G2BptFdJsGnq/JJNXlLQN43wPYIUYKMoOjjcbO2NCKVx6tLjOPp
         gtfQ9ARmLL7Xc54vjZQ6Psv0m9T9ZTdjWBi76Mn+03toDMxUg0SZ3sj/JkpNwW+hEIHy
         hLBA==
X-Gm-Message-State: APuU4Z++MiF9UxBdbVQj15MDlrozPpBKX0rZF5v5GGuiVksgp6VkMKRz
	DXhWdFIsHK2F5eRRmPWN/vhRdYSZ6M/UpO6L4QKynVwF5GfNhpM/eD4KQw7i3sX59h1Qv7vCVDj
	BcTPyxy4avl+B8OT91ig6WrNjxXTlLR5Ko2Ris7Y1bK2DCZfiDxXTBbSqnOAmI2grdV0R
X-Gm-Gg: AYBFou265tvpCOdesDscjP8NGLvBYjup566MUFtypxsMHDxXClbiMQ96Z7MNjqxDw/K
	HJB6jOXyjhIb8YLjs2ofGLnFKrtkpA6TX7iGPjk/kOU/3JKSBUzXYedydahSwVlj5Vany6K86Yr
	BneU/dtAZFdUdsq01ybguYFZ/RjXYjoC4JG8pPY5270O2NfIqNjsdLj21LXbdzqiWZi1YslWLk2
	AQIPynM56lUboM7BAMgDgwPG1+3bHpze1S/dPM73njqC3Chl6wgEGP6gochZAGaiKeBS7U5quLl
	45TqAlUUspqIESr8zRVidoCaGbTjLruNx+dV7QjBeTPtF4AkJ4iQuXQZlpNjIMnNQQNeVj4Vwsm
	l7lDV32FBsC7AL52shENsl2vsxYEIZoRZzr8uGsUQHy9l7+IxCdYwrvOsxTqbua22k/o0tSusc3
	gbbyrShx0fAhxeIFVlAeZgz7vblvMejzYFhxuPeig8RedFylYZHW1QmOeLs1t9
X-Received: by 2002:a17:90b:28c3:b0:3ab:2ad1:f10a with SMTP id 98e67ed59e1d1-3b12cb3ecffmr3221572a91.0.1794234086919;
        Mon, 09 Nov 2026 06:21:26 -0800 (PST)
X-Received: by 2002:a17:90b:28c3:b0:3ab:2ad1:f10a with SMTP id 98e67ed59e1d1-3b12cb3ecffmr3221535a91.0.1794234086356;
        Mon, 09 Nov 2026 06:21:26 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058a7b29sm11045249a91.10.2026.11.09.06.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:25 -0800 (PST)
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
Subject: [PATCH v8 05/15] drm/msm/a8xx: Add missing a850 ifpc reglist entries
Date: Mon,  9 Nov 2026 06:19:51 -0800
Message-ID: <20261109142111.256630-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
References: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXyRUt83NSPoMA
 /W9NmbydIEG1cU9qZCNnExpiWqZqJxOLZTptrWAzLW5EY7K1xjYddZTF0ReMYdZJLoTLtLP+QPb
 1LRJKM5l0lQx5yag9bwd3bo2z/Z4OZ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXwmmigOJJFWil
 HP7uCrDS6nsPNpum+XTGSqnFKw8qMP6CPXQZq+W5D6y7WbuHcFAuVwgUtciMcVCmDN4PX7icvRk
 ttRnStxklneSZdbaavVFTmqVT6NsEI2PzJt2Sket5uDvommltydA7E702KFskScHMzR0eBcvP83
 CTmjpZt/v+wz8pVFFtNu+KUTGsWlk/H1VPiyx3XpNsZr6O9y7hZDngZ14tosYBZ87gZXC5A3CMS
 YGhHKXQYWJ/ts7cXGdNrlHThkMwLoSTEMT6kq4ISW0QL01CKXHFkK1NLTa1UPNsoR4hJqLcnA5H
 uM9Dnf0o/vuSaJbSVLKb8G3HLuU1ctc5E8NVpuXZLy9ry9WWFE6ck3XrORy22xh53izF65BbNM4
 0n3P0zMzVV1OaSOs/kAb6exT6+qLhvogDPqpq/W4H5xCLa25XvPFnQ4sYnOFBJWeLjAzbQ6biDh
 I1IoiXMcygtrrVK9CXg==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1d6e7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=vdKEjRuvQ9rlgTdWijoA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: CKq-zA3AEbApgsiUcOP29kMW6JTGYYEI
X-Proofpoint-GUID: CKq-zA3AEbApgsiUcOP29kMW6JTGYYEI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090057

We want to save/restore all of the CP_PROTECT regs across IFPC.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index a3eab0307529..dd1a5ca91812 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -1393,6 +1393,13 @@ static const u32 a850_ifpc_reglist_regs[] = {
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

