Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794956452;
	b=ryzpVd+8ItCwQJ0eDaMqB41CookwlhmqYIKNZHhwBbCN7chE1nF/mYE71x+0aZ4cl22V
	 e/5AgfR34if5erk5gU9DmLATzghws9wd8e7oFwf0KuIVzWe/lCD++ksgyTMos+jkxUFDg
	 2dPcXWW1MoiOVlvdgoFvxsGMIYFvfGs5oCLAdeSOxnLUW1/Kp3cbgMqlgCKAn534sU8RJ
	 eiN/WbwY8TYExdcgW4VBYs2pSKC2UJXYzt0vKVVAUOhvROL+RRtd9fdlW3V5KqaAXtvvw
	 8t3c5+HS6dtioTs/zTeI+4Of+Dr528t1DlWv2mndCjMv+QSkc5vTjvLMHPQz6LUyRlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794956452;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L5Yn+CHje9hd+sqisEi7dp6zLpdXzwrI2oKNmqrlUIs=;
	b=cJLKgk1MsAkeLrQGPQVqfsU3pEqhwNkYRzEI9J9LvP0qk9Af3E8++Trk7LcgTh9S1wGT
	 XI/92EDmeE6FJhqfGJGVeCD9Db9+0akRs62qKEkxA+Ec37jN2mO54WgyiHtKqJhixpURR
	 VP7/x3iBhCfNrP9AbBWdMoz7R67q7vJ6Z0r+UcuoOGgdA2JmwgpV0I9RVoQ0Lj/R5SdyE
	 oo8khtWQZYOHiSYoK9PLgeRQiY1dhdMZWexxRjoTQj8h1p0NJDkKfSEUacqmszA+o3vMG
	 w3p3jtsMCGYgPfwcECVSasRKVZnBn4WEq12uONarHLyO8ss8iioWBXIRjeR7cG8pJkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JC5gcMs3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fgx2UM3G;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAC8606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAAC8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JC5gcMs3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fgx2UM3G
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMf0622627483
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L5Yn+CHje9hd+sqisEi7dp6zLpdXzwrI2oKNmqrlUIs=; b=JC5gcMs35H4A6M9X
	vPNREHXaNcRfAhv/ZpXm8SX8n+IrA/GeDhVuVAsYfTf+cezWboQrBXlojB8JevNX
	L7EFIuqArBAo39W2zYnpD4ZaXw5v2naGfXd/rj3aw4pymw8SqdivAXgF85NRhpfz
	qGd1Lm2yqkcjQbNUJvCYsc4ioLINvvkv4SC/aZ6NBtC29qN26F9yncXPOfZLtTyT
	m15RGf9WPCR8yIz8jOdz8da12+0WbkXPWDbyU5e+r0nWAJ7CT/+xwC5t99bpEShI
	7gs+sFuV96XIks9kgXT6jDwgwNwH8S7GpkSid5Kk8vHrJT0M3Y2baiiefx98rNbm
	TFoP2A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9g2g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:00:50 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b63b9665so239015c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794956450; x=1795561250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L5Yn+CHje9hd+sqisEi7dp6zLpdXzwrI2oKNmqrlUIs=;
        b=fgx2UM3G/pHkmvDUaIYGd1rQsVPKEhGUOGkQCljP4WCbt+zQOgWfrTWyAe4/1gqwsX
         FX4F7vgnf+5JKKJ7S03nVG8SqQ6a6FRS1IZVEq3ESWKOXG4mybWoymhgYj+c2p7rtElq
         NaIp4nsYAe99vqUQXvXHUuZ1/ieK/PxdlhhiuZG94SirGbXxKMTCjq+opIJmQ8B2ulM2
         zNGWTvk6jC/7PVawhgddfEGv1w0X5I2gSGif1NgUf0ZpeDFozkZfwh9wzkAZy2LjMBqI
         u9jw6RwiTX1iaQiz6BqnLtJmZ7e7/E9iRK63gwESMSwn609GkgmI0HYIFzwJeRyaioT3
         CMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794956450; x=1795561250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5Yn+CHje9hd+sqisEi7dp6zLpdXzwrI2oKNmqrlUIs=;
        b=bKGtzVlojibOsD83b6LsJzuJB2dW224b3L3977mZDHend3pz/xzJD64O4wzN6ohWgr
         GbKMbFRFS6a80jb4JEfNobQHtTiHm1iN7HIeioYrqJee/+qEuRlM7FP0L4kPHuQ8Ao9l
         AqWU3kQwCTukSX/OKjKSBj4m/ZBo+ldQO1wHY7JQcTfyJk/iwpGRZxrPntTrUi6ZdS2r
         +gIF6WlNk/RpYTgytXZ9Utb+zqxznIhxcR5w4n/XC49xfioisEpKMay5/dq3VZ543Miy
         bbLRgEMoh9tldmXeS8Ir/TGXeAuCL1rwUqM0Ft0vNWXZOkqwRm1LrpsttigJRm6LZ7Qx
         cnhQ==
X-Gm-Message-State: APuU4Z9X02C2g6pC0sTsRr6OG40CZK2t+W3EfZEbZuCu1AiV1be3uKKv
	Yi3FilHK0g0L5odOuyUndFbDkRkcqjSDp8ce6ioSROcHYX/cb64GIRQJoeUpxmPeCHbxV39uDoI
	1E6qAZxBjcSBXWDS6Q4xI0WaWnTnDUjHUmcUDCtFOlCmCTSu487S2u/TtCQg1sHt+Ctj/
