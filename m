Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114914;
	b=iuTyKmHkt/kwbGs6rsXfCtjZtXkwxt1XWSQsKYyWrfAfdHToVStz/27mFKeOzwY12Biz
	 q+msDCcAnXoiivZw9BHXpysPiLzh9XypSbQvXwn/oq2k29aTrHsUjpMNE8BVWfArqfeiW
	 FIG3+mu5BpTu0OuIqgWhnUXpN4cd4b0JgAyjJl2J69HNuwcF5Rz/qjNRtI2t5DDexIkNW
	 Fe6SdLGxiJm8CNQzeI7TQ+QmDZEikv6TNxjOsQGnpKlrUw+bcReyP8N18jybyoAnSMxzc
	 IlKxuZElLYSzt2ST8GzkMdoS1hiNcdo2LqjOIdTlVCklNvMMELnDe3rBc69j8k+iFbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114914;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=F8E1dlDc2+yoHmfS+23ajE4p5M5n5nd5e4IqvEnIe4M=;
	b=reEAvjuCHuMufJ2WrOKgqHirj9xJrKRtBuesgbs6YcF/kg1SegG9o9kMhaiyHFidpio5
	 MD7NUXZMWlJEZ5Ph/+xHhXZq7btrosPNHjcg1KAWFuOAB65RNAJiMcxPpOsWoIHTD5Oca
	 B2beUyh9anjYKwN+9Ban3cN+aEBYZ8nW+s/DTA8X3PwcAQFTzF3rV1VM7YSnRW2GZOyEi
	 QxXwWlDhp13xWhey5MfP6QFZhxn6I+PtIARNArqAxIE2qPStECu/u0KIu6bnM5gnmj1wT
	 AlsUe5PGXREoAy9FVMmLtbUBuAZ9LCnFwaSI5QJMlmQ4/FB/vLdNvWKjTxmIq5k+R2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HK5iSCnj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MK+Zx/5X";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A5F60A262E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A5F60A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HK5iSCnj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MK+Zx/5X
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL1x33085843
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F8E1dlDc2+y
	oHmfS+23ajE4p5M5n5nd5e4IqvEnIe4M=; b=HK5iSCnjYs/osJBiit3eLBgQGCb
	bSYgEbMdb1ZcDoT7bMe3liYkksC/4MHRM9vuu0I4GizBulrQP1mb+MZeDz41AUPp
	1K2czSIHmcMf1slA5EHwZoywDBZI0QorMWH+QRy9/JIUrKXYvPyxSSlCuG4C+/s7
	l9YJ2Qx0AO0c4B1bKWdkbnozBofe6SNH1QdkCMscyUDumv8oRxQsH4V8zKzeNDxQ
	k9vF6cYeAb22u/KIOUhRTSE6K+d04qeO34OuR/C8Ot41acwEuzXyY4iPqlgIJDpw
	9UNsHsmlOCOe7YfzGoolIE8wwWqb8VKlaVbkoMx0WRsNn0nD+la2VRrrtbg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtb184-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 15:28:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e818ca61bfso44648065ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793114912; x=1793719712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F8E1dlDc2+yoHmfS+23ajE4p5M5n5nd5e4IqvEnIe4M=;
        b=MK+Zx/5XKjFZGp9O3PhYXhg9pjHDxO7N/wSAZ4QzOZSTptfr8NiUXMDNqLgDsqPWhj
         87aHvCGQ1qrG7x7cs1CX3u6DXF3GCCNtvdun3cpCvdWB4J/10n6CNPNRA9avKGVFy6mQ
         UBC0f2KaH3vOzI1lXOwNbcoec3J+5dAosTMxJPO+pXKyXG049grEm9Xb/Tep06C3DMIQ
         gYmfmJ5rD82ZOqeiFzNoRLnOBhpRXHW3Zwp8HikZxDHlH1ngKBxWC6rXi6TV2A5dx4/K
         jkID1Hm1BzfNHrGET8YRrLyuUCSSI0Qg6OYhQNR21pLLVlm59QoyZJ7OvBlScYbOl3Qz
         /hfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114912; x=1793719712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F8E1dlDc2+yoHmfS+23ajE4p5M5n5nd5e4IqvEnIe4M=;
        b=DidjEny4FipNRyj7z41X56HqX4XUlVee4Nv6f60y1mfWfv48IICuhLM3CsCTqxv7kf
         ySxHIZ8C5XDwN8sJcaEhLy8MqRu43/dwoSwGg4K7pAv+wwjlHvZX2B/jCTkrZMY4qq8f
         y+T1F4Z+DtkymuXVe67gA4sBVC3gqh9KxQn7Iqm5h+M9npriR0mNjfGvw4dFxmZzK1sZ
         wmW1zgva5t/PIhbP1ENOqekFDOFVAm+lcFmn8B701X3RhHs0GNNcIadpu5Uoc5RJyCiV
         D0MPwKOIbT62rlgdLEGAxPKeVj+EB40In0XuPm9evSjxPZB0VYkaY9JBLLsa5htscxxY
         X3Fg==
