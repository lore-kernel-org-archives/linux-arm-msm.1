Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877101;
	b=5S3p5ZbxdjgNUYWsbglsexotuUjjNEKbWkNqtiRvVnfeLjHjUwNcEXCzZIOZmYgi+4CB
	 xWWjkru79lZtJwEEx7pFhcFj7derhVal/Cgznk9Sbo9oU1iBKc8QKEoX1A8jPz5Ud/JdB
	 5Zq6gVFHhEyFjXzIFKnBEg4xfvFDPtQHl3610nUui3pMpP1p9rzOQFrIfw7sCOyLU4/+E
	 qZXK9jLOr7FpicrmyLlXKAd8NN40o3H/N+L8mMv72c6mfcBnKOKLHM1APlzPNq5RMC5Fk
	 emA2sF48zpFBIFUT7bF8hkNaIBfAWDHmcTg6fZIDtjYgHa1rWfKhkK+s5ufrCMYF9Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ykQcj0AQYTsQP8WoNJ3puslG+JpNUOX6RrBb4qGTMJQ=;
	b=WzR6BASZU/wjO32oTH5Qk0+vfBvz498O0HoduqqRTZ2nwkHmqr76i8ryIJy7YVTRoPq7
	 Yv3qHw/T7C/gvRj+Y3dL2Y8ZHLDHEMBRWJwN8IyH7qgX6Uvr96WS6DBT5wUE2cVTwhq1l
	 nWyxm8eUd8SYK9AMQafNFeqx5LueC7mFLGVPmT0UNZr1XfXAiRnXbCdFIwuO/vc6WokL2
	 3h96uLwj4KuVqr35GFoFkVqZdkuNv2oCsOc2+VLvUGztVyCJgI0lfPjv8yjvwSLpzQbWs
	 wkVY0nqgw4Y0lqn3inRFsprEU6slj7NZ7YRTLa5NYX/HY467v3uomKW8REKesap+2JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c4HjtbJv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cSrCZKuf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E58606D80C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 11:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7E58606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c4HjtbJv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cSrCZKuf
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tetC4084686
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 11:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ykQcj0AQYTsQP8WoNJ3puslG+JpNUOX6RrBb4qGTMJQ=; b=c4HjtbJvOEEajdTx
	j2WA4SDowGWC0tmbw/I97/O7NmwNUj14QTcUFv/LZBssN1do5KwauiuQbjbdjBzs
	tt0N6NVuDFTSHm6hgbSLA/uWRIAw35D8fWU67fRZ18ln3tVfYJExboI6uSBYL+VK
	nBJ/WYkuNOFtVtkUJFF7KUkgaaIX2SYVNuR5R110kEi052bBewkLQVGWa6j5hvlJ
	pL/f5ZOWZMuSNhZzxk/hKR6aPqwlLZZI6IZ9gNX70svbVFtwQnuMo9CAow3HY8bQ
	R4XHrT5VuMg5kMBFOcC6Nl4D+rj6pWPhlI4McBMbyWPn9B018Nz4CYL259B2DUlD
	Nt+weA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkr9xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 11:11:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f62934ef6so414763185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 03:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877099; x=1794481899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykQcj0AQYTsQP8WoNJ3puslG+JpNUOX6RrBb4qGTMJQ=;
        b=cSrCZKufS6xLFpzSjaaGkUvHpnQA3DR6Agnpt/rEPqsPAAH8BP4bYPl0oKyh59Jo4x
         vBJxM9rZGUNK/7NZZqRxnkEA1+ggUIXqlwEkOHuUw0KAH2Bc+tL6HHuKYoOp/Q0TPura
         CMj6tKPBF+veK/ieYnaAVGqMpp16b0Vq6KBVUoBia7295VuOxpcKIOf3WybeG5MtebMR
         xE7Bjls+jT3a/DNGOAGkR5k+zVnII7iRSwLj0PfG0x6TScmEllfWxTVSZG6CJEksHnle
         qYq6cX1mOr5ICtlKSn7iwdGwckOMZoceZO+o8G6CFnDMg5ahe+Z5JHFh44ACrh0uWp1/
         qSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877099; x=1794481899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ykQcj0AQYTsQP8WoNJ3puslG+JpNUOX6RrBb4qGTMJQ=;
        b=MTHl0LlE2EIv9Qdlg1n0xgiapeLGqriwcbkmTHivm/Odi5J/5D/dERuNJpsnv222YZ
         M+pc4Af40wzYiG2apJcO7iucoAGr6wk+9w1dcdwm42MkTQXjBFFzgpLmt8UbBZVwfgA4
         QsQXENDWhE4Cixi0C3WsiM80aM3FlmnNldslf06IBSqHBVqqN1H0/nF7Geqbxj2GM7N+
         UfBZv+JG0YSrV7lDUGfagm+c5W9V64eaDIjnEeyPIiPBsIB7z2sgdwD8z0gGV3WgQvXd
         ZmIu14Lus68LY/99+SYf+nHyGlSC0BD8echvNwNOUiHu61sg6zdx1HJYJYrVlyZUFtqX
         vYxg==
