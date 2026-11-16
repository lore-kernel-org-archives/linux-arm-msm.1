Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814911;
	b=ErB3WxYRzcsoQkRgMpZWn/zQK2wWtMRHwiAxxme2diprFynl8eQm+Z/BlR4lLUq2WvCS
	 rxHYUx3bj5qR7ZjBC+kq2d2/K1edLkCCOgwdLw+3BQUuzj62/c4vaqpF+gBwWJhHiaUqN
	 Z6iEcoMfEW+ku4bCpfNHnqnL5tcBQsixHIXb2ngiXT8RtxdWEqvciavnYusQhsNBX1SJN
	 3GvoDvz2BUzIaLwEJEgq8bPYVLQD9S1nWrpXWphTp+i8eOE/FdJJf25AqspLDrJFd8JjU
	 8qYZzhBkVjJEcvNF9VB16CF+CqiE5FwwCsuC12U4XJRM/KBXpIEmWVBwFbwEvGtJMfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814911;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iS+QGshyOOdLA24R9PcvKxeX0ryVZNDglzHZFfqiEz0=;
	b=FMA7rNEhxIGkFS7Nr6ygWN60oJOhDLUsLUc8hCzv8ixDbAvr5gZ+WtpIyjBeSwQrSsjP
	 a/v7kK5RitTPcUdknnq+fJztINjTlQWo5QUV7BctrxUqq70dx7+8z3KGII5o0Su9+qotJ
	 7CAX5PPFPSnI8Ky/scSh6bzEvqcmwtN52pfb7xqBMkbnqnspXf4TFHXbgynVPEkBsTjQ1
	 Q5ulyU+nSiv/v8KkveIcdaktvrw/8SvVHU/ZxfLXndrEaxv/NoT2WdO5mKuMjiBZk79qZ
	 CpaV7LHJNOVcIQxbNWjtIGGTuJn6wxJQQLVqrWbNeRxkKjZBi19P2HM/oyuyBCC/6vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ilUDdpCz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLYN752V;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AFD606A330
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93AFD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ilUDdpCz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RLYN752V
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7eslY524913
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iS+QGshyOOd
	LA24R9PcvKxeX0ryVZNDglzHZFfqiEz0=; b=ilUDdpCzOxlTT9Ft9mSXlY/GYqg
	ks9LUdu1vqGtjW80jhJ3mjLtQCnde9vVDpyifHZ48TzZ1aJWhO0QwZuYedc6kh7o
	7gwjaAS/EYxDiQWIIP6/Sa+i69nrOmV7Pi6YJJXwHImLhxsG7ySIJfI+WA4FMmev
	ChP6ZEhzOBI8cKFMP5huuu5I/UoM9NC1pxfiTBS6gEZeTF3Vlo5EpOwhj63DQEok
	OyMk68UyyxPTCOvGmm7pAPtqYKBSfcvIptSysvbzRVTTEov3dbIUexRZuqQQTjvc
	OwDjpwkUaMn2nUQyFukfw61gg1DeGdUzthPyJXGaSnj/QqCAM/kn+QUNfbw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqngay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 07:41:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so5023659eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 23:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794814908; x=1795419708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iS+QGshyOOdLA24R9PcvKxeX0ryVZNDglzHZFfqiEz0=;
        b=RLYN752V2sGEwp9dLKhdleq0AsHs694dbQkV6jGmWkAABh40HpZFBmOtCSgQLjCh89
         JRh+ujnqLK8aohfSeXSlrhwjBfO1wQSun5AFqq0U0lIw9x6ESebZ3mk9LQ5AlvAtj6t0
         mhXInSIvdr0NpRKNa1z+KyiAlU0aKhIkKfDjZxzMsyWm8c8bXMnHPZ+fjMHUDZOSL1Kf
         tCnAevGy5aYDf6btgP53tob4/RwyYvrFneRL7aeii04I/lJ/ghUAZHHFxUy2wMRKak9X
         7oDExrRNe0596xc5nLwc3tyAybzyblT5W0hevEvBI/NmU6gbvkfyZvyt4jRVxnr+wgC/
         Xi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814908; x=1795419708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iS+QGshyOOdLA24R9PcvKxeX0ryVZNDglzHZFfqiEz0=;
        b=F51g+O/OJR1olEI3hZjK3hK5dk6SHzR+PWDaCMhnEx8IBfaMO8DzSMT+dPhv5hpJFd
         zffmZb7uetdiBuc8DBCSQW2yEjiptruSls9eIEnOg+Dii7fOT+Xde3MnD5fMT3ufVlYq
         w6n6XSXifzSE6YWkiAGJa9HNzNEHqBMMg2X8erzBjXD60LlrLswmDTaGNejUqsgE24FW
         pxY/rmyNncVcpbK8AJzTcwIC2S5mhXch+OgBIeEibf47/bxyw2/E/lW0+7UQXtBKWFh4
         dz0loe+kE0SaPax5aoM6H8TgHamzELMSjGjkl/gOocAdgAm0PB2U7eJbWeqaCX85isSn
         TCWQ==
