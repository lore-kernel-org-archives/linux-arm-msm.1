Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900815;
	b=1q1pRWYqvZptilVF6APi1TEUX/6hhFrjD2Us8nIVIjAsDd+t2JX0wWzU8C31GeVk+vQ6
	 DBVGZzdakeY0UvA7OtAJTWbUoLat+cNg7tX6nK5Sz/ITSUq/K+qJ4m9trNqWH/FBs/ZwJ
	 ANo4oov054Tk+KHj4LMkX5Kdydvv+YyChYAe6Uv8L0rsULZto27dUoQvTiA2LHUQkIe4O
	 3i3Is4v3UhQxb0YoA6S3kSBGo9lh71HxVvU2Fj8wCgWiM7rH/gO+TIe1IeBjJ9dcl6Tje
	 5d+DS3s2tGuJCvwNPP/lWnl8szy4CbD0gtkHeEUUy3OwTzefLO72/JFQZQ6iTCY/xMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=R4AnKfy9vaOFdUcffAacVVa5fJOHRuc6CEJFDQor3xc=;
	b=lrltFi24scALU41iF3XeQ0QjcxMEF60gwNRQlHAXL3cQ9bK/iKFu3X8e4EGfYe+5PhIT
	 5ZaOPJX8AlVmn/oCHMYQg2eP6JHaKw38xw5mSU5KycaRrjAmx5EAlqDE4Bcv9weDop3T7
	 wpFUn978QxJPaxVBrmO5rnNXjCXNN3FtY5Hi/Ko1dmKwQvg2ACE0A5vxcwUdqhjQtJwzf
	 m8SOaoa/Vcxt6A44SqzZwfh0tzsDH2Nk6cqrptbQuvjwfma3unUgwUVFoZaCm4Mw03HIL
	 BLmEPiMfkYc751wrHha3LdovI3VY3rpEvO8ZGsLzUDBYcqz21rgUdFGFtxT4ZgHp4tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IGybIeSG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+pQtC7r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677BD606A89C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 677BD606A89C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IGybIeSG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+pQtC7r
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2a67Y2934224
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:33:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R4AnKfy9vaO
	FdUcffAacVVa5fJOHRuc6CEJFDQor3xc=; b=IGybIeSGuNdUDznr+bDjSfEeDYS
	n7CL/CcIqLFlQ8wLIHzcXGoI+UQXAWNlUB/7ssH7dIUTlyQsV4M9nCtqIcFwkQbi
	OYHWGBxoztG3UKDRkJPHaEU4FaUdprMCZ/HhkWoz38t+FSSaAdumglb73PNo3XOz
	9xMK/pdE8WBzfyGkpIv0WWIrtLSSGOtidXK1sAiTpBx7ea15MLMEbVLzFQb6id9f
	KKFImQmMCQzS4DvqtMXaEhRDBaVriYFfEaWOUOtrGZ5FgcS1a6Ul4D4vwVSQ6wAP
	TZs/rEJfAKMIvTDA4GI50+YGKjlMSOsEwl1Z3HhbnvntYHiDVfMmCXghlzg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m09whg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:33:33 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8615cc92488so3836425a34.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 23:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900813; x=1795505613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4AnKfy9vaOFdUcffAacVVa5fJOHRuc6CEJFDQor3xc=;
        b=N+pQtC7rLEMaQYuY+rY8yCODC6zlTSNTX0jQ2lO7lecRLRBnCijCX8fS2JcmxbBXph
         cxVaXA+MKlV25VTt6s4SVbR8YXeUyG79l92T1fWS1MuYJzP5c63uvKM02kqkRm5hq0tz
         aaGoQMe5H0R7vXsih9J2zU2uhZoY4BB1T9IsZRcTJndqg8reeOntHuBfhHnCqMsEooMi
         7EDuSNgdc4SCw3ncbWLgPc4jtv9fhAYkAsLUPiQQ5opn4U7NmQTzrEqYzST/IfSR0lZd
         KvWlOTXvI7/jw9smSElzwIRiLV/6dkSvib57P/46RFLEG4VZ73pJxJM+ygFKQ30MdhyM
         hEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900813; x=1795505613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4AnKfy9vaOFdUcffAacVVa5fJOHRuc6CEJFDQor3xc=;
        b=cVWGwV6tOsam2mcZx7evEQ3S3rsi2tJmySOTIrhi5Ig0OQrB+ZMXfKMQGrMYDEsXCW
         PkY2m3ysPVg1pqXvoMHS6JyhHA/Xs+EM6qgv3gRKb/LNcSlZt5VKoXeTbTdOq5APhESq
         UOJz9lInupFnx2HGBExr4KQu9kpIY2MQ6y5sMBMX5t+3JK2kRUAryANz7j/o92I7v3sK
         /DwWrfr5Cbbo+RfIFLyQpSBeLEls9HISM9ghjoESt65FJMeszBxlrA1YQukP9hZau7dc
         R/kj82FMq81NgsbAHY8vo8vNtj+DacrCMG0Q5L2yh4/iabsUn5HtzMtwJDVpQnYkbtfu
         nfJQ==
