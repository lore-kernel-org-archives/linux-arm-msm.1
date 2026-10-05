Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B4C47DD76
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198922; cv=none; b=svbBBtYoFcmdmV+6zXgE8L2UnLC2bgM3dOY2JnIGwI5BJp03vrG7RW5pkDD8SupDRj+1/Pj+mkPuM8f/zpR1Z4V/7rbREcEH5Psb/sHBA8bIwKdpZY6y065S8fs3eUFOS1Ch3IDTpsucKctoA+GxudLwJNQgy4Y6DvKp9/2dWZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198922; c=relaxed/simple;
	bh=BK1MJ1z6ERN0evL3s5ZUXjGO0uqyootd6E97dDU2DzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qQSurmpVFAlj/MRF2IYPGqYcblqaqikOBbJL7MUQmppneNTwckZ7q7hgbmjltIEkZCCPledVkvCg8n59we+AIXDC1cIj+SnSnvA8Ge3yN5xo9uyugz6yUJUZH90j+FqJJat8F8wOAbdtKARBBJg0hwJi70UMTG0Tc2GQ8eWTXzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JdccRYB2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VIOGFR/J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JdccRYB2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VIOGFR/J"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695AoKbs2040796
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 11:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HxLGlwJ2KEccA8CkmqrCVI6Khzk5iGj0WMQPPmgSwoo=; b=JdccRYB2iGQ/OVAC
	8Y4tUbN2eUXcTXeG5znEwFOkfdQg9YBKOO4/S9V5hI4a8jpT0+C5lX+3QsRC4zA3
	4XdoMNvhp3l92GqgMR16gcCqm5f9GktWe+QWiDzR5qd9mikqYgxBDfsZ2H+aF9VN
	Wc+jEYEOpllL+qYH5Gp/DzinjAcoAvixSTHnob3lF2XmynutDQ0hdXrypyKQr6Dw
	NkbAJ38jALFUERa8yf44T50W3NRPTZ0zdDPssUhdxa8xlD+/GJvC2Eog++IO9c28
	JAi5aFWGAzB4Zq/qHS6YELk1N1oVEN7AfggWZfng6wFC1dfoCp8IcGXn9r7S0wVb
	gEqvIg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa5ms9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 11:15:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88a46301ec5so2128801b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 04:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791198918; x=1791803718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HxLGlwJ2KEccA8CkmqrCVI6Khzk5iGj0WMQPPmgSwoo=;
        b=VIOGFR/JckDLCGZ7xXP8+a2QFW2bWD4OtfXOJKYiTpqqTuvDZ3n3pXpPHv4yJ/9/zq
         oMuM3udraKUnYXrA7U3t4rY9c3kOdEejW634gbKxwY6yffMe/unSlU98Ruks4jFc/OKF
         jW3ZVie7hxU75QMeasKWGL7DLFbp/oUPIo7P1HMxpXDLHwk4hgFywg9XnUPvX3Q4h63w
         N1pbyu9vkmJ6YcIaF+Q9gjiEiJuYTDip1zZFaWFr1LF5vG7fivY4L8Gm1qc16zlp7tVp
         oHCn+qS8iYXZjFZuS33T9PRvqsKf4jURGd4TQpz9ds4R5RQrM08QBSyhFkapAu0yDL69
         7JXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198918; x=1791803718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxLGlwJ2KEccA8CkmqrCVI6Khzk5iGj0WMQPPmgSwoo=;
        b=TBNRNmJsPAOsdaufx8ZtUc8H9p4BgB2IgwA5xVvLJKtAwO+4Zts87m87swgXd8cYDj
         9WHwUU5sx5MTJQ3O4+lApadzLLekotOW/wqdz0DE9Z5VhVRg7iaKyr716nzE9xfkXdiA
         x9bsBoLT6ezlcSpmoKBIJUcXCNyUma0azohgjHF4oAJ74lTBminTpAhNUwW10LTw2sIr
         ZlBpsF1H7suBYs8Z+b9X9jgqA08m1JWecOEsGaIZjLTzfOLHoCf/6hkwyKXkdTAzvYZu
         s1HL6SZ2Kq4MLu/+KysFFiDjm4upOeqM/jxyWGCPzLK0QRUAZ+bimyznFhEBca3cHH+i
         tBFg==
X-Gm-Message-State: AFuF++kDoigUidpU44pwPQ0Ume8Bco03GVJPVK8RtTURitcC0cczswC0
	ywCFmzuNESUNwvDkTyXh3eh78anDUw2iozvkIlJiCbRF0BNd+9UykL1SzrIEHCPDI6L3HBOAk7q
	PLnrcXQaBjWiA8mEdZ5bfhuBgNbE8iiR/P0iRUwrzzGVH6q7JQ0aylnogdQ+1E/jQi+Rx
