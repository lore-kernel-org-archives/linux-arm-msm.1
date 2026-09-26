Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB73D395ADC
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 06:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404527; cv=none; b=jViLbtlWt3Rhx3DwqqCYmU8/hEcbvJ4GCyCOjM4OrZXjPPWYALXxk5B1bCpvnGJQJD/80i8cxeKTS0BMZKrBsM/7aeiUeUL6WiS0jFY+JY/Uv9IIcgcAfaPr9piAQ0mtpJ8IaSxVpuVj0PwZyQZvTr2ZBjaoaPeHGM98AvfOYbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404527; c=relaxed/simple;
	bh=u4T/TiBVjk6sDPMeOEWKmkDa4GYeq4h6p7YKB7q310c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q+nSClh+46DsvlZVW6T2/w7zwGTnh5StPTKs214znFTxaYKnGZ+bV8OqUI7YqMgaAldsw+rQdNUj4zM7LolfZAGGbK42HSdKwgoelIU1CgFNnZgy1D/UXssOT5QCJtIF9VmPms5y8PjhQhIoHll975MZdeO/C6f4ZJGYRbhl2as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvR/bx7x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lx04ZDXr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvR/bx7x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lx04ZDXr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6OjDK2569046
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 06:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6m/+51lEBEN8BFk27SUULRpvRuJnuqvGtKovB+gc4D8=; b=WvR/bx7xA6cg/5QG
	CGjdZX3ivwO7uwmiG97FC9fd49lpN7cjcvyXxGgGrdoYXGtW2n1caCg68wPEXrQT
	JSoAOlp7TbaAU1S0VEFU04qMjbQE1sJ90/gxC6l+3nKCYfBnPiyvZQzC5eP7ePDi
	Josc4qaef6dbY5tagV480CNnuG9P4PW3DJR8nvZ4GxZYHHtL01xEmvhI1///23xP
	whGLk4HpR3R2Zs9kQcxEDTuaEYLuFetywpEKpApDjmd6O/dgcXvY4SpzEN9HtSx0
	F1C75XOV4D3axqVw8z1hgyV92NhT5Qz7heldK3gOROo0b6YryTIeFSsR7Sz0jajL
	kVPdPw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6e8090s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 06:35:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-342b66c0b06so695443eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 23:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404524; x=1791009324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6m/+51lEBEN8BFk27SUULRpvRuJnuqvGtKovB+gc4D8=;
        b=Lx04ZDXrYBoWhirP/m2ePdRDTPq3GXgkrCLInm4TclEMo6r332r453/g8azg9/eRvL
         pMNZJ7HgFZelA/OSLrv1if+VvDVx6zkPZvDPCtgtx8aow6GCaXDdZ2rQ5ifLzULTDIEj
         MwY8rf55lFbtNOc7JHO/au3ekgHZTiMys0qqk/oVOdtGKdvhUxv7IcvW/TVvisopOOdp
         ElOUh6MuPxfN3rOdiFADSGyHasV7YqWRSr8eerPo6sfPokS7c7SaJfpIFyaLEQm6l8Qm
         WUgEAbSgji1G/RhScrC0LzVaAJLbmkAANhPjfkLVIN4rY6qIwiLPo+Nt1mjATTf3Uw9x
         wuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404524; x=1791009324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6m/+51lEBEN8BFk27SUULRpvRuJnuqvGtKovB+gc4D8=;
        b=MaUkw12v7B4WScUdcUL16rzv+iOeAOSxLQ5WZ+TSXa+mplsKpNieYnMUYS5IR4wes/
         AOpCrSXox+/PRS8ySyDNFALZWsXsZRIk680R0DJVASXrYVV5DWaTkuscf/WmZQozmr5G
         gvbj9YbM0wu90RHPOKsYYUwA+Lo5mqSWzMC/+F64jB63Ta4Dy6C2ZZcfC0N5qgUwGTit
         /zLZLP7EPh6feJ7sSiNTbAGStGWH8f9X6mi6/GSE/VwXG1YJyLF2vNRCHwACCP/mYtVo
         pUCFwZSxChhCYqDfIs/S4fsDAVWs3rwh8s05KY4yFKVSxOCwsOYl+2ePFb5Um66a7JU0
         vTRw==
X-Forwarded-Encrypted: i=1; AKwUvBxdEeCDosAss+2ZnhPdBoXB/MKvNEQN3sGTAov4ynaWYX1p5hoTvemaZKC08ob9k/b8DEJgke0ACAmwsd8a@vger.kernel.org
X-Gm-Message-State: AFuF++l/pzj/oySByinTshcWCD0eNNbGfj/CUdDaogp4x6fglB16g0hk
	1jKgjApc3tfSH4RkB+9Xslv8goErxOq2T97JRkxLq0C0PT4I7/1pQRMZU5CrTHaG5sP9TMY6h3b
	KrLO5yoLnGoesgs5I/k2wwPZnYU92IazdsxRW27MC8VZkMgPwjDLuzI+skPEmVUYNAG+3
