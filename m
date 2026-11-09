Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234126;
	b=mlIpDPON7/X5hoAVYsFLVxaISHRWxsPiGc/FeO98HG/MyLJHVuOCBEPv5fKbuC0O+wJe
	 VRcREG1GHDPyeYbbmBjCcvmkrndm0DrdywYKqEpLggOataMR2D4ehuAXykMseP1VgSlWH
	 2iDtp9JVvu8wHfV2RkpKuQMh5KhzNGJYivI1LGb626Cjaet0wV6LDTaeeUzhOGC11XqrN
	 J4mVs6IA9bP/YdrzsVtcNF2d9y2ydYm23nA8zZi7kDobMx3DBjqBazg8tTOJTDsQJeaff
	 p+3T8cbH7+j/YcBktDMDIH8FN+wrbJiPGEsW0PkkogNyugdEHPeH45wQt8be1PvIanA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
	b=VFwSkmSJbly1aDUwalGspe/IGkCtVFHRn5AREJqmPUkxQXXtBp+OoIY/nQiGFbgX3New
	 NzFg7wh68nahjGRi8fKOpeVQRYSCL1eoWGdaTUoBJiXqa9KvbpWyR+h7XdwDwp6LQSfpJ
	 nRj9zax/aVeNBoHUlUXrqECHlixFF//RwkAok6xq1NtxStEH/txP9hoyZraFvM0vByPC+
	 85hoEljTPUsJYwzDo4jl0oOSva3AHHDAlivNvjNt+Bl5+SMxskidSDjmtUd4ldyOthWR/
	 aL9ZRErEKou8fJsHVs1Gp2M4ufdU5RPgBcXPvgtSatIoRcTE2/6enXouvTqP9PQSNHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oqN/YOYs";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jzqINdgm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FB7606EEA9
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2FB7606EEA9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oqN/YOYs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jzqINdgm
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFLXS3588649
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MLNc8w9O9Js
	SERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=; b=oqN/YOYsINLFFogdzhegMUXq6ZE
	inCPTkSWDc4mUKH7WcBXVeyHLUoxu+3UV1WV1YP1ncUMU2rXxjIyAAd0Q0O/TVVJ
	qp4lRnk9UXjHFsn6HhAcQ2v+Y5nOwiyvAMLue6TUjIQFd15/h+rGmZKgc6al6WPk
	lraD99FMRe6mavi/Qgx2idCYdY/X1WKvmcnOZuFFYMt1hBGNLWSMAlGLsbcuRwep
	0aV/VsHoLHrVS/7R6utrbsPoIkkk/5S6JvgcHsAmU4Yr60hFyQt8p0A+7tQ008DC
	AMxoLXUjWrNiE169E0tj4/vv+YirzVijIUAzF1Ko84CDNN515Gn/4v8M41g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj8jdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:22:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8dd9b9743so11191905ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234124; x=1794838924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
        b=jzqINdgmKD2+jv1ux+0+KCW9i8nvBaQZ7rd4WAkfSVUVuilEcWjxKGkrChxtASus0w
         xpWpXDrOGvecq/C2ehtNCdMsCp/Cnen7Lev3zcqnjzC0brbmRuznFH0HOcrYhRpywYQr
         93rmPSp0IjSE90HQHylH/OKbc+a0Jk4hWTnEJqFa011LjM9ztiBMVejOViOriN9mEj8Y
         bnNTCRljXmAWY36hjUIhATWhpf4Z5F6IaKOB/AMEoDV+fpk8VEHwhjzBuuyBg95re+pk
         srjRjL++WiPwDqphAsXR8ibf9dz0ylzyzMOHOzj+r+wKq8mr9lxYve3jfoLJeZhWdfyQ
         hjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234124; x=1794838924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLNc8w9O9JsSERbr2PEflvjzCsnmV1ZHSOeh3cczHFE=;
        b=MUgJqpLjtK8AhuLmXoyJLQ4CuupNkO22oXtQEp9e6iwHdeZQACMhnNvWtVLW3Ijxtl
         BQKp8mHc6lpVSZiF2nS+2RY6mGlwBcB4e1PiV8pg3EDaCQEbkrEWKUjuqoPRWwZlmHG6
         riaV4GA6h3CZVHB3GjtD1MsflnrFMJlRNbgsZtIr6XeEvcaYEfZa6wQ2rt6D5tvMM7Zo
         sGarAXc7aY/YOHakA4BCbpd3ZeUjUiyhERTHfyWaFdmhwZcURyFNVH25dQP8EFbZJ2fH
         IGlQyv+aX/vywakpuUJ7IKZLOPZes/tBWVQDsw9L4wKV5EmoT9u4ryP375uwiCkFRaSf
         /Lhg==
