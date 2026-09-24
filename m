Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB1847A0C7
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246502; cv=none; b=Gmb6pYLAUpyogCMvpyP0BAY4wbZGzcMypY/xcBjMQrWJokAtTNS7F0UFGv8c3qKspk5MTZL0qTImUVR+f014STpU5PylQO+rRAibXnhX2Lv9bZE04tKkSYmP19fHKvQMMwau0pWIn1db6t7gTGZvQQod+OfRgvN7Rrb6bK/oMCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246502; c=relaxed/simple;
	bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nBoHM3CdtXNOleMScOQW6+nDu/2OACSFwX/QvV3rAE3mnx28LJvmmcluBVrRritC0Kap/a8RnCwuFQ7pVqwauj9IYwUuhl8t4ii7s6czeTVKSvdKinnB7bPezn0yqmoJb4gsRhqQfv++RMVejDydwRL/U2Tv4Axuhd76WL2mRws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Et6B9Fh/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2N8kv7e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Et6B9Fh/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2N8kv7e"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PDxQ2025636
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=; b=Et6B9Fh/ZgyWgkdl
	btIIeXweDR2nqhOJrByvH90i2JVQqa162MY1Q45Js10d3rrCTIrEIJYJ0kaGzFbn
	n+MyF/ldGjw2gikYItqvHolYqD5VcR3sjEre7KvsQIgjHEBGgIeQJz98tXZS9f3n
	37yuT42E65YhWNaPRpAChVFzX90YPZBdeu6jQpcUOFuz0KcFvg36es9LdioCb5d+
	u5MoCTX1omEu8izo2y9yirwtLw+aD44IZ+zWp1yngBvZNNwye9XU8ihJZ7+ZVZsK
	66SHBY8sqDDC1K3aT1BL1LIaYkRKtTqOC+Izi1KcM31yOxUg8zKDNP0WfPvT/vqa
	DYNGOQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgt29x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so340795285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246498; x=1790851298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=C2N8kv7eDMfYPpwC2kBma1qrjViRKvRMbyP3gVWPqnBJZ3P9kTay6b30lXE2KyrRqV
         t4rWGgiQPkeZQZu7LaTv02CBQbqlTVM+q+BkQxWGiqpIZ73Y5jIGoSa5bAWOZtO98rYS
         yrVWF2zMyDX83XXMU2t7yG6mLAS9dJYE5+GyT0IOEA8+oLicuf7O7kFiNvL1Sb6jtpA7
         t1bipimMrcK9SSobQDh1cZPTPSyRc8kRG0xGvuwJAiicRgGkDv8S+XPiX48KO0NqGzJa
         wVtFmigYUcmCSrG/xV82pKWYeXMWylO5CqdBM00IHM+ROVp4z4fDSMHyxmHievqBrCIR
         dnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246498; x=1790851298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZKEwiJKJvvEwEp770Bg7jSOR7ui/EKT5qHlpiE7oxE=;
        b=ze6BtkMWUa6m9Y1vu+84pUjH+YnTNTJa9pdbW9aS+4pchtnVxoVRhqTYxe67wNZvTy
         fxdwrfcXk3yEYErmERFh8tw2DBRxIXXRLm56d4AkFkajAFu5a5vTKUuiEoWirApfoiMU
         8vQteIxpbxTt9JQBzYe0uXARzmOcBP5UAS6nyTS7C70zLILoTuyIfsc7KsQTPYYoWp6+
         zrFzQq5ECmWvJ/YGTiSeBpofQxULAOshHyvlOLDSkz0YDhaSP6dZT4S5OHrULn78taXI
         ngGA9WyslUZo7Ef6mc8+9yUfBdqMJFECklal2+unSMPVjqz8qTaxvq4MHXGgJxs8SnUp
         MSVg==
X-Gm-Message-State: AFuF++n35zX2Flm9Qf1T2YPMCfvaxtPUDhYzP/V0jT2NgUQg+44I4CTL
	VaTDLzV9H/8cafJELrJljtN3MYWKCqx46B/k4LVorvJIEELEvRrtiuwRMhqXgjpuaiLIbE5Xcm+
	qew8LqFTSvySCsNFQmrStZNOXKGUXTS3ci3g8s9WG9XgwYGQ4cnksBt8evXBY/W218H63
X-Gm-Gg: AYBFou2qGFeY7oMa25NsBTZTlvv4wMxWl9UYZdATdabzGlvVNgHhwHadv5v/d1YBdpw
	LOk4VPywvtfaE779OECsPIEYRDpznqvz/pS8qYTdj85fwmemofJlfUR/G5WFNdcJhqpe96I+kp2
	Mqp3vOL20jhHVkhIoGLYd945ni8ww0K8C1z05u/2U8SUyyKszDO0UNxRxTw6meGA5arXZ9F/yCj
	ZKthJMcSAdgg9VSdUH+XW/O4AHI4Lxfh61M1p6VjHzPDyrbv2DVk7aM9lQM024we4qj+vSiE2yT
	hiJP9t9JgujJ20xXY4vcNQ+vCmREMUCKzNK+0PR2FiWd+h6a8zZtIggAfvG9voQ/o6sPdhzsSzY
	AEmHnp97s
