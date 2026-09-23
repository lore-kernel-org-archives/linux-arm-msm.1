Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1014A3D3301
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159204; cv=none; b=ltKAe70PKWrY1YNyIUz5ZCRcVdowmtCOEE4u2KKB1X1OzMLS6AunwuRxXDdbYNk/3NU/4Y4ACPwSb2Z89v+Bl86FdHBs+eqvtQLs/sK/GKeqGSuABG7Qr3fmvL8yHmPcQcfZREKghA4/zvYYe7VTXw7wPO9pIri87TYeldKf7OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159204; c=relaxed/simple;
	bh=enyT8E+9AK26apYvWRrZ3yOlEE4CZOhJwCOlmwsJANs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ugy/3020/fsoN4lZ/ZPxFl7LQ6Nojx6fCDnmsr2LH4ANTPpZ2BIJqQQJqp1la2sFaddE16JS30QftQTTaPtIl9EdSVG94J0hAQRTyviFHBWV27UzRtVp3Su6cX6GsU2JH9jLk8D5hjvONVrxERmOUifwkYwRufXyC5p9P/wGkTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZgtCUu1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3n7ndAP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZgtCUu1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3n7ndAP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA31mo3936262
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wl+seacDctymxAQmXB69/Ucgp0LZ7i+ElrITf9m6VG0=; b=NZgtCUu1PCoyQKbz
	mX3quHrDMUF3vtrKFl6d310tCNd4TZ8o73iFJEjIhySeYNaqNGK8u7mMB0rLBepd
	/1QfPuPCU2uQ8ZLGOoH4QUhQVMESPPlLp3dY3Kl10mZnMzzsR5AX3THQsqq5Ks7w
	107dqrziU6yvERsIP6qT+5C3sFGx7TGFy2/gYyIBBIE25icccrHUMXm68Zqp9Xkw
	OXOSiArSq+zLdo7u6fQoktemYO9gy7LE1qxFYxusk1rwdbBKpZ+979i8Cjffi9N+
	7MoAFP1MxyVLbeQJtVbzaVD8c4K1g93xpWbN3H5umj9e/2DWGyRfcHrs5nginM1U
	oALdyQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428t81g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:26:34 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-144f706e063so543760c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159194; x=1790763994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wl+seacDctymxAQmXB69/Ucgp0LZ7i+ElrITf9m6VG0=;
        b=g3n7ndAPMT0IvkGprCXPdYIZ6C8gF2d5oI7slvFe1YH9TdxQ80HubET7Ev+p+2vD1N
         9ncbgnkPW9ZCDVwuxzFbnJrIsz2XKfYN6Up7+1cVZWKXvGzew+JLwSnspLvrpWBxKuCL
         +OP2+BUgqOyed4Mvdx3pnV1yR6CaqLmMyYr9kV8BBU7kwKX9WvqmxMcJ3dPvuvGIFxyI
         sWKtMAI0fZPGSlRyl0xjjJqF1T9VPSE3ovWMBV6Yqz7G3GQavH/7SgEIKYPG4aDe3dms
         CJ1HQPBzrKzhHcXs9rAF8lBr1+P3oKbvKoswyqfG0R4K8bPnZYVTrEcbtm2uczSRY6Os
         EABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159194; x=1790763994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wl+seacDctymxAQmXB69/Ucgp0LZ7i+ElrITf9m6VG0=;
        b=QEJg9G2xHQVYgn1ANng1K71jl3XOuAmVMESSnLbcAvlxA3vqMwP96k5S5Tci7b8TCZ
         8ytqcU8xl42WfkCTGsTjhg+ISSviS8NZ7J5tCP2JmNRF+k4xP5OmdT+n/Mdi1KgAnUd4
         it8TH6f4cwusqfmRCUVnkuERSvky9/7HqyRRFEmKtT9tkZ1Jya2AfkxY8dokXESNk0Sd
         S1ffWv8KOLHpBMx4oI5jxz0ilQpExahUy1jQnP5DiSFtjumoCdXYrUXRnZtc5GMyvbLR
         gvIftJ8OMDsOH6qfXVw3K/0CCgNJiG6CWjgwxkTozjeKzDMJp+UWhkud/nNAK+oJ/aCe
         7PGw==
X-Forwarded-Encrypted: i=1; AKwUvBzePNBUf2eBFOJgCPc96+47n6MeZhoz5X8p4htRC8rY50ZmGzMSjIl15tyl1huoDN0Ct7vDQajC+UqBhY7b@vger.kernel.org
X-Gm-Message-State: AFuF++ksa1hM4SiVd798HQzTTIU/hdjkXEOYMrzz7i77e52pVK+3Eihi
	XkiT4EbUFmLJ/qZjkEJvKZ8ExF5nmApOApathLsJi34Ozt9zK1l5y8ZT/UVrbpLGxBi3PWmfHn7
	YQaDHlsxh+ULerAu1TXcV8C7MekUIz67tWjPwyU1JAAL7tOOTSiSIRj6fgREGtsdPeODZ
