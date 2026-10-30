Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395189;
	b=tAbOH9hue/8CpAmmh85SPbO+69Lgfm2WsU6djR5X05FLsOkKJQP7Yc8/U5u2kUFOoH0D
	 cG6sUMhjDxXQynOGXZiCJrJdZxbxXmub57HZ5TbvjTHLANmYfgufHhjdm7Uzqabxdygke
	 vC2+vBEWY9qJ0pHcHMDIwamNfldM7Bc4JjEBbE4Yg17fVLDUYF2E72W2CnVcrJM7IZE/u
	 EkaeCw8x6PNhxcqJ22AcBNka1RbY+/cOLlyEWODWmetv/JC9qDNlJ4XqfIAV1aX52+PSl
	 WGpWJ4akTX8bD1PS3t+WrCSfMJeWUJOB3RC92rKo9dMhT819DyGNRpJAPrgW62roIkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395189;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T3VgMTtOjkM73iOjArFeZhJcd5+PBE/FggkGOhnzBl4=;
	b=SYwSDDR8PYp1hCx/YgbtEkZzqimjSKe9Q+60AABtg/uHD1RO2e0OrNhUVfCBkHPNnmYT
	 Z27pjfH2NNnMdWZAHhtrBUN55f2a7jNoyFRiAjd7MVWHlOTvT/XBxyaoxdPUUWUIGC9I3
	 sSoTBq5R1eORhwgUKusq5ZtXWPxhY1e4iEZf35Yr43qQmfNTgATN+IcJIrGfC/jLgKhDo
	 zlBtpKGm+hLZ8a0O6z0yJBmdN1UScOm53dkck1Fy5rigcTm8kKs2YmeNHLsQPlLli/GxV
	 i/cXP5dZsfwqlcqS9UwwMCnkRGWOtUXhz/AdiOCPyncf/iUEg1/XOV+DF2L+qLWW7yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjncsJ39;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gC6/RTsa";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE6860A260B
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FE6860A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OjncsJ39;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gC6/RTsa
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULH82S215692
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T3VgMTtOjkM
	73iOjArFeZhJcd5+PBE/FggkGOhnzBl4=; b=OjncsJ39PtpcGTzi1O2wN2U+Wzf
	VwK4gPih/EqDr9in+01uB30PWfLaD6lYn34cw6li+/D5K0bz1jkhr+uNC4z7PykO
	h/0ZZ6pEQ/q0T1GvtSTopdF/3ZuxdEiit4r+rvfroR/K/TK46ylfDb+QwjkoMELj
	4rx3XQx30Olyzml3DWdAcfhEMwIe4hGns+zSfbd0olaB7rFuWC3QwUYnceur3AkO
	yzadQ3JJNTCTy5XtB79FEVG9bT6Rd1JtNAcZdRyEuNF3uznSX3tjnegSjjNpQsgi
	mAWiE7VYTUyIHb0v33rxoual1eKL+1ZlgENChNsiSc20Z8Gc9QYTZUPGk5g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0g1bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 21:19:48 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a5971cf7ceso1445153b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 14:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395188; x=1793999988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T3VgMTtOjkM73iOjArFeZhJcd5+PBE/FggkGOhnzBl4=;
        b=gC6/RTsaD0zb1OdimuHVv8K+zzYxb3rqWzkV+VPhXHL+rGvQTpvGHu57TPVGH7W8Az
         cau83w8+y89tf/h30EdT8e1j0iRhyLt+qiIsva47w34C73jmqeLXgy+P0DB8FFQDz9Ks
         xa7xW6+xJMui1YPluBTvTGhjA7m8f/1y0GEJOug0bT/9zapHchyyz8GK+5gmfMsr+Tgy
         j4uKGhfnpnm3gClts/E8QPS9FlskgCozlmBJFgeKzgLPU7aXN+ISDCfOM1nyxBHfDIRC
         29mJvfDQZVcyjkAAuKkqMM0NjTSfIwkj7lbywUmyMuYvMlkwwuJ2H0ARJLhkMzO3dVvs
         zk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395188; x=1793999988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T3VgMTtOjkM73iOjArFeZhJcd5+PBE/FggkGOhnzBl4=;
        b=U350WZZaIiQIf7BB3bR7cCM4XOCGex7FC88bZ1Eu5tGpMY0sFN+vGhwiJYu9t72TH0
         gp/xFYvklvOQuNVDgmyvzxCkf9KzD3nt7nZesZ2iiphIf9qxuqbcPi1DKnzMOj2+Rzfu
         4UZWY1HyorFEup308Y8raGk2tBjrG/kiyZ9gTE/+hcYuNcE3bqTju0Z+VTVSH3foh5ZX
         7LdPPhe4eKovaIP7dl/muCEAwYV5nThq9ZjiQ/sElLtDvrIZ2r7PEKt56Bg6kEld4PC+
         hFe5Y644Dqo5G0j3IUqYG6/i0Eey5YLELlhD/S0NzmDJN9sROfqG4Iwgx/FCxzeDZkd6
         DBaQ==
