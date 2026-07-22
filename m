Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276EF4963A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717829; cv=none; b=cQLIeDhVP0bYl6G9nMPTnuMk+83Pjzd109JtYMjl51Se+xzwaSlvA0QRWoQJkr3ytwJJwHiPgwYaD3iu8Aya0ioJDkSDt7jimJuO3bZgvujX4PGu4S4DnIeYMuennPK2X5UoS00GzHCBoXiq0+wlRfw8zniE1LG9MsuWPAr5QmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717829; c=relaxed/simple;
	bh=HLDNHMkeRHSbz22zFYyaBoStA7/BA5Gmi8S/43s0xwM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NjVw7tivoaCjQcG+XZhiiXKrN0ZFRZwuOPdl7wcE3b1p3hsYSdghrhV7XhlKnkWtqmxIm05fKHX9eXTG3OIXGJXWptvgMiFzvQ/opNbvaer4oxC7IABXazLmKkBBCxkWZ8ae65Y3XmHWHylouU1bldpbjDQ+ltxPhEWir564QPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Km2cGbJ3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BTCWVxXN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Km2cGbJ3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BTCWVxXN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xZjQ269637
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/QePOBmPnRol9R9DnitCpLwEaauF3mRCy3iF3hD26E=; b=Km2cGbJ3U44rvWHT
	pYsDCxtnRQiaFlKfb1n10k6XlQ6tyb3BmV0N5Esqw60iRueaRfCEX8Ey0ngL4waO
	Rrus0Ot58JCdFXzshQPel8c0dpJlhGWqkRrC40uUyXyzrMcrVgZdS8aq4euQizVi
	3IJa+hhh9STuomeQav1pt1W0x7DKNlpSGHNCD2fdAnFCgclpoTpYSPoWHbqJ2VGr
	U94E2afVCi42tQecXqYCiJdWN6eIzuA/0pQZrS5Mq2XS2Us1Bfvq99ngobTYbfzv
	cJ1U6hlgwsQLsUoMZYGRduwvgGOD5aWGWicz2D5NYYPMLYRzNpgAFnf0RLq6+rJ1
	4ppOpA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6abmgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:57:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52769fc3f2eso30149671cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 03:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717822; x=1785322622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/QePOBmPnRol9R9DnitCpLwEaauF3mRCy3iF3hD26E=;
        b=BTCWVxXN7nQAzL3AlfgJegkDQ5Y/z7scEMH0kOCCneN843dAFYMIOE0vQp9ysF6Cam
         7TnyzbiDXPzfxPZh4syJBTibWz26J/YSCz+N1DDfS7vUcM0LJQoJsw5z5DJR7B1HMqTR
         U9Z1DBus5mYxUInyZcfuW8MS4Mhk7a8TpJOuMmH9xfVUP3gv7jV4UcKyZsRdebvLSJBV
         2/vcg84cKHgrkBdS0J6lynLYy6yzfHcGflQu8jRAPjrB44RS1ooZI6zjs8av9i8jV2aS
         047p1n9Gvl51KwFDKxx900qvubX4gtmlhFazaPl+hy1+oqCZhIibTUjD2lzoPPpwrpdh
         HlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717822; x=1785322622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/QePOBmPnRol9R9DnitCpLwEaauF3mRCy3iF3hD26E=;
        b=Bm2jEyXJ84YIcccuWPJl8JD2l1ZUi4XRVfaCAvylVNLWawDKnJLapiPcSbjCjLAgcw
         vun6JiKroa+v2TW7ERfGi2K/BzwS/OIr8zSmVkJ2V6mnKrx9ey6t/noIYRnsFthoNEMX
         Pd6LYQO2dmzvYyf0PaCHZ44Y/HcKhzUedH/x0LujT4FOBSjdaURsFJqs4mWrvcMTSLyF
         M+gm/GLJSV7ff9qcNm0dZedhxaPPpidwxxGYVEZni1Q/4jj8HnMSUHvRmzfRNBRXu331
         OpM34Qv0dy5KCwiL+/ZrwB53QSUWWp9KOgMNjqhpzQJg033+GljjK/q5Wf+b+7rufr5U
         NJDg==
X-Gm-Message-State: AOJu0Yxk8tSYmp1THk/2S6P3MLHKO8GPvso2BMmpvsoep6fEdAgk9pbz
	fWq30lP/uS6D7dKbrXQueX3VJ7Qco0CouXiK2zJBgOO0RQNK2hz4AQ+uB9K2Q3FBIUSghJ56PJU
	XBHyHoTzneVi9kZPlYSlZbp9YQ8EAvRbtNLQ1xxtQcDI7L3zdg8DhAHFfRq/06XPTcA4V
X-Gm-Gg: AR+sD11TxIQmKf9tWc03dpEgJwHYsiLDbIbXTYtkw4Co8sv1Ios+/v1eLIF50jPtvg0
	u2lNMbaztREuVyxW5OEgRxPdYuvG9eH7DLeNTs3SZ6CKtNaHFnmm0zf5ZeQK4pwYGbP+9E/R7vm
	0q13xJRSV9m5kv9x+M1eoZ5ZOWKGxcRDQDkRmyo0KLo7MM2Yj52+mvJotVeGo7MYY/kh4nxmedi
	Mn9JgHJY8PRuiCLqD6N6tQH/u4WpWLAAhPs40gWsKc9XmdFnZevrDs+wlDuUCXoAcnbhK3bqHa/
	02/FJLyPF0RK+VdygOwJtS9ijBN/mRM+EJBv3/vLpEDKyyGFR0jy3sPErFyGYQv1rcV8bUCgO5V
	3CIVEudgB
