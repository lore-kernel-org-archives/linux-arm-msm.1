Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720511;
	b=OAOk1V+3VE0ot52uwtah8rHuhPCuEY/l9RthYx2cBX/uw5cHpAjIPFO9jnsM7uWEt+TZ
	 ITWYqC6b2RTvpFOBIhP4n0lg1jyZCjJTr42X+XxPLQkAMvZr74JdeZw51tDmjOM2c+Z5G
	 bdGMMOaqB+JbhwKjclgtqEtcBzqA0VzrO7jKvLz7v4EHANs+frX+lTWhJv6mH9B7eFAPc
	 VecA9xtAH8lz606OlX8Li7T10yhhmjmNqHO+2OD7axvyAWMOM3lTkD1zU2BAH3Gvo7zJa
	 REh3jEp+ILp4j8GZ3Za7JAfHezNo1fASl+nXTXU84mqo/rUh57t5Kw9M+723AnLtELA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720511;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3ia+VFa9NMumrt7e1zs403nDUUizJyxMYhZDrStYchg=;
	b=1IbO67ydrexR8gb2CAEJdYz4uKwEFOV2/XVUsYVpPczgbnyXYwP+dGj3Gl6mKOsnQ5nG
	 JIoVjh+/KjKwPFxGgX5+oPjPlCFK1Z5xR0/vt7qRgNoWh+fYDdXSgUl5PIpETBW2cH7nt
	 ppH5hdR4P53InsxJgXcYf/JhQPuiFI30S447t3KnhF6bmOWJrmfYxrTjcCKN2CSTdFUHv
	 NVMMANTn5XrbAeHjp7cPtmN5oDQwPLSoNu/B4YuSP5e6SFzPJPo6Ho0YjVJtRf0h9qi2E
	 78YTUE34TUf02CACCOzO0SYRkkfBjZ4ThYga10aoF7xHDfQ5fGQxn36MR/AXESSFzWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F9wSG5dE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OjFr8S/0";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33422606D833
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 15:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33422606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F9wSG5dE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OjFr8S/0
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EA1nD3657731
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 15:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ia+VFa9NMumrt7e1zs403nDUUizJyxMYhZDrStYchg=; b=F9wSG5dEKpdIEth2
	C3tUd3vEnog5iHrY4gF2B3HiMgYO1091yUEnHUHigtwqphzY4Qd4QeZysOymMxDr
	mIlEnjQ2xOPUBvZ4rl3krErQqLahX3WjiWdKo71YGSePS3WAkyIsZinepM3gBeq/
	W+Gb6mn1Xhdp2iifkulbF3I2CO1C6TdO8xGVhXOr4OKjWz2dVMVs0r3NumQdUsx4
	qzM/yWjVpOue6j7+ikyTEyNuKRvvrho6OWnGlFuDjlpKy9W+sZOvcs83qzB0nN62
	6SABKFaLXR9LZPicFuWEGymkuXeuF6AblPLqZHq5c7BvFP9MIaEP8cPtmOQm209X
	ahuieA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94ctfs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 15:41:50 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-154e9d2d94fso8250280c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 07:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720509; x=1794325309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ia+VFa9NMumrt7e1zs403nDUUizJyxMYhZDrStYchg=;
        b=OjFr8S/01DXfQRQRVc3jhScnCTXheXTndxQ1KBkbXTnXETGr8reGNC8WI6OsRCQ0TR
         yaeYVcoVV8LB9abdUkTYSHHZ4yoj8S55n+o8Z0i7+33rwq6hiGcXEcoLz+itvD7tPQin
         zVPGMZ3T1bOMDD3eKGUfDTLLME9tysRrnXttitpD+bFMKMHQDQTI4+18UxIhgTu/TaEj
         h5m1i0k9NX91UltuUlNqWiZKw7fFD6I7qgHuFddvzi0KitqvEQ8YNkaFMeU4yW+34aLr
         ci8zb+hWUUWRjMcBPv6fNI+Gso+5zVB4VaPMenBmQwrVNNjRmkdgpuQ584k6b1m33dhF
         h7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720509; x=1794325309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ia+VFa9NMumrt7e1zs403nDUUizJyxMYhZDrStYchg=;
        b=AN+0hkIJiCM4RFHYZcDhfkN57/msfWrsHQsykFhhq1up4i96wimSRneY8VVa2XQIQU
         HYILj9zf1/eLg+aQSwH0WU+ofzkfazxu0dq6x+A5GMVZxf7lMfpMifEerNslU1LOKI7Q
         nU25VjIEiOkI0Kg8zaDVF9YYFXxMO9tjf6l3bH8lK4CMk+3HLv/RIxjZhkMJp2RjNnTa
         SPMNCtkMfw+IiOvbcNXDHjsTkV7OPfox/JiMy9967JG+nw8Z9DcxXU3bE27A5P1xKPq+
         2/BNURunVxcHInlYzTSzFowXdmPHrZTDHKUMNVnPcyxS9V+kEjlAzkVJQpLpgM+rbSNc
         rtUw==
X-Forwarded-Encrypted: i=1; AKwUvBzaf5tjM3/v8AOKao/01EYqWJOEOty8cJEmWs6grFYusZpaFW7+ZNlj/YCtLp0usiPWymkzFpQY3qg23e1Y@vger.kernel.org
X-Gm-Message-State: APuU4Z946tWpxj1ygbgq/uACjY6BlvLlOf2b37R40Vd/GH/n19ls8VeM
	TX3ryN60MPtfUATH7gPONGw5Va7KJ2dAASuaPm/cgOsfblev0hMX/oLmZnjbSfqTf7wa9UXv+zr
	GtZeM5fWSjC+kKKCS4TcRjSGCG4aZYEKmUXYQ4JEaTrvlH2yMewyI4h22mWRK3C1y+W++w9rfvf
	Y+
