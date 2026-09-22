Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901944E325D
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 21:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111279; cv=none; b=RatoZKfS0guLMEUAf86JXzvzuHFFDhTO/9tnXlTxRfxHZOxsr8UQRHpqeFbprqcaViRgVonHiVzYlIOP+H3f5lhAFtYpUG+PH3CWylo5/ejq7ba7Bg7NB+FW/f7+pXVq4DK/oopeE1pvf+6bWw5Q9hCR7qi+f6e0vrnu9CcEJmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111279; c=relaxed/simple;
	bh=siu2NmBy5DQbhz0/hxEEhSyI3TF+Hjy1gBfEQXSBmu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=og0+VS/akYwjtVpLaOewC6Y0FIYPAHaegRNbOuwxhPN4iiruzIHBrOvaZZKKPEz30kXRMCBa3pUBTjMJdHp/kJxpTG6Y9xs7K9H6ZOd+FiKdORVRJStiXiYkOo9nSUw/IsvYsr/3iBvUSa0dCwvxIWfM6fD8vXqEC6DrqthDegs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0uR6VdV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j3KzrYKh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0uR6VdV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j3KzrYKh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MIXNOu268290
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 21:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GRhVuw1RSgnIa32u5fRK1kRDINDhiOq6vnTmUUZBPE=; b=j0uR6VdVGlmzfMPf
	YAvgKQrcX8Jjc8cjX2Oy/gM3acy+lkGcJomen6ybw2CmMkwnfdRUNZ7oltJe0wXo
	r/K8H5wKLSh+N7LmNolbxRjmPnaOkxKc8FQcX3fvhinMzFlEo66nhWoKG37JxVuF
	Q6l1kg3NNon5+zcXPAeJ73X7RuenqRLiinD2JC34gi1TcwgaTKU9VFjR/yMcHJ5X
	/hpoFpFTuwcnnBuqwUsAcQH49Wwgu2znxrnuflZFvh34bEY8OZr0z8JWi727OXOa
	XMbzMRfm+lY+FYTKuQqTRdzvi6L6FF/Gs99Pg4ccXMkx/yelK8/kVC+DAe4DfNT2
	jxOYTQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c0s5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 21:07:46 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14371f7ba1eso351230c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 14:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790111264; x=1790716064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GRhVuw1RSgnIa32u5fRK1kRDINDhiOq6vnTmUUZBPE=;
        b=j3KzrYKhUK50TPEoDSnNEgqIozEpGoOPjMmgIQxFNem0pzwxNpNUV/z0HacLcQ3fcq
         kaA+eskhXLmrWN8mPHkxmrZebeMMjCQg6pXQ9wxIeOtuFk7fRsQhAXQrxAD+l1jlKkGF
         xk7P62M3OdQCerS5Y2Kplnf9eEadEXmodww5P4Rf0+FoLbjtwacmaruUNbDnFx9i9O0o
         dVAugbjZ32MaIHG3J78jAOUP4n6tDxrkOM3m2Z67jyCG3AyOWUCiRieB2vmkVwXfY2QZ
         6kf/oZhscngVhkAUVqoUqaQVu/tox2lKTzhMGubu+60jOVnym5XkQUEYem6/MqCEcK2L
         kTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111264; x=1790716064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GRhVuw1RSgnIa32u5fRK1kRDINDhiOq6vnTmUUZBPE=;
        b=IU+w1i9mECSQMHVknUrrUpqEKMdxgTmTIJ5BbTMSOTN2xWegSiohl/PTtP5vZaYzi+
         lQpgFgc9FPVCvd8sYYn51E0DL5Gdqsygo1Z8xRsgQr605/M4QSE9LpJsmiN9TVcjMeLg
         /HiyPKQzlWrdxx585f9BONq8jawIfYaY69S2BKCssD8Zao1Lg7LGQQVv+RmiETMnSnfk
         o2LD7w+geQUmg//1F9cj1h5eBQLh0mqj6bFYCIc/VAdb2Fpi+Lj5zVoniri5yZJ2Ulgy
         OyDibKxGwpCGXu1YcLfPOSHPcZwqqXvDjJlgUDsxGvBRwPtvHfNdbTMS7/InDmN5TH9/
         KRMA==
X-Gm-Message-State: AFuF++mCrKsUok2rpSeg8xxWjP/YOIH39oYm92LbAZJE4tVNgP8W/hLm
	FLUrIGPzYSdBJKlMVv8/Ar9e/xByeLNRDxj5j/zMJI1uXYQYKB9HIikJ95Uj+Xmilc1BzdHKbK1
	tx+46ZdqoK5ADs9hgPUpFVAtMAKqyNyQdEJUj/rjmJaVoAcsAAIxhOQkQr2TagblouNuS3JiRg3
	zF
