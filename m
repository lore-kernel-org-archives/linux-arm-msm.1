Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736370;
	b=Lleo1XY+P/QC7dvsl3AdoLEYhSffU3+5lbpHlYLvLxMZV3M7i9CbXbBA2gmFHNWZMPIe
	 PPM0u12bX+y8knT/6PlyQQObqwkGOLOE8MsIwI+7o3uidPSojgmdkv8klejffO/l8c4sr
	 6fYam+SBBk6+r20gSMDK/Oqj8nPgA2NwL7e8AaULBp47QVAtvJH2mYCy6bK/z2MVT/wXt
	 yod4Q+UI2vNr4W9byFbJ7yBopBEzY7mNpO7iFY8BWYWrMIqxmge6M/o41vVMRrZdVnJmw
	 rjHXohOZULHqAmWMwj9m6j43c1aOeRoZdwnoQsD9p1GDp7Ncbm1kovPpUV53RS8Li3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736370;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
	b=pbC7yQHXdFeY7HnHZ2rtSSk+KC5UsuHHJ3/mwRnTkJ97pPyEgjIwxaPGDgBtTKswmW8M
	 KFRXWWnYrzvw7vMYvX8ZQNep0NN1CchigEKCwdhUneZCHwih5SX/dI3rRIrWHf8phvkRI
	 6CzZkq0MQlSJ7wmZp3NhtZ08cyXE2JResc1fsNuwCi11z44sS9LtkXR9QpvktCOg4Zo7I
	 K9C1h+MQejAHeotHPjD3sbZ38zpF0JWRbgkLPiNUJ+YwZ3c8tHEeeACbmziwT17hW3xW+
	 3LD3/Xg3r2Rog67LhTJOAu+tYeWtCIb/H3GhEnVX29IoBXjxXk5UjiNu6OqpSKMm3AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JGdEkNDH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NGUUTUKR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D599A606A32F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 20:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D599A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JGdEkNDH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NGUUTUKR
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ4o82586397
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 20:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=; b=JGdEkNDHLQfE3n05
	rV1gXVqqthXZL0g63tjtvD8mQDaOjhtSC4DqhHtws2l1rzoH5Lf2GwZuSEgyNIJd
	EGBofOiK4F5+U+zyVidg/hlyJqFVjN5MJ4xdGZJWQK6zIPg52N+iLaeJ++dXRRw/
	H8JO2yJ6Do/QI9i//nNhb18WjdrPB0F/7wV+1dX9wD6RDFWjAsqf5J3PO1xnlYKr
	KzlC8AjMViZf898NaXkZVl9RD1jMa2Qvig4VHnqRHN7rJBmu+FX52iJeR8dEJhXq
	SqcCbqkE8UtQ5KlBgKXccx+q76B6+chIGutG3uppRiB/iKWoZKi4rbtyyqOuCiQF
	B7j//Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbrf6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 20:05:55 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99859876e19so141136241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 12:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793736355; x=1794341155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=NGUUTUKRZNBf3dSdVwi7rT2zYA8bL8+42INiMbI/SZG/dn/CBmajUP9zOcHkP46oiH
         RiqjW8gc33t0mBQ0lhmVAtDDjtVz5Pq6c3AlqI/AmGfLTvch4TnQZzdzaa1Flc5RzvZc
         BVCQjPHtXApz/IrXf/EuD5ojwIsWhaFGr8kmCxvSDmPdCHm4E3V0xB0SAKYK32YdMWsx
         /IF8qM5O/kBOB2lpUCI1iOUJJSyJo4OTZlEV1b2RWAzewNMPh16uUOWEwBAsz1doICSE
         KIbubIehKU2qmZWeKik1iyYf7hhRpppgn7lNCS8Aja4Oe+w0j1FaCq45T9ReycQHKAlw
         s3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736355; x=1794341155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQgJsfAJIwc1P3YmgjY5JtZQxBkIW43VtHK4ofExmak=;
        b=HXugosGAC5Os+iNDo/s6nbRW2A7xKBFErZABOLijFMw3dM1QzIUMAp4f2bWXBRGsVm
         QJXF1j/NvqM7aDRgz9Ch9ZCeK3L5yPrvI9JJmy3yVgs9VI2Tw+QGIfIo1VG5xmdmEKkk
         wodK0oyONb5+1KHzZj3l+63Xf8cc7VBVm2X8HXu7DsHPQI3de+j+BVY/7hDbao6MXAmx
         ocf+GRcfKmAw9PnRx49D7R86t8bssEvpymeCtMk6KHvMhI8k6fHPARzQGiVZr7Tz0liu
         yShPLjuIjSLsdKFJk3osoZQXiFO5PPRlWvh/aZPsgawVc/Vn69Edr6HtAbDE/m5nNgQ6
         41ug==
