Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950CE3624A5
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325444; cv=none; b=W6U0nzsU/bR/1XNkRfAhFOLRVa0q7hG7S/aJTvM6bFx7+0w+iZJw9KwkIlXDs2qFSzxAjwSi2LBJbUIxWSYQXuY5RH277MMiBAKgD2/x9gHIojkRcilW/lqNIveuAxXOPjogxjuHiTorfed3FEcAk7FmsejtCvsnieA0hxqb8lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325444; c=relaxed/simple;
	bh=u4T/TiBVjk6sDPMeOEWKmkDa4GYeq4h6p7YKB7q310c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YB6SVmxC5rK9In14UxlrgmQ1fwv2pGtD47omNF9cJrGmfy5g0BZwLBW5yQNqOHNC6LI377ki5AjgHxr+sJHPYkmRr+b1hwnIsP1KkYvI9r+JNjoF0elzYlPt6QJkfBD19aMBO8YRgLW3no7apgsiYwUl5HX2sMv77HlvQJvaGVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3RVJXJb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJ/R/0cX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3RVJXJb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJ/R/0cX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2hxc2979848
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6m/+51lEBEN8BFk27SUULRpvRuJnuqvGtKovB+gc4D8=; b=D3RVJXJbDMef+7qr
	wM18t2813Qyobh3pgTt3yRs0+10ZMEookR+KMS5Vf0U7Cc2BS5oEg820O77ULNKS
	5YWWOz2cfDPrLsF0qAQ9NMx7PoG9KSyMUUErzl/Y16+GFTizs3JF98Pz1mU9364z
	Fi8IiAwQYdsWRQtBN7hbm1IYOTXsm1XTovJyuHNH2N91pbzY0ZIb6gklqkacEM4Q
	dlbkSR4yUm0RNvTfJ/pydKTivGC8xdZ+SMFHAkTLEfrN56pMirvUrrfked6ft2jX
	x8D7bGmu5MNbO0v23puZ11h5rtyUsQTf7pscuwt4mU+WDtT0QpakMtTz6++y4UMh
	CJDjQA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dkxfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:50:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7443e0f0bso46292905ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 11:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325441; x=1789930241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6m/+51lEBEN8BFk27SUULRpvRuJnuqvGtKovB+gc4D8=;
        b=iJ/R/0cXCf9eujV0VQWX+ZcAl6rn82lu3iYlzxgwOmQsi5/iXDPrB47lbFmzzYjb1Z
         EY9iM3VCbz1+OFmrVnzfcKhPjcRLXqHBe9wQWwEO9djicrq1fxgrMrN8u6/MFsnlc4p1
         9JsRB7gqZTpm+MsyINkfsUKlCRRlKu9ekp0AIu9GVu7TBgNkNDHQsSw7X5cI9XZl6ckK
         mHeka3W2QiGyy8hoXz7tyYg9I0BmS6sAaL5L4lS43sfX53qmXwg49vy4cU6gxTloxVZT
         fPHfUSfWqHHH+D1G483IRObpCQPYM9Z5glJruANGZZkT0tFlCgsXiFh/ys+1OwEEvCOc
         Q2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325441; x=1789930241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6m/+51lEBEN8BFk27SUULRpvRuJnuqvGtKovB+gc4D8=;
        b=EvPrB0MRGDYsgLiPhR2XMiq+MAz4cwE/FSDiTzBsENp75QopHRsaCi7WfOabAIq0rp
         94k9pOnJ72nAZXoOnHgz4Yk2CRDaJLlYnImM4qwPrg/y9rzlxNmsJ3idFfSsybhV0w5y
         SBIn/nOs3wnwsv/6ImHgZJ+jQP/rwfyCL0f9/U2hWPu1t741WI4OeK6mWjJsL9t5qBJ5
         TmgkcDZFmFdkwbvHYsoAS07DgfUVyYwuoejUsWEMF2jT7hsfGs0W1ULPptjGUzCoNpvs
         M2fsnxYCDuHft4T1q7ZM6W5YZIEovEH5JjiS58nISqJ/FqfXqUOOH335cAdJlBYe97gz
         vL+g==
