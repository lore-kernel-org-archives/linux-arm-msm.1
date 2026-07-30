Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15FB3B19DB
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785398871; cv=none; b=lBThRhQZKRWfnu8a3AMA7sAClk0ojlWXyohMpnyswJgdAIibjjwpAZR75GaGblSY6KGnv2Jl9QcQqwgkF7I222q5E0WsYaVLHsWG7EzF8UhkeN+/bCalLcU9sp2AIK9RDKRm2RQ9HmXGEqaeWq3NMSz5NLg3swxjmwcRfzX0mHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785398871; c=relaxed/simple;
	bh=ODD4rZqGdd/D4MIGtFI0Rh5+zvH0x3cDRii0CFo8ads=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TXVAnhbi6vwBImedDeNXtluYo9P4/kPv4FoIvx3dKbRJeTgO30Ng0yxlv/Z5ISJscqtVNxPSOooS21F1fQ99MFcgbzNZ/Lj6hKvtXK6nnAestOMQNTshDUgnaYe5xcsJATjjPZQGXLxVvjSl+qOBxmHg+5YaNrHu27tEu9CoB1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KgNQTdRU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FN34E598; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KgNQTdRU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FN34E598"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U82cfx1385407
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sKwW1smT6kU
	9TuyoP3TXp0TOCiEt4FxOoYMktO3R0iM=; b=KgNQTdRU20jHShqgYZnDw1WBqiB
	zmLaUeg2YHrxOP0SE0TUlYquwo45MaU93hslIWeunzX8d5TBt8OBrty8ojU+okVE
	tqpE5E3djY7D347crvwKrM7A7H2cvxhJy/hLXGVFWVMJ0BardIVJkQU1Nv0FRzbh
	scIRA6/2gafxCqeBDB2jfK8hh8905M5Dd7wOq6qTdihMYWUrLVuN5h3vOMpcH2RA
	SMtUlM1nMVc6YzQ+11atw1aen5oAa0aih3kw4q6iKVPz9FkfQonCJMIGzS+Fevei
	i5Rl0qH4qfT9IVXOnh24MxDuct+dGqb3BtG/IRVleTTyyCk46hl/LDcUvXQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr2rp00tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:07:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e667368f0so2911018a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 01:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785398865; x=1786003665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sKwW1smT6kU9TuyoP3TXp0TOCiEt4FxOoYMktO3R0iM=;
        b=FN34E598Z3Rm0apa5xtafK8vf0FJgzjVziZUFyGwXYyQ1j5qcUXJcGNobI91MF6MH+
         RM8FD8lcvIOGPc4Tgyblj0OMyEAkAA0sFFsZYqPRqWcX/Qd803JTUgI/ENfDA5smf5kV
         2bZu5GPiG0HmDcaB1YkbgHfSVFQ6f1VjprehslD4yK5rrJhjmmjlmWaeEfuoqjczJSJp
         m6xaYwukfykPYDLymYLjMMpJJuOAeV2QhihHdJYFDKQvXcYDlOBiamykeMB3oYs8HDH+
         vxlAffrUtLeKj4VJZjh4ZUv+Yo9lZ6hXd2UvVYgK5OHe1vpMUP/00awmeG3ut46fogiV
         FLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398865; x=1786003665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sKwW1smT6kU9TuyoP3TXp0TOCiEt4FxOoYMktO3R0iM=;
        b=gJ6vz9ANUJyg2VQIedtLlAjyVXHqsoyBo8B+hhH4bHnhu2s0SXLp0HryR/6+VJWRHb
         HwcnJJ9L19M+bKSSKwQMfwl5u2wEBQZHlfQEOwGySZBNj6d2R2Pk1f5kI698DLAjZ95I
         VTkaLleKn9QhDuw1uXSAwZba10Of/t8alJVUY11MNUEHzRO9SMja2IIMQL0b56U0yLdW
         8vyAh+HLZ9FtjO5MeyIQR4+ezaLhikWBM9v5+oRYCLDogTRplgE+Kno1CxlensmYtGy4
         1YVuxYJiX8WVbLewHmR2+NEsQF/nX5mWnQtuIdyu9K/SF7gFz0ucfbUXkTPuRDPTGtEZ
         tzLg==
