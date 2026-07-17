Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03D131E83A
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264453; cv=none; b=kGml/thhxT/82pLLvIQ9OwlRgoidoh3xKjJlOqdmytkJpqfVx+uQoK+mRtXy6knI+3vyHIX6OpevsmsNIhGHA+npJsv6gC/j5JXZpG7iV/EVc85cayd5NxKvyV807OMGJL8gl+gaRWLJb4y8d5n5sfWD22IFn0wnbh+eEFZacc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264453; c=relaxed/simple;
	bh=FKd7t1HooXBzJUHJ85dSD8HNImwfOLliShQOJb3PVNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YbMk9k/iyTQA/1jePSe7SlnVqFj9EH332PRwzX5w5TR1/WLih+/IPRg6eTAvy9IgxoU20p8HHYF+sNSXQuYKWtjAgw95YurYHq1yn9J+sao2mt2lqObxVeUHTG1azCv25NyoZIfc+F/CR82zZkR+aXNDXnsKyP8pyxGrPqBloUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKJHat0h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhCsfNWK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKJHat0h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhCsfNWK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33tYE496406
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HWoRzm7upRQHHZ535jwi7q
	OmB3+33RqDl00cs92ra4U=; b=XKJHat0hLXUlR+eCikK3lhtXUZnGQ8YdhKjweV
	R1KdanyGKPKIdEsKLYXZMAjZo6FGeI9FmqO9X5s0sPlhnvQFvWONgFrx7FpoWXKP
	8g2PNEj0MMkLSeYnGkadT4vdfn3VPU2UdIjy1p2DaZq2cnM6UcqXwMiAtE3cFgR6
	qT4wpbisZWO7TGNo+eslExdy6rfWSIT7B/y0E8e6F0ZDo9uZehgT59umu0uoJh/1
	48XexBiP4JWYgxCmiIQZT7NbqM3CGzpsDmn8n74TZHRcXx8Zhac4AFHPX76giXWZ
	6r8Di63vf3r7AYnxyLGOQbcu8uKs/HLelaXpPAH1PB71VLgA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex4nc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 05:00:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84877b362f6so2435881b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 22:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784264449; x=1784869249; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HWoRzm7upRQHHZ535jwi7qOmB3+33RqDl00cs92ra4U=;
        b=KhCsfNWKfjW7shrb5YGL0D6CH0YxJ/e7RyblvWYcaHdOSeT+4sR3wrBouiVmWT7MBu
         COdBFR2J18IgTv1mjs4asKN6aL1Up7oNFxob+rFRuNALz2oabIFCuBBuQe03HPzHeZAO
         qJuTuf/oNOkj1L/mZKwK3VVvSVGaGc5FuK8bOQJ5PxbEstLGhYw/DKeXexdVS6fevRk3
         IxdQ3afcT/XUiYz87RMYk1XaaeTr67p+OgfmL2H1YdGC+AzCRo6QGszBl+h3cSi40SB0
         xPhfSV95fl2VdrVhY8/EcWJzMzkV3sgrm/9OvdkmOTcF4KeYpSvvxKUrNtJFa894v9gG
         YCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784264449; x=1784869249;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HWoRzm7upRQHHZ535jwi7qOmB3+33RqDl00cs92ra4U=;
        b=OG370b7omVVcgxUZj10Cc0d/MdfXKyJvgbuKF7XEKhB8zCFLTho8B8Ark34Ldnlm9Y
         hjnMiUCz6U7BkKMZad7Tr0tPFUlzy5J/Iuy898p4qsPrK3V7DcA9oLX7nlC2NZOOYnry
         bEWPqjMeIzfQjowj/abd/J2awotYU04f4WKu0kLj+jAXxiM3+Lw+vSWXieJuFG6RFxj9
         JprBgzEdGn2dZnpB3RW3gT3TZ3zKe4Rxv3RNfkGRy1iPkhjxfJN9WpO8rit2goxB+0LE
         zQylh1i4GOwVPZ8yfi2VMub6rXzXdUWDZPLAloZTtswsQcuag4eaY43qfWlfhVDxHOi4
         VZNA==
X-Gm-Message-State: AOJu0YxrdCPICQECqUf5xSBCxvwSU9+BQLwbvtD0+/VRWdRTZ6INJCp0
	P+u72URyodF3Fk2uOY6GIf/zkT6c3JfWN64G2M4YKrO/uHoFSqJkqbcWNvWhegeuQa8QzLSCmZz
	x/Jsf5vQvUPMKCV+q1htS0x5d0U6uAu4CnFkUtvmXeXykrrAVkYQ37QZEbTg6O+8jyuuo
