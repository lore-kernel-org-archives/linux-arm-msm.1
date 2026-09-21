Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9354DA9CA
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 16:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790008597; cv=none; b=jBy8IZ0+Q6Fwpz/0uhz/UoIuDc33LdktVLBK6miLFXDH9ihKuuk79TWalHWaJw6f7G5OUhOHNgYqBs5yR4exfoCGFIGwie3a+56f6xK30674lVd+FxK5NJyVIr/KV0YgpKrDMnJsEQ7ARXLHF/9G0uM/dLjA35XLkGCFUeT1uZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790008597; c=relaxed/simple;
	bh=MmySXDpweXSXT6L0BR75PjecJ7o7GLBlPVL3+j8etyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t1d6lOgWZ7BxL/emFFvxEsuGexDTRjOGCmDz8To4Qw2F8JoFgrJBEsf1hLBSfC5iusFf5e7/5Vhyur4HmwbGAE3a+3jbKxovX9c1Hw1cPEn6I5U+fGq1I9GvYKV1E1SoUyGJ1RO3hkvXGGgNzet9DFJ8d6+4GLoit9qIQIz1W90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IP+YEjC/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKA32lFa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IP+YEjC/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RKA32lFa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFA4SY827676
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 16:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ybtIJanTpNw1TSyZ50jVLHb3tH7p86yITIKdYXAup8=; b=IP+YEjC/UVES9zH6
	UIE7RS+OP0/45KY5Ov2oaQ4kx/dDVs6EJHCp2+u/kndnYodOzQVFJUwK96LBnxpX
	w86ns7rXYb8MfkKbSnc8tQK8DM1cdUIouV3bpsKiRcemmyDtl63f2Jh8LEZRBcW+
	0eUOb4YolJzlEGLVfeI7Nfuh91qS+vDSzabsO9cIJvOAVgDH3HUcPwqjrGgV3Tvp
	jPE/kROjdoRcoREnA7P4bNY/GiodDuyWR8Q2OWR4Dvyz0qJ8tl16fOiy+Xxhyw9X
	VnC/w6lvRWdB0qh+YdR5NJ4qDrOaq8+JFhe8LaoME3sCTcHtqjXNwYFEWEn7lvPY
	/Yr1wQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gsyuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 16:36:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa4e4684bso78644375ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790008589; x=1790613389; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ybtIJanTpNw1TSyZ50jVLHb3tH7p86yITIKdYXAup8=;
        b=RKA32lFaBQ6JqOtgI/8HZRNQMG4IO55ftmQ6y9F78pquB1GFF3hogph2jJzJEOcueG
         AV+vbnQz4xOoaGVrDFoTGriuQUA7iWxH68Qimdh5zhmAyXepb7S5LLwrars26PakgO3y
         zrtmcmX4uqohQlW3LQKhDzSgGoA40e5SPOB29bh6sGO50zoiyIPCRPpA33G4o5vExXuh
         GcWvMHHOx/7mHM0nNgV87t98jyuffcoCB40j99ko6bwo7zYVjSGrXlxJfKqlIqzV3L7I
         nbvnAb0D6xeMODHeaLZCgSKUmUqv2Yh2X1ttSnzoY9oEt+yjT55EEu0cEdUbDa7J2adu
         we9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790008589; x=1790613389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ybtIJanTpNw1TSyZ50jVLHb3tH7p86yITIKdYXAup8=;
        b=eHy/0XaoTnoH+ROlYDTAEfSFRibRhKQfWkxl3qVxPfnze6i+Vw+O68ACoMY8UVPdxi
         KRur8eqMtjrttuvb/dUeYuCy4MM1EY838a/BWPSX+Txi5E/0Nz5ZXv16cOP+LRcLntSu
         vvM/J2SSBThQWQVLLr1xlWXCDmJoGWLWJokVw+uhx7R/LZziW5Xg4UQ9s2cK3cl5EC60
         EUXYq7v+PHHQIC+HtfQ2ZW3y+8YJXR2IwmwVAFxm8szBoB5+o37LRW3z9t3UyYJDoFM0
         rjLtEAJWT2N5ZQQxCwdpc0s+a9Uu9oiI1f0FNyuYe9vYJsShqc/l34wE8Hp3NWuQ1SOW
         jXkQ==
X-Gm-Message-State: AFuF++m3Go1cGMBY1V2KI6RtUJ0IbrUl4U4ZJjNesM8Rwxk8SrlY2evE
	xpbjr5/JJrsf30EmA6pYY/j2RVa8CbWxbrxyN8zKjqyGxEA4wPjuQpLGNeffUniWKkm3sEA8PVn
	USxCBqAir/8oxPkE8OctBM6278zsVkrzT4DfVKqqrNQr9AEWHCw6cUt8pr/GaQoQcgEQKhvEDTq
	TW
