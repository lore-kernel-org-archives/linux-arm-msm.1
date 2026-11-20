Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173109;
	b=XsHrqHrWIBAu65m71my5OxAgwTQH5MT7j9q29AcZK8lM1mNarxXXhSLbbj0NrTpopMJx
	 JIlAWLUCqPLRGQI7x5N0z2qPNGqTWSm8N7gWlzvM2/Pf/31EPIPvRT/kwFJfq0sVrDMgo
	 t2O3t3h4z4SnX8nhVcS96/Ob5pJtlZi8My55j5DQd2CDbd8CTSNprsggjLaP5QI91bSod
	 1yPeTTgmexxTvtm8bHg9/+LAA/cSR4gAg7LtMCI5/Oi4vWNckOwd5argzsUmpjOW2BHMe
	 dywOw/MBrGBqpdkW/HEdgfhZqIN2r8rFt3Mptwek/CM3/CeaTp8rYEgsvcop7B5W5sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HGtGaayd0E9HBtS0GEqg5v1q2maa2MdBdl52j7h6Y+A=;
	b=ue8+vQyN/btLDlcOQwceXH12VwSQ1OM/icFY2k0DLCClQMcWkDSjxiiAo8FzaodafM1t
	 cWRdpP8FjBj2yeLZZEklJbU3up+aWygDiO7xGdwoipxL82PJBm+PUBqXNG9Zso/i03zc+
	 U6SOqmmqE55g6YU/j27Q5bjdxpaDkRL9aGhCcQk0RbcLGdP5MP4JCwTf1vGp97OH+ZZ1h
	 IaqZMNAdiV3zRKe2ciTJ2wEp/bnY8lwS17Tue/KU5w5+ki/J3oONY6PoLoaK7m7zdrAaT
	 BDY3EWa2fFfS35IWeXoIuBbB91VmHp0g439DO8Hmgy/fWzGXZGH34VpKHZ4jB54DQ3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="aMEv/0z0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXrmdS7d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3632C60A262D
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3632C60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aMEv/0z0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXrmdS7d
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjra41681907
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HGtGaayd0E9HBtS0GEqg5v1q2maa2MdBdl52j7h6Y+A=; b=aMEv/0z0Wq6jMD+h
	qOf8TsJW9R5TvvrS2KDkuu6U0pPONqyHEqa4rcwCfBctzA7CErsdDzbr2iGFBo3h
	P3i0sX1J5+yzmtQcwlq0xr6WjDwqJi6Cii3TdLmd5EsdzqcecehGzkuOa1nLH+ja
	Tue3d1vwYnCJ4s9PhgBYasZuMMRgtB+zCSqCbXE470iH3/g+TQlsPzWCimKwRZ0A
	s8KtED3RmpH5h/y8xX0Y9aAV9DiLNZT6og6QCn5FwibdAjVIPsx6QJlkTyAdibxY
	tl7500xx+o8xsCyRDg2E5FczOWbxQZ42M5p4/4DwWi4WdkZPdu+JIr2q6u9ylR6H
	C1Lk3A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1t4gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:11:44 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a5005fd0f8so1526700c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173104; x=1795777904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGtGaayd0E9HBtS0GEqg5v1q2maa2MdBdl52j7h6Y+A=;
        b=EXrmdS7dhBq59kW34bQf4JgAAKPcNL6+GVUqOHH8mOApmPADJlitDo+j9EcXYkDuvu
         d1JnPWgsqrl+CyQCb47ftEVVq2RHtEHBa6Nk1xGJTPo4uqp/JOnvwQns3XVnpq7IjB/N
         TuGp6cxc19dtiTZ7K242P7rCpFMkOaYdh+B+aoy0xjbQhhi/s6aC/3cD95j9ED6NSQ73
         J7MLNXQF6ulowL3HFoHg7FSgR7P5Twn0CP8PUuYrNogij/v5v/qGJLX0xwzqTif4XOqB
         cyA3a8LRhZ14yjXW1ij7dWZe2hsgtI+vvJ0PFLiUv3WAO4D8zLm18PqX51DU/BNZazK5
         pEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173104; x=1795777904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGtGaayd0E9HBtS0GEqg5v1q2maa2MdBdl52j7h6Y+A=;
        b=XjpLK2J8fs9nXpZ0PD3Y7kgVVNyWAZg565BoSTpevAVvQcTTylobdnYIrp7E6LU1bk
         cNfzkpUtv+i/5yHf/YUKwF9eEsG+5Z3bQkqez2idCga2KWwdJa5XOIq4Z0HO5T8nna6K
         5/xvTeMFTiVwE23h3msfUNyuXE25eleHLyvL/gbo3gwKMpeFf1YFpk/sl1jwN59Tggp4
         wHrDRj4FC64ETi2xJIoDN6FYgLzSdZkxok2W9vKjHjN1+NEYz95D7Equ+2Lx9CIf97DC
         3gmiZ/yqMqJjw7C7KoiFpVRhOV/LD42Pr5WbsLmcbT1R6nvnegLqcT2xB8O+vH5HE1I5
         G3HA==
