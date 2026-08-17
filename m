Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60069437132
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786973392; cv=none; b=AjPzkW06cy54jOh8MCxQQAM2zl/6d/ls/Te5Qzm6r/MrdIRRpqtVrXI8gEQks5AJu950YS9X2tuSsXcoigaqg95OqLd55e7uWzCDBEEJJaU9VSZ/DQxWNS240Y/B+H9UqL4OrSsdkntHbaYgFWXRijl425U6MzltL2o37Sr9s8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786973392; c=relaxed/simple;
	bh=nBBJxaSjcpdjf56hNk0p6EO7Ig/OGzh0h1GGRN6VOp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E1UJeqfHdns0zX0W+4UHdTEKH+50tzIm/QhktVeqoI+gTCQd2GZzDMJFH2eQFyyzbGTb6ghobMfRuCm+pK3N2em9WU9skxs1kHIVEoCsAbzBzjcU04UeJUczqsds+VF+CU62AkX8OIVjZk5JkY+3EhqMXzcCJjeI3n4u4+CZVLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ird2oVAv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ird2oVAv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD61C61994532
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8uxTWr+dDFUGyscu8hUdXuXa1oHDUs3cROXtER0IOR0=; b=Ird2oVAvwzEZQQjr
	+Wor42M2nggctW3Qm5nTeH4ettzIN0zKd+nqNHkzleyL0G/J8jvvk7CaWld/eOvb
	wIN2ZF3ZLmGfiPA5K/R8LVNxsQyJHyQurNosXYU84L8fzlkVD/utDfWhW/HZ5C2r
	Igx6LKQ6JXsLJ+l3DqfKHUUFXwFObVTo5s2nCzo3YDhJ4voM9JwDJ1DUpbz2OYoV
	aF0IOHGf/vMKnYa6bXnJMUkAPxxMXGWHrmGIXgnpK1t/mC/Lo9vKf+L+ejYZSoP5
	JXVcRdW/Ek8bv/zyvRYRWVVO2ds1wHV7ndijXzRHXVBBQYTYYeryNFKYflgQXVj/
	2rMNew==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xb1h793-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67HDTlsk000808;
	Mon, 17 Aug 2026 13:29:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4g2h6jamdj-1
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:47 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67HDTl2l000796
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:29:47 GMT
Received: from hu-ffaruque-hyd.qualcomm.com (hu-ffaruque-hyd.qualcomm.com [10.147.245.31])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 67HDTkmR000795;
	Mon, 17 Aug 2026 13:29:47 +0000 (GMT)
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 18:59:41 +0530
Subject: [PATCH 1/4] dt-bindings: power: reset: add PSCRR NVMEM recorder
 binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260817-pscrr-provider-v1-1-88a318c13d41@oss.qualcomm.com>
References: <20260817-pscrr-provider-v1-0-88a318c13d41@oss.qualcomm.com>
In-Reply-To: <20260817-pscrr-provider-v1-0-88a318c13d41@oss.qualcomm.com>
To: kernel@oss.qualcomm.com
Cc: avaneesh.dwivedi@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=Ua9hjqSN c=1 sm=1 tr=0 ts=6a830cce cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=NqF8ssCafXS4OwuzjXwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 2SqcLZZRsupV6dFHPv5BTReery46wziP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMyBTYWx0ZWRfX8tWt4QFqIcRi
 TqqH57QhuCwAZmyDQz7YRqsM+naNVx+aa3BASVLbd8CF+lUnhP3X5uT+SmMBYYyW3xSM5aFVsZP
 QWY+VOm9iel/gpsrPrzX/c3m+UREPGWedi2BLsvhSniDu4YMILHr3lnOaxmw8ln5PvpcPH9G54T
 gSzbOlUFg0oNdpVvHcVdp7F2lT1P19hqoxgp/0a2ItzynXgpb0wB+MnFGve1c78LWTgfYJUTZsZ
 /kpHUhBTMOFUcjLYVvsJ68JuI/blZUy1CXQwooqgx3rrMxBJ92tqqsfnoAelMwMdoUALzqgOEs8
 qkSdWDe2fh2nKwJ4hCgZqJyJn1ofdjmN2c6aIdb7W8aEz2GbjaiG+zBefiCf9TQ8iD6QOoDN7pn
 PBIg37mRpo7EEOqHj3yuNnlTqYhyNDTnkLvmrV6N5FP7befTAzqKLw2wPcxA7j0cfRizF/9cvjj
 ZTcxotLVGjZkyp6h8gg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMyBTYWx0ZWRfX7qvEzjRpjbUV
 Gs0umFenEsOfqZxj6RB/cOCfNvCIpk1b3AR9exnYOIPukSsCju07ivPx8bbtK/Z1cnPGW+pCqiY
 Aw4KBkeDji9hpswcIFzLz+XVsMWvirM=
X-Proofpoint-ORIG-GUID: 2SqcLZZRsupV6dFHPv5BTReery46wziP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170103

Add binding for the PSCRR NVMEM recorder. Records the power state
change reason into a small NVMEM cell — such as a PMIC SDAM byte or
RTC scratch register — so the cause survives a power cycle and can be
read back on the next boot.

Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
---
 .../bindings/power/reset/pscrr-nvmem.yaml          | 62 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/pscrr-nvmem.yaml b/Documentation/devicetree/bindings/power/reset/pscrr-nvmem.yaml
new file mode 100644
index 000000000000..a9c7b97f1251
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/pscrr-nvmem.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/reset/pscrr-nvmem.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVMEM Power State Change Reason recorder
+
+maintainers:
+  - Faruque Ansari <faruque.ansari@oss.qualcomm.com>
+  - Oleksij Rempel <o.rempel@pengutronix.de>
+
+description:
+  An NVMEM-backed recorder for Power State Change Reasons (PSCRR). Persists
+  the reboot or shutdown cause into a small NVMEM cell — such as an RTC
+  scratch register, a PMIC SDAM (Scratch Data Access Memory) byte, or an
+  EEPROM — so the reason survives a power cycle and can be read back on the
+  next boot. The cell is referenced via the standard nvmem-cells consumer
+  binding.
+
+allOf:
+  - $ref: /schemas/nvmem/nvmem-consumer.yaml#
+
+properties:
+  compatible:
+    const: pscrr-nvmem
+
+  nvmem-cells:
+    maxItems: 1
+
+  nvmem-cell-names:
+    items:
+      - const: pscr
+
+required:
+  - compatible
+  - nvmem-cells
+  - nvmem-cell-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    /* SDAM NVMEM provider node (pmm8654au_0 PMIC, abbreviated) */
+    nvram@7100 {
+        compatible = "qcom,spmi-sdam";
+        reg = <0x7100>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0 0x7100 0x100>;
+
+        reboot_reason_persist: reboot-reason-persist@49 {
+            reg = <0x49 0x1>;
+        };
+    };
+
+    pscr-reason {
+        compatible = "pscrr-nvmem";
+        nvmem-cells = <&reboot_reason_persist>;
+        nvmem-cell-names = "pscr";
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 19b9f6605d98..f329cd9d0491 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21693,6 +21693,7 @@ R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-pm@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-kernel-pscrr
+F:	Documentation/devicetree/bindings/power/reset/pscrr-nvmem.yaml
 F:	drivers/power/reset/pscrr/
 F:	include/linux/pscrr.h
 F:	tools/testing/selftests/pscrr/

-- 
2.34.1

