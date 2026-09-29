Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C67C41BA81
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651876; cv=none; b=f/9CAP7ddYsMcExpihwvJYYBOdRK1BN+qQTXqDGDMkUNlorTjadFL5aeMstYHEbhE78MG33o74gdWYTLs3tKndnRHJWjmbdPK/EBqnM6eM340g3J7bJWi0IBBCZrKppzP70HL6Y1yQ0EvVVvOO3nyd+naUf63Hh4VxE9Z2wXG4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651876; c=relaxed/simple;
	bh=uFKjlolwn1ciafhDBmMwI2akc2BNZltPTKgmRmWckzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+v8FAgCadUGKpXm5HrwlWOpB3az7oqOLohLDK2xkKmDny4tjLtcjx1xa4XLIUTmbelyfgSTRTF1tsRkvsIqJLDAZVgXYpjGh5M6+ZV/sX+YeZEn2zQU/a48kCFrlmH1aqQKnkzX7d0kpJVPrHgAUVQ2pLiJuqJ9HrknxHUlg3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RBYjQyfQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aRHSdKNg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBYjQyfQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aRHSdKNg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T0jI1d3210936
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dASJnt3k+iJPNvbft15iYvw/242GHxpDWKpgPsBPFKM=; b=RBYjQyfQIm0ZW0Mv
	9bx+8E+EwcRxCBq0N4hspGuNB4YGuxsej+iq4FDqh+o/F9nCFvq6w0rJPK2QVJGV
	ui/0zYqKJIBWorO+gAPf9Tnoa7aeyP12imF+MqWLFJnd1PfutZKgwLFl9UVm5f3S
	vFEjp48hpL3uubhkjYYa2HETFdhrlVOiS9oF9B6YRqAMllOJPI7Tt8glf1qIsyLm
	pWM32xlNb8rsq4ajsjzeHb4N4u4+K9pEj1Mdq76hJLOEdvUWz/DJCIhGwsTl2bxm
	slbiNmIu2kW0nyhd0pTxkKBhIvqVrDtnj+V/+HDbj23L7AfzK7U3VGdsaAwF86hJ
	EdaNkw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4rvu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:17:50 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-342a0e1d8c4so1365771eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 20:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790651870; x=1791256670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dASJnt3k+iJPNvbft15iYvw/242GHxpDWKpgPsBPFKM=;
        b=aRHSdKNgGFQBrHtWUTA1iQ9WUSf/ipoI+/heW87EMQ+OezCN+wu8rcxl9Co+3gZecm
         c0MVb5uGO5mhFHFEHuVq2NwNhksNGGYZZIzFEZd0kgFVQk5eNLP7wBhb/QgFAqqbT27q
         0Qb4VZes3JhxHG+HO3BmQh61ApGP8D+KR0sfuwN31XXtg6xXcqzktOl7x/f2t5W4hzmG
         vFjVGgQHbnQOv9KaLXi1ejk8w/e9VzarwjqeReKJsAxcPmMfkK1FwPSOfeIH7jv/tzpf
         DNaB5B6XZAZ5Fs/uSulwACO5r6LgeoPZiyv3AKUYAnckgCufo9GlYyq59Veeq1P+rfU6
         Hirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651870; x=1791256670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dASJnt3k+iJPNvbft15iYvw/242GHxpDWKpgPsBPFKM=;
        b=N1Rlm0KvQKvPNXyuMJlZ5ZSnbXqx5YmmTv2z8bLT/QR+l+ZtFTmSu2FwOCQt+VciHQ
         YAND1bpbzHYI5X5412NWsndkzqKVIn7b19amcqPwacEJ9i6CFxTUqMJHYIfhrqEStge2
         PWEpiOizKzR9QxAyxna65amOiwbradrPk0aiq+kDUfL1Jq2mHKP5hR2H+799KtipVdIQ
         HkGogLpW/5wN3HbhTBvergM8+KPgsh7cAZEDHVrSEhzo6moSSR1OlIOK1t39jLadL/9T
         pKnUggFwGTOERF5EqieSy5Z72jnpiO6u4b7Afab/3JTQIh42nCZ8Rj1VwGywW6PmEfBP
         tlGQ==
X-Gm-Message-State: AFuF++lZyQ4u+zbTs+Kw0yyO6W76cefCi8Xi8daZZymzHG/bFWY/dYVV
	Q+hwPHfyR/cTJOnzFExlFsEAeXveJygSvfMgk5oczs/oLPRG9q2EEbFVahgXCkpBBOzk5P7oOh6
	0q4vwjfM57KoAEyvAQiCouAtpA/ZRMtWhncRAU+BCBKcKalSg5rnhBs91QA1cXAXhAxc=
