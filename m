Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D019946C82C
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 18:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522190; cv=none; b=i3+K/qv+gdA7xlN8p3GOupc1kdWkknH4BCY1s+mSZk1Ks81XKkS5+ubcWsyFgKzgwLPk1Hcz4aONZlgy/X6D8yJqaKszUJi8q7ka3GY6QGCpIhPryygRLbTeaqATIIPW6gwwPxlUT8N9t2b6UKqbJVismEafWJFK/tRMrXf9SrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522190; c=relaxed/simple;
	bh=ABWnGsy9J/aBpR3bz2vspwGz7dNQEU9mA02+SM6zBCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mh/DURVlgOnfsvzYAoswDVinQVVpr9tUQvk96ORJHtilcAWZsZZwLg8rdNjEpFSAzPR1HpUL8hXXr81JsvLlCniFvwYJqPY34/cqGITSAMUR/z/ppWf4QPLEVxRG2ftc9dJrApa+LYmUay18cyvNxo+pNGrXvWoDr2e2Y84YB7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LhxLBs9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=easArrJm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhxLBs9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="easArrJm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFNvnj105911
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 18:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gyNScZIZF6mo/dgFtciHSO1E8I13BJdXx0ih4EmXKGs=; b=LhxLBs9WJnlSuGS0
	uk/cmOeGQ1McHr3PHiu3Se2jsuayO8eVU1ejQ95m6wqr49nNIc/HkGvxOwBuwmb8
	mdYle8x6mvIuvWylhFX9vi+1ZIKv/fXe5SUbAc2kQ/B3lLnOrpbtXJIQpCb5w+MJ
	IphlJlJgpwXBrCVMsAlnq94mfQ1y3QOpGzRXg1nPB66pAtFwgc600HjqhKPezknu
	hkOi0N/lmtc45YbaYeJerk1WJkcp47xGwuTSW6gMKawzS5LnLYOFvVaLm5+XzDj4
	xO3MO6fzJbk1A91b/QC0YYPDAfrLLvpwnkRkfEZbR6rX8l9hrEmvYAtRZqoL4F+e
	LIBopA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru2u1u9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 18:23:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab041eced3so1887260a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 11:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785522187; x=1786126987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyNScZIZF6mo/dgFtciHSO1E8I13BJdXx0ih4EmXKGs=;
        b=easArrJmmhOZIgeoW0K3EIsarpwxqqHyG41X0izIl2uwEF+f9nBOTg6ao8OEwcSafX
         VYlMuDKBgLf7ykLQn9TWTllQFRwStSokZV3xrkGfHC7+ZVj7bieptafFIIe2CUAkq6Mg
         y14YhVL/Di8pj3OvSh2ciPpWEDx8RzIlC/rbl3Ebgv7KPjtFT0ykZTRV2VqnVqU5ENBM
         Iyf62rTomyiBpngtAUclacbCbhM0DdgIIC+N46SyD2PmNElDOeVlHRX1gxPreiUg0wRv
         1BIWOg/9BfA5slZ0w5r30c0SdIyLBEN9HiXzHO9I3GeE8ajeXCF7jVUqVQtRDhusFft8
         0iRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522187; x=1786126987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyNScZIZF6mo/dgFtciHSO1E8I13BJdXx0ih4EmXKGs=;
        b=aNxXrpKIcuma/+qwmj9s7LVDiV9/nLcak5TlIlDlauiLZUcbT3bTgu3cHoKTLgAbaw
         jNGePer56vIh7I+QTgWuSTiwiEi7uSL3rcHM3H5mTMuxUXIQ3khC3S79DwlPor+bFoQM
         1f/3QeITD0MKSB5WaHDvFtOci3xP3JD70RuFnm2kZRqWZk4Z3pEBeiqtxVlM+CvEkKIf
         uO+WoOMblMpx0Vz8KVOFUnvDpaizpki74QrBs8BFt0aViCduICGWZM6s9TJIPedFEoJ3
         eOn7JqmQu61XYPMIe5GMCp0f9xhqSv8N+ycrd3XDF+2Q/4E2l2+zbHVnNM9FFjL1Z2W8
         lyIw==
X-Forwarded-Encrypted: i=1; AHgh+RptalhJaNIug609BVRHD6SnK11D6h3slZVZwHfRap2OUzKu+5z6SdhjpuUydsL+N1MQRyhj7+n8NqliFDWW@vger.kernel.org
X-Gm-Message-State: AOJu0YwvI/tz/92npKE8PHOj19juTZ8EopCwZBRyCyFS0Z1HWiXEzuZp
	wbxWd1o2AfigNJCwvOlfommS7MzStwYNWPnJATcmi9NTCEic+8pmgIqdw+HvZiCDiSuDT0Ctfm0
	7MP5bHUJbJ12L0b/DkdEdGll8lgYVgoOM+dBQtp2VPz8nneMNkHtKo6RBZArOtE3EL7z5