X-Forwarded-Encrypted: i=1; AKwUvBwovAGV6lWo6IKfuKPrIVTWHfs7ypBeOJ3MIWn/0aB0djpQLKWPOipeepl/jS6Q5TBLK0Dfkf7kFnP2tPpa@vger.kernel.org
X-Gm-Message-State: APuU4Z8NU8skhgU9pn+VcX3EXTdyfnl0q2G2eIKU5M8Q7ay7YJw0T9mT
	EMITgn1j8TLCyyydz2vW26WQxebp2YFijXK9XCz7KIdyKoet4H+zyk5eMfgeEPuXrW1w2qeibVC
	Kx1UXojzHhMNHtgh91Q0+7j5F1lgOFoI813gEdiVyPhv481BDw37ySibCj5MkgR7DkK0JX2quDF
	ADLEk=
X-Gm-Gg: AYBFou3/kMXRt4iZK9v4/Rgpy+JPJIwUp3ND+Z3CXvBPKWJ4e1hWLCMj3wmQ2HosJSn
	0RxR3ycyLM7CgeWYQfIiDzwodQhLvwUk2YYrqDVJ8bkMSg4cbtJj1LCSfsA/yN57w8TZEQyssi3
	h1ck12/jZPXpw7O3PAZzXMkLLnVpuWHUN60f7Rhw3r9Av/Q3tgL0Xpo2t6ZBbYpmH/R9iVEcNKY
	h1kFuQfh2Qqtwplzkcq4AfjSZYn21smMYn6qOlGJLbf7hgyvmJVgegtb1gChWFdj6YXMggqe+5Q
	AziD+7D/RDmV9vSFlpXhvp9+qs6VHlG6ili4Jb5vUYLIVu2vuun4SCiJ5/EyY2cHYSF/YWF7KZ8
	mnZPix81cyHrvOtIOdvURBOp1H4a7jomLZP7IZOmnuZkELsdsOEoLULfu24xktjg0SkuH6feFYL
	IixATfztosGJBdOLJKSKDAjTaMEod6VoEsfxSRBKrW
X-Received: by 2002:a05:620a:26a0:b0:93f:52c5:a31 with SMTP id af79cd13be357-94421802977mr2976182285a.73.1793877098906;
        Thu, 05 Nov 2026 03:11:38 -0800 (PST)
X-Received: by 2002:a05:620a:26a0:b0:93f:52c5:a31 with SMTP id af79cd13be357-94421802977mr2976178185a.73.1793877098432;
        Thu, 05 Nov 2026 03:11:38 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d488f183sm438320685a.39.2026.11.05.03.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:11:36 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 19:11:00 +0800