X-Gm-Message-State: AFq9FYI5fANkJYsS2mwe1HoQOFb1ZtddboYjY3Mlu8kc5H+qLWq9duIz
	3y3GXYjuA3K/geqrsdwAYcgRcx1wEwfCuc3j663yCHLcfYySsefP61GUzxLwX/KDEjkAoDnpaxV
	ZlQqWd61ferIXqNTPh0h7ca0oadV57dfRV5Z7O4HJqv0geejk8ROCb2PHOAmAmXLiEo3E
X-Gm-Gg: AYBFou37HjLm/XAI7JiK9Ap0j6ibUtAY3QkMLWpltPR60+lPKej9Z+nL/Ahe25/DY3Q
	hpWpayWyzv4l10Qroea4yHAEkJta68L915cqS1MSb2/UHBoceCJnwsl3bM6qVlzJawch6eorAGv
	bm98gMl0m3wGaxmmBllGgW1LYsbxIl9tBspYwJ885RZCetesXOMdDHxkpkN0GWbo/E7R2U6mAOQ
	Inzn+cXvjXf9bNpMTsCKnVTGBEqUShaO/tUJfeguhXLNKFXKneETkoEEB7LtspfMki3jX7s9T14
	Ca/GiiIM8GOP+GW2hJ45lgqdM15H9JFAXvoW/1sTOSB1LvzBmzLB7lUctSbI30kEq+/OF8l0ZEz
	chIWLF8wwMKdPHdw2A2TG8V2wGwC1T47qD7Z4iCqNLqAAO5JM5Cniz0MP2M0xAfCisj4zuSebV+
	mjqqOgF1g6p75espOvCDBZtA==
X-Received: by 2002:a05:6a00:1f0b:b0:89e:779b:d0f with SMTP id d2e1a72fcca58-8a9beb69d8fmr3153609b3a.37.1793395188134;
        Fri, 30 Oct 2026 14:19:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:1f0b:b0:89e:779b:d0f with SMTP id d2e1a72fcca58-8a9beb69d8fmr3153586b3a.37.1793395187707;
        Fri, 30 Oct 2026 14:19:47 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada2de00dsm395890b3a.35.2026.10.30.14.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:46 -0700 (PDT)
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
Subject: [PATCH v4 07/19] drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
Date: Fri, 30 Oct 2026 14:18:09 -0700
Message-ID: <20261030211928.45761-8-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: RanUNV8VQf0y70vvnFQ9yYGnbaDRttN-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX696/f42CrY0y
 ry8aH5o7cQGNbpx1GXqgeXqJl2i/mc08VG8vFj+k0Zs4cyDBzulN566Ci5igyyOBa8uAv6SstAK
 XPk931uQPG2Bm/eqhwFQcgwyzIiyf+8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX05qlOnxfY6Wk
 wkyVtGCLQzd0rjSZOuPCoJ9MZ9XIQ1NPBtjIJ0laEMUhtFKp7bSRhdB/lzBYsKLPgQWaPyFSpcf
 TE0UIkeiv6vDF5fwDxlh7rTnRLE9oGHycrPLUQP9SSJkZn7fUPxV2RDnYR6sbLfUugwMPl24UGG
 qJ7EzTniMh03cdOKDxaTUsMne9jg1AChuOpNTomaiF1wtbvsbExuhgQLQru2k7eORaWyLyj5fvs
 feJxfHjkj62nAV3k4j+dwNaoqNeEYrTrDUo02EWz+ddBzYMXxkwC7POAo7I8IIVOI7Z5uQ/1Wcv
 rin0JnMUJ6PUmSubn+lGY/vYZxHjNeywDVUZdbVs2nvvGCoJqnzBz9Crmv4pHCxkYn34WFow/6d
 ng1Ysw2AcVyKG2uPLJer1ne7+9JSQw==
