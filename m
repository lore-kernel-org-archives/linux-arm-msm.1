Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AE83AA4E4
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 03:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430131; cv=none; b=RgNWUDAT01fld2mB8bI3Fw0AnWqtyPdRFUc8sYJThMMSF5oGS6LaNLiQIeWaT3bqGqEZZTGxzNFYaW5hw66uz45CJjOHuFLwgOAZXRYmt0mDP5xX5rs0LThgkJLEjoeDif103qmK1zZoU5XShKNPr+iOMn4yvlB6peCXw84e0s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430131; c=relaxed/simple;
	bh=KK656IR0L/qDoa9cvBPbElzGR6ihtiMSgVhGCtT9uo4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jcTkJ6F6vXJX6DPM4atyXTmfUrBeqTVGes10fbYS/CdBN5Gm1wpVWgFo9DRNHgqeofuR1hifZhrqtDIwb0TXAiamq7Us3qpM9wexICmt+l+VzFhzPRVz1AWBvzBnD5it1BzeMeUDIoWIyHhgdJMz5lYvHw38nAmjzTOwsZJdQnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FZUPGItB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qcp1J09W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZUPGItB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qcp1J09W"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hTFI1824411
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 03:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZMbjzTGadlfykU/nTDUxL8dMYc8O8fFEzaAJY3fPRwI=; b=FZUPGItBETjdAzRL
	B5pYQ0wdEFStWX658zzZwawaBvk8UQqPRLzn1gdXOjsQH+Y6RpJxIhfx+RXHVq1S
	Q8ujP9tKCD29Y8tfRQ7XwoeDMimSkOxCFvbWDg+KXralawm13fxaeCxcNNHSw9k7
	/Z6LCq8fKQ8j4lFpSIuWBiqS5YkX4KH1bgvPDfB/R46dF5oyICNfUwFv4LT9s00U
	SWpcuQ4WJGRkkvp3Jsg/GXA+7qoYWD7sHuz1GCHfSvmoJQddbQ2XejRgc9d+cBQJ
	HtCHi+RpC1dlf1QcSwoy0HvQQpIs4xnDcqfa2HiooqNTqSNY1JAe4CJ9rBBFrEeY
	yTWnog==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe80vd7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 03:28:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34ef0362d95so8988436eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 20:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430127; x=1792034927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMbjzTGadlfykU/nTDUxL8dMYc8O8fFEzaAJY3fPRwI=;
        b=Qcp1J09WjIdIYKS57UpRFLNradcofhfk9rsxIWyG8OBqyRhS3bBRSF1TV43LUoSdb4
         xjR8rwMpPAjOjNTlxNXtR1V52ntaeCbj/AsvxqLW8nVezb0TJSV6DbjXJ0BAMjF/KLsB
         au+pUrojN3uVPZvAUDCDx/RVc0Ys1DShykjnHEAoD7BM4fQBbOVICwt6WYl2YfWDQhuS
         KA+t+9+i7M4sAXpdfBZyfA5crO0plXewsHoOh+bqf8Qk9E8Ki42zHeDYwQomPHawxr8P
         Ih7J1nrY5Nrg6VGuxnTbsMiJKAXbna+7zwQg1amxIEb7ESke6WWXDE9AIf68+v7aD97b
         Kz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430127; x=1792034927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZMbjzTGadlfykU/nTDUxL8dMYc8O8fFEzaAJY3fPRwI=;
        b=byBwC8Pn08ss07vwikPqsS0PCNuWI+/qAgPxUMzzuAImvWdBd/Ud9xpIMDN6tHKhzE
         wUywlWwqmD/pOWIrGbbNqK7w02En/4vyWPtJQw89L8luKWYm5kbCtEHunNg1razVG7So
         SqSkB1J3lX6hrdOPdJ0BNQk1vIH2kpPGT14sZPPvFFMpF7wRxK/gqJKULtEg6KfiCXmC
         1ZnE5+Gb3Lv0sw7HjxgytzvvAg9TA064G+9Ga1QUQvArzbDQbW5WTWjKt4RineuqENCi
         IB6PZzqblt8h7hqrTYRp2uyCeRY3dZ41Mw+tCmGNffkTRAI3vvljVhWqtFjiHqjr9EUw
         vVHA==
