Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EFB448D0C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785434104; cv=none; b=AkV2iv6OGCe9yIMv5yy13bnEVDMsBy+/n4wAyKJhlOFNwQDckX2pfHSkSXcQpYM7IeaH6g5wX5gs0zAZ+CCIhtjfeUAJcS4gotf8c7p0wTiEmakXAL9sREElotK1f2lKbUVy18oa/K+NxZqvaDxO9NYnesMlTfU/eA4DX6xXtu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785434104; c=relaxed/simple;
	bh=ddVTMkhYQhjB6ZCGQhNmC7udHsSIhRwzbp49Q5QEPpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZP1um2d3JXuzpyoWpOxizNVfMVQnvFz/LNQu7X9aq6lx1Lc46wbLjC5u4v9ScxwCwIoCB5vSmd2GTeqCc6H5mMkUiTQmQAzKr+twTIISFJWPUH2SqjPCl/IrYmlcO6R0+BLIjCewuErDGCVB00pkRqMOXwy22jesZVYAYV4ltiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fzQitUjI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eIIaHTIz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fzQitUjI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eIIaHTIz"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWjUB1525293
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qU6D/rKZGQxFhAFuDv0NYmixXft59wlSQR6DyVjgq7E=; b=fzQitUjI6RZ0kfzw
	NEbgh4pvFROOGeKz1EC2Fw/z2cItTuMjrBj26exBRhZVASHJS0zUhNgGgHphIryZ
	GVBIan2hjLJt0lo2NKEAWvGazWePczUvgQuToSCzrROCt8Fkmb6RJPPxzcAjP8RF
	axuWRV3jwW6h4hQL3D7PbQBkfVDdhXgPX6wW3CP1S84VYIgGtmP6auB8oEELiqN1
	8QB/eSJAhnEKs3emZbkshvB1zVABrlcOPorD8RWin0+Cig1Iyo1K4DE840ejxYFO
	C11msAySxIxLe8JwARFcixdUsO5qM1sb2OcTS7ckjXQbxUZaMnJsQbkDTiacM9v1
	ZifIaw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6yfsk9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:55:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38edd45cbc4so105530a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785434101; x=1786038901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qU6D/rKZGQxFhAFuDv0NYmixXft59wlSQR6DyVjgq7E=;
        b=eIIaHTIzudf1QxK0K2c9Gk/7qJ6bobEE1HJ/wpT9cqgIyDnJS0/rDjC21w/jKwgfau
         HPKE8eGrt0S81DPH9898xxI9Pghpwq3geQj57mIkGjMimbTrVm7S+YGvPf3aEaTswN59
         kWQe4cNhFrWaOp+EtakIfiGJmuy859UojBhmFXS5D/AUsWr9Yy0TMeV1KgtfaqMu9v0J
         kvgyPv+jL3y18xPDQ1/+GwSeMcLl9UmjOtEQzNg8BJFSbiIM2RJFZNUgKKUUXfOzYr4h
         GQxuVHKdJ1GZ0eUulxPF06LuaTLoiKKEW/TkVSQ6kW1P+9Ya5sHkN6QeswlfK6CBO+1f
         7L8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785434101; x=1786038901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qU6D/rKZGQxFhAFuDv0NYmixXft59wlSQR6DyVjgq7E=;
        b=PEgo22vzDbIH9NgTZ8Uq9soTwlfQHR4hRHcXIsK8DH0VDOQ7IgcoiQYit7wf7Qr2dD
         o/cfcxthafItiuqVE97Il8ki1XP1Gmaw4jx1dvBYAcTdo46WIA0JPWVOO4uki+7YR/eQ
         ogQrCuh2VI8QIC/hXRbnFOj2uMGhuLyzkHssYT8HKhN1fy5eyVBLl5t+Uzq0PHapXHjM
         Czm+mSKAz6WqbuGd6Ltq6gGfG3aUX2pqXN6n6HYVZ5rojc4PWWEJ4HPRiGo4CyYeRV6p
         448PTmm1xMNNdfNn/5Kq65DxP4m3xYkgAMqjYBqupgKqq+VfzDjZmC/iAJYv36nxlXay
         8TJw==
X-Forwarded-Encrypted: i=1; AHgh+Rq00xdaaFBwPwqcVlI8BKCatbeJ6vvF4GQVv9FaO4cbKaG3iqEGnUNzXMx0NGr8Ao/LJKwgIEw0b7SBjFLK@vger.kernel.org
X-Gm-Message-State: AOJu0YxxT0o59HSY3LERue4Wp+Sdwe1z+Vud/nzx13wTjo2yOSdhLdX2
	h2Fv7bxv2OZOsJVrxGZvvrhNFM456WmUFQsA+rHmv3XCx9clbWMu/VDNWU2MQ7Q2O43/4lDRt9d
	pg1RpfU/oSdM5TsUvc1E2Ku/aKi1KN9dx4BZNH9Ctmrg4acNnOrjYegWYhwtK+AoN1JFjBvSXOY
	pa
