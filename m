Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007695;
	b=oAbyrnviSLKIdTZQFF8o+/eSBJNc818QWH4yoG9OmSwTuKUOrNtgjFtyM4CFJ4de/4p5
	 +vqpJrJY24ZcEIS7VtoUyfBEFCCDC3hAJiM8e7caR4SJRpgCBdM6Ai5BPFiDSDD5vHJWe
	 FP/t9t6m+NRbQBWQFwG5V82hyU01NBIKgoP4eYL8kq4JTkw2+GeCh8SLCKbJ7DETquvua
	 j4s7hLNGjcV3YWzPH82UKiE2jk+rQtKcZr6cWrM4bGg5RTe2uLmJLdizBWszFw6FIQh7t
	 uGtJZW+6u8/ji3jce0C12gbvxLLQ8FA4SJkDVKfuxbGBqROgBzpt66U/nornp8jg+8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007695;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=niHnPNS4j7b8me3YUuaMCbVbzdtn5rF7l+LNOV51YUI=;
	b=fC4gHOjKOLoq3fkLU8cFB05ge9YANxkJG4m7Qf3amjk/TdyAZNbDD2HHV0HUn77tN+1p
	 l0uUHXmCUw/2s5e3DCqDZYLWOtPdTOe4baxHhABKha4uHwdQsytRnyI9uVfKRJJNegoB+
	 3Lxrb7xSRWBTOloqVrfTdcX6jSqIMr9eKk149jiuSqLPA/5US674nJL32AZrKbF0j1xfa
	 Zs9uo8+BJZYJE3zEVhmG4upUfiEiqytguGZRZCFVRvYZnUUH1LN8VJmghoi6/SnIgcxEU
	 szG4jaUXE5ZVIP7chAeMSbXwrPYtR4Gn2fcr6ie4MAce4HQZxk9qYU5L7iXGUV3BFOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kfuFMLg3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3Covwxg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D8F606A33B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3D8F606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kfuFMLg3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B3Covwxg
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aSpq2222559
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=niHnPNS4j7b
	8me3YUuaMCbVbzdtn5rF7l+LNOV51YUI=; b=kfuFMLg3s1QzdI7oJ66bRfABjSX
	yzkTsgVEfiYxHkN/lOXXX/B0mWeqvMrJ0+6g5sMVgZGv8SEBDFhxAzldvyhskXJh
	BvLhm1DDQQ5uZkKrYZMvVaxy3JkwxePsCo1r61QD7BpC6dd4HIDKbk+LoKCZLRO7
	/hUTD+/iMbOVNXYDzh+HspjIBvUBoKP/Rsj+1q6BM7Dz/WQ3+E2nvQpVg2qPte1t
	n3awQOMWZ8fqxxrjZI0mGuVxD0jZGZ2QuunCOPBlNEW7lUFECQjjl10ZqMhIIi6c
	yiNdEe0eJ27tQHdqLVMEQbXtsbdykIJKdnNZgo3K3y74js0KbJJIXx1dfcA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9gsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:41:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso4660147a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007693; x=1793612493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niHnPNS4j7b8me3YUuaMCbVbzdtn5rF7l+LNOV51YUI=;
        b=B3CovwxggUnLAz0Mo9ac++LP57g+JIBIbUXr1CW28kev+jlMVwJTPPMSNcemcTyDY4
         zMzpw+CbqmYH7+uR1VydF14RRn54Bd3K83fDj0CLT5t1co7I9egtONztVWGme0dq3BTp
         LQo2eZlE9PVgOe2hCrks7xwMYma4mIPoXBA1O4ROj/zIwDNnSh45T476WLKPMqNz5RFb
         pCNMRBgyX7o2WgA93L3mPhN5ChsbeanKhIyKd0qbUVsJ5dlaoN4LzVpyyEhYr1tursg8
         AJS0Xwy2bmuyGjLu3DhDGWSXNbiI4Iyc66ViR8qTy3SeE6LKc8g9fJyqma8aS0avzplp
         dJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007693; x=1793612493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=niHnPNS4j7b8me3YUuaMCbVbzdtn5rF7l+LNOV51YUI=;
        b=B9HKDhgqsRMvN+kivmRjpnoRikHR8ja60U8MVs5I27/TfE1Zn2ZYtZ7C4WefwIWb7S
         g1+34VzPcSdQKJaLr0TsJ7H0Ib4zNmVotDq7v6ByUloNwBJqsAoUgZz+nLQgsR730H0I
         JQZongtejOjs/EzFNbld59r7fiOq2sITioJ5CHUy32ukzdz5DkOyGH9idVVWNO/bcEti
         2HBNnEGiczBOVZQE/cb93A9UoJInoLPmt9UdO3bGIiAmWNGlaPLP84LF8Rx+frYlhthF
         xma1+F5rEKs1IldIbSJ1XdnI6cKwiFwrreTM0gVD9im/1X/XgVYL7q4ubiwdsH336wCW
         AJiQ==
