Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395187;
	b=KJhCy7LIxDYcqU93Rhy+1mNFwMv7RdQqfYfa2UYELC9/7dst7h5BtnZ3fXwTCnkY7MfJ
	 1jERBbpLBzCs5d7LStKXGsuByMVd8X/UrEL/jEtpNvPcKt6mqYu4wp+2c3N9312aS+krM
	 DlDk42eUtYLSIh59BzJXtekyd0zrGDORUuAUxWAHNqTEIwzmFMyL1y+QDTlTnQxafWXA5
	 6au80T8XcI5uy5lF1O/MlYuvsAidpXPODpMMFUXQXLFeBD5eBOkslcFdJBdiuOj5WrcD2
	 v8ceaGnjXoRZ7DHZGunApM8BfM9qODDN1uz2m3/FBUJIrILd9R0lNQFDxo1MN05FTKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=en+kx17O9HvlGJdYkQ6xEsXJtVuKpJWhTDhQIUh13CE=;
	b=YkpPOjKoHGtH7I08t7J0asvtTrtGUUaJDH/wFHhgTt0vkuusnWtLi3K3kgMswnM5ut4m
	 y9CW1LmeOaTemW/ng29zmAs/aLbwcKssPnO36PedO/L6kvfqBBqOvPVDrXAXT6Z/yZnee
	 QG8QkG0L/qAE4OukceiF4QLkhfPxXmWv0Kx05DdgSrIoE5LcriySpO7qQq+s08mLiW4CG
	 /Q2p638S+AYelInL7nYQ4dRe37c0BsgX954h8OMVzYdmm1rA/uZa15bumGxuFL4qxSMri
	 t3K1VOeKcHpg6pyfL45s7SIZhSm24hKuizYZILRkYJgRpfbOJfO09qKt+TKeyGi866Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="B3W/fV2G";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Md7y0B6i;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7629360A2629
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7629360A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B3W/fV2G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Md7y0B6i
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAdfW799544
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=en+kx17O9Hv
	lGJdYkQ6xEsXJtVuKpJWhTDhQIUh13CE=; b=B3W/fV2G7l5Xpz5s/J9CRKwoDYM
	2OQXLI3NKQAcqjTP/IG6Hop7NkiNCVzAIPoOKQTGXiH06qONoAKiYya6IIeYZrQe
	mYMM3YrmjwoWASiwXQPg/3L5+7A2QkYDmKevtOXnJR675wHYWWd6Yno95K51Ye5G
	/08UoTQxKgUV5/IhnhUgsQZQDYQ9YqDOp+Bw3/WQOxQj8FCuU1OYisNUhUhLsGom
	ufFOrDU+JgVyoDdhFWvvITgQd8eeK4OL3pGnFgLvW3FfbxF8NWsa4/LQErgIeEWl
	sq7gVnZooWCcR2rRtKbS/bgCMtUGfaw2HgLA0Qn1iUu2qkjI/KhiP5P8eaw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x1017p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so2548939a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395185; x=1793999985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=en+kx17O9HvlGJdYkQ6xEsXJtVuKpJWhTDhQIUh13CE=;
        b=Md7y0B6iVKRRbIKD5FV9YWhWhff++sBB1otXzdMqiCsBgdRYlUxS4tk0TpvIuMOLXe
         dGC8LvmKY6C3Q7UkhlYoRpG1ygf5hBpcsOWk5NToKohWcgLihyr97IZNX9ocfEU0dW2l
         8NEpeqoNQibTZxHJR6IRjNnLGjZPGZPgmy1E/idMaZF1OM7I3rLxFy/21tWRb0WOzuAY
         tgN/6/GEQiGQOwW9HNqlZEpzNIJKKZmpba97/d289T0KAQECd8/xm0Vh1Mz3i7cY+B68
         uyF3Iuy9+7/zhOYCXibkO2590sMBHKbV4U8iYFhy/pr+jiMzhnMoHM2SEyeAhgnrSLJP
         wqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395185; x=1793999985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=en+kx17O9HvlGJdYkQ6xEsXJtVuKpJWhTDhQIUh13CE=;
        b=RnUpUPjH3N0oSLGijMv1/dann9hyQ7WF0N/rYm+wz7ucc6FBzt1v1BGKAD50jacZ5G
         VMUXEqkBrHecdUKQOlVkEkyqCcJsB1kPcMiey1g+Q39x7c56AHqVYomLNuBnpHAYa/T8
         xiNC4x8BxT+5SOvwdd64dbgX8WskwO7MYqhXm8o77+NsCTcsa0k+A6oFRiyKlhQru39Z
         ug9O/iS8YzeCSeVm5IPoMAMLlGqe21zGAanY0vxG89DYBK5BV5ZB8XvX2KSh+pGucQKF
         OFrkb+HVFx1kVqVjK6wwDlQB+A7DEUJUP626GyQLeUa8V7lh7dqVsHNJkdIU5twLbCxu
         3pFA==
