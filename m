Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911233;
	b=Hab7G26GnlipDbE7++F59EKj/wDtJoWS8RSgEuWMR1TnK6CIpF+MFpwwfR7lFx9P0Cd4
	 WtBk1uphew0Hs7XM8g6KKX/T89IpUAJCW7g2IsvLHXjXZMGDijDfuuA/n/Lj9cZmNsk9P
	 IKyrFk0/aOOeuB9/HMzaYgdMdY+eb7nUhguDRwNsJkbZarIhWqhhcptdafeo3wK4jNASk
	 ptFUZBuCbJTSX6qbUkHN4RXsPEYKv3jgpZysDwTyhScI3DqjpFG/RxZrAwjimqZlFcmud
	 qhIY4oNFq7wRAxccSsRZt6GvYqkGWzEquqKqxVSxZQm2rghyppNl+4RwT71Inag8LuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911233;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/5KWrOEwbVHX8LUqdgrY5bn+suQmLbg/Bjoecm/F41g=;
	b=xTpf8/1g96F4GlTz+3r8GrhE1paoqvbmZf06bwsuLRwUpKIyB54Yf4QQ+YcyfoM+9cog
	 RP4MdL7IAJSSRmBfCVqnjdKfhWLEMRhyqkDgzaiv1aD/3Z+07IF01mbFJsamaxfhYPfVi
	 Mn7dgt9ToP2kLtThWrTPdesCKyM9QGGipa3Y3u5YL85dgiNxz7Id20Gdt2ZY9tYC+2Ng9
	 0SqgcrfoeNJt33H+IkbpCny+xkNieP9Txr/HZigPgRI3o6/qlLiegK0jr17GDkin8GCBc
	 0Bak9Om7ooiV855bhmocR48EuJOx3ipLkO+a8f+LQjViQWVVHpspMsw6jetse9TjNcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Al1zAIWD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="g/BMwuGL";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55907606EE90
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 20:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55907606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Al1zAIWD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g/BMwuGL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5KVCKt1505332
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 20:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/5KWrOEwbVH
	X8LUqdgrY5bn+suQmLbg/Bjoecm/F41g=; b=Al1zAIWD+6wlTpykJoNw8YHTXIO
	yf7ZobYTscQsX/LDSc/+Lzv/zx91o9rCg2sFYHl0BMWAGydpDYcLrEwwnZ7tkEjs
	45PSbo4MXs4wGPXZIDPnEN87QqpxuLYEnBVbcDLWhqvn99vS601wH0rX1kZLPry/
	3vNL2NPAcDNbhUSVe6XCVSMMEVfgdH3ssC40S29Eu/y6/l1uSvDIXCQogjuqO0dg
	+828aoeWyy/vscCTzX8J1iOVkLZ8hAFqk/4zaUkuOcVq0cTGTiZ5h06d5YoZWjsX
	H4H9WbtOrIlKiNnGbbME16cA8l9Kb/z4FK3a4GaXAlvd1/R/DLc7Y/RXHLQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs0wg8158-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 20:40:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so2087554a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 12:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911231; x=1794516031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5KWrOEwbVHX8LUqdgrY5bn+suQmLbg/Bjoecm/F41g=;
        b=g/BMwuGLTD0+9Ay/PdWhcDqwUBoy69TV8DuFqb4n/Y3QXVT8aPRckfMoMmbY+/f0Zq
         19BZv05ubRICSjPtwR8jUxu8weNW0nyKJo6dhydgh3ICyr/+0Px3aWW23cAaPdCR1knd
         wqhZeM7toqjaVDcBQeBFSOu70cBidvYubiGG1r4fgZxvgHMGJVKZUJ3MpaOfyOQ7uDtW
         T9B2Fkh8bzbYbaqibM8wEXPLvgNpabxi0K1fSUrOubUOX/HdtSKErPuo8Z2cda1nIJVv
         QulzITCVvTQs+ba3yvOoUXWvh2yh6IaUvgjKrIhBsYiXICvJliAwcmwCo2F3PYl4BYcq
         zk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911231; x=1794516031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5KWrOEwbVHX8LUqdgrY5bn+suQmLbg/Bjoecm/F41g=;
        b=bWuTcd5Ci7DAwI+eBMXmd/HIKv1k2YGFadQ4aXDhOc/nDmuhZ92HcoZC7JG3F3XlGN
         bwhLPECjOgUeMoYXPKz5X38MolByaabu3a33q72bW9b9KOQk+6AEBCl6mw/fFMyloQB7
         Qv1XvSKjp3mXzWWIb97oPWD3lES3i3Q0DoEaMsXrbOG2VXyY/s0twjzjhVINhWr2t7sy
         YgUb8yfeWhWQ1Ka1dXnddWsscSvPdbHTc64EBjgnDLIUN32AKPHYK5piTWCMRE74TrFi
         7ff5jJhBRPLTHRoaqn7R3vvB2EaZUzvWBvbdEUPr66KhpUffyEYgx2bVgfoCN7UgawBz
         1s2g==