X-Gm-Message-State: AFq9FYKiOWs4c5xV+idBICYYG2eUaikuFNDqpGlCZEN39zEVm+lF9/2z
	qmCJLImPHskiHgv55fH84NR/KsveKvZTJ/1vfaCRp7nuNZ57Yclo/f1tanwjghpQ13aJoGl8UTO
	w/TKAeh9vTqnYZLVU+pFyXy90PznRZFD6PTz/+RpxyUdjP1UBij3JlKHlks5dSQZr8SI=
X-Gm-Gg: AYBFou33unqbYQCuGGbK+lzVJhX+XEtZx5d0axBgjMYE8+SYaz82tJt9C6Fc28W7NBJ
	k9noDH7D8vBE8RC2ejPYJJAWDsneuRSknnvjxpluE+T65mZcyJm5C/7Ko1HRjQEr5V5UuYNlXje
	elMYtWIczwFGKFmbNxDZizJDyRzmL4j13E22IwimlufBMJ75aZJnE2NPfDBwhs8+zIivwABqoyi
	cN/7NkpKVOS0Z8clSzPokUIVDxJMNZoOJQ+771CCgOn1JB+SElK82Mg/bEx56vu61HsKFRf6+fH
	b4tl9yJdJkYaf7zQJ+qxIFMpmAyAjTHQFf0p3Kedu08RVQsdKbAoukDNLKmNAX0Uo28QB7+VG5H
	IxiNdNE8WuHORdL5bFqvAajdU0/wAjTxbmcUn87g3XvfVj7mNAhVxAI67ag==
X-Received: by 2002:a05:693c:894d:20b0:34c:3ae5:c280 with SMTP id 5a478bee46e88-3515dd030edmr4864978eec.10.1791430127158;
        Wed, 07 Oct 2026 20:28:47 -0700 (PDT)
X-Received: by 2002:a05:693c:894d:20b0:34c:3ae5:c280 with SMTP id 5a478bee46e88-3515dd030edmr4864931eec.10.1791430126393;
        Wed, 07 Oct 2026 20:28:46 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:45 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 20:27:10 -0700
Subject: [PATCH RFC v2 04/10] dt-bindings: firmware: add RISC-V RPMI TEE
 transport
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-4-45939a13d223@oss.qualcomm.com>
References: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
In-Reply-To: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX4BezeTbAJs8O
 aLKdqBDXLqNuxivZHE9GFWaG6cNfk29+O9piR79mXqUJZZ4VCi3sla0JY/QRNFHe4ZOYtf9CF6o
 XaWrGgYC4vIoz4O8jTNPn6Tc9Q3QmvZx5KCUHvWzHWBNwltj6GPMDF9tLn/Tk4M/EjfjQ12k5hj
 5Osi69YuvjHs827sUyyEPji4FwQWK82hq7kQamFHnatHsaf5QR1UJTiqHjDy3jnKUofsfy0rK3j
 7EQ2cfuq2Qoes+mAnUO4Qxk//FUAgs0i6HvAz6DJm1FkGxy02Vme7Ycw7q4bULcRa/EQjgSQOyk
 iyDZjFAXNRcASufPe8sKzfqkqT/7ZowOCQL72LhBBTuwnVocULQdCGPHmRTBsVYGEbkMVHokcTg
 IScIFa6BL1RwlRULDf8NmETDJnsJ2d6WcwKMc9qm/OzkKt523HTqsxORNtTziVCm5QkpHQoRXaT
 ed21WTVeVxMFkOm+DDQ==
X-Proofpoint-GUID: SazmJGWTfRKDasWXun7SjobhyXNAYxQJ
X-Proofpoint-ORIG-GUID: SazmJGWTfRKDasWXun7SjobhyXNAYxQJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX+4leZN8Sm6zY
 KsTqsPD8G/GNrt5VZjKv2DSUzXNn1L7gmHATU7Aa4DMI1mgB9/Hqy02wLMX3hEJ75y88rwPsbC+
 HU1tujlQi5umuZTeLQqHXZNYR4cmgzg=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac70df0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=X9k_jdDNchH65YliorYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013

Add a binding for the RPMI TEE service group carried over an SBI MPXY
mailbox channel. The transport uses this channel to discover TEE
endpoints and their services.

Require a single mailbox reference. Notification interrupt information
is obtained from firmware through TEE_PROBE_FEATURES rather than an
interrupt property in the TEE transport node.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 .../bindings/firmware/riscv,rpmi-tee.yaml          | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml b/Documentation/devicetree/bindings/firmware/riscv,rpmi-tee.yaml
new file mode 100644
index 000000000000..b7bbe8893e56
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
+  - Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
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

