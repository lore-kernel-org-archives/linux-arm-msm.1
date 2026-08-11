Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EEA3644C6
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786441583; cv=none; b=k15Da6C8iMcCa4I1xr3tLsqpqshkLjxGId/EgyZWAIqf7ZtGmiKHyo8ZLm2Iw2qKzYaDqL/xFUwbCMyneYHbQW5GKlHCw11MdpEVBV6qt6kK3iEk83FjAHCW/4IgNOZgRy5n+JxMNG2XObBhJu548ll93eYX9oyzlEgKeYVqmQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786441583; c=relaxed/simple;
	bh=OMNevDvhMcis5O22xApY+5O5QE7bco1vpPGVJ+Pb1Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TWjpuO2S1SA5y2qSPk1qIN+zIe+Kv/DB1nPjJsYbP5sTtx781+EGzvd3thkrdK+ADP+gw6k5D5zAzcznNVS7Px2NiqEOjd+PlSspSyU3dDw4OGukB/tGgntW78viS+mpM65v1KweR0G4ZI/T8IvoEuPL/vtJChF/ukn9tZG2KZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lladdjqW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Slu+T8Nj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lladdjqW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Slu+T8Nj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B9Zw953320729
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=80mm8iOe8jpXLDOCqE2m5dnQFEeUyUgRrqY
	MSuqzzjU=; b=lladdjqW9kWMujpwJHtb9p2qJvKaJ0b06vVhNt8d86CmDR7ZJlF
	DPfsbAtOzf16vw/9YW/U/Zb3zcve4mQUcO8PbfKH/YO9anDpkhKmg6WJ0u1RLNRk
	LZdo6SR3KBK2E1mfbb4PPtmNUCfhMXugTGfhYlht9gF+q4s7As7v3QzADrnX0jdc
	7vTKuITwiZJqvpRthLEWnLSaf4294WdG3fDAG2t/tGaG9gS2vdiR5BYjBnkc330R
	MWTRcLGczgnjBhZ2n4fvuRsO0/dSANp8GrH/JiBa6MwFi8IDgH7eh8nkUpz3z8Mv
	3QepP4YjZUVRckHKdZGzZAixtuod17Xs11w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyvcr97kg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:46:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso37044601cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 02:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786441579; x=1787046379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=80mm8iOe8jpXLDOCqE2m5dnQFEeUyUgRrqYMSuqzzjU=;
        b=Slu+T8NjaPgF2qjVnCur4KBf1T9M/GZrqgfVedEc5tA5Rx8fsKQIqgowjqMn+UKSsi
         M1+W+JSpvbbhNzEALQYDVrH7ayCY49w21mcNdSlyCzCUvPlESOkOi9WkzuVe/bNU9iJS
         2DAuSkd+FdwN0fLmVi2jxnLjcTC8P/GusZY9Dutk+ScEAH8kvoPByYxqXkXESOfQnR4F
         EDkDo0KHiCBeOLyU8zV/eNT7kHjN/sKP5D7m78PbJw9RZ7ooOV7tmCxdBYxZV0esb91k
         elHxN5QZ1bT1inZMTy91GznineiWbvtzj4WWM/4VrkG49WtzKqcmngBH6xpD95h7yal9
         qmaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786441579; x=1787046379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80mm8iOe8jpXLDOCqE2m5dnQFEeUyUgRrqYMSuqzzjU=;
        b=ivPwPCuFp3fs2/gdmNp1ceAtkVDr2L/+CUW72ftFCInzllB/cfp+sEYEEZRHQlklRE
         E7Jr658H7PC9WLQ9wlFRL0sIr7qnYmFLoy92a/dWGxQ4lng/AsC1Vr41uttPAxKWf7SW
         O9NmTTu2l2i++ySt6Cs4Qdu/wrbLuuvd6SwkHtaf3oNntdAfx/7NgBkdHl1Y/okb1dY+
         oio9MMks9LuoJ1ctq1RKZMSisaF1ZihuIM2QCUrvr/4Vq1MCR6EwhAlJSMWyj0aYg4NY
         GwUwGHsTd1pPvVjBAvTqslfl9v9H4dn66ihsAXcOjV692qVVFX8tGU4prByZb+uLWV4Y
         OwVA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4lTuvcyXz2IzKLE+w8DfhvJS5MZLoty8+N9MF70REj+JPONXjucn0Z43eYMJjdmEIHvOD275v/rwRHgab@vger.kernel.org
