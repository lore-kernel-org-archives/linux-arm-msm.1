Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795316242;
	b=k5tH/As/zTVFNdR3Ztpwrsl0xvx48QArlFKlyeyxfktI4g17hJcI9ux7bVCutmTbTsXj
	 8l6RPhTn0bDqncfHVfgy2ElsLHEn+H5e4KP4L7QErpFZtInJK8Tun27xSG5q+zgt/a/ul
	 4Z85mDkhDVv8jCOROa39V0eXqxMCpJl19xd6I9PxaNiQN0g5O4A5LhdNK/VCHdgmVFGWb
	 8zChlgCnxsqaSysh2aMDitqzWaBFy5wTkJXB1NQsA+dqOT0mn4LexU0k/mPkdfeT/lGLj
	 9HO5q4KvVW9HG4e4iSV+m2nu1u8/wqjyVjfDGJczaNHEGIfe8sdrnGPQ4zZczU68Xng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795316242;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u4zLVHnTkobPJ41e1mxux5zeHM9rWie5mC2ac7V2I6I=;
	b=L5HPPkqp8tRJYv9HR6Ulpb5+ITdfr6etAUcX7upf7G1XBb5odtn4jf6L2CI8MVWZ5g/3
	 PNH1R3PBBapeZtEwNh5iG85JncymcbI97ce2f/aGPSgPTp8IjpNA9S9tjfNHvc81i4Nog
	 Yz8qwDIXqmoGxey8SAcmAXWEXJ221yQWPxCm5GH4Ma0pamFw80+SEEo5pGHwJk96gQ29U
	 z10oL9VxSVutMx3f2dh8+SkZwuOE2RzE/hWNXNTEi3v+1klT/vzKgtO1Zh1ErxkQRZ9Ty
	 KrHcweRwmtMXIXg+ct25V5efq4WTxt/xTW9k41TYYGBBUXt6Lp4WJlW3yCLtZbc+qmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BT39TlH3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bC1grQZz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68406606A332
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68406606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BT39TlH3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bC1grQZz
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AM07ubX270187
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4zLVHnTkobPJ41e1mxux5zeHM9rWie5mC2ac7V2I6I=; b=BT39TlH3EBk/ld49
	JlixeU1hA0cxiL2kEiY6fmbgKiIyJJB1u8jLSkwOTiFoOVAVkipG31qadW6sB6qv
	vj5esXrGlHynubmJj/UNOn1dOX856oSo4fPOp2uUZd2jpPknF/2vKoFF8kYBtrd7
	JTapXEd+CIhdUzrfb7DBUFnpfyfBYzRwgLwmwAEtExxpVu3s33wqAvVH5Ky+fbym
	gkxsizMBeAgx+CKUjSzORpDDuPueOF7aJQnUkAHDHwAq11zZFZX3V26CrMF5a3m/
	AU7DJ1jlD16OTURtTS0czTaEbdz+TkPT/UJkp5PkweAQF69ir5jqstzTjaBvPUYq
	C2nS5g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk2ckh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:57:20 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38355b03cb8so2204189eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 18:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795316240; x=1795921040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4zLVHnTkobPJ41e1mxux5zeHM9rWie5mC2ac7V2I6I=;
        b=bC1grQZzedWDax77gPJPXgpcZd6aCRS8X+RMubfUOBTGbl8dZwJL/wcLnARYeCgCeT
         pPLb38AJHPWWI2nHxqYXLPnvcX0so9y56qSFf7lR7tLbMhEp64LQPe20sl1DCvphZiPm
         mVOa7FnvPw/L7NiUdFslA0nw/wg3isNadvHgSyLo7gRbxgm+CY6J2xFWJLFVUfgnxxHA
         ZbEpU5FElLGjlm4UspjU4OPAjp+rMAnbOXSYEFYd/R3rLNGA2KljRN5NS+VKm/KPND5J
         Tf8QHi9rXWnHgINVvLUhrXuSDE2vzRSVkU7xYbGaFcXElxIJI2Et2jySpCMaRKLi2VEC
         y+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316240; x=1795921040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u4zLVHnTkobPJ41e1mxux5zeHM9rWie5mC2ac7V2I6I=;
        b=oIlvjqFeZQdz5V2+LA17+avtYNHtcrEF/2iyZGYqfID26DgROA0YvUakgOIswqFakS
         Sbmi/ldoA5J7ylKOFCkUEnjrVkx8GPdGo1GXP2Wgorjd7ltWCiHpnYqEQMMssuinI3/d
         DPhKX4wfCOBlLtq9+Vvz6bd/IrTPBQh7OiR/kEvoqXxc9eHjUePaStI8vg9g0xZqcmyb
         WzrLVveaxAIMtswexhRpPTgqi7H7K5Cm6j+lH6WwmJ4Nu1A1nzhy0jJaMn5tH0o/pJDJ
         69odnjYBr5ycrp4ltzdfqqsFdhLNzaYpyVcIam/mMeN3/tIKTdPU84Op7rzY53ouMbJ7
         KuKQ==
