Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2955A3B585C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398877; cv=none; b=nuoK6qo0I5xkXDUp+gUGtABT7wnYRI5oVEWoyKQX83srbS9VYnBSTeNHcUEL4hcdMFaFvXPLEfLWGuyDiqqtXYELawFb4C11mne+GWeBRAmQV+RodDqcP2bzt+8bovNhvPY54oq7JyWCcffZ9VCkXdEUaVRswJSAokQqWW3lef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398877; c=relaxed/simple;
	bh=NLH7D+rQTKYqk0vh37ivreFVWNmr4fN3gmnOZJx9eXU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J9ATr025c6KWpDI8W6cFvu7VdmGjCkht9Nz9n4j6j5A2IDxJrNwiY2LX/g8nMVNQPGT6++3aR0IO1Hf8pBlC+68Tl/rSFIpCr2V9Q5IG31j6wR0L4n4l+YZ1anaF/7wztSNyLJGBYiCtC78d8maOehPdZwHLY/VrZW7haYnXFk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1405DbV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EVR47xqo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1405DbV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVR47xqo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U82aOs1385279
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f0mqMCw4VfO
	qq/B+icSACyedIdFq/O6teVK4CC3YceA=; b=n1405DbVZbZ54A+ySlsRkIoMYlz
	xtlayR4GfUYKA8+DyRoWJs/N7xysocrmgrqriMZvT5RVOWCrqJ4qxLp374eksyUr
	LV80NCD6wY87LPHXb3xyjBCA+PxfZ+qKgEvrQk+piI9yXCs10g0TXNchTD+w1Ftq
	CzD+tnDaI2zIcSvWL2+QOiqgoB99vQUIK0lrznWW3LlIwvfDUXvViYCDYCF2vAt2
	uDe69Hd2Uuv57tSLz46RQwFLJNRNHjKDl/bNv2EB6mpq+jdL91rEfcfRA37jtm18
	VT2h2909gVjH72hPeRr1cf67ow+sA2I2wmt5vMuc0PiiIWvJtGfEzC+gk3A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr2rp00ur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:07:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso2427409a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 01:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785398873; x=1786003673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0mqMCw4VfOqq/B+icSACyedIdFq/O6teVK4CC3YceA=;
        b=EVR47xqoB1nEKzIYoS9lFRzS65jW+I/c9C470i+6NT7bDOgDbYzuPmXoZqAdCQIrXl
         vs0zsdSYVCOBhHYMocvS9i7UjL4S9C7EPRvaD9KjUd7Vu8nBziubImKzh9zSxopat42J
         3EOr6wpcuUyCVhhJH8cH7F2OlpKFlJaam58QNgdTYiPpuyxnRBdm/0qcPzSQZ/oapQ1q
         EAruBMeRpiSs9MBkLxDLruZkR5G1n8x6fuFDkHQyNufNR/CtVH+06B8f1R/LvpXWQa8h
         A85Djrpil1H0d9JdRkONxMoy5I9w76op3ZS8L9pNlku18QsK0HqdTOiqoJYt3nFhBw9H
         /1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398873; x=1786003673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f0mqMCw4VfOqq/B+icSACyedIdFq/O6teVK4CC3YceA=;
        b=sQNMHKPb2gxtHrRHcDwy10oFGKBMcSujUGTgQOB5vzALYOp/kdQ+R4WnVvE89ttixW
         GBbFFLi0RDgaCC8QsNwedDi4Nga4Hzcv7XYWHfPW+7VWWhXRz6lTsvwPU03QuUOYIXLR
         shB33GooVv7CxHg9goHxl3tlZHGDN+xcYW5grtbrCY0e/UC0M9k08XP5qmI11/bvzqOv
         eyPvGazyhZkxbVdQFHmORjqtXce2n6nBDl+3xNysXjUhWp4Y2tzjOVYaCp0zmgZNvvuH
         KSOnVh1lfE3cm3URYu0dAaucnGceD6usswi+6otc02fXYsLpTLL0ptHOBiJnX5V02e5A
         68LA==