X-Gm-Message-State: APuU4Z+yGX4IQbEyz98AvCDRgpNaNRN/1BpxPI240Bpicdt62BbJ3zKK
	oAiSiT7IbbYWuMWPCLsBGNOApldb8iMOyey0dLpX2/Xy7a8B7Gduy13kwbYq9l4h/Rpi5Ytmk9P
	MceUP01qLNT0huvsdUPU6NFELRsCWaiE5pLUUkQpLMLwKf5jHbDeYHzrhcKq2wYQxtUwq
X-Gm-Gg: AYBFou0j7iSWkiByCsnMzbhXAgm6shDBgaHOy+/7dhUtJE6WNACp/UUVJva+15LZXjL
	cof2y68VVBbN3zAc6F/2gPqSQMMfB2NZ/Zj0YmyqejNtRciDx07B/rTC92kQbzgPIZrHqv0FCV7
	zbQHc49Zwkrn2LgFwHe6Y54kCEo8eRLy036Gj4RLxigmC/9hIfz2bEyPN2u6vdIGwr9BhRaqv0d
	1gLRP36zfizWW7GKIxAdgC1gDxQM4VujRym00snqN9zuVuPO+KL0kC3WRE2itknGX4xqKl7fw3x
	IOwinD6H37k76OS+i8wYxR5Xbd0OiKq6feK3I/0lllDHDWVpB3QkMSgOrzYjj8R+e9PrsNodnmC
	N3KUyi45Jb/OV6a+Zd109dBaqPnLdt9nSqJpWLvdbaPpHXxw3VSFHFWjZMqjMplcLSXBvMEUzka
	KBIg5rC1q9h2lwHwGDnzsizSyFl1Ajn6mh5z7Lj5wJ8j0Y8juts3+fe8fFKdNV2g==
X-Received: by 2002:a17:90b:3143:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b0db70569bmr142749a91.34.1793911231195;
        Thu, 05 Nov 2026 12:40:31 -0800 (PST)
X-Received: by 2002:a17:90b:3143:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b0db70569bmr142726a91.34.1793911230710;
        Thu, 05 Nov 2026 12:40:30 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm4953165a91.4.2026.11.05.12.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:40:29 -0800 (PST)
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
Subject: [PATCH v6 05/15] drm/msm/a8xx: Add missing a850 ifpc reglist entries
Date: Thu,  5 Nov 2026 12:29:31 -0800
Message-ID: <20261105203057.66520-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: MJtBMK80h5W4GyKVKNFRALbI1nBKgqtS
X-Authority-Analysis: v=2.4 cv=Ka9HIgYD c=1 sm=1 tr=0 ts=6aece9c0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=vdKEjRuvQ9rlgTdWijoA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX1Dnel6yJGgUu
 m0OyNp9O9r+3IGiL1H7QuO5ldzF4zYPvxYh70pua01nkMWY6PquvHmKATMGBUOQbW/L5A2jIKu0
 l/ab3DquVdvyezAzkyKQB8FGshxfZDCUUiqDpjPLuhO1w/QN6VW1x8w3DwM8I1a+o9Fe3Ds8aeF
 izAvsufNFm7+VFjGqwZ/xiVb+fINTa+tnxbT2vf2ieBdU4v7am9i3fPca6u3BIwVMF0/FbFggkz
 2+LHFIJr9N9+ftQhG2m9LmDBR2mAW7jQifdry1ukdGkGvIWYhDpl4rldvEXNZ7xWANswAYIIzhT
 2soo3f/nltyXJ15PBAvg50JKEa5qsXBmy+xnKyBsbUpvKygv/aJkSQN1YF59OglUYSCrJjFxiyA
 ytxM+AxnR2httDmZBJNnyXYbfC5lHXsx5xnHIc4xCHBse8TfHVzUDqyNP0BbEbw5TVeal/GV25z
 wMWUFKPzuvidehOCT8w==
X-Proofpoint-GUID: MJtBMK80h5W4GyKVKNFRALbI1nBKgqtS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX1Hx7P2ya/PgP
 zUinYeE5bHcjhVxH61BljeEBIhcfocDcVn0Xq9tBZp5VIvV8j6vyN/lDQaJLibJ9toxghaUpM9G
 mx/weIe6ZbAb+3pdS5FnFTFjwFt4Qzo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050082

We want to save/restore all of the CP_PROTECT regs across IFPC.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

