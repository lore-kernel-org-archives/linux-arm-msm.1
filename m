Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898252;
	b=aca7VnN9l9qd3xMavxq8Wh8/nax0Z7f6lKXTO1ldZcEV5fx4weni1INdREMeMmXSXwpR
	 l4GPvFjmkuQLd8/UEAc546n8Kwz99MY/2eViTI+0SpPfyCectNoh3Eoo2KjZUk546LYqa
	 ZA7I+zp0jHQmjLK+VdXFjY7NNlJ6X7gAiBJb7KQHB0ly0vYeHLDuYodwxCcV8z5+wRYdS
	 mNDcaH7XoB6/Jby9nlPWPpUAk9qiwpsVB6LKdOkTUcbAwZKDxrhN7pj0/STD9Cy1g32bH
	 ax0SA+X914POth4TpCMcuTv4jh2c0Zo+nU2VyiHSOTZVAKs4cPTpy3G0mYIjtXTiPeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898252;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GPWtMOB6rl3OEO2BJc8BeqPqsVQ0boeb3cUKZRCwhjI=;
	b=O9882/6b1F/glKdVDltiQpZb1RoNA50cLELf4kl4ZTywN/T2OTbaL7H8RY7gf9zqs+XC
	 iTbqVPGZZIJQ3KcpHJ2i6Cbk+C9yNx4VQ7a36+hPTVJu04A+P6W85bl3vfpLXolqLlXUw
	 UDTHAU3aDrfNWRL28yQzltvG2BAY5SGABTdr3kDTUgTsy8Fbx3yOJvxo9uI4BsUTECzXX
	 zKiW7nPgLCy3WV3b3KzvK3oPCid13Izxyuly3Gqlwz+I7lY3yctWBl28j9YhoOUn9O5Wd
	 3pCJsegvWotqE8YAkQQxTA+1g1hDnEVKVVhe7kbsUd1Pwpwe/VmHoUTMBju1/+4CPtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dLj9O9L1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IjwleXyV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3193960A262E
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3193960A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dLj9O9L1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IjwleXyV
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P161Nw4172006
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPWtMOB6rl3OEO2BJc8BeqPqsVQ0boeb3cUKZRCwhjI=; b=dLj9O9L1sJxnwUj4
	0dz29XlTLyIOXvLWGBYmO0et0DxzsJ2YjzRWmhDdjfeRZ1kc8PBedgDA4hK9vF7y
	czvaUHdHGxYa3/XIqyvmBe9t/NegDWBpGpd4m33O65LQwcPkN3fxDX5igoF2ZKSc
	6bSZk8hKrA0OaReazdzQZIifYjuDzzkQcbTEERT39mW+M3Ffi+Wnbq0Wev1sAoYe
	G33eWd2JppDGVEfzCVEjo0ow6JXMl+aRk35HT+IkSauMI1zZrzWsX20ngH0PDz0T
	xLw3MMx0v7jDFU7WH45PCyLIOzmyH2z6LEDUc41ykaoexcq2GjcnneSON/n2BVEP
	cdfH1w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgjcgtmwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 03:17:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3698bd5392cso1745863eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898251; x=1793503051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPWtMOB6rl3OEO2BJc8BeqPqsVQ0boeb3cUKZRCwhjI=;
        b=IjwleXyV31yYN7yo5RlCG1w2MB9+33+onpcUwsyUg93P7AnOCvzsypsjY9L26o2iwi
         k0hp4XEJMstWXeIx+19Z8O6b3kIYj7SJItuqdqMyE/rxWouB27g+JMNOioOo2wgXfNw/
         Xu41gSoCHStCfwsB5jh53LXgiAm6rxJDAJNqxbtg7yeSeYDwJ7gk88cIE+303fl9++CJ
         iowdQQvqFlBcZYwBCHeh7gVsu6UBRO/pCXwlvHpiGiisyYgLcF6jgggXOOZHlTypRQuc
         mrPoVCGFiQe4vWBxoY+M67kFCj6YJ+NTAJShhoWFJWRZQ0CE8A4GZ3pkoJmpGbUyEO//
         TLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898251; x=1793503051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPWtMOB6rl3OEO2BJc8BeqPqsVQ0boeb3cUKZRCwhjI=;
        b=FDUEnMO88K5cUdB7aAnzZglA6lFZC9UPu4psvZIdQQ1bbRyERc4mYu5afGsNHqq5Y9
         aVubkpQ/YjzVekAeFqlLlfyFDz+YBj02wgLbXeKovEMsc4TA2POGRrUyWpMCEHFjjt30
         cwYfvTIh5EZapD8cp4aTQwxjy/E7bKOwqq8do7ckd4h/k28itmgaVdLRAkPc0j4629kB
         iTon+oPXrB2M0NiIPvbFUowSpyblVjzb3OQEiyE4XsIFN7/N3mWrAHMfcmHJDSjV4/7m
         HBj4h3/coTCV/zvVoVFnA0PMQ2I6+BTBaBVVQRx1+6zk4VCsG1eYfmNROGh83KbYVf4a
         bGPA==
