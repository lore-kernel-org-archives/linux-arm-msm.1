Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD9328852E
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 15:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215149; cv=none; b=SXJIIc+nxf5snzKew2cV9kuiV1d9lX7UPIL783y7tyRgWSv8NJcXZMpTu4qvSf4AwcQuk43JBrI6W7mqGGIxGHZB4e07BceQFz0BZAdpNHEWDou5n6BJn+CHJliDf2708KT1MG70fziPq/UuqfzYq6fzOjL2UXt8xb8cGSuMCFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215149; c=relaxed/simple;
	bh=jAQ773bjB6Kmlkdcm1u9UWqsnoYsBM21BbvxXRcWG8k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ItnqL0s23i+m+iuW7MI3NRs+EJvVoLHGVYnsKfFJKIRFdfQgvT65jhpedhQYz8ivWFKHdHl/ebdU3ad//WXM6HH7wmnCbfDowaeDD3rf778pJZo89SUXNcWVHpG7eMM76iPJOD6i4F7ADW9dCQL9D4Zml1pTvarNGCZH9xonJgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0saJNE8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJ1LFjBR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0saJNE8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJ1LFjBR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJnn62837994
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 15:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OlJcFPG2bDbSJGCRcBVaD0znBw0v3ktGJxP
	DvzEgjT0=; b=p0saJNE8Y2ylO13XMySL3P3K4rg+oAh/uLeRaoI8EqYPZx2sFz9
	n+ESIaeLjuiQQaW68bKDpZgbpGk5SW972cI5k0gsjw3u80OwVoIcWUC3apTDxQIG
	bAZNZRcP10blEhpmjqQCrTq/fmgFlG/DSxhRi/eD9cTYCHm90SwkgocFlpzoX9n5
	53lKYKke5FE6YIMFhZfLguJMjrImGGdz55B8sssbWCPlXvIm8S8leiigjfUSCx05
	+r4cbY8SSBej3oqw9AS6zOsNi6DuKXlZUZTpdWgnbBOLi4+jMbGHCkujujo2+N17
	WGHXPF99nE0NRpBHo+yIKH2+paEuyhTCuJA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqmm39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 15:19:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848568a6f62so11774752b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 08:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784215145; x=1784819945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OlJcFPG2bDbSJGCRcBVaD0znBw0v3ktGJxPDvzEgjT0=;
        b=gJ1LFjBR4cdySaQIoMDHcXgn8zuQ0leWrMyhxrccrd4sUKNQEK5vc8ylguRLAGcOh0
         CvyVJtEEz+oASQrNwu6PD0WxHUWefEJQx9A1pUDnZObtBwO9jpokCSJkY1xYmm5qJdkq
         C7b3v/uOk9epzGdcjRzG6yHItVAlr4UvAKXauQh+LT+EQVgDlGOBV0CUsjVzVYuFhBUr
         Ew+uqYY4YfaAKXC0uyViA3HUKjI8brsSvdR/iyF30uvp3Ec88p7lw4RqCHbsHre8i+tf
         e5d+Ak0WycJrJ/TRSO3B+w7ZMzeY3JQFjNRuFGZoGs9GhB9f6h6JQsRFYo2IRazsW5YK
         jt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784215145; x=1784819945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OlJcFPG2bDbSJGCRcBVaD0znBw0v3ktGJxPDvzEgjT0=;
        b=aZWxpf/MmkIUAcrG/5R9gwJ3dR7+7I2Td0cEQekHnzJ58Z2cdHtSOHF/clJjWO91zV
         tvmSxs2xN6pcht22Xv5QGim7i53qlMAfSo2RuaXQD+e8VN1XxtXs8T9xxE4HoKPI1Dkg
         evhYzQqTh2VlnsV1UchgEfEWMNs0t5trpcTAUwgtt3VAIKDtFFvnXHKg6+sSG1oNT1lt
         pUAIHZ5U88AdeOTC9WU81QmnlUgYj+zJizfubHSoRg8H+aTxVra+qFR4873auQ1wdV5P
         hK8reUAaHPnZYFCajIgnj5aRkrt8+DX9y+P8dafVoA7KZ3I6/WJqL6x/tYN+d8IdYRUX
         q9Iw==
X-Gm-Message-State: AOJu0YxpkLhLSK5qERaQ7G5o1PhrRiw69ScVa7nUfxkIJ8GahG/siVY5
	8uWblsNxmtxroGe3IPugBpVt2wAEbNQXuXw+Zjl9+VVMAb5jtc9gbE0HRiF9mOwIWfPK7eLHdzu
	l/eGtII8OWbonJKY7k6CqNwgqt9vnypmmAIlrXeux9G283aV/q4VeyBk/sNHWyWKg6oBn
