Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1D23128B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786942113; cv=none; b=EvUrf85bZ1CbUis79TAVM1XL/Cg0ACqhs9YkKSSuV/k73T/CkTn+TeLdiggSV64FEu7giOzbIiNerAL4+vzghG/08VpW85t3dEEko8K8EgcBX6I9Bs0aL5cvIBthRuG6vDjk4bRTkt9PwlW4hnDl+kJxd2XY/y+8YXieaBs4b/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786942113; c=relaxed/simple;
	bh=ZCBL1c+Td4SRNnF1oGxWDvquDAKasF3yV4ZUllxnUMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hYZpZC3pC3dcTtk9TlT+JnDGgvF45dNQZzePhgAJiA8X+OQq6VjzQAylGwYH96jdWSw4YobXUIapOWEDx4S2MYFrgVJACXQE87UqCU2NS3ax1bc2d+oq1sOMWam2I0BODmXLw+K7sOReYGfx+wPyXx/PlzAFelkqlBuLFaxrBPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6OWgqQo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gtRfKRP0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6OWgqQo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gtRfKRP0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLDTb6856670
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yCIa0tqjHElgbgb0AfTikV7EqDsfsowgkNcvnaxzF5w=; b=J6OWgqQooQ/gjJ0D
	1npGrsLwqRYD4bz7tU/atzjJynju00cIfiTQaAdgo/zq5JN9/fUJQ22Gvrm7X75i
	AV5KCfSxa7db3/LNOM/g8wIJgddB2nP+E0mJos7rvwTZ9ie7GaOVbuT3ghs1GAkc
	0Zu6TxU2vC1PlDJod8bennphPbHGoPz/MBJJ8e8JcepnGZweDGuUDUzocWWARn9Y
	P+p2cI5KqsEcZ8Q9Yajz1XT1oJYg+RMi7ad0FBwKD/UvHDIPWVsiJ2ka8Hk3rpy2
	389MEfu8qcFRpskh1NdNTYmreeV7jIbSmv1r8MzXXDkC2/SnbxIn3Xsacggdda58
	rRQwuQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghwn54r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 04:48:30 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedfa3898aso2706797a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Aug 2026 21:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786942110; x=1787546910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCIa0tqjHElgbgb0AfTikV7EqDsfsowgkNcvnaxzF5w=;
        b=gtRfKRP0+qsTYtbBdt1uI3LuVGUP3cZpMQkTLwO4bfVfXRpXXS/J5vtpJqHP+cmR9h
         KLXcSPyS+9ceQRAhUR+dVHMTY6A/i0Shf82XXfahPB+EVpp4F7+pEVdFYvuNIu0CXo1V
         kBR2+h5pKSYZEvi7hAiI9WNUUnelucEGDjf4Eb/tnzwy7BroYhDOy6yPrXKo04MquSRT
         2l88+TvWEGhlF6CQ9iBbSC+T54vOt8lHy6vgZF0gCW7HiWVsUTEb6ozMbZtUQUN7vP5b
         ULC7Rebt8bxbHE6KteIZH/Q72KB1WRFnxYbzV8H4X45+N/EhOCKKozZjVzjpaU1LfSs9
         ehNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786942110; x=1787546910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yCIa0tqjHElgbgb0AfTikV7EqDsfsowgkNcvnaxzF5w=;
        b=GRHh4K2tpGAFp+RkusXpb14M9Uva2Bre02MuPnvplQNIN1+KQEmMAHEbqOW3pkoF0M
         I8aGK75sOKRolHlc6hi/BV5HFfpp1nrEsbBmGqVchJEwRt9SEsU8XVUrrSTgjM+gYBII
         XJuKYI1yxJwHj6az2QoQqQEJDT2K5h0tgC+V88JuxL6JYoY4rpeowJnzRN5QvOryQzzw
         fGNI/IAnAZK2WGRytmIzi8kNlvdsPd8LX3E3KAvUhrBpysVRbJTPEReDJfIIjcY7Qj8B
         /vHWezyqg7o/0s2U7khoXgRUyMDQJg2VN2lJcwoFFZSwrXZ8eqdCB9UHWk+yDHWNMNuC
         OlAA==
X-Forwarded-Encrypted: i=1; AHgh+Rov/NVkv0/qINzSkvHUHNrceybs/UZPth5boc1TW7WUvJUo5koQTLpUlcZy4FVeUGLFZyJZMjp/DCNEphlG@vger.kernel.org
X-Gm-Message-State: AOJu0YydHICI6fdnA5C4HoaG9Gm8VO8rhvmch0itmcT6iVVgG5Pv/wAn
	hJyDYald12tBhH5xu7vkvZiHkZ9ghJeYFQsuQKkOASNDjK+oGL4YKLCYNJWtYQmGSZqxWZLxTKN
	C+rI8o+g+gmVtKD5CcugzAEPhsx33sEvPRQhJ2loHpRi4YsY7UbtaK0md3Tzh4/GeLUL0
