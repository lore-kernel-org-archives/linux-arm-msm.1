Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C385416876
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797759; cv=none; b=ToNZWriSwo66/RWRvaw+NWIHB/Th0P6ZCE9JCsZpC5cDNDu8Mq+h+rO3qMOabo0NJJEyQU4odXkhnWjq1edo+rThq9/iOeIOR0igtLbZn/sDdiHrlN+eojYn/ajqGL78ykyfCdNjB+2oPS1R3VPGaZPJFOzgpNMRwgXkF0k2/aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797759; c=relaxed/simple;
	bh=nk4O2A9HsFYEKENAL+lO73VjDDWrKSCuDuCwrrq63aY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fyT2BPNNQjM8Gsq4as/UUbavczONV1P4xayuzpWdjwZHxragH0OARWJRf4hgCJpof7EtRzZJBmTWKCV9QOGiXMW/EG0mSDK9MCy+72EIECUoigK/2XH5GyYGmC+/adOsg+bitlT3iLlLu6odOe5zRBZ52Hy7QdRXfCRF6lj23oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gBXrdQ99; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiM8+1sJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gBXrdQ99";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiM8+1sJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qb5Q3606129
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EiTyNMqfM6ilFnk0P6b3RIj9XemC2TC1YTP2Eeap36c=; b=gBXrdQ99g1ae5uwc
	+ZtviJ0vSS5JzO/KLSeFbgehc4QwqeaToaA9/4Y56mTah7LCSsdKgi48Q8BEgWT3
	fuCoQYRLhKxvb2QiISe2MxJImbo9NrB2B2wETg0ot2PfLNLDbB1mVrJnODALCu4a
	AyPoLfLnLe8r/n22Lv0sHOwCoBiauwpG6SKYOoNqb7MFUAY0eYpbaqecN/J3Ri8e
	uI7raNf10DDYZUdC8qGmqgEOFyuAB6nhYC6YBfzqZJFmIe8Wjecm3IoxYL8n5KR6
	wsDnEZt2Z6EZdk4hMpu2crtLHvQoo6xqNt+8neUWJCWzxp10MP7VY/O+VaOiI+WW
	DEWqlQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke7qgg6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:09:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so993227a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784797755; x=1785402555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EiTyNMqfM6ilFnk0P6b3RIj9XemC2TC1YTP2Eeap36c=;
        b=CiM8+1sJ6bx6FNHw9ll9ZWZ7vmIHdcITB3Y8zfLDY+KSxIBTiVQRcArIsdMGjvXxPS
         VU8H1GhJaIPpuQd7BuY+wXWBHHy4SQO/KpXdod3QrvNTNJMmVmhEwmilbSUYY+YogHSs
         4vIl4iJIOkU/pDekWStcDaRxuBj9MPXLKLxZW1J43nsFL2IVsNYfJE2ESxbf/QIMDhb4
         734zCvgno4l+Ly+gmSEuuPmITO2wPrNvfQOc2DGa7IHbFLSb0ayF/bfiz6jBWSJFEcua
         WMkCPHZyv6xngaLkCRXTFglcOL13u35HwMjjogDBVwitbdnj5PLUvvfUOwSzt3Px8Qpp
         RJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784797755; x=1785402555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EiTyNMqfM6ilFnk0P6b3RIj9XemC2TC1YTP2Eeap36c=;
        b=Dq/7Bu1QelFYP9sxfJXrlyiQP2D7WyvJXK6kfD+O3bdSr5FHXoQIuiIuyKhs3yvBzf
         blymAJXGCsclVDeWs/knkcvLmXXLx1S08m3Pe2vU91PNRz5+W2JwYuu1SU3I+Hq72nhO
         l62VCP7fWnHCto5tcFLSU8GumwTZZHPg8DRebdmSHPoxqWTpho39Gz7nOUXf8F0BQHU/
         VABpVXjUVd6BN60sqCTccOdAh/RCBw0fuF8iWaK5oGbOxwY2yDv13aMRTnWb25I6PQ8q
         WYcRLmnWWgTELbunw3utmVfGva4mIn07XroYdmAu5rIK4hy71D/dX6qCodiNy4AQWIpb
         yQ6Q==
X-Gm-Message-State: AOJu0YzNXRDFsltURyUeMteAfkuTJjlXk6evkjUWimCY0A/sOGUCaRYh
	spipkCWf0F6WI2fL6muC4SxI8761URrYJf08/qkay5rzlOluoHlIjHCd+C4OHapaYTks1p90alI
	fMSaIah1puf7c9QFqaApBpMdFAfS7i3QTINUElNmTmAmWBHbtO9jYuFfJIeUx9bMazgh1ieN7HN
	G/
