Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC72E411FB8
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572513; cv=none; b=K+AZkwkyCUhzTBf4b3hQsK6QwXCEUebFWrtYSkdctp09o+X1LYeVexBefENN2pUfIfYSGKZUcz2r7Y+umQJNO6jHOkmAhoOx7rl4unpMqU5U1SlEfP4Eu6c3TgZBD3PU1O06PXxEBGRh0fieXvXwhUdXHbbIt0EmWam2LHlDmAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572513; c=relaxed/simple;
	bh=B2v5sAzVWh+Y/KNZcsDuUg3ogbWUHwCfTadAt6s6HK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PErTes0Ug2FL1riLINNSIbrHTQBsCslt2IR4NvvbK9OpqDhzFoxj2zrLBEVKeotIjlz1cfD22JftgH5rAXzfM5B5gGJowKEuY4Lj1iDGYX5kWisS4FmrX5+BuE/YHjZXy7qH88zzcOXm1vr5v8Hpmj+dToshEGmRemwNMNAI0cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NE+WZnlR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gLVqQCqo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NE+WZnlR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gLVqQCqo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMYGc1673198
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJvZQe906cJR+Muj+RF23flCnvQiEIC/iQkqh5pf9vw=; b=NE+WZnlRk31bOy6I
	uzohZwywIVh5tnNHZPgI88DaH0ew3+rId5YjlhnCE323okkFuxaQnVtBj+7LpPW7
	YXVUyiIM01AGDjKg1Myy25zs7p4liJZ6e7M0EMgvkxkxhfN8zR3B9oPn6R9ago5H
	MspOZWoe/4h7s7mvkpuiSqOYiMeViheKmVFe5Dnb/H7B0qotueDcW36WJATf39I8
	DgI4/dq0B8X5fLsLG6CQTV4eHtbpAODJgslI0ayuy3mvfpJ8h/GruE3Ba00HMa6m
	Y+ISzSxabwAI3PRvSqLlnLfu1Q4XgjU2WN8K2TUt4knGlJRr3jgW4B4h+Hi/0B7W
	dgkhTw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf116h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 11:55:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso29870776d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572509; x=1788177309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJvZQe906cJR+Muj+RF23flCnvQiEIC/iQkqh5pf9vw=;
        b=gLVqQCqoOS/a21csX9PpYrWrrjfrUnWXXKd9s9Wb2ojghcg0e49E5XpmzRvJnREI8G
         1FkPDdVXfmcGtKwrlyueIWEXHZiZMWlPE/QDAhtTYpKmq1KqlVn6CVltJqT+Y1JYDfUq
         N4rwKwffcX5Y8HI73EpqyKGWz79toUSA1eOlOvp1g9lcGqDRHVk+j7HsiuAZZ1+97sUZ
         OpFpDUOfygFEEsUK/cJr+WHT2sVE/hqu3/P3iRNoKmQ4oGob6wzOBdlqUfAXm48mOB3G
         kxgiYKmggBgaLvfHMjgWI4mte50uQmC8m/83cngKT1yZSAgeLRdGTYF9aSRQYaH1p4Sq
         2JNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572509; x=1788177309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJvZQe906cJR+Muj+RF23flCnvQiEIC/iQkqh5pf9vw=;
        b=Rtt0Cj0LukVa4BI3aabHcnbSXBTFAEqCnEPXa2NrEn3lIk/Wd1JX+7C4fpzgRE0X3J
         SXMIU50dqfAtsszLkYf3/JHz7bcAwN5Nz/MZ7OuGImXYR74XNLNyAW/a3yujIziXkOkp
         oYxrC6EL01HQeJpkNJ0391CKvYqXJHs8nt+QRV3pXqyLNmRClM+S+ADXbPkcmkpI9LUU
         akLrgBYVHSzWv65KrKkLfZguq2Zmzz6LjR3WlzWlAFbppEJut9+B1GS+V7pfxT8Kw0nA
         GrVWrWIOB04OuZxr1Dzg7Yv01jIElQMj7OTPN5MV4lxg2WQHuwYg3ZIV2BqJ8Ifn6Nux
         O48w==
X-Gm-Message-State: AFuF++mL2sJmkRPHT+cxxikt1ooBR6Md/fmd0B9rggNNV0QKUUCsUuup
	dVqzRXon3uCwDdIU4Q/+SaI5GQjo0YmMOac+ck7XUjd7dvA3XUKY9iKYTMkLs7fDayFsZw7YXzA
	6Kbp+q/OKZS9AFUOKhuRf1KombvQgtUP/DQ/582meNnpmIbk938nGesFTC2YLuEDJrgbF
X-Gm-Gg: AR+sD124zPShwSAkCt5Qo7rNMItbdbO10gyAweaLg6IY4JQ/IqSlWX6jENQiZmY17Ua
	4sm+B74C/6GP5/Dfnivhdyo1Vg00r+kOibjlFObCashe9+5o2paFOkUjWLlfODjgFvL2mcVd6he
	xDi78gVbt5UIOaeK1RAKC92lWcqUV2aKiT+1oImpamZe/5K4iPxcLKY2efor2LQY3ZGLPXMo19l
	FW1mM6Nj1sw4C8ozrDTVQ44jOJ1f3xg53GX4PXo+I5J4go6fCCFy84yaq4aJsbXpASDkzPQ0a6a
	FEtCKPq0BLqdDDd0yCGwgfCuJpswXGhjqPgy8lO2OC347ZZIINdJQLcTaxU6s33DQZykX+/nXI4
	LEmJk1FhQ