Subject: [PATCH RFC 2/3] dt-bindings: i2c: qcom-cci: Document Nord
 compatible
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
Message-Id: <20261105-ccu-v1-2-3accc4b901de@oss.qualcomm.com>
References: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
In-Reply-To: <20261105-ccu-v1-0-3accc4b901de@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, vikram.sharma@oss.qualcomm.com,
        nihal.gupta@oss.qualcomm.com, vtumati@quicinc.com,
        bryan.odonoghue@linaro.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877074; l=3045;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=53/2ZtfsHA+VIBh3y1Kn8crIdUlYDr0140lytwfQVqw=;
 b=0INrlV/BUDtGc6MZEvf3Y6H6D08QeqmW9s8YpX4zWjftwYH8/6aUejLX4mik+ApWDQN+1qeCG
 8eEHyRqGfCdDF+EInZXIuiu3D//4jO4D0QF5ioDwyBtK8BoITnltOfa
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfXy3fbiurhDujb
 TyiEN+pRHC4JSG7HiuwcgEd43W9GICTts5b2dsBgKCAlcK3B9LNII2xLCAxx9vfVvzjCjCfMror
 uimRnDtDAFcXbC+/7M4HaH5Ide7tfLMg3OjwNYFzus5ViCRvJVJlyqzdbxo1V4FCY5TMkSXsnq+
 JqWuP3cvvhTIQb1cMQLBWLu+0nLq/GyRGXbeah8ZoSWy71Blmy+PkjEi1CEsR6z+ZpO3WdV/8aU
 vetx0VNeoafW3ygGEWPDmCgw5wwLPPhuf9XbEC0FXhnmWHwQHChk6bmNJnQDtldnoz1OI4jaHSA
 HFtz3NclTuM53K7SWWLkuRFMWNRe4InRX9Pl1XqUlawQm5Do2HoukY+cemWx7/nxHI5QDj65OzL
 Nq/P8dgmTa5yiALVlBgW3cORf2OExPC0QYAnffNKhboNOrFiJhrzLJ3cxMXzygdutzV7bHXu3Hr
 SMDewJo8MOoWzj/Tudw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX+LTYctzANyaH
 TaUAPx+QXHIRb8Tiy4W9DivhaTW4Dr/xulSUR8xQA1Z3oF/xEhcoj4c5Fkdos80vq/X1K/V4sOj
 Ga/a7/c0Wnr25lgyvMQ+Yk2uzNdSOeI=
X-Proofpoint-ORIG-GUID: 1xbUAHyizXgKr5C0trPGWAFRuapa4i5a
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec646b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=nHM2AM3XuFFpsIOFzc0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 1xbUAHyizXgKr5C0trPGWAFRuapa4i5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050044

Add the Nord CCI compatible. The CCI is based on the CCI v2 core, but
is wrapped by a CCU. After reset, the I2C ports are routed to the CCU
and the CCU output mux must select the CCI before any transfer can
take place.

Add the qcom,ccu-mux-sel property to describe the syscon register and
bits controlling the CCU output mux.

In addition to its core clock, the CCI requires the CCU AHB clock and
the camera subsystem top AHB and fast AHB clocks. The top AHB clock is
required to access the CCI registers and the CCU output mux.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..5a25ebe0e61f686b86306a1dc94911e302d9b440 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,glymur-cci
               - qcom,kaanapali-cci
               - qcom,milos-cci
+              - qcom,nord-cci
               - qcom,qcm2290-cci
               - qcom,qcs8300-cci
               - qcom,sa8775p-cci
@@ -70,6 +71,20 @@ properties:
   reg:
     maxItems: 1
 
+  qcom,ccu-mux-sel:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      On SoCs where the CCI sits in a CCU wrapper, the CCI I2C ports are
+      routed to the CCU after reset and the CCU output mux has to select the
+      CCI before any transfer.
+    items:
+      - items:
+          - description: phandle to the Titan CAM_TOP syscon
+          - description: byte offset of the CCU output mux register in the
+              syscon
+          - description: mask of the mux bits of this CCI, set to 1 to route
+              the I2C ports to this CCI
+
 patternProperties:
   "^i2c-bus@[01]$":
     $ref: /schemas/i2c/i2c-controller.yaml#
@@ -131,6 +146,32 @@ allOf:
             - const: cci_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-cci
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Camera subsystem top AHB clock, needed by the CCI
+                register interface and to access the CCU output mux
+            - description: CCI core clock
+            - description: AHB clock of the CCU wrapper the CCI sits in
+            - description: Camera subsystem top fast AHB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: cci
+            - const: ccu_ahb
+            - const: fast_ahb
+      required:
+        - qcom,ccu-mux-sel
+    else:
+      properties:
+        qcom,ccu-mux-sel: false
+
   - if:
       properties:
         compatible:

-- 
2.34.1