X-Forwarded-Encrypted: i=1; AL+hErHfuqXnYjiDkBw3VoV4GARbILIw2xCSHJmvxgGGl2oHXfemgKYqdzzgCyiirber3qKEdGvgNGr94t2W+ajX@vger.kernel.org
X-Gm-Message-State: APuU4Z8nV4KrYJAMiRMUuWE//UW0lHiM7p0rGd6oAWox/RgjFweq71nj
	fdGDgP7bx3e2VdU99agpEBqLCMfs0i4MfCCtcusJRo885156dEj7DbbMuhaApZdRJQtax9gVOpa
	z04/MTDkFHkYXviv16T/IWcmXMXhj3D/u8mYkzRecaifx3WhEBqXZDdRU8xkLvXso8whl
X-Gm-Gg: AZFdTZez+BKOhnajK01b5J//9eEDXZPZzl3abnKuewjgL44ztL28d8tGgy7hy6tgoSw
	AJRHYM5jGkOJ7H2HbUEGtsMCiUCVelhCkMMukg6Dt8ws2+gq00bE7vddQJEz/GAzrSg4ZiJpIdq
	b+Z4fSrWrXOM0f4CyAK9pYpsdRnU5ZJG0w+Pp0jgBcS1kteiAqItyQK9UiGfKaVoBrtmfp6jVfe
	At21PoytzSwllG6VjN2zkiNkjTpzI7frt7vmnj1BM+SRJUMa58lYOFtTVXQzOjwoNZnBaFWVy4w
	P7+0HvsZGUomgv5wazhIB3hkSD+TGryZqUSukHjHfROtltW7twsOg3NZgwJuxo/fI2z2RvrMTsM
	kd4mcOIXsq1SmO196MQ+xTl/dHZihKTh9l49LkAeg8k2jmJ8vKrs9SNNM68jRVngi4osUBRBXjk
	P2dvGg2bo2
X-Received: by 2002:a05:693c:8641:20b0:383:50b7:1d78 with SMTP id 5a478bee46e88-38571223ee7mr8559637eec.40.1795316239889;
        Sat, 21 Nov 2026 18:57:19 -0800 (PST)
X-Received: by 2002:a05:693c:8641:20b0:383:50b7:1d78 with SMTP id 5a478bee46e88-38571223ee7mr8559612eec.40.1795316239376;
        Sat, 21 Nov 2026 18:57:19 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm312044eec.18.2026.11.21.18.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:57:19 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 08:26:20 +0530
