Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2B33A9DA2
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 17:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260716; cv=none; b=AIZ6F5A+twMLD+It7VguuDWz9IV1fNOxkYJy4KVOGCvm4tm14HWRbgVj/FXTMIhprRMeHCPZq+9ajhqHlSVIbCeibI0Z3qBrvak7fYcisqTzgqSLk084ykHwgb7uJcEP+/dzqNOrtm01sWgedYe6GM88Y4G7VXlblNu9UY3HMrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260716; c=relaxed/simple;
	bh=KsznFoias9Gr7+EhnuvQf5kZBYgK2qNofKI+M7iy53I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PQ+ipTOgcx6cHyXBnpUYxY6FbZmYykarE7SAKTyFTSgoWgWDW7/4GlOWyTZ54Dbj/P6OjN/waNNgJ7MmuCIY0p2bFeMtU+QxQo6wbj3t1ckulxZzrZwTqEGmujbTXf19brLzqc5kYK4dt8NBHhrdnCvg2gUAVxYd+C6Ps7gIvXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXfAJjSh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5CLTPzd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXfAJjSh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5CLTPzd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SHICi22978258
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 17:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h/xiCBme0nrLwh5E+PqxZz4iFAPGiAXD90oYrZH2xsc=; b=TXfAJjShW/H+3tRc
	OdzcU0HuGrzTn/SRSBM+2kQKrff/kvUUo5rTUjBzHtOjHZypWkI4/PjKYcybX3PL
	lCfkudbaqJQYBk4FmCAk0CXOCi9OtzVDnv7s3jhMqf3WD26t6lbf/tcG4JXLKuI/
	I2iiqSDYda1GTcVFHAStx01xlAIWB1mObF7J7XMLVw9jDXTMWLt9DvABpsp4uRMF
	m2h/U6aWSkyNwKwaRE/eobGHL/DSi+YeRhuWYa2StrVySI6XbMro41CoXbPzAnIB
	hww4ySJ2s9/TguSif+uMjVwiWZ5mpbVpU2R6LbXcpq/UN8lGDeUoFGzUJu9xTiO9
	UIveKQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q0g3p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 17:45:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb733fc5024so3675a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785260714; x=1785865514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h/xiCBme0nrLwh5E+PqxZz4iFAPGiAXD90oYrZH2xsc=;
        b=P5CLTPzdje6T34oxuT9LoIVcW9JGQNGSoQEcr3lOGaIi6p99JYlBB4pvnHM52ERZtE
         q+pWcVASXRIqfIo3lkCnQGK9jwZmJUkUlr531GK1Kv8sFdLnH2/2yGG6pW56t+N7JxwV
         NBVnCa4L9DDoXNx5skiw6ZcLlc1mYmDtGCP2KkybWoAcm62X5o7I7roDNPtHRGO6vLLi
         8+0Lqd2Co6cNnnf4ZuNJdQjsOvxuMu2/eS40zDpSX0RzBKvbAB60Ar7u50gkR/+WjT6v
         lWKn2aDprd1zi03DbJovxtPz0ElH9FxDm5hFle3gcGEL/N69Ysm+CDPkbYpZlnwgqyIE
         JgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260714; x=1785865514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/xiCBme0nrLwh5E+PqxZz4iFAPGiAXD90oYrZH2xsc=;
        b=KyrrV7NNPyXqqZkaMaDVpzeIliwk18v+Nc6hgo6Aui/dEAp19gw8n8E8FStqx8JWzN
         /kDEcqenLlHx2xiln7moSfRwmHFlKxuOJuZt5HTOmbmMdq8yBvqR2opWd0LwYfjmLmRY
         kKxla8rQESs2nW/GEyOPQC7rHBhg8NsnKCEKR+LWwkTn21vmevXyTuoIX/PcTYC42cSs
         YtaDLzgdRKX7i8MuzGr4JpJJr3sbZi2byL38eHSjmEsS/NcKmT3zekNVrpFT1QGYIjOO
         /3IgMd5tryj8oEPjcU7JjpzSK/w/3vtGX4PXOmVpvEW81pHZ0JUnfhfyyrQmUPqAt1Ft
         yWRA==
X-Gm-Message-State: AOJu0YxlOp6RRFBQlOM7Fzy1g/GtNKLvPKAv6D6KlTF8yn+LTOZOU/3z
	0wXSmFfsObrGOUoDrb9G6xfiaXm0Zh3bCCBCjC+DIdB+JGx06nL3Mpz8b2NNPR+qpFiNj2S+Vc4
	aXw6dBgUjaAY1WISvV9v1MwGXJPuExZccVVVjEzTZklbT4CtuWzw+0dv7tznsg1KEPzfd
