Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD6D3B3C03
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534657; cv=none; b=iUsNtqWtxb1+CVkxM7AL4keF+I/kGFD0LWwy8UxsXZUSmyI98MNes8hKU1j81UuZhnv1vOhGS3ZQ/YLymCssdhR1wbbZzKsrQWI4VJ5Xvty8yGmhf4BYVURdH1FQGvbY0p6Xqot7xC1rT44TSoRg2BeBGAikuBarlzJB7MtJYpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534657; c=relaxed/simple;
	bh=OvZGQdRrKQ1cKCtBZ2vJJlctMXShVHIPX/EnnD1FRmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pA0D6134DmnCw7wMDK+Vy4/SKSyubUVh/7hMYTJwxBMEF+lX7X90kSpuMgZhMsgwxP3MqVgCcsR8zNtmpu0MZH8tZEvGjqrq4Tm+jmxsMzLUMT+adPzq59XWtfeWyYfsNoj+mI9E6FGXWyjcO8GTPLqwXvzu/lN6aloIm12IM/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fD1FRDv5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTAufNRO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fD1FRDv5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTAufNRO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7rfZo2979892
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rBvoXcE6fyfh67dFVJmu8Fy0oBNY0thH0kUQWM4o/d4=; b=fD1FRDv5ltTwAYzp
	9AyJ8FEUcIOia4aZfjdkyZps3qII9mesgGOHSH+XfJgTjXjT/LarOKF5fvVSvtB6
	yJ3udarldBb4pT7KhZaobbweLzIAI0TEMe0Y65+4G4Ff6VXRRDabZ7kDh8468Mc6
	oI5zVEVtxa4K18sR8T7VMUj9ffYGrLzexk0yfqNl6hwFMYm0KgiL86ASBNl7vW/e
	qaIe05UEsXd6cjkPww9ONxeuRRZ3K5LgqLBWm1Ggzq3Axiqsyadq6/2tK7QlFij+
	IM3l9mq1MltLxgH4ncZ85zP+MMNXKpXdyfyBLcBBWs8qpciZkDrkPc6I3WcKx7f7
	KvBu+A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfpg015q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso204019641cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784534654; x=1785139454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBvoXcE6fyfh67dFVJmu8Fy0oBNY0thH0kUQWM4o/d4=;
        b=NTAufNROBswr54aO1eaA1syZf1BVbEt4i21uk7gPUcSW2+C9jF9PAYDbprM1z9T6Ui
         FMK4ZbNDuvZc75REb/cHCuA/FSNuJP6WdtHdGdg/UfSc+Fr/nGRsMf8ZUXY8cCzfiC6s
         iRhQqXVgHTe+FCHf+cEFnPyERo7gAbs5iTDqUF4yYzNUXXG7yWbXjt6YwKIaJg1o2MsZ
         M/t1l4WMek3x62otjkO087x0mpkxzV1nayP94LijBa7OhGOV/7Ls0a/9KSaQF0oDC8xk
         JliqFd3kVCNl4r9NsTQBjWRKF/xDihUQ52pn775+lDczaYzcZ4HQ7jvKSpMn1ZgFAN5v
         QbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534654; x=1785139454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBvoXcE6fyfh67dFVJmu8Fy0oBNY0thH0kUQWM4o/d4=;
        b=p3oag71lN0B1CiE7gv8RqU3RIe0I7joF1b0fk5gQIFD00F6/0p84peBD3tiPXMCROI
         2KUMxtATRc0OKm4zyqL7lRPTKd8OSrKVkM/1gr2GheOCP0avEgSnFUSF9TfFrYGDu12L
         Qv6oog37RSfQRqKJRzi2yFwWckybVyBjVbaGIbwseJvWM5UcNplJTuTrRrBnn1BWvKRK
         yOHDO4YTmAaKQoH4gH9RVGchNW64kRKAqYvin+aN5WPL0JsuEkjsFi6P5379ACbWAwcP
         H21WIH+buu5aRZFjXOHp4E4UfbE2CuMhc07WLcUbm9LwBx/YgI61mUIzgdcwPYvi/1IG
         xQsg==
X-Forwarded-Encrypted: i=1; AHgh+RqAXoUt5vb0FgXfZTKne808pm5YWuGL4OAgpvd5+zXVhEubR8R5LtLH7AtQV7xGUVqx6/Cy36ZKuZ+eITsW@vger.kernel.org
X-Gm-Message-State: AOJu0YyilnHyF+LBzsMeamwKPYt5+zbMercq6a7ZoYDIFkgbZu1Fri/9
	bMlHWtWnedjmxW/2B3QQJG/gQBhAJfL9Bnef8jebkJEcFohNfwAMLWsaLODkIFRL1hWFA1MRiAR
	LkTipEcB1f9l0Ni3JJXPaEUlY9dEyl4s+/T+R9NfGFTPUpR4GqWFeQYHt9mQyO8SiarjN2N+NS/
	SRNuw=
