Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C68485507
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159201; cv=none; b=GwvjXymeLkdWArFDVj/ydPY9LisJHCDGu3yKADeWcA8xRtK9DpRYbRJMwNpLsS8V0VHLMaXyL56exjA9Nd+/Bo/MTgBd7qMjVxqBvhG1eEjhzWEYBlMqO2IuN1PbLw3EHvlKBpgz5JCG0czMRweH6GXL+kLvCC1NqsgGCgC1otQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159201; c=relaxed/simple;
	bh=AdlzOXzfWps8eRCoOYaMQ/l7uvyFxG2Tx0xeFEPHfFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I7ahS9DovmTSk/Ap4wqpdeqO30ZNaQ+/NY9p7+J2gGcdeJoaHCBxWSqFRgrT685u0ZJSPneciOfBx+Vzd2spEN9PZ0TB3vtEbHwlBI9pnSaoRp7gN/4zXeeigQ3h8LHmRGoIsMd8ecIPOsiU25QNmjIl1z3fcqShzvJNfwcm1tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTqYTwaa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ISUa6Orr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTqYTwaa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ISUa6Orr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2kEB3087102
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KfXoc3zywC545EGvmiJ11HJfhJTtfASiASk8KbvKnIo=; b=kTqYTwaaHvHCRQGt
	/fmGtTwhbXNV+ma7qkgkx0tfxmSralV3ZhoUyjoYLbKk1ub1yxXo7tWg6ucGSJKA
	+a4gYNA1BypvYQFNdICyF8fTq0LwpkVFu3xUAbwvWJnG35Bki1rmekr4K5wr1aBZ
	GSjzIzgn2aPmWrbgXrHg7bYelhUYfbRJ9N4seJUXBxbqto8YQylMRVtjpJ1k4KjD
	vHaKYfez46ydfjUkAN9UucRPAREKK/dmZh46M+KI6P7aUwF0qxzECL5cgN3UFe6B
	s9Ve7ciYFCN+eYr6MUXIH+5LJGpER59vGjZCBQAuYqCt6yK9kNH1Nu56Ml5W/12v
	ArrS7g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwm8akc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:26:27 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-142f4306744so2030434c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159186; x=1790763986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KfXoc3zywC545EGvmiJ11HJfhJTtfASiASk8KbvKnIo=;
        b=ISUa6OrrY/0RtCWmtKRaKCw5iRrdQrl6eo4yjD1n+wS/gVVucKBzcaHlqB0z3NiaEJ
         bTdFceBW+wk6JbFeBAkulP9SoJajDx5M01mkyayUBVLJ+n8LBE6Xu8XrmcgRa6QuSu+n
         VBt64WP7u4wNNbj2E0Xr5L+9DOsnFBgnckxBP70TEdReWDChtiOYVgLMDcnkSF9JD2r5
         nmJIaoxXc5qRvO5I+EptDrDvpXfIk7dOuTDYkl13uMSocrAcdfAbW2r2YJXuhhM2Ak8X
         zs63F8/LAha+EUykenGhcgvQruxc09lteSpkJToQxPIDOAqHtwogBn1kGYHWm9zBuYMg
         d+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159186; x=1790763986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KfXoc3zywC545EGvmiJ11HJfhJTtfASiASk8KbvKnIo=;
        b=mmllONQ7Gnmr5WsfET6OnhJ6MprCHcGUUF9oUVT7mKhjgrP+Msue1Lnud1M5bHieL4
         49N7EdotNTE1inCWISBhAAz1OyEMAHNIMgFqM7KKNYYm1s/gBk7PG79JkO3kdTpWXG6z
         nK+S3nU/o9KCi3zjJTFyT6wTwuTUQrzi3U1kzL8rArZznArujSn1TeIXzmQewVcyF6j4
         1aJGveNCe08bzBtKN8zC3J1pfdBreQyVPVa6/Fdd/jKR/97B96QumoRII8NDMoR0fTTe
         Lls0e7eYeWSIcSz6jNvtWe966UOsLuH41vZdMDiqr3HIcJfIbOUwCI5F1GuvvAj4szeK
         dlKg==
X-Forwarded-Encrypted: i=1; AKwUvBz3HFw74aPll3kj+isxuiJw/zoxXLvG7S+TT+G3x8+/HqoBTVcz7TRDqaNVwI2cq21y2nfDXMkH7NHDwrBs@vger.kernel.org
X-Gm-Message-State: AFuF++kQ6EdTozvgYhaaydxzXGtgskJQo5j64LyG3vgNc4Sqv1xJTYHl
	EUbAV3uKS9eFokuiJck2qrJw8sscoq9W3j5Jug8nAHwU8NpaBHHL6qt/UD6jBsLkyYoPNTvJMjB
	51RfCdAhmgP9UZ8Id6UZe5wo7ejYrhbhvB8cs7HTHib+uMKeP+/Ze+6WTmpcS3V3oPzRT
