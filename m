Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CB130DEBA
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 05:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787634529; cv=none; b=UmWIIDPcr4UHwyd57FQQalkE/qRBiAzKFzHy6geDVTGhM9xPwSfjCF7QSFy+qxQj22rZgYb9+oIGf5nMDAGT/zkkOJv+Z6l2WFyuQvbh7WY67kQR6XFIp1AJovYA56G/39SpHLNpVUqH9dLbdyFD5EIJD1lNdLTEX0xqitGUNTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787634529; c=relaxed/simple;
	bh=j9GCy5pRGl/uns+WL0RTOovCU2uQImMf1lq+Ag4xpSo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHC0Ro+MA6gEG9Tk3JFpWEX4Ditzj1y0IGbJQWSSB/pHWUuesWv5hq2znrLDmEPdglOi4wnCL3192G7HLLCpH267WQozEljP0yoBUixFuoT0xL86XYJmgX6775YOd5sUHPUtTCuV+U1j5VeRkFM0rr7JlFbteWfoYKAKqBSQ2/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZT0GMHre; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=esJDfCa9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZT0GMHre";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="esJDfCa9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P3viqX1149077
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 05:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrKc2bVD8GE4ERXNiuSEUM3//V7Y7fiU4nzBcMeO0Jw=; b=ZT0GMHreeoni+Gr/
	IPlswrBvNqZMCrnBXDmHlJFit53D6bWY3Fimwf8+8JGksCRintS8YHpFQFoIkGRu
	EOpoOl0DCekWHdY3cp9s0jcaAmhOofxx3jKxVXoTJvO/3H73vFk9G77IxSBq9dOi
	vQnRSo9KDDrBS8JygAA5ZznCgTSy7EyyXQjIw+Y7AToyP64OylG68Brj2ckLUV+z
	WwwFhDB1MzYmHO1hldwPj5cx2ze9Wu/Jt/2SchxBQOJymkLBsX7YHCjyUi8pIXPu
	Ao4WQ2528/+zLEF5mNNT+I6nkO8801Bz9Op3SPPJ72usJcdCj2/ch0HZNwwGAgdP
	yM+VIA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93kvr69s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 05:08:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d55d8cd938so79926065ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 22:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787634525; x=1788239325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrKc2bVD8GE4ERXNiuSEUM3//V7Y7fiU4nzBcMeO0Jw=;
        b=esJDfCa9V4qbLwwMrSch8IpJFJPIWS3wY0YcPIgJCu5kub8oZTuU5MqnpkgCXURVla
         h+tkbMEurZLC9LyWSrPcK+FA1TY+JYlrU6vWp4xEc1Yp02PRmoLTRL/ZFjlKwSl897ta
         zs5TYZwuQaVrrgmqcQk8qWwFhwSNwYHQuNQV27PEiPAuvQqH6LjU7o+mV/mR5KXxfblw
         6EF/D6mlMbTxAm8v6qO+MdkZaJ7KkPWrYGwBuG7/XXOnv2YY44HEnbftJgoCiooCg0XJ
         3WeHFxiREnM6ECMxkYh/++pWamXWja0xQr9eHpNMMfQETByFFg7WHDcs60AQY+mgbadu
         rCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787634525; x=1788239325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrKc2bVD8GE4ERXNiuSEUM3//V7Y7fiU4nzBcMeO0Jw=;
        b=IvaH2sTj0yIc3JilXtWrrUzgBNBFfaA+TM5vVkPXsN21DLLyhMGHMepHkEbLJRr9nH
         AezgjaoGzf+9IrCx0ODeTCo7suRncij+tQtVfZf3PGyicbmJvNLk+70b3FKVC/d2/DXD
         gq8FvRoIB9iovQvg9Pt769THibWfyUOvtx/uc3IrXmNEpdo/6pwOYxq0kaKw/p4/bgLh
         aCmaI08Zv/YKGhNG7Y/UiiHXqBMiLV0TxBFPahxQNITq6WUhlwrxIslfmUh1bhhgSDCa
         aYEJB3KAxGvNFM2aaQ1LlnQsvqeMsMwiwHu+KiTv3EZ0lGON7pMZiaQquHdmgWgBYBH/
         RnPw==
X-Gm-Message-State: AFuF++nniqMnZsn4ort2uGtUHD79HnMABVaG4EId7F8BUfkYyen/KtG0
	/5DcB+XUKXlwU+P2T89j1hC2mNhOuATOib0FrTaDZjgmO4F/h0v6TW/uj5xWq847Rp0XmAHsUXE
	W81Q7HUxMEj096vAbuWCuDpXwXU9eYhdWVdYLp10YosWkjhtJ8y7Pk/ivViT6VyiLTztA
