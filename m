Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F308442D75E
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299608; cv=none; b=Cm7DoYwuwod3kf/md16R468iptuwmPWtQCgHeHpFd+vuMgm+DHiTNeoQ4pRbTl6eYqdF2FVphqjss3nmaUbcYuKdJ0f3zb5QLQ0/KrSJMXD/5wcT6u5f01ErDMwLh43kFPhSaun7yyYcU9FCPrsUxvTfGhexjb1xhRhwtjzmY9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299608; c=relaxed/simple;
	bh=oxWmsAM+twLfUwPG6xTjeDdTAauKY9ZVnOSmNHJl3x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h1Qpv/q8Vk0IILJgH5jSOz6eYCpC50DgZOkXCqjMLx2P86hkdms3mLdklR/YJ1gprqDTNvKArdTPdiBtFMg3z4VFNekSFh/wOdCHznfLdJmFX1IDB3Jv+6y+M1LALYTlXaMokkSD9axAgoIfuWUs/EhrIp73BoAHC4Nh0FgHEPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QFmBSEvm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CAz3z5St; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QFmBSEvm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CAz3z5St"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7qDr1875183
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4z0ymWVrqeq
	o9gDHe0QR+vDogR/CFdnt/t7HVorr9fc=; b=QFmBSEvm/dWDDiIafCacepPcjO0
	Dzs5trvnUgoOOYLlOjQ5KmnXdYre9sG7etR3hQoYxjj/FB2zfRkVOj0QTb5kzP/3
	q+b0MqRlnlJiW7yJoC32vUe6nkxaQmAea9WN3ZdhpPyyYCcH9FB5DxQkOuLUdUhu
	vicC7ZfWrUov00yCEEZeJgaQuchyy9Y1pmyv8y+CWUvvFstdrpFRr32jKCuL3EwG
	+7d5wgGh6c/lFUmmhd9GbvMX9vhpC/xWiWoYVEoS6zKe/bQLc/V4EplFu58sZAnc
	D4Tu2pLRh66HzgHJCoy5NbCWWFNXLFahfY2+Rd4iTi1YGXXtLQ4ibwZBUXA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9p9u5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:46:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c01ff996dso53988871cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784299605; x=1784904405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4z0ymWVrqeqo9gDHe0QR+vDogR/CFdnt/t7HVorr9fc=;
        b=CAz3z5StLUvN6zP1X0rgKydcp+a6GhyujUxPbwaLjy25rAvxEtXJzQtkgjeUr5vkJW
         WxAaylUjJJkLPrl3Mkzj24mQAKzelkNgMH9yd1N6xRwZajmAwB11uDc1tr88CNJN/zrs
         6glWT/RUz2O4p38vNBIK/apwbUDXPxDZtO/KQN9u7Y/UZqOyvtVuAszEydqeq8vbTAUL
         yWLeRTXZR+RkRhpcrs8Zb0w6irLw+XvkfClkRLK8nY/LFXvtfw3WO9hXKgLXiPI9/28n
         MD49k55q1RsQG2s+rJna0JW++L7Rtz48TMgoMJMVKG1FMjGAseMm77o1JS1STr2KVoCR
         ik6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299605; x=1784904405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4z0ymWVrqeqo9gDHe0QR+vDogR/CFdnt/t7HVorr9fc=;
        b=Q5f1C4C4pUypxZpv2RKeUDns9bMKMLf/7pORvHA31s5yqVMFEhvZN63LHSpSg7Bg1I
         /+ucKGOjRpFx0vHH/LZVu3SyxGy2byEan7MOwexYJcCQ0SVnzl/6pTmfvWYSDzUZ2/ME
         fLl6Kx9ccLr5xCH3CAIZF8B697AHUshnxfr36IFxmYy2rKJ/9UDin2HJiDPgazNpD7qE
         fKxqtyHFR+FnnmsLolq+kYxq0+j+6psc9c9Wl76RBLEKRBR3O+OzyPITsXrxRImN6bQg
         0x/3gvNwB9emarYIgRtcdUXfJAL4sgGI7fLgB9uZrotweqi1JE9QrqVfywRRFv4k5IUp
         vrtQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRVgbH/mewnYjJjSU1ReoCxxbfmSVS6KoEF/2mW1upZad4OTayPHan6fndosb4e1bITL1JJIvFBrNnhz+b@vger.kernel.org
X-Gm-Message-State: AOJu0YyX+hwJ1OzNKxkGRg9hdnOBqXx1eNrYWgpqC2xuBGh9gm+vg8wJ
	kw4tEsAKCBVqS8tPW6+IMTsVWlyImRHfAkSZL3veB1Eb9tpfTNKvNoy57B3a/gf0PGvjYpexl2c
	UZaxogYUn3Oue8Z2yUIMA/inuySWUf7Xn+6s/ZlDlC9h9x3fpNNX9T0X1JnbDK6bShUe0