X-Gm-Gg: AYBFou0z5/T0QII0XKC8nYeVM727KL/JTCVj6582TOOdq2ADIQwdt/MvUG1XIfUOn48
	p5XveDJt6k9gOVpy6zc3bi18Shxs2YU38RJLJdD2+jlEEI+dv8TLbXbHS8gQr2MYjYjmjFsQjKc
	aAZSUWLq2VE5S2Af8kQs4vqX8eRE7vAsUCUhpFvXIwYGizUWW9qATTv03hcFxvbG9GT0c3t6X0a
	pQ/GdM/xcj2uT96wVhTcqC10lb/lRUcKWZEUiWscdGoIovd/lQ7yCSVE7DlU3dN1Byg7cChYuET
	3q8jQVxaJEsn4aPvvuCBs8TmRqhWdY2ZuLES0FWgNPA84fLo0VzKPTS4TPpj1SZtOKGiPQFUTnF
	KkBFEAZn1fEHK0CUcFQOf/6OBCCjhcSkGI73nS9sH2Yz2PYLVHG997O2SMn0=
X-Received: by 2002:a05:7023:881:b0:143:2984:6516 with SMTP id a92af1059eb24-146d096b3damr13332463c88.37.1790651869977;
        Mon, 28 Sep 2026 20:17:49 -0700 (PDT)
X-Received: by 2002:a05:7023:881:b0:143:2984:6516 with SMTP id a92af1059eb24-146d096b3damr13332436c88.37.1790651869421;
        Mon, 28 Sep 2026 20:17:49 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad4028a9sm24789368c88.11.2026.09.28.20.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:17:49 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 20:16:55 -0700
Subject: [PATCH RFC 04/10] dt-bindings: firmware: add RISC-V RPMI TEE
 transport
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-riscv-rpmi-tee-abi-v1-4-04908b81d885@oss.qualcomm.com>
References: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
In-Reply-To: <20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfXyRI2rMlS0RJs
 +kWZLN4RhBLmh9VNebc/H8th/AJ+pLKD+lbAiGe9bhB49UgzREkPdOgZYm/d1cNxIQlwwthYC8D
 ln3xeJwfuuGhzlVkb2pmzhLF83MymV8=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb2dde cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=X9k_jdDNchH65YliorYA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMiBTYWx0ZWRfX5OEigYDuDshH
 os+ju7s3vAM7cOdJemO8CpvoV6QFdmzecXardcOqMSOPoCshwP8TTNTE7PIqlgEGLyyC6EFWoMD
 /n+rPjalEsTfs6yghEoAtEDAIXPRLofF1ZWeE1PdEfJUtJMe8NMmiVbw6Xb5J0dlYO+Cz+t/roj
 tOSjhENAs21r3XNqy3maRQU8/dpP9HnawrsNypsmgu9EGr6Osh73ACXfP6h5ckYiOLO5Gjpr9bJ
 eC7DbG6j6xbyucLPCtmuOUsDp68kPRKHkJWQHW8A/V9BesPv+YeH0I/+yu/lUzRYfgpvsRb0fmY
 pzhinltevS+UI88OzM7nQ47z7rqMjieh4p+lHnJqcATFMzP/wiUw9XG2h/yGz0UhBbevi5Dh+mA
 7Wu+aYcgORLiEHDqstviL7IV4Id4KaXlN+PSkwPWQrlheo1BVNg4l7DkxyDpG8hrmOJBv4m1S5H
 4jBTgziU0Gdn5ktG58g==
X-Proofpoint-GUID: ZDweZr3cfnenlIhqajq0Hke6m2hw0YJo
X-Proofpoint-ORIG-GUID: ZDweZr3cfnenlIhqajq0Hke6m2hw0YJo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290012

Document the platform device that carries the RISC-V RPMI TEE
service group over a single SBI MPXY mailbox channel.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 .../bindings/firmware/riscv,rpmi-tee.yaml          | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml b/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml
new file mode 100644
index 000000000000..32287f27a625
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/riscv,rpmi-tee.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V RPMI TEE service group transport
+
+maintainers:
+  - Amirreza Zarrabi <amrzar@gmail.com>
+
+description: |
+  The RISC-V Platform Management Interface TEE service group is carried over
+  an SBI MPXY RPMI mailbox channel. The transport discovers TEE services and
+  creates child devices for their endpoint and UUID pairs.
+
+properties:
+  compatible:
+    const: riscv,rpmi-tee
+
+  mboxes:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+
+additionalProperties: false
+
+examples:
+  - |
+    rpmi-tee {
+        compatible = "riscv,rpmi-tee";
+        mboxes = <&mpxy_mbox 0x3000 0x0>;
+    };

-- 
2.34.1

