Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316E2424654
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 13:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292226; cv=none; b=qG26Uab0AOpkJ4Z14qObTmwRTFSDXJHZ7wi7hR+QzkHo9rZnTghvpC22O/5o3jF2KTO3/8mJnAkNM0yC6nTLTgJEfrwrd96oFfty6d7sGVoXEV+GOQmRtiCIbfJ+CwClhlQyqCMKVZtOV8sc07C5cXGASyzmKtcytD4AtzPe1Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292226; c=relaxed/simple;
	bh=33yR49Uwuia0NOFflR+wH/VHfCzWTOQsiA+VkComNMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sJ0YO5/5KV/0cs5Slspc63oWeCzXRK4LcPzB3E8H9zw3+5rWJLUDWJNkEhTSchDZKU8FY/If+Mfb0wOyojKGgdW1ZXq+T/eYWJTqn7736U0W6qgFaBMspMFDiYVLYS1VUxAslw+mUYVE9B5bYtlOx2vQWBVnE0kYtbwUbmWzpeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fvd4TQyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rx0FgV+s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fvd4TQyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rx0FgV+s"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPQX2535590
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 13:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J3ubeOOHnY3
	FSH96zXZQAtmRz0b+NtvvnMh1Zyox5v0=; b=Fvd4TQyIOALjD/cxQI8hsCgbAd0
	n97DE+5MN+e36WfXVL9nnExmFyDuvhW8D7rg6EpbEwUHBHfPX1ZwHLLtn5iv3EYx
	xbsnSDaLGGUR5W0EV9C8DRb7ZN5mTW5i3fnC6NtYMudmJ2WyHqY60/zqql3muKDj
	K3NU5Kt9n7h2wTb5Pe2UHtus1zkhXQwJv0wzarQzsNe536BZ+GhzFlJh72FjNI8F
	0A/Hq8wSZn4133IIsRG8QAkcNFGVhTnchTCXPcOfsUjUTd8EFPw1rcvQExtVwtQR
	7lPjEGlo55aTGGyCr6/2ueSAMXCkfRPxl5V6U6OFYBJXBrpnydkJmPJz1Ug==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0bnsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 13:10:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ccb687f82eso19765805ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 06:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791292217; x=1791897017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3ubeOOHnY3FSH96zXZQAtmRz0b+NtvvnMh1Zyox5v0=;
        b=Rx0FgV+sdgIozn5QvHUguDX34s1uOdTRba8dk7+A44GWSwgeZlFbBMDrxW171GWA94
         3vQHHVBP4QpYjeu+BpTnzFqqbgI9WYPJFO1hgbK06PwZEygCY140JjGAPCYvMUZUV3Dv
         cKddL0xp1+ZQINXiF99gqrV2OAMiFbnxW9Y5O17tjbWCq3iK0Ucc0J087oitjH6jvO2c
         UixTqxMzoqp6wFsPN9crdn/cMn+e/WUuBuDTfITki3Gj+xvAHMaZILvC8ZyCFJxqWbF/
         /Rq5cx0DdSiyA+JuSC/614pm8fiok+cBdsOnK/Q06AbMHEvkKq3k3ppeFxCmAUlDdKUO
         5OQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791292217; x=1791897017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3ubeOOHnY3FSH96zXZQAtmRz0b+NtvvnMh1Zyox5v0=;
        b=kbbXjkuHWeaQL908nQoUKzrn8y6TkAJVnXzfAyvb1fnuQbKDBFdG4AQvt5mZlmnX8B
         6fvlJHQOWYF0JcPugczhMURZIRYKsIGt10nHLaKqZCRwtLbRv8cCEC6y3aUiZQo1xv01
         rlFdTR14A28olVyD6QiZV336dgMheMhRB5Udee4WnuhP6xzNThKIE2G97cQFVPs5MaPW
         W5b+Gp1IjGTL1E91dYbUWPPbdIwegZvjWVt7JtKlpa2VzSuMXfwXrvkKBzttQ2yhvmaW
         kSn4ipXtKb79hj91d7iq9QC66IUPLA0BW0gJG//R7riXroevxS0/dJ13jGyGiYuB5y3/
         WRhw==
X-Gm-Message-State: AFuF++k/W8LqZXcBYiDBb3qVm/h2SwKR7NKbOxB7oU5EfumIQQ7FLJyg
	wtrDMmaUaB0oalf9LBWetOWYHX/JBv4jhbPAdlWg5PrfxfpaFVPpdPkPUDMqaJYwsTM3Ab/37OA
	8ci90qMu37Ozg4526yQtRK7af+Pp/2XOHMaL83uf0QJtEqQSjBRRs5mblvuKnzIodJtlK