X-Forwarded-Encrypted: i=1; AKwUvBxRLXA34qHnhGZn2WcLrmVLQX9pmKm79PWXTKkZkM62808AD6AViMIKpZNw720nqYmv2a6SexjUh4cfLO58@vger.kernel.org
X-Gm-Message-State: APuU4Z9bkXBBanFJVYDGw5TaotfRtA11t0p8C6qsDT1ll1A+Qhl8tzcG
	q45dYCoN3D0cQsiXECSwNxoJ6sOWtf0tqUhm7JY8+cYPK90FCVLm7Ee7vV8QpgH/jIL5CPIQC0x
	F51ymAebtoc2iSMw5QCmlQrxhkXgru2h4ZNgAbkNkQX/4Q7MwvBOEdbsvX/2rqfdhagsB
X-Gm-Gg: AYBFou1RVAG8Z+4oVdzabKcQUGiUIxD7Z0guBKTLL8NrF6YNQaC0JBb6bEtVUemFI37
	aNGdwCige2qHqfd7gDhJnB6s8OJxDG64820w6lKPsTkI66vlc4ENOM/fFcjkGUPN/fLKDb2A6Nf
	wZl+A2fCaeg6raAMaDtZ5AJCJEyqyZE2V+7+xq+pwDB0VTmp9flTyk5tAiDUUIh1DZ6g65+LuhA
	ulMVzdECv3M/iRMdKB+CH96XkXAfI987uhWqdH5FgZFsuPbuAauGjSdWpjKk96ri1pc2KWwDdt6
	0ZegagTaFMq5WZ48GTmPJrl0uFd8CnRAPr3BJ4dALatdYFsazURMmZrhwO0WJ0dOGneL4vw9/rr
	bMtDzbpLmsk79Buu0G+XEGd5Mfqf/u0/UAAL5JXqIb4VKDAG5VOMvsRF3mF6SIdgJ4jl3zFwkWJ
	twkdtYNk1wNL+YruLBPZeujBCJjkIUxhQGusUL3sPlP8TUm5eDKRpwNqyFTIbnz0cfylIMkgOjt
	Jrdj99ghwp1cH8ZTW290KKsADrt
X-Received: by 2002:a05:6102:290c:b0:7cc:2152:4f72 with SMTP id ada2fe7eead31-7d072238fc7mr5124525137.1.1793736355005;
        Tue, 03 Nov 2026 12:05:55 -0800 (PST)
X-Received: by 2002:a05:6102:290c:b0:7cc:2152:4f72 with SMTP id ada2fe7eead31-7d072238fc7mr5124518137.1.1793736354436;
        Tue, 03 Nov 2026 12:05:54 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d01dsm358875f8f.44.2026.11.03.12.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:05:53 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:05:46 +0100
Subject: [PATCH v13 2/9] dt-bindings: media: qcom: Add CAMSS Offline
 Processing Engine (OPE)
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
Message-Id: <20261103-camss-isp-ope-v13-2-c2cbf15a39b1@oss.qualcomm.com>
References: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
In-Reply-To: <20261103-camss-isp-ope-v13-0-c2cbf15a39b1@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: gKBB8-3izYZS7wnKMVTG0Ub6EZt4DXMx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX1NICt0Nsefva
 tXB53l1x0QQQLTdr2bVBDgVCoI2qGYt1gAOTrWRe8V8oUHSLbwcLZ9Tx08sRDt5Tgfig4L4RR5I
 iek9pm1i1hdU3BDAaV44NVGbYQdwRMm3m0RbXbDbQH+COLTsxWMUM/YDma0K8GtbQuqnNGQUBNa
 G8qehk7oM7OMfZmUgWMnIB930fvqfgPg0FH7W7st/tsfKwxnKV65jG1Sb55QS0I80bL8P8jrhBy
 ynzUAy9+OkksjdiTqrNSYfD48/pH3zIMwdCAUAZZRGSiC3AkpRWIt47w626kZqPNvnWx27KJfeC
 6xEEiy+mGPHmnZf1sWANUlDkQLIcmxd1JFl8eHKsZyFImc5tttjMdUJtW04jBK1M2ZFG4tlPWCj
 VoQDcteYqJRxDt00TuDLlebRE8aUMuq13zv6j82cOOI2RI243oNMFk+ZjgmK7wmTuuu7/eLp8PG
 u78L4uT1tKxsZgnOPmA==
