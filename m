Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007375;
	b=cP1bynq7N3xARvTTDrr+/d/jLxusENI5R1nUiDBsMmoboLQQNlyhNRR7k+0fW7ZANYb3
	 L/28PQ0/NWCBrX+Mql6nodhNplyFUjlGsnU1vqXDk5PPLYLvcfhjQkCR2Zqb6LMRCbDbK
	 ZtzoZwooRX5srJ6H6ZFKQpVRGazQpHjtf8+JgxEGLacjXq+RBZW9CRgGQ6qrB2efFV1ly
	 KER1i95Jakn57nHIdFC0UgbNZkbS4ayXJnJ0AziHxPb6Vk9voNYyvhBpnxT7cRq5GwKG+
	 YmP+CiUCx3ahVRhH6U7Wk/f+PcAqv/UbItpZz4LidFPcDZ3Ku070933s+1ShrfcnLKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007375;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LDl6oZ2XOhkk26w0HhTOEpg4ruXAQ3r3r2grg6ZkY2A=;
	b=S2awF5vBwK4L/I/hqOZRFjmFNKO/ds10xOjJhcZgH9eqqaQysrreh8XAEvjgMnpFD3+9
	 DzF1sB9Cz0jzxHZMfbcUjh3Qg81RvjiB0s12/s++q4N8LpnkDtDTKl/KJYogX/LvB6NLF
	 ZXvF6qpKCOfqBDk3G4hrscBKZhOSBmeMrOOvzmplXTK+qoksxsI0r82GJr6dAKA+vWty4
	 VWH/jIearowEBcSw2OG3frH5qI3yVe4KquCYDTjdYOOV8X0H/nulegh0NDD80RfNu6E5J
	 QyI0COOm3yrxHroxG53cT49kXmUQcrRXFIbGrVytcUwhwEY+UnC+ULtPkohiJLBBS4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z3E3la66;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fZ90RksP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1305606D817
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 23:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1305606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z3E3la66;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fZ90RksP
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Mo2iK2144225
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 23:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LDl6oZ2XOhk
	k26w0HhTOEpg4ruXAQ3r3r2grg6ZkY2A=; b=Z3E3la661HdidD9ghetX+fiWSkH
	gGcSlKk4CFljmb1HyWcc3Kt7foZFrZh/wSdKxPnmw3WUpku1DV7533nhK3ZQtda3
	hnEZ6d1Js0M42Ij9Y4j5s7rVDXFy5YOMtIbekHQ5ktxYr9sNjq/Q+C3hW16lUmoq
	62/GOxKBbXhwdgyJpxNRIcx7UYz7Z3zgn4o5nNqt+Nm/l9wZxv9W/jcshUyzu8OI
	zZ0hsCCjRfUV6N71g2o9Faw6PCVSNLR2Wokqzy8hq1gBEHEsuPEyNOBBCagyWMts
	9Mai1rkp7pzSvjQtEGPpz37uqGamHaf6rRMJA404dq6s9AF5V+fWBES3iZg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmypgs62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 23:22:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so1577695a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007368; x=1794612168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDl6oZ2XOhkk26w0HhTOEpg4ruXAQ3r3r2grg6ZkY2A=;
        b=fZ90RksPOP+tKlJlR1WdC5VVA6/cF1AwDMjM8DNJFjcIWCO6mTzqNsSfvUY2rrKR8E
         H4CGSpHXyqOqIQGrPHLdYAkvn4MtZPI1zc7Q+oIEIz01c+eUAtc9j58nQBhvAgG5V8ip
         YXrIey1NjmShRjpISc4HvI3jsdLdMgrxSAITEaN5S0CgYjN9HfVSFH2EEJMR4QO4L0rp
         ufmKgSzrqL3LcS4J8XS525qShnHBxVZwgdrDS3XhDzbs27/SvIJSbYX2hRSQex1fFKg2
         b9eM/su1l5Yih2jBN+6jyC6lmKCZf0K9FMXByr+ljyp4vd9HN/C8RvMmZFb/FhKK5gIz
         KOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007368; x=1794612168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDl6oZ2XOhkk26w0HhTOEpg4ruXAQ3r3r2grg6ZkY2A=;
        b=KvcixvfuLhSAqW1OZ3X1mDVW4uG+TQRUWgFRkKe00RhMDQMvK1P/Zn2+L/rSnNWNAs
         lce1jZSuMt46tunbH8vpF6dYx7+Zo7OGpOJ6YiIA2IMvdS0uUwEK05BqmJDUg2VAVN/j
         I8AY3yjNFAwlBgHL53O4iyhLne0VDgrF3eaoQmeAU8s9pV30/FUssgMKgDIuk+hKm2hh
         Lj1JtKouT8AhHnhX7Nmz2d628bTcyRHxrpRjQmjKSwl//WfMFUaHooT4iA2AfcezqAN7
         rNMNnZVy37tZyPbZGpVeAM6i4FHIC8i80vm/s8lPI53bEThsm90PJlJj807fMJ523mlK
         3bEA==