X-Forwarded-Encrypted: i=1; AKwUvBx1a7cpgMu0ADD4Lsg50GT/66k1dVu7mEIzxRpIThc4kWJ8fOvD4C0h+TGZNbp3qqXjnrizLZLdG4vL0mFx@vger.kernel.org
X-Gm-Message-State: AFuF++neF8J1aSHCtered478iiS1LPjyVicxdmSBlGP4X5SD4vKoqiln
	9rsWr9UZsqtyeCmAsgbrPGIucsZAojG3x4OwxXN5ba/IkVYp8B0y31DRlBjGkfyMfF/0zyGn6Uo
	3uhdbb+cN30A6/DPW7zaaLaw80hUXzICx0rC29tY0xAxZbh77IjB+5ziCS8zjer5nWm8W
X-Gm-Gg: AYBFou2qhp1sBytPJjE69Zp0FoQ/o1JSZ/LXITJvZeIVNFLSI5m+krA0O82MT7wZAn9
	xUF6Yz0kWTaiGLz+OJo+a4lycJaJdw/68IANKPOp1bC+dEWBWcVglx+zhtRmJQopIbcY4RdSzJ0
	F5Wv+ew8YzjfeQVwe4THT8P0gKOYnz7l1BvDwuGORVNles7CXRDFTItEpDdxJZVP+u0/QfV5VDx
	XofBGt+GmT1fRDmXUPz3xeb2tdka6KACN5Gqwh+N9cibgzKiRJxI0KxCGLIkyHuZOBySBhl+azB
	ED4D0cEWwqxDXIjOJTCSOOFLiw3tQHUyHq0/Z/eoLl1+9Xq54LzaIZ4Wloa51EAGP0RqTkqaHqr
	8S20A054xPtiEgJ+8itxix6eKyjPzR4F3au4=
X-Received: by 2002:a17:902:d984:b0:2d7:f0:896b with SMTP id d9443c01a7336-2dd2a33648emr270824235ad.13.1789325441449;
        Sun, 13 Sep 2026 11:50:41 -0700 (PDT)
X-Received: by 2002:a17:902:d984:b0:2d7:f0:896b with SMTP id d9443c01a7336-2dd2a33648emr270823745ad.13.1789325441023;
        Sun, 13 Sep 2026 11:50:41 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:50:40 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:24 +0530
Subject: [PATCH v4 07/13] media: iris: Skip DMA mask setup when the core
 device has no IOMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-7-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=1806;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=u4T/TiBVjk6sDPMeOEWKmkDa4GYeq4h6p7YKB7q310c=;
 b=b/OU4xVwL6Uy7p7LysRQLTjOXu92eavws+64eXUu0+bfYdoL+0OiwJJs9umzBS2comu/vew0g
 KOaqouqlj83Cjk5pDwRP/ocj3Qz9nsLuMW5i/1KTFwdM2q1Dnx7kpOk
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: KbtVI8l2LXagZGVLIVGKZroYfHgedTK0
X-Proofpoint-ORIG-GUID: KbtVI8l2LXagZGVLIVGKZroYfHgedTK0
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa6f082 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1uU0fEruEEfCXXW2WGwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfXz9DHFts/jc7T
 lAW4ulh/aNZQNrsRtqkMaex0vb1AqpefSmU4/vAU+VVQY2hTPd8naBP4KRxVmLwdUbufasKT6M7
 ImhCXY2ST603bLhK6ga+5wIfomx4XUs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX8U9HGeLgsh6m
 GAaszC2zlNgTJVz0QkN5Lk6WfmFasoqMnNTbPcCuYmJgE4svjFVQ+RxQIlGCbU2I4dkMEAWiY/Q
 ybF20ecSYITGbsWbjPgaStIaSRsyGKL2qyBJ6fH90GwkHfFHaICRyv3cbZpPRlDe7hGFHjkj00O
 ScVUjC+M/nYAha8aqIvPzTb/U9wo2yn/fLXCQHGNhsReRTsAZvtKsb4tKda6wZWYEYZ3zPek7m4
 viRV1EeuYxwmSTnf2b+gJwIL4Pc93kuUkA3LU5aBrIZrj5UwhLRuTAfcLXk4fYKH6sUKxI7m7Gk
 8yco16GAkEaQD9wxHU61HqSVei4wNK0J6co/41M8vDPyFiw/VN4dsmN1l0IsNSVam4d0wNpzfPF
 buWpXHaTK/Td9pxUQTg1XiEhLBg4dlq+GGI0oEiAKYenwRNBEzYQ/KA+AxkW9MpzjVBAZyweo92
 +mwnk+qTUQMCXMZjohg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130267

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