X-Received: by 2002:a05:620a:2951:b0:939:a6eb:735d with SMTP id af79cd13be357-93c3624c7acmr229121985a.10.1790246497430;
        Thu, 24 Sep 2026 03:41:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2951:b0:939:a6eb:735d with SMTP id af79cd13be357-93c3624c7acmr229116585a.10.1790246496699;
        Thu, 24 Sep 2026 03:41:36 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:47 +0300
Subject: [PATCH v5 31/42] arm64: dts: qcom: sdm670: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-31-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=920;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=67xdo98Lw2n5IQ4QNQeBtdkFwF9GpDdKirBYMES5dEk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP34ajY1tA0w98yS3hw0XA27huw6oCAxRCgr6
 rsOJnKD34uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT9+AAKCRAbX0TJAJUV
 VneKEACELGI47loMvflyG4FFK/wZKy5oxDtS9aF+vm2ffCwbL9oyfYKp7vnIYFcOUuwHyvdi34/
 2iZ9wDdWPtsnj68YN0/qhjx7tr6DcCSzkl40v8R3L6zqBg0SS53WZ+JTv0uFekXx0lA7D6UYdBY
 JdEuOZQFXTPCZifDVrFIZ7iJNY57nhdi7bVJ5rCMcEBz0M3SWr8gyD4om68++E5DcJE3pULIiin
 A6cBNT4V5xZ7lHSaRH8lQUTIZegUEP08dwkDt4eB5YnlCk9beE/lzGMpDBbdIaVVgRV64VM3+ot
 DmTBr1A/e6ezp3zgfVt8jZ3iIJibVNnpiuSOj2VMWHkyLsdDoIr5cwuo8GdPuFyqWwt7i73+ghj
 ajjjSquI+nhK8MQ198kfthWRAEm2fjDaC40l0J6wFpwrhvDJl/TfON7X1odUqZFsZ5YFGRLAKQ1
 H0I8/Ed3Rp3kJosw8gNE/xdu7dGRbCHaKkUjgszKNmIGvCF8ys+UdwkcFALmgWajhHUFpJ42F7p
 ft4xMOupM8jT1IaNpMqt97XnQdX9fD64MCZKYgHEtMgtFuIW95d83GLdSj+H7aLNkRvAYK83v42
 v+44wI/MAQpDxG/8LzEtWr9LOGYcJQCFznwt9UrPaRP5saWhfLMoYPhUOoPf0v2pdJlbF6HYtZT
 Ep8BaWr9+VzghbQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab4fe62 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=82sHzFGN3NSTCjlL1roA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Ldro5EuUOoRX0XIZW2NKEHegVsEPFoL9
X-Proofpoint-GUID: Ldro5EuUOoRX0XIZW2NKEHegVsEPFoL9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX1FeYLWfSKilA
 8ZyGyUX9a5LX98dnAKdcQRuIfHfSWPXAAmYoLGFyPXxMD/FCD5JovHJQpu/4X3AavnbxxG/5LgX
 LhEWhBDV4TWzEcsRqqkOnVS2+r64U3k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX71CE8yqwAkhz
 r4VfcjBoQW1FTDzI/Pub3CaM8FcrP1reGskc55ziiV28iZ6oEI5qwO5sgYLQeDyI9KDVFVsddF3
 4gVAxMyQuGU1p+B+fp/ltV+SGKZCef5BFwsMXlLG4T7hNVSiKBBNDTwYTmDN2tPtJPTBhOO3HJF
 wn5KF3LCoRSAFca1+FLcnCElxisXqdoCnW/IEaCn0s6//OJFrAEDbea6P908tWqvVMW5nHy7ZpV
 qYYcgTLrFX7vUDBfhQKIeRch/l9Tms7JYVqQ+Q03ZfHw7gkrcJsQUberLtdn9uUI1u/y0jgryPm
 +nWZsKBLjrWJ9hTjx1t5BO6Y0K5IxHnPUVUA4n2RgyIxCQHMZlOosLlv2ynpIGxd5J+KFpGA8WB
 C+JKkN0/MKL+pdCGdkoR+VnB4d0H8dkjMPjhuL8UWD0y9ApjVHlFoTMfn1dGVWgoWpdWWZtnt2h
 YiuJhuIVW5NAwHiFGOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

The GCC GDSCs on SDM670 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5c60ea36f04a..1978a54db23b 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -626,6 +626,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd SDM670_CX>;
 		};
 
 		qfprom: qfprom@784000 {

-- 
2.54.0