X-Forwarded-Encrypted: i=1; AHgh+RoiKRUL1DmWlgemCKSeSFmWLVMMvsfmA8MoDvqRwwixg8JfDNT04bkversAj0+bk2fX3bndDb/XsXAzEFGy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2h7DX+duhZASQx0ZzZvOHe/OKaI7bwkV4F22YocpSpAIDXBd5
	FrporELtcw5utUewjfELxhLC1TqXz26bpaxDQu9P8lu9WeBpnO7eOjg5oc5N7yE9LfXLRj1/2/E
	6G8GQB8SGx/huAtkxJCBD3Gbz5J6xV0IDTW3ha75rYHXFNki1Iyf1MJOKRui4ALrjI1bO
X-Gm-Gg: AR+sD130Lu8lc0EfTFmV17sJGVR21WOhjgprtxXgq1LpZ89YCDtiWImGHzj7a8ZNkxy
	2K5sroOTfu1KRz9/Tdl4d1DbGfXhxB8M4kOSoQh4xWbizUcjq2+6ubtYZLaGLBvo4roSiVfNB6R
	HIL/VsOJ57qBdVUJmvLamI60Wm+YS8eDFb0yR2D69i62Xqu65EmHJnJsrhLPdiRmhLXLs1tBBc8
	MSXyKbpQ/U+BmV2mAs2QgEfwcaA3WQMWLiApYoxkgmx441KnLxOwzODEalgN7Ko9aEPVzBX9GNk
	NynybppgPvoLF2kmw+OM5dS7LxwZIMHVHqt8uRO631QDMXuBpi6CQSl7oa+hmuze6XCw0wEbVZz
	BKJxUznDhW+gS8FvdugVT4ZRGjI0CY8CdJMzVRc/lzlfnK4Q4GDGwXGU=
X-Received: by 2002:a17:90b:1649:b0:37f:9ce1:7364 with SMTP id 98e67ed59e1d1-38f9bed3bccmr1589956a91.26.1785398865114;
        Thu, 30 Jul 2026 01:07:45 -0700 (PDT)
X-Received: by 2002:a17:90b:1649:b0:37f:9ce1:7364 with SMTP id 98e67ed59e1d1-38f9bed3bccmr1589920a91.26.1785398864592;
        Thu, 30 Jul 2026 01:07:44 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9bab61desm619516a91.13.2026.07.30.01.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:07:43 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v16 3/7] qcom-tgu: Add signal priority support
Date: Thu, 30 Jul 2026 01:07:00 -0700
Message-Id: <20260730080704.2903540-4-songwei.chai@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfX7JD33YLU8QZI
 dYGb9k9rWzkq9CwNYdnMWmFnHCfi8ythH4DrCea8lbnyrADSxnsS5y4urvYvxCh/huiWRy4/ie1
 bs0yD/WxVKoLx3wPdMEpxmVyw7LjdSU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NyBTYWx0ZWRfX1klb6Z9Wwvmd
 yLZNL6i0XAMzPQIr4Z8bvC0/lm2upNnsile+RkjiUhUs1ZeyejSaighixArymprftKLYgDPUYXR
 UtnAsgO0tWxJnfdmrszk3JP7c5PSV9YGWW9zKskSLN9ACN2j7Pwkn7RDoRsDFRO/EGwLFVgYpEZ
 N6/OLQwEHeX29yRIqcCa949Z/RjpF588C/aRuuCjZLw9vNXGCJ6lHTpJw51skxZmZ5e6Jy+WrwN
 BqM706Z0Gc/nbk11R9l5MWEN3ZkEf3WuL3ub7VnKJYwbIT+4HdcMBQaJy1nyb464IxFWNrAAd46
 zETVoyoiYmMXZdFAfI4xUocy6kQXTHorOtlkEYHM3z6l9/+6cMMsh1V952kfjHbqV2zoIJl6y8+
 z+OVRnVdE51UUPudGaaVf5SNxP48iU1/SVsH8r+eb6l4I6i1W2xL3PbCqDtVjEjYMpKewUwUdwI
 yRXrx6UFyriJ0SrCfcw==