X-Gm-Gg: AR+sD11U46oZT7CQrP083VMtRdzinUefwFp9EYWhBjkRZaEAWZ8O8sACFb6hbNYcfrM
	WSv4mIyJUBPt/q5+iZhM/hXZSH884kNb28pj4Hny1/3Kgmr9dDiSGvMZngTpGWNLWaXznVD3AAv
	IHiYkrDFAbvvW7BgQvfAxRKbVQxjzfqeiSgPzi8ABV0/MXhe9DG3GRYQgl90VvCmdkzqg8Hw+yE
	wZ5ZcawGEDM509lMb2L236iuM0+Rtzx9MXiFAjFmXkfKzrswn11B0jF86diONF9aLZVxNNSUwAO
	w8n8ThthwA/nSf0NKDFY82TGh6OrJ8bMjl5JsmH4NWnRzNbBGPpZ6QEInlPgHkCtMQZlRoFXAQk
	DsU1SE0KDlvP13pP7I3ILR9WF5TMwdlDhR9VLW0hI6Aa4Xc+6NNYg8zUZ3PSj+oP5Zw06M94QKG
	ha6dJO6+3yW1B00c13xdMElVbgAiSS4Q==
X-Received: by 2002:a17:90a:ec88:b0:387:e0cb:7f3 with SMTP id 98e67ed59e1d1-38ec6883fa2mr2187070a91.39.1784797754946;
        Thu, 23 Jul 2026 02:09:14 -0700 (PDT)
X-Received: by 2002:a17:90a:ec88:b0:387:e0cb:7f3 with SMTP id 98e67ed59e1d1-38ec6883fa2mr2187042a91.39.1784797754468;
        Thu, 23 Jul 2026 02:09:14 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f42bbsm15191485c88.14.2026.07.23.02.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:09:14 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:38:58 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: ipq5210: Introduce RDP504 variant
 specific DT file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-08-dts-v3-3-074eb131f382@oss.qualcomm.com>
References: <20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com>
In-Reply-To: <20260723-08-dts-v3-0-074eb131f382@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5MCBTYWx0ZWRfX7O7vY6Ac450Y
 2to83qcPEoTe/OwH658WXAwQwjdv6lRr7Sl5ohC/nRhwP7HOgHIvMjWNzEprxzcsWF6u0FYdkbb
 Skd1IZhcvwC9qmmT15SMhRogpHLMJ2g=
X-Authority-Analysis: v=2.4 cv=aYxRWxot c=1 sm=1 tr=0 ts=6a61da3c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6lN6VCmV5TNdGVKjitMA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: kVR1ySfuos6F3tliGVqGD_se_FrhrogQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5MCBTYWx0ZWRfX/X74fQrU3c36
 yJ4/RFr589qyBg69CCOevrOVmS8MyaxIx0JD4VollY5gsULs5i5G61kf3BRaAs1DAQvivZUIL6m
 b2Lh0GUVu1TTtK6fGiVNzB8cj5OsbQ6ZSrhX6I8LjWV+ZIHFi3N/T8Uw854hJ3F4Wy82guljgQo
 84wo4RaV5EmKe7rD1zrRrVsAfBH+6GNBrzfNWypw7zRzlPezYPREw0lun8JymmvCgp6D3i2yG4V
 70fBFww+bmVOLBjh4EJL6R/DuSz/loktphGEl/Wb4SWjl721/kRSPoLKImLxG9hkAW4k2EomlCw
 6aZGdUcjEYrPTJGZ6llbrAsJCOKdPReJ1+qxp0da5wV/9LY4m/iOj+c1F574A6jE0JcpN5sAxG/
 WSicjtvPI8c9LKD5mjugu1FzNZYlR8Y8TN39C2Kzv9l2l/Nmlv1nokR5epAw/Ux6v9O7p4Ux+3H
 JEfB8srd7UF2+snhDzw==
X-Proofpoint-ORIG-GUID: kVR1ySfuos6F3tliGVqGD_se_FrhrogQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230090

Add two DT files, one for the default eMMC variant and one for the NAND
variant.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts | 17 +++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts      | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
new file mode 100644
index 000000000000..0902681669b4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-nand.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq5210-rdp504-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504";
+	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
+};
+
+&qpic_nand {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
new file mode 100644
index 000000000000..cd65826944e3
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "ipq5210-rdp504-common.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504";
+	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
+};
+
+&sdhc {
+	status = "okay";
+};

-- 
2.34.1

