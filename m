Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883A73D3D11
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108800; cv=none; b=XxKfv56bJ9+3iUFKXMZnSi5UWJMLyS58u4IDCsOWis4C3Avy4r0Spj+WuVJODBRFPeWxN4BciJx14vauJENa11fFEz09drmxHs+3C0K3jWk7yB2ZhzVxfB8j/DCA0imoHxnF5In8RuKwl4MLyPHJ1xZjLviLLgflKc/+nxWrDdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108800; c=relaxed/simple;
	bh=N30ql1CGm+ccNkC77iZPDzsGhYzy47Anv6iw4X4OkKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gbdayb8uDN9Uc0WqynPjwRi5MNSQ0dfhv9P6hBw16p7S+CSskRBK7zS9+xIh2oYlq1lIU2743bVMj9tXCq5jlAGAXe+9BlomwtsqYoZS/n17zdwYpHsPfYIQEgzGYetadzl11B4SSTSaI37DlAfRBOF5DgsaFQshvEIFAkHsZCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=coYq3TXj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZoC9fW/8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="coYq3TXj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZoC9fW/8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7wWS767718
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:26:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0TuA+c4Zv64r9WkUq7tKxzf0rVkTnrTTJFn59aPv+Sk=; b=coYq3TXjRQ9aK7F+
	wTRCrbpcZFvMr7L6vo0GHj4jMo6pZSIs9ZHWATLffDLV6YY5AntUz75hPs4qv1wT
	McNaaosNwsZAVYzHMXWmOv3NzSGzCcIRAoLhZwulO36/06yv7gQoByI47QfEawL4
	YRRq3nvJlRggs16udBzsiRmc4S1yoEV5JDIOiJmrU42k7sOYovWZ8yk1TZDwr6hh
	6eaLU5Y6GfE3oB2oXPmR95l0e02YwNQSgDic3GyULFrfMAbelkNFXNVkq8+O0Kbu
	v01+cKOni8WiKi0NPDdH8pGREBsf3eauEjhsu0Dy3Npvkjyb8W9eAuxkVCHhDJaW
	6apcCw==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqkdhw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:26:29 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-455ad408573so594469fac.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790108788; x=1790713588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0TuA+c4Zv64r9WkUq7tKxzf0rVkTnrTTJFn59aPv+Sk=;
        b=ZoC9fW/8tySNOYj6m/RU2ga6blR9qhH37Hs9YkERZL9e6iWXpWfYGRXAxqOnhqo1k/
         4SFtuYfrkeqfbS1kI7b/fpVMZTMfr9oxe71oTC3hM1czY2UHM2sPROJ5QALk63Sm4ZmQ
         MU6Jh/yQy1T55UlVLWk5/4FB8LXkrcxuaREgJ6B4AvL5oGmTlb6J4RvqYI+db9OKw34J
         EDbhkdt86c0JEB16TKcpbh1qh1U7IOQcto3gYZjfABjyMwLkdrq7JmAdAkzOvntd3iqQ
         7rYeaKkRJZmyUuSGYNPPzKv+SCAjJ8JuD30L4a8IZB1b4PFi0d5/UCoUUOndf6YDeOnh
         qjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790108788; x=1790713588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TuA+c4Zv64r9WkUq7tKxzf0rVkTnrTTJFn59aPv+Sk=;
        b=2ioJRt/rhXbsCoQcKMHYQHVHd+S88zCvbrWhptd+1tTLJ5Zu7asIAIonQwIixSfQZS
         srqQLL0roMmkBaXUQgqCpY/hZhdvfWJkFvm8yq0k4zKMaPowMeH03Iss1TMu0N/XcE44
         lX1fLPwAt/FbPKGLHiWjbFiyasKinYQl+LjHM7v+em3w6+rg93J85XIomGfzb7Uo7dye
         bgpi81lrys8NujNDmAKacGq5RdsJUI+DhhtA3Oid9nIRPRgIKBtkgvNQSlXFPQb5ijzq
         eyScSHM8e/05oYe7IwxEvmirHpFpFmazLz3XFTZhv+nrAYHsQ6ApGDynzu83GulPQBzh
         YmvA==