X-Gm-Gg: AYBFou2hwhsR/PupxNx+ZIzH2/rtwHvAEWUfjILN1tKCsSqV6cLpMz8nTE3Di9PP1FM
	OEf10WoegYglVcI0DRz+UBA4jW4tBu73g5DyvWlYDhBavOC5c9g/k4Y48uWQDVKZCMPg28XXmW2
	z/wnFymeLQ5gY+keE5z21aSeACF89mSJkIom8mzJxs2LADrZobPgzJXdFXXGSaLqO3Fz0+CUAq9
	/Xhjupv8dScZnEQUDVMuO9eGQUXoiwmJvOYWWArzOsQ4cYxERmeXz3oPMvhpH0GR1wpIV9Py8j8
	bk/srr1AXBakrRQa30KtTt3/AcNFcxgyohMoGa8yzwIFISkFvur0mQma37AVPXbDEWGd/CIKFIo
	tyWShcAJiFXAdjLf850plFzo=
X-Received: by 2002:a05:7022:7f0b:b0:13f:c02f:60b8 with SMTP id a92af1059eb24-144f9166ab0mr2194578c88.6.1790159186335;
        Wed, 23 Sep 2026 03:26:26 -0700 (PDT)
X-Received: by 2002:a05:7022:7f0b:b0:13f:c02f:60b8 with SMTP id a92af1059eb24-144f9166ab0mr2194543c88.6.1790159185820;
        Wed, 23 Sep 2026 03:26:25 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:26:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:42 +0530
Subject: [PATCH 02/15] drm/msm/a6xx: Fix secondary rail vote in ARC votes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-2-0c3c79a1a470@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=1328;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=AdlzOXzfWps8eRCoOYaMQ/l7uvyFxG2Tx0xeFEPHfFk=;
 b=693AYB6XLlB5c/XlIXQsn4I8z1hx/Fde8dopx5AR6kyh+CLc53YeZ4IOWJhVIw1DcpU8qUYVE
 VpO0wOoGjt+BExCh+kqDZEZMmMlzfiDkfjAEPFo1zjUt/+GtZvBjL6Y
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX9L3eWHCE8BLy
 z1cvxmPDYdBUWtNKEav1TSpC1Rx9UXWncH8WMLmv8a9Za+mVhEEkG+ciqLEvXEsFALhMjDcVfRv
 vsXPLbHbYeaZPa2GkX7xca96pW65hVA=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab3a953 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vapu2bkIsq-odsm9enMA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: qY0ghVNKsPPwprhsPJLQz30ozCXdvNVU
X-Proofpoint-ORIG-GUID: qY0ghVNKsPPwprhsPJLQz30ozCXdvNVU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX+ejtyOy6H7KG
 e0/Qb+/Kl18coLtOdff+G7Bt6M6OTJs/mshB3ccgYEKqCWVVpmC/DbQfunn5B+av5F4xii4Rmr4
 2zU5evFBB6c4f5nb13HaNU2k+r0eqnOl1HjwarXpeMAqXt7lG9vcyS/b35qDFpuoCcYDK1uHTKB
 5naRxz1n4l+ZNR+xsg777qQLiLxV76IplX47oCIpZ+Ukj0NOGHVIM+XXJSvmQ3gnQ7gdDmhAG/L
 uLJSBOrU5Awx80cKjoyRLreDUv/1KbkLhO3e6tWhMuRk4O8FA1E8X9v2QUG9e9toBMMRobMhySn
 SU3hYqX8cYXSdG/70oo2leruq/EvbaFGBz2kSrMYLuZyIaPGwWt61MtHF8CziT7iNCY7ZKNtydt
 b9XS/ZkpZC5xhrZNhDmgESGNeI45Y0R1yC91Pj/A2G/92/Tma6T3qAU7+q3rpULP95KPtWUqyFr
 bPZHqNjM7JORcOcWxaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

Using the requested level can pick a secondary corner lower than the one
required to support the chosen primary corner, under-voting the
dependent rail. To fix this, match against the selected primary voltage
instead.

Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index baf77a620572..d072646093a1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1765,10 +1765,14 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 		/*
 		 * Look for a level in in the secondary list that matches. If
 		 * nothing fits, use the maximum non zero vote
+		 *
+		 * The secondary rail depends on the primary rail, so match it
+		 * against the quantized primary voltage (which is >= the
+		 * requested level), not the requested level itself.
 		 */
 
 		for (j = 0; j < sec_count; j++) {
-			if (sec[j] >= level) {
+			if (sec[j] >= pri[pindex]) {
 				sindex = j;
 				break;
 			} else if (sec[j]) {

-- 
2.55.0

