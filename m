Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007405;
	b=NyD6LMGTwVrzVmMBfFPSdIAAexf5fAGg1jgKeOWWi545MUv5QKJMkwvlOc2eQy7vcnsi
	 W5Psx0Ee3oXVe6a32/PC2w8s/hf3w2cPjoS/LXM1rUOkRz8EUybobqJvmiDJHEvFQzuoz
	 5KOa8Az8kXMKO58ZDEYp61oFyxXI9DwLbtbBq5ic+HUrEK/pYesqXh8mZZSLVy8LL03Hh
	 5bI34ogo3Lb53OAWhqNUXhuSCuMmo247qu3zRTZJ26qNVmgUpkvtpHxDYepgTqpswCnZr
	 fTcYZiO/CMZWjoFBbLqJ3hGT8eOQB3QRbY0GnN3n0B6mrEzlQp+T6jeHAZxknrCLF8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007405;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
	b=zHLWNQMrJ4bPcAAoulg6zmi2C5wNBdfR0H/xlO8RWKuujL9zOi0J0DrERcNL+WoZORhu
	 HisnxJgnSklhLoTcJH/lJY6rmliic8GN8018pryAjTKknumQAu7uElAsTwhN8R+E/279w
	 NOxT4Np/BH+5zXmx3HkFa3hUcUkZ0jKpMNh71p4aDXV7IbE/EOKSp3v9lp+7OVdPoLPeH
	 UqSCCogcX1ADWkqJd4ZtvDtSh2tY6IdHT7FcFtq9kSpL0yfRcrzOvQMcmH+a4tOkbmZQF
	 KBjHVTfjVRaYnD/a/t3XLznXabphcXgARWATq5pErPBIRmVvFWpdCrjyixprUCHNyLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALRfDkGX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Df4Hbqfq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A18606D80F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 23:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3A18606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALRfDkGX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Df4Hbqfq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Mo2nF2144234
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 23:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mVy1ahp/P6z
	Kdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=; b=ALRfDkGXfTnQsj/c7be9hGwskhm
	VAJZntA9czuWMltnPizvzIy1oP5/nrIb7fj4lgH2lVQWU0aGxEp4S3bZ26278wQM
	HEjuwR9xFYXE4SRDpRCqwcHeJoqxC2i3qJBkps8npmugHvQGSQEnpTZf1aYXlbOu
	07QP80QnNxVFUH3jURPftHu959u5Fk78TAf7F5dChAR3ZlsynHvyudAYTqQuMSOu
	5fGnQjr6LSo5erNOIWCsFXlCJ3MKzexG/ZLsI+1BP+Y4oEUQi7OvPfTsqeLig9wg
	ZGxYTlCDwmvfRQkgD8If+cGKZdrwgprs3GQCHgfdvaGXkFIBjGs/PRUKd6Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmypgs87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 23:23:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb4c49e52fso1143593a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007403; x=1794612203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
        b=Df4HbqfqWC6vGEW5tBGgTrJhSLP7toyn+MYdqgl7EdDHpqeNZKDpZau8iZz/KfB9gl
         DAftN7oPj69347Vie/v4s9e+daeo5Q8tD7zUIzj2ZOzoIOpoWuKR/7EzVSV7/8YFc9YE
         gaWHJgfm46gHPgd0Ee3p7K0WwqGw/Uxy6PYHReBIWEDD/YQo+bctkLvahUHkMwjyF2EE
         rUeTduW8n8o9xl+ZpWN0DQoPcnUTsJM5EsnPZPRIe8nlXgi9wyG4qeVyTbfAvw7FWCbA
         Ftnc8oJ/Qp932NETkzyQpAWwu6fZtgswSdlBfgXB2bW34lx4MTXAAwEkGZgaOllM2tv3
         Dq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007403; x=1794612203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mVy1ahp/P6zKdu4H9fQ7zteH5AB1M4xbGRPzRcWMmpo=;
        b=lJkl5+lL3xj7YJAgDpbdc7GCkO91PSHmNtgarCTnyXHknLogPdCGfTBOBCDET29T5u
         LhTKGlBVE5gG5Js2m2fqycVK7bsladRP6jkukbP1noP5zN6JaFPNsMD4pV9UFLutJK9y
         pyBA2dbFhqGo6hlOTczh6lJXIOS4/M4Z/UIbv4jUOvjibdEr1btu83mQ10A4FmX84Qmr
         z73x/WYKw0JEUQfJ1w2ETjdVLXs5NB5mMaaiSLh3qbzCyCxqg1gFj9VgueXh/93AE80v
         7UlVNfLwqyMlWwEyQb+0SI5n6f/pNdg4hsSVEnLn9TdOsg7qR2kwqiKywMdjW1x9NlSd
         I9Kw==
X-Gm-Message-State: APuU4Z+gyqx6emD0/7pOcwmMzFheUpB93WUpXMXCnWlmDB6rkXIH2QFc
	foCG11CCWzry83TyvRDKhAMOaRUGQUyb9yqzvDk3c5jUmd8mKRZSj4n4KgyisSt+y6FgiVB37Yk
	NRAFdvsB+Djp8Ozo77HXhXj3HsKAJOh204l3bdWS20a6USRW4ykY7adNs9X0X8A6lP9Ca