X-Gm-Gg: AR+sD10eQZMZxxZ5UYhyU89IFBwOstjtMkP2u16tWJNMYTSmopQqbnlNuZlTNesdmLY
	Tr8CMSNpmqMfsq9MaIAsbdPrWZAlbOc4HvoVxVIBSWtMfyHScdVo3e5pDnmfHSGN508ugtyGY9s
	jD8oTeZ9RuHSh51hzyQkdL0eJLHQUgGySnyRaxo//Fw8YoW9CM7IELnoMLgeyxMOhaTdgMCR38h
	ym//GNnqsHr0VvkKSv+Uanaa4bB5j2G0RIgIPcCLUkaXAJj+Hap4Fghnoq++3QSbsYJ4oHvgWST
	//aJFjgPkfxmzKf9aCmuO6MYGuHZs/8K1/c2oQMioMZINs97FJg9d86T/PmjNUCalcR8pm9KklW
	DSumHgW14Od9kIJ/Vwog+I+ZA5GdH3oqmTCs=
X-Received: by 2002:a05:6a21:998c:b0:3b4:b276:a789 with SMTP id adf61e73a8af0-3c92a7bb473mr770777637.36.1785522187558;
        Fri, 31 Jul 2026 11:23:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:998c:b0:3b4:b276:a789 with SMTP id adf61e73a8af0-3c92a7bb473mr770767637.36.1785522187182;
        Fri, 31 Jul 2026 11:23:07 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04456dsm7203089eec.14.2026.07.31.11.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:23:06 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 23:52:21 +0530
Subject: [PATCH v2 06/12] media: iris: Skip DMA mask setup when the core
 device has no IOMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-vpu_iommu_iova_handling-v2-6-da52b5228dbd@oss.qualcomm.com>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
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
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785522138; l=2020;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=ABWnGsy9J/aBpR3bz2vspwGz7dNQEU9mA02+SM6zBCk=;
 b=BBD6R3QsRS6fozOLoKfFWE3T5NkFM1rlNqFYFJdcwqrSf2O+PaAs8EACW74TtFdD48K/MoISu
 8Z2GdTXWrYAAihSsbVdpgZG5wgdUIfHxNeDWpDYE992i0IdCOwIf9mY
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: tI9rWu_3UPrXejn1rZLmpq9DJldLc_hK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfXxfIJRlvi9HNx
 v0HQ3EeynZ9QyI4Q9qR7RXeFXZy/0ncnt99WWAvPNIcuF8YVUP7fXbV3NgOA1tlvoy20BmMYp5Y
 DVRbhyzyjFfjgn4XoKOVyGB3mS+orL7W5AUwFra8DA7IlmB3ijxsYPLhgneBYkeaNgglDGIf9FO
 ozHnCGOCxro9Z/lzJjRXP4KkYaAIW8OQiM0QiM875ZzuACc2fj5RBed4SFizG/MHUCVUKtnALh7
 oiCiAGF5nmGxoB7HnecSc0pPZasetKg9Q4MgxT+drWewa1Ibea2w7MdnMygVEdgkrWIrlJKl5Dx
 VbkM+pPivfdFPkzQMrnn50HAqyI1j0hB3qMsVFAbzRJBy/8CaFQkYZVvfDHxquoYLgHF0lzehek
 3/zLQ/4xFnAKWbLp6ClDLRXsxCPAQzGeEQMc9U4xDkvQu0PVkwXXnFme0GMsFv4Yb1GgrrBz45+
 Op7F5EtWsuqeDCO64Pg==
X-Proofpoint-GUID: tI9rWu_3UPrXejn1rZLmpq9DJldLc_hK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfX28W4TZKh5F8U
 SHVxtWgU74R6WQJYx6gE4cZGOVeUB9L4pI21BVd3IxQIYb4RNdXXPI6ANljaqBaPidVoVOWmADE
 Ms9vuUPOKmZZKg7dQ0Uk22icWnIsUsg=
X-Authority-Analysis: v=2.4 cv=b+uCJNGx c=1 sm=1 tr=0 ts=6a6ce80c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=rujDjMnGqJPd5R0KWf4A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310141

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

Backports are intended since the first DTS of 8550 binding schema.

Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
Cc: stable@vger.kernel.org
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 2594f5a67378af9a547f23dec2d2c057506dda65..c40c4ec44e83e4aa212b58a19b64d46a3d9f16ce 100644
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