X-Gm-Message-State: AFq9FYIQ15hw6RTCc5LYzPo80qa79J4nXjBJI2A5xE304pHI+XynjMvl
	pxvPQWO7oH4vaQLVGghtCjHlPWK/5TjurfSq+9Miy85eRQRbc1L60ZQ61HFDmp6M5ipi9YcQwuT
	XdzEi64QsQ8UfALzjjm8w5HtpgjOqjHIeVlDBOQ14R3+28EXFIuHG2IXej8DO1hHjN5ub
X-Gm-Gg: AYBFou3bZhaesyA6Wb7SHj1J+DcdAKydew+hejxNKoH0ndDQu1RRhVBqPekWbv82qNq
	BaRUfluuc/GSaMUAcqrCucOSCfY4EGwmyZCt+wKpudjdm8WgLzzJxN5eUVY54NfzlOWM/b02FlB
	HMBaVP2RQzApQreY3hmzYoZZwoeL9PTkkLtbIWwwZNPH4Qo4lZ4mQ44Zud192WBQMZblKDhJCPm
	OT2OmIfgUMQ8h7Vqamy6DbNjQXuFn8hur/haOyVCjH820DhDXqy16M3ypF1sbIl1Cyci8hxJHXs
	WFo6nyPFY0CP1IiGy3BKvd7ReC2S4eMHB1J54IQDW60pyTuVNRhC3eKXDFFh7umsMkTvpBDUfFH
	I72hxz3Gc2mGtEJg0Pi1V0VlzJY1gxVqcn1hB3LPuEHt2Ja0Opino/gteUpZdz8b54E25a4zXVw
	KRC9dSLTqeu/+kqhp14O2aQME=
X-Received: by 2002:a17:90b:57c5:b0:3ac:a139:1b14 with SMTP id 98e67ed59e1d1-3ae8984acc9mr3134530a91.57.1793395184756;
        Fri, 30 Oct 2026 14:19:44 -0700 (PDT)
X-Received: by 2002:a17:90b:57c5:b0:3ac:a139:1b14 with SMTP id 98e67ed59e1d1-3ae8984acc9mr3134512a91.57.1793395184364;
        Fri, 30 Oct 2026 14:19:44 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8803a80asm2434346a91.3.2026.10.30.14.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:44 -0700 (PDT)
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
Subject: [PATCH v4 05/19] drm/msm/a8xx: Add missing a850 ifpc reglist entries
Date: Fri, 30 Oct 2026 14:18:07 -0700
Message-ID: <20261030211928.45761-6-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX64oS91arATfw
 q40kw+b8M3NpXTBPio3qGAVQzcyd2VypoJCxVQsZUz/KCkycuTiR/VnhSmkaAHgOy8yo2a54qIi
 wAaV/z0i52psv2p85V1JZxDzJklOWL4WHx226e7n8RJ4GnMaFj90VwuXwR0R8hyHm0O6IWL+kxW
 vB6sHu2knYjty+HLkn7Dk83JOUUDVQMen9Mi+3thdB2kPowm31uOtSuRtMyWhu8V2vAbP1njzhb
 fzY/I5zlanLmPeyvPYOs0OJZ3/OgM2u1smhv6gSgoIbPlO61441hkwCTTMGxUU8MygA5g6/jNed
 RuLFZIQQRGNrQzzE08ncPx7QpVLSkS8cc9LvbHviqINqir49eBLuicSj0hVE8olSYY6DeJpgz61
 ZLH411prW3IvoIPIAkA6XXk5tFJn/A==
X-Authority-Analysis: v=2.4 cv=CLG/zhrD c=1 sm=1 tr=0 ts=6ae509f1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vdKEjRuvQ9rlgTdWijoA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX8rvfONe7VhDO
 npFMgn476+LW4Tz1SavigT+K7wZoCvgXQEcfMys33NK3Fx4n0Ry2hbD5P0hJ2zCUqXd27ZPkBBn
 3rbtDVV3aUfjBxT/qYAYz/Rq1WYSh+0=
X-Proofpoint-GUID: GmJEUs1CbPMFsyWgWG1z7oXzkJdNMYgL
X-Proofpoint-ORIG-GUID: GmJEUs1CbPMFsyWgWG1z7oXzkJdNMYgL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300084

We want to save/restore all of the CP_PROTECT regs across IFPC.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

