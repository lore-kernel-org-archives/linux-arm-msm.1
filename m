Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B2633D4F8
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045071; cv=none; b=D55N/CW82BewUK2juq8upMhrGGQwO4Nm1vqS2maQcKDdSnB55jypDTi9DBdqmvixTB7uaepNCpX+fdhqn5ZLH3rifZd4Wj21UjulwsBmbmdMP24uJzvabfJ8LAUQN5tdcxRNJrQL60CxPWgj306ytLgKaP+/eXdZ98YpZ9e4/JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045071; c=relaxed/simple;
	bh=xDKjG51jBAk9EXSAgV+S8o6yhO9zrtRBIJx3AXPH7vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/29YbqLtmjxeI9DIUvkTVwYTjRRXJc20OkR2rlSPzZ1ZB/BND3MV4hHuuK4iL/DolSb4BXutu5T0odE/2PnVUc9VMCb/temIiJzTvAEZ8W7RgeFxmvgRwgC4ibok5Vk3hANR9fZjTzrSjlhambnND85Vd5k/uLhFV6SHElHpyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KwGTeHUW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q0ouv6db; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KwGTeHUW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q0ouv6db"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5RZrE4179394
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jQ1czwxEPod8YlqEh+zmO/6OKv3iOp22VfF1LBuIlCI=; b=KwGTeHUW6FX7mFlK
	GU+AWAHgeY7SH9E2NjijxyawjAIoSyqw2XXqZSW58ACr5lQ6oYbtAPmbQ1Zf2f2z
	Q0UuN1yn24nZ9JahVMy08dHfN1CLIAoe+5eg37CZkldTetU1g3AwKsburbwzOs6Z
	+8zobuvYGOTjOmSRMWZACGFZh0nLjmST8Wjt3BGiZkpKu7UCbqv7df5UlBufSkZH
	to8SLm01PU/LORBn4XNNQgzsHHXmWryDtxCIcayJ1w6Ihs56GyZ930GnMwNMD5T2
	iZYxrl+L0WiLJjVz3fNBJ5OCCSbxE1ADdnLUjvsvJvWOgmYT6jkwWxQX1nT+nnYT
	ThoIeA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm572fxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:51:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so2523138a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 22:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785045068; x=1785649868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQ1czwxEPod8YlqEh+zmO/6OKv3iOp22VfF1LBuIlCI=;
        b=Q0ouv6dbApbhfv8338H3e+HLuqSHQtbuirNo12nDNyuMVqSStFmfvJ7eBvJQgiufmp
         TDtuJ+1uuN0DkYkuGEoFJ6+t62EolXG4TGOgY+FkG0EV0Tj2p8/d4Elkr7d86JpjCOJS
         XGy1uHZIu/OpRYrtUdudCuA6E+A0SzwPXDLwW2nw4qYCI1znPDB97Ng27zDhA9gLU/8r
         EmHBPvp6d8sIcM5xQu3FuGe2MXJQz7hOteaHIWgayOOzA11NRX/8Vb0Wbg8uhKOBw7YH
         Nj+Uhc17lNDatXPhDUexHFNIdClMImBhEw82LFOtc5s0LLk88XZGP3VjFrAR6nnrZEbJ
         l7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045068; x=1785649868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jQ1czwxEPod8YlqEh+zmO/6OKv3iOp22VfF1LBuIlCI=;
        b=c8ByXwdz+01GqGccDNHnrMbY08PBiVgr0SUPAcIQV7/8IauX+wincqN/J8efrnFhU1
         pWHVVNuotDK3cI2fvT92MSJe+ZZt9WGxd7gtKzi9G2/lnuqTYoWyzcfG2NnLHOnAiFCX
         2k7Wk6WVRmg28MutFwCAeg7cbQcA4DhVZT5zwLCdMHvG1uR77f5nfUYeQ5y4O4xqb2No
         iW66VcI8WK9jF3xCOVeZnlSmuMO5ZeR0eQob9O268nAhOZvNKF5nCyFn+95Lw1NMD3ZG
         aJSox2GsrO78Nc9fmR5VxH6UxZKVxcHO4fkdFuzfiLRRgXtIchLD9FSxsD5E+LqOmEIh
         WRbA==
X-Forwarded-Encrypted: i=1; AHgh+RrtiFMKjd9YCMPO8v4p2v3gdg5KwnRoW7cTqcOLoCl9hdvO7mPS5AKILFEcPx+1De+yz5S2FKUuKC50XfHW@vger.kernel.org
X-Gm-Message-State: AOJu0YxZlXzBmLj3mK/NUl4phfApRyvBB9GlmZRTrCh/lFggvwa5nUBQ
	WFHvd3e6eXdvZn0va4BjwL9B6w+sTOApDJ5IYzuX0K00hVx6bcBwb7261y2BZ37q+cd1Rs4Ov/m
	lid07dwL5Mvfr7WiTSy8pu0ALhqEWukVyIf1e+cZNVuWen0Wxr0xf0WV1jA3RgXtGaOi+