X-Forwarded-Encrypted: i=1; AKwUvBz5q22B7uvjw43Q/Zx3+GlIylVeVovI4v8BvuKg+jjqrD5seU3hxz69EhfX1IJi3Hk5mK1xzYJuiChSOU7/@vger.kernel.org
X-Gm-Message-State: AFq9FYIME96oQvex3aIOCVPonTT6Dunr6GY8sd9fm3KbXt5SOM5yHYmq
	bk07Fb5GLRZNu9qEobPLljMvtrv+AXSX0CxtBIOVTm301oXRUf/4tOrh05YvCKSwUVUH2ze6Up1
	AAjVoShkKhP/cVGSnKFNThkLdjs0SnzWZ5PdF77iOKYgSPHZQmOKWv7a9dIE6XKKrc03r
X-Gm-Gg: AYBFou3MocZUL9QqGmjiywxYmU1NF+wuIqK4E7vjdcysxn85NhhXHaX/hDVZhI4wSv1
	Kvcm+zpiDqy3E46sEZ/zZ6oyqLHrknHwQMOAXfQBvYfQXhf0Eth2P9oUw4HahdAIM/A2uV3NHdU
	pOcr8IVnvS/I2SrHndZjuAfZSBCE0sT5Skt9XJHqgWXmHMenCvqjiMruDySwlO6g6xJG8pH6mx1
	dr95UOLn3+UhzRutCPodeQ4HAGemJVdCchlKJ8LlpEeB2MeQ0N07DStxZ7wUH0Bk5DN3068Jxzz
	K/7v/19EbRytJJ16dnNEbEvLkQhgXvZ1gZnyzMTvxKRcJ8ID6u16Yb+rhAg3Ozk3P8ZTLh6Dis4
	JGLR2xqGnqlsMCN2a0+i3PE4j2TgQrZcTb1JNymwkVhTPa4mvTGPpYNLiuEWkq4S+XnREVmQDtK
	J0vYu2tiT0sw==
X-Received: by 2002:a05:693c:20c6:10b0:367:a092:3c73 with SMTP id 5a478bee46e88-369e84b1cd1mr4686060eec.12.1792898250679;
        Sat, 24 Oct 2026 20:17:30 -0700 (PDT)
X-Received: by 2002:a05:693c:20c6:10b0:367:a092:3c73 with SMTP id 5a478bee46e88-369e84b1cd1mr4686018eec.12.1792898250047;
        Sat, 24 Oct 2026 20:17:30 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:29 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:24 -0700
Subject: [PATCH v22 05/14] media: dt-bindings: Add CAMSS device for
 Kaanapali
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-kaanapali-camss-v22-5-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX9zfneyA1Pamh
 Bd5m7fdpRdLUFAv55e6oBd12p2MpU8uSxvPkvn/4h7FRaFd4bJVXnOgpSLFpwGK/g18SO3rXUtg
 f9JXWqLTp0gKMHhGqiZWJjtQt97vOz8=
X-Proofpoint-GUID: AQ4NVPgQtQNgcZseiP8Y_Z8_rB-pAac-
X-Authority-Analysis: v=2.4 cv=JvhkP84C c=1 sm=1 tr=0 ts=6add74cb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=yzr0uxE_ijXmPgLYsrIA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX4Dusy8IPpLVA
 RI64dSbIwsnmu+uG+XIyzkC/lP3YN4hmGDf9oNG6WD2ZkheWRDvGkLY7WCL2gABVTG1wwp95gUu
 U4PEG4bmI+PrVLDZqLbEHTDYt+1AtugPlFdAbfSon4g8/TTYNYCvR7qkozNbqVJaShMub6HtuJ2
 SQtacPRqqoic0FA7sqD2hNvFzhmTFDg50jlATdangYI9R+YEKCpZXWK5cyzDr7cIQ5qhhgRutfU
 x7Em6gXTsPM9R4uIT9vYESmH8sz+/KPk6W6rO+5s5Wzgm/UQQT3Q5QZzKxszFvrt1caez4Y7qmz
 kRVWreMAb5vmK9RKv3lClaM1OrsBeQ8WHi1D1KswCWjv/D/0rRKgTEGgVzBCiwF0ve7DTnnHJ3J
 /4xoTHtXqm66fAKKDBLaWIDErBOB+jcDsU4GBgWf7kNoasRPPltQRPXFbAeP2eXxNBf+Afnk8fp
 LQVz7RsNDud7yt26hmw==