X-Forwarded-Encrypted: i=1; AKwUvBxmTd6ZitgkFo6MI/ane9d98Hxm0KT6xHvqfP3Uz3cdqZwG5R5aiirG8DVfoBHhl06T0mrm/5tYcZHWbPle@vger.kernel.org
X-Gm-Message-State: AFuF++k+pmZIUdIxXsmFTNsXde8LY5cEdOJydl5woMJPUHSKRQTxh8tv
	JSvvzan2oXjTRksQwuUEsMtS/iSWDqUNOtjh8o2tPoOU8h3IfeYqJHtP6MH1AE1CX5AM6l6IAlk
	5Bck/+/V/KRUnJ24NJnDK+uPAlb7YH6d+q3JEfBXvAIVdERv11pMYChHfcG7DR0kgACTdTb4orF
	EN
X-Gm-Gg: AYBFou360VRGFDUfiqMnbItWvRO9LIphmR4Rv9ymi4J4mzSDuvcg/sT8zUGvv23eDuX
	9w8R74JBSdRb4S5+37Xg4N1ugDF7614U/p/V97Am8vftuTZEzMubLK2kKuqsG47BOn2z7hv4FKK
	itIfrnCrBLkWXMf7/XbFPc6xmoGKGHwpIWGQMm6/E39ZSt8zkizlCq7GkusouaZN/N8HKuwyUSO
	XDjFh07mSTplYk8+nc4zMh1+t5gAvMirqZPwL7fN0GUE6PDw3jjPlbjRHToe/gOd1iPHVHWADLw
	lU7AS9yeKi/ssXKiZFefT05i33WF0FhmUMGlkYveFiVHmIsxk9qT7Id+5BQUoFLhouzHUUzuEFl
	2JtSYKhSe8c2s5dTPoCoecBZf9bDB9MxiQyvn
X-Received: by 2002:a05:6820:1c94:b0:6c7:af50:b2f1 with SMTP id 006d021491bc7-6d2cfd47cf8mr533967eaf.15.1790108788391;
        Tue, 22 Sep 2026 13:26:28 -0700 (PDT)
X-Received: by 2002:a05:7022:1a86:b0:143:26eb:18e9 with SMTP id a92af1059eb24-144f915483emr769997c88.28.1790108345626;
        Tue, 22 Sep 2026 13:19:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm1101142c88.6.2026.09.22.13.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:19:05 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 01:48:36 +0530
Subject: [PATCH 2/4] arm64: dts: qcom: hawi: Add header file for IPCC
 physical client IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-dt-post-v1-2-e41473b6298b@oss.qualcomm.com>
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790108331; l=2279;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=N30ql1CGm+ccNkC77iZPDzsGhYzy47Anv6iw4X4OkKY=;
 b=rPcymbyMOz/UdGH07hqFHovIn2jIq2rE961+D20tyWyoG2atc806D+jtUcTsJoULZ5xYg/14d
 TMZMwCRS2+CD3tjLC99XUGvqtMIm9p+YyynluN6mt/MZz5hSmODj8Ua
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX+CnKUveM1LC7
 rCT8nSnUZ8ptNXcu8uOGNk96yQRpqIPyTTlBqfW+Z4XfYSehpV3q/HAF5+FRBnyOu71nH/PD3Qu
 m9DXZUtmnWB8kaepttzZKUP0x9pg0+Dqt4Ye/yijMCDdQO84x7wjQ0y6aj5O4n8SiJWztEIbA79
 152Rr3whcpSAEuqJikxwpLmnJL/l/O4oo6eSN4Yq7gfVWi9Pdxaof3u5PzDTUcgo9VtHXZyZF/1
 xKsouEv0Txv/Jlmnl70B0r90Z+pVdDmnhklmmaNdmCiomLXVhKHHdPLm3YjXX4wXVPtCvCRuOUw
 dksdq8KvL7OB6SvnGAZsiKF6/oyvL/7A+Z3yVI0AZpfqW9yKfhwr52oH85y5kXM3ylfN7UA3NzS
 ci/3ArbANrjmJuy7pCrAF9/iFE3W6BKT9o+p+neUbBgHffEyHJhpBZhHoOZQijg4SI2R5MdF2L1
 K93kJMbUnXt0LnccGHQ==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab2e475 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Fdsq5qC3Yt23JGXt4TsA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-ORIG-GUID: A9sBrnE8KH4vSLHROt59133TyM_1_-2O
