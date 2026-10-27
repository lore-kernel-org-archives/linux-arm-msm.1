Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142325;
	b=pHJr8wCd2JTrOlLsdwadfpt/uISnR+cdEPQ/HRxWl4oWMwZUu8MlEJyKang+orOxK2we
	 4a8XTPVw5CdS9mU3FdPgYFpHbDd6cmlDTK44ensPOUO/0wCO/EZPenj6iTzlfO01MFC6+
	 BNIPEzcRESk1AdLl0bOlZigmKNQ2XcnBU19Rjbcy4eJ0Y90JIvf41g9CBih/Zm9AHsR4V
	 0HpTWMH+TXhGePkqzUSKyjcb0ldsgeinnAtTrVg++BnkZZHKgC9oh3EMRoztSkdgMm6QQ
	 yZjw3bQwD0fKFoHzCfET3tHt0fTs91Cy7gqoXai4hT8sLxnt4e8c2BOMwj9FULBiKlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142325;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s64e3dkDh8bRM5DK2RGthae0FkYgQUX5ZSt/5PXVdcQ=;
	b=zbFZrFPskrJsMmN1pgHuMGhooyXXjN314MxubxPU2Z7vvs+U1ZA1rfbP+0N36IUoDRVX
	 vV8ERRpoN8loXEnWo92mhEWvjqQTkplgyWOhdsVaT8zCcXk7EzfhJZWalPQpEt/0iXzUr
	 9QAXJNBdh17WN6VjlerMVDGIHw0diJ6U+3qL3tZw5Cu6PU1lYfba2RuKGoz37xC94Q/RH
	 THiGUwHVWaXjH7R5yFohjKD6XFlcLr/YH2M46lzCsMga0d1viH3fnBtupHog1YpboYdzy
	 mctFh2rLOjr3Q9Ulz/pNoFOXyzvXLn0h65zlvollIVUv3osQUFC/qa9rc/wJbRN5qrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nXKMaPCU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fRj8R0fm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EA9606A33F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0EA9606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nXKMaPCU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fRj8R0fm
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RKtZ9H2792563
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s64e3dkDh8b
	RM5DK2RGthae0FkYgQUX5ZSt/5PXVdcQ=; b=nXKMaPCUL+E+tC6x5Xzzpullc1L
	9bVs2OBJHdJqX/y+E8ZcO/vyrSX7C28PZGvv/+KRv9hvADqmcYaYaQPaCAtiUnwK
	rzgfaN49iW+jpAs5Gk5tvqZ1yXAIJxCJmXIJDY52j0madOQ0S3bouZM+mpDcMFpz
	px+qCoo42jmPkYQj6/UBNrdAoCF3b36FvvyC7LMNJwpJiaUvxHOfJzdbPahWftGv
	HAu9hVvLn4Xz2MKLo8awJYViML4kiDAxkInPuNXDAoE1KrPxsQneks5rXpe2y7MD
	vC8y/tvACwKKWCwSI7RgLVvWovIAo7vCMGJLjLtHQ9el4+nM9z/Hoijpl8g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g1h1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 23:05:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9d52f684fso2833335ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 16:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793142318; x=1793747118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s64e3dkDh8bRM5DK2RGthae0FkYgQUX5ZSt/5PXVdcQ=;
        b=fRj8R0fm6PODtDhh9RCa8z8YPkYTicIBwPg9y4gMYHSMswZKklJ4SbaIK4s8UeA7hg
         3eBtm8Y/5UDhVXcatoPFs1Rl3l9FpyY0bsM56MWuW349xKlwFT4SJPDsghbtC2cXRQna
         Q7qtEX2IhVgFM16cPlFzBJVCOxGfWWAwXTlGEEYCI7tDpEDbJzbmdt+JLMeFm3o8ngeF
         XeWyCMARWfzQovGn+MOHJ56wJ3M2psLC6EnzhYLSEJjoSM4Rh13d0MSFBMyVtnvwe7yw
         s19jdolA1yA2MQ0Ia26s/cJLMV6xcwJQBagunuTz8+GamoRJnDgP7F1rN5F/lalDp0M/
         ewPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142318; x=1793747118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s64e3dkDh8bRM5DK2RGthae0FkYgQUX5ZSt/5PXVdcQ=;
        b=P5JBc0uNMghrekSBpyPfoAMeoLMPmqrBoBWByniTZYhjzFTZiXeOczVCQcWq2Moajx
         jLJ+SMkTzB2J09vjhzTnzU6I595miXc2oDRNT5CKJDU275vBG7R8JZ21qRpRnqZDTkNR
         CWzQiFPLbzGa5duAM+O9PWHrImEgvdk4WKgFH6YEBujNqptw8VNpIM9sPNKdF+kAWCuJ
         ygxHzjo4k3O2JYGqZpfVEjy5fEe3jjJeW3WDrLmIliXCeDvIqnmBKx55h3CdWZrHFDDN
         /KGtDVAK7BKakYMwfDHbI+E9Zq3wzPp5s+/py7M0yvn3vVKRHIJ2AS2vHlETvUwJKFOJ
         xjdQ==