X-Gm-Gg: AR+sD11LPGvSkypCq6X12d4b01D5AR1sUIbm6XWK5frfBrHz/59WSTIQKvRWsyShmSc
	mVcQ8eqSa9zhYT2QciMsyM5l3pYIBV5CtcujoaD1T7CR0xEUSod50VeK5ODgsq8rA8Gqfgrfo7h
	LVQxSeKIK7CQe7d+9J3z436VSf8UESSb55XVnOjtf/36hP2ajdutKPfpO+/Ceo2wTSVwvofd+1Z
	JfUnt0ijxB+pA8uFGfW+L454nmv03B8waiM4kFBmbY6cq4KbXJE+tmHIULVwf2f+esw1cONAUvJ
	DJ+Kx6AmajXsv5uZso+FaD1mE/tMuofIl10XoMY3FQ51SsK+z6wWwDfoPWrYGKrPqIrE+ew1pd0
	D/cUnAUPkl1r8VfSUJ+jJTkhtfgFkn2xyU4cWDorSMMV1EB5AcFQ4x+k3djpB7ikLdTa6GI0aF0
	9SJ0MZJ+eCQM+/7EooyqzFyFfiItynJQ==
X-Received: by 2002:a17:90b:5867:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-395df4dcdbcmr48361157a91.15.1787634524694;
        Mon, 24 Aug 2026 22:08:44 -0700 (PDT)
X-Received: by 2002:a17:90b:5867:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-395df4dcdbcmr48361061a91.15.1787634524239;
        Mon, 24 Aug 2026 22:08:44 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860ec7f7sm32335970c88.6.2026.08.24.22.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 22:08:43 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:38:32 +0530
Subject: [PATCH 1/2] dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-ctrl-v1-1-609e2291814d@oss.qualcomm.com>
References: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
In-Reply-To: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA0MSBTYWx0ZWRfXywInERmnkQIm
 XXok5ib4pnk9lyw6CE2SVkBymwqzEbGqWJknTr+lXRy7ZAm6HTXckk/YRwmSUvm+NwVa0l95o5t
 r5g8ZDYbHPTlBhtDts12No1mxXHqP6DWtpsK8jtk8O4HEyZ9D4qPoVNcy9te7zm5TYOrgIAxUqy
 QygUzT6h8e2g7b2vWzUqVVDglSmKePg167wkIWavLt26MHTi2Si44YqUXAj/GwpzTCNDAPRyC6A
 1dj/NlDvo6Qqr0tJUpwDKl4KH+Sd42ajRhKZ75MGteBQmFMpsAsFctODePrawEfDFH+2Sda5m10
 RHAif63y2W7gaC1IuCmwZhMaztmCURFVUaeDtDqrUranbmogz3HENHvNheUBoKk1epy3KoOt/Jh
 D4X/LxbksNzyBYcOd66RhUIONnTM3njmIxLey21DzK5/m5WoBsryxTv2MDh9s4cM2TUYyTL2dhB
 vvmMuW7m6X0RF/GlucA==
X-Authority-Analysis: v=2.4 cv=aPHAb79m c=1 sm=1 tr=0 ts=6a8d235d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VKQxD5uzQ55vUxsvsp4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA0MSBTYWx0ZWRfX97duoDryKQeM
 7gRK88qUTxWYlXRJJny6AxBF68ynq/fjm0TNQjgsoeOSg7zZraIOXMxiLibxWySEDUJg72oKb0H
 KCJiIv+GDu9hNTNFC7G+kvqWf+8PqwQ=
X-Proofpoint-ORIG-GUID: 1qfnza34BGL-yyrS4OBbPhC48h6bNjvJ
X-Proofpoint-GUID: 1qfnza34BGL-yyrS4OBbPhC48h6bNjvJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250041

Add the qcom,ipq9650-dwc3 compatible for the two DWC3 USB controllers found
on IPQ9650, using qcom,snps-dwc3 as the fallback compatible.

One controller is connected to a High-Speed PHY, while the other is
connected to both High-Speed and SuperSpeed PHYs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index ea60f7220afe..603d509a6ba1 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -36,6 +36,7 @@ properties:
           - qcom,ipq8064-dwc3
           - qcom,ipq8074-dwc3
           - qcom,ipq9574-dwc3
+          - qcom,ipq9650-dwc3
           - qcom,kaanapali-dwc3
           - qcom,maili-dwc3
           - qcom,milos-dwc3
@@ -387,6 +388,26 @@ allOf:
             - const: mock_utmi
             - const: xo
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq9650-dwc3
+    then:
+      properties:
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: ref_clk
+
   - if:
       properties:
         compatible:
@@ -506,6 +527,7 @@ allOf:
               - qcom,ipq5210-dwc3
               - qcom,ipq5424-dwc3
               - qcom,ipq9574-dwc3
+              - qcom,ipq9650-dwc3
     then:
       properties:
         interrupts:

-- 
2.34.1