X-Gm-Gg: AYBFou1+O5e3Xpwc1HIIpllBpqwU4dVPPVJRwk7765sXpvO7H8GIh2uuiUof1Eyd9J6
	7JE6T0UPgaa49mgNaV8Q1gh4Z+rVVVHCTiaJ572TNfNin1RnE6i9fH9MA5VOq2a04tGE+qIv1gM
	aCY/Uzz6/KRvErHWyqkWibBIE/bRZNdC01WoHLAqDFNtVHua5XCeLir8bkgr2ThhqTvtt+J+KNu
	dEozFFfYTgl18ns6AAr94K66ClVz6Vcjhq7X23zIB8cEvrGzJY/hUEd3KtptLaKAeARtRCPydS0
	HuyjKwZThzQqpgh/TrcEZvTUdl/2gBiXM/lhCgAGRQnspYlQqqMs4aT4bY4HnkPqap/+W9GxLZJ
	k9+GUXKIM7W9OcHOVXUPsysQwlDl6oPsHX4Bo
X-Received: by 2002:a17:902:d584:b0:2df:4827:9695 with SMTP id d9443c01a7336-2df48279700mr45200965ad.46.1790008588613;
        Mon, 21 Sep 2026 09:36:28 -0700 (PDT)
X-Received: by 2002:a17:902:d584:b0:2df:4827:9695 with SMTP id d9443c01a7336-2df48279700mr45200735ad.46.1790008588150;
        Mon, 21 Sep 2026 09:36:28 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba2c5sm37192355ad.49.2026.09.21.09.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:36:27 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 22:06:19 +0530
Subject: [PATCH 2/2] remoteproc: qcom_q6v5_adsp: Fix 64-bit address
 truncation in translation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-2-f19b4b947bba@oss.qualcomm.com>
References: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
In-Reply-To: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790008580; l=1468;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=MmySXDpweXSXT6L0BR75PjecJ7o7GLBlPVL3+j8etyA=;
 b=xv5PUW3JolB673mSXfd87vykzyVX8mVcDJnaz1MZ64L4dvxq8xTFR0TmH1jNigJAataIJjf98
 vrqv7M4USl4BJ6VomOdMdErl6dLx45cktvypnn9jSW4QhHJoZ3Z13bp
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-GUID: xsjH4V82_Uiy8vyf_IiVowf_unBSYGCf
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab15d0d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Eo0ntd768-WPz5Xdes8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDI0MiBTYWx0ZWRfX8txhXdcOQHZQ
 KKEEmjRlrZW9I6ge93q2WpCsbg7T3LJlkVdhj8Dncjc3jEyblyhsqGAPubQf5lDy0iBwmerEfb1
 RqWzgDAhlG9vZZzvPPauCptlnPHtKkhJtj2+KkaGzWm1dy3YosaeGHrwSX9UKxOCE9iPO68aG7c
 +PEmdrdL6O9s1WRYTmUaZeNoTNMwpSirhdopwSs3/NqM9oyhVf9IwPDdkAyUF0kR2nXysyyiJGC
 rT/rSslOsV3ZLu6SRtIWmxGH+VpWPu/3/KA3I0il9qFmHmMyYZq6i6hsfKxIV1hnOiGBYJtN0ux
 lOm9pDjqQjUnhj51VGBvidiyeg7GGWxgimKBiuRiPgE6Ci6auZFVZEC6sRHVkzEvXijI3XwwBPm
 2y5DlCyCzbRRHCZIyUdIKVPLIK6tHtWSpMW2mHBZhEtvbkYwrCqIakCUdJIKwIvxInawlz0tcCK
 3pLMm2HKLl/ZGQq6agw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDI0MiBTYWx0ZWRfX9PGDkFRO0O7i
 GJkLt6q16Da3GjEAqXbffzlam9g0ScOSxM6BNvl9wVzSTOJEg8z0cbsJqr2ixeoE/GZu2qO2Usi
 qNruaH+GvGLYMZiI9zBgfiy3CouxlDk=
X-Proofpoint-ORIG-GUID: xsjH4V82_Uiy8vyf_IiVowf_unBSYGCf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210242

In adsp_da_to_va(), the offset calculation results are stored in a
signed 32-bit integer (offset). On 64-bit architectures, this can
truncate the 64-bit address arithmetic result if the subtraction exceeds
2GB, causing erroneous bounds check failures or invalid pointer
translations.

Fix this by using an unsigned size_t offset and explicit comparison-based
bounds checking. Check that the address is above the base before
subtracting, and use the form (len > mem_size - offset) instead of
(offset + len > mem_size) to avoid unsigned overflow.

Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 46d9169a37f6..b014e7498f63 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -486,10 +486,13 @@ static int adsp_stop(struct rproc *rproc)
 static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_adsp *adsp = rproc->priv;
-	int offset;
+	size_t offset;
+
+	if (da < adsp->mem_reloc)
+		return NULL;
 
 	offset = da - adsp->mem_reloc;
-	if (offset < 0 || offset + len > adsp->mem_size)
+	if (offset > adsp->mem_size || len > adsp->mem_size - offset)
 		return NULL;
 
 	return (__force void *)adsp->mem_region + offset;

-- 
2.43.0

