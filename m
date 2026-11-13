Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538258;
	b=bj74jkyKF9eQfE+gilO+OgFwKwjfMlUri/QMkGpCWsdBiTLeKkZzUzvse0SqQBMyzvoi
	 6F1MMHiiwgQBDFlB8uk/cWbKzITHwV6nV9s559itf8TugHzapICHoxA3j7VwtCo7jKmDn
	 rHLR/g+NZekKqGW0jBpD1EXSc299OvUEpWyiHzGWp6xv5nGFWHiP0ZoG1ScwvNw/vy8Nr
	 YbX7fzXG9JYZZbpcA1SqA8p1DKyk2OYk8wRJTJwqVBtY1HctI9FjGBxa74BzmP0ZX63PO
	 tKKhnOexrUBGfsXqn5WjbtzSwvWsosb6GL81hAYcVcg6hhkQvbTflaqIqxZJA69CZNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538258;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oBgWiaCi0fzQS502OT2D0URImQ4nFQKRNhBeKYKa+JM=;
	b=IxYEQNrJbdlAEexmwkKIrdnDUo7pQlDhzpKwBrowaNIWc0FGsaE2Yj89kypDKmpwNkDV
	 uB7zDAHalejK69O+HXUfG74CjEjPTZmHcZ5dLCf1N/twvT1apGW8zHT95oqN1U8LY4soV
	 8EsiaGHCqgdY6QywGuOMhgplQv9m19Ze7gYtxSC2d2l89OLh5vi8ioNZZpYvRnsA8llyD
	 ZA43DjHMVacxAhM3Fu4zGNjzztOb67D6ndgvhXSY2l1Q3QE5Nd+MQ60QB4twJiYdD7Dnn
	 rkG+CQJPhdES4jsY5VTo8LumG8tfXGP7qajupaBFDNjqZTGK9EbUWk5CqZGPHlT0kUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2GbD23L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hCLlcQzr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9702A606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9702A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2GbD23L;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hCLlcQzr
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K5Xh3273763
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=oBgWiaCi0fz
	QS502OT2D0URImQ4nFQKRNhBeKYKa+JM=; b=D2GbD23L8kuW9rDFhdmY6C/3R1I
	e8aZ+Gyonc2ygJEWPdRB6KScNyy93pAmcX2YwE35ekmOyH2Tt2AEWjYl2hr6gNxh
	5aD+/s6frBYNipoDUwD6cuGh5WoavferU5XXkaTJ5KdCcnkO7WfZVVgiTdXb7QIt
	g/1AGtyR21PKjb4GrKg+ndXqV4FmHm2n0QxQ8byQRnMZhuep4wAum2lv07oCbzIr
	lhjn/85PG8rVGMfcQpHItxiEQSEJGmvzhbDKVxQY0KWCU5GDrzWUokMEajU0Opbg
	PMgplyZW00rJJlQwwGqTw9Dw/BEKoIBzcDAbfGreK3PlkxLizm5NCG5oj5g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufgd75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:50:56 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ee04c49451so8012125ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 18:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538256; x=1795143056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBgWiaCi0fzQS502OT2D0URImQ4nFQKRNhBeKYKa+JM=;
        b=hCLlcQzrNWCYdDnFY2QgnC6rW/UzN2P+mQpB/yQ8MPBWnncQsV482q7EBx8eSyAwCr
         +Yrf3iIb16Cfdw6hr1M9GCmPHLOBjUFbhwvvRzzRW2bx+DGEtfK8fz/ShnNMbIhA9ufA
         eZ8sXweRCU9Be5EykeAzQF4zCR7pmnvYkCS8jILUGdrRoGVTmaUPKmRjlg/zX2RZoraK
         HpE14ftoM65Y1U/BVdJTI+uV5FRoQwnZ14PcTglmEo5rXipTzhvIckpicsYWmxa2+gu0
         6XICAD3Sp/fo4CSS+f6eid7b0OGjCo06ZrTFAzLCZIyE1QY6OkOpX0VkdLzBIi13x66y
         R3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538256; x=1795143056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oBgWiaCi0fzQS502OT2D0URImQ4nFQKRNhBeKYKa+JM=;
        b=TNL8/6rJoBbigaaGZKqG+txiYwlMqKRZzKVZNyadzuPVtUQnQ69aw1milfcjLNFDPz
         O7sDO6ln2+vMF0MMf/Nz6pok0MAsP2yMLUx8PbUuRwKfzbj2+YYa3827gxo9YWudt11H
         pmKuTpeBCTBdt6oZKhs7xBkiGUtahQyLqsFG8HQVk0T94W2jwNY5KEA/QDdMNyFyyMnF
         XwWFd1HIYNaVIRFQXrY34r3tawGFxPnX6CJ/K+MnviGrvUfaVCLsxmBXZKGzPgmKcPEH
         2iXkgJZ9zu6YaGb+MBXCieg3vqVz6jNZafYDqC4kdv2hL7W2aCVlirQu7WjC8APW4dR+
         nWDg==
