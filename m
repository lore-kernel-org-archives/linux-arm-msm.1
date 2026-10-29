Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305114;
	b=pDcS5/sxWunQty1bYQnYdSZ75EC8OoJ1QU/Jx0F2jgKYDwN6o8aZUR7Rz8wxO5YEWG1v
	 TKVJHwZDhQwsR+0U2GkJZilXNRuqi84W9j5vl7J7X429jYQJJCRWsHzfQsDGdK1JcAU45
	 bxY5ycI3w2MXX7MX7EDUlmUVfmW4ZPeGifMpvsrbh0VB85mD1Cph1ZGfN+lRqupqFHY8M
	 A2zpjs3vzWlCjnQzGV+V9O/5z6tiISwUMZu/NUurh58a36TlfibAWZaLVzugvE2XHrAa4
	 1SAe41AJ+u4O8zBIIRxuS5KO37PqvexTHN6jG9OZl9xQDqt/3OvVNFUj2WWR1EyrRqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305114;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VvwcNnV3NLWXl2edzBTcgU4bLL5v//Ir4N3CYyRzoSo=;
	b=DZG9fnnav/Z91t1ZTpgpB8DY/vJlJsAxskewTSuDoAfDLjHiZRDbX+ACq7RJy9Lo0qK0
	 elzN+llUi1oE2r2y6tCRfPHUg3DWDBdF8rknEv6uF0F2r7LAQkZ2sM/AWvPrz0kZuogXT
	 Z2ISXoo5OjtMrslko8hntJUlU4HScC88BzxflOuZ73U6+70NzM+tOb2+AxCd8mfr8Aifn
	 EhW++oOKqRml06Be3DEHtj8WUgRDwOUkDdTp46VkOZOBUOZYNCadUPsvbHZGkOtHuZCme
	 f8S/9KjtHYZFFpG842G4pWSIctqKzOVUdlykg7g5Gc/kvIFqmCXQcYDxzcthYH3X7Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iav0W22k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GENc44fV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADB3606A32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ADB3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Iav0W22k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GENc44fV
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJjwBt1708082
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VvwcNnV3NLW
	Xl2edzBTcgU4bLL5v//Ir4N3CYyRzoSo=; b=Iav0W22k3BZYbZfSR3ckPGo/1gE
	FWkT2HilzUAgEr/H0w4QURvpmodaiDEjh4BwveztJpGEnn1pR3vt3qh+8ol80Eno
	TvL4F8le+SUWKH2wp24+hmbPNVxY94iZB2yddXJb4jU37JbeiMj4K2ErWAjEx48x
	qf/5FbgEw/nIZ0a84JryiBMmUIZ1Z0YwpVKIBIW9HzjDKEOfRwV7H3A4Z3WKS2jk
	dD6vCEpVrKlqz9lWdjFZ6KrsU4VEmCnj5LyBDa0BltQtKGUWj6yuGenlbuf1RNJO
	ymQ4Hxx+Sf51/seXZqiuMN480uTnMTEXqSec/EjgqfJGhCZt/HZoQWS8msQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm76ck53b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 20:18:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cca35cf9f77so1552480a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 13:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305111; x=1793909911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VvwcNnV3NLWXl2edzBTcgU4bLL5v//Ir4N3CYyRzoSo=;
        b=GENc44fVs/704QnsnpQLJBpZ1/+jEUVdLeSVdr/tx0Q0mo4Y7Ip2UNFf2X45kqo0+K
         l4Qo93kSYYAu88gpyIRow+EpvOlpFbHIe1tjYNCaswqiG/nkRIVE0uEL7Yyl7b3Ki5Db
         1JsgD3RF5gvowT69ns0ywb/07ZgO6k+0gtoGE950BBk9h2AJIsyzWxgOZoGd/oNF+H92
         f3YeysyrEmfcE4a2po4/us6Q0Psf4F0iWcQQUl7GsttWe29UdClwjpnBgLp1FrWGW27c
         0S5Uvyg0drSeNlsjqPwicioXisfuip5Kh9uqc1QgigjnaEs7mMYTDUJ5oImcn/3ItPNK
         2i+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305111; x=1793909911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VvwcNnV3NLWXl2edzBTcgU4bLL5v//Ir4N3CYyRzoSo=;
        b=LzwABxigD+AJPsFBxqE+zzg+AK1e5OWttDLK1ntl9OcBo0MSDmvBPo1QLM00aASP2c
         XCA+cbCsBYgaA32EFFFPBkxwBxFjuOZuED/g63NbW73hfYdu2ZXz8c/HD46iKbij1qPd
         d5zUkl+QzfwezQbOmLTAZTHUckETXQHQcpIVJJwzwIG9rlXUlt257dBPo0zNcQ+RAdmZ
         yZ9TCveZv82oA5FFAgC2OTC39rll6Vy6/CmX40OKV4YAapxmJCq/BS8NmB7OrY28cxmj
         bHtVWJ3HU/x2C9jcofwx2UWftV7eNH8SPZcG4ugeP1s/B21P88ON7TujUgy2vPJoojTx
         Ur7A==