X-Forwarded-Encrypted: i=1; AL+hErGQzrZ9r2zmvlTa565tRGZ1tCHDUcEvqrNwAy9QKVBw7NQR6AjH5EQQYmbttaGKSdxdQKKY5Un26Z1Hv2xm@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZU5OuKmhU6IPi4lJrG+s0Wp48DtcLiXPIwjVjqdO4sdwN8Vrx
	dPYiFdPKSGf0q11DUUoVkXaK3+dtv7SeyZ++3gsNjSaTFW7zrIVSLJxU4/nApEOVpMu1CtlpBPt
	6ycZ3pp+Wel8ApO5Eu4+fdH3QsWbH7d6TT01BZAgov9MbxozN41k/Ou1PTmV0i1y6CbXo
X-Gm-Gg: AYBFou1GlWr4bfSZtFrJuW9hQcGpjUNTZEO2D8Af35q17RHGJKQaOGNDg1u6th9SvP5
	tqJlJD61FpP09gSnj+71ud5BQqyrnCLzZKL0S/bdsbuhOOw6tPXS2KCwgsG7EnvW2uF0V0InOdt
	j1D5TNwicnCqiUyNVlAwYwA2wCyoR47VBKT6CK9LuXXYl6M+vZ6ZR7Y515QTw6DJ4jlyXZnBa4o
	WFYCMlNe3GXZEV2bFUZArXlKdDCevSDWutZYJ/xt+j1pbhB4f2jP0DdNGU1ep2036VrmLmxe1DQ
	XZwvJb1z7PN+7CUkQS76axyTFaUaBwq4z+zWsZX5X2J+gJ3qItLW0WDuRqTgDKvlpMOMdBOXnXx
	vGzePV6/C2xvWgT1jSB8MgaB2E0hFl/pCBEXXvwoMP/Op2gx5bA5R+u9tfd7j3rP/+zms48kznv
	ik9xumGQzJfRzBDA/dEPLEiP6mXdsbOqUgJQ==
X-Received: by 2002:a05:693c:2585:b0:36c:a1ef:f8f7 with SMTP id 5a478bee46e88-37963371df1mr8737960eec.4.1794814908245;
        Sun, 15 Nov 2026 23:41:48 -0800 (PST)
X-Received: by 2002:a05:693c:2585:b0:36c:a1ef:f8f7 with SMTP id 5a478bee46e88-37963371df1mr8737938eec.4.1794814907595;
        Sun, 15 Nov 2026 23:41:47 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm52137536eec.25.2026.11.15.23.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:41:47 -0800 (PST)
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
Subject: [PATCH v18 4/8] qcom-tgu: Add signal priority support
Date: Mon, 16 Nov 2026 15:41:14 +0800
Message-Id: <20261116074118.822731-5-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
References: <20261116074118.822731-1-songwei.chai@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6afab3bd cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1rXoQJKsMvXEZDCkVBMA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfX7cUWRnMoa1gT
 v8WiaMOr7tjx290a0V2gkDpJBdQxmmgt2ezwHFRthcc7203zU4ra23UtPFLHPB4pM9RzlQ2IquY
 ry3DWF3R9K5hiFkov1NL3oCK0BbADQs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzMCBTYWx0ZWRfXzoW/z/oZr7rf
 6CIKgMJ85ZMci3xlMPl7tz/RY0VpzBU4QM+0F9/uO7dhAoFi3Zri/W4HvfO/e7uAgkN5AUA3KFc
 KiZdBUOYvNQ0TmzQ6hBfaZd2YFswCE6S/MODTpPSCYF2eRC3QX6LdOtMX6exnsdUzghvVvrSwL0
 o48RWzgq+oUARVVBxLXCFTrdQcPNzHppfP0XUEaJ1X3VLtYRmUSokGHVRsCgnpFwuiVvajZdtw6
 WYIM5PlhOZvkQ+U/KhN+XEELOVYpFS3jFL3fhIpzsCuYyYNglWBJoBuWlJ0h8p6BoM7ApcMCCo/
 H5CRKz6oD5slSTbxGT64tJqaNSQPBPC+U1AFshgxanXdVu77YRu5ez6HiWxPsbwy25GfdyNe62t
 GY2Aqxx330uaAo1e023k89WhJ8m0o85Fci9LwVricsjZTHaofGyAf0FRjPlTx2vVW6EpCk+BJuW
 X9k4lH3eTIqNdh7FydA==