X-Forwarded-Encrypted: i=1; AL+hErFqlaazgifHeOyBmLtD5E4K/Nzpb4YqNVrnE3IcmTDHOsOCPm2lN77fV5yD5kGuPulmwXfAWK3BzpLZo+iL@vger.kernel.org
X-Gm-Message-State: APuU4Z9mMHLmD20aYvraSG7OQZ8sEqQs0FjObi0U3JJO3MeTugpkjyoe
	wzEBc+4cmju9nQKKIk5c48UdiEzxBtX9WpmKQFM84GmiAQDxeVBOnKCTeSWB+PPVQaffTtVZvUs
	NnFrg2fktKDL8+2fFF3E8TtTZblxqxq+8akkU13snpOI1d7Paomi9SItX4rnAuGY5HGVz
X-Gm-Gg: AYBFou28k6tn3l1ikJGGD1HGSK7D0l0o3Ug5SEIV6+Id9/+ZKm7FMFsWmxf3vaP/kPY
	VNvsPEG2VmpduXpFOYRq0zR2YVsgDpfW0ewSwT0fEvPXi1IOH+XxUg1Y4VcQLnD7ATMC4OgiENH
	rQfjjt1Hbr9U73snHeyS84GxAApvpRJsN2Uzlnmr9xGmZsS+NVsDoLGcy1FalqS0ky6Lob2tCVI
	8EEjSBtXNiAHF51e8V2se2mlHfyNQJKyDq2b3nWqPavIWEws50bmJOhqa/STPGue7Hlcztc4oBg
	npa8+WaOYwzJCA54rgbZYk3ohFiKDQqagfSnBGTGkconeyAsq0uW3ab/ffm32PTOEtszQ5fBgaw
	7b3lyIJ4jvzE3yPKQ1uP2vM+q2hywgdclCJmTFiXXv+aOV0MuFRIr9MqMI+0yjRKaH2GUtAEi7E
	Sv40lpJSI=
X-Received: by 2002:a17:902:e54b:b0:2e8:5202:aa8c with SMTP id d9443c01a7336-2ee0dca8548mr12333235ad.48.1794538256024;
        Thu, 12 Nov 2026 18:50:56 -0800 (PST)
X-Received: by 2002:a17:902:e54b:b0:2e8:5202:aa8c with SMTP id d9443c01a7336-2ee0dca8548mr12332905ad.48.1794538255455;
        Thu, 12 Nov 2026 18:50:55 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:50:54 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v17 03/10] qcom-tgu: Add TGU driver
Date: Fri, 13 Nov 2026 10:49:28 +0800
Message-Id: <20261113024935.3173715-4-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
References: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-GUID: sznU24S-8W2_sVfYDA3SVOjGc9xXAmVv
X-Proofpoint-ORIG-GUID: sznU24S-8W2_sVfYDA3SVOjGc9xXAmVv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfXxOVwU9KMfUkY
 UWrO5PZ20mtNELsKegxI3IWBDMhkMrkIJrdJ87tyuyImTI3oRk806/XL728tb4owaPXzpJVLSLk
 sToW3vyVJeaVIuN4oj+Gc9Y/jdXfNKF43pfoXeyll5PNGJMQxpUtYo9LRRQIip1EJP5WCfFugeT
 pEWrYajJa/+qEEs5G1NXd4qkfngdy23mlkjNvbPBz2uEJYZBzqM7y/HOgDjiDHhVxtVUANsabZD
 6LHF2DhOcMIZZmi7xNTKibNmCK1ZEqlWpxrqdUaz55RByg6hXlx9iXdRm7b5jUHeY5DpvdyNoEa
 eWONxEBxDHPvLDUsziqCbDoPGgUDhH6OdqEzLCSl61v2XQFhZ5tWqHGmGzNDJ+/jO9v6k64MqJu
 hliOGOBc/RjkzzcnPFsJothK4A6YAskeneQnaLXblaeLApnvGMoq2+13ptyQQ5nUwn+YM09eW0U
 f0ZZgjnifeBIzNKdLTw==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af67b10 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=ihhBPCL7kiVGXwQKODUA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX7N58JwX2h3CH
 QbeZCRrrhiH6y+H2LdBDctaamAYVuGXJxECLtVLxdfnIZi2+hbGVQSTdhjcfcIm3EpIkZhK3SaH
 9U2AG39DiQuyN3ONS6a5Z9wv2fy9wAE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010