X-Gm-Message-State: AFq9FYJYJMNSiAIIosZiLCXuXg8LG2Sh49CAcB3Hsn/8RUqH97Ls9DI9
	W6hb4/308/mKaOpicQymc7AKbOJ4GFzQLCYGwWKje5yrW9/ROyfZcpcfubC37ukH3YZp+LoeY3J
	eOA4kXNkJSi6hpOqO9BjUrjU0XPNfoZpRZ1ZWg8SaXDIW8C1P/EMzcgkReuyH8FgjHQTC
X-Gm-Gg: AYBFou0tgCYcvx5tcpa4G/xGS6TAZDxy66yOhk00Fqf21SWuNH3bgX1Y7tC5Y+KUrUC
	ZR+YQOtQFrbWjxAWPtQOibQjapCrWPKb5x76nJmo1lBxh7DJwShb2kF4DEjf3w0rRIaMDCfhWjb
	heqqIB5ZYj57ADLLKBNty66+h5iYU3lBAV2YsMHFIdToqitSzCeheb64Peb+MB+QznZl929/Ckz
	jWnkprFl3rCzxec+/4uReA+D5Jkq9DFqKajlRN7J4BiT1a0svxirDW5cHh1X87FNoEoLuINL8b9
	/tV5dbXisvg2khhcc6FIz4Z5oxGMMidqPAF0xJwry0B//pMEHbPV4DyVzmZIB7w9+4mDAv188xl
	R/VcDOiLG0jlurSj4ZkA/h7sPKQa3uS8ZQ1dFGi5/YnAWU4KOdremEc8onDEvHa6+Uerw/y279U
	K8C2xi11urrOQiYUbCjqVgKoA=
X-Received: by 2002:a17:90b:4b0c:b0:3a5:1b:34a5 with SMTP id 98e67ed59e1d1-3ae89799b08mr69730a91.49.1793305111237;
        Thu, 29 Oct 2026 13:18:31 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0c:b0:3a5:1b:34a5 with SMTP id 98e67ed59e1d1-3ae89799b08mr69702a91.49.1793305110672;
        Thu, 29 Oct 2026 13:18:30 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9b1506sm5336631a91.15.2026.10.29.13.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:18:30 -0700 (PDT)
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
Subject: [PATCH v3 15/16] drm/msm/a8xx: Switch to generated protect regs
Date: Thu, 29 Oct 2026 13:16:25 -0700
Message-ID: <20261029201730.151754-16-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: kpTM-MTDTtAe0YA6laZWo55k9h_1zz01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX0WYz1SWNmolX
 kmms+J5/2RYYDS5nxK2k61KP1l2CTPkhJsG3HS6zIyl5ZDMFdD4gmigfX4Kq7LW0h7apANGyvCw
 XB4ArkLEsOvGUofTGZaowfLStpL1oFRuMQtuPpLYH77m52kbYIo5dRbmAGthNK30ewFcERgjyKA
 ywka+tDa+2RdlyfTxkLcbBXh1uY6XQBJhHIwiICGt6tBgE7dyWkLI3CQ6rq3GjEBw8URg/UtV5M
 5ZBX2iVIUkFU0Zt03GJM15VN/v9kIftRF2jSS2dU6YqOZqB8R13e3ydreIgmeApw8ndIbnPtgCZ
 XKXPpD6Pqm5BJG+iAl+4DzI80/YyoBaNyOlzZuTRx5JuU8ZrNrsU8Q+COiVSdVUzVloi4FHqSH+
 sq3jHKL2XlB7mrQdn6qT8vYQo2wbYts2huJUpd54Tb8OBl5xxEcBEp1HFIgRIr94pEWO5oJ9BgN
 4l54sEci/9sCR8KFLtw==