X-Proofpoint-ORIG-GUID: AQ4NVPgQtQNgcZseiP8Y_Z8_rB-pAac-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

Add bindings for Camera Subsystem (CAMSS) on the Qualcomm Kaanapali
platform.

The Kaanapali platform provides:
- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../bindings/media/qcom,kaanapali-camss.yaml       | 303 +++++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
new file mode 100644
index 000000000000..e7f5ddd35b9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
@@ -0,0 +1,303 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
+
+maintainers:
+  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,kaanapali-camss
+
+  reg:
+    maxItems: 13
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: csitpg0
+      - const: csitpg1
+      - const: csitpg2
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  clocks:
+    maxItems: 23
+
+  clock-names:
+    items:
+      - const: camnoc_nrt_axi
+      - const: camnoc_rt_axi
+      - const: cpas_ahb
+      - const: cpas_fast_ahb
+      - const: cpas_vfe0
+      - const: cpas_vfe1
+      - const: cpas_vfe2
+      - const: cpas_vfe_lite
+      - const: csid
+      - const: csid_csiphy_rx
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
+      - const: vfe0
+      - const: vfe0_fast_ahb
+      - const: vfe1
+      - const: vfe1_fast_ahb
+      - const: vfe2
+      - const: vfe2_fast_ahb
+      - const: vfe_lite
+      - const: vfe_lite_ahb
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: qdss_debug_xo
+
+  interrupts:
+    maxItems: 10
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite0
+      - const: csid_lite1
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite0
+      - const: vfe_lite1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+
+  iommus:
+    items:
+      - description: S1 HLOS IFE non-protected stream
+
+  power-domains:
+    items:
+      - description: IFE0 GDSC - Global Distributed Switch Controller for IFE0.
+      - description: IFE1 GDSC - Global Distributed Switch Controller for IFE1.
+      - description: IFE2 GDSC - Global Distributed Switch Controller for IFE2.
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports. Each port receives the CSI data
+      decoded by the matching CSIPHY.
+
+    patternProperties:
+      "^port@[0-5]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Input port for receiving CSI data from CSIPHY 0-5.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,kaanapali-gcc.h>
+    #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@9253000 {
+            compatible = "qcom,kaanapali-camss";
+
+            reg = <0x0 0x09253000 0x0 0x5e80>,
+                  <0x0 0x09263000 0x0 0x5e80>,
+                  <0x0 0x09273000 0x0 0x5e80>,
+                  <0x0 0x092d3000 0x0 0x3880>,
+                  <0x0 0x092e7000 0x0 0x3880>,
+                  <0x0 0x093fd000 0x0 0x400>,
+                  <0x0 0x093fe000 0x0 0x400>,
+                  <0x0 0x093ff000 0x0 0x400>,
+                  <0x0 0x09151000 0x0 0x20000>,
+                  <0x0 0x09171000 0x0 0x20000>,
+                  <0x0 0x09191000 0x0 0x20000>,
+                  <0x0 0x092dc000 0x0 0x1300>,
+                  <0x0 0x092f0000 0x0 0x1300>;
+
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite0",
+                        "csid_lite1",
+                        "csitpg0",
+                        "csitpg1",
+                        "csitpg2",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite0",
+                        "vfe_lite1";
+
+            clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+                     <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_CSID_CLK>,
+                     <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+                     <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+                     <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+
+            clock-names = "camnoc_nrt_axi",
+                          "camnoc_rt_axi",
+                          "cpas_ahb",
+                          "cpas_fast_ahb",
+                          "cpas_vfe0",
+                          "cpas_vfe1",
+                          "cpas_vfe2",
+                          "cpas_vfe_lite",
+                          "csid",
+                          "csid_csiphy_rx",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
+                          "vfe0",
+                          "vfe0_fast_ahb",
+                          "vfe1",
+                          "vfe1_fast_ahb",
+                          "vfe2",
+                          "vfe2_fast_ahb",
+                          "vfe_lite",
+                          "vfe_lite_ahb",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "qdss_debug_xo";
+
+            interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite0",
+                              "csid_lite1",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite0",
+                              "vfe_lite1";
+
+            interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc";
+
+            iommus = <&apps_smmu 0x1c00 0x00>;
+
+            power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+                            <&camcc CAM_CC_TFE_1_GDSC>,
+                            <&camcc CAM_CC_TFE_2_GDSC>,
+                            <&camcc CAM_CC_TITAN_TOP_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "ife2",
+                                 "top";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    camss_csiphy0_ep: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csiphy0_out>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1