X-Proofpoint-GUID: A9sBrnE8KH4vSLHROt59133TyM_1_-2O
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NCBTYWx0ZWRfX/2s8Q27z13ra
 J6yl+MRis4TsDlb5cQN0pJ9VsXNhbcDyonYag+w+GEFmAbuYXjIjTcZp+KRN7kC+kvn+KTnwnKm
 zNWEf7AsSzCaZb+oZS4QiiDT7SMDchU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220294

Physical client IDs are used on Hawi Inter Process Communication
Controller (IPCC), add a corresponding header file.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-ipcc.h | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-ipcc.h b/arch/arm64/boot/dts/qcom/hawi-ipcc.h
new file mode 100644
index 000000000000..67f228e1aa0e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hawi-ipcc.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DTS_HAWI_MAILBOX_IPCC_H
+#define __DTS_HAWI_MAILBOX_IPCC_H
+
+/* Physical client IDs */
+#define IPCC_MPROC_AOP			0
+#define IPCC_MPROC_TZ			1
+#define IPCC_MPROC_MPSS			2
+#define IPCC_MPROC_LPASS		3
+#define IPCC_MPROC_SDC			4
+#define IPCC_MPROC_CDSP			5
+#define IPCC_MPROC_APSS			6
+#define IPCC_MPROC_SPSS			15
+#define IPCC_MPROC_TME			16
+#define IPCC_MPROC_SOCCP		12
+#define IPCC_MPROC_DCP			13
+#define IPCC_MPROC_QECP			14
+
+#define IPCC_COMPUTE_L0_LPASS		1
+#define IPCC_COMPUTE_L0_CDSP		2
+#define IPCC_COMPUTE_L0_APSS		3
+#define IPCC_COMPUTE_L0_GPU		4
+#define IPCC_COMPUTE_L0_CVP		8
+#define IPCC_COMPUTE_L0_CAM		9
+#define IPCC_COMPUTE_L0_VPU		12
+#define IPCC_COMPUTE_L0_SOCCP		16
+#define IPCC_COMPUTE_L0_CAM1		10
+#define IPCC_COMPUTE_L0_DCP		11
+
+#define IPCC_COMPUTE_L1_LPASS		1
+#define IPCC_COMPUTE_L1_CDSP		2
+#define IPCC_COMPUTE_L1_APSS		3
+#define IPCC_COMPUTE_L1_GPU		4
+#define IPCC_COMPUTE_L1_CVP		8
+#define IPCC_COMPUTE_L1_CAM		9
+#define IPCC_COMPUTE_L1_VPU		12
+#define IPCC_COMPUTE_L1_SOCCP		16
+#define IPCC_COMPUTE_L1_CAM1		10
+#define IPCC_COMPUTE_L1_DCP		11
+
+#define IPCC_PERIPH_CDSP		2
+#define IPCC_PERIPH_APSS		3
+#define IPCC_PERIPH_PCIE0		4
+#define IPCC_PERIPH_PCIE1		15
+
+#define IPCC_FENCE_LPASS		1
+#define IPCC_FENCE_CDSP			2
+#define IPCC_FENCE_APSS			3
+#define IPCC_FENCE_GPU			4
+#define IPCC_FENCE_CVP			8
+#define IPCC_FENCE_CAM			9
+#define IPCC_FENCE_VPU			20
+#define IPCC_FENCE_SOCCP		24
+#define IPCC_FENCE_CAM1			10
+#define IPCC_FENCE_DCP			11
+
+#endif

-- 
2.55.0