X-Forwarded-Encrypted: i=1; AL+hErHmGwJDOdDp26/guv/iWEeU9iEZppTGP6RD/x2c4yDQ1JJmHkBemjDWy7g1LP8cWTTAXgLas9ZPrdULVvP3@vger.kernel.org
X-Gm-Message-State: APuU4Z+Yd+VSoer8FRZTGd/zxwas1mLvnXGQmxeI8YF3F5RZxK8gr/VF
	fk/eQ62ROEsrXznBnCNoZE0x3B3ZMs2d9+oWBegF01OJTI84w3hWkjHA7RqlkoC6g6mqZBAxiD6
	isdFwEBEfE4cRritdngh4L/snn2+OLG5N/o1mrt/kwZJlOOs2K+ot8P3aGk9fat+Bx6DO
X-Gm-Gg: AYBFou2W4H/q7R1d1n66KIeEDvM7zQLfXYyFIDOcXPaHd5Gnn1I77LdPv0yBCT9kokG
	7FdiAQ0MPOalVf2OqkvhB2ReuNi3gCv+/ZbZ2i0/KaObVF+mFzCfuKsTXxqvpNTcxtYuJBdaqrr
	gvLSbp+vXTwC/1Q0BAS49+ZwSHFWGgQ5LRHyw6rBS/4xr5rgkY6pCw9m43KcW3JRwXCx8AHpj4D
	ppNRFUMfV/fRCD5/pXS21HWT/BZxePrwVh7TR5PphPxFDSu4fpj0667ZFjJQ8E3VupI65jhqHRE
	cnuT0I6q4WsodlQ1Z4W4jEzXnyt0GUKhMjn79ENDIASMFjYryHxZN2uc4nr1S2kdoPIPAbdCYQn
	vMjqYNDVKjY9JmX6q4x0hxI1b+syfCnExwYTFCr6XMUOOBJW60ruogRUArd61SNa8ofEEtDV4cg
	hXF5iM7J2d
X-Received: by 2002:a05:701b:4558:10b0:1b3:b4cf:8f18 with SMTP id a92af1059eb24-1b556926cfbmr2721990c88.41.1795173103685;
        Fri, 20 Nov 2026 03:11:43 -0800 (PST)
X-Received: by 2002:a05:701b:4558:10b0:1b3:b4cf:8f18 with SMTP id a92af1059eb24-1b556926cfbmr2721965c88.41.1795173103231;
        Fri, 20 Nov 2026 03:11:43 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:42 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:56 +0530