X-Received: by 2002:a05:622a:13cd:b0:517:7d9a:a88 with SMTP id d75a77b69052e-5213cbd8efamr196537471cf.37.1784717821986;
        Wed, 22 Jul 2026 03:57:01 -0700 (PDT)
X-Received: by 2002:a05:622a:13cd:b0:517:7d9a:a88 with SMTP id d75a77b69052e-5213cbd8efamr196537211cf.37.1784717821358;
        Wed, 22 Jul 2026 03:57:01 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b0571f5sm36240285e9.4.2026.07.22.03.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:56:58 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 13:56:48 +0300
Subject: [PATCH v4 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Eliza
 CDSP compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-remoteproc-eliza-cdsp-v4-1-04c6eee70cb1@oss.qualcomm.com>
References: <20260722-remoteproc-eliza-cdsp-v4-0-04c6eee70cb1@oss.qualcomm.com>
In-Reply-To: <20260722-remoteproc-eliza-cdsp-v4-0-04c6eee70cb1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-2f6f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=HLDNHMkeRHSbz22zFYyaBoStA7/BA5Gmi8S/43s0xwM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYKH1FHiJ97f56zrKR4TZpr/AzKJHcpp4fplXz
 FJK3C6i3NKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamCh9QAKCRAbX0TJAJUV
 VkOND/0YEjSjLMdxQYn49emtsbIU4MZZfczO65mSLAL4ijLtvsatKSh9asnKnvdTtIGIHPde8qM
 BnwCGiEvLtXWo9rx2Rwyk3DgbSLs/PoMCTyxfu76z2bKDxBKlOHgZqqA2bBmCrKSP2qy6ZkyFHH
 LYUZNR8M7Dv+HWKl7d5yzCtce5wjQdy6pi2r+jnaTQpv+2t2PTwjMQxEXJKO1szLJNgcK8G6K3Z
 C6TaTSdmY7bAUPEvKIiO+0VemVsWcBkwPpg7FcbLDLpMJkanwIPcrD1KXEy1Kj00mrkp1W4+rOR
 KhmxEe82kS+MS1xbHwAvhmeJOsnHlA7ERFzUDzwiyRP5bYh0X9p2XYZ6MHmzR2mMTPNFankFN35
 /wP9LwsMa2m4ri0ydyeSKLhYgB02flzSMIoBt+OkBgImY3vjwAq+Uq7dm2JtQevfXLYoR/Dj6PP
 /U2ND8XEkbJUAcgF366hp27WsjsGXfmjd34gr0L5SM8g/DKtLf5CxA62A5Rscl+bdiuRPOMcBJC
 B4svimySmrms5EFxZevmCLzZpfZAf+xbDFzdhcusZr3P+i4yU+gpd6eWidX2VGb2MMtYdJSOQzP
 qm3srGb6FY5FKGJI7qfrUpgS8WTrVBuUvvc4JfaxzIBfHsf7v37L5E/gOKtBOfDbWqozdHIKlqj
 F79AnxM3rNSs3JA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX0QCQjq2QbklM
 e9zs+y02UrbCnYYDz7p2vxHUeiSgbnS74nyhzNTukVEYhiXRCQdKG50HLoQ34AfWRUIN4RPedM7
 41bNvDgn7d/+RK59F+z0L7N2ql1Hsqf8SkYVE6km3BZtI0ObbuGJEbSAFRtGPXW0IbguHU1uUdX
 rC9jVmQ7lqHv1ALXzyQX4Wm0WgwkGhXUTn6XdwzX20Ev+lM1cBXo5p+hYNJO9u7g14VTI7b4h6C
 YvIgaAdb8DLndZGyePe4htGGvIAtn7IOV2OyhLsEGlmwu3RfKCN+xjQ0NmpUtuD4C65UMn5PoWj
 byJL87IkR7F+eJvQEfQnvTEImjwnVK//MfYqzcvyMTl8Mr4ofM12kV1gl4V1NMno5LsDimuenHA
 sT6s1PPX8rq1JysoIQTygBXtK9wvnYoyLk8yOqLit3rMFgUrbpPpbspF5g1YNAM8N7rFF0Yu3c5
 H34QKDPViS4TJ8GkgcA==
X-Proofpoint-GUID: 9Tn9kTiIBMQK0Y2R9mPr12YDrByJSjVu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNiBTYWx0ZWRfX/oRvZ+HkXGmP
 WPlGW2yM772U+yEiPFOD3ZOx0V0gACc/ZKVNTk5d/Vnv13vUSoQ6/UDfFtc9wdoEyYq/zx7/cXm
 MlJtXWBqToZIbX7K2OE1sCrQfRiyG3o=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a60a1fe cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ovmeWcPxak0IfAIrAdcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 9Tn9kTiIBMQK0Y2R9mPr12YDrByJSjVu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220106

Document compatible string for the CDSP Peripheral Authentication Service
on the Eliza SoC. It is not compatible with any other.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml        | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 019db91be7fd..5492a88bb100 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,eliza-cdsp-pas
           - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
@@ -173,6 +174,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-cdsp-pas
               - qcom,sm8750-cdsp-pas
     then:
       properties:
@@ -288,6 +290,25 @@ allOf:
             - const: mxc
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,eliza-cdsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+            - description: NSP power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
+            - const: nsp
+
 unevaluatedProperties: false
 
 examples:

-- 
2.54.0