X-Gm-Message-State: AFq9FYJy3VLg1S076pO69ArEeW2nCD4wH3Jn7TyL2gCzwAIebW8hj4rI
	yDs3O0RGqs/G7Hdh+PdftWUv0nqtC8db9253HeHBPs/OvTWaffGJcweKCI726lGmFm+QPcsh0oq
	l0d7s4FFDjrmek7os3x54wd/8Zu6oNwrIm6umlz/9I87GTYoMyLYXVYaPQMMFLq/mmA0R
X-Gm-Gg: AYBFou3tjhrS5qGjQM3HFj9TmLQPk0DqDhNYau5BxQ7JT3O37Gcd++9rg5O0ljq0pzO
	Kwpnq9gnYmSI1BDp6ukw0q6LGT7XO/RsLPZJOD4eGcIlpBi2RO2OEvzYk9IiPkeIttFypNoxoD8
	z1GUC13DZ5kunkx2tDHZ+Y8mro/funADxAbHyhfH7eFOZ3tdkpWVLQEjgBjv121iFkmNBsedpqH
	tLyNbU9BZs1+Pgzt1xAH/XPAS9RF/+fmRiBaND/84Uj6KLaI1eLy9OVMlMim1cXeP7BmOCWzVp7
	odTngIy/uC3aR/Pu4Y5Cv/VQlRZmyojoxsu+e8JKBOIN6hY0eqwo4cRJhWWWpnqXGdT4wI0vtIL
	boBHV+5bDlM35Eobu3GkWiQ1qWBs=
X-Received: by 2002:a17:90b:274e:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3adead57c9dmr5510110a91.13.1793007692643;
        Mon, 26 Oct 2026 02:41:32 -0700 (PDT)
X-Received: by 2002:a17:90b:274e:b0:3ac:3588:b548 with SMTP id 98e67ed59e1d1-3adead57c9dmr5510084a91.13.1793007692169;
        Mon, 26 Oct 2026 02:41:32 -0700 (PDT)