X-Gm-Message-State: AOJu0YzOMdR63mjSrYfv46HIcwhKbE9NWJsBR8uZsmecqEL4pvnoHS8y
	gzF5fFvSr2fMUiwhmLDdGGjjeXOMNZsAGJuvnCrU2v03YS8YnIwpjRKrqYbS0pswI0E0Ze7mPKL
	dKQB/hfgwW+vCA1XfuIYy4+I5hE031Htscv0EwktkHOBR7uvpOb/37O4nBPYWP2p/LzQ0
X-Gm-Gg: AR+sD13kBs1n9UzDvheVrbsZcvzC0IxuWFYvDbYNYk6ho01Av/SsVpgWcm780EwZLpV
	BGG+qLTuxG3y3wyM2VzdZGic7P6Eu/UqcwvinXITh5RpEF0iuvReyIMWOccBct/w95Gt/EZ3rtg
	jXUrMpnQuEMc/D7031bqvt/4jN9xK0BflAoWIeIiJD8c/gyTtYB/ZWXmQ8xatp1ZznPLZ8k5KST
	APqmFEeSZoXf06iASLP1Fb55zeyf/GNU+jXPsLGTvESqUG24YpIyzaaN4uAsTBfHfMff1SawfE0
	uBAZZ23PHiTSfDH4pz6wjCH89lTGsEJs6f9Dc5/qOnyHyTql1HiaTqRDejg8N47yAGs7BVBdNX4
	fr8JQ+Zr6czpU9cbdqTU1
X-Received: by 2002:a05:622a:229c:b0:51b:eb07:28bf with SMTP id d75a77b69052e-52d585e2bf8mr15481371cf.22.1786441579353;
        Tue, 11 Aug 2026 02:46:19 -0700 (PDT)
X-Received: by 2002:a05:622a:229c:b0:51b:eb07:28bf with SMTP id d75a77b69052e-52d585e2bf8mr15481001cf.22.1786441578759;
        Tue, 11 Aug 2026 02:46:18 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:b467:f322:cd3a:615c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499788f13cbsm34090065e9.9.2026.08.11.02.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:46:17 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
X-Google-Original-From: Daniel Lezcano <daniel.lezcano@kernel.org>
To: rafael@kernel.org, daniel.lezcano@kernel.org
Cc: broonie@kernel.org, jishnu.prakash@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST)
Subject: [PATCH] thermal/drivers/qcom: Fix missing spmi adc tm5 gen3 file
Date: Tue, 11 Aug 2026 11:45:43 +0200
Message-ID: <20260811094544.2939556-1-daniel.lezcano@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4MCBTYWx0ZWRfX87GeDU5gN0C4
 QNmzYMEkunU0OsIUUlPtcWf/dpKv0SALkBzhmg6NhDGJzZwzjreI3NfZVaIPNLeqOf+LX6sEvV3
 fbH3lddRkrW/O4Y6XUIgBdZs6cok2Pa/s9b4jdtrqasje/RcP2XXNp4k52J00GDwkNTP+YMwRxM
 4aXXc+tvLO0FjGeXsz/7PEiIo5cpkhyxFLVv6VN+OUEsYAj6lDyX2qbWZhtRlFgCeW+u8nCQvsO
 1mWZ6Uosje86FeeDGTFLUyI/fZTxPymO/KYqihQ7MU+6OSmYvIgEbz2E41srmzG5gauy7JxFFLE
 G3RuANLm8VbRSblt0lQnMx5HtxjuiWjNhub4RCfxnUuAsXE9Mg0GSTrPeeYvf6eZEEJmW2nSKci
 Kix5wpBANqnt/71bM+NNcDKizxrpITa4mPBFZt++oPHMmA2R9f6KKnMCkHdX1XKlO96lqTErQdx
 05nICPk2dziuHxr/w/A==