X-Proofpoint-GUID: kpTM-MTDTtAe0YA6laZWo55k9h_1zz01
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX0PNsck1laCf8
 hRskjRZRT5zuTGKpbZgS4ZwdtL7NYmPNMOifpQbYBvNKsGXpsbpQbFxrDHIltE8JRtwEn4KCxG3
 XUW4h8LvKrrUBwfMZcU4NI578sahmVU=
X-Authority-Analysis: v=2.4 cv=NPtAaE6g c=1 sm=1 tr=0 ts=6ae3aa18 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=JcQOObtfp6PrThPhMQoA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

These also fix some perfcntr SEL regs which were mistakenly blocked
since we previously just copied the protect tables from downstream kgsl
(and only sometimes remembered to fix these).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 301 +---------------------
 1 file changed, 13 insertions(+), 288 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 3c9025a93445..50c121d3001c 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -83,58 +83,6 @@ static const struct adreno_reglist_pipe a830_nonctxt_regs[] = {
 	{ },
 };
 
-static const u32 a830_protect_regs[] = {
-	A6XX_PROTECT_RDONLY(0x00000, 0x03a3),
-	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
-	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
-	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
-	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
-	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
-	A6XX_PROTECT_RDONLY(0x00759, 0x0026),
-	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
-	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
-	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
-	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
-	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
-	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
-	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
-	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
-	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
-	A6XX_PROTECT_RDONLY(0x03cc6, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
-	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
-	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
-	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
-	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0ae00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0ae02, 0x0004),
-	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
-	A6XX_PROTECT_NORDWR(0x0ae10, 0x036f),
-	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
-	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
-	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
-	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
-	A6XX_PROTECT_RDONLY(0x1f878, 0x0787),
-	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
-	A6XX_PROTECT_NORDWR(0x20000, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
-	A6XX_PROTECT_RDONLY(0x27880, 0x0381),
-	A6XX_PROTECT_NORDWR(0x27882, 0x0001),
-	A6XX_PROTECT_NORDWR(0x27c02, 0x0000),
-};
-DECLARE_ADRENO_PROTECT(a830_protect, 64);
-
 static const u32 a830_pwrup_reglist_regs[] = {
 	REG_A6XX_UCHE_MODE_CNTL,
 	REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
@@ -366,63 +314,6 @@ static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
 	{ },
 };
 
-static const u32 x285_protect_regs[] = {
-	A6XX_PROTECT_RDONLY(0x00008, 0x039b),
-	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
-	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
-	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
-	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
-	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
-	A6XX_PROTECT_RDONLY(0x00759, 0x0026),
-	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
-	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
-	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
-	A6XX_PROTECT_NORDWR(0x0082c, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
-	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
-	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
-	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
-	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
-	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
-	A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
-	A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
-	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
-	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
-	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
-	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0ae00, 0x0006),
-	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
-	A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
-	A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
-	A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
-	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
-	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
-	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
-	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
-	A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
-	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
-	A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
-	A6XX_PROTECT_RDONLY(0x27880, 0x0385),
-	A6XX_PROTECT_NORDWR(0x27882, 0x000a),
-	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
-};
-
-DECLARE_ADRENO_PROTECT(x285_protect, 15);
-
 static const struct adreno_reglist_pipe x285_dyn_pwrup_reglist_regs[] = {
 	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
@@ -525,57 +416,6 @@ static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {
 	{ },
 };
 
-static const u32 a810_protect_regs[] = {
-	A6XX_PROTECT_RDONLY(0x00000, 0x03a3),
-	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
-	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
-	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
-	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
-	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
-	A6XX_PROTECT_RDONLY(0x00759, 0x0026),
-	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
-	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
-	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
-	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
-	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
-	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
-	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
-	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
-	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
-	A6XX_PROTECT_RDONLY(0x03cc6, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
-	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
-	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
-	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
-	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0ae00, 0x0006),
-	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
-	A6XX_PROTECT_NORDWR(0x0ae10, 0x036f),
-	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
-	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
-	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
-	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
-	A6XX_PROTECT_RDONLY(0x1f878, 0x0787),
-	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
-	A6XX_PROTECT_NORDWR(0x20000, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
-	A6XX_PROTECT_RDONLY(0x27880, 0x0381),
-	A6XX_PROTECT_NORDWR(0x27882, 0x0001),
-	A6XX_PROTECT_NORDWR(0x27c02, 0x0000),
-};
-DECLARE_ADRENO_PROTECT(a810_protect, 64);
-
 static const uint32_t a810_pwrup_reglist_regs[] = {
 	REG_A6XX_UCHE_MODE_CNTL,
 	REG_A8XX_UCHE_VARB_IDLE_TIMEOUT,
@@ -893,64 +733,6 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ },
 };
 
-static const u32 a840_protect_regs[] = {
-	A6XX_PROTECT_RDONLY(0x00008, 0x039b),
-	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
-	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
-	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
-	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
-	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
-	A6XX_PROTECT_RDONLY(0x00759, 0x001b),
-	A6XX_PROTECT_NORDWR(0x00775, 0x000a),
-	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
-	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
-	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
-	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
-	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
-	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
-	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
-	A6XX_PROTECT_NORDWR(0x00c07, 0x0008),
-	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
-	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
-	A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
-	A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
-	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
-	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
-	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
-	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0ae00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0ae02, 0x0004),
-	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
-	A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
-	A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
-	A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
-	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
-	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
-	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
-	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
-	A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
-	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
-	A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
-	A6XX_PROTECT_RDONLY(0x27880, 0x0385),
-	A6XX_PROTECT_NORDWR(0x27882, 0x0009),
-	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
-};
-DECLARE_ADRENO_PROTECT(a840_protect, 15);
-
 static const struct adreno_reglist a840_gbif[] = {
 	{ REG_A6XX_GBIF_QSB_SIDE0, 0x00071e20 },
 	{ REG_A6XX_GBIF_QSB_SIDE1, 0x00071e20 },
@@ -1356,67 +1138,6 @@ static const struct adreno_reglist_pipe a850_nonctxt_regs[] = {
 	{ },
 };
 
-static const u32 a850_protect_regs[] = {
-	A6XX_PROTECT_RDONLY(0x00008, 0x039b),
-	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
-	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
-	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
-	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
-	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
-	A6XX_PROTECT_RDONLY(0x00759, 0x001b),
-	A6XX_PROTECT_NORDWR(0x00775, 0x000a),
-	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
-	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
-	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
-	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
-	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
-	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
-	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
-	A6XX_PROTECT_NORDWR(0x00c07, 0x0008),
-	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
-	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00df5, 0x0003),
-	A6XX_PROTECT_RDONLY(0x00df9, 0x0007),
-	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
-	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
-	A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
-	A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
-	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
-	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
-	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
-	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
-	A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0ae00, 0x0000),
-	A6XX_PROTECT_NORDWR(0x0ae02, 0x0004),
-	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
-	A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
-	A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
-	A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
-	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
-	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
-	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
-	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1ac00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1cc00, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
-	A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
-	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
-	A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
-	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
-	A6XX_PROTECT_RDONLY(0x27880, 0x0385),
-	A6XX_PROTECT_NORDWR(0x27882, 0x0035),
-	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
-};
-DECLARE_ADRENO_PROTECT(a850_protect, 15);
-
 static const u32 a850_pwrup_reglist_regs[] = {
 	REG_A8XX_RB_CMP_NC_MODE_CNTL,
 	REG_A8XX_SP_HLSQ_GC_GMEM_RANGE_MIN,
@@ -1637,7 +1358,7 @@ static const struct adreno_info a8xx_gpus[] = {
 			  ADRENO_QUIRK_IFPC,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
-			.protect = &a830_protect,
+			.protect = &pakala_protect,
 			.nonctxt_reglist = a830_nonctxt_regs,
 			.pwrup_reglist = &a830_pwrup_reglist,
 			.dyn_pwrup_reglist = &a830_dyn_pwrup_reglist,
@@ -1682,7 +1403,7 @@ static const struct adreno_info a8xx_gpus[] = {
 			  ADRENO_QUIRK_SOFTFUSE,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
-			.protect = &x285_protect,
+			.protect = &glymur_protect,
 			.nonctxt_reglist = x285_nonctxt_regs,
 			.pwrup_reglist = &a840_pwrup_reglist,
 			.dyn_pwrup_reglist = &x285_dyn_pwrup_reglist,
@@ -1727,7 +1448,7 @@ static const struct adreno_info a8xx_gpus[] = {
 			  ADRENO_QUIRK_IFPC,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
-			.protect = &a840_protect,
+			.protect = &kaanapali_protect,
 			.nonctxt_reglist = a840_nonctxt_regs,
 			.pwrup_reglist = &a840_pwrup_reglist,
 			.dyn_pwrup_reglist = &a840_dyn_pwrup_reglist,
@@ -1773,7 +1494,7 @@ static const struct adreno_info a8xx_gpus[] = {
 		.funcs = &a8xx_gpu_funcs,
 		.zapfw = "gen80300_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
-			.protect = &a810_protect,
+			.protect = &milos_protect,
 			.nonctxt_reglist = a810_nonctxt_regs,
 			.pwrup_reglist = &a810_pwrup_reglist,
 			.dyn_pwrup_reglist = &a810_dyn_pwrup_reglist,
@@ -1816,7 +1537,7 @@ static const struct adreno_info a8xx_gpus[] = {
 			  ADRENO_QUIRK_SOFTFUSE,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
-			.protect = &x285_protect,
+			.protect = &glymur_protect,
 			.nonctxt_reglist = x285_nonctxt_regs,
 			.pwrup_reglist = &a840_pwrup_reglist,
 			.dyn_pwrup_reglist = &x285_dyn_pwrup_reglist,
@@ -1859,7 +1580,7 @@ static const struct adreno_info a8xx_gpus[] = {
 			  ADRENO_QUIRK_IFPC,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
-			.protect = &a850_protect,
+			.protect = &maili_protect,
 			.nonctxt_reglist = a845_nonctxt_regs,
 			.pwrup_reglist = &a850_pwrup_reglist,
 			.dyn_pwrup_reglist = &a850_dyn_pwrup_reglist,
@@ -1903,7 +1624,7 @@ static const struct adreno_info a8xx_gpus[] = {
 			  ADRENO_QUIRK_IFPC,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
-			.protect = &a850_protect,
+			.protect = &hawi_protect,
 			.nonctxt_reglist = a850_nonctxt_regs,
 			.pwrup_reglist = &a850_pwrup_reglist,
 			.dyn_pwrup_reglist = &a850_dyn_pwrup_reglist,
@@ -1938,6 +1659,10 @@ DECLARE_ADRENO_GPULIST(a8xx);
 
 static inline __always_unused void __build_asserts(void)
 {
-	BUILD_BUG_ON(a810_protect.count > a810_protect.count_max);
-	BUILD_BUG_ON(a830_protect.count > a830_protect.count_max);
+	BUILD_BUG_ON(glymur_protect.count > glymur_protect.count_max);
+	BUILD_BUG_ON(hawi_protect.count > hawi_protect.count_max);
+	BUILD_BUG_ON(kaanapali_protect.count > kaanapali_protect.count_max);
+	BUILD_BUG_ON(maili_protect.count > maili_protect.count_max);
+	BUILD_BUG_ON(milos_protect.count > milos_protect.count_max);
+	BUILD_BUG_ON(pakala_protect.count > pakala_protect.count_max);
 }
-- 
2.56.0