X-Gm-Gg: AfdE7cluL32oUAN+jaGcsZec54v86G2L9oFRCYirN+BJeeX3XW4TAjKTrVjRGPh+6uF
	ETh2ukk0henUyt8qpttF4tOxF/vbC76DUT14nU4NPdp0UrllAH7JHhwNMnHc7OsQh87hkDKE9zB
	y6Q445G1ezkeZRo2aRM66PcKO/kH/tPUoQjxPC63+YziYZ1lMxnIcQ1VjPSD94RT5vBxrdg3SOp
	sMdSxTWnYjpnalomTFDQZeYWGKO5QGjWoFtHZItjMjpTy5sLugI63uhVTI+c2oqbP+jDoJGVQce
	dtjhmjW1fFXzTzCeMOmpFKd0+Waww0xK/BbGSimk3v459/BZJBDTh34IZVWpuWyPz/XlvcIPXWv
	PO9+K0HRu0Kr+NEvwOpi0l2NWygACuVFlTUFI
X-Received: by 2002:a05:6a00:3e01:b0:848:2f6e:e530 with SMTP id d2e1a72fcca58-84a5588680bmr10986677b3a.68.1784215145410;
        Thu, 16 Jul 2026 08:19:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e01:b0:848:2f6e:e530 with SMTP id d2e1a72fcca58-84a5588680bmr10986637b3a.68.1784215144836;
        Thu, 16 Jul 2026 08:19:04 -0700 (PDT)
Received: from hu-mpratyus-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bfc2bsm4941616b3a.37.2026.07.16.08.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 08:19:04 -0700 (PDT)
From: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: qcom: enable audio ML offload
Date: Thu, 16 Jul 2026 20:48:52 +0530
Message-Id: <20260716151854.3041914-1-pratyush.meduri@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a58f66a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=4P7nMa8YD1JmJx7unSoA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE1NiBTYWx0ZWRfXz6wE29vaEzLz
 jAEL/O1gFC2YTWhkBnNmD7jPGWZvLwCXEHy8RXrbNF+PZmJEdfNh1VLK12JoUG1otQdNXdY3D5f
 G9v+1aQP6qxq6h0mBZ/nqF3ydBY35Cw=
X-Proofpoint-ORIG-GUID: uif2iA2ex_CJlQqvaB7kScmtJTPSKwO4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE1NiBTYWx0ZWRfX7MeMpaaMWKc/
 R5bhK0UsTAsVM86YtLBOrzN7W33pC4rzvRvrw+FgajuqCIzofQ8WkgkMBvVSia9+h3GGRqthEzA
 GlPn+ohkyPew3vrbkrC5NjtB0MT4UAuHxlvLC9kLOw3mGi8qCgM8tdME4AIoh9IvRoA2lD6Etgv
 lMkpOeigL4xymi1I4IoV+QAJhNRfEITzGuQsxI4tMl2n5Y58+5w9HkeNPLXN4XUxV3gz01W6oqp
 WuvZzscp6/5zPYgH4R+SQx/gPK/R0DSlMPN56MfOx94oYWTiCbhQyBthzTdB0AF2N0zSolWYKwh
 nwD5N4WT+OklnBGiHCNnICZLMPY/ar5y/o398JF5Qmth/LW2FtZEKYhOd+ibupcLB+GPFxzyS7V
 2uiLvuULK1sMp2vAs7+pMTn/kpb+i2JnU68/9D1xTIJKkiJFP8wyTlNGbLcXOglhnjv9CArwpO6
 llXIx6fxIhrcf4dN+iw==
X-Proofpoint-GUID: uif2iA2ex_CJlQqvaB7kScmtJTPSKwO4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160156

The audio ML offload use case on Lemans requires a dedicated contiguous
memory region shared with the audio DSP/SPF as well as corresponding
SMMU stream ID mappings under the EL2 configuration.

This series adds a dedicated CMA pool for audio ML buffers and
associates it with the q6apm audio subsystem. It also updates the ADSP
SMMU configuration in the EL2 overlay to include the ML-related stream
IDs required for DMA transactions during model offload.

Without these changes, audio ML workloads may fail due to unavailable
contiguous memory or SMMU faults caused by unmapped stream IDs.

Pratyush Meduri (2):
  arm64: dts: qcom: lemans: enable audio ML offload memory and SMMU
    mappings
  arm64: dts: qcom: monaco: enable audio ML offload memory and SMMU
    mappings

 arch/arm64/boot/dts/qcom/lemans-el2.dtso | 4 +++-
 arch/arm64/boot/dts/qcom/lemans.dtsi     | 9 +++++++++
 arch/arm64/boot/dts/qcom/monaco-el2.dtso | 4 +++-
 arch/arm64/boot/dts/qcom/monaco.dtsi     | 9 +++++++++
 4 files changed, 24 insertions(+), 2 deletions(-)


base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
-- 
2.34.1