X-Authority-Analysis: v=2.4 cv=IpyL47/g c=1 sm=1 tr=0 ts=6ae509f4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QhgCzLM3CkghMFFZ4C8A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: RanUNV8VQf0y70vvnFQ9yYGnbaDRttN-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300085

We can just simplify things and calculate the value, instead of manually
adding it to the nonctx list.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c |  6 ------
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 12 ++++--------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 45cd986ad4b5..8d85f6cad960 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -27,7 +27,6 @@ static const struct adreno_reglist_pipe a830_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x0c000000, BIT(PIPE_BR) },
 	/* Configure number of outstanding transactions to 32 */
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	/* Configure UCHE request time out to 16 cycles for CCU/UCHE arbitration */
@@ -309,7 +308,6 @@ static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
 	{ REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x15000000, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
 	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
@@ -483,7 +481,6 @@ static const struct adreno_reglist_pipe a810_nonctxt_regs[] = {
 	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00100020, BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x00900000, BIT(PIPE_BR) },
 	{ },
 };
 
@@ -793,7 +790,6 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
 	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
@@ -1186,7 +1182,6 @@ static const struct adreno_reglist_pipe a845_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
 	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x0C000000, BIT(PIPE_BR) },
 	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
@@ -1245,7 +1240,6 @@ static const struct adreno_reglist_pipe a850_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
 	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
 	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 795c16d88f45..a6146372cf7e 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -367,7 +367,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 		  hbb_lo << 1 | ubwc_mode);
 }
 
-static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
+static void a8xx_nonctxt_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
@@ -387,9 +387,6 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (!(BIT(pipe_id) & regs[i].pipe))
 				continue;
 
-			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
-				*gmem_protect = regs[i].value;
-
 			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
 				gmu_write(gmu, regs[i].offset, regs[i].value);
 			} else {
@@ -635,7 +632,6 @@ static int hw_init(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	unsigned int pipe_id, i;
-	u32 gmem_protect = 0;
 	u64 gmem_range_min;
 	int ret;
 
@@ -716,7 +712,7 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A8XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
 
-	a8xx_nonctxt_config(gpu, &gmem_protect);
+	a8xx_nonctxt_config(gpu);
 
 	/* Enable fault detection */
 	gpu_write(gpu, REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, BIT(30) | 0xcfffff);
@@ -835,8 +831,8 @@ static int hw_init(struct msm_gpu *gpu)
 	 * GMEM_PROTECT register should be programmed after GPU is transitioned to
 	 * non-secure mode
 	 */
-	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_GC_GMEM_PROTECT, gmem_protect);
-	WARN_ON(!gmem_protect);
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_GC_GMEM_PROTECT,
+		        (adreno_gpu->info->gmem / SZ_4K) << 16);
 	a8xx_aperture_clear(gpu);
 
 	if (!a6xx_gpu->pwrup_reglist_emitted) {
-- 
2.56.0