X-Gm-Gg: AYBFou0sGj5D9oCF2asvO8eRWS3lPufxMMAu7vEJQC/VoL4sN6kHTvcznekgN+/KPV+
	EYU2nThOEdq8hlVLGhs1o9O9IZnvanf2FXBf2gZuGcRCQt5OUUjcOP+ZUNrr2gvHWFQQ/Aa38lX
	WgbIEAcdKbcDQksNLfCIuNqiJzut3LAc5GSU2hAgrqWfp6+SLbadtOZCpH2CHORUjo0Ls3H+b06
	oKzPUcJbw8dH+uTmy8HVHSrDqN0vbl+6B8Q66v/db1XJFSmGlkDmcxybNR3mISdiQjrds08kmXh
	3fPwFu3llevIt2AKtD5j/60JLPPfxGXk8GqnqA3AcEcBCOI439W4Wh4QhW48QFHEDjXiZtYr2Dt
	oH9HMmrlUCy1MluHHUBhyLUmXbK6H4i43orKaX/Xc5Hx86Q+KefbR2d0tz5YEIwrevVeLqBINHP
	zUrkGLSGRwxtpXZ79xMusdytZsz6VQoqNb9g+ekS5jUv8mlP7y/p/pfbbi0vmryw==
X-Received: by 2002:a17:90b:3e8b:b0:3ac:7556:8ee0 with SMTP id 98e67ed59e1d1-3b0db6bc565mr3864398a91.19.1794007403452;
        Fri, 06 Nov 2026 15:23:23 -0800 (PST)
X-Received: by 2002:a17:90b:3e8b:b0:3ac:7556:8ee0 with SMTP id 98e67ed59e1d1-3b0db6bc565mr3864373a91.19.1794007402976;
        Fri, 06 Nov 2026 15:23:22 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864390sm655031a91.6.2026.11.06.15.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:23:21 -0800 (PST)
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
Subject: [PATCH v7 13/15] drm/msm/a8xx: Use CP_PROTECT_PIPE regs
Date: Fri,  6 Nov 2026 15:21:05 -0800
Message-ID: <20261106232220.47602-14-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX6ihSon0eVS49
 vTD/gvZu9q4Oq6iywcdf5puqzhTMw5Vb3GUNn3iYXjSwuCsSTQ758zGpiFqdSMvJxpgXXIUrxBh
 tX+wm9y/nKr7bVlwAyETSqY+gXumB7pDLHZRAH8hARw2laTkghOYf8IQM1iS9ZZk5MxDqqDv27m
 1IMHzfMse33YoqyzMu2wbTKc4XZBFXA1FJ7jErWu5gx0zMlvoi1xXRxJEHmCCnzPO3Xwuf4yn7E
 F1HEqKTn5l0Ya+dklAO0NON0f1gxGI0PsOciEeT0cAaSUe46rTag2fvGYHb48FT1p9/WlAdzMhq
 /d3/dUQfDQ/xtz4DUFwhM4GTvIS/MlK6uI8D7GriDQWkXmOQozV1nr8PszGc6B5UppkV3zO3ozA
 JXYDgRxiRHGgSMg/RrJb2hlJcZ5IN0gbICi6v2NERZuKx8G/ga/w9vBFfjVZR3sf0+pzsSudJUd
 hCMjdrnrmehAAvwUlpw==
X-Proofpoint-GUID: IjwWGxIYOH8EH5K9-dmTGucl8GosmekG
X-Proofpoint-ORIG-GUID: IjwWGxIYOH8EH5K9-dmTGucl8GosmekG
X-Authority-Analysis: v=2.4 cv=TZ4DJhQh c=1 sm=1 tr=0 ts=6aee616c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=UnxhJFuZtzOLgjs1IeAA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX936yNpaEZxaj
 PI8WNyFKS9hYqCuB+DpR87o2aC5pRg3SR16/fZrMbSsWs6kSDIGUbczxQRN5OWUHSzfcGXwSI+A
 iTHXIdb94h3CW7vUysENgS3sX754oJY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060093

If there are not enough global CP_PROTECT_GLOBAL regs, we can use
CP_PROTECT_PIPE regs for the extra spans.  We just need to configure
them the same on all pipes.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index f65bf82e5c21..f6afa5b3b0bb 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -261,12 +261,21 @@ static void a8xx_set_cp_protect(struct msm_gpu *gpu)
 
 	a8xx_aperture_clear(gpu);
 
-	for (i = 0; i < protect->count; i++) {
+	for (i = 0; i < min(64, protect->count); i++) {
 		/* Intentionally skip writing to some registers */
-		if (protect->regs[i]) {
-			gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
-			final_cfg = protect->regs[i];
-		}
+		if (!protect->regs[i])
+			continue;
+		gpu_write(gpu, REG_A8XX_CP_PROTECT_GLOBAL(i), protect->regs[i]);
+		final_cfg = protect->regs[i];
+	}
+
+	for (; i < protect->count; i++) {
+		/* Intentionally skip writing to some registers */
+		if (!protect->regs[i])
+			continue;
+		a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_CP_PROTECT_PIPE(i - 64), protect->regs[i]);
+		a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_CP_PROTECT_PIPE(i - 64), protect->regs[i]);
+		final_cfg = protect->regs[i];
 	}
 
 	/*
-- 
2.56.0

