Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5BC490C16
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246514; cv=none; b=L1J093IroMaSATdHyxPVTiQOXJ+qhnebQN5Ph8uiLC/gkDg3fTWnjpqqUkALqy7ehIsEHAlL7hiEezQi6FwKdnWAGOCASolGo1On6p7MJco03zPc0xZvFtj+VU4wvbX0Dds6CnpAcR1WpfgwpUA9G7ihxtgVl8nCi9JLPX5NTgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246514; c=relaxed/simple;
	bh=vR3z4cHJik79scGWvFvoIkF5/TuWGh9nOZnOTSxAwWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WzJO7QmYTc9gvGwrXy64Lq+kflxr+GfCoeQNx+VoCuXY2v1L4IvluCYSjlxeYU8m78R6IHEIkanarN/lYQQ0FdSd++UWtsHT1bhzofdVPIAmHlY3seurTK6u6I31/jruXjb19CoZ0ad0P4pRQS089HhUE6fm71P24dBf1R0+jcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEKdpoW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvZ3gRu+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEKdpoW9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XvZ3gRu+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA64rG2332967
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=; b=lEKdpoW9vCClAz2b
	B3Yz6DO0a/O/JO7iW1yhBnIQ/DDxcF4fiyEsfJz5z+mRSFOg5YAb+4I2eIizJf2k
	HfZIeKCuGrGbaQENAlO0bjWhIJK2Fas53eOIhSxQ7XmCTXJpYwVxXHwRC8OTMHNq
	lshxMQ7PlHjMrF9Rn5RIG/tM29wH9+sr2DIPWvtBhaGDCwQ4NbnelNXArrva1iZN
	fzV1Kr3zkH40Z1X02mYV2ilKj0EZJbcNzYTCylxdV5aV6aTLJv0UOWTA2Vl/QSo0
	DWHsZ96DgE4DxchhBcjWt/1CNhExajm+EVvbyneMIx3kpBoOnCnywhyqnYhRDHZO
	kR9bJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjg41n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93903622880so139137985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246509; x=1790851309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=;
        b=XvZ3gRu+BRy9a84HFgqAqoCjIDPuqZCOst1QSCxuB6pMDojBrRwaQ4j3Jlt23b+YE4
         1SqcVsXD7tt3v7ZzjvzYNRVGJVunmdrtuMOH9iZIYds25WO2l+O8kRUELmIomFgh9h0o
         9QAmijm/fL4yWLuVXa11b8aH/4/DMMg+10YaSYXTfJ7qQVVM2RM3+QfVVyultxswM9D1
         FOAtitzznu4Vx9mesIVMxpiveE8xcsvod2ZbYxmZ/qGXj65RAQtQI6wT9KPG29EeiOfy
         VGX/CQ9XGqy3b8fKl1YG6diHNQEEe4AvGqCVQY+qXInkSz+XBPI4vLzSaBBBnS85gvka
         Ni0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246509; x=1790851309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRtmfUZkWeF9pxV5LC38lbXFjH/Ed40oE1nEbBREdvU=;
        b=ciguJHVbFvBxzkiTMdPq4avFwGFeHNghFoxC+S14H6pUzG8QFlqmTbdNmCDq4zlnZE
         NBl4s5dOTQROyTTUhKNamdx5DVEDuHq7bDOyKa0wrSHyF38ti6K+to2cQEyr0FBP+h2H
         X0+XHdS4ZJVManl0dIln9yi5RajCduz8rEXh5HDx/gpn82u/7oaY18lIOq5HCAm7S/uP
         XRZ2HYmJsO3IRDRZPrCTBSKUcoDcuCU4EpgvJrIkGPB+aI7F5jmSePhGx4CYGD5KcAx3
         t/BG5mYZ6oX/1Hp4H9kUbtmqaY51tHlUJ0Lf2c8vLDvKDOOxoGZggghwoogRJsaK+vrB
         xsdA==
X-Gm-Message-State: AFuF++mY9t7QsWzkH/CRBetRa5/4mu8Chv1tTXVjoA1lJXkXtYEAtS8P
	fh18OqKp3cP+aBAL8615WiMn1VA0gDCEh+uz5baY7MD+uq5IVNG3Z8hMtz1I8uYKmAJA3atzVXI
	YAuAyB0Ecb2kegXq6Jw6zWibtGYI1GaI9dDHuQRUI66BZAlAsRUXVYgbK3rPqX32isH83ibVrhH
	N2