X-Gm-Gg: AR+sD12bDQnev8VQidu9jUYyqA+sTFpsPHER/NJSvGQsSBR9ZKV0N+mtSwWie+drKxx
	ZTK7EUR0/ucBxMRv0uHvaWXTp4A7HEyuxyKOyrQM5fasfQACpmhFqBg0wJJscWeN8NWYa03Ajj0
	cOIcuumhCG3E2H4cqMPSqeixBL2GPNBZHMKgctz+72dpI+DNDWVvEMRowu0jAZuPm/+Fqazd48O
	1g/b6XhHEbphEXv6fCn/FDSd4BJQ5zBF4p/zz7ztRrqgMTWV75ObAFK1YdzmxUYIpsyEPjkN6t5
	LmWP3RvFSKWIDPlkVdhDTtZqKKyIiIjLxpwtgbBTur71o3tfzNLOF+ldBqMzJh7CpdMhAD4MPdf
	cmaoFMxeYk6fMVwV5ESmme0sDLKlKSmD6
X-Received: by 2002:a05:6a00:3cca:b0:848:2c5e:305e with SMTP id d2e1a72fcca58-84fddfbf1a9mr22168507b3a.6.1786942110199;
        Sun, 16 Aug 2026 21:48:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cca:b0:848:2c5e:305e with SMTP id d2e1a72fcca58-84fddfbf1a9mr22168441b3a.6.1786942109648;
        Sun, 16 Aug 2026 21:48:29 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d046638sm2149250b3a.27.2026.08.16.21.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:48:29 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:17:40 +0530
Subject: [PATCH v2 05/15] iommu: Add QDA compute context bank bus to
 iommu_buses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-qda-v2-v2-5-69a02e9090d4@oss.qualcomm.com>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
In-Reply-To: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786942058; l=1398;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=ZCBL1c+Td4SRNnF1oGxWDvquDAKasF3yV4ZUllxnUMQ=;
 b=Ff62ct5FmLcrlR2W0PjFIkBz9F7OfuR0BbENpIURCRwvY/7zltm8SoqrH5Z+oE3RorVE+0N1m
 xMOtTZldlZKDrKhhHfkpJU6wCmrnxMlgi6CSe/Y8KovXD4az5vfrhhD
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: K_7dFTkfJ2hOSkvM5DoFq6fY_aQSWj2V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfXzP1gVjpnmfKW
 sGJP+AxzU4bgcK3pOJ6768/kF0YK4p/gLLIF0hqS0j2wJeIGO3C/YJN+RM6e+9Wy2RS2SY9mxeA
 a2jcECCjSLiiWalj7BixENoc/dM/NiSRHReGWKFkjRUdiqni/T0Bip+Edg55lvEDk1c4GXLJq6P
 wngXaSoVEHw4r4d+WA9tA7DYTIQx1Jr+pzmyX9OaqOgdZh8Yu++Ab9nzBsHAkKy67XU0bB28xf3
 CY2EUkKJM/ePVvsKgj6irkOBuXs/4Ts8NPL7IW9rjGqxVMwJ34Lg9gShSZulOaC+QD7oxzjiHzT
 84TBqKBrH906Xyrrz4HOeXQjvJCpXp0k3lemQTyvyOZIqnZsJ0zDgDRevjz/BnyDrR2qqGYU+UD
 Jia3JkSnuSJmp9AbzGdroo2S128d08wxYMFpz8tUIUVTiincVAUpw7WAm6rLXlG/fbQyd4+rZ4a
 /ZxyRXyaHfjEiQZHfZA==
X-Proofpoint-GUID: K_7dFTkfJ2hOSkvM5DoFq6fY_aQSWj2V
X-Authority-Analysis: v=2.4 cv=DdknbPtW c=1 sm=1 tr=0 ts=6a82929e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Spc4k6fihxjec1dDB2sA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfX8AxzfJaAErCr
 XkVm5/7Pkva7YKAVvqvMZV8TuPkLMuDEtAlPvKWR530EQFXFcmWC7jh+8+QlfH6e/KUt1KeoSh9
 tuFrT7p2qJueVO+HHU8IA/+ZreJem9c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170033

Register the QDA compute context bank bus (qda-compute-cb) with the
IOMMU subsystem by adding it to the iommu_buses[] array.

The QDA driver creates synthetic devices on this bus to represent
IOMMU context banks (CBs). Each CB device needs its own IOMMU domain
so that the DSP memory manager can enforce per-session address space
isolation. Without this registration, the IOMMU subsystem does not
probe CB devices for IOMMU groups and of_dma_configure() in the bus
dma_configure callback has no IOMMU domain to attach to.

Assisted-by: Claude:claude-sonnet-5
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index cd1bca7ede9a..4c4f7e732773 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -26,6 +26,7 @@
 #include <linux/bitops.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/qda_compute_bus.h>
 #include <linux/fsl/mc.h>
 #include <linux/module.h>
 #include <linux/cc_platform.h>
@@ -200,6 +201,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#ifdef CONFIG_DRM_ACCEL_QDA_COMPUTE_BUS
+	&qda_cb_bus_type,
+#endif
 };
 
 /*

-- 
2.34.1