X-Gm-Gg: AfdE7clRtHwvKzYrnHElVCWl5kKAfDfrZgBQ2t831p588TZkVKyVpMut63C5hfz6pua
	UHuPc+I6BsMuuMTrbiObpCwAxLi/1lBq++y4+3Ol3DsUhO0kJS/oio8NUrm9faRxq5kPD8nrHkc
	nLTwvnvGsNwSFm+t7z/A0TICv7dNvqpH8RcXZcuq5g08dBTtwdaNdzWb4im+TYrCTfhLVldnvjV
	N+o9au85IbA0bU8DqsB/zlJGfPp+jz5nU9nOEqycdCcCJbpah7sbJ+3r8fGhFNWsM27npF+i59O
	koEbGGqb3SM0+/ZIDMFJ5LGd1HyD9NMz9w6HijQTn9SselY1xSqg1H9CVlIbKu3DzGEGea1qPGZ
	GTJK2LdZX/HDzgdcmF4c8fktNb0KQqBnJxVpC
X-Received: by 2002:a05:6a00:76a8:b0:84c:2d22:730d with SMTP id d2e1a72fcca58-84c2d227e71mr230656b3a.29.1784264449230;
        Thu, 16 Jul 2026 22:00:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:76a8:b0:84c:2d22:730d with SMTP id d2e1a72fcca58-84c2d227e71mr230622b3a.29.1784264448749;
        Thu, 16 Jul 2026 22:00:48 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6e9a3sm244609b3a.41.2026.07.16.22.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 22:00:45 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:30:28 +0530
Subject: [PATCH RESEND] dmaengine: qcom: bam_dma: Defer IRQ trigger type to
 device tree
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-bam-dma-irq-trigger-v1-1-6405eac86f00@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784264442; l=1659;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=FKd7t1HooXBzJUHJ85dSD8HNImwfOLliShQOJb3PVNM=;
 b=tE8VbsxxjQ29/3M4t8rEtFvuMsat8ifrogQZXxtK+xgiqln8sPdO5sAHK+YqYBbZJ4XIdarK3
 jci/wLBWpfHAEnE+oJJTIM3XXjU5B4abGV8nDD5ulUbc/7y3sSK8iTF
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a59b702 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=l1n8trSoVLBZuIMzfdEA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ZM1g0snXL6B6AQNlz3axI2nKbjMwBNzS
X-Proofpoint-GUID: ZM1g0snXL6B6AQNlz3axI2nKbjMwBNzS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA0NiBTYWx0ZWRfXz5lL01zxiN+Y
 zc6+T8TO8iPvgbCYUtkqj0C1F9+wbwBRxstKRmBiLUDGPLl4YL3HYJGI5Sd3ugjjpvJuYJCzGYE
 FclIO0FqBTlPO5fgPQV641DIVTgglPo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA0NiBTYWx0ZWRfX9VFxAmj9ne1B
 MuGIq7dJiyFZkfLHCkf9qSSCLncPc7l/v0cIiPVXE819wbGU9zwNb39pPjcjRXN4P4tYeZD4uoL
 4uNVAk3aSjZ1rrVwuNCYyfMWDjm2YEZ2aJjiTADeqhB3TbQCFrTKuvC4FlhNJ7chudksrJpVNjb
 k7xO/+0rPTrEVAuRle0pTTuTpwfe40AV+l4aofu/yUdklpwhit4i4ErXoBkAlDY+WONYeOWQcZq
 B8WrM5NciGspDbDS7daBnvrYqiGSx2JFZ8rqpdvZulVeUPlw/86aDMA2Yfju1q8tPm0TKyRArLd
 CO1zqKJXGPW/FvXYhd/bK8tmLL/KoqY8J0mkcf1qfIU6RhDbG+rX+90IJJlRVR3RBy7YfcnzFkk
 1ezgPekGgA6pwgwUNby8JvrqGSmDpEMRH/MdqS4S5lAekmh073lIjqtM2PPToJCxQt2Ke38PpmT
 89Ba2Ch8TPSoS45Urpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170046

The driver hardcodes IRQF_TRIGGER_HIGH when registering the BAM
interrupt, which overrides the trigger type specified in the device
tree. On Qualcomm Shikra SoC, the A2 BAM signals an edge interrupt
to the apps processor; registering it as level-high causes the
interrupt to not fire, resulting in missed DMA completions.

Use IRQF_TRIGGER_NONE instead, which causes the kernel to use the
trigger type already configured by platform_get_irq() when it parsed
the device tree interrupts property. This makes the driver
platform-agnostic.

Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 19116295f8325767a0d97a7848077885b118241c..6c3e2ca8a572fd04c925de0adbd5cc0616b361ef 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1303,7 +1303,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		bam_channel_init(bdev, &bdev->channels[i], i);
 
 	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
-			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
+			IRQF_TRIGGER_NONE, "bam_dma", bdev);
 	if (ret)
 		goto err_bam_channel_exit;
 

---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260601-qcom-bam-dma-irq-trigger-0366e7e86f17

Best regards,
-- 
Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