X-Gm-Gg: AYBFou2QVf/tca8Og2gWE9hTlE7VvQ55lxmBZDYlD2xzzg4QYKNzG11l8zVICY/Xbe1
	0YLIhz+AwKBZ3ljV+l7dr7FpCoa+9loPh3p14JTnfkBAYLNfmRHY4ejjfzVw5JG3iz8O6mZEoIb
	L4/+BC0HK41O5d3pAdotknwPkZLq0L2DINkOR6QbYomtG4uMWA5xZCMspxe9qi20Oq9tOFUPExj
	gVfOsEL9BS7SA2WCySiiWQUPsF44QETsyoC8O1wtmx7Ok7hcb3i5rzSKbLlBndNY3MEdX5Fj2lb
	qDmTN6R+/dv2B1/DFAYzUW8uk2CSR8Y38/E2eTPY51BPNKWpFRKMJ6vsm+cNxeT023MgRIQMAVC
	onGahYPKt
X-Received: by 2002:a05:620a:1724:b0:939:a9d4:7023 with SMTP id af79cd13be357-93c3665379fmr211748785a.10.1790246508875;
        Thu, 24 Sep 2026 03:41:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1724:b0:939:a9d4:7023 with SMTP id af79cd13be357-93c3665379fmr211744485a.10.1790246508331;
        Thu, 24 Sep 2026 03:41:48 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:47 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:52 +0300
Subject: [PATCH v5 36/42] arm64: dts: qcom: sm8250: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-36-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vR3z4cHJik79scGWvFvoIkF5/TuWGh9nOZnOTSxAwWM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP39F7GB+7c8svmghc71rS5Uda+C8iSb7wcby
 e/IIeQU4z+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9/QAKCRAbX0TJAJUV
 VrcjD/0Y3Rk5vSg3xycnz8a6iJJCEZWCGxMEGk/RwIXgAtYDv9cS59ip/5zUBB/7Z6Rk4ep1cK8
 662UaUCwF48lNf9kNNra1Iwe/COHkekEGX336WRCY4HHC9Z7EekiS64v+TOc2NJFAQvdfN8ux2t
 97jzej2jsq4vURhfG/5h7nTtmzV7ialMG3Rgxc7G4xb+xGSeNTsyXZuRpaKdb7J7tFqJW1aVRUz
 pZHdCwviRIJe957hSAZGNpvs65LLLFiCxVytzSP0r23e45I7us9rEjW2DiLO7hAw4bA9Xk7II07
 fMD7HyJjOjuEWPPXyUzP11PxKssfOO+k7rMsKIiyV5VovzAH69TNw0r3DvsNc417WDVaU62TqMI
 mQAGYE++WJP2geA3DN/B0GIdCwnO3KbhLiB4isx4/HUiLIrREDAPTy4CiN8qudZF1vuraTOPo2/
 V9o5B60rXtO+9/fUANw7KLVi0t+a01bA5Rhf2sogiUMfZXt7A9jau8pKutlMrR9qYUwAtkux0dz
 bY4QzEpgPXbT/lswyRijn4yOs9BKw1GlK74mpPjV5I56OV4H+OQ8K3NZLKJwosCnlDqpeHAP7DC
 3vLwaNwrBzLO416OXpjk5KbYFk8OVbBrYWmsUDvGlLU08pXwN3CIBAUhA4Ce0jq+15JjcMgTs7P
 jU/YTGzHlNL4XdQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 4lp5JYqTpGZTxOywrdHGkVMEqRomkery
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX5qg+X94gZdS8
 6QyzuxmcPqI9A1XQ0fp34J/UliQAn5c0VgoFDMI3jHvxfkPjiXswIjfnPqqULk67D8V6eThUaJk
 bi1JBTZfNiLDYoVwzoudladnTfOUWrthpM+fTxT2qRp6TsQAWVYv8QbpjBhbDJcgCQCGcoaBvBz
 dA8lm8WrY4h8DEjg3LmQGRA01I5uh84yC5I1/jK31EWdByAcHkPf+8Q2947D5wtwr/XfyH3Cy14
 EJoEYPk6W9IjNhYzIaIWUWlNNI6pZ4QgjA7nZQ8FvNCxO4G77xvxDgnqgCdzoCm/Pu3+tptfQFs
 di7AlBn8GIC9tcQ+91opUVUxu7mzR0ybF9f1C0U8peUCM4f/o1+XfgPZ7enHnDHxKhyBqHPQk6i
 xA/sS6/qkxwO4V7GQhiJsKbn6ofiw/cJBEYLxXY+pPzxhwKYGlI7ewLXhZbDvNo2xqZslWiglHC
 6qanBxeJnr0NGohgZvA==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab4fe6d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 4lp5JYqTpGZTxOywrdHGkVMEqRomkery
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX6ajWYPsBSdWo
 57mtZQKaU3GVzaQ6M4FmRi2S2oSt+K8hkBpZHbfu82JjVsccisOuzZi++Tp9UeidalMc/b21WA9
 LzIpGIaKp34il25hxPCfs6/chwtUgG8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GCC GDSCs on SM8250 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 8483a1bc56f4..a90e4f30d39a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -970,6 +970,7 @@ gcc: clock-controller@100000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