X-Gm-Gg: AYBFou3EOAeQuLqfUrbDpnYP2lzQSQrjdMeiXDenItlFP2/PcjKXYjdTdp97PfWf1QE
	1+NNj2BVoJoOS/Idjw0Jq0sK3ttokv1Zu+krTBni031WLLOaWEIgPEsdeQX6gvMlRgnruJvk/qJ
	CQmZkpi7peuCudser59xsEBxS1AE74ViAN5oHK8ds+Q64fxhVWFNZIPVieof5gJkxb0E3SrBG10
	qro1BBF4E5Fu/OOi/i2gYv+X8ZOLkOFuJ32BcLVJV3way+V+Z/4QmCvUQOEg604YK5pQg+n2gjv
	dUhtuQ1RIMyWlqKx1lrRpuV/IlLSZgmzhyHIxFAUoGns8Nmrf6G3yI/iTFVo7Gy/6AH0tHNtXzc
	dF6hkcc96bo6xHuM/D8gJiu19D+nfVP2QqQ==
X-Received: by 2002:a05:7022:f90b:b0:136:4bbe:9524 with SMTP id a92af1059eb24-144ef0be192mr2107183c88.10.1790159193664;
        Wed, 23 Sep 2026 03:26:33 -0700 (PDT)
X-Received: by 2002:a05:7022:f90b:b0:136:4bbe:9524 with SMTP id a92af1059eb24-144ef0be192mr2107158c88.10.1790159193036;
        Wed, 23 Sep 2026 03:26:33 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:26:32 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:43 +0530
Subject: [PATCH 03/15] drm/msm/a6xx: Fix RPMH dependency votes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-3-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=1636;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=enyT8E+9AK26apYvWRrZ3yOlEE4CZOhJwCOlmwsJANs=;
 b=TM3drMHi0LUTT3rpKITA1yUMYkFSZ9baLFTe9nVutJch5tXY+aeUWa9EiMkQbSti9C6ozXpii
 JgQbn6qY5AcCZp00eIAT5DK8UQqAO2P7qIFPk3aYEhIZ26EavKJmxuP
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab3a95a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=eKBiAfeFZ4O-hnR0X2wA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: G4SArA9vBGZqudU3giSTA3WgLCLKhKes
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfXzAEH+cvr3hzr
 Ptt0oQ4R3wDM3Pj5Q1N3d4ygEl7BUMotGQq1N+Q0Yw6couh8wO0N1ujQFWukSf5so9SYtur7db/
 56VZwJJDaRsVjbQdqWPMv4hQsL4HMZxPKgGKzkxmc8RXcb5Cu3d6Pl4EANVYMdwwpYenCPVs7O8
 ZOCi1uvB1eNIIbwPAv7IASVxcHHU3xM7qUK3ynBjBSVjRLjM0+yzxekzuC5p4ckpyjGkyIcH2BN
 QH2JINKkZRzvczcVRt2ZZUDqV0xgW5ue5BapnxYnGcDZSW/w0n9rtJb2C3MwWCSYqgXKsCsbRc4
 ulaqbFQYjKMCwH2Rw+wx2KnqV8dOI1BclGERiRCUWBspp3gE4sgsHssNwMALfS8eoW8tq1I2Kxq
 6pGDdVTaWQkwJMepb8F7pPdYjl/tOogdbVMUGyCW75gZVfjWxf3KFB58ga0KhDS1BJ/WTdnClfe
 q9IWGI/L/djp6uUiADA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfXwTtBn/6gjl//
 yJp/wpBncmjcgt9qcy/wBy0pJSeKp1UFOhyqSQ2gClm4ll73BW/q09JppTlhyWh60h01bkee6nW
 AHox2vBUUqtwMp2jlOYnzc6zE6CXnCo=
X-Proofpoint-GUID: G4SArA9vBGZqudU3giSTA3WgLCLKhKes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230041

a6xx_gmu_rpmh_dep_votes_init() iterates the GPU frequency list
(gmu->gpu_freqs) but was passed gmu->dev to resolve each frequency to an
arc level. This results in generation of incorrect dependency votes
table. To fix this, pass gpu->pdev->dev, which owns the GPU OPP table.

Also, reorder the dependency vote init to improve clarity.

Fixes: 06cfbca0e1c6 ("drm/msm/a6xx: Share dependency vote table with GMU")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index d072646093a1..161b360bf3eb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1868,13 +1868,13 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	ret = a6xx_gmu_rpmh_arc_votes_init(&gpu->pdev->dev, gmu->gx_arc_votes,
 		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl", sec_id);
 
+	ret |= a6xx_gmu_rpmh_dep_votes_init(&gpu->pdev->dev, gmu->dep_arc_votes,
+		gmu->gpu_freqs, gmu->nr_gpu_freqs);
+
 	/* Build the CX votes */
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
 		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl", "mx.lvl");
 
-	ret |= a6xx_gmu_rpmh_dep_votes_init(gmu->dev, gmu->dep_arc_votes,
-		gmu->gpu_freqs, gmu->nr_gpu_freqs);
-
 	/* Build the interconnect votes */
 	if (info->bcms && gmu->nr_gpu_bws > 1)
 		ret |= a6xx_gmu_rpmh_bw_votes_init(adreno_gpu, info, gmu);

-- 
2.55.0