X-Gm-Gg: AYBFou3lbhJWpKgRy40pNJvgnTfdWTvU14MYGPD8gBuTZQLQywrTJtU3aQ9DTwk3nbA
	zY/QtiuRJNsRMm48gE/aZ0cnItpQ61qnoy1KZG+aQcjNld7kC4TlLDWAsaEhTJsK4hLRhndNKdF
	Ehai/Ech/G+dwh4r413KIoX+iyZxQD0YWOSiuNAdjOf7bMmov/CefbuPvxv2x30tmOPXDUGRpJN
	Sb+oStGjT+T5dWoKLCHBGWocoTd/i3YdKQ/6/wogtD3XabsBCIA9Ux0Z5+GWBq/KOhAMHsP5nBR
	JgOfQGH39EAfCXPi3vxE5IAwnmMVV2v6TUuTqKS0rLfqUrHghyNMazyXV0Uf0CQwPeIoKbh4mCS
	oK8VcNE0nMojVRjHt/6zlkplWhxx5lakY5U3wweRJudw8eGJUQi6dOiAZUYCoN2DUVS8ngMZnFQ
	==
X-Received: by 2002:a05:701b:2202:b0:188:e51:e86a with SMTP id a92af1059eb24-1b543c14aaamr706547c88.2.1794956448124;
        Tue, 17 Nov 2026 15:00:48 -0800 (PST)
X-Received: by 2002:a05:701b:2202:b0:188:e51:e86a with SMTP id a92af1059eb24-1b543c14aaamr706458c88.2.1794956445963;
        Tue, 17 Nov 2026 15:00:45 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5445eb29esm1380839c88.0.2026.11.17.15.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:00:45 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 04:30:05 +0530
Subject: [PATCH v2 2/5] dt-bindings: display/msm: Document Adreno 753
 GPU/GMU
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
Message-Id: <20261118-nord-gpu1-v2-2-8d6d9908b7c5@oss.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
In-Reply-To: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794956423; l=2675;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=McFLm0aMyTcV9N1kaYPA3PSC/gCV7LbW48SyQaf8meQ=;
 b=mrAHKWNH7J+q5CRxiq8eKAVDmZjI1fHu/90H1/VVy8UsyW/VM9VHzqWcWFwRPTSp3hv9SkAGA
 CnvdoZiKeeoCy9DHZ6FhciBRU61FloMlBPZfX9ZqnAuR+4QIz7qrMei
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: IRJhJbQIhtpH6pp0a29rH46q0oZEb6U4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfXxQsQt9N+cPYH
 E9PuEzHZHlEZxp0q9dMlpk+xejmE2WDfRMEgR46vntHFOsxTowCHX79eXlmQQnLmXRgryJCA9+O
 gjqRW79VRLgBLpYcu1SO4wKX6FBStrU=
X-Proofpoint-ORIG-GUID: IRJhJbQIhtpH6pp0a29rH46q0oZEb6U4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA5MSBTYWx0ZWRfXw374MCZcQmDq
 cR1eGMl+HzGExolGhzN+cvYf2DHNyI6YRbMm9YDOTY4e+rg9M6P6n1GRrCs0Aiso2qAyGtBK5AY
 Jdcz3Y2yoIvNsLUtWNK3u8TXcz2AKoOTgXzfftmcUJ5pZCokDNi89mxfIKHd4DbawEyC5i/AK5i
 3L7mSswP/bgG/zXapzCTNgPVGAFif83jizA1n6DXBoGUX5RZoLlXPfZpFIl99FL+YwarvrBaKOh
 vw41C8ntSB5ap8h2wTYjNI6L7cmP8W+4IWbTKwIFaGniwSFOoahWRMr8SHvnUFgOfokm4GRYR+w
 vm6PtwN1E8hx27u1WHVmrScCAzkAzZF8e3IN1LBKLrLdg4pFrYQXStdIbF1WfRcTyRa26WinTG1
 CpuO5bpaX1giUyVR4IxLgze3FZLcgGDNNp00ds1KPDXFjSY3Iu4yWpiXOMcCxWMHM8yfstPCZ3H
 TBkj/gnp5Rh0grahzQQ==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afcdca2 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=tfb5_1Jyd-QlxhXfLoAA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170091

From: Shivam Rawat <shivrawa@qti.qualcomm.com>

Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to the
A7xx Gen3 family. It is very similar to A750 and has the same register
layout.

Document the qcom,adreno-43051701 GPU compatible and add a separate
constraint block for the qcom,adreno-gmu-753.1 GMU describing its
registers and clocks.

Signed-off-by: Shivam Rawat <shivrawa@qti.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 33 ++++++++++++++++++++++
 .../devicetree/bindings/display/msm/gpu.yaml       |  1 +
 2 files changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 07f0e547b43c..6b28694624cf 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -301,6 +301,39 @@ allOf:
       required:
         - qcom,qmp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-gmu-753.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: Resource controller registers
+            - description: GMU PDC registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: rscc
+            - const: gmu_pdc
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: hub
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index c30de7feb447..3c90a09febe7 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -451,6 +451,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-43051701
               - qcom,adreno-44010000
               - qcom,adreno-44050001
               - qcom,adreno-44050a01

-- 
2.55.0