X-Gm-Message-State: AFq9FYKuCphQnHtuZPFUQtrOrZ/kKSFHL6iSKbRfsWF3WrQ8pkQwLJS4
	PyaeEqUCPOjYxeIAvR38rlqSKOXJIYWvT2pJBEai/IkEljJH0/bXHt8Xu91i0FmFxcGFLpcozPu
	tj5oV6KejGqIgxvh8kEXZjLf/iczgPBftGdj+hQ6ho5Fn4ddtAhU673DvrBBuyhat3mWK
X-Gm-Gg: AYBFou1sVWptsjUGu8+2865kgVQYODSznNjVwn1F8OA4xYQ0pQnKLPVAR16U4Yk7ym2
	0/vrHmpENy70eRkTe0EjRVVVWCZX5C/niMwE5sHkDlExwsucSpn1pJ47DlUqTfFmXTCcgocrqXy
	iIHGEi1dBKiXKx0/LL+qgN3Nb7Gd7wRxns8sOMj1JrfbmKZ2WE6l4/7Xp3f5XW6YH7AVXSLKhH2
	ANnfHz8wB6TK71FIWxQYP/6FY5Nzc6a23buf0Ob2miUK7vMBipVkEGbpSbZ8Y2NqHOnNa83OLOg
	PjQOYuKn/BwvSRKsexC1d5PGf4tM9PQpXh0EQZ42OpxL1V8sQHo0r3Ukk8YpYZHMswM40xUm22R
	MSFr0/y3HzQ9H3NEMTc6aPxntEn2yAz1CEEn4TK6GaFny9A/QtUk8LMLkGLy8xy579eyHxfpDW1
	VY5qSt6lpEqd4kz8r0xqeQ5s0=
X-Received: by 2002:a17:90b:58ef:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3adeafcf07dmr9059555a91.65.1793114911963;
        Tue, 27 Oct 2026 08:28:31 -0700 (PDT)
X-Received: by 2002:a17:90b:58ef:b0:3ad:93b4:718f with SMTP id 98e67ed59e1d1-3adeafcf07dmr9059526a91.65.1793114911429;
        Tue, 27 Oct 2026 08:28:31 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae4061578fsm4263987a91.6.2026.10.27.08.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:28:30 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 4/5] drm/msm: Convert iommu map/unmap to helpers
