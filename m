Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188086;
	b=Qm97/u2J+FhzMys6Fnm0cFzrCODRLQEwDaZSerQeTz7hiZ1EWwKA/xp2KRlLHzftOP3f
	 +5fh1acLUfT+FZXNQJ0WCdwc25qQQxG1arnQfxKnfFZpnC9YW/rjgMoDrxIICxFKQwtYC
	 FJRkeUPu0SgrXXKa5qKatFa3kxCKaUcuG8v9y1sm703Mbat31iFSoyQ/QgpxThFzlNvkh
	 MAow2vFD9iqyQvhH66Gsn8slcxtFfNikoJ0kX3LCvzpQgj2Uju0L2XK3kSGwUmF5VfKRs
	 gFyUvgA772SYkRbjTv45xd/IcNZ5Yys7T2VziodkBf+eTEvTgjGG1+4CWr7AkQKqpHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=;
	b=k9knRAIx5RlNuy/0mn6HI/exBw5sMfL7kRg4CRpy05d+Pe5iSVsXJ1SUNqfHE3FtkNfR
	 JBwkAQOfEIoE/bUbO1e8dFWXUHTI2tgBQQKwmZwFxJIAzolHkIFSeTP8pCJZCRY2Vpw3z
	 TGfwVhhUH2uh2A0agvzXjWreEy6AXMjtxgoybKMLHK+lg4HMPWbA3UeurtKUWDnGC/CMz
	 gHEXjqxiuMjL9sdtAlqENnUzR/+xAFZCN1nc3czGxNpgmiykaXDvYQklMq+aX1UCHdvUt
	 VMyoj1/ojpnX48AG/YlG8oI/wAJoSdpYhgCZiFpSX79jvfDiCC5h1mmstnv3e0jxTcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G9EIYHDe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TWG11hyQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFDA606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EFDA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G9EIYHDe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TWG11hyQ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeYVO693388
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=; b=G9EIYHDewyZC9pXP
	3ju6CGwJZw7Ujww1sHYT+7aynqaUpNLbRZGPsv8Tvphc+FWzrHLfL2hTrN2KckI3
	Oszeg5JA/y98c7nOsW3wXj7f6I+CFMreOCcM8TaPc/lg8vF7HO8WrzxPgdc7bve4
	AiwMrBA6PCatm4XTdvgsmU0e/NJCFU4yA9k6D+7gbtzTSPTsl3KMoIG5Z++jQC80
	Rdp/2OBbHcZvKxBmx2y74+SWfwPvAJVW6zYX7ny3q0Shr8cvTOA/8UuYPjjQ9GqW
	FHsT0qT5Atlr9KEjg0Yq0Cb4J6Zr4z83MwZIE0nZKKFplvzyBA0UsxBPXL6kdAUV
	fPOT1Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be291t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 11:48:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e93e2f72bfso14277805ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 04:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188083; x=1793792883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=;
        b=TWG11hyQqJ+dqQ/KriL4q3jDUW//QNGJx7hVk/jOcBD9DjVNKrfH6pU9ptjmTTedUj
         x8pmAIFZD5hyIZuEUVTjtALxAjqgD1OxqIWuVA12ZvBVt0AYlFWHpssOqzl9c+pNnnMy
         vAxMmQ5OA4zvbsdTEFLkCkPZl+83WxRSzegxHip2QRNWE6fBhBR2LLV2wakCjPQjilEf
         FfhhRFVcJQGEdRw8yaAtZXcqtfnCFhRWjZvw/ms3BvKOu7aUfFhfpBSsRkTh96n1frFj
         qIUS/DkcK1Bt6vjuZONpZ7ROB5s35dm0GHM0v6LrB21jx1aXTHufRY7hFEbk22S04VqE
         41dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188083; x=1793792883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=;
        b=ef0ljN5lXH5vfWfH9ogAl4VviZtFGkzh4+Pwm5E408soR6xGn98CxXCFEK8qUD6O0d
         tjjFMdpgOoTqSqjv/k8tS6b7SWmV6Q9ZRrmbsumw4eqyoGS/KBiUp2ak4HFisiWJjtiF
         hLDw0QgEypGes8zmgoZVqcwBRck5Hpg3j+bELtLhGkjXvBQWMUT466CPTIr1GE20tpoi
         HkEg5A59KdX+HpxgSqSp7j0McD+99Oz78iDDLzEYa13ID8Ls2wUwaMP2tlMrqKQpobjX
         i8xQdRMi0jYJiAcZH1VtTG6N6hQcixx2rnpNjZZxQ/MDS9BawZ4yv+fDzFkbuzodEPDC
         75Fw==
X-Forwarded-Encrypted: i=1; AKwUvBw/bDCOkXmm+Zm0XpFfKEXy8+gHsweyjPX3PVmv2frQhZLBviSs+/S14k1koco8uHc2NF3vvDO1Q/SL/s1i@vger.kernel.org
X-Gm-Message-State: AFq9FYLbeb5iTRtPkdGlNafeNdZQuuYfdUtee3h8Zn4Ss/U9t568VeWb
	5I1NVfju+/JJ/5iMthbICHjO7DEfxoojeqqu0qucY+Coigf2MHReuGjAwkcOnK7+cKxECjTb73s
	y7N99Ho7QkdJtfXQbSbLq8uBtgCqZ8F8KnzRbB6JAKvZhw+fz8pozeIUiNNsU8YeXSqyu