X-Proofpoint-ORIG-GUID: gKBB8-3izYZS7wnKMVTG0Ub6EZt4DXMx
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea3ea3 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=l64rWm3OqFMOLA4dSg0A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4MCBTYWx0ZWRfX2JjpgFDjejSb
 gSCZdXaoCy1hlArAXUHDdq4DtIFMYIUWAj4xatwMMEptS0AYJjqk97YCqo485M4ObLKQ4fRUHUZ
 VC0WE58DFCZjHM55EQz34wM3WocyktM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030080

Add Devicetree binding documentation for the Qualcomm Camera Subsystem
Offline Processing Engine (OPE) found on platforms such as Agatti.
The OPE is a memory-to-memory image processing block which operates
on frames read from and written back to system memory.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../bindings/media/qcom,qcm2290-camss-ope.yaml     | 151 +++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f9c31bc88e94b028c241060bbd8e56e0bdc49af5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -0,0 +1,151 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,qcm2290-camss-ope.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Subsystem Offline Processing Engine
+
+maintainers:
+  - Loic Poulain <loic.poulain@oss.qualcomm.com>
+
+description:
+  The Qualcomm Camera Subsystem (CAMSS) Offline Processing Engine (OPE)
+  is a memory-to-memory image processing block. It supports a range of
+  pixel-processing operations such as scaling, cropping, gain adjustments,
+  white-balancing, and various format conversions. The OPE does not
+  interface directly with image sensors, instead, it processes frames
+  sourced from and written back to system memory.
+
+properties:
+  compatible:
+    const: qcom,qcm2290-camss-ope
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: cdm
+      - const: top
+      - const: qos
+      - const: pipeline
+      - const: bus_read
+      - const: bus_write
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: axi
+      - const: core
+      - const: iface
+      - const: nrt
+      - const: top
+
+  interrupts:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: config
+      - const: data
+
+  iommus:
+    items:
+      - description: OPE CDM (Configuration DMA) port.
+      - description: OPE read (fetch engine) port.
+      - description: OPE write (write engine) port.
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
+      - description: CX power domain.
+
+  power-domain-names:
+    items:
+      - const: camss
+      - const: cx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,qcm2290.h>
+    #include <dt-bindings/interconnect/qcom,rpm-icc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    camss_ope: isp@5c42000 {
+        compatible = "qcom,qcm2290-camss-ope";
+
+        reg = <0x5c42000 0x400>,
+              <0x5c42400 0x200>,
+              <0x5c42600 0x200>,
+              <0x5c42800 0x4400>,
+              <0x5c46c00 0x190>,
+              <0x5c46d90 0xa00>;
+        reg-names = "cdm", "top", "qos", "pipeline",
+                    "bus_read", "bus_write";
+
+        clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+                 <&gcc GCC_CAMSS_OPE_CLK>,
+                 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+                 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+                 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+        clock-names = "axi", "core", "iface", "nrt", "top";
+
+        interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+        interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+                         &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+                        <&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+                         &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+        interconnect-names = "config", "data";
+
+        iommus = <&apps_smmu 0x800 0x0>,
+                 <&apps_smmu 0x820 0x0>,
+                 <&apps_smmu 0x840 0x0>;
+
+        operating-points-v2 = <&ope_opp_table>;
+        power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+                         <&rpmpd QCM2290_VDDCX>;
+        power-domain-names = "camss", "cx";
+
+        ope_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                required-opps = <&rpmpd_opp_svs>;
+            };
+
+            opp-465000000 {
+                opp-hz = /bits/ 64 <465000000>;
+                required-opps = <&rpmpd_opp_nom>;
+            };
+        };
+    };

-- 
2.34.1