X-Gm-Gg: AYBFou00sfUPMRfHjnUxuu/ovoMMHeA/l3pe4Pb51vk5kqiK5Dpvy5Uym5U6wuFX8yW
	UW6xwn+pHMsnnfvTT5R7aB27znaaJeQJ3EeX24oVMVVHNM0QHOhMiHeU2ujmAJaTjHYtAabm+lz
	2SFmF0j4tf/lBp8agkGSKPx7IMdw1t4NRe8duMAlNVMe10Xe+HPYV4LdaIAB+DToT240ScU1bFd
	/ZMwrFjkpJBL7C9+M68eFc0hVgQ7/j28xdL8fPpVUvWGjdyeerAGd8pH4dAoHufSBL4UE/W6u09
	K/skN0jKZpyYv/kNKvbO7Jyxeks8ItqqVpLdHKVM2CZDzOmqO8jdx13JGmljelHcsVLQOzD9V+B
	4hEPUQ27j2z3lpJ96kyRPwsI0oAVS6gXB2KlX3pu8i0hsiQ==
X-Received: by 2002:a17:903:17cb:b0:2df:5836:d1d0 with SMTP id d9443c01a7336-2e5dcda09dbmr11500975ad.30.1791292217390;
        Tue, 06 Oct 2026 06:10:17 -0700 (PDT)
X-Received: by 2002:a17:903:17cb:b0:2df:5836:d1d0 with SMTP id d9443c01a7336-2e5dcda09dbmr11500705ad.30.1791292216891;
        Tue, 06 Oct 2026 06:10:16 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5edee06sm22115255ad.59.2026.10.06.06.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:10:16 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [RFT 5/5] drm/msm: Convert map helper to use dma-address
Date: Tue,  6 Oct 2026 06:09:56 -0700
Message-ID: <20261006131000.81501-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
References: <20261006131000.81501-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfX6h+B3EAoqtfK
 A2ob5BWeqwY1YicklrRAph1JAtUTobdHFRu8dVR1S1MoGXSeLc0BmvypBLM2tAC+4w4aAu6T+0J
 AhnY/qgcXak5RfSGn+oKZwhM2gRRNfWYduj9LOPNCqttxRjUUjc97Glqnr3FT2VESWKNLVakWer
 /8gi3VyaIYyjwu6jCcaoDTAuEyIBnq8rRYKVRRvfAgD7sbqZ80RT2nL6Vl9O1LKxxIa0nfh+EoT
 hnfMzBlxB8ghSu6gyuUasi7Jnm/hqRn1Sajz4bT8iIAtgGqnXCbwq9oFgKZSaIzB1igZ928U9EP
 tRjvUeSgwZAHeY/oucdpfe7/1PpXDn0jfDqsqMJRrN/G3CXlQPBN/pKV/EFtV3yQpagpucmixc3
 DRSi4b7a8dW3I0vE64CzdCY93p9gWlBFuBEw+HaIUjrqR6KvR1Om97aYzHwOmMYCko5fMidtszn
 FQQmvPk3OkM2WMXmOEw==
X-Proofpoint-GUID: jPtQcHN_BcphbTsZOXv8cVdPCt9oBa6j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1MiBTYWx0ZWRfX9KVZmFL0v3p4
 rcLrW+PWOu330Mx9ei8raYLmC8FYt6qFufbcPztmobRXPOB/51QBJIWo44ROgQhfK7SApDBCpvd
 ExXM2DGzrfUGFiGIyLkmVYOkJhbHqCQ=
X-Proofpoint-ORIG-GUID: jPtQcHN_BcphbTsZOXv8cVdPCt9oBa6j
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac4f33a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=B-XXGUA0wr0Z4rGOYBEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060052

Now that we have everything unified in one path, switch over to using
dma addresses for setting up the mapping.  This avoids issues with
CONFIG_DMABUF_DEBUG stripping the pages from the sgt.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 50038d00c3a8..27a74514e942 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -148,9 +148,9 @@ __do_map(unsigned long pgsize_bitmap, u64 iova, struct sg_table *sgt, size_t off
 	u64 addr = iova;
 	unsigned int i;
 
-	for_each_sgtable_sg (sgt, sg, i) {
-		size_t size = sg->length;
-		phys_addr_t phys = sg_phys(sg);
+	for_each_sgtable_dma_sg (sgt, sg, i) {
+		size_t size = sg_dma_len(sg);
+		phys_addr_t phys = sg_dma_address(sg);
 
 		if (!len)
 			break;
-- 
2.55.0