X-Gm-Gg: AR+sD12wlXtw+BfK1jVMbDNo2kozdLabd8li55mHHz/MrbIW+oYomiM5BcnL/AlIHbl
	zp8lSOcmzfZMBU5UkWU/lpHgeGDu2cKmqLSEjj1sJM7boCmM51IlPqyEGojxXOWkPhDfpDqzpUo
	n0Vgc0e+gtSjCz9iYUtydcaPJXzyKkwQkRKJhAVsp5lKx7OX7aEmfXtzq5jopYxOm3nj7BYi/MM
	flbuH8vbvtNMIyKg4B70GmiFakw/Mrtw6UT9JuJzPKjBzdczNsdnL/2d+4CO8+9J1nmOePvkfDw
	/4L7kf+HNvKCT23CaTLu9MP8itr23KIfwea8dNmqYrfZ8pKgBxpWEgj38RykYVDPQLMMx/Dh0km
	3p9XFVbnwyPaVFI5nRWm781s+gw+WTkQJXxvBpAYkZZzpZlcOjGR5uk277cVfPurGrNuOB9Keku
	G7UjxBxzbQ1C4F
X-Received: by 2002:a05:6a20:d529:b0:3c3:a41f:ce7d with SMTP id adf61e73a8af0-3c89cacf521mr4367796637.0.1785260713879;
        Tue, 28 Jul 2026 10:45:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:d529:b0:3c3:a41f:ce7d with SMTP id adf61e73a8af0-3c89cacf521mr4367753637.0.1785260713336;
        Tue, 28 Jul 2026 10:45:13 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7273cd9esm749553c88.13.2026.07.28.10.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:45:12 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 23:14:29 +0530
Subject: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785260700; l=2591;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=KsznFoias9Gr7+EhnuvQf5kZBYgK2qNofKI+M7iy53I=;
 b=y0OMhUp7s1ciwxgqBH32RD6URch1OLFyOSuOwqc0D/uyqpqj2T0k9WsJlGKDbhnyh3aP7g+pZ
 GXlZgOv3880AdRzwStwEwNUBpw+1Y/W+5hJjwx8Cd1BX0k/8NFRJj89
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX0MbS6zInO4nb
 2o2qq4K7ozO067qc4i35hwvwzHQfliKjkn0y/ZW8awOQaxzNka9opBDKVl45V+58wJN+18NsD40
 MmvbC5Xwpjym5HzfraqNurNE0XsmHCm1DdOlviY56gRfon2rprPl2dq/npVQRbzoQFf0PH2W8y5
 hEIoLJeCFtqeRlmbTbq4+C99iue+X+XHXuIWMPvkVBuou6BMRYia/NiW4TSkU53yoC86WpPeNmJ
 /fSAPU8AfymchA5jkm3kaIRTz1ZGN+g6ACK5gHWLB0778FB+V+THYS4AwmUn6FRalopOqhPWqR+
 CfO1vkCrxKCPP17Jp63oLslOOcO39ksoj1Fc4NnknwYLJy/1+MoZ7TkrcJtngOWIVyyCWjZwNMC
 qZTTx45n+Lbe+In6k6nE2ITR8oaaPK8tPTTnZv07P+mqLQIwMJEtBwD6oo25xVL/b7OFdjlUYt1
 sg464mpsU2IGfkuIwJA==
X-Proofpoint-ORIG-GUID: HItZu06EPaMs8J9W0I8UY8yB4NcWVz4O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE1NiBTYWx0ZWRfX4brAq9WifpJk
 vtfmKhMqqEGJNfqo3G8PbxXueTw+tpTHjwI8ckPSVb5mgf6eZaG4wrWrfdcnKr4xdxoWvthbypd
 X19FgJinsBs3/prG+FJHIfl3iPVn9rk=
X-Authority-Analysis: v=2.4 cv=VezH+lp9 c=1 sm=1 tr=0 ts=6a68eaaa cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dzekx4SEDLAKeHpuqyMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: HItZu06EPaMs8J9W0I8UY8yB4NcWVz4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280156

Add the qcom,tsens property so Hamoa-based boards can list the tsens
providers, and how many leading sensor IDs on each, whose readings the
driver averages to compute the SoC junction temperature reported to
the EC for fan control.

The generic thermal-sensors property has no standard semantic for
selecting a range of sensor IDs from a provider without enumerating
each one, so a vendor-specific phandle-array with an explicit sensor
count is used instead.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
index c07483aa5937..ec809fcd03ab 100644
--- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
@@ -33,11 +33,40 @@ properties:
   interrupts:
     maxItems: 1
 
+  # A generic "thermal-sensors" phandle only identifies individual sensor
+  # IDs, and thermal zones are a Linux-side grouping of those sensors, not
+  # a devicetree concept the EC cares about. What the driver actually needs
+  # is raw readings from a contiguous range of leading sensor IDs on each
+  # tsens provider, averaged together, so qcom,tsens pairs each provider
+  # phandle with a count instead of enumerating every sensor cell.
+  qcom,tsens:
+    description:
+      List of tsens providers and, for each, the number of leading sensor
+      IDs on that provider whose readings are averaged to compute the SoC
+      junction temperature reported to the EC for fan control. Only
+      applicable for Hamoa based devices.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 2
+    items:
+      items:
+        - description: phandle to a tsens thermal-sensor provider
+        - description: number of leading sensor IDs on that provider to average
+
 required:
   - compatible
   - reg
   - interrupts
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: qcom,glymur-crd-ec
+then:
+  properties:
+    qcom,tsens: false
+
 additionalProperties: false
 
 examples:
@@ -52,6 +81,8 @@ examples:
             reg = <0x76>;
 
             interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_HIGH>;
+
+            qcom,tsens = <&tsens3 2>;
         };
     };
 ...

-- 
2.34.1

