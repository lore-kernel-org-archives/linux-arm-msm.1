Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616006;
	b=CRa6ZAxPe5zyI3pkbofcX+TM38Pi1W4JiY2zlhrS99Rusp3aNpxqKl178OVsHTadbIvr
	 IUHNT/PUUFWMtRSlcUIy5c70ES+Wdss0cUbD1Vic35Y95E7ZVKhOJzkueIHk5uvwyzBwL
	 O3dd8mocFGvck5DO2BddXLwsyWCbpGgGql9fwCaWRmu79nw0Um0qrjkfoKdDLTrta4Daz
	 awG6L/xggtMxhzRi6b/bXvK/ux1Dof5ZOBuzR53MthlucM1gyiFTacTnN4XvXnviMceRW
	 mNcS+LSXKGu3/iF5geM0OJX7HLS9t+bjYDBHwDpeECGOg0I7d560fxwzpvcgZeVfbWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616006;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
	b=N0pJzCO704l+G78pj9E6ZkOiJ9h12VKsDG+ZbfK/obDdU8EoCl9utsxNulCTF6K0tktv
	 REP/PiSqkoUO9kOD0CXEOojttK1L6gAJ8frdlClYWh6BDeETmlHRnozrJWnDfE1CynASS
	 FRJjLclUkKewRTfmTUbIqVNvPV/sRr6RMFdd7rC2r6yPZTbz6zeSRuqgXkuZtzkEewG9B
	 1nu2lhDyUm6kERh31yH+/joIINNm6kF74IjkFEtdEUpPBhfyhJmvcMb9IZISF5F/P9Xrg
	 hz78ABiLYkWoHLjjM60ynQwF1Ln5Rbh2pXSOnaOUmPdse27VWINncuNosp32xJ8KkMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UvNujxgL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erJI83Kh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A530760A260F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A530760A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UvNujxgL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=erJI83Kh
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKeFqr2160475
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QK2V0ULW7LP
	9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=; b=UvNujxgLvFS7OZHEHS/tp8x8vkl
	UislSsxNnOGPq2zcODAMF7YPKDdeZVMJvA0fXFaRm1ewx4gASulnNLwrS0fdTq+G
	FNsJXsFV6JGiJq0afZJA7QJVjV4/DpMXAPYn4i6PLX50RTHLl/07c/t9JnfsBwE9
	fRNAaJTM9P4msrElJate3F7gIy88xLLiy5v+qmFG6xLmG3U0QOGjUR6kmZbZWaYc
	Y6zgu95lycOK7toV3WzN3XXDyTy0oM4VRfT/ZS71gP+JMFoJs+gPi/XJImT3hLFf
	qgpmeK2QW6DoVdpQmW4vhXo+ppC+PbToaFkPH8QWrSH6ozX0NbIZFeM2tYA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf1u3gps1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:53:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e60770381cso11373505ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792616003; x=1793220803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
        b=erJI83KhGIMMCMAXIfu/boQZSizyJWcLmQ/5r6v0WzCfgE+wTlOIxf8EXsPT/yjSL6
         7YFBk3y+zwC3y/gK386wELpjQbeaNECWJf16BMPUpl2R2+PFWtoSTx38hn1qaX1aOM5m
         r4VJ++K2og4Esb5mh+qF8fkMguEbpX6u+QKRb0SwDgZW1lNCyjN+M46RCcYu8Oxxh/oM
         KVXC/enqtGg66o8t+ZnNZWrxJY2G8rVmtdh4ZmaUQnVjJEPyjs1dr57WBvwY3/Ivhoaq
         YpLOBu4qE+CcqSWHQ/l7M0pJoHmurlBRlGyH1u4Ywc0xA6mOoizB3j/gnmkdYdlBaBtL
         hcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616003; x=1793220803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QK2V0ULW7LP9ugrR40QAJ25MXENJhXs4M1ySCOtIhX0=;
        b=JgT65nF3MqeJDCEw4wNX4r07YL9EngDj6DpW3vE64/AsNSN7s6k8shWGFIy4bbGfMJ
         RfkuL582sS+kpFeBQEp89wUee6mEgq1gv7sNDATii3HtFysZNgAoAjQwBstm53Owfb4L
         +AsU3drGbRZnkkkXNyLhtfyqsVtMybUjl/6KqfEvwKs/HMFSjta2h/KFhBsQTFOJsuOu
         rVw1/yBJ09SBqN9W/c33U/Cli+fVCzhBysP/x4qJZPV6iJeHaRHhwJpKvHDhXIrs6IbP
         RD3NKYffLQleNyRMDXPDK3qVmeiQC8JnWlGNBed3U4wKS4RV53Eik/DrpB427dkJN2DN
         bkyQ==