X-Gm-Gg: AfdE7ck7lW0HqfUnM3joWE5yTkx7C/cF4SD8tMgqKy+ICjMIZR24jJaxJi16xpCD/Bk
	gbcGrKfLgnO65lOLo3hhczvMhaSQd+YLI0vxqS++OT113duAIwaPhDnSEXqiUCeVI2yS2t5gI0r
	Jfbal3046nl/FI3mu6PTkwqQT/KMBEPVWgx7DaVzY0b9wKxKHIhXyy6XpTlaVTgnSamogcvttiI
	0V9+vnRCKxMFtBWYb+tyDj5VLdhXFAa5KG3ofaue4qRzvRvb6YZdidR5uNhLtha17pbhvyohgT4
	IhpuZCBzQzjoACPFT5wsrsQi5JGUfu1tmIpK4kw4ZqWFqrWIhqEnTVJSor86O2rpygnp93897vz
	xcO5gwbzWetnVzSD7dzT7/RWKkWJnwzO4CkZamv5aNnemnJztGTSwvd11Oxz85RA3ttD84TzxrM
	VY15/8ehki9dYpo+GJl0Lt/pYCskDVOPRB1cj5o3XRjPU4LhNhE5k=
X-Received: by 2002:ac8:7fd5:0:b0:51c:7b13:62f3 with SMTP id d75a77b69052e-5213e67ff0bmr121551211cf.73.1784534653680;
        Mon, 20 Jul 2026 01:04:13 -0700 (PDT)
X-Received: by 2002:ac8:7fd5:0:b0:51c:7b13:62f3 with SMTP id d75a77b69052e-5213e67ff0bmr121550961cf.73.1784534653113;
        Mon, 20 Jul 2026 01:04:13 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm4256542a12.30.2026.07.20.01.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:04:11 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:04:05 +0200
Subject: [PATCH v5 03/11] power: sequencing: Add pwrseq_is_controllable()
 API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-monza-wireless-v5-3-69ec6743543c@oss.qualcomm.com>
References: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
In-Reply-To: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfX8DO8rn/xz6Ue
 pGbzexZFx3LsptrO649jWkZ415UAb1k09Q+2nFRT5lw+7wL/zx6T5DNzkQjE9EJHzVdVtE1G65R
 XyUi0bL+bqbqR9MbzBJH5aSb7mR60Kk=
X-Proofpoint-GUID: 5cObGo8nNxgcYf0XkXGNXOq7LeLVO1UZ
X-Proofpoint-ORIG-GUID: 5cObGo8nNxgcYf0XkXGNXOq7LeLVO1UZ
X-Authority-Analysis: v=2.4 cv=c+6bhx9l c=1 sm=1 tr=0 ts=6a5dd67e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=4a-8Ivk512-2hps7UIkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfX4qm46jQDJkqZ
 EOby6Xmzf3WLqPdwOf+vKKKB0r5Um6yL6FbN30bLLCHXmoLcIQL4dRQ2cMsEYEx13izfKJghEjw
 XkRe5cH3Aeows+as7F7JAms8A43VlSHVvX9lf3bFwIr/jUFm5GJ1pZl7tR0DDzjVPivKO/O2AUz
 tYwOnhbHOBDE8Xp7zABh8Zisz28yeM0xb7Q6vS17KpdLZdMN4Si6MbdICmjLPMUhgH/KCNOOic/
 FFVBnF5f2RZvlDuKx6zjLYsHfjF9uYH6Di0DpN59qUZ3/BXs+bk9OzmVKSww3PkUpdrYln9aytp
 PmzxWf4xAtZuPINGz/4qi7cymoUfrHkjeAVqkV/yz9Bq0bXjcxXrBXGOefNnfVba9fpt8l9+1R9
 hAKsI82VOFhkJ+FrtJQKpWKJaB7nGE7t/+7HS1N3DLBeauRNPOQ9JyqQwOEBUEhsK2XbpCSLCYD
 MrpVD3qOBo4mzSHeeGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200088

On some boards a power sequencing target has no host-controllable enable
for its function, for instance when the enable line is not wired up to a
GPIO and is hardwired to an always-on level. The pcie-m2 "uart" target is
one such example: when the M.2 connector does not route the W_DISABLE2#
signal to a host GPIO, its enable/disable are no-ops and the consumer
cannot gate the Bluetooth function at all or exclusively.

Add a generic pwrseq_is_controllable() helper. It reports whether the
target's final unit provides a host-controllable dedicated power actuator.
The target can implement a new optional is_controllable() callback,
reporting whether that actuator is effective on this target (for example
depending on GPIO presence). If the target does not provide the callback,
it is assumed to be controllable.

Note this only describes the target's own enable actuator. It does not
imply that a power-off reaches an electrical OFF state, since a target may
have multiple consumers. It also does not mean that power is uncontrolled
for the target's dependencies: those may still be gated on their own. And
it does not restrict consumers from calling pwrseq_power_off() either,
which remains valid to drop this consumer's vote on the (possibly shared)
resources and dependencies of the target.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/core.c | 49 +++++++++++++++++++++++++++++++++++++++++
 include/linux/pwrseq/consumer.h |  7 ++++++
 include/linux/pwrseq/provider.h |  8 +++++++
 3 files changed, 64 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 02f42da915985339d3de507fc36dd158b0035a99..cabb3d0885f94d9d70e0631861ed6905d91ad3bc 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -182,12 +182,15 @@ static void pwrseq_unit_release(struct kref *ref)
  *               the state lock has been released. It's useful for implementing
  *               boot-up delays without blocking other users from powering up
  *               using the same power sequencer.
