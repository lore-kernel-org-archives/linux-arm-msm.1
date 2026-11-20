Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182153;
	b=gJY0Clr8fcGTdEKRwtE8lGNJn9V+Uc1LuYbiCvg+SBLCfozXGa93xGIaxzbbbx5K0MlF
	 ARfBZcbzYhvIdp0uemtSAYSK0QlN0iQRAB+D1EiYCeiywO5l7KScMWpiIC3LStBnS5rkw
	 3GvstfMPh003pSPMFCsR10HxH7WpoEYjbBD5FC+GBReLBRaJdb7FyjcpQ+zYpVkkKBGNh
	 l3mNcuMlai9mY7tlz+qAim37QOpVDqR0MjLErBt0oLxUJOjuxYljP1lWL+i8DaR5zDQjv
	 wUdsFBJ2JNyTp/npzz/j+UdfV9yEMxFCbHppRUgaLIIHDWIZ8t73/bDgS8JemX6p4ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182153;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
	b=bSu/SQhljIz45sQUjJURvsVdvhqN2Po1pmSbMLeBsJkrS2x879OIVtmJEN4cOIfRd4ZS
	 vMFmfoAMOqEWuWvYUvjle9m/08IORJd5Xr++rk79+Ha7TBYuC033Wz7rmtuJj5XH94xj1
	 7PeafP2vcHxKB5/XeWFqNmA+tAQ7G+IXYHcoLKiNHMiT348dZo0jqYt4u+VrX1/m/rWyT
	 6wUC917Q6ADHESs47OEfgKMk0YBFYlydVTRNXlnDk8iHsQY2Q488FAFWqAMJpQoLjDXUv
	 u/9UXFRpxfOiRmgFuwK4mbwUdgHZeb3/q83OItjZ89RPoaWuJC+cYO5Dd9IQwcA2MVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=migPxDrT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="X/yyxIlB";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B6F606A332
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32B6F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=migPxDrT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X/yyxIlB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKDAc7U1377415
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=; b=migPxDrTTyI6/FTy
	q28lmrP8ETqeT+SpI3zFUxhTOKhYcOYH1iNE/nOtgiQaNI+zolAkn7DTpXIgKxUl
	0OHhQhiX7xD1ve6vx5arZc78eFX2Kw5RUktAGYOf4ha0ADCWa8gCz6ucKEiIp2V9
	XsF9r4TEJEAjX9xKFLCdZgxk/IA4M4Tc5LMSE0DnEZDVY4w1L1VBLa4ugkjV3U3r
	+ix1/Srndu3GB5+bcNaSD4H2gXPMeNzNsGBZbyK++ceruNaGCgPK65Jn69UU6M6p
	FyW4MrM5bQ+UNW42r2eBg60FG6V3hE1uRO4oV3frvrZ/HXSUYCVkGjNf8W6Pft8x
	3RV/OQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykwqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:42:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383f2d05c73so2789554eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182151; x=1795786951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
        b=X/yyxIlB4o8SAXzhULwXpIDKlgT8jiX7SviTYapf4hBxd92SolLgFJkjwELbmvzq6P
         Dn0uFj8DnyQmFSgAEP8GuwgXLn2VJApKo1dorNryv8n5O5FnxdxgKmTc+tYiVEOgpOor
         UgpWoBmqn8zv45TDDGwv+7wiF3+O3SxWksJiKGcNfE4YDdnno5Dw5mkyjue022yZwxF9
         3cCfzY/bY0ZFGCS0uB8mlPX4omeWx576wucMQhvR1LE7cfo1BVmCdlOP5eQzm6Snxtw5
         8sKCBSW1Cf+cjhKEtKunmEG8jzqphumne/Im/K1XoTyDRdVgt0XVeD8Busj1IFGt5NeM
         zngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182151; x=1795786951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hz2XdZj1N82zwwGf5rQXwFrF2Tz/A+hhelwd2ljU2qQ=;
        b=10z1bgHluMk67LO3bkukngPpKBEe5uWWR109qAt7v+zCrkW35ay5enR1HIa3qoq45K
         fkERmB+vD29dtRbWZjiEqs/qje9E77L2QqOFB7yC7aFBdsA0UCsT8CLKWHkXzh3lx0Im
         yhZROBiLM41uEOCOaqsFYmUjzs3F4f1ZjEP6M9GHB/jLE/PoOFqbhWDmAhZBh3lwpgjm
         A2xSun8Gj3l/DpTx7WblLMqamsI2moL5XQs9El70CUigNeW9QeDZ/22fSMmKpkUNw9bb
         LFU9WnvF1Xu9Rtwd4q2E+LX6azgTbnOUkRsN5OV8sZENSqHn98mKBm7a3/phQqGiF30d
         8+Rw==
X-Forwarded-Encrypted: i=1; AL+hErFMosu/6gULnmsc/fArZ+4ZE/EkKBfhSRBAXDD2h8nXKc0in3o0mi3VgR//lI3l96jJCs/4ChBgPpLicqps@vger.kernel.org
X-Gm-Message-State: APuU4Z/yUvWb4zO1tkKMz0atmVUI/Uj7SYeao7/QVQMT4I9nhGISICit
	uGoYmumphj7JmeqwOVkGi1urE25VTw7duxlel8NZu0G5dULE1pI5MQkpJtaVw8tzXky2OsM7M53
	dDxdTwD0zfj3lpSm7ByuONoDbXa6gq27PlZbx5MxtRGQEVfyRvdjBQyrdqDEHpzb+xQ+fh0j+8z
	om