X-Gm-Gg: AYBFou3cZdnJbpGFBexAnaBqe3GPmxkxM4+6JhsmR7zHR4QrKurOSnOtshq0GrLWCE5
	AmkMZSyEhd7F4gUpZ+m10xtT0hSNxDg29KcD/clJl50giigLNivEcVMJ4T0jn5PxfThzRtOFWhR
	PzTpyeM5LOdwfViZ7A9e0anxWVlMN1KtwnaVB7T6+3dz2QwgbGC1T4iRoCpqRoybE8/3UUKEze8
	ELIZfSbceXTkU9cznWeJwg7gkbpVaSQnnuzdrtptkcxSryAk2MDh/U1JM1vY82XvXYKeD5SP8vK
	V48QrbyeWqJI7j7mWk+Zn7UtoiW+qg8o99kWoVn/WNUy4Bdf+3E3rByMUcjFXQCP3DMmnBZol/f
	E+M9DlUdIAw1dDwBhV9neU8RlHoEwapHbKQ==
X-Received: by 2002:a05:7022:288:b0:144:fb8d:4706 with SMTP id a92af1059eb24-146ce4928a8mr1873685c88.6.1790404523064;
        Fri, 25 Sep 2026 23:35:23 -0700 (PDT)
X-Received: by 2002:a05:7022:288:b0:144:fb8d:4706 with SMTP id a92af1059eb24-146ce4928a8mr1873655c88.6.1790404522317;
        Fri, 25 Sep 2026 23:35:22 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:35:21 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:06 +0530
Subject: [PATCH v5 07/13] media: iris: Skip DMA mask setup when the core
 device has no IOMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-7-0322ca5dc10c@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=1806;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=u4T/TiBVjk6sDPMeOEWKmkDa4GYeq4h6p7YKB7q310c=;
 b=aTqmwyfdbwKoeMl31qn9fn8d/WIqjVmq4VkgJAeoaw/HXo1bp90GA/WRWEOOP9Ty2MVmVeS7G
 45JC5KMPsiYDk2FGCR2jaytaTpGPRzXzBq/kGzSG0HCQj46VCQazbHD
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: lZoPDPaYNpNsdGsalSkdwTL4iYmIH_M1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX+6r+9ploOJEA
 0cd+MDeadUn0D2XjzBUIoWXgUyEIenVP2qKTcmv22cJOXbcasD4iLkIHqaW8FDQN7401LkQnBaJ
 s/Koo2Xu5L6LQ9T+Zweis9I+hGyswBWaJ9K/2WtXDwEjK4lDc94tfp8a7bM4+ThVh64guyzMruz
 yudO69suMKyHM8/VFqPMAnyC9gCeWFl+nKQQ71bhH41SnJQa2WEpzE+SDCUvBPOCPcnMCRlydM6
 VQVWXiy0FdSJJ5ri8eibtRbJNshvnY0YwulSc6GKjSTk/fvxS60lPrCTSTVwHAbOzWQP7Ii170K
 YxlsUx77oAN42DUBCOeAaE0HYS0SPZg5fbol60dUDmVHAimI58bMAW8N4SkQMZESRxo2MAdRebQ
 q6azIf09Ao6FI53Vaa0VB/hotSrQB2wpplyPNSU+Wi+sLVkUOjXH2U+or1nnC/zk1WDPadEU7oE
 oO0VAQJOs2827KuxXpQ==
X-Proofpoint-ORIG-GUID: lZoPDPaYNpNsdGsalSkdwTL4iYmIH_M1
X-Authority-Analysis: v=2.4 cv=aIFlOr9m c=1 sm=1 tr=0 ts=6ab767ac cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1uU0fEruEEfCXXW2WGwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX8wa9IGPSGYmv
 ZEHK/iGBhKTIihWySmxfFniFasOajOXbBCcSUvO5z4kdW9hLg91HkwEruqfR8SALxi4sAHIJnZL
 +mKSWHn13DRIe4ClPpxhd1nA7/zXYHs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260026

Once the streams are described as context bank subnodes, the "iommus"
property no longer sits on the parent iris node. That device then has no
IOMMU domain of its own and never performs DMA directly, so calling
dma_set_mask_and_coherent() on it is meaningless, and on a device with no
IOMMU it can fail and abort probe.

Set the DMA mask only when device_iommu_mapped() reports an IOMMU on the
core device. Platforms that have not been converted still carry "iommus"
on the parent node and keep the existing setup. For converted platforms
the mask is applied to each context bank device instead, in
iris_create_cb_dev().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index debd1f0e57038d7abf463e82fd80f887b67750e8..4bdb078d83b5c331869dab2409bc4d10ab302737 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -352,9 +352,11 @@ static int iris_probe(struct platform_device *pdev)
 
 	dma_mask = core->iris_platform_data->dma_mask;
 
-	ret = dma_set_mask_and_coherent(dev, dma_mask);
-	if (ret)
-		goto err_vdev_unreg_enc;
+	if (device_iommu_mapped(dev)) {
+		ret = dma_set_mask_and_coherent(dev, dma_mask);
+		if (ret)
+			goto err_vdev_unreg_enc;
+	}
 
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));

-- 
2.34.1