Add driver to support device TGU (Trigger Generation Unit).
TGU is a Data Engine which can be utilized to sense a plurality of
signals and create a trigger into the CTI or generate interrupts to
processors. Add probe/enable/disable functions for tgu.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   9 +
 MAINTAINERS                                   |  11 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/qcom/Kconfig                |  20 ++
 drivers/hwtracing/qcom/Makefile               |   3 +
 drivers/hwtracing/qcom/tgu.c                  | 193 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  31 +++
 8 files changed, 270 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
new file mode 100644
index 000000000000..66b12ffc2892
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/amba/devices/<tgu-name>/enable_tgu
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the enable/disable status of TGU
+		Accepts only one of the 2 values -  0 or 1.
+		0 : disable TGU.
+		1 : enable TGU.
diff --git a/MAINTAINERS b/MAINTAINERS
index fe23913b1e43..faf8706b6584 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23264,6 +23264,17 @@ S:	Maintained
 F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
+QUALCOMM HARDWARETRACING DRIVER
+M:	Songwei Chai <songwei.chai@oss.qualcomm.com>
+M:	Jie Gan <jie.gan@oss.qualcomm.com>
+M:	Suzuki K Poulose <suzuki.poulose@arm.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git
+F:	Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+F:	Documentation/devicetree/bindings/arm/qcom,tgu.yaml
+F:	drivers/hwtracing/qcom/
+
 QUALCOMM TRUST ZONE MEMORY ALLOCATOR
 M:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
diff --git a/drivers/Makefile b/drivers/Makefile
index 0841ea851847..f37edcf34e0d 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -176,6 +176,7 @@ obj-$(CONFIG_RAS)		+= ras/
 obj-$(CONFIG_USB4)		+= thunderbolt/
 obj-$(CONFIG_CORESIGHT)		+= hwtracing/coresight/
 obj-y				+= hwtracing/intel_th/
+obj-$(CONFIG_QCOM_TGU)		+= hwtracing/qcom/
 obj-$(CONFIG_STM)		+= hwtracing/stm/
 obj-$(CONFIG_HISI_PTT)		+= hwtracing/ptt/
 obj-y				+= android/
diff --git a/drivers/hwtracing/Kconfig b/drivers/hwtracing/Kconfig
index 911ee977103c..8a640218eed8 100644
--- a/drivers/hwtracing/Kconfig
+++ b/drivers/hwtracing/Kconfig
@@ -7,4 +7,6 @@ source "drivers/hwtracing/intel_th/Kconfig"
 
 source "drivers/hwtracing/ptt/Kconfig"
 
+source "drivers/hwtracing/qcom/Kconfig"
+
 endmenu