X-Gm-Gg: AfdE7cn6kKmk8Od7/2iW5lByBz3ei+GoAvKHH6DUJ24KzvGRpUwrEsmDfvzv6XvVH/d
	h0lIP6qGqs+c1KNsDLcHWxh6Ez/X/Gve5Nfe8Rldataa6nivc1+loo2APBD7o0oZmCOqInJxcNP
	c3/7wdBFSEDPsihDBmx5UVgAYSwEOj23EcV6dHh//bs9c5mgwdd8t38YR0HFLraKJdPV++vr6Ym
	BjlMeWHfUCb6C+r522gFDSzeq6MWJy+WLi9NoiEcbagPWza9G3j7daBQ2WaKsJhqq/4hB4rMwaE
	WKZ1zZxBiztTOeqVcLky7xlVi04f3stvos5sTbJVo6ZwchG10Ue6vuiIsETsc8hOiaFxXjZfKeS
	1HvilYomVnO/bkFU3GCcSiwHvVBE=
X-Received: by 2002:a05:622a:2b0f:b0:51c:19a3:4ec with SMTP id d75a77b69052e-5213eb7f5e1mr27613681cf.69.1784299604989;
        Fri, 17 Jul 2026 07:46:44 -0700 (PDT)
X-Received: by 2002:a05:622a:2b0f:b0:51c:19a3:4ec with SMTP id d75a77b69052e-5213eb7f5e1mr27613171cf.69.1784299604436;
        Fri, 17 Jul 2026 07:46:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm13414801cf.0.2026.07.17.07.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:46:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Alex Williamson <alex@shazbot.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 6/6] iommu/qcom: Enable clocks before hardware access in qcom_iommu_ctx_probe()
Date: Fri, 17 Jul 2026 20:16:08 +0530
Message-ID: <20260717144608.3216274-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
References: <20260717144608.3216274-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1JcGJunfqnPhZtKyL7gtrt9Vz2EYPVHp
X-Proofpoint-ORIG-GUID: 1JcGJunfqnPhZtKyL7gtrt9Vz2EYPVHp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfXy9PtEJ+r/W3R
 zUbTqI/zFt3P5mEqVHqrFNyOnvDyi6DqsfVwtzqyg+8O+J9QjmKKEYknll/nEC06YlMysN7HcKK
 a7fL/0B4aYWze/p/O1Wu5KFAFRHNZggEKoez0iUtkCczDQmSYnOCDT5WnUWlbwNtSgqR6q2qYAl
 eppCdHthKurOoqS83sT9XwA8sbExVgKXtmRbqNrJwuhlcZFIXfDHfP25ukbbyttNi/Bpvg/s2MF
 L5XfxnF2OKWlZKa+z+hRGW8NjXwE36JFnBQ0YXEDrqLUPjjJeaDBFgQnYcTczZGa9ROmT/RHKJc
 xARhmKP1Fs8Ak5vdXpNbdGTUCk7L06snkgNbjADbPf3JTqZkPgIOJEkcjV1IFwCv1bkkuTS8u8G
 pge7pUSPktjDIeiH0pGq752TjdQBwZ2z3ncg60P8/UBPCdkXA9DwWMOrZCy4vkSz7Dciwt5YDXR
 z0IK3YiZWYmYt7MtmwQ==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a5a4055 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8cASqgOsboiLGU4YZykA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX+RKrokTb7NbV
 yfdZgsf+2gbJM4nDv887OeiZ4prqT6MQyO/I0BHTomfMYO4ABIZ1YfvWlNdt1B7VFjEkRfsztjO
 74He3SPSLC6N8io83zneJ192LQwwJrU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170150

qcom_iommu_ctx_probe() reads and writes the CB_FSR register to clear any
stale IRQ left by the bootloader. This happens during
devm_of_platform_populate() which is called from the parent device's
probe before any pm_runtime_get(). The parent's clocks (iface, bus, tbu)
are therefore not guaranteed to be on, making the register access
unreliable on rebind or after a suspend cycle.

Use pm_runtime_resume_and_get() on the parent device to ensure clocks
are enabled before the register access, and release the reference
immediately after.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index ecde5ca2d476..5a9f8b39a99c 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -704,8 +704,13 @@ static int qcom_iommu_ctx_probe(struct platform_device *pdev)
 	/* clear IRQs before registering fault handler, just in case the
 	 * boot-loader left us a surprise:
 	 */
-	if (!ctx->secured_ctx)
+	if (!ctx->secured_ctx) {
+		ret = pm_runtime_resume_and_get(dev->parent);
+		if (ret)
+			return ret;
 		iommu_writel(ctx, ARM_SMMU_CB_FSR, iommu_readl(ctx, ARM_SMMU_CB_FSR));
+		pm_runtime_put_sync(dev->parent);
+	}
 
 	ret = devm_request_irq(dev, irq,
 			       qcom_iommu_fault,
-- 
2.53.0