X-Proofpoint-GUID: kpE1R-rn1tciYxJF5NXa_KCW5G13i9NX
X-Proofpoint-ORIG-GUID: kpE1R-rn1tciYxJF5NXa_KCW5G13i9NX
X-Authority-Analysis: v=2.4 cv=OcOoyBTY c=1 sm=1 tr=0 ts=6a6b0652 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=7NaxV6__UKHXnA8LOuoA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300057

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
 drivers/hwtracing/qcom/tgu.c                  | 189 +++++++++++++++++-
 drivers/hwtracing/qcom/tgu.h                  | 133 ++++++++++++
 3 files changed, 328 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
index 36ab64f1e301..7dd24314592d 100644
--- a/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
@@ -7,3 +7,10 @@ Description:
 		Accepts only one of the 2 values -  0 or 1.
 		0 : disable TGU.
 		1 : enable TGU.
+
+What:		/sys/bus/amba/devices/<tgu-name>/step[0:7]_priority[0:3]/reg[0:17]
+Date:		August 2026
+KernelVersion:	7.2
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(RW) Set/Get the sensed signal with specific step and priority for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index 9c7dd4a09f02..0e88b437f191 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -15,14 +15,144 @@
 
 #include "tgu.h"
 
+static int calculate_array_location(struct tgu_drvdata *drvdata,
+				    int step_index, int operation_index,
+				    int reg_index)
+{
+	return operation_index * (drvdata->num_step) * (drvdata->num_reg) +
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
+					 tgu_attr->operation_index,
+					 tgu_attr->reg_num);
+
+	/*
+	 * Serialise against tgu_dataset_store() and tgu_enable(), which read
+	 * and write the same priority array, so the value is not observed
+	 * while being updated concurrently.
+	 */
+	guard(mutex)(&drvdata->lock);
+
+	return sysfs_emit(buf, "0x%x\n",
+			  drvdata->value_table->priority[index]);
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
+					 tgu_attr->operation_index,
+					 tgu_attr->reg_num);
+
+	tgu_drvdata->value_table->priority[index] = val;
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
 	TGU_UNLOCK(drvdata->base);
+	for (i = 0; i < drvdata->num_step; i++) {
+		for (j = 0; j < MAX_PRIORITY; j++) {
+			for (k = 0; k < drvdata->num_reg; k++) {
+				index = calculate_array_location(
+							drvdata, i, j, k);
+
+				writel(drvdata->value_table->priority[index],
+					drvdata->base +
+					PRIORITY_REG_STEP(i, j, k));
+			}
+		}
+	}
 	/* Enable TGU to program the triggers */
 	writel(1, drvdata->base + TGU_CONTROL);
 	TGU_LOCK(drvdata->base);
 }
 