X-Gm-Message-State: AFq9FYKm7pt89tXs8Ae6WP5vTQ6H8aIL0ptl1tr31dmR69sZD3rZe2jH
	tPwLCnh/cV4O6edcQGXcQzMedO2Lp4xFaoU3dX5fv7XPeM1ErYEN724DsOAy8Jn+p9upbWl66pv
	DnqoyfZdk1Tx5oDrKnWup7D9oYzsCXVb/jyOnnuvbEzkAeU1HyQUXsyous8HSqn/+Td+3
X-Gm-Gg: AYBFou1FVLSd3zHbXoUPsrjnYQsHCqyhBsqSQic8YsPoUPFCLqV0eUTnJosScdiCZG1
	QA7YkyGTvp7mXYZDhISLEQAF11WEv/wNutgFIg3OK/tKdAF+daQhR3IknP1zcu7QhIcCTKdQ4qp
	+hVIoRvTYys6WV7vMJwoO0DJVeu/6ZUbhyEbnVmRMvq2h+QUK8uwMN/lJca6r0k0YgbLpPYpjg4
	xdtq7m9vQm+r5RbMHdPxda7SzS3Row312/SEMbLFhcF59+My1dxxzW5A8gq9ty/ks6WO0+dh1y5
	NHbntCwqIQENcj4rCCx4lPjO+nA4YrZ16dO/Q80r7nkHbgaZ5yuPkdnEU3/phEwTBdFUW3KNmFL
	F15K7gOjmKP2StHNGNk4bGsotHhGzOtZOw8gWruDBqVud/tNXAA==
X-Received: by 2002:a17:902:e945:b0:2e8:34f9:735f with SMTP id d9443c01a7336-2eb004f3183mr6574845ad.16.1793142318521;
        Tue, 27 Oct 2026 16:05:18 -0700 (PDT)
X-Received: by 2002:a17:902:e945:b0:2e8:34f9:735f with SMTP id d9443c01a7336-2eb004f3183mr6574485ad.16.1793142318005;
        Tue, 27 Oct 2026 16:05:18 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c91e1bsm14488035ad.59.2026.10.27.16.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:05:17 -0700 (PDT)
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
Subject: [PATCH v3 6/6] drm/msm: Treat !mapped as an error
Date: Tue, 27 Oct 2026 16:04:49 -0700
Message-ID: <20261027230452.130031-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
References: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX7l/f/NhuN2KW
 meevS8AUC+MoNLT3t/DlZThuHloFKD4D0lP++tEP7Z51OeQeuaNC1lJpx9JqyprF+VW9+uW4Lz8
 tt2hNOfrOre24njSjjGRrcU1g8v3b2DZ3JYCDoJO8yj5NNMv3WvHSapl62XTiPO5+8+wIV2mLw9
 5Y1ryIiqTw0+wxVO4QgII3zRHikq/4VjihLKkycuIY6MMSGjLc4vHqwZDwm1ZbvAKNgP46qRK9H
 zpJ+EnO84Op8lICUHk5gPi2DhXpWQfSGDBlQ89cijZq3bOTFLhskiOvht/MdSKch0Tix1IwpcVJ
 F0qwg5JA65ljdgCcyhwf83lgcSZnObSaULfzC+0JCtFn4Huc/29o+dZF2wzV2iOeuwtglNisC99
 v767YLMUCT5+8A7VKi9JumDD32JeJodQ7C+Xo6jSKMtvDDThgAsbGatLNZYG1ctH0AysOXh6Dtu
 JylZLJy8TCyChcn8hTA==
X-Proofpoint-GUID: 0QZSfNraHQTChQD97LPlx7iS155wzKYp
X-Proofpoint-ORIG-GUID: 0QZSfNraHQTChQD97LPlx7iS155wzKYp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA5MyBTYWx0ZWRfX2XDn31dhgq4V
 wnAUw0XBCDpDV10tP8JQTH/kDw+2Q6mu7MUWZfJBJ1vdWDg3qljdeh00rD8DWB/z2SuALx+ww/C
 qHJXmRS+7JNP0XzPfMHyFIjDXkM+iDM=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae12e2f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=IbsCIv0Bno-BzyZ2rGMA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270093

Rather than silenty mapping nothing, treat this as an error.  It should
never happen, but if it does we want to flag the VM as unusable.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index c2950d32c507..255972323f9a 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -186,6 +186,10 @@ __do_map(unsigned long pgsize_bitmap, u64 iova, struct sg_table *sgt, size_t off
 			size -= mapped;
 			len  -= mapped;
 
+			/* If nothing was mapped, consider it an ENOMEM. */
+			if (!ret && !mapped)
+				ret = -ENOMEM;
+
 			if (ret) {
 				__do_unmap(pgsize_bitmap, iova, addr - iova, arg, ops);
 				return -EINVAL;
-- 
2.56.0