X-Gm-Gg: AYBFou1WhWrqEshwfnsKAVryU3gtFAXbID+68DpgVCGmQPKQQX7YRujtAFSTSEMHHd/
	K9mbGrf8KzqZuG3GDurs1nMu6AF/CpFdgKf6MA+S0Z4NNt4NRHO4vAVfKTK2cC4hrzLZRZS/LZe
	+tY791PFgC1rszC/IuYwWpHkq0ynAlAVOf8Wfo5pbg8zcnqjJ2FpFhRqEfaXa3Z2brOhCaXi2+G
	0/XugK8DKozPioKBsTTlySh4qWE7LOF8fCTqIVtgwXkwnmi6yodDE6PQp9oNQ1q3qhm3lEAg2H/
	ZYbKlWC/L9gVpy00+9gjLJjXf2IQcG8mDjMYVW9dBbEf2rPuKPw5LI5zDfCG2K9qzLHGJg+OEU6
	ce8aUMQfAUb56vA==
X-Received: by 2002:a05:6a00:148d:b0:888:119d:efae with SMTP id d2e1a72fcca58-88af894f9bemr9592267b3a.53.1791198917864;
        Mon, 05 Oct 2026 04:15:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:148d:b0:888:119d:efae with SMTP id d2e1a72fcca58-88af894f9bemr9592229b3a.53.1791198917325;
        Mon, 05 Oct 2026 04:15:17 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c59e3afsm3249852b3a.33.2026.10.05.04.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:15:16 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 16:44:45 +0530
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,shikra-pas: Allow 3
 IOMMUs for LPAICP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-shikra-el2-v3-1-618f7343695c@oss.qualcomm.com>
References: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
In-Reply-To: <20261005-shikra-el2-v3-0-618f7343695c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791198906; l=1991;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=BK1MJ1z6ERN0evL3s5ZUXjGO0uqyootd6E97dDU2DzQ=;
 b=8dMnpA2iR7nzgXHo8slXfvbXOSdq/qSaosPh8fJpx1LYoTmysgFV/AvhXaPlspOK8Aecn5ST1
 ARvZjTt9zjgBlyuL709/XpwMjT95ChVZNZDgE+IoRkr1JnNI5CI9WjO
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX5dO2DDNjF8HG
 /uv7FxH2/CApW3t6nITy1YA+PL9qDGTKb+k7khg/jFcJs6wHW1H818m82zOkQ5L0YXMrtOoVP6e
 qj5wMNSoiqAuQruFN/GVTzy8Ab7wQRITC86YOEkHXvb+lyErSx4Xj+ARmH9e/mNPUChqlpwp1HW
 GYUWoRPSEwkW+3feE+GVYgz/IDEpZ0XXWEpUgcv24GEsTdkHNpBLhbbWDfXEoKuZWlRvOcHl820
 CmcUwwUW0Kn8DWXGEwNAKYNqCOtisbQxB8P8Fb794k1HpvrGFLoG8Q1gHB0f/0lUH1bWEE3WSWb
 lMD6MuhuS1siIfzxaXyG6GrUWE1h8KAxcqed1/XUYsjuVumx8CDwfJiAiN1tmxs8KKAxTYrkdKs
 cYE5NCcmDqIPrpWixTLW9tP4U36JZTCMLCLgC177/Md8H1/c6pS0IPbI9F8P/ImuUIIZ3Bshk+f
 6vqzXv43xgofRrho3+w==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac386c6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=asbD4md8-q6e6i43ReAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: UoIGGNNfEEnO39m0vsW5OjPeaByEltlu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0MyBTYWx0ZWRfX0X21yzq7AvB2
 7lxQc2GzlSsn7MV3AS8RR7opu6dJfRK+cJjJdX33t+tmRgZzJjBk1Y4rmtfuYwA15aTV4YB/Nsf
 Hv+PKaKvPDTQnZPAXcxiUldy8UhXXno=
X-Proofpoint-GUID: UoIGGNNfEEnO39m0vsW5OjPeaByEltlu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_02,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050043

The Shikra LPAICP PAS requires three IOMMU entries. However,
qcom,shikra-pas.yaml inherits the `iommus` schema from
qcom,pas-common.yaml, which limits property to a single entry.

As a result, the LPAICP-specific `maxItems: 3` constraint conflicts
with the inherited `maxItems: 1` constraint, and a valid LPAICP node
fails schema validation.

Remove the pas-common schema reference and specify IOMMU entry limit
for each Shikra PAS compatible: one entry for CDSP and MPSS, and
three entries for LPAICP.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,shikra-pas.yaml   | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 34a2f15e9361..4196f61a8ba0 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -32,6 +32,9 @@ properties:
     items:
       - const: xo
 
+  interconnects:
+    maxItems: 1
+
   memory-region:
     minItems: 1
     maxItems: 2
@@ -92,10 +95,14 @@ required:
   - compatible
   - reg
   - memory-region
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
 
 allOf:
-  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
-
   - if:
       properties:
         compatible:
@@ -112,6 +119,8 @@ allOf:
           maxItems: 1
         firmware-name:
           maxItems: 1
+        iommus:
+          maxItems: 1
         power-domains:
           items:
             - description: CX power domain
@@ -134,6 +143,8 @@ allOf:
           minItems: 2
         firmware-name:
           minItems: 2
+        iommus:
+          maxItems: 3
         power-domains: false
         power-domain-names: false
 

-- 
2.34.1