X-Gm-Message-State: AFq9FYLDeBgex0xhaHrtnDAW2J/kyLiRfOQ8y0wd3LMkjeZSDEzRwW7o
	rhejAn4+5dDTsWoWx6bEG0TMm8fP1a172wdy9ohmhhCgpUYwDtalKb+X93qqX7NnOVJMmAy9/Zx
	W1dZ+fZWJiAJHJnIz0KnHKj/iFaXPNSqct4M1460ZCspapeAoQ1UpLVtwLxOdtRWoAKBN
X-Gm-Gg: AYBFou1mrQ/fldPPywhFfWl5gTNHfYb2NsTpByNgbfa4kTv/0xenyTJ4Ux+Qst+9W9l
	IT5ZWI/vrbQUvrLJdkhnepJWqx4EwWe+TwOD3tQ62HQyseVgYries01DRaDiunqXhmG20fxSm/5
	r1aNE4YVRvWDbMYgSRApbUQgSOR5rGuHErGiNgxHOebK38R9sJAlXPLdsQ3zW1AIzQyVY5fvT1D
	AyhXarz0MKqBvZdW1VnZsXxOVMlxmXbhjPkB+UFMyJH1mrUewgWdzrIcoM+sjxnmWduxIz/wfm3
	EzdZuaQyDnxdK8yeYbQJYnl9aNqdV5m1K0At4Tiuj+ltD/DRcfPJZBmi0AWtTjRalC0yF+1srjU
	kIPImnUFGv7CgGGXM4oTjB4/OEccECCLJ4jcV3CR+Amvw4ciWcg==
X-Received: by 2002:a17:902:c948:b0:2e9:6b5b:3db6 with SMTP id d9443c01a7336-2ea43c0c306mr22232285ad.30.1792616003382;
        Wed, 21 Oct 2026 13:53:23 -0700 (PDT)
X-Received: by 2002:a17:902:c948:b0:2e9:6b5b:3db6 with SMTP id d9443c01a7336-2ea43c0c306mr22232105ad.30.1792616002917;
        Wed, 21 Oct 2026 13:53:22 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b48866bsm15910495ad.65.2026.10.21.13.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:53:21 -0700 (PDT)
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
Subject: [PATCH v2 14/14] drm/msm/adreno: Remove temporary __maybe_unused
Date: Wed, 21 Oct 2026 13:41:39 -0700
Message-ID: <20261021204244.67160-15-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=S8ZMU4sP c=1 sm=1 tr=0 ts=6ad92644 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: VxC88SRsnGhVGjr4x3As_OFdn5CWVMJ8
X-Proofpoint-GUID: VxC88SRsnGhVGjr4x3As_OFdn5CWVMJ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfXwc3ilAHKDRha
 NINjobGpgrvzJMNz4mxCW09lICl7oW5qDhsKFiwTQ/bCJusKIcPy3fY/td46FjRv7UFxfNgtGT4
 HgWcdjCNfnXMuDKR85DuJcFEcp3eyp4EvfDYhVnbYLpazvz7fHcXUPlFY902wljSNulOUIF5KvD
 TutMVGzS8PsH2XprFqDpZELna3jBdOyFdTZoksqX9eV7CvcEWAGb3+Oj8o4IDnm3j6AUjd00Q7t
 WI1R8JkCeBIYIzFJK9MIbdJAksHg/oruCZu1asmObJvCJExZCVmI2yj7DBtC6yX3uxBrU7Akw+H
 WMGKpjeBXfl8rfC17rDdKh00ryYQaN/7T9haeKvFTsaJNLktGOjdVnlgCeUI6V6Nu47s/pChFq3
 cMm+FIxDBN0j9XGB+XIR/7HBUucSy9AUTp2noBgI1rcVqVRdU5GF6gWWvVpVxoM96sTdGMSkPks
 nk9DHP5eD7lVzFUB/Dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX3mm+FEdHbp+r
 eylalKjtvoC+O3hqv93PDNmq9wTcR9ayjrAzIF50ljEakG/ffJqvIJ5AR/DQlgK/k4xNlx4EHaB
 7EN9c+i/FXvMDS/Ww5pwnNxNqMAwSx8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210083

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

