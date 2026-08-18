Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF7E451980
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787060315; cv=none; b=MAdQZXWSgo7cJMa1jcAEpvAS8MmgBBOuggwUpgD1NbMpzqKNPUwe1AJcjt7wiHMf0Kx7dfyOGUyRzz7mi+SCgUPpNeJnrQ1Fuuw0qyHBIuvwj+g6p/8Y8ty6dRWdaptHHDBLmmo0Jsn6ZOB2qff6ZuJsmhiWIZBfiYqHPRgp2Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787060315; c=relaxed/simple;
	bh=07fWoDKWlhLp+o+voMIwf61zTNZp2ZtvKXItlluoCmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OkBsCazv2XoU6P9I78FF/MfEEx/FWTNrZf+pD4FL4zMO8TvmGGng7WF2OBl8OIfSE/wDk+S4mZatZ1eLKodlkLk5ETXE+GpJNRtRDWVfmMGOX7OHsxcKL5Sps1VszBqQgnqPlCMEmCD3MYGVCknz2MjftB9NsmCsd0mh31nUNEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c/KP/kKc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XaMX9ZTS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c/KP/kKc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XaMX9ZTS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IDQl2I1350762
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SY8+egivx5hMX+E10IaKzHuFd6+P6fa7OvrZXy9RXk4=; b=c/KP/kKcpknNp/QK
	IKzuUqrKIaaNAY8cE0TDaRSbumBAD8/y1kf3lWQLU4DMm3NEmNV22ObUHN2ugfT2
	Aye3vCcJHl+3/DqbF7arZ7NmE7aOikF5vIPCLy8IIi2CgkI70Pq0gCm32dF4HIqJ
	8YEJ4vUgIPyG4g6FVKBZ740xa2ruAXuTI19T/aWRJcFctuaOJ1OFiCqDyVKspEZW
	SlIjYE4F7oSZ2Iju4DPuCs3HjxiAGzy2Yi2VkGUHXKv6AlMokgwxVVBzVQwwnEyq
	PiJo4s0kLO+Sij0pAqP2uYbLFNhuufXsY0FKOTOChm1800pwX4AmfyF6zHwXS9mv
	KeFRiQ==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4nb18t9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 13:38:29 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6b1000e2b5eso663998eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787060308; x=1787665108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SY8+egivx5hMX+E10IaKzHuFd6+P6fa7OvrZXy9RXk4=;
        b=XaMX9ZTS/xhy1/P72Hj6EaYv1zh3I7Fdjn5Rn9XhjpxlVVOWRlw+XLwj8JsF0HUM1k
         tTELvpRLmjJMsZ09y5rvmPTRfFypoTmjvWftqltMQ+UT+7GANvdCV6qIkouwA+C9euuT
         pFCtzcrz1OY+MhARNTr7VYsNfwBoE1btNyBMiRf/TXdq7M8AJ3iGbL/bpv51mzx2534D
         7aszapXv735WQJ0KoYrNr+eWk2zeDt5S8pq5MDINl/sVNGFBZ928jhZiqTk1/IhKQ5Zr
         nSj1oYMnDLzqpqxmF9F9bctXkl3FtvJacFz8EBUT3cvkvzTzcY9rIyIUhX2EDhkTQ4yH
         v3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787060308; x=1787665108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SY8+egivx5hMX+E10IaKzHuFd6+P6fa7OvrZXy9RXk4=;
        b=lH4KO0Wi+vsyF8GHgrRoYE4X3HPLktNpcQkwtqrjN6pWhMU2oWA7RK7g5+naKe9vur
         5IJ7dzim+3UjhiQ1WhhtG5KucnY0+7TFiyu7NGuc/mD7N8UmyGORByPgEjB7FiONOjUm
         CMEnQY9HS1ZPP4gUeD1kh3r9h6Qpm23XJTaLbZFZW9LwGomtxZdykE8rAs63bZ9eVGpD
         ooXvteV65JBC2jk5xgkSNCEouvYPjG9ExrtGp0PUgYyprRaQTcAIe2/x06CrqA9zxNDT
         4gkjPbQUihZHvTwLFgaw27H9V0Bimdni4i+JpjMzJyltNY2I4R536K4jt9TVk+ccVG2h
         b+iA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9ZXMLZYXTURmZ0XQ7Yf51USsbMKrEBiYhHWizYuZ8rUHZJV4s3qtEmjb69Ngk1P0rsD14Xqv+i3NSVD6J@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt1uGEa19Hn5OU4Ff3Zk4B/U4td1csIwbwoM6rWUKHZjbmr6KR
	X9EnoQl4RJoB1wnPRRx3UTNYIqb6Gsyjd6irZjbodoahHk72YkTdRaeSg3+O2a4sKvghc5dHO3g
	YKILnBBVYOE4KdSKN6XgIoZZ9GA3YA7CexOd4OOlxfZHFC7JQemfYmYeff8uQzBYgJmP3JFGz/a
	k2
X-Gm-Gg: AR+sD12zkYP6QbeXrJ3fXrXOh7sUOQZu+DDI8ktJ9WutWCZlgWl8WBowhuSuRH7Aokz
	/gQKW59kpngSwTP2nB3qLj3MA1PrbJfgZvxverVUe777yHCOTHeRdwmQlHomcFWmWD5hwI4wVK7
	eicPnDCoXJ5yX8JRMXyfM7LJRMStwyQl/ZdrUmJLjUNVXrMgjV2vpg8rDMnUZ8oIeMxe6617NUd
	bMWbvlN+R6UrCmIvd4UZ4sldSU3dhqJ04n4brMBaUKUvT/i9aKFZEBBMc3wHNhNxyV7v+HOJWSb
	VgqDtQwAdAqv62A+8kR+Y4eUQwO3umL69MtDNE3+POg0KkN4/n/xETI6KJ2WskiCmhQFZP1B8WL
	EqkVsOB2VwbnZPdarVzVjyWanKeYqgTHkug==