X-Forwarded-Encrypted: i=1; AHgh+Rpx/Uz0WydLF55j1+OMlilqEq1snIfTuNXo53oekcyni8qkCiq60juxKaHLseVCl8MOx/WJzDEbyv5l6g0a@vger.kernel.org
X-Gm-Message-State: AOJu0YzHmxUBeyJcuAfluSlXWZWHQG3ltXtrdsF1x9/QRxhm5XKKugnA
	H7chygxRW/qV4lxJpSplXi8+ZaR0Sd+9kcrVU+HSuInrimXGxk9dPCBoD9673LuF5E7Cec8hgGS
	nltzw7Z0ym6hZg+ZYYlfDxFfMJlhtZYq7yuWBbm/hCUCCTz4xYnJDE3cNPhkGjQta5U2p
X-Gm-Gg: AR+sD13A/S7VOlrVr1gF5VgP3CKYPWm7jDKD3U847hmyr2dC8RG0PsIIh16tEJIWqTU
	vLqh3E+sm85Ubi+lzokh/M1xtdvmr9nKLXr96n2pjGmwYHTds3klG9wFKdU/zgmIAFQv3cfxKwr
	jmjeATkUhSDTbHWmDj6ZuQd0ijxQCXO7Kd+MyyaafigsG+IFaqW3w1PZsIt62F9/5ueqa5gk3Oc
	0D1JgkDlRATUbcurSPg/+m7IpVi9734NpUJug3dDhHaoSSnMPA2i8n+GojqEMhZHx4noafPHuVJ
	kejx9kTBAXMAFx3zzruxLOENBBlis6WzaVC0DIV0hQVBO3hB7ifOuCWfLrtB7rn8KWXuu28usbt
	zEBHvqFo322f0Dsp2S8mYrn3sROR76JMePmsvd8I0hg4v+SkHNCazc0I=
X-Received: by 2002:a17:90b:582c:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-38f9bd692e1mr1404452a91.7.1785398873043;
        Thu, 30 Jul 2026 01:07:53 -0700 (PDT)
X-Received: by 2002:a17:90b:582c:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-38f9bd692e1mr1404427a91.7.1785398872578;
        Thu, 30 Jul 2026 01:07:52 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9bab61desm619516a91.13.2026.07.30.01.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:07:52 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v16 7/7] qcom-tgu: Add reset node to initialize
Date: Thu, 30 Jul 2026 01:07:04 -0700
Message-Id: <20260730080704.2903540-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfX1MJ2xseA6qBx
 VZLkCv41wRTyQ7MHHyplYs0JMfVb48Q89XA4glLttFXeIOv08g/0wPJVN6lUuI8of5n9K9S7G8z
 VnhdwxNAqd/F9hLLf7xfzTjHCju3XfE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfX47KLJ5aixMPK
 THQ7zB1/CN5QT12KvcNp4DJoX/edZMKc8eM8PJNEqGHwz4uneI6ty/v0jkX58C4msPErexb8IXW
 I621U/YGUz1iOckPSapnSu4obmPjifS8klePi3rk3/uiHejwb6M3K/8WNunjwWdA/T9YcPSEpIQ
 kZTmLsChEGUVhb7jGYzmuEFo/K3CYcyQph2m5xSV8NBtdgSegf6POzNYPR8xfsAt+uu8W+LSA3+
 wGskZieVhF0vBTi4u3ohTqSujr47TR/zsy5tJ/eimVxOFYFyfqzrAhqq66xT6IVWUKuMBUpftZb
 3DfaGVynt7tTBiF9+MRPbuaA0gnRgjUrlimUMFmjLX6/9hmD7g126HOkj2JtS0Rh2sAFfney7NN
 dPmRVrNA4HlgHFr9NXMukQriWzfVGhhtfTBbfObW6egFq7mBJmM2fO19qYVRxQrPl8RFyXyfCUQ
 1hxkQzEpXKcGkaX7tKQ==
