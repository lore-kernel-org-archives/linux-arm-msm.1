Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF49411F8F
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 12:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572994; cv=none; b=pSEAz3SKJhEByfQNyTwh6BwtfYbvuIRfaTydQgYx+gpdj9HXEhTFmbKawRVfSVi7v9ao3hrRqScwX+xeuEuVyO70L0Z/0d9ABvYtmUrbZHMDokVideBwkFrCwLcJwSJ023AmD74bt2U0fH0mAfsC6DErsxwhJhO9R3mFBI4WULI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572994; c=relaxed/simple;
	bh=6qFf/kDPw9tgUbvy8kWxoeUEXj0aF58lOGYhG7+ZlZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UnNX6KwyYHVJ5L8Y4LSO3FAbztItoX6IPbxJ/sPO+fJ+aI5jQfXZef1hcbVpnKvFZFDA2fsCdarnMqp1xWAdYd5kIHnVKvHDfJHmfmZWnfKDRW0zbSNPlFZkHRpN8uKKFbadTdlBkfB/q6CgEWwHP5aFGy0GTNdzaa8e41/cZro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LsexOkjX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QUsZRygl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LsexOkjX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QUsZRygl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMiYB1673456
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 12:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e/IushsgO7MvkFlfGxM9MPtKLnaVKr9D0ywtvvyNu7c=; b=LsexOkjXSwQjI6Yr
	TwJw0iVIoATib8H1bdxA5igmvu0+GIw16P1jZvVv+7JuV/ewX73nrufrCUZ8erQ8
	QV/B6skkzbBx/t2UagJHU7QYnpd1+LdHPe+OOPgfgt8vT0dRzJ5i9MM+AUF+Jqzj
	pWztDfO8zHkD0NqGxuii47VhCBwa+pgdcisOZrxNBJ9UXCWCYjwmb4yqQXn7wxjD
	OiF6rgbplWchRO3ZfRBfcRAV+p16IWxmROiSKeMmIH+gA0V0FU/mjTu4qtvgTB6q
	BNR/LR97sKdtIqmJF8qN3v43/HToZTHJBd4CO5oUolKN9PQizU+nQF9VGYTFHoeW
	vlx5Sg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf12sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 12:03:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e9a2b95b5so619545585a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572991; x=1788177791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/IushsgO7MvkFlfGxM9MPtKLnaVKr9D0ywtvvyNu7c=;
        b=QUsZRyglJJQWaBweFsVmoi64/9b+s4VmUg6TsZ6vxRxxbFeRcKv2JzPbXQk4fuHjRL
         jhybFQefg6nKzTpZoEfKo99r2pq45zjWy3DfbUPU8c9bHtLLyFSjvUftw2+5IDNXB6Jk
         VdqIcGUQh+wfVLzreguphCVcTFe8XvOsTjF3QfhpMPWgk13HTo4ZvGyS7y20svf8STo2
         AJh7IvW9bjq7qTW/2kVJ4TrnbcqykeKslJ19zeiPFIkftlGCc515IOQ2KNLC3BCvZq/i
         F89Qr1E90jFxoDFeKQumrXbH7ItnzXnrdY1VDTXAxJMiFxTxS7TIjtHFcxDgtZmqYdHp
         0tEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572991; x=1788177791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e/IushsgO7MvkFlfGxM9MPtKLnaVKr9D0ywtvvyNu7c=;
        b=YYEuI3b2b68QAqWMIPz10Is0qbIjc9EHY8HvVDJllxScB6wEIWLyJ/M23nkFOhjugw
         2yZZQnNoZnD9FY/FPgbu1oQWQ552ll4VFSQGKG2KjIeTh+MdNCKj/lH5QTLAAIQUK99O
         LDpxjUIvNLA09PpY7T8FDD1ujDJPO7FWxdN6dZ3Ecz3T83Q7SnNGgaTOyN6Td3xWFpon
         JRL+cryPDC37ew5ZQ2YM/x5PCTNg/ob5Uk72IIFhzEgldeNpbwp1iG3K+cvBMLRpjaGV
         1LHZ1j4kUWCydLPlBIR6kdeZwGknMhj8+VQSnKA4e12P9KW2Gy/VHK+7BzY0kxnRF2Vp
         VvQw==
X-Gm-Message-State: AFuF++m5oRSASZl0BJZ8OQy41XGEseflrFv62SmVH/CqFL/L+x04tJ/j
	x64iEyY9zhD+mrezgH8VytGJodI9BNDSakA9tGcG6W49N0UcuoO6v7SJr4CT7PYfVA8aWxaymcx
	JROaNYo+d4M/15O1/4heMs7FzJjDa7qCwkUNjJH7qf5q3iFzotjvA+8JZOCsFyTnWuIdc3c2qwI
	FU
X-Gm-Gg: AR+sD12PpFBGeu1pMfhdS6/2MB7WHGLW1iniNHF7+kIjM69RcmLqV0rvw/2urnLq1dQ
	41uDFz/GT+ryZonIhSIexmkJyiNgDCfzGUDb6AnIgkq8W5wvTWqKizG3kDIB0Lkdo8OWPXFH6hc
	Q371MYFFdSDXskZEcwvAKZimd3xRxZ044822Gz80aesWdGZnZ+IxyyUAf2nrZlXxK1j+wcMoWsz
	0v8BXjMKk8sRzbI1tkrQLBjKEzZgjBv1goZvE8O0w0DYUHkEkWGLNZo/ABV1aJNLhc3jdGF5wvb
	eGKq01jjPYHM7c2N7IJvs6yq1dibMPsZVm5l1/xaLX7Vde5q0FE4mr40VJxAd6sZ/ypXttL03zb
	8Htv4/My0