X-Gm-Gg: AYBFou3tX03fPUJbMlrQhDw+ZSJ9LAj1xgKmy8GqqGlg/JMpGZdM+UdtSOIUU/GQw7e
	AKmmEEhnH86Rakt1ZY6bz/CZEqVCna5IU2wZT0EZimWP1x8+g9tdxcNA3w3mIwgLz4fVo7q7noj
	bUFpdR/DwB9H3ZsEml4tNxuOMv3jbLwENAGQ2T4CRbmd304NYJyt3RVUetFHlkdFpoLfj3fiSBm
	dI35cSIoRY7oa3eGCEDzr8TG7qJrLdIoMMzyBIl77Mp1B3BLbx+Vi5iEANEwVBKM4xUz/oOiK3i
	0L1jM3E76sObgFePDr9tWNKg/aiIvfroI1JBkGdMRap1Gq69NFlkoJl2WqR/3kjY9iNEogFZJkG
	QnNRy5QzCv8GQvmp3nCBmTqq8vA==
X-Received: by 2002:a05:7023:a4b:20b0:137:e6a1:c4b3 with SMTP id a92af1059eb24-144f8fc800cmr680672c88.0.1790111263885;
        Tue, 22 Sep 2026 14:07:43 -0700 (PDT)
X-Received: by 2002:a05:7023:a4b:20b0:137:e6a1:c4b3 with SMTP id a92af1059eb24-144f8fc800cmr680641c88.0.1790111263244;
        Tue, 22 Sep 2026 14:07:43 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm1157207c88.13.2026.09.22.14.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:07:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 02:37:32 +0530
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM8975
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-socinfo-v1-1-f0d1aaee9323@oss.qualcomm.com>
References: <20260923-hawi-socinfo-v1-0-f0d1aaee9323@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-socinfo-v1-0-f0d1aaee9323@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790111254; l=690;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=siu2NmBy5DQbhz0/hxEEhSyI3TF+Hjy1gBfEQXSBmu8=;
 b=lnEdRep1ZaFLQE1onPrYzba/AeJYBCvVBHvRxnO/E78JFqNTayAxcG48b4Q+1i2oQjaID1kpe
 COzTgnOYSktDAkEE+XE1A2sG5XpO+uItP7L5koJ7qCxGS1o9GXPPrWp
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: D3FgWrxHLokmMQHVECQcBd7cw10mkWWt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NyBTYWx0ZWRfXxQDrkB660WLY
 +X3VB3C9wCMvUo0KUql1NI7zY8i96/36DPyGWWuo9PQuKuIU6YDc7y6cdWldlpy1/vt0iLLDs8B
 6pm0Dk/LKCE2EpbxJWPqfZcHIpF8B6E=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab2ee22 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yctfUzL24_LWH4g8eJ0A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: D3FgWrxHLokmMQHVECQcBd7cw10mkWWt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NyBTYWx0ZWRfX2l8HzWqHbgxO
 TIYSOEqZbqu4meckm2z4I9MisZCV7BfVhLpql2dC0TquGf8OuFKO7Q1/gzjtsmiifGT9G1tYpnT
 aOgD+0RMXLB8T7QcwLBxnAbKClwTTftojZk7YvlFOKDUU2h97Ts9lz9ihRtVQ5NHAFPm2bwNRG5
 9eiD3xm+DkoDHzWZOTDmVJLas2vATkUlv+gvqGCV3bc8svs5zyt/h3C4wkKS/C9B7ANNHm2GBPn
 j2P5MFaZRMPigx2i4HndeKfxFwVA1s4AyIP/+jlIMr3Ojk/ALHVnIS6v92vR/YnO/ygliKDGWc2
 +xtzwl2nP9qg+HLISIiQA8PWvQJZOsIVphLqMsUPo9rnqTd91b1hO3WtVusq6YtVjQPNEb3cgD4
 EnhOGoYr8qAstTjmWmcWyvzfEmHmNn5OrCYNmRoJdhbwoNTV8tUPIWzkpnC0hq08HTDXObzP0fp
 DwANjMvtDMgP7lYUAAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220297

Add the ID for the Qualcomm SM8975 SoC which represents the Hawi
platform.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index b63e4a0b8e54..4259f8960447 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -301,6 +301,7 @@
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
 #define QCOM_ID_SA8797P			690
+#define QCOM_ID_SM8975			707
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
 #define QCOM_ID_CQ2390M			756

-- 
2.55.0