X-Proofpoint-GUID: R802L1gnO3FlrOy0pOrWfa_RBnshCHx4
X-Proofpoint-ORIG-GUID: R802L1gnO3FlrOy0pOrWfa_RBnshCHx4
X-Authority-Analysis: v=2.4 cv=OcOoyBTY c=1 sm=1 tr=0 ts=6a6b0659 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=79gz_PYK2aiFH5aRGwAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300057

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 84 +++++++++++++++++++
 2 files changed, 91 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index a0cad2f16310..5c928a5fa033 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -51,3 +51,10 @@ KernelVersion:	7.2
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/reset_tgu
+Date:		August 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index ea83273a628c..d65a68faa741 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -228,6 +228,18 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 	int i, j, k, index = 0;
 
 	TGU_UNLOCK(drvdata->base);
+
+	/*
+	 * Quiesce the detection engine before mutating any comparison input.
+	 * This function is also reached from reset_tgu_store() while the TGU is
+	 * already running (TGU_CONTROL == 1); rewriting the priority/condition/
+	 * timer/counter registers register-by-register on a live engine could
+	 * feed a transient, half-updated match into CTI/interrupt consumers.
+	 * Programming with CONTROL == 0 and only re-enabling at the end keeps the
+	 * program-then-enable ordering for every caller.
+	 */
+	writel(0, drvdata->base + TGU_CONTROL);
+
 	for (i = 0; i < drvdata->num_step; i++) {
 		for (j = 0; j < MAX_PRIORITY; j++) {
 			for (k = 0; k < drvdata->num_reg; k++) {
@@ -459,8 +471,80 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct value_table *vt = drvdata->value_table;
+	unsigned long value;
+	int i, j, ret;
+
+	if (kstrtoul(buf, 0, &value) || value != 1)
+		return -EINVAL;
+
+	/*
+	 * Hold the mutex across the whole sequence so it cannot race with
+	 * enable_tgu_store()/tgu_dataset_store(): the enabled check and the
+	 * hardware access stay consistent. No PM reference is taken or dropped
+	 * here - the shadow tables are plain memory, and the hardware is only
+	 * touched when the device is already resumed via the enable reference.
+	 */
+	guard(mutex)(&drvdata->lock);
+
+	if (vt->priority) {
+		size_t bytes = MAX_PRIORITY * drvdata->num_step *
+				drvdata->num_reg * sizeof(unsigned int);
+		memset(vt->priority, 0, bytes);
+	}
+
+	if (vt->condition_decode) {
+		size_t bytes = drvdata->num_condition_decode *
+			       drvdata->num_step * sizeof(unsigned int);
+		memset(vt->condition_decode, 0, bytes);
+
+		/* Initialize all condition decode registers to NOT (0x1000000) */
+		for (i = 0; i < drvdata->num_step; i++)
+			for (j = 0; j < drvdata->num_condition_decode; j++)
+				vt->condition_decode[calculate_array_location(
+					drvdata, i, TGU_CONDITION_DECODE, j)] =
+					TGU_CONDITION_DECODE_NOT;
+	}
+
+	if (vt->condition_select) {
+		size_t bytes = drvdata->num_condition_select *
+			       drvdata->num_step * sizeof(unsigned int);
+		memset(vt->condition_select, 0, bytes);
+	}
+
+	if (vt->timer) {
+		size_t bytes = drvdata->num_step * drvdata->num_timer *
+				sizeof(unsigned int);
+		memset(vt->timer, 0, bytes);
+	}
+
+	if (vt->counter) {
+		size_t bytes = drvdata->num_step * drvdata->num_counter *
+			       sizeof(unsigned int);
+		memset(vt->counter, 0, bytes);
+	}
+
+	/* If the TGU is running, apply the cleared configuration immediately. */
+	if (drvdata->enabled) {
+		ret = tgu_write_all_hw_regs(drvdata);
+		if (ret)
+			return ret;
+	}
+
+	dev_dbg(dev, "Qualcomm-TGU reset complete\n");
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 
-- 
2.34.1