X-Received: by 2002:ad4:5ce2:0:b0:90c:5a71:f857 with SMTP id 6a1803df08f44-90c80e2dd94mr223902486d6.14.1787572508714;
        Mon, 24 Aug 2026 04:55:08 -0700 (PDT)
X-Received: by 2002:ad4:5ce2:0:b0:90c:5a71:f857 with SMTP id 6a1803df08f44-90c80e2dd94mr223901876d6.14.1787572508057;
        Mon, 24 Aug 2026 04:55:08 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:55 +0300
Subject: [PATCH v3 08/47] dt-bindings: clock: qcom: sm8650-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-8-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=B2v5sAzVWh+Y/KNZcsDuUg3ogbWUHwCfTadAt6s6HK4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDd5ob+WiJlEstnbcvpjMyxotrq0sVZyAjxn
 Hh5BJ4I/8OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww3QAKCRAbX0TJAJUV
 VhfQD/wM4S6e8bCj+fH3NQiUjVUzvQ35Y7MtFRbwk2shwGXvf2IjoDfmUu0c93NUixpsf+b7C0t
 sJSJI7iIn/5cqRhm68UQeX1NQBhDqavhhN01nVcflMnD5MpoL3Gp1OqcFAG0pep0bbnWBvbwWzc
 Sz9nmiVXqg71ClZ0kpGC/ufsgTnm6Utqw+FaF+Yn0nCX3c1KItjvQGLQ5b5gansMDmMv11Ip7lV
 UZ50/bCUirDqZCzfkFpjlFRzVz4tCM2e9qwGH8w0H9pBLVcO9Ijgf194pIam/bAZMZGMn2IYrMk
 JsWHxFMnNYJOlyVpWoOYWlkynYOTn3MWPdPsKD8yIeJD6ihkRJXxCfM1xeGbT+dH1ykMExcOBFK
 UO5A0QP8Hnx7RGKrsnHgQvgcQ4Ic6KO8/yDVNMQi/J1QISO8wy3Y3Blebd0F5+qBkrgViyUnygM
 K9wYH3yThEPLv1rSRjfS1vBUKJMxCDFZKlgk44Jmllp8vAQxRI3ef39oG+FvygZRMxiX5QI5tbm
 rNy1D0Zb9PjDapldvSBLvK9LVTVWnGbvhNjFGGoYfRoKJEF6MBS+VRT9UPTxbqBk9/Bfk5XM0oq
 8e0A2pr/1WrzkzIBDlNTNZFIVD8SZiXG2UzOBdA5UNlqsQIPGzmrfj5ncII4UrMFasjZSYA4k02
 Sp9v5jJjla3LhDw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX/V2WyT6waLG+
 kAjHMkOIXmjTJ2O2nvoDAX2AW+Nw4sGLYpS1k0prAeBZE4mBJzPuNUZ2nK+G5fW4JkTyo9glFmg
 gXOL8wB/PY6s897gvw6ExlSPSe7do3o=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c311d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1VWmMwf-hiIXLgPH03YA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: JKPDlwuzOGZIpnvH8-DVwE61rTp1rt9y
X-Proofpoint-GUID: JKPDlwuzOGZIpnvH8-DVwE61rTp1rt9y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX+ThbdHiDcVj1
 3dwLtc78JrR0JH+zL9t34z7qnwAlYsH+GVLwTvxSLOVcH/brIqn8Thy5T2iw+XFv4OuHzKIvT/h
 xP1FBcLNjyhKOEYE8qyVJgpV/modDzeBE2IOv3vLm6Vd0Tu2YKqzbAUJaUKxC6odIfTZQTsQxmi
 SHsnaxvtozk2TP8kFGr8HxgGNlJdiUo1fEq0E6SYlfsnlsZR5E9aAFGIUBlZ+ODzuNj6CbUkEHY
 dTve8GVymSKU/Y09fFy6Hpyua+FxhI48BH4Q78t4l8v8PJozz3ouNNLz/fDI5L4/F0tenhnXIfT
 Q0xQ1ysjqbBC9UAXPOLmSHU/EPzG4bnUa7n0F8pZEEPlPscs5lDAuGQAELzPzZlNb38Iu6GuSIh
 xMeiZp1DbwID49vHcPRumHkGKb/CQSy+jcmXCjbznPT2l9ZPrSbY+fY/iiJZkOXLd96IYfPabRf
 KwseUIlsLYO6vEbobzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

The GDSCs provided by the SM8650 GCC are supplied by the RPMh CX power
domain. Model that parent domain in the GCC binding so the provider can
describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required,
matching the hardware description needed by the GCC node.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
index c7143e2abc80..f77b184e0b1e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
@@ -32,9 +32,15 @@ properties:
       - description: UFS Phy Tx symbol 0 clock source
       - description: USB3 Phy wrapper pipe clock source
 
+  power-domains:
+    description:
+      A phandle and PM domain specifier for the CX power domain.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
+  - power-domains
   - '#power-domain-cells'
 
 allOf:
@@ -45,6 +51,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8650-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -58,6 +65,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+       power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