X-Gm-Gg: AYBFou1rKS6/0RGHQ8NoMtFsTHsaam8cTrOsKvgBkVPs9uhmwiOdrJ72LAwQ6frAOqF
	W6hTRVUvsKmZZVCTbFRdXM1wYb8+wIKwC+DTFrVgRv5O3aXxwUWc4nxuIWrUUVhZbMM0eNGVHK6
	nR64x17QJ9ROf/adFQsisjReLrqmeEArk0063+UKy07ulRHrbpgDoly0sAqltieDeReXYinMfOZ
	ov5l0DG6WFvu0Kal+uSnEcN9pNUSJJOLWWpimBXDgxi2PRa8Nb06g8IMgeoqUFmc5xRfMrjjfBI
	ENB+NTPvRuNCL/RD1C5UCz/JaeS6Kcb5F76p4AI3eJ55KMh2wiBnXWKCuDNysb3NuafFq4RziC1
	l6jKCdLdUGYB+ew1UEZ0rooey0k+dvO1Xog3ZTyB2/DiVQAhDD4jcxJqNQ40MBwhoEvKk6HgXmz
	RDKbjWVHlG
X-Received: by 2002:a05:701b:4589:b0:187:eb7f:bb4 with SMTP id a92af1059eb24-1ac5d88c4e4mr20398073c88.46.1793720509233;
        Tue, 03 Nov 2026 07:41:49 -0800 (PST)
X-Received: by 2002:a05:701b:4589:b0:187:eb7f:bb4 with SMTP id a92af1059eb24-1ac5d88c4e4mr20398036c88.46.1793720508692;
        Tue, 03 Nov 2026 07:41:48 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:41:48 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:37 +0530
Subject: [PATCH v6 06/12] media: iris: Skip DMA mask setup when the core
 device has no IOMMU
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-vpu_iommu_iova_handling-v6-6-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=2411;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=W0ox0/dWEidqny/Abb5ZwObY8tZBEzErRhhIXnuHgYA=;
 b=9TO+AdFMbYzDAVdq+1BpxAN3ilpFQ74ocuffGj1Zul+ebvVRZs0O4uA2lZHUacaOP1R2FAP+f
 KlGURXMhJMGCqLfj4NNS/i+tr4A9RtfEdMjLESn57C7f1NeaTbBejAp
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6aea00be cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sXzWO4cmMkpvoY5_b44A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: IfFwdbHtGrAC7yHCJwPeUpssm4HMpYJB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX8bO6Ix28CKYE
 3Gnk7VfSLBvg0iQ9kzhqxAio8DGC7kkoMiTug8ftaezbZCqES16/TaVOVLAW1gaz5Dd6k0OWOfG
 DJxojmJk+3SlytkaPzRFGlvSjblwS4Cm0q/Q8QLpwUNJamRByvEQiOgOI6waz9yrKJ7AJMqNrm8
 YTjHzWao5FIOFanHPrWp/9AIg7c2HuLZ6t/0tPkhUVwOPaLQG9Xlvc7iiXvQh9sDy+2nKvz88v5
 Z5ybq+LvyYJptHtgqfRq2SPkXRmXRuvFRnLZLjv67WiUBvwfm8oDwsu8i651+Oi8Dzg5piaUfb5
 rmoaBo1KBp1fvBGZuTCbyoHbKLlfZEKg59qdAjZC4UfLjoD+NLAG1QW0LVvh9S+ouez4/O6eWUq
 +mCODZ0+sI60I8RunlAv4XnJTfm0vbhp2DgM6Uohz4vhg0NqQvF7jr9qJs0lt76voic4huprgFY
 340fUY4j6Puxokb20Nw==
X-Proofpoint-GUID: IfFwdbHtGrAC7yHCJwPeUpssm4HMpYJB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX0N81nhu102k6
 78WH5ZA75EdsSncLIEQfJ2mCSigbgqEkLD7b71xcLvYOjX8uY+C7s2FT8cWwAOXu3MrbBMwd7Ww
 1/WGZEDgGQ7BMf0JtNDKYP8B6NZf9J0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030062

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
 drivers/media/platform/qcom/iris/iris_probe.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index e659461716ba46c84d616b41f477b6250d46bd81..6d7147d73d40b08cbcd55ea5a19ec57d0738abf0 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -154,6 +154,9 @@ static void iris_unreserve_iova_region(struct device *dev, struct dma_iova_state
 {
 	unsigned int i;
 
+	if (!device_iommu_mapped(dev))
+		return;
+
 	for (i = 0; dma_iova_size(&iova_state[i]); i++)
 		dma_iova_free(dev, &iova_state[i]);
 }
@@ -167,6 +170,9 @@ static int iris_reserve_iova_region(struct device *dev, struct dma_iova_state **
 	unsigned int count = 0;
 	int ret = -ENOMEM;
 
+	if (!device_iommu_mapped(dev))
+		return 0;
+
 	state = devm_kcalloc(dev, BITS_PER_TYPE(dma_addr_t) + 1, sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return ret;
@@ -433,9 +439,11 @@ static int iris_probe(struct platform_device *pdev)
 
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