X-Gm-Message-State: APuU4Z8GCaI40gS50EcGJjcVHXcZ35mou6QR4AEBlbZh/KxhzvGG85Nc
	Wd+ZkxmR5DDDrxcpyZ1w37WGgZcK2WxbRMX6xnDrh3qcpNXIMyE0PHf8qS8fLSyehfIBvNO9532
	JoRvm7J+n+XMWItFeV37WQS/xCsQRBmegTKZS6JRCSHtYI0yOM36m+dzBUcsXJIF/Xg+b
X-Gm-Gg: AYBFou1BgXat/S4M2/1PrymUp5nKAt9fBIJLAJ0Us5NElSNAn3DsX78I5SVwPzBf7wk
	RqPfrUV9vpkzsIyfh4vvljCZq34z/hSL71fthWwIKzR2NOn6XXG3BItfbYcK8rcM4e9HKi0R4vZ
	wCFbaQoPOYpclD80Hykt0v0S4rCnvIN3Zi1u5WJZevUXbuoCfviSUDXAdR+s+Z/MlGLX+KhMbFQ
	AriOkrs+lqc/NW0oEp65vSoIMFjmh0eLDZ8zlKULOsiH6B0hBztHrbkY08d1MSkCpmgop02iNk4
	0rpPTvFqdhi1WNbiGt4J7breSJaw4gaUF0PSAVguEIZMEuDFgSQFHIIHK97KwmZoITyir3++b8J
	VO06UBvMaCGKckx81fnA8IisRZ5a9cajupTQkNFsGNwp8eFJfVHTakaHaDQp8ydvuTRrKz75vSR
	eDirxP4c3i8sSwS+bRMWz722VRBhtdLuy6SnqVI/xlKaYtrH55ZxvCmZB2KPuDaw==
X-Received: by 2002:a17:902:cecd:b0:2ed:118e:7fa3 with SMTP id d9443c01a7336-2ed83ff0b55mr47297575ad.39.1794234124253;
        Mon, 09 Nov 2026 06:22:04 -0800 (PST)
X-Received: by 2002:a17:902:cecd:b0:2ed:118e:7fa3 with SMTP id d9443c01a7336-2ed83ff0b55mr47297225ad.39.1794234123803;
        Mon, 09 Nov 2026 06:22:03 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81728a9dsm12045375ad.60.2026.11.09.06.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:22:03 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 15/15] drm/msm/adreno: Remove temporary __maybe_unused
Date: Mon,  9 Nov 2026 06:20:01 -0800
Message-ID: <20261109142111.256630-16-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: DAUc4BSFHChF8bF-jbuTJovF3aIi7Zdk
X-Proofpoint-ORIG-GUID: DAUc4BSFHChF8bF-jbuTJovF3aIi7Zdk
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1d70c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfXzoYIC6h/pyVK
 r4BwxVG6YQLMO314hTFX0bhPpo2wLOwZUwyZUV/prNjzNhNHYrmIIEv8bWh+wUfMZK5yrLKN2Y/
 HDpTFluG2HY48DlmPTHMuGu6LZ3GHJk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX/jkcFzt9y3rn
 ufNQ7Ilnec0Ed0dxZN6wmLWoKc7IzaRVRl0X8NkE4lB9XGvzfFYI+HPHRinUpWppd4uf8FAxvND
 Ltjd3/6C4vla7n6MAvf3Y3C7oRA6FtC8cFy8R3amTbMgrfsXSShw9tjdmk/fhJSgfKLzEyBTw9W
 8fVNMsa4nWPaJTT1Sb5U++ucBjbHsUDXzjjvKnC36soOcRYbxPWnDPAXd9sBYzAEKC1kwhhF5/Y
 aoyG+s2paJeMrw/mx/XWAKcTk/VQtxiawR97aezteXEKuBXygdOWzWLNGx4eRPubxoQQ5q3FIGN
 ijFVaGaR9TfRydsfLExhUhyEkQ35EdOmC+7okYBmbPW7XiMzgxnCQKKCP6SIImzxrXEfX7+BMTl
 a0PNLElFXIX3l3IzSv/QawP6BSRb+kvEAWx6bpkYxQQucaIWdmKN1Knz+/ZXJfxI72inI6whJPT
 /fPeqNv7PRE9p5Q6hYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090057

Now that is unneeded.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 4c4b904a8657..c5c928c1b084 100644
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