+ * @is_controllable: Optional callback reporting whether enabling/disabling
+ *                   this target actually controls power.
  */
 struct pwrseq_target {
 	struct list_head list;
 	const char *name;
 	struct pwrseq_unit *unit;
 	pwrseq_power_state_func post_enable;
+	pwrseq_is_controllable_func is_controllable;
 };
 
 static struct pwrseq_target *
@@ -206,6 +209,7 @@ pwrseq_target_new(const struct pwrseq_target_data *data)
 	}
 
 	target->post_enable = data->post_enable;
+	target->is_controllable = data->is_controllable;
 
 	return target;
 }
@@ -991,6 +995,51 @@ struct device *pwrseq_to_device(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_to_device);
 
+/**
+ * pwrseq_is_controllable() - Check whether the target provides a
+ *                            host-controllable power actuator.
+ * @desc: Descriptor referencing the power sequencer.
+ *
+ * Some power sequencing targets provide no host-controllable enable for their
+ * function on a given board, for instance when the enable line is not wired up
+ * and is instead hardwired to an always-on level. For such targets a call to
+ * pwrseq_power_off() is still allowed, so that the consumer can drop its vote
+ * on the (possibly shared) resources, but the host cannot gate the function
+ * on its own.
+ *
+ * Returns:
+ * True if the target provides a host-controllable power actuator, false
+ * otherwise. Also returns false if @desc is NULL.
+ */
+bool pwrseq_is_controllable(struct pwrseq_desc *desc)
+{
+	struct pwrseq_device *pwrseq;
+	struct pwrseq_target *target;
+	struct pwrseq_unit *unit;
+
+	might_sleep();
+
+	if (!desc)
+		return false;
+
+	pwrseq = desc->pwrseq;
+	target = desc->target;
+	unit = target->unit;
+
+	guard(rwsem_read)(&pwrseq->rw_lock);
+	if (!device_is_registered(&pwrseq->dev))
+		return false;
+
+	if (!unit->enable && !unit->disable)
+		return false;
+
+	if (!target->is_controllable)
+		return true;
+
+	return target->is_controllable(pwrseq);
+}
+EXPORT_SYMBOL_GPL(pwrseq_is_controllable);
+
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 
 struct pwrseq_debugfs_count_ctx {
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 3c907c9e1885dc2958043a9a733fbe20bdf95f6e..f70f694c19ab73f70ccf775aa24902bfcc982a42 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -25,6 +25,8 @@ int pwrseq_power_off(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
+bool pwrseq_is_controllable(struct pwrseq_desc *desc);
+
 #else /* CONFIG_POWER_SEQUENCING */
 
 static inline struct pwrseq_desc * __must_check
@@ -58,6 +60,11 @@ static inline struct device *pwrseq_to_device(struct pwrseq_desc *desc)
 	return NULL;
 }
 
+static inline bool pwrseq_is_controllable(struct pwrseq_desc *desc)
+{
+	return false;
+}
+
 #endif /* CONFIG_POWER_SEQUENCING */
 
 #endif /* __POWER_SEQUENCING_CONSUMER_H__ */
diff --git a/include/linux/pwrseq/provider.h b/include/linux/pwrseq/provider.h
index 33b3d2c2e39decafac6c6fca9254ad4329d90e94..7285ad94a2214070a1c27f25c783f51105705b36 100644
--- a/include/linux/pwrseq/provider.h
+++ b/include/linux/pwrseq/provider.h
@@ -6,12 +6,15 @@
 #ifndef __POWER_SEQUENCING_PROVIDER_H__
 #define __POWER_SEQUENCING_PROVIDER_H__
 
+#include <linux/types.h>
+
 struct device;
 struct module;
 struct pwrseq_device;
 
 typedef int (*pwrseq_power_state_func)(struct pwrseq_device *);
 typedef int (*pwrseq_match_func)(struct pwrseq_device *, struct device *);
+typedef bool (*pwrseq_is_controllable_func)(struct pwrseq_device *);
 
 #define PWRSEQ_NO_MATCH 0
 #define PWRSEQ_MATCH_OK 1
@@ -43,11 +46,16 @@ struct pwrseq_unit_data {
  *               the state lock has been released. It's useful for implementing
  *               boot-up delays without blocking other users from powering up
  *               using the same power sequencer.
+ * @is_controllable: Optional callback checking whether enabling/disabling this
+ *                   target actually controls power (for example when the
+ *                   controlling GPIO is wired up). If not provided, the
+ *                   target's power is assumed to be always controllable.
  */
 struct pwrseq_target_data {
 	const char *name;
 	const struct pwrseq_unit_data *unit;
 	pwrseq_power_state_func post_enable;
+	pwrseq_is_controllable_func is_controllable;
 };
 
 /**

-- 
2.34.1