Subject: [PATCH 07/11] dt-bindings: PCI: qcom-ep: Add Nord PCIe Endpoint
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
Message-Id: <20261122-nord_ep-v1-7-6d8839ffa9aa@oss.qualcomm.com>
References: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
In-Reply-To: <20261122-nord_ep-v1-0-6d8839ffa9aa@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Niklas Cassel <cassel@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795316184; l=2668;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=JAHLcpWrndJ7vGe/EsN0GzNIf7dKlfRU1FzcikKsx5I=;
 b=kghpNVosYGIELkZVpk17V4n6t4JpVd1dJQKucE28HGajI72vINW5LpLNGFPaZ5JvvIGM+RkW8
 7mmpI8gxDj9CTU/PNuAn3ONGLtnOSFqxRWzq6KRvIPQ+7FGZS/vLPe7
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: I_azP0PgCfiGCkUFaDOy9LBUlrqK-28e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX4bLLmu8PsvuU
 yAaoOQzeXf9Mz8pqP1uAf2VyGxvI7fVTqw0pjRP2v9twhASq+SgM3/B4Ocv6d1sQl4DNqS5Q9wm
 DamNmLFr7G2tR1wRSn1sjQQSBurKzeANvNn9IUg6kp9TUcL0GtpY3qIxYXj0rqo1gfx++rhVxra
 T7cRroeKeO+3uT9oGu2wNejKk8KAuzby55Kr8fqlNw8hZU49qT3F8SZ9TWGwO3VDjnGUjr4DstF
 LUsGljAzjbU810PsD5yPHWcRWX12MdZtxjvfPsEwNOUCh2m5u1aQ0tbRuCMA+EFAjETqiK+oG38
 3T6/gOqX1MArMAvKeVPr/KLGksGaWcQSapE5FlHpI62L6VJcQDSsY8VnKgAUIUNl1w/dMUQRdYn
 wVouIE5K58iOW4j8OiLOD5agoAC1p0/o+MdJG35RoIGnI618o68/0TABK88VMuJnBgivHWcFK+y
 yTOdHe/lL/b+LSOAwlw==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b025a10 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FC_8z62UfPBbNpSbB3cA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDAxMSBTYWx0ZWRfX7DFN21lgADz1
 JEyUWk2FP2Dyc7LhxjBqrEKChEXY0Db8aSSCA4g0Deq1WLcSHAHpZPFqZMjX+TZjNk1Fv4hAFeU
 l9X9zeRS3gKa+fVD8F0HLiqnxuv/c+c=
X-Proofpoint-GUID: I_azP0PgCfiGCkUFaDOy9LBUlrqK-28e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_06,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220011

Add the qcom,nord-pcie-ep compatible for the PCIe Endpoint controller on
the Qualcomm Nord platform.

Like the other DMA-capable controllers, it has three interrupts, requires
an IOMMU and uses the same five clocks as sa8775p. The instance that
supports MSI-X additionally exposes a dedicated MSI-X BAR as an eighth
"msix" register region, so permit Nord to carry seven or eight reg
entries while leaving the other controllers at seven.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/qcom,pcie-ep.yaml      | 38 +++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
index bed9a40b186b..9a6a7f6f7f62 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-ep.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,nord-pcie-ep
           - qcom,sa8775p-pcie-ep
           - qcom,sar2130p-pcie-ep
           - qcom,sdx55-pcie-ep
@@ -31,6 +32,7 @@ properties:
       - description: Memory region used to map remote RC address space
       - description: BAR memory region
       - description: DMA register space
+      - description: MSI-X BAR memory region
 
   reg-names:
     minItems: 6
@@ -42,6 +44,7 @@ properties:
       - const: addr_space
       - const: mmio
       - const: dma
+      - const: msix
 
   clocks:
     minItems: 5
@@ -185,7 +188,39 @@ allOf:
           minItems: 2
           maxItems: 2
         iommus: false
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,nord-pcie-ep
+    then:
+      properties:
+        reg:
+          minItems: 7
+          maxItems: 8
+        reg-names:
+          minItems: 7
+          maxItems: 8
+        interrupts:
+          minItems: 3
+          maxItems: 3
+        interrupt-names:
+          minItems: 3
+          maxItems: 3
+      required:
+        - iommus
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,nord-pcie-ep
+                - qcom,sdx55-pcie-ep
+    then:
       properties:
         reg:
           minItems: 7
@@ -263,6 +298,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,nord-pcie-ep
               - qcom,sa8775p-pcie-ep
     then:
       properties:

-- 
2.34.1