X-Received: by 2002:a05:6820:56c2:b0:6b1:2ac9:a9ef with SMTP id 006d021491bc7-6b12ac9d91dmr2027100eaf.1.1787060308496;
        Tue, 18 Aug 2026 06:38:28 -0700 (PDT)
X-Received: by 2002:a05:6820:56c2:b0:6b1:2ac9:a9ef with SMTP id 006d021491bc7-6b12ac9d91dmr2027060eaf.1.1787060308035;
        Tue, 18 Aug 2026 06:38:28 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45f22aea368sm3232956fac.5.2026.08.18.06.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:38:27 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 19:08:10 +0530
Subject: [PATCH v3 1/2] spi: dt-bindings: Document ready-gpios property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-use_gpio_to_notify_master_of_spi_target_activity-v3-1-e1c9e0dabbda@oss.qualcomm.com>
References: <20260818-use_gpio_to_notify_master_of_spi_target_activity-v3-0-e1c9e0dabbda@oss.qualcomm.com>
In-Reply-To: <20260818-use_gpio_to_notify_master_of_spi_target_activity-v3-0-e1c9e0dabbda@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787060297; l=2206;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=07fWoDKWlhLp+o+voMIwf61zTNZp2ZtvKXItlluoCmk=;
 b=+RfIboZ6AQXsKOzLAQuW7H+UHiOiN/W0hk/Va8G/kwNY7uBMbbuHOeKUmbGxrj3QzRK1Om1aQ
 h4SFLmlIKcdB3Yj6ChOxYrser1T90jnnfDzj6p2lpquvTZt3VXl686H
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDEwMCBTYWx0ZWRfXxmObKmyfzpgw
 P++QIGtf3tdp4SuBGZi4831A6niY7/sFDR535rHvT6f+aFjWtRRFGqVHjQDzbPM3YwcIxVE0sl9
 TPzC25AVygzyPCMBOC3EkG3Bt357KZ5RpQGJqRndgMxyRGYRlmFCoNdu7zhe7PbwHSYTRRSO8p7
 L09pkrnkeqkdsZkDwm+fzN36vvfkJyWX5WIeA3xPk1/nBM/x6P/eOmzcw5mbS/97BBQYmXxyI6s
 R3p9ztA+7fMvoBM3878pgmIURiO9kNcHv30hi9EfZzFC5GciNBCjI5oAf5tDQq3uhyxJsRdS7MT
 1FfWu6c2n6qat+OWbPol3lLbc+l9qyt1AeyjbKKvIb8QO85SaAtR/zYMapiZQJC6Py6aKag4JJj
 h3HjDKdtnNVUMmEfpWA8DIBx09NMECj1od9RwQ2PvEcipMO966sz7P8EnGtmaWRpeBifH/ffCyt
 2gYn4BM4p4QhwiSi2xA==
X-Proofpoint-GUID: z2P6wbwYcOOctrp8RDN7MbB8kC0XCcR1
X-Authority-Analysis: v=2.4 cv=Ze4t8MVA c=1 sm=1 tr=0 ts=6a846055 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=esOR2qCunaKGNcCvXUQA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: z2P6wbwYcOOctrp8RDN7MbB8kC0XCcR1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDEwMCBTYWx0ZWRfX1qFKlbuHoLgT
 OVCQbcRUox11YWw7Tf9MxRwZ8sgxCY1uEOBfdOVVZuIN8SnwgmmDkbETG/XYMGgqsi3oa2BBUoe
 RJ8r2gpSpwL1USLsAb9nSHKeKRa/nZc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180100

When operating in SPI target (slave) mode, the GENI SPI controller can
use an external GPIO to notify the SPI master about the target's
active state.

Document the optional ready-gpios property for the qcom,spi-geni-qcom
and qcom,sa8255p-geni-spi bindings, restricted to spi-slave nodes.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml | 9 +++++++++
 Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml    | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
index 6552303a4f52..33eddb395a0a 100644
--- a/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,sa8255p-geni-spi.yaml
@@ -39,6 +39,12 @@ properties:
       - const: power
       - const: perf
 
+  ready-gpios:
+    description:
+      GPIO used by the SPI target to notify the SPI master when it is
+      ready to service a transfer. Only applicable in target (slave) mode.
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -46,6 +52,9 @@ required:
   - power-domains
   - power-domain-names
 
+dependencies:
+  ready-gpios: [ spi-slave ]
+
 allOf:
   - $ref: /schemas/spi/spi-controller.yaml#
 
diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
index edf399681d7a..8d1c78701657 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
@@ -67,6 +67,12 @@ properties:
   reg:
     maxItems: 1
 
+  ready-gpios:
+    description:
+      GPIO used by the SPI target to notify the SPI master when it is
+      ready to service a transfer. Only applicable in target (slave) mode.
+    maxItems: 1
+
 required:
   - compatible
   - clocks
@@ -74,6 +80,9 @@ required:
   - interrupts
   - reg
 
+dependencies:
+  ready-gpios: [ spi-slave ]
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