X-Proofpoint-GUID: KOugKYTeE8zTt5NOcbY1W98YrS73Swll
X-Proofpoint-ORIG-GUID: KOugKYTeE8zTt5NOcbY1W98YrS73Swll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160030

Like circuit of a Logic analyzer, in TGU, the requirement could be
configured in each step and the trigger will be created once the
requirements are met. Add priority functionality here to sort the
signals into different priorities. The signal which is wanted could
be configured in each step's priority node, the larger number means
the higher priority and the signal with higher priority will be sensed
more preferentially.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-amba-devices-tgu    |   7 +
 drivers/hwtracing/qcom/tgu.c                  | 211 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  |  68 ++++++
 3 files changed, 286 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 798a0e51e27a..3be0b912c937 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -7,3 +7,10 @@ Description:
 		Accepts only one of the 2 values -  0 or 1.
 		0 : disable TGU.
 		1 : enable TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:23]
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the sensed signal with specific step and priority for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 5bae46db4f8c..917d506cddf9 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -16,14 +16,145 @@
 
 #include "tgu.h"
 
+struct tgu_attribute {
+	struct device_attribute attr;
+	u8 step_index;
+	u8 priority;
+	u8 reg_num;
+};
+
+/*
+ * drvdata->priority is a flat [priority][step][reg] array.
+ */
+static int calculate_array_location(struct tgu_drvdata *drvdata,
+				    int step_index, int priority,
+				    int reg_index)
+{
+	return priority * (drvdata->num_step) * (drvdata->num_reg) +
+		step_index * (drvdata->num_reg) + reg_index;
+}
+
+static ssize_t tgu_dataset_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct tgu_attribute *tgu_attr =
+			container_of(attr, struct tgu_attribute, attr);
+	int index;
+
+	index = calculate_array_location(drvdata, tgu_attr->step_index,
+					 tgu_attr->priority,
+					 tgu_attr->reg_num);
+
+	/*
+	 * Serialise against tgu_dataset_store() and tgu_enable(), which read
+	 * and write the same priority array, so the value is not observed
+	 * while being updated concurrently.
+	 */
+	guard(mutex)(&drvdata->lock);
+
+	return sysfs_emit(buf, "0x%x\n", drvdata->priority[index]);
+}
+
+static ssize_t tgu_dataset_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t size)
+{
+	struct tgu_drvdata *tgu_drvdata = dev_get_drvdata(dev);
+	struct tgu_attribute *tgu_attr =
+		container_of(attr, struct tgu_attribute, attr);
+	unsigned long val;
+	int index;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&tgu_drvdata->lock);
+	index = calculate_array_location(tgu_drvdata, tgu_attr->step_index,
+					 tgu_attr->priority,
+					 tgu_attr->reg_num);
+
+	tgu_drvdata->priority[index] = val;
+
+	return size;
+}
+
+static umode_t tgu_node_visible(struct kobject *kobject,
+				struct attribute *attr,
+				int n)
+{
+	struct device *dev = kobj_to_dev(kobject);
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev);
+	struct device_attribute *dev_attr =
+		container_of(attr, struct device_attribute, attr);
+	struct tgu_attribute *tgu_attr =
+		container_of(dev_attr, struct tgu_attribute, attr);
+
+	if (tgu_attr->step_index >= drvdata->num_step)
+		return SYSFS_GROUP_INVISIBLE;
+
+	if (tgu_attr->reg_num >= drvdata->num_reg)
+		return 0;
+
+	return attr->mode;
+}
+
 static void tgu_write_all_hw_regs(struct tgu_drvdata *drvdata)
 {
+	int i, j, k, index;
+
 	CS_UNLOCK(drvdata->base);
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < MAX_PRIORITY; j++) {
+			for (k = 0; k < drvdata->num_reg; k++) {
+				index = calculate_array_location(
+							drvdata, i, j, k);
+
+				writel(drvdata->priority[index],
+					drvdata->base +
+					PRIORITY_REG_STEP(i, j, k));
+			}
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 	CS_LOCK(drvdata->base);
 }
 
