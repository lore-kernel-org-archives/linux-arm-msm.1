Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD55547886D
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390099; cv=none; b=qFtS1YCQ5gsO9sot0Y6v4XZpEGYiJi/RzoweHv7ryjSA9Rezz8ngmLomKApLQ5UHlM9d56OCqbKHojsHBK+ROg+NBbD4+bllI0l5vJpXi9KWvyDzdlh9TOQvxuoq8hlPYBycoiZa9R0tYv2SAqySurLhXoeQAB6bXjvJBj2K1WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390099; c=relaxed/simple;
	bh=cUsbHkmn1J4VuF5e41o1BX8iRdSrlFxvBixyQPjYfE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GX54yopqRmltahgaxVdkyGqbu7cLK7oCdDO6CBsuw8Evzf+9/PMWBAKQMVeFeX+DXQS/jf/BJ7ysOsXgBxes3LBOqICjncz2B/M/O1JM2D5hnnAbSV1JJMf4kdYcDUKm0vSYAOQnPm0i50gxyH+HXbj/HV5BU4F1GP2Z+0Ybj28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ja3sb74A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MjkWgdIc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ja3sb74A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MjkWgdIc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm17G727600
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ihrklLg5OrL2DAxrUMNU2HCxu8H/rx/VE5uwhnbb/A=; b=Ja3sb74AlBXuJ+Hl
	WnXAH6DF1KjpJy7ZuaR3FcT+84qElU7HwZmOj5ROM0gMlBqMwrobpZ++z4JVi3eO
	gEpBGOy6aV9Wev1XzNqqZLQ4IDwTEK4ul9XuOar3k8KV3iW0QQsaHlYvwmfph2gK
	NXVN7PkWoAxx2CQiJSroNsY/bH449eUKYlheVMhNjjTrtK4s6ntqYkU/nc85nLTD
	oDQWQCqbmcVlLGcX45aAGoWgsIE92IgldbDB/4A1OSyEufast+9cSIQvFYb22TVC
	KdruXRKUP6/TqT8Scwb5BoOGrN62P03qQ8gZJEvl8cuiLjBnEfEfGwb0G9dVTAwh
	RoEoHQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rxxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so601349785a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390096; x=1789994896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ihrklLg5OrL2DAxrUMNU2HCxu8H/rx/VE5uwhnbb/A=;
        b=MjkWgdIcLNx0QgC5uCGdytwvRLLPnSemsnPTasEcw2+4IBBXgr37iXvJEgrxbWouVG
         uTv4UC0ULu9alkz1XzNasa79KpKkX3FPF60cw56Dr9Aj65ZxRwCluluLzuVwMG06HgZJ
         cm5PidvSHci7rW432zhBdJQb1rb0Gewh1UCwVSYKz9Ro7NqWnOW16W1a296Szkp0B1Br
         j2N7GTNW6HzBxUSBjeGK5FVzmlhVXu7Ilwo9JWPlsBbVy9cpsj1jx2waAUKTvACtkjYF
         E1Nl2ioPgcRKZbLUAesb3XRsFJn7E/x3sVpvSiU1BkdyQf5Wg6Ut9M45i6JJ0K6cKR3v
         CpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390096; x=1789994896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ihrklLg5OrL2DAxrUMNU2HCxu8H/rx/VE5uwhnbb/A=;
        b=XOUFROO1NuHctwhJKSVYbGScHWe7uGPUlR7Ns/EUGUveUQRDxUDoh/dJP7cpNtBfNw
         OAi5Txinnov2/9iPnkPN/ePwKBrc0fNRTAut2fCjc1OEEzuUMEXNe8sbIq7CCGQT2IU+
         sSq/CJZcfw7Q1iCMAD0ji9RDut6CWGLs6FTVhbStoZrnmu+LTxxqA4d7+TnoWvqYABrK
         Bj8aiPxeW3TlDiEej/sSH3me+Jz2hft1poS/GYQvxoKlSiy5gEoxQpJAtEznD57Gwmg6
         WT7zdcDsmnaqOyQiERv9ceASPhHc1d9jZ9k0lnMwpeDc4rTH6KKC3BH54KftLaii34mv
         33cw==
X-Gm-Message-State: AFuF++kQ7MBZnY/5A8DLdRmYXksFj2Waa6NrGM6lg8j+32cCZ8HNcLGv
	ltFNOUEVj/dmXOnyJ8or1rGwyxwhtoz+W2r4gBXDdD99GvVZSulU/eYuhToSYlqA5jko3Wwax09
	bChRTaluQTTdLCTRV/UHujAXtC0gAX1T+PYxQI3waBnYiH0lIpFYxWKneGhkQq+MljzUy
X-Gm-Gg: AYBFou3ibsV6gLYzPlrh3tkoWUGUmpUZZGFNmUCuPvCr5fkYxeeYA222z2E6vmpRhYQ
	7uZbeyhATo1Y9SEnvYzzf3Le7XntYCN+lvWRc0skmJbuk7TwyoZnV+W8GLqigw93DYFcNz1gia+
	IJPFQgr5IdSJkqTnJCTJ9KpNALq4O7hXwhjV5sCJAdvFXjf/wewdhcLC9NuVwzQlS6EMbH7wHtN
	K66gG6Ttow3rJ+EjKQj5H3EG9ahixzbgRXKTH2IrlO7VVJ5S1cWfZz50+2UtUAEduLr2doJwGNM
	JbqZpJ9zc3772XtXI1JTjFM0lOXx68HpJQLkO/Grbgq3T1VIk98CrNm39qdexXG3gm98v6HHZct
	Lqhue7hGH