Subject: [PATCH v7 06/12] media: iris: Skip DMA mask setup when the core
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-6-25a771235a7f@oss.qualcomm.com>
References: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
In-Reply-To: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=2500;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=RvfzeV61l7S/hnvptS8fij/ea4XXJ24i3aAWnoz9sOM=;
 b=xs+3rtCaNSKwGZJh91t7uaKMKfh3W8y4e4Y7piXyN0lUOY7Z4/t8ieKBgqAc5eKgkcd3SOGK8
 4eDYGtrMe9FDFaRyCyKr0wCfru/94H9uv7qZAcVF9hSjW+FC6F/Kfmf
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b002af0 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sXzWO4cmMkpvoY5_b44A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: Bxr61FT7lt3fMs3-gZOEVx78cMFBAZNw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX2EwG31u4TLQO
 lorEpR3W2U0Ti2b1LS3eGtOScwUk7EsucJmlbyc7u/aXH/a7eif079OQR4mlAcqZ/981TNE9Zkw
 FxLXF18Qwf95bigWcgdXrS1FTqfheZA/tg5XM1op+87NAQVgr1NLreccY5GuS5vivwDqwjVJkTD
 uM397Z3cpDdFEAba5vIKUnXLdmsV7ehjWV3ZrbuxoYWUWPA4XLXBG+A+fjgrHmyrpq36ZEJa+zL
 2j4xug5Dh85WEE9S9zaUcz8ERypSdJxnF0JVS/cBekDXl1snhcCr4zBmi8DRT2Qlj6rf+ZM+0sk
 +LkKkUUZMi0qtPLLRZ2LBvG0Qodby3qH+J/9PCD4viZHybkNB9s8B1AfUDTxu2OQ94YgHyhSgzp
 nkJNLN0zrw9bo/fO0NJRDJskomGnmLWsQcJfqJiGaok/f4UF8RhjQV/SqeDfUd3MhJmEqryJOuE
 BY4hLP3Cx8bD6PjM93w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX7wIBF+vJkqU8
 mHpCe+XL5U8lb3A/RdaGmwUn9K784OrucMvkLIi0xea+FZXjvIdoNFkVc8ywrR5me/9SD331bXp
 F5GngD3PhSeEVguxesiAJ79YupKdndg=
X-Proofpoint-ORIG-GUID: Bxr61FT7lt3fMs3-gZOEVx78cMFBAZNw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

Once the streams are described as context bank subnodes, the "iommus"
property no longer sits on the parent iris node. That device then has no
IOMMU domain of its own and never performs DMA directly, so calling
dma_set_mask_and_coherent() on it is meaningless, and on a device with no
IOMMU it can fail and abort probe.

Set the DMA mask only when device_iommu_mapped() reports an IOMMU on the
core device. IOVA reservation and cleanup are also skipped when the core
device is not attached to an IOMMU domain. Platforms that have not been
converted still carry "iommus" on the parent node and keep the existing
setup. For converted platforms the mask is applied to each context bank
device instead, in iris_create_cb_dev().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 8b45a062a510dd0e96824e90d4398f9ef9294709..3c6c170a3d75f73b55d3abba0c6c8fa0378fd498 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -156,6 +156,9 @@ static void iris_unreserve_iova_region(struct device *dev, struct dma_iova_state
 {
 	unsigned int i;
 
+	if (!device_iommu_mapped(dev))
+		return;
+
 	for (i = 0; dma_iova_size(&iova_state[i]); i++)
 		dma_iova_free(dev, &iova_state[i]);
 }
@@ -169,6 +172,9 @@ static int iris_reserve_iova_region(struct device *dev, struct dma_iova_state **
 	unsigned int count = 0;
 	int ret = -ENOMEM;
 
+	if (!device_iommu_mapped(dev))
+		return 0;
+
 	state = devm_kzalloc_objs(dev, *state, BITS_PER_TYPE(dma_addr_t) + 1);
 	if (!state)
 		return ret;
@@ -464,9 +470,11 @@ static int iris_probe(struct platform_device *pdev)
 
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