+static void tgu_set_dev_caps(struct tgu_drvdata *drvdata)
+{
+	int num_sense_input, num_reg, num_step;
+	u32 devid;
+
+	devid = readl(drvdata->base + CORESIGHT_DEVID);
+
+	num_sense_input = TGU_DEVID_SENSE_INPUT(devid);
+	num_reg = (num_sense_input * TGU_BITS_PER_SIGNAL) / LENGTH_REGISTER;
+
+	if ((num_sense_input * TGU_BITS_PER_SIGNAL) % LENGTH_REGISTER)
+		num_reg++;
+
+	if (num_reg > TGU_MAX_PRIORITY_REGS) {
+		dev_warn(drvdata->dev,
+			"DEVID reports %d priority regs, clamping to %d\n",
+			num_reg, TGU_MAX_PRIORITY_REGS);
+		num_reg = TGU_MAX_PRIORITY_REGS;
+	}
+	drvdata->num_reg = num_reg;
+
+	num_step = TGU_DEVID_STEPS(devid);
+
+	if (num_step > TGU_MAX_STEPS) {
+		dev_warn(drvdata->dev,
+			"DEVID reports %d steps, clamping to %d\n",
+			num_step, TGU_MAX_STEPS);
+		num_step = TGU_MAX_STEPS;
+	}
+	drvdata->num_step = num_step;
+}
+
 static void tgu_enable(struct tgu_drvdata *drvdata)
 {
 	tgu_write_all_hw_regs(drvdata);
@@ -103,8 +234,86 @@ static const struct attribute_group tgu_common_grp = {
 	.attrs = tgu_common_attrs,
 };
 
+#define tgu_dataset_rw(name, step_index, priority, reg_num)              \
+	(&((struct tgu_attribute[]){ {                                   \
+		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
+		step_index,                                              \
+		priority,                                                \
+		reg_num,                                                 \
+	} })[0].attr.attr)
+
+#define STEP_PRIORITY(step_index, reg_num, priority)              \
+	tgu_dataset_rw(reg##reg_num, step_index, priority, reg_num)
+
+#define STEP_PRIORITY_LIST(step_index, priority) \
+	{STEP_PRIORITY(step_index, 0, priority), \
+	 STEP_PRIORITY(step_index, 1, priority),  \
+	 STEP_PRIORITY(step_index, 2, priority),	 \
+	 STEP_PRIORITY(step_index, 3, priority),  \
+	 STEP_PRIORITY(step_index, 4, priority),  \
+	 STEP_PRIORITY(step_index, 5, priority),  \
+	 STEP_PRIORITY(step_index, 6, priority),  \
+	 STEP_PRIORITY(step_index, 7, priority),  \
+	 STEP_PRIORITY(step_index, 8, priority),  \
+	 STEP_PRIORITY(step_index, 9, priority),  \
+	 STEP_PRIORITY(step_index, 10, priority), \
+	 STEP_PRIORITY(step_index, 11, priority), \
+	 STEP_PRIORITY(step_index, 12, priority), \
+	 STEP_PRIORITY(step_index, 13, priority), \
+	 STEP_PRIORITY(step_index, 14, priority), \
+	 STEP_PRIORITY(step_index, 15, priority), \
+	 STEP_PRIORITY(step_index, 16, priority), \
+	 STEP_PRIORITY(step_index, 17, priority), \
+	 STEP_PRIORITY(step_index, 18, priority), \
+	 STEP_PRIORITY(step_index, 19, priority), \
+	 STEP_PRIORITY(step_index, 20, priority), \
+	 STEP_PRIORITY(step_index, 21, priority), \
+	 STEP_PRIORITY(step_index, 22, priority), \
+	 STEP_PRIORITY(step_index, 23, priority), \
+	 NULL                   \
+	}
+
+#define PRIORITY_ATTRIBUTE_GROUP_INIT(step, priority)\
+	(&(const struct attribute_group){\
+		.attrs = (struct attribute*[])STEP_PRIORITY_LIST(step, priority),\
+		.is_visible = tgu_node_visible,\
+		.name = "step" #step "_priority" #priority \
+	})
+
 static const struct attribute_group *tgu_attr_groups[] = {
 	&tgu_common_grp,
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(0, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(1, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(2, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(3, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(4, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(5, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(6, 3),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 0),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 1),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 2),
+	PRIORITY_ATTRIBUTE_GROUP_INIT(7, 3),
 	NULL,
 };
 
@@ -129,6 +338,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	if (ret)
 		return ret;
 
+	tgu_set_dev_caps(drvdata);
+
 	drvdata->enabled = false;
 
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index c6426b4e3617..d769379b8421 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -6,9 +6,70 @@
 #ifndef _QCOM_TGU_H
 #define _QCOM_TGU_H
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
 /* Register addresses */
 #define TGU_CONTROL		0x0000
 
+#define TGU_DEVID_SENSE_INPUT(devid_val) \
+	((int)FIELD_GET(GENMASK(17, 10), devid_val))
+#define TGU_DEVID_STEPS(devid_val) \
+	((int)FIELD_GET(GENMASK(6, 3), devid_val))
+
+#define TGU_BITS_PER_SIGNAL	4
+#define LENGTH_REGISTER		32
+
+/*
+ * TGU configuration space                                 Per-step register layout.
+ * (one step occupies STEP_SIZE bytes)                     Offsets below are relative to
+ *                                                         the start of that step's block.
+ * x-------------------------x                             x-----------------x
+ * |   coresight management  |                             |     reserved    |
+ * |        registers        |                             |-----------------| +0x1F4
+ * |                         |                       --->  |   priority[3]   |
+ * |-------------------------|                       |     |-----------------| +0x194
+ * |         step[7]         |                       |     |   priority[2]   |
+ * |-------------------------| step[0] + 7*STEP_SIZE |     |-----------------| +0x134
+ * |           ...           |                       |     |   priority[1]   |
+ * |-------------------------| step[0] + 1*STEP_SIZE |     |-----------------| +0xD4
+ * |         step[0]         |-----------------------|     |   priority[0]   |
+ * |-------------------------| step[0] (base+0x40)         |-----------------| +0x74
+ * |    Control and status   |                             | condition select|
+ * |          space          |                             |-----------------| +0x60
+ * x-------------------------x base                        | condition decode|
+ *                                                         |-----------------| +0x50
+ *                                                         |  Timer/Counter  |
+ *                                                         x-----------------x +0x40
+ */
+#define STEP_SIZE		0x1D8
+#define PRIORITY0_OFFSET	0x0074
+#define PRIORITY_STRIDE		0x0060
+#define REG_SIZE		0x4
+
+/*
+ * Upper bounds on the DEVID-derived per-region counts, used to clamp
+ * whatever the hardware reports so writes never fall outside the
+ * ioremap()'d window or spill into an adjacent region.
+ *
+ *   TGU_MAX_STEPS         matches the static step0..step7 sysfs tables.
+ *   TGU_MAX_PRIORITY_REGS matches the static reg0..reg23 sysfs tables.
+ *
+ * Each priority level's block spans a full PRIORITY_STRIDE (0x60 bytes),
+ * i.e. PRIORITY_STRIDE / REG_SIZE = 24 registers, all of them implemented.
+ */
+
+#define TGU_MAX_STEPS                  8
+#define TGU_MAX_PRIORITY_REGS          24
+
+/* Maximum priority that TGU supports */
+#define MAX_PRIORITY                   4
+
+/* Calculate compare step addresses */
+#define PRIORITY_REG_STEP(step, priority, reg)\
+	(PRIORITY0_OFFSET + PRIORITY_STRIDE * priority +\
+	 REG_SIZE * reg + STEP_SIZE * step)
+
 /**
  * struct tgu_drvdata - Data structure for a TGU (Trigger Generation Unit)
  * @base: Memory-mapped base address of the TGU device
@@ -16,6 +77,10 @@
  * @lock: Mutex serialising enable/disable and the associated PM runtime
  *        reference counting against concurrent sysfs access
  * @enabled: Flag indicating whether the TGU device is enabled
+ * @priority: Per-step, per-priority-level, per-register values staged by
+ *            sysfs writes and flushed to hardware by tgu_enable()
+ * @num_reg: Number of priority registers implemented per priority level
+ * @num_step: Number of steps implemented
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -26,6 +91,9 @@ struct tgu_drvdata {
 	struct device *dev;
 	struct mutex lock;
 	bool enabled;
+	unsigned int priority[TGU_MAX_STEPS * MAX_PRIORITY * TGU_MAX_PRIORITY_REGS];
+	int num_reg;
+	int num_step;
 };
 
 #endif
-- 
2.34.1