X-Received: by 2002:a05:620a:8217:b0:92e:7533:ef63 with SMTP id af79cd13be357-93739461df2mr1869978785a.13.1787572990935;
        Mon, 24 Aug 2026 05:03:10 -0700 (PDT)
X-Received: by 2002:a05:622a:5591:b0:516:ed02:c85d with SMTP id d75a77b69052e-52df5637a7dmr287456001cf.3.1787572510985;
        Mon, 24 Aug 2026 04:55:10 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:53:56 +0300
Subject: [PATCH v3 09/47] dt-bindings: clock: qcom: sm8750-gcc: Add CX
 power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-9-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1847;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=6qFf/kDPw9tgUbvy8kWxoeUEXj0aF58lOGYhG7+ZlZE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDeg3Aptz66KE+9arLO4DSsW7tzotpNDfdO9
 BKgDBRgb6iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww3gAKCRAbX0TJAJUV
 Vrp6D/9LS5BOj9HDcLwpAH/D6hGEdjg3vkv/540ATe9J4DQTQh8cCttQoSQ1aoId+8ddc/LDiM3
 eY4YEXXluWUt8gbNmXYfZ/zUYdDf0a0MT6RJQ1OO19a5K6C2aVqCmknviLbI8KhW6mRlF4A4CRI
 VHGloCOEo5KDeNgSTzKcr/AOwQtqoK2NfsN+k42aF2SlfCKV7v2OgmTlF3l9wczp1DAdsB9wtWe
 SqBSVUTZZxjf31QGbB86BEGwhdzxRPO2sh+1jc//20af1i8lcbhDyNzwNqQUrHfuM1YRawt0co7
 qB9540F56R8ZdDoIGt23KNQ3wszxtSHmnoUZ900J9MnLg1iSAPL8n+3zaWJMmPFmWV8BEDaSpxm
 xpMc9jzaymrKfjpVWVMhgvpp2YuSWg57Oq2maE97TYZvn8/w1+Gubs48cD7hNe3pRMXTEH/0dkR
 Q6IyqFi5hERadtecdePOhrh7pWJWGm4m3bmBUY/jp/Yo1RDXqwi0DS8uv/KBRXoqW3wPA1Y2wAA
 I5beZKZuyRuTxoPbCjRjL4aKrKs2oFZWNajRmiBJTtdr60xbk60fTYdOwEuaPqRyzJP4D/vaTF2
 Yzr8gCzlTvKwnsFzjkY6wQov76SuCHnzSGdfyLYA8UbJYQ8yqcpbkDYYaP68ObDIksbUCezMU1n
 EgYkuTqevEWwV0A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMSBTYWx0ZWRfXxumar54xnVEQ
 VMIjgNTLyGXVPHigq1VR/UpBRhHfNJ3N+lHVhS/9U4/uZbc9Critl79cEnOMa0zShAxNjKYaKzq
 lDibnhXGFW9kauDZPl6QnjeUxj+4qV4=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c32ff cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1VWmMwf-hiIXLgPH03YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: B3ZmwxC2fPQE5QtQRnTF4fmsZHj-bpYO
X-Proofpoint-GUID: B3ZmwxC2fPQE5QtQRnTF4fmsZHj-bpYO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMSBTYWx0ZWRfX8GwIOotfLsFf
 FAUZInBdGlCF/N11o2awJlt/0JN2LEGViBYsVq1wJrIGJDRmBOKqkl57kc50Cn2OaS8w1HLZ/yV
 wf/SamJQ4hs5mBSQGzC0VC20i4+EjDqOAPySnLq8AfdjBJflqykyOs5kr+vjfr8IhX08hTHSbJ4
 2XRAopj26yby45y752dLO7nMx9BU6E7QijDzKPBYNXWd5OjPcvJZum9aTXRA3lh8HsA0k1OaD30
 2+WJ1NZbppIn7g64ldiQdbW6ckMDW7pVichfFVV6wGSnCl/hFRTakgYrl/2sdQDL/8K3qXHGYS9
 fi0LPrO51pNDs6fLNhsa8Y3wyo2yX7oEu20R9Mg7TheeKt7pCuBy+xKfFXYQ/j5eqdlKVYBTMx4
 AF23CbHmXbqx+pL3Igw2qzy/Js5nurDqJ9COoRiHwthLkNdQZFiY9gn/CtXBHr6CmdFpA2z3/72
 3ayW9vwXTwLecU56akA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240101

The GDSCs provided by the SM8750 and Kaanapali GCCs are supplied by the
RPMh CX power domain. Model that parent domain in the GCC binding so the
provider can describe the dependency in devicetree.

Add a single CX power-domain entry to the binding and make it required,
matching the hardware description needed by the GCC node.

Fixes: 342d2a607450 ("dt-bindings: clock: qcom: Add Kaanapali Global clock controller")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
index 0114d347b26f..f54e836f3135 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
@@ -34,9 +34,15 @@ properties:
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
@@ -47,6 +53,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
     clock-controller@100000 {
       compatible = "qcom,sm8750-gcc";
       reg = <0x00100000 0x001f4200>;
@@ -58,6 +65,7 @@ examples:
                <&ufs_mem_phy 1>,
                <&ufs_mem_phy 2>,
                <&usb_1_qmpphy>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
       #clock-cells = <1>;
       #reset-cells = <1>;
       #power-domain-cells = <1>;

-- 
2.54.0