X-Gm-Gg: AYBFou1Zdrlcj5c2GrJtc2iiRIFeNoMZiQ+ev6gymZ4BcZXiQ1eRHoVU57eemEfigrU
	KQYgHOqX4hCSUE4bmwlkApNoSMsWa4VZwjt5uxBhUTEsmQVypKDZxomtay6u9VOPDKQVMA4z0pL
	0f/Lk9oAFPBgNs7d/z0UI5oJ3jNMlRGlfah0PWiHykLJWJQzhHJ0pk4O6B6f4B/X9EqaWYNZE6q
	pu1HY0x2GJhxUZxZP/7pb89IiN0Cs8hzbhwLqHVBY7S3khqCN6c26meKIz93W0ZZNar5lM3aNeu
	Lg9KuOucLH7frU1CgJ+vD5Z4J4eYrn7uAzTeNK2BC2P34cUadof/3svDcowDFHYV8Y2+nXugNia
	s+Mf/I5OHbcVIpOQtVr/+Uf56OdHla7a3/UjJa0g4hj1GObDGs4+hsN5AO1Gclqv3gUikdvOund
	vxqWelIL5BTxERHhB5Ren/Q8ym92rD
X-Received: by 2002:a17:902:d4d1:b0:2e9:6645:e9a6 with SMTP id d9443c01a7336-2eb005a650emr19174785ad.59.1793188083554;
        Wed, 28 Oct 2026 04:48:03 -0700 (PDT)
X-Received: by 2002:a17:902:d4d1:b0:2e9:6645:e9a6 with SMTP id d9443c01a7336-2eb005a650emr19174475ad.59.1793188082951;
        Wed, 28 Oct 2026 04:48:02 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:48:02 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:43 +0800
Subject: [PATCH v4 3/6] dt-bindings: arm: Add MPAM MSC binding
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
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-3-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188046; l=3009;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=8PN3jSMZ/mskk1bxkWM3cKZzjFP8ZqH1EBcyaOMTbg0=;
 b=QWyVLshjnniVm9WIuAHK9RFKC1Ym/nBG3lrXTz4mbtssrfXDgAXVJPOmpEbKpFuCoaLZgBk2I
 SFDmSOAvOcGBmxG5nLAbhKzjZmoTp9mAxYBABXBUI5GwlvpR6riun1H
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: hVlXorFIsuc0OrBqiEaieTFGgz42CL0f
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1e0f4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Iyi0AkbGYOnUpVGOj9oA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX/8zJn1Angxck
 OZfxkCJx3/dV61VSgQD7nfaMrkvQRTS83EySPFrApYmMMnhFhaK3WFpe7sZ+TXRYInM3+AGIVFk
 EkXFYEmTMao1CnPP3FG9GeY/TSYhJRc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX5l0pIKA0dki9
 9CrgTh1SM6oh7Mvx6+Px2/lZchY3hABNuwJqNcHRYcg7ABUwkrHf6EeAKcl+15r+KPRjbVzxYAS
 tZQMex3wEYW8fmKbimIAWgLYFUJyw7Tg3CjxDZvUJx4CcLAegVo4xy1tv9+439s4LkqUQ/wy9PI
 4/o+xqPI1PtNR9jxmSKLqitxZmynVbC+TIOcuTpPgjgt50qa0J26I6YllTJXKWliQbXKvnkGOG1
 2m4ttl8XJc16RfTPJLuBow2mh227ewLmWL8wtQAcGSs8nRBysHxp6aZhWR8FnhaT05WKVfljH++
 QerA8NZwfzZ+85yuZvp1afrXbcmagqPI8k69vflEAgf7j6qgFfs3fva61eu+hxCxJMQf4R+UxOa
 aNzEwNO7emi7GOwBEasNlP0YNA8gNjE3VINfUMwUfP2xDc0oSUDRfhkeIv8WndEu87c4t/ybamN
 4PSkVklmkw9YbWVrLMg==
X-Proofpoint-GUID: hVlXorFIsuc0OrBqiEaieTFGgz42CL0f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280046

From: Rob Herring <robh@kernel.org>

The binding is designed around the assumption that an MSC will be a
sub-block of something else such as a memory controller or cache
controller.

A key part of MPAM is we need to know about all of the MSCs in the system
before it can be enabled. This drives the need for the genericish
'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
until a h/w specific driver potentially enables the h/w.

This binding covers only the properties currently used in practice; it
can be extended as additional features are needed.

Cc: James Morse <james.morse@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li and Huang Yiwei: fix schema field order and yamllint spacing;
  fix example reg addresses; reduce to minimal binding covering only
  properties in current use, dropping RIS child nodes, memory controller
  support, arm,mpam-device, cpus and interrupt-names ]
Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
new file mode 100644
index 000000000000..523978900d3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description: |
+  The Arm MPAM specification can be found here:
+
+  https://developer.arm.com/documentation/ddi0598/latest
+
+properties:
+  compatible:
+    const: arm,mpam-msc
+
+  reg:
+    maxItems: 1
+    description: A memory region containing registers as defined in the MPAM
+      specification.
+
+  arm,not-ready-us:
+    description: The maximum time in microseconds for monitoring data to be
+      accurate after a settings change. For more information, see the
+      Not-Ready (NRDY) bit description in the MPAM specification.
+
+additionalProperties: false
+
+examples:
+  - |
+    L3: cache-controller@30000000 {
+        compatible = "foo,a-l3-cache", "cache";
+        cache-level = <3>;
+        cache-unified;
+        reg = <0x0 0x30000000 0x0 0x2000>;
+        ranges = <0x0 0x30000000 0x2000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@0 {
+            compatible = "arm,mpam-msc";
+            reg = <0x0 0x2000>;
+            arm,not-ready-us = <1>;
+            /* CPU affinity implied by parent cache node  */
+        };
+    };
+
+...

-- 
2.34.1