X-Authority-Analysis: v=2.4 cv=e/A2j6p/ c=1 sm=1 tr=0 ts=6a7aef6c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=ZVc0D3mHhM71BAnTMaoA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: JrmhmgpgMGM9p3u9aPu0qDXBWUYluThr
X-Proofpoint-ORIG-GUID: JrmhmgpgMGM9p3u9aPu0qDXBWUYluThr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4MCBTYWx0ZWRfX89BfFP9HNi5t
 P6V73qMV+aZ5V8WNVfgsBUP7vdqM8Efn7cQfj7UG+A6pyYLdNsy8DmFZx0CO2DR8w+yzo3HezZB
 mua5NVdZuCO6mJOYZia31gBDMaptS8M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110080

From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Add missing file resulting from a manual application of the change
below after fixing a conflict in the Makefile.

Fixes: 948ee3a74f35 ("add support for PMIC5 Gen3 ADC thermal monitoring")
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c | 434 ++++++++++++++++++
 1 file changed, 434 insertions(+)
 create mode 100644 drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c

diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
new file mode 100644
index 000000000000..9cf552d36868
--- /dev/null
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
@@ -0,0 +1,434 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/container_of.h>
+#include <linux/device/devres.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/iio/adc/qcom-adc5-gen3-common.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/thermal.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+#include "../thermal_hwmon.h"
+
+#define ADC_TM5_GEN3_CONFIG_REGS 12
+
+struct device;
+struct adc_tm5_gen3_chip;
+
+/**
+ * struct adc_tm5_gen3_channel_props - ADC_TM channel structure
+ * @common_props: structure with common ADC channel properties.
+ * @chip: ADC TM device.
+ * @tzd: pointer to thermal device corresponding to TM channel.
+ * @sdam_index: SDAM on which this TM channel lies.
+ * @timer: time period of recurring TM measurement.
+ * @tm_chan_index: TM channel number used.
+ * @high_thr_en: TM high threshold crossing detection enabled.
+ * @low_thr_en: TM low threshold crossing detection enabled.
+ */
+struct adc_tm5_gen3_channel_props {
+	struct adc5_channel_common_prop common_props;
+	struct adc_tm5_gen3_chip *chip;
+	struct thermal_zone_device *tzd;
+	unsigned int sdam_index;
+	unsigned int timer;
+	unsigned int tm_chan_index;
+	bool high_thr_en;
+	bool low_thr_en;
+};
+
+/**
+ * struct adc_tm5_gen3_chip - ADC Thermal Monitoring device structure
+ * @dev_data: Top-level ADC device data.
+ * @chan_props: Array of ADC_TM channel structures.
+ * @dev: SPMI ADC5 Gen3 device.
+ * @nchannels: number of TM channels allocated
+ */
+struct adc_tm5_gen3_chip {
+	struct adc5_device_data *dev_data;
+	struct adc_tm5_gen3_channel_props *chan_props;
+	struct device *dev;
+	unsigned int nchannels;
+};
+
+DEFINE_GUARD(adc5_gen3, struct adc_tm5_gen3_chip *,
+	     adc5_gen3_mutex_lock(_T->dev), adc5_gen3_mutex_unlock(_T->dev))
+
+static int get_sdam_from_irq(struct adc_tm5_gen3_chip *adc_tm5, int irq)
+{
+	for (int i = 0; i < adc_tm5->dev_data->num_sdams; i++) {
+		if (adc_tm5->dev_data->base[i].irq == irq)
+			return i;
+	}
+	return -ENOENT;
+}
+
+static irqreturn_t adctm5_gen3_isr(int irq, void *dev_id)
+{
+	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
+	int ret, sdam_num;
+	u8 tm_status[2];
+	u8 status, val;
+
+	sdam_num = get_sdam_from_irq(adc_tm5, irq);
+	if (sdam_num < 0)
+		return IRQ_NONE;
+
+	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_STATUS1,
+			     &status, sizeof(status));
+	if (ret)
+		return IRQ_NONE;
+
+	if (status & ADC5_GEN3_STATUS1_CONV_FAULT) {
+		val = ADC5_GEN3_CONV_ERR_CLR_REQ;
+		adc5_gen3_status_clear(adc_tm5->dev_data, sdam_num,
+				       ADC5_GEN3_CONV_ERR_CLR, &val, 1);
+		return IRQ_HANDLED;
+	}
+
+	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_TM_HIGH_STS,
+			     tm_status, sizeof(tm_status));
+	if (ret)
+		return IRQ_NONE;
+
+	if (tm_status[0] || tm_status[1])
+		return IRQ_WAKE_THREAD;
+
+	return IRQ_NONE;
+}
+
+static irqreturn_t adctm5_gen3_isr_thread(int irq, void *dev_id)
+{
+	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
+	u8 tm_status[2];
+	int sdam_index;
+
+	sdam_index = get_sdam_from_irq(adc_tm5, irq);
+	if (sdam_index < 0)
+		return IRQ_NONE;
+
+	scoped_guard(adc5_gen3, adc_tm5) {
+		int ret;
+
+		ret = adc5_gen3_read(adc_tm5->dev_data, sdam_index, ADC5_GEN3_TM_HIGH_STS,
+				     tm_status, sizeof(tm_status));
+		if (ret)
+			return IRQ_NONE;
+
+		ret = adc5_gen3_status_clear(adc_tm5->dev_data, sdam_index,
+					     ADC5_GEN3_TM_HIGH_STS_CLR, tm_status,
+					     sizeof(tm_status));
+		if (ret)
+			return IRQ_NONE;
+	}
+
+	for (int i = 0; i < adc_tm5->nchannels; i++) {
+		struct adc_tm5_gen3_channel_props *chan_prop = &adc_tm5->chan_props[i];
+		int offset = chan_prop->tm_chan_index;
+		bool upper_set, lower_set;
+
+		if (chan_prop->sdam_index != sdam_index)
+			continue;
+
+		upper_set = ((tm_status[0] & BIT(offset)) && chan_prop->high_thr_en);
+		lower_set = ((tm_status[1] & BIT(offset)) && chan_prop->low_thr_en);
+
+		if (!(upper_set || lower_set))
+			continue;
+
+		thermal_zone_device_update(chan_prop->tzd, THERMAL_TRIP_VIOLATED);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int adc_tm5_gen3_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct adc_tm5_gen3_channel_props *prop = thermal_zone_device_priv(tz);
+	struct adc_tm5_gen3_chip *adc_tm5;
+
+	if (!prop || !prop->chip)
+		return -EINVAL;
+
+	adc_tm5 = prop->chip;
+
+	return adc5_gen3_get_scaled_reading(adc_tm5->dev, &prop->common_props, temp);
+}
+
+static int adc_tm5_gen3_disable_channel(struct adc_tm5_gen3_channel_props *prop)
+{
+	struct adc_tm5_gen3_chip *adc_tm5 = prop->chip;
+	int ret;
+	u8 val;
+
+	prop->high_thr_en = false;
+	prop->low_thr_en = false;
+
+	ret = adc5_gen3_poll_wait_hs(adc_tm5->dev_data, prop->sdam_index);
+	if (ret)
+		return ret;
+
+	val = BIT(prop->tm_chan_index);
+	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			      ADC5_GEN3_TM_HIGH_STS_CLR, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			      ADC5_GEN3_TM_LOW_STS_CLR, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	val = MEAS_INT_DISABLE;
+	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			      ADC5_GEN3_TIMER_SEL, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	/* To indicate there is an actual conversion request */
+	val = ADC5_GEN3_CHAN_CONV_REQ | prop->tm_chan_index;
+	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			      ADC5_GEN3_PERPH_CH, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	val = ADC5_GEN3_CONV_REQ_REQ;
+	return adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			       ADC5_GEN3_CONV_REQ, &val, sizeof(val));
+}
+
+static int adc_tm5_gen3_configure(struct adc_tm5_gen3_channel_props *prop,
+				  int low_temp, int high_temp)
+{
+	struct adc_tm5_gen3_chip *adc_tm5 = prop->chip;
+	u8 buf[ADC_TM5_GEN3_CONFIG_REGS];
+	u8 conv_req;
+	u16 adc_code;
+	int ret;
+
+	ret = adc5_gen3_poll_wait_hs(adc_tm5->dev_data, prop->sdam_index);
+	if (ret < 0)
+		return ret;
+
+	ret = adc5_gen3_read(adc_tm5->dev_data, prop->sdam_index,
+			     ADC5_GEN3_SID, buf, sizeof(buf));
+	if (ret < 0)
+		return ret;
+
+	/* Write SID */
+	buf[0] = FIELD_PREP(ADC5_GEN3_SID_MASK, prop->common_props.sid);
+
+	/* Select TM channel and indicate there is an actual conversion request */
+	buf[1] = ADC5_GEN3_CHAN_CONV_REQ | prop->tm_chan_index;
+
+	buf[2] = prop->timer;
+
+	/* Digital param selection */
+	adc5_gen3_update_dig_param(&prop->common_props, &buf[3]);
+
+	/* Update fast average sample value */
+	buf[4] = FIELD_PREP(ADC5_GEN3_FAST_AVG_CTL_SAMPLES_MASK,
+			    prop->common_props.avg_samples) | ADC5_GEN3_FAST_AVG_CTL_EN;
+
+	/* Select ADC channel */
+	buf[5] = prop->common_props.channel;
+
+	/* Select HW settle delay for channel */
+	buf[6] = FIELD_PREP(ADC5_GEN3_HW_SETTLE_DELAY_MASK,
+			    prop->common_props.hw_settle_time_us);
+
+	buf[7] = 0;
+
+	/* High temperature corresponds to low voltage threshold */
+	prop->low_thr_en = (high_temp != INT_MAX);
+	if (prop->low_thr_en) {
+		adc_code = qcom_adc_tm5_gen2_temp_res_scale(high_temp);
+		put_unaligned_le16(adc_code, &buf[8]);
+		buf[7] |= ADC5_GEN3_LOW_THR_INT_EN;
+	}
+
+	/* Low temperature corresponds to high voltage threshold */
+	prop->high_thr_en = (low_temp != -INT_MAX);
+	if (prop->high_thr_en) {
+		adc_code = qcom_adc_tm5_gen2_temp_res_scale(low_temp);
+		put_unaligned_le16(adc_code, &buf[10]);
+		buf[7] |= ADC5_GEN3_HIGH_THR_INT_EN;
+	}
+
+	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index, ADC5_GEN3_SID,
+			      buf, sizeof(buf));
+	if (ret < 0)
+		return ret;
+
+	conv_req = ADC5_GEN3_CONV_REQ_REQ;
+	return adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
+			       ADC5_GEN3_CONV_REQ, &conv_req, sizeof(conv_req));
+}
+
+static int adc_tm5_gen3_set_trip_temp(struct thermal_zone_device *tz,
+				      int low_temp, int high_temp)
+{
+	struct adc_tm5_gen3_channel_props *prop = thermal_zone_device_priv(tz);
+	struct adc_tm5_gen3_chip *adc_tm5;
+
+	if (!prop || !prop->chip)
+		return -EINVAL;
+
+	adc_tm5 = prop->chip;
+
+	dev_dbg(adc_tm5->dev, "channel:%s, low_temp(mdegC):%d, high_temp(mdegC):%d\n",
+		prop->common_props.label, low_temp, high_temp);
+
+	guard(adc5_gen3)(adc_tm5);
+
+	return adc_tm5_gen3_configure(prop, low_temp, high_temp);
+}
+
+static const struct thermal_zone_device_ops adc_tm_ops = {
+	.get_temp = adc_tm5_gen3_get_temp,
+	.set_trips = adc_tm5_gen3_set_trip_temp,
+};
+
+static int adc_tm5_register_tzd(struct adc_tm5_gen3_chip *adc_tm5)
+{
+	struct thermal_zone_device *tzd;
+	unsigned int channel;
+	int ret;
+
+	for (int i = 0; i < adc_tm5->nchannels; i++) {
+		channel = ADC5_GEN3_V_CHAN(adc_tm5->chan_props[i].common_props);
+		tzd = devm_thermal_of_zone_register(adc_tm5->dev, channel,
+						    &adc_tm5->chan_props[i],
+						    &adc_tm_ops);
+		if (IS_ERR(tzd)) {
+			if (PTR_ERR(tzd) == -ENODEV) {
+				dev_dbg(adc_tm5->dev,
+					"thermal sensor on channel %d is not used\n",
+					channel);
+				continue;
+			}
+			return PTR_ERR(tzd);
+		}
+		adc_tm5->chan_props[i].tzd = tzd;
+		ret = devm_thermal_add_hwmon_sysfs(adc_tm5->dev, tzd);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void adc5_gen3_disable(void *data)
+{
+	struct adc_tm5_gen3_chip *adc_tm5 = data;
+
+	guard(adc5_gen3)(adc_tm5);
+
+	/* Disable all available TM channels */
+	for (int i = 0; i < adc_tm5->nchannels; i++)
+		adc_tm5_gen3_disable_channel(&adc_tm5->chan_props[i]);
+}
+
+static int adc_tm5_probe(struct auxiliary_device *aux_dev,
+			 const struct auxiliary_device_id *id)
+{
+	struct adc_tm5_gen3_chip *adc_tm5;
+	struct tm5_aux_dev_wrapper *aux_dev_wrapper;
+	struct device *dev = &aux_dev->dev;
+	int ret;
+
+	adc_tm5 = devm_kzalloc(dev, sizeof(*adc_tm5), GFP_KERNEL);
+	if (!adc_tm5)
+		return -ENOMEM;
+
+	aux_dev_wrapper = container_of(aux_dev, struct tm5_aux_dev_wrapper, aux_dev);
+
+	adc_tm5->dev = dev;
+	adc_tm5->dev_data = aux_dev_wrapper->dev_data;
+	adc_tm5->nchannels = aux_dev_wrapper->n_tm_channels;
+	adc_tm5->chan_props = devm_kcalloc(dev, aux_dev_wrapper->n_tm_channels,
+					   sizeof(*adc_tm5->chan_props), GFP_KERNEL);
+	if (!adc_tm5->chan_props)
+		return -ENOMEM;
+
+	for (int i = 0; i < adc_tm5->nchannels; i++) {
+		/*
+		 * Since the first channel of the first SDAM is reserved for
+		 * immediate ADC conversions, TM channel count must start from
+		 * the channel just after it. The variable tm_count is used to
+		 * calculate SDAM and TM channel index on that SDAM correctly
+		 * for each TM channel.
+		 */
+		int tm_count = i + 1;
+
+		adc_tm5->chan_props[i].common_props = aux_dev_wrapper->tm_props[i];
+		adc_tm5->chan_props[i].timer = MEAS_INT_1S;
+		adc_tm5->chan_props[i].sdam_index = tm_count / 8;
+		adc_tm5->chan_props[i].tm_chan_index = tm_count % 8;
+		adc_tm5->chan_props[i].chip = adc_tm5;
+	}
+
+	/*
+	 * ADC_TM channels are enabled in the loop in adc_tm5_register_tzd() as
+	 * part of the set_trips calls during thermal zone registration. This
+	 * action is to disable them all in case of probe failure.
+	 */
+	ret = devm_add_action(dev, adc5_gen3_disable, adc_tm5);
+	if (ret)
+		return ret;
+
+	ret = adc_tm5_register_tzd(adc_tm5);
+	if (ret)
+		return ret;
+
+	for (int i = 0; i < adc_tm5->dev_data->num_sdams; i++) {
+		u32 irq_flags = IRQF_ONESHOT;
+
+		/*
+		 * First SDAM's interrupt is shared between main ADC driver and
+		 * auxiliary TM driver, so its flags must include IRQF_SHARED.
+		 * This is not needed for other SDAMs as they will be used only
+		 * for TM functionality.
+		 */
+		if (i == 0)
+			irq_flags |= IRQF_SHARED;
+
+		ret = devm_request_threaded_irq(dev,
+						adc_tm5->dev_data->base[i].irq,
+						adctm5_gen3_isr,
+						adctm5_gen3_isr_thread,
+						irq_flags,
+						adc_tm5->dev_data->base[i].irq_name,
+						adc_tm5);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct auxiliary_device_id adctm5_auxiliary_id_table[] = {
+	{ .name = "qcom_spmi_adc5_gen3.adc5_tm_gen3" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, adctm5_auxiliary_id_table);
+
+static struct auxiliary_driver adctm5gen3_auxiliary_driver = {
+	.id_table = adctm5_auxiliary_id_table,
+	.probe = adc_tm5_probe,
+};
+module_auxiliary_driver(adctm5gen3_auxiliary_driver);
+
+MODULE_DESCRIPTION("SPMI PMIC Thermal Monitor ADC driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("QCOM_SPMI_ADC5_GEN3");
-- 
2.43.0