X-Received: by 2002:a05:620a:4384:b0:939:733d:cbe0 with SMTP id af79cd13be357-93a296fe03fmr369460385a.3.1789390095727;
        Mon, 14 Sep 2026 05:48:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4384:b0:939:733d:cbe0 with SMTP id af79cd13be357-93a296fe03fmr369452085a.3.1789390095171;
        Mon, 14 Sep 2026 05:48:15 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:14 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:04 +0300
Subject: [PATCH v4 05/52] dt-bindings: clock: qcom: gcc-sm8450: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-5-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=cUsbHkmn1J4VuF5e41o1BX8iRdSrlFxvBixyQPjYfE4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zQcJNmukKR+kksFU2bnbA3PmfFpO3/LTnIF
 E8Wf8q7+gCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs0AAKCRAbX0TJAJUV
 Voh/D/9tX1OjNwmpTDwbHbJA+tJ/i/WOzov1RKeATivyLTF6tcZHhrFahfWsclFW7vFzF7DPcsC
 0FINrPifzuMl79GCmTeird2DCVkNuMMS6aaA45bl5mRuYYocIrx2hWYSb9FBSL+cL5feyxLl2rP
 n09P8qD+ayJy0JTF7dpYsjyJbBbd8jsGtEH9/CzZNZkuK9qH1Lh1bsbkWoUcqHZvctELe/gvMbd
 VEtRyQepBPaVBsPnkCnEIIN2m3dkUaVxf7bCm/qOAqcX8Velzgi2+PK9KdV/H5wOXfjwsC6+2pg
 JxUtnESwBHkYUzlPpaPkKfOOkmLe4zRfPoUU6Dd5E1HKUDga4A+nyMpYSgxORI7bM/JU7Imi2YS
 ceZzXyK/snbVSlFfEfxw9ScqGd1cgHYzIWXEciSXJoCh6GJyGRrJGUBYNZ/IBTshLElRh3hRdqT
 f1vLtxa5voR2tOmPwSC9Ih2mXcdm97cFyfNX4IaZb8hcTQ/e7rK8V9+j5vZtHcHG4VOta27a6jE
 FClpallU6Vb30hyI0Zyu4ngnyJYcYwlMvVvJgyZcHY/Yh00n5VrJfEq92+trKLg9NcuMbY8+DyR
 g4e5OBWlfX7cZth4VcdDuD8M5+8eAASBuavZi/DLBvw+Uk2AxaL6XsCHaZXPDqgcCQvHdu7fwlp
 n6/kxlS0JxZOfuA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX8xd7BtEW2F1G
 yAUyvo2JDe8DVQLlnQf7DRukfoX/0SmvJ9i6Rsl/gCIPWGl/pnycQqF2nKvoq+/yPDYdTjMx5He
 ry5pmqd3yg3ns7A9Di1vDIp8vjYChFM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXzxDcgk4qiRqk
 /WUGts7R+18pY0cxDN3TRVpJMuloZCE9G6q7P17C2HrOMazZoMZb1I+N6TerWnZzr/baTjP5723
 hxkhTF4hHC0N68IGjTqW44QXm2k8ZyqwxqmM7x5oIchbjt4Fa321kGBCKGmnl4P/My5NuyJMvUd
 H4ArFY3QOFChpSyFHXkaRTO8eagnQAlKAwmcvrmM06hnX22dcfVLRnsLt+wE7SVRHwRYGaiqL8V
 qXYUwMsKhwHMu92ebRiLFe8xA8DVKVUybb3vpHlmOCYaz5/Yslk4RVEtYGTrh7Q2xHJ5eV/fAEJ
 EaOFfNxZkD8r2OHIYNpgI9dztLqP/qrrOQnOUP/MuKjAX3XmZA38wb8LSegoZuUUnmVCgJ5XBz2
 1iBU84qk9M+8Go/xyKz3U0v65wRMnLimSXkt2VmTk7pjitowYzfVQpF5Fd7GDcNjzpATP4gYXnd
 iGC2YAEcDnkMQ+I9l/w==
X-Proofpoint-GUID: 5fYSTfnRiUypbfqgaR8a5TqGRFzH9jK3
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7ed10 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=z35zQ5kvS4wbvuCDxioA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 5fYSTfnRiUypbfqgaR8a5TqGRFzH9jK3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140182

The GDSCs provided by the SM8450 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required.
Without this dependency, GCC GDSC consumers cannot vote for CX and RPMh may
undervolt it.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
index 3169ac05e1d8..793ee9e3ff10 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
@@ -47,10 +47,15 @@ properties:
       - const: usb3_phy_wrapper_gcc_usb30_pipe_clk # Optional clock
     minItems: 2
 
+  power-domains:
+    items:
+      - description: CX power domain
+
 required:
   - compatible
   - clocks
   - clock-names
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -61,11 +66,13 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@100000 {
       compatible = "qcom,gcc-sm8450";
       reg = <0x00100000 0x001f4200>;
       clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>;
       clock-names = "bi_tcxo", "sleep_clk";
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