diff --git a/drivers/hwtracing/qcom/Kconfig b/drivers/hwtracing/qcom/Kconfig
new file mode 100644
index 000000000000..5c94c75ffa39
--- /dev/null
+++ b/drivers/hwtracing/qcom/Kconfig
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# QCOM specific hwtracing drivers
+#
+menu "Qualcomm specific hwtracing drivers"
+
+config QCOM_TGU
+	tristate "QCOM Trigger Generation Unit driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on ARM_AMBA
+	help
+	  This driver provides support for Trigger Generation Unit that is
+	  used to detect patterns or sequences on a given set of signals.
+	  TGU is used to monitor a particular bus within a given region to
+	  detect illegal transaction sequences or slave responses. It is also
+	  used to monitor a data stream to detect protocol violations and to
+	  provide a trigger point for centering data around a specific event
+	  within the trace data buffer.
+
+endmenu
diff --git a/drivers/hwtracing/qcom/Makefile b/drivers/hwtracing/qcom/Makefile
new file mode 100644
index 000000000000..5a0a868c1ea0
--- /dev/null
+++ b/drivers/hwtracing/qcom/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_QCOM_TGU) += tgu.o
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
new file mode 100644
index 000000000000..ac1ae8bb0ec4
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/amba/bus.h>
+#include <linux/coresight.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
+
+#include "tgu.h"
+
+static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
+{
+	CS_UNLOCK(drvdata->base);
+	/* Enable TGU to program the triggers */
+	writel(1, drvdata->base + TGU_CONTROL);
+	CS_LOCK(drvdata->base);
+}
+
+static void tgu_enable(struct tgu_drvdata *drvdata)
+{
+	tgu_write_all_hw_regs(drvdata);
+	drvdata->enabled = true;
+}
+
+static void tgu_disable(struct tgu_drvdata *drvdata)
+{
+	CS_UNLOCK(drvdata->base);
+	writel(0, drvdata->base + TGU_CONTROL);
+	CS_LOCK(drvdata->base);
+
+	drvdata->enabled = false;
+}
+
+static ssize_t enable_tgu_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	bool enabled;
+
+	scoped_guard(mutex, &drvdata->lock)
+		enabled = drvdata->enabled;
+
+	return sysfs_emit(buf, "%d\n", enabled);
+}
+
+/* enable_tgu_store - Enable or disable the Trigger Generation Unit (TGU). */
+static ssize_t enable_tgu_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	unsigned long val;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret || val > 1)
+		return -EINVAL;
+
+	/*
+	 * Hold the mutex across the whole check-and-act sequence: the check of
+	 * drvdata->enabled, the PM runtime reference counting and the state
+	 * update must be atomic, otherwise concurrent writers could each
+	 * imbalance the PM runtime usage counter.
+	 */
+	guard(mutex)(&drvdata->lock);
+
+	if (val) {
+		if (drvdata->enabled)
+			return -EBUSY;
+
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			return ret;
+
+		tgu_enable(drvdata);
+	} else {
+		if (!drvdata->enabled)
+			return -EINVAL;
+
+		tgu_disable(drvdata);
+		pm_runtime_put(dev);
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RW(enable_tgu);
+
+static struct attribute *tgu_common_attrs[] = {
+	&dev_attr_enable_tgu.attr,
+	NULL,
+};
+
+static const struct attribute_group tgu_common_grp = {
+	.attrs = tgu_common_attrs,
+};
+
+static const struct attribute_group *tgu_attr_groups[] = {
+	&tgu_common_grp,
+	NULL,
+};
+
+static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct tgu_drvdata *drvdata;
+	int ret;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	drvdata->dev = &adev->dev;
+	dev_set_drvdata(dev, drvdata);
+
+	drvdata->base = devm_ioremap_resource(dev, &adev->res);
+	if (IS_ERR(drvdata->base))
+		return PTR_ERR(drvdata->base);
+
+	ret = devm_mutex_init(dev, &drvdata->lock);
+	if (ret)
+		return ret;
+
+	drvdata->enabled = false;
+
+	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
+	if (ret) {
+		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
+		return ret;
+	}
+
+	pm_runtime_put(&adev->dev);
+
+	return 0;
+}
+
+static void tgu_remove(struct amba_device *adev)
+{
+	struct device *dev = &adev->dev;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+
+	sysfs_remove_groups(&dev->kobj, tgu_attr_groups);
+
+	/*
+	 * If the device is still enabled through sysfs, disable the hardware
+	 * and drop the PM runtime reference taken in enable_tgu_store() so the
+	 * usage counter stays balanced. Use the synchronous put: the driver core
+	 * disables runtime PM right after ->remove() returns, and the barrier in
+	 * pm_runtime_disable() would cancel a still-queued async idle/suspend,
+	 * leaving the runtime-PM state inconsistent.
+	 */
+	scoped_guard(mutex, &drvdata->lock) {
+		if (drvdata->enabled) {
+			tgu_disable(drvdata);
+			pm_runtime_put_sync(dev);
+		}
+	}
+}
+
+static const struct amba_id tgu_ids[] = {
+	{
+		.id = 0x000f0e00,
+		.mask = 0x000fffff,
+	},
+	{ 0, 0, NULL },
+};
+
+MODULE_DEVICE_TABLE(amba, tgu_ids);
+
+static struct amba_driver tgu_driver = {
+	.drv = {
+		.name = "qcom-tgu",
+		.suppress_bind_attrs = true,
+	},
+	.probe = tgu_probe,
+	.remove = tgu_remove,
+	.id_table = tgu_ids,
+};
+
+module_amba_driver(tgu_driver);
+
+MODULE_AUTHOR("Songwei Chai <songwei.chai@oss.qualcomm.com>");
+MODULE_AUTHOR("Jinlong Mao <jinlong.mao@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Qualcomm Trigger Generation Unit driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
new file mode 100644
index 000000000000..c6426b4e3617
--- /dev/null
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _QCOM_TGU_H
+#define _QCOM_TGU_H
+
+/* Register addresses */
+#define TGU_CONTROL		0x0000
+
+/**
+ * struct tgu_drvdata - Data structure for a TGU (Trigger Generation Unit)
+ * @base: Memory-mapped base address of the TGU device
+ * @dev: Pointer to the associated device structure
+ * @lock: Mutex serialising enable/disable and the associated PM runtime
+ *        reference counting against concurrent sysfs access
+ * @enabled: Flag indicating whether the TGU device is enabled
+ *
+ * This structure defines the data associated with a TGU device,
+ * including its base address, device pointer, the lock serialising
+ * enable/disable, and the enable status.
+ */
+struct tgu_drvdata {
+	void __iomem *base;
+	struct device *dev;
+	struct mutex lock;
+	bool enabled;
+};
+
+#endif
-- 
2.34.1