X-Forwarded-Encrypted: i=1; AL+hErH9dRH4IgZJj9rakUSFF5DbPxcqmOfYZAO0aWHxTlPf5zLD4rgo98XtK6skXDiRbtUhPujPHpV8k5DLwBJc@vger.kernel.org
X-Gm-Message-State: APuU4Z8Zju4PEB/+xquHstJxDlSh5ax2yDEw5cTB8LHb5ZY9qIpEqqSq
	b1XZn+6iuXogP4p+CQQnTJ9424mnneeOECi60Zw0AL1gFyAW8cJUJJW30f8/TMgrfnXTayYrtPJ
	nQ6RhTPBI1ZzIhq4LB57oP8XW7E1OrlDgYepU81UUR35XA3kpnP7Ovf/74/nbbgkRGRPH
X-Gm-Gg: AYBFou0LUcW7KnXR2FOEeKo9elPVfRpOZsHene6pPqsZlexVlzQZCuK5yEFtGK+oKcx
	gqiGgmSmT5uRp33VwghJoC65tiTyi0ckl4cpdMRH2szHDpNZTrxK27ioMFn6pC4BwFrliQdsX5P
	6lB0IFiXnWC9XKlVwf9jmxpy3Z3z7+h3vrsS64hMnoV7Iwqjpkdcdq44Dbv2jtIQHi11Twl9jdE
	DwxroTdLRP1yQ9EWqyahM7QQwdJtSsTi6u1mXTDrFlbkEWy4Qs7ZpH3l2IZEQwT9o7YxjJwm+D2
	1ZZZasG+OqqKP17JLxUHeDGIWaMqjKPUcQRgWZPJprTQljdETCQEiyvU1HcoWn/6hyqovlQionV
	8cxw2iNye5JrYNBZYEhXFKqdjwFZUNhnEingRfk6Z6raiVxTLt7aeYHTrpsU1nYZT7hkVp3rLZy
	G0BgsUKOiFuV2G9/7OLBtgd7J2yb3ko1LZ9g==
X-Received: by 2002:a05:6830:2692:b0:829:2af1:a07d with SMTP id 46e09a7af769-86289818d7emr12815748a34.5.1794900812707;
        Mon, 16 Nov 2026 23:33:32 -0800 (PST)
X-Received: by 2002:a05:6830:2692:b0:829:2af1:a07d with SMTP id 46e09a7af769-86289818d7emr12815734a34.5.1794900812245;
        Mon, 16 Nov 2026 23:33:32 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm4944508a34.13.2026.11.16.23.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:33:31 -0800 (PST)
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
Subject: [PATCH v19 3/8] qcom-tgu: Add TGU driver
Date: Tue, 17 Nov 2026 15:33:00 +0800
Message-Id: <20261117073305.3854951-4-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
References: <20261117073305.3854951-1-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX14mDS0m7+TNH
 IH3uTXoaB9iAXz62X7R1NhVKDXtotp4JP+ckL/mekxE3VvF85HUj9e9YD71HjYlMZzkUyQVyGTF
 1A1oEzzw0rySWD22cpIXTRg3YqoM8s8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfXwc0GL5Uxq79o
 dCf6XaZQoRTg0lRCYjL4U8LynobI5I2hACMPRAtTKOFU97bkvI7ClGgjgp1PMGxwemBmMqRIwKS
 v0mcmCEcWFpMIqJyKIocue+04KmZ6qHeVUKSfCKlaujZfE456iJt8WONAQhMeaDqB7jh+vPvPwp
 +KIlFdkICRZxi7QCGmfS2hpXG8Nj4FpASxMbgip6OY4xhQz78ggTUcnr5noUHTLUqHzPzkzTDrA
 m4aOG6h1fXUizUaZtae5rzKtyJF24x/J7P6ZPlM3OuX/DEnvA37RXcBNsAxkRo9aTt+57JPnOBJ
 vJR3E9vdtD6HzrFIhNrOjdIkvgBap8iYvrT0hhEb6YrTZRAUXW8o0t5C6BaqqlB8Z6FhXraXVjx
 AnUomc8R+zZD0bgGeVOl80ya6jqDjbkQsSyApQdhrVg9uzfZTCoOA11xS+4Nk7R1cMtv+3WZfL9
 DFpesQmK2S8Q19PsTzw==
X-Proofpoint-GUID: 23JQC_rOGnBP2Y66H9VWjNAW0HqZXDFD
X-Proofpoint-ORIG-GUID: 23JQC_rOGnBP2Y66H9VWjNAW0HqZXDFD
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc034d cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=Rd-eziGjFw8r9s-5bI8A:9
 a=EyFUmsFV_t8cxB2kMr4A:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170029

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
index 000000000000..798a0e51e27a
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -0,0 +1,9 @@
+What:		/sys/bus/amba/devices/<tgu-name>/enable
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the enable/disable status of TGU
+		Accepts only one of the 2 values -  0 or 1.
+		0 : disable TGU.
+		1 : enable TGU.
diff --git a/MAINTAINERS b/MAINTAINERS
index d738990161bd..d7598cdb09f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23270,6 +23270,17 @@ S:	Maintained
 F:	Documentation/tee/qtee.rst
 F:	drivers/tee/qcomtee/
 
+QUALCOMM HARDWARE TRACING DRIVER
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
index 000000000000..5bae46db4f8c
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
+static ssize_t tgu_enable_show(struct device *dev,
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
+/* tgu_enable_store - Enable or disable the Trigger Generation Unit (TGU). */
+static ssize_t tgu_enable_store(struct device *dev,
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
+static DEVICE_ATTR(enable, 0644, tgu_enable_show, tgu_enable_store);
+
+static struct attribute *tgu_common_attrs[] = {
+	&dev_attr_enable.attr,
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
+	 * and drop the PM runtime reference taken in tgu_enable_store() so the
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