X-Gm-Gg: AZFdTZc+nmS16l7SWzSfFK68WwMK6FkKlGJwXtXgnTHC3oPwpqBXVpGk/DxfCVFlWPE
	72v/VAu3R3PLtqTlfWzvyteBSKuMA+7AyVjl4wX0U3lSEzMp+GqUh0q3k4zIsTB3fqrcGswJ08a
	nryTKoR3DRK4MJUAcZ/DOi30LqTBD6I47/gyfPmcpfc1GJUo5GyrY82HxKi0+IhWaESmnBWDLhI
	OwwN2NzI/7WYZGuRy32DEZk4eLNdd7vEl4mR/snWFUYcaGC4UqqzQne+Go/sfLtgJgZyGhMypo0
	KGPpQ7ZQfiO6tQM55xZKEy6Lqp+IdN823tmjaeuklazlo5EUVGotQop4j8gLmhvIikRBHf/Ta4Y
	wMK17eGDQh9IkqtVX68CngMwRDV61e9wsAg++ZUKLyX1iw9dGUQAXnPFGzj5N4b7xyPEYWxRMXk
	+30rc=
X-Received: by 2002:a05:7300:e9d6:10b0:369:efd5:9cad with SMTP id 5a478bee46e88-3856fd5b5e6mr3290402eec.8.1795182150850;
        Fri, 20 Nov 2026 05:42:30 -0800 (PST)
X-Received: by 2002:a05:7300:e9d6:10b0:369:efd5:9cad with SMTP id 5a478bee46e88-3856fd5b5e6mr3290338eec.8.1795182150128;
        Fri, 20 Nov 2026 05:42:30 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:29 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:32 +0530
Subject: [PATCH RESEND v4 01/20] dt-bindings: iommu: arm,smmu: Document
 interconnects property
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
Message-Id: <20261120-smmu_interconnect_addition-v4-1-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=2417;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=L9ZDNV193MgcYYJuTHrN/Rk+LSdrA3XbSL8eIPKsLAM=;
 b=uY0Iae8oylJJB78xRp2RW53OaW97KnbRp1z7xWSKIKHPzU5GnoAeMZpdTPtMbwabSwKL6rJ38
 UUwBSOaoeG7C5EEzLSzPvYavoSyymBGzMhXJ24sUJHfdnpandMTpHnA
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXyy6wxNj0pKny
 VUcHXWthWsWXhszf7FUH8VpEECvTatmo1USzC4I50UVWt4qDUw1txx/z70i0XpWZkglPeMTsS0z
 GJ6NcdKRBPqPpilwORVgLdZdK/zGXg0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXwxqtw3T6OTvm
 CRyEdxisKAD9MsZWqbwjvgEEOmgSbC2f5tgif8ZBvkLti5G2KPkYWPo3qVTIY2FqNwbnMOvFU7K
 IzQ2/q7d5w2sbyoF64pOWcFBPUeW+o/eavObNkkzsJqVUthIiLmKuqvqbntb6PBua8tBfxgYYws
 axfYk4eF9AtLH4UIW9InU3iUDr3YEgQxcn7aB3YlgrWms8IuefZ4PzLw2TkumHYSKklI4Mg8DzV
 6KLhQSW4m8GjkR86D6UYVnimnNa8eABrrUfy5xzWHnAB3waRqHuL1qFBA6j5A5CMVM9m25+xy6V
 hCoK9ZX6McsNDdYgTomlrov0c4+edK/OMvc7Uja/3X8ly/BEyRHWXV2iS4KCMcZWzVZ4N8ekFi4
 4REoqhLC8r3PKTuGu83pHpB5wfb3Cph93MAo6XMEpdtg2H2/s6JRee8SalsLQda19fcTzDbp3bl
 s3rQAm8kt8VvXcaEBeQ==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b004e48 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LIGS1bie0qojq0S7pNEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 5YlVc69hPR1zowdWcISGUa7AB-2ceEEk
X-Proofpoint-GUID: 5YlVc69hPR1zowdWcISGUa7AB-2ceEEk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On Qualcomm platforms using the ARM MMU-500 (qcom,smmu-500) as the
adreno SMMU, starting from SM8150 (Snapdragon 855), an active
bandwidth vote is required on the interconnect path before the SMMU
register space is accessible.

On these platforms the GPU TCU is a separate hardware block with its
own AXI master port (alm_gpu_tcu) on GEM_NOC, independent of the GPU
rendering data ports. This means the TCU can be active during wakeup
while the GPU data path is idle, leaving GEM_NOC without any other
voter and causing intermittent SMMU register access failures.

On earlier platforms using QSMMU (SMMU-v2) the TCU is integrated
inside the SMMU block and shares the GPU data AXI port, so no
independent vote is required.

Add the optional 'interconnects' property and allow it for all
qcom,smmu-500 + qcom,adreno-smmu combinations.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml        | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 6748351c7812..ec0fc5f7d4fd 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -252,6 +252,13 @@ properties:
     minItems: 1
     maxItems: 3
 
+  interconnects:
+    maxItems: 1
+    description:
+      Interconnect path to the SMMU register space. Required on SoCs
+      where the SMMU registers are only accessible after a bandwidth
+      vote has been placed on the interconnect fabric.
+
   nvidia,memory-controller:
     description: |
       A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
@@ -656,6 +663,24 @@ allOf:
         clock-names: false
         clocks: false
 
+  - if:
+      allOf:
+        - properties:
+            compatible:
+              contains:
+                const: qcom,smmu-500
+        - properties:
+            compatible:
+              contains:
+                const: qcom,adreno-smmu
+    then:
+      properties:
+        interconnects:
+          maxItems: 1
+    else:
+      properties:
+        interconnects: false
+
   - if:
       properties:
         compatible:

-- 
2.34.1