X-Gm-Message-State: APuU4Z+ad7Glr0SZWInsuXLsTmOq/L8OKTaIDxRD0lNCoOycLkKZVX8R
	FCehSQoam3kFwtlHJlGkL8VGQqZGU4JfQ/XwwqLodbyD08aPsaEyB5T0bn4ANIpr56LnBSiXPC4
	b8zX+GsLomhoVVuApXRC70GhLKlDZHZ4cNlz6oIg8UK1OD7gAEm0LU+6FgLBk1DHvPU11
X-Gm-Gg: AYBFou0Vo4boCMzguw/lVT16aApPXe7eDXzQkfTlSLufsMRWCBfdYbsOHNC/7B644Dn
	/R7T6JJftj2SuL++KoxQWf/aoVsOFIWh1s1XJMvuv8u10g+AHtE6RsammSfdkCj5LcWak0UcCap
	9RyGR2O3/UCXx1nt1ueCgIXUQxDk5lWKluV5ptgGcAnWlR0dqJ9L8kkdGAyz84HXlqw/L00q8OD
	2jyvJEJw0NJ0MOu79/+I+QzzIHKhTcPMGR3zL/lJw17ZQN6DTbGrGZiueBSo1/tMRUj7NEcGN2p
	cHTEMruh4At6NJkDkf10X7BptAofsybTy4A0Fz0QoozfcvlG+4KGAig4zQZjboEKCPhZ6rGj//Z
	bbhstgM+vO7YRYVweJR7QzKvA4+/XRxPOWHxcRH5U+TEITGV4+xTU+Mut6XwW+w6QZdt5/Oiswp
	bLldx3JGNgVVzCo0bZpw58kkNPMI89qdm96H9eH+iH24O4zLDDiA4ZyhJsXzxD
X-Received: by 2002:a17:90b:530c:b0:3ac:8ee9:c8ed with SMTP id 98e67ed59e1d1-3b0db6bb8a9mr4151473a91.13.1794007368232;
        Fri, 06 Nov 2026 15:22:48 -0800 (PST)