+static void tgu_set_reg_number(struct tgu_drvdata *drvdata)
+{
+	int num_sense_input;
+	int num_reg;
+	u32 devid;
+
+	devid = readl(drvdata->base + TGU_DEVID);
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
+
+	drvdata->num_reg = num_reg;
+}
+
+static void tgu_set_steps(struct tgu_drvdata *drvdata)
+{
+	u32 devid;
+
+	devid = readl(drvdata->base + TGU_DEVID);
+
+	drvdata->num_step = TGU_DEVID_STEPS(devid);
+
+	if (drvdata->num_step > TGU_MAX_STEPS) {
+		dev_warn(drvdata->dev,
+			"DEVID reports %d steps, clamping to %d\n",
+			drvdata->num_step, TGU_MAX_STEPS);
+		drvdata->num_step = TGU_MAX_STEPS;
+	}
+}
+
 static void tgu_enable(struct tgu_drvdata *drvdata)
 {
 	tgu_write_all_hw_regs(drvdata);
@@ -104,6 +234,38 @@ static const struct attribute_group tgu_common_grp = {
 
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
 
@@ -111,6 +273,8 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct device *dev = &adev->dev;
 	struct tgu_drvdata *drvdata;
+	unsigned int *priority;
+	size_t priority_size;
 	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
@@ -128,8 +292,31 @@ static int tgu_probe(struct amba_device *adev, const struct amba_id *id)
 	if (ret)
 		return ret;
 
-	drvdata->enabled = false;
+	tgu_set_reg_number(drvdata);
+	tgu_set_steps(drvdata);
+
+	drvdata->value_table =
+		devm_kzalloc(dev, sizeof(*drvdata->value_table), GFP_KERNEL);
+	if (!drvdata->value_table)
+		return -ENOMEM;
 
+	priority_size = MAX_PRIORITY * drvdata->num_reg * drvdata->num_step;
+
+	priority = devm_kcalloc(dev, priority_size,
+				sizeof(*drvdata->value_table->priority),
+				GFP_KERNEL);
+	if (!priority)
+		return -ENOMEM;
+
+	drvdata->value_table->priority = priority;
+
+	drvdata->enabled = false;
+	/*
+	 * Create the sysfs groups only after the backing storage is fully
+	 * allocated, otherwise userspace could open a priority attribute and
+	 * have tgu_dataset_show() dereference an uninitialised value_table.
+	 * This also keeps the error paths above free of sysfs teardown.
+	 */
 	ret = sysfs_create_groups(&dev->kobj, tgu_attr_groups);
 	if (ret) {
 		dev_err(dev, "failed to create sysfs groups: %d\n", ret);
diff --git a/drivers/hwtracing/qcom/tgu.h b/drivers/hwtracing/qcom/tgu.h
index ebba49402a20..7a3e1161c4cf 100644
--- a/drivers/hwtracing/qcom/tgu.h
+++ b/drivers/hwtracing/qcom/tgu.h
@@ -6,10 +6,137 @@
 #ifndef _QCOM_TGU_H
 #define _QCOM_TGU_H
 
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
 /* Register addresses */
 #define TGU_CONTROL		0x0000
 #define TGU_LAR		0xfb0
 #define TGU_UNLOCK_OFFSET	0xc5acce55
+#define TGU_DEVID		0xfc8
+
+#define TGU_DEVID_SENSE_INPUT(devid_val) \
+	((int)FIELD_GET(GENMASK(17, 10), devid_val))
+#define TGU_DEVID_STEPS(devid_val) \
+	((int)FIELD_GET(GENMASK(6, 3), devid_val))
+#define TGU_BITS_PER_SIGNAL 4
+#define LENGTH_REGISTER 32
+
+/*
+ *  TGU configuration space                              Step configuration
+ *  offset table                                         space layout
+ * x-------------------------x$                          x-------------x$
+ * |                         |$                          |             |$
+ * |                         |                           |   reserve   |$
+ * |                         |                           |             |$
+ * |coresight management     |                           |-------------|base+n*0x1D8+0x1F4$
+ * |     registers           |                     |---> |priority[3]  |$
+ * |                         |                     |     |-------------|base+n*0x1D8+0x194$
+ * |                         |                     |     |priority[2]  |$
+ * |-------------------------|                     |     |-------------|base+n*0x1D8+0x134$
+ * |                         |                     |     |priority[1]  |$
+ * |         step[7]         |                     |     |-------------|base+n*0x1D8+0xD4$
+ * |-------------------------|->base+0x40+7*0x1D8  |     |priority[0]  |$
+ * |                         |                     |     |-------------|base+n*0x1D8+0x74$
+ * |         ...             |                     |     |  condition  |$
+ * |                         |                     |     |   select    |$
+ * |-------------------------|->base+0x40+1*0x1D8  |     |-------------|base+n*0x1D8+0x60$
+ * |                         |                     |     |  condition  |$
+ * |         step[0]         |-------------------->      |   decode    |$
+ * |-------------------------|-> base+0x40               |-------------|base+n*0x1D8+0x50$
+ * |                         |                           |             |$
+ * | Control and status space|                           |Timer/Counter|$
+ * |        space            |                           |             |$
+ * x-------------------------x->base                     x-------------x base+n*0x1D8+0x40$
+ *
+ */
+#define STEP_OFFSET 0x1D8
+#define PRIORITY_START_OFFSET 0x0074
+#define PRIORITY_OFFSET 0x60
+#define REG_OFFSET 0x4
+
+/*
+ * Upper bounds on the DEVID/DEVID2-derived per-region counts. The TGU register
+ * layout is fixed by the offset macros above and mirrored by the static sysfs
+ * attribute tables in tgu.c, so these are the largest counts the driver can
+ * both address within the mapped window and expose to userspace:
+ *
+ *   TGU_MAX_STEPS            static tables define step0..step7
+ *   TGU_MAX_PRIORITY_REGS    STEP_PRIORITY_LIST defines reg0..reg17
+ *
+ * A device whose DEVID reports counts above these bounds is clamped, so writes
+ * never fall outside the ioremap()'d window or spill into an adjacent region.
+ */
+
+#define TGU_MAX_STEPS                  8
+#define TGU_MAX_PRIORITY_REGS          18
+
+/* Calculate compare step addresses */
+#define PRIORITY_REG_STEP(step, priority, reg)\
+	(PRIORITY_START_OFFSET + PRIORITY_OFFSET * priority +\
+	 REG_OFFSET * reg + STEP_OFFSET * step)
+
+#define tgu_dataset_rw(name, step_index, type, reg_num)                  \
+	(&((struct tgu_attribute[]){ {                                   \
+		__ATTR(name, 0644, tgu_dataset_show, tgu_dataset_store), \
+		step_index,                                              \
+		type,                                                    \
+		reg_num,                                                 \
+	} })[0].attr.attr)
+
+#define STEP_PRIORITY(step_index, reg_num, priority)                     \
+	tgu_dataset_rw(reg##reg_num, step_index, TGU_PRIORITY##priority, \
+			reg_num)
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
+enum operation_index {
+	TGU_PRIORITY0,
+	TGU_PRIORITY1,
+	TGU_PRIORITY2,
+	TGU_PRIORITY3,
+};
+
+/* Maximum priority that TGU supports */
+#define MAX_PRIORITY 4
+
+struct tgu_attribute {
+	struct device_attribute attr;
+	u32 step_index;
+	enum operation_index operation_index;
+	u32 reg_num;
+};
+
+struct value_table {
+	unsigned int *priority;
+};
 
 static inline void TGU_LOCK(void __iomem *addr)
 {
@@ -36,6 +163,9 @@ static inline void TGU_UNLOCK(void __iomem *addr)
  * @lock: Mutex serialising enable/disable and the associated PM runtime
  *        reference counting against concurrent sysfs access
  * @enabled: Flag indicating whether the TGU device is enabled
+ * @value_table: Store given value based on relevant parameters
+ * @num_reg: Maximum number of registers
+ * @num_step: Maximum step size
  *
  * This structure defines the data associated with a TGU device,
  * including its base address, device pointer, the lock serialising
@@ -46,6 +176,9 @@ struct tgu_drvdata {
 	struct device *dev;
 	struct mutex lock;
 	bool enabled;
+	struct value_table *value_table;
+	int num_reg;
+	int num_step;
 };
 
 #endif
-- 
2.34.1