Date: Tue, 27 Oct 2026 08:28:18 -0700
Message-ID: <20261027152821.51144-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027152821.51144-1-robin.clark@oss.qualcomm.com>
References: <20261027152821.51144-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfXyNn6MhUV4Tt6
 3JXxdFTfyghMh68rT5Z5pawCcOrErZ1uCURRVmcy9MB+S+ylb9GQ8oICh0Di7G2cYWZINWm+uik
 HQDhCI9s5n4eC4fa6xQVlZg9xJEhA60=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MSBTYWx0ZWRfX8+iPzhKiQqt1
 OYNEEp6JguaHXJJ5zgPEYk8TVkgaGMrBkHLn+bhBKZjN0mMttBGn+KGL52/Ta+8H/FkiWBPySLT
 PBGN0/HaaumS7ju8w7Cd87K3l2HxWHpy7N4mXT/tK5TIhHHEcpFOkfD52dYb/PqroS1dEG6Cu97
 HL0fl0FkUW9PA8cMqBBZ8xUbu30BTWrqiXPswZd6Aw+q9dBA9JqOxS/l0yafSDBD4LsqSlui2To
 5tH6h4G0mwvYx4RiUDYJcCQ4zoQmb5zuQYitGK4pMUfmuSdI0/tA74/mYShoDwUhTBTuqPRBb7e
 H09/I60SYmY6KLrjYxFYHj8tizzj1g20FnJtIjrRISFfSmQuSS3FGuDWCAqZAVoWNwoFA+ZrMPP
 V3kfQKVNX4qsF3b0nraQUh5/RbLmGB8Hnd6WG9paYFLNdXxf8Y7gxD3PFSZel1cGVJZ//SKAweq
 2QzgfzvefUFTp7fbbkg==
X-Proofpoint-ORIG-GUID: zb2lEwOAnILvBF2B5x527Kfpo4sKvJuN
X-Proofpoint-GUID: zb2lEwOAnILvBF2B5x527Kfpo4sKvJuN
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0c321 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=3T_YcleVrN8O_gWOTnoA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270061

Re-use the previously introduced map/unmap helpers in the iommu path
(TTBR1 for GPU, ie. kernel managed buffers, and display/etc).

The callbacks work in terms of iommu_domain/ops instead of io_pgtable.
It would be kinda nice to just deal with io_pgtable, but the tlb ops
that arm-smmu uses for it's own io_pgtable require doing runpm, which
we wouldn't otherwise be able to do.

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 35 +++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 78c82f4a01b9..435736c8d715 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -731,12 +731,27 @@ static void msm_iommu_detach(struct msm_mmu *mmu)
 	iommu_detach_device(iommu->domain, mmu->dev);
 }
 
+static size_t
+__unmap_iommu(void *arg, u64 iova, size_t pgsize, size_t pgcount)
+{
+	struct iommu_domain *domain = arg;
+	return domain->ops->unmap_pages(domain, iova, pgsize, pgcount, NULL);
+}
+
+static int
+__map_iommu(void *arg, phys_addr_t paddr, u64 iova, size_t pgsize,
+	    size_t pgcount, int prot, size_t *mapped)
+{
+	struct iommu_domain *domain = arg;
+	return domain->ops->map_pages(domain, iova, paddr, pgsize, pgcount,
+				      prot, GFP_KERNEL, mapped);
+}
+
 static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 			 struct sg_table *sgt, size_t off, size_t len,
 			 int prot)
 {
-	struct msm_iommu *iommu = to_msm_iommu(mmu);
-	ssize_t ret;
+	struct iommu_domain *domain = to_msm_iommu(mmu)->domain;
 
 	WARN_ON(off != 0);
 
@@ -744,23 +759,23 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 	if (iova & BIT_ULL(48))
 		iova |= GENMASK_ULL(63, 49);
 
-	ret = iommu_map_sgtable(iommu->domain, iova, sgt, prot);
-	if (ret < 0)
-		return ret;
-
-	return (ret == len) ? 0 : -EINVAL;
+	return __do_map(domain->pgsize_bitmap, iova, sgt, off, len, prot,
+			domain, __map_iommu, __unmap_iommu);
 }
 
 static int msm_iommu_unmap(struct msm_mmu *mmu, uint64_t iova, size_t len)
 {
-	struct msm_iommu *iommu = to_msm_iommu(mmu);
+	struct iommu_domain *domain = to_msm_iommu(mmu)->domain;
+	int ret;
 
 	if (iova & BIT_ULL(48))
 		iova |= GENMASK_ULL(63, 49);
 
-	iommu_unmap(iommu->domain, iova, len);
+	ret = __do_unmap(domain->pgsize_bitmap, iova, len, domain, __unmap_iommu);
 
-	return 0;
+	iommu_flush_iotlb_all(domain);
+
+	return ret;
 }
 
 static void msm_iommu_destroy(struct msm_mmu *mmu)
-- 
2.56.0