X-Received: by 2002:a17:90b:530c:b0:3ac:8ee9:c8ed with SMTP id 98e67ed59e1d1-3b0db6bb8a9mr4151446a91.13.1794007367781;
        Fri, 06 Nov 2026 15:22:47 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10585eac3sm659064a91.17.2026.11.06.15.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:46 -0800 (PST)
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
Subject: [PATCH v7 07/15] drm/msm/a8xx: Stop getting GMEM_PROTECT from nonctx list
Date: Fri,  6 Nov 2026 15:20:59 -0800
Message-ID: <20261106232220.47602-8-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX+EwSaWSRKywS
 /qkp7gncATZBZQn9/RGc/5t4qfTkJLHR8AMBmimOCjnb/QHKdiTWBx7ARFyZAWOKnuQy32nM4QF
 vIwRfEO3eT+9jBbWHe6HTepgub/S/RES0HvlTsSlrWEf0imPIFHNbvu5/cLquxOBtFJH+uOSUYC
 4nSgsLA3q2JfVRgwZnBH6iT2W04vZvOvz+VuJJT1TV7QcSnygB65mhWWLw06CjMvt9R8scO8rlB
 rRZsrtYIxmwGLtWAebkvS4JyrEemxL/6eVydOZz4qn6f5naam1Hkqd7Wz05ZVnGbrwFtTmmLIHX
 WqFlJmuX5WACHYBg7YHtwN9LWBEJvqN9iOp4Yy7h8KYXE2lg2duREkhzQztkrEga/xCpDHMz3k6
 ZJ92i9haQEMOHVpiyd+jrc8rvhImBNA44BrvUtn1brf5Uo7aPKX2OSd7X0FBPVUUq3mF7q9bZl1
 rtHuxyzC0k/0fDtzT2Q==
X-Proofpoint-GUID: s1hK4tQETjQuedI-jpNYGgAv9f85KEDr
X-Proofpoint-ORIG-GUID: s1hK4tQETjQuedI-jpNYGgAv9f85KEDr
X-Authority-Analysis: v=2.4 cv=TZ4DJhQh c=1 sm=1 tr=0 ts=6aee6149 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=QhgCzLM3CkghMFFZ4C8A:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX/ziXY7ND9pmz
 kPY9kfSfrN8PLpzjeRevSs1dNCpo8HIJ81mC8Fg4rimuMj5ykmLtMkcvKG86YagVbKoo+quNxvi
 TB7mhEoNZO9rTda9WZUY5+8CdSAHHcM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060093

We can just simplify things and calculate the value, instead of manually
adding it to the nonctx list.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c |  6 ------
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 12 ++++--------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index dd1a5ca91812..6c5ee227243a 100644
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
 
@@ -709,7 +706,6 @@ static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
 	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
@@ -1102,7 +1098,6 @@ static const struct adreno_reglist_pipe a845_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
 	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x0C000000, BIT(PIPE_BR) },
 	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
@@ -1161,7 +1156,6 @@ static const struct adreno_reglist_pipe a850_nonctxt_regs[] = {
 	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
 	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, BIT(10) | BIT(9), BIT(PIPE_BR) },
 	{ REG_A6XX_RB_DBG_ECO_CNTL, BIT(17), BIT(PIPE_BV) | BIT(PIPE_BR) },
-	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
 	{ REG_A6XX_RB_RBP_CNTL, BIT(5) | BIT(6), BIT(PIPE_BV) | BIT(PIPE_BR) },
 	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
 	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 59898b49a201..f65bf82e5c21 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -370,7 +370,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 		  hbb_lo << 1 | ubwc_mode);
 }
 
-static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
+static void a8xx_nonctxt_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
@@ -390,9 +390,6 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (!(BIT(pipe_id) & regs[i].pipe))
 				continue;
 
-			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
-				*gmem_protect = regs[i].value;
-
 			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
 				gmu_write(gmu, regs[i].offset, regs[i].value);
 			} else {
@@ -638,7 +635,6 @@ static int hw_init(struct msm_gpu *gpu)
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	unsigned int pipe_id, i;
-	u32 gmem_protect = 0;
 	u64 gmem_range_min;
 	int ret;
 
@@ -719,7 +715,7 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A8XX_UCHE_CLIENT_PF, BIT(7) | 0x1);
 
-	a8xx_nonctxt_config(gpu, &gmem_protect);
+	a8xx_nonctxt_config(gpu);
 
 	/* Enable fault detection */
 	gpu_write(gpu, REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, BIT(30) | 0xcfffff);
@@ -838,8 +834,8 @@ static int hw_init(struct msm_gpu *gpu)
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