X-Gm-Gg: AR+sD11PtMmTg06MX6vTTGHjqptuO+dhDAMIsbfCIG9duRogXRWcVdabiR2WoWJOFti
	geoN1PKRbwPhkvf7iygvC++DXJfib3Y9FDgz9Vkw0o1S4zc4PZLCE5Q4v4vFj0dzetHeRrZVw3o
	gMe5TgaYpYLUkk+i0Hf0OArOhqcZF2GGymAA5ZoB+8nfoWxj9cwTBkJqk41jPmUMQumLz3Bvwqg
	A5Imtn45WwBtHMEiY2CE6us4eRap0uUGonsRZWgjhyfQtUe9w1wh1PPGACB7ZdCDKHjvtJjd532
	SM0tdRnyCWLJL7krKKE2xcDxYdek5ZVv42OXlVkB37KnvnUUeh67hXG6UWhP6NRG8XYsilGvmah
	hMD+sBczNvFaOSWV33QQJFCBSRxS3IEF8qQ==
X-Received: by 2002:a17:90b:5826:b0:38e:5717:9cc8 with SMTP id 98e67ed59e1d1-38f29641b0cmr3946323a91.31.1785045067921;
        Sat, 25 Jul 2026 22:51:07 -0700 (PDT)
X-Received: by 2002:a17:90b:5826:b0:38e:5717:9cc8 with SMTP id 98e67ed59e1d1-38f29641b0cmr3946316a91.31.1785045067506;
        Sat, 25 Jul 2026 22:51:07 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm67106334c88.15.2026.07.25.22.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:51:07 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 11:19:35 +0530
Subject: [PATCH v10 05/14] media: iris: Skip DMA mask setting to core
 device when IOMMU is not mapped
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-glymur-v10-5-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
In-Reply-To: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045024; l=1589;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=sjEt7zVED5HiiTDKACtd2anjSuOH/+nGuerIdCCDwyY=;
 b=TXxBZ2BqMAGG7mX1CbjEnNvxqlAPSN0TiUg1f9lAQu0t3F7vfKudeZS+AxNfuS6qb6gqBDoH4
 lQBGTFPNT9BDHhP4A23MEhPt6BoAPfTtzMFhc1SaHmivbzMpYkNxxAN
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA1NCBTYWx0ZWRfX8K1Ya6u7SrGE
 uXs/+Uc9ehJ9Vdm3WZKOidF/nyI6/sZw/zw7LViYrajLc9rnNoYQh++I+Bko/Ccmvga7EQL+Qto
 8kuCWYedMZKJsYw15GLC+LZb4TMAOss=
X-Proofpoint-GUID: 41XwzzRCSUUtkcOwp8rwWKaNX-OS4Zl4
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a65a04d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=2w7d1ukKp82XeiQ8bL8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: 41XwzzRCSUUtkcOwp8rwWKaNX-OS4Zl4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA1NCBTYWx0ZWRfX6jfDGZ+loWyG
 EdUzqUHBp2fhIQraF89n42/qUwgf4CAqwVHZezmXRakhwIwMqn4UBo5C1pftq73l+zo3g7vogZH
 IRwOSAwdhNFV8yeyn1fWCmureE6YA75s1zX9KqWXdGwPEi/9o/J7BGWyDZXyI0boIZykvssKsY2
 vw2kDAI1TUwxcStymvLojrtvzNlFHGbWT2EZykrFRBn8CvUzcNhQS+zfFKbhtZ3YqLIwypu+d02
 syyorU42pRbLNVHccamfWPHu21hAbc2aFrT2tqU5pcz9oj5oqdp57oGSrYn477UIOYASLMRqHu3
 UEs3zsSNP55pyjoFiJiO47nWlKrnDdSvMlA0etXB8T3ZUlh6Hc1HhLFbvQ3/ai5Qi8xg/Ak4rBf
 RKZm+yQl0XnImpsn3rNaWw3iGkT0vPPLxrC7WF1fP/ChUtq4R3w5EIb5fQXuqqh1EE2S5J2j9hU
 Ia4ABP9CfJCMBAvPF4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260054

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

The non-pixel and pixel subnodes move the IOMMU streams away from the
iris parent device. As a result, the core device may not have an IOMMU
mapping, and setting its DMA mask is unnecessary.
Legacy platforms that have not migrated to subnodes still associate the
streams with the parent device and still need the DMA mask setup. Call
dma_set_mask_and_coherent() only when an IOMMU is mapped to the iris
core device.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 2594f5a67378..c40c4ec44e83 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -310,9 +310,11 @@ static int iris_probe(struct platform_device *pdev)
 
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