X-Gm-Gg: AR+sD10iBJwoCFPvdJ7LB75V6WgF0DjNhI77tRU0x40ZhfDWLHBjH0uKPVk8ZNzEdZ6
	qR+g+zZQCdXW6V3C1TUxugYprC6XZAFiDYKB1nZpCrBOxkxj8ROXyyqX+9nmW2TFTJQAVKF03l/
	xa39O4YWSiqYjfDLwmQlpAQVxjYi+kbXfqLpM5FDn/Ox2rlTqLmwYKup58utDioFusgwOlwo9lR
	iiHUQ7WtUwnjC4rAAjUsYX23orCF5RuSlRuwiq2yHRbhl5ygFRLWtc3yqRwdzyDN5qbrfJQjMWo
	8chFva6zRO7mqZ2HUHr4KM4cVn/w9ff15YrrT36cFeUP0L7mu6SPuYQDH+enHxnwI/UYCtxxLy0
	+643Sy8Tya9sKDM8+gTmlgKbC
X-Received: by 2002:a17:90a:e705:b0:387:e0bb:5803 with SMTP id 98e67ed59e1d1-38f9c126d30mr2935533a91.42.1785434100707;
        Thu, 30 Jul 2026 10:55:00 -0700 (PDT)
X-Received: by 2002:a17:90a:e705:b0:387:e0bb:5803 with SMTP id 98e67ed59e1d1-38f9c126d30mr2935511a91.42.1785434100228;
        Thu, 30 Jul 2026 10:55:00 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm36444098c88.5.2026.07.30.10.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:54:59 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 23:24:36 +0530
Subject: [PATCH v4 3/5] dt-bindings: clock: qcom: Add Maili global clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-maili_initial_clock-v4-3-ed52ade264f0@oss.qualcomm.com>
References: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
In-Reply-To: <20260730-maili_initial_clock-v4-0-ed52ade264f0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX6X4NxAez2gxf
 nXglfkmdFcUv+yHl8Tp4wxTc5+FvngrRtR4ACAXSys8byvitXrgkWwECwowMlJtihHzJqv4EchR
 WjUhLAN9YE/NxgolzricXHEX3crnEkI9e8A+juMU2phM7MMq/Qj5Vs+2ZozNc3S2Y4iVQqHbxqv
 1IMY99bcV1KpplosqwyQNZ9QbjXGNt+fFGbx/FQ6vYp1+Wtgn/zeXI+q3GgsCMzqYXAbgdNu7Pi
 KyWZbxhXZBUyLhziBgNjw/Adr4kQ36gCXdB/asRxuQ3lfsFwBsD6AVzLbrFVtQk624Fodh0AvN6
 a3g+5gWhVF/H8Xgh14jC11ci3ayL9e91svYfD+1o6ewOEEedQ3z1WEQu8CG8kHsqhInFmlvVD2S
 ywOYT4TPT5Qe0m4UqY8effgHFsZQECYWRhvHwdhZmJpuUlNE2Axg9w/uRm9JQdwBujMMSuJgAFO
 iIbZSjQrEq08ctMaR8Q==
X-Proofpoint-GUID: JfrvOsOX1UkXSZO_GGm2_t7Bxq64We6S
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEzMyBTYWx0ZWRfX/TnWwvw6T9YS
 o8r+pr7/7+oieRgh7kj9z0oMuSUR8Zswm/8oHkU5/Ed6zZhfVZr11VnfWX8f2KwhFFhTfZezFZK
 dSrcMXwBzYwIYiU0OHEGubHeSRJzt4M=
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6b8ff5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4s9NPNi6RWkeKLmGOYIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: JfrvOsOX1UkXSZO_GGm2_t7Bxq64We6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300133

Add device tree bindings for the global clock controller (GCC) on
the Qualcomm Maili SoC by extending the existing Qualcomm Hawi GCC
bindings, since the Maili GCC is identical to the Hawi GCC apart
from a few additional clocks.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml    | 11 ++++++++---
 include/dt-bindings/clock/qcom,maili-gcc.h          | 21 +++++++++++++++++++++
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
index 4f428c0f7286e83683a65cbe60b2cfeff67f5b8b..2101f4e4bb0d37f5cff42290f88c2f816038c402 100644
--- a/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Global Clock & Reset Controller on Hawi
 
 maintainers:
   - Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
-  domains on Hawi.
+  domains on Hawi and Maili.
 
-  See also: include/dt-bindings/clock/qcom,hawi-gcc.h
+  See also:
+    include/dt-bindings/clock/qcom,hawi-gcc.h
+    include/dt-bindings/clock/qcom,maili-gcc.h
 
 properties:
   compatible:
-    const: qcom,hawi-gcc
+    enum:
+      - qcom,hawi-gcc
+      - qcom,maili-gcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,maili-gcc.h b/include/dt-bindings/clock/qcom,maili-gcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..9bea90adb988ed9050ec30550d8723ede01ff6d6
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,maili-gcc.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_MAILI_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_MAILI_H
+
+#include "qcom,hawi-gcc.h"
+
+/* Maili has below additional clocks on top of Hawi */
+#define GCC_QUPV3_WRAP5_CORE_2X_CLK				188
+#define GCC_QUPV3_WRAP5_CORE_CLK				189
+#define GCC_QUPV3_WRAP5_QSPI_REF_CLK				190
+#define GCC_QUPV3_WRAP5_QSPI_REF_CLK_SRC			191
+#define GCC_QUPV3_WRAP5_S0_CLK					192
+#define GCC_QUPV3_WRAP5_S0_CLK_SRC				193
+#define GCC_QUPV3_WRAP_5_M_AHB_CLK				194
+#define GCC_QUPV3_WRAP_5_S_AHB_CLK				195
+
+#endif

-- 
2.34.1