Received: from hu-vhiren-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm7847966a91.12.2026.10.26.02.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:41:31 -0700 (PDT)
From: Hiren Gohel <hiren.gohel@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hiren Gohel <hiren.gohel@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: phy: qcom: Add SA8797P eUSB2 PHY
Date: Mon, 26 Oct 2026 15:11:17 +0530
Message-Id: <20261026094118.3264112-2-hiren.gohel@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026094118.3264112-1-hiren.gohel@oss.qualcomm.com>
References: <20261026094118.3264112-1-hiren.gohel@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: y-WD1vYgGUKZVhbuaAMykP-PbCGS8PUR
X-Proofpoint-GUID: y-WD1vYgGUKZVhbuaAMykP-PbCGS8PUR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX1zWTgyKyutXD
 q58+bh3G3+vS0A1l80gRzzPxLg5uOHH9NpZh9vPDtryvHeVvXxJOSjoceyHgzfx6q26Thdkfq6n
 kRNRqKodNI5yZFrCjGMyRRO81KJs58GoTeTQJPSTkPvuYz8xbBmOAWWTwik+jjkz5Kck5r2tUBp
 si3Z5sGCkZT822eAYnWgY49/J31nLA3VWgT2pK6mhvmFkKPy4RVHD+bq54/ix+4sNUGdDGuYI5b
 QUuvggmjPYVV0ONb5ks3shI5HDvCaMVFKrRLnMftM/sYmTfl5wzy5yv1y63CneDC0J8a7ijia64
 EKgipA/wvHsbp1DcXoVb9qjUIomRh2xWtm1BaVsiBsXQrWKSdZAt2h/afI0/4r9SvzgP5PJ728L
 PeJyCXlN7a2qfsdPxbtEb28YqC6dS5RnTLcWjzXrYB8FQQ9qR91lhhDB85hC6oDL1sY/ePeJ6O2
 janzOQgNMlrtZnE+C3w==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf204d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=agO9faSf6CXyJqtrtTsA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX1JwvTWOZ1Avl
 n7R5+HnXimSUAvxgODReneKnAUKDKgiwOWnOESX3KcnahNH1vzGD5Cnwz90Osc/zshF31u+YdSD
 qxQ4M4s7wPlDWwGyv5htj+LGhxwxDIU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260038

SA8797p platform abstracts resources such as resets, clocks and
regulators in firmware. The SCMI firmware exposes multiple protocols to
control such resources which are identified by protocol_id.

For this USB phy, 2 SCMI protocols are exposed by the firmware:
* power domain management protocol (protocol_id=0x11)
* performance domain management protocol (protocol_id=0x13)

The power domain has 2 indices: 'core' and 'transfer'.
* core controls the regulators, the clocks and the reset
* transfer only controls the clocks

For example, to power on/off the PHY, we should use the 'core' domain.
To disable data transfer and keeping power enabled, we should use the
'transfer' domain.

Add a new binding for the Synopsys eusb2 High-Speed USB PHY
found in SA8797P.

Note: the performance domain (0x13) exposes opaques values (0xa to 0x11)
for which we don't have any information. Since it is not mandatory
for the PHY to be functional, we have ommited it from the bindings.
We can document it (and make them part of the dt ABI) once we have more
information.

Signed-off-by: Hiren Gohel <hiren.gohel@oss.qualcomm.com>
---
 .../phy/qcom,sa8797p-snps-eusb2-phy.yaml      | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,sa8797p-snps-eusb2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8797p-snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8797p-snps-eusb2-phy.yaml
new file mode 100644
index 000000000000..0a9f44199490
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8797p-snps-eusb2-phy.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8797p-snps-eusb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8797P Synopsys eUSB2 PHY
+
+maintainers:
+  - Hiren Gohel <hiren.gohel@oss.qualcomm.com>
+
+description:
+  The Qualcomm SA8797P platform delegates control of the eUSB2 PHY clocks,
+  reset, and other platform resources to firmware. The SCMI power protocol
+  exposes two power domains for the PHY. The core domain controls the PHY
+  power, reset, and clocks, while the transfer domain controls the clocks used
+  for data transfer. The SCMI performance domain is not required for PHY
+  operation and its opaque performance values are not part of this binding.
+
+properties:
+  compatible:
+    const: qcom,sa8797p-snps-eusb2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  power-domains:
+    items:
+      - description: Core domain controlling PHY power, reset, and clocks
+      - description: Transfer domain controlling the data-transfer clocks
+
+  power-domain-names:
+    items:
+      - const: core
+      - const: transfer
+
+  phys:
+    maxItems: 1
+    description:
+      Phandle to the eUSB2 to USB 2.0 repeater.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        phy@88e3000 {
+            compatible = "qcom,sa8797p-snps-eusb2-phy";
+            reg = <0x0 0x088e3000 0x0 0x154>;
+            #phy-cells = <0>;
+
+            power-domains = <&scmi12_pd 1>, <&scmi12_pd 0>;
+            power-domain-names = "core", "transfer";
+        };
+    };
-- 
2.34.1

