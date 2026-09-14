Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABA5486410
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398127; cv=none; b=QCMKrea+/mTEUxEQKgcap42cKM0OQkwXO9R7zArCywg8QQ37yjMLSDLkiKaCVL5OKPvTkSOZd3Q8bcFdsY/f6/9xBO/KQwuNgdh6i5aqDrciYpWHBwAsYoLsQxOQVP645cpKasTMjgHA0VUaB4VaWUUfXqBqBcSGeHddwCac1ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398127; c=relaxed/simple;
	bh=+9ewyErakjiMv+XulshtUrNOZeuqyR5bAcwr2UTRCIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DqjU3c9CkltN8Tbld+YmeKd3sjePwaY3dZwkVVPVmyLouzu1aESrIYaIcB9D3rGdkp2FJyGnC8xYrmxRd/6RaTkjGVt2Dyg8JbGP6MRMVLNOUbeNgPR0A1I+LyzIeVqZ5dJ607mft8ebR06xebNorDJSINPJ6Ivu7zGoWGAkCl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R3D4A7tR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KyIocg93; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R3D4A7tR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KyIocg93"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0Yf3674516
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RLdSqd1j1OI
	9R1VCLztteaDRbyZgd0G1W+hidlStvuM=; b=R3D4A7tR5d6I3rYhPblK/7F13xj
	AtTzyHRvih+2EcXm6uSQ0JMN8fWKau31PjhjVP1fKuVn4NZabhznAjLY/fZIjEwq
	xb13o10X7gO5PBKmqw5k32+A6sMnNShAKY2i3/aZokrEzkIrePrwASc3rpvVTSgz
	6NUa5hwLodYARnjnafLyNTAGxx8cGN6mmnng1XaB+FmV8lauRVKzYpBk3/CYtIfE
	9dAm3ZxGus/ox0z7V9dPmxHfs3hGhD/wrXxw7LfrdWxmBJ+Y+oFHdlBzrGV9jbTA
	ald+qtSAfzIPTBIbh7gnCPD5DwNqBTJtONRzYM8fEMYcUR21v0lyu5huWNw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs9a7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:02:03 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6bc3374cb0cso1642313eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398123; x=1790002923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLdSqd1j1OI9R1VCLztteaDRbyZgd0G1W+hidlStvuM=;
        b=KyIocg93EnKGkafOoMQxY+Sh+WkjyJFxYlhdMnV7WC9mMGLO1893Ku8Eo3Wn2tlHwM
         DwifsmVYNIzv+B7LaOe7nV26qG+vQXpCqFJpm75y5GmbEzOA/RrLPnkAWA19iNfi6f/r
         peJbFIGqQ111AYUf8TRQxNlOhhNPFuLk2fS1cWel4z/czUjoZwcBs/DFvRHKJOpBcm+k
         wNhvzGQU/UNKquTJZUiUf8JCrLM9pg/jHqKZH56EHj6P2O+2UMkakS7ayatZ5+aHrQIZ
         2bPiZbWvW84KydIaKhVhgm0+SH9iMKUcuBAw2NAhqufhY99KSGtrkUrLKx/RlYREt3hf
         7/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398123; x=1790002923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RLdSqd1j1OI9R1VCLztteaDRbyZgd0G1W+hidlStvuM=;
        b=CbZZ4Pdxw40AcXuR5V00havZe3I8kSYYF00bnk9tB0C/PsH1JqnCTuz9z0HRDP5J0B
         JIq4HXWtnFFbZ25tewJ9ukGiRtY/kWb8bJ48jhTSjgaYcnNypQjFyipSaRjE3fRzpCFW
         w1danXpL0/L62qr+iBjvilCMsnXVLhQXU1fOP7Qjh3D3yf30Npm+8FdRvMnYxnI/MEUa
         xEWjoELbKYVmJzhPg2Px3vZAbqN22QgttNcRnxUh2YpYQLRmIW+XBIyni2B2jj+ZVygQ
         R9Y8x+/V62pjBkDq3aSMdk8CeDFWGtTKftRzOpAAeiW9WGksD8tP8TmxvQ5pS0Hqcne+
         iV7g==
X-Forwarded-Encrypted: i=1; AKwUvBwfdFocAQqrzi1b7xHEiicSrtRpJ4fGC9NrfeEKrzU/8bayLQ/LTALtLOQv/2nJsIE36uKpcpaRJUEU5eHg@vger.kernel.org
X-Gm-Message-State: AFuF++kXcsHaf03tLpHzRgelLdUoLLpGKQRzTT3MO5TBMDxmrnoSaHxV
	i5nxtuNQ3cUS7bSuVPzE/annGLpJ4bm4X78DjqXhPs3x8JVkx3QC7h2y7OotDKHo801tJwEpZye
	MvBkyZ8fL2jMQEe0MiPg+9X+Dq4MWnnmbM+YuhosAeRTbLCJt58S6510yWFgH8Qm05DXh
X-Gm-Gg: AYBFou38LBjaGC7tmw/D8t1xrWiDVwLO5OXW6EqCZKdOXoGa5zDyZxrk061AqkwVaG3
	qAxETm7iZaha7fg1o3zh+alqfb9PVB6SsFtZf6VXK0SNOTZfU22JgqC/q6P5qQiYbevBb1rdELq
	eW9PcYD8TvUhN2TGDckn5RRGnVnDtmj8zsmhoyXeslfhk08JZPAB8O/GV4ax7HxIcrl07BwaQPi
	SdA1IY9VdMcmDmYudFZlX34zmOX82USPy2crmtVvjHwobMpUFk99ZN4wBxXfQT6XDR1OVoc+89u
	U7Nm9n4nfoLUlScQNd0eCIRjP+BSkViwLfsO4htBMQCJBQqVTSeqtFkDA8p86o22KlkAkXt7prF
	UkwjlX3mPG3AxzlyFY/qjQZZ9GVvurO1FU1IwaWwvF7fRI0oDVyotxAJORA==
X-Received: by 2002:a05:6820:4b91:b0:6b7:8396:f3cf with SMTP id 006d021491bc7-6c541b451edmr1405306eaf.49.1789398120201;
        Mon, 14 Sep 2026 08:02:00 -0700 (PDT)
X-Received: by 2002:a05:6820:4b91:b0:6b7:8396:f3cf with SMTP id 006d021491bc7-6c541b451edmr1405146eaf.49.1789398118846;
        Mon, 14 Sep 2026 08:01:58 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608480esm468632666b.36.2026.09.14.08.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:01:57 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Dhruva Gole <goledhruva@gmail.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM domain to do power on
Date: Mon, 14 Sep 2026 17:01:38 +0200
Message-ID: <20260914150146.187622-3-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
References: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa80c6b cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=u8BtVuMVLpZXKRMe:21 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=CAA96EveQzfqUpAuUaoA:9
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX2Os3kPwJ8Pau
 YBbqrupmH7I5kFPMcm7+mGy/PVegTkVfmIwHeO17nbk2D4zVvdOfwcL1HOxRmRl8f+Y01WTXzzg
 nnLSsX/kWXn0krBaUFkzEn0e71ujPKY=
X-Proofpoint-ORIG-GUID: QJc8ulQwApU8jUIvqDQx-iSFrsmLLo7R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX6Jr/6R7OnfjS
 LhjSibst+Mi9g8amY0ye3C3W572n9l8XRqV/LSlFe2iL91KBmMXVNOyPtZcq355YmWwNQHx6S0t
 xlFY2dV/BNM161z7PMmPBGgdypvxy0dLLl739S/ECi/Oau4W9kCyNvvo2SL2XvsFnJNKquf/5ix
 yp33GglwaSsU5PvZxGGykWS5TvEJq0v08NRgsS1ZM9RVeHQbA3CiLQs2Iy3E+EX5/uErm9/3ahb
 2FGf7mFbzMbTIWLj+KZTRd9+Wuhwcw/Txng/xzPewOvHrxUnwB3iw9bInhaEIg5X/rEfcCQPj1q
 1vgU92qM5urlcomdIoxJKyUKCB3z2B/7KAAyIbj3IJogIE1JZCaxxTkwaFUbFkemRnYKmJD2uqv
 wvDfJQqwox70AMS4wwkroyl6aerp0A==
X-Proofpoint-GUID: QJc8ulQwApU8jUIvqDQx-iSFrsmLLo7R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609140215

A driver for a non-CPU device that is attached to a CPU PM domain (the
genpd has the GENPD_FLAG_CPU_DOMAIN configuration set), is currently not
able to power on the PM domain. More precisely, to power on a CPU PM domain
one of its corresponding CPUs needs to be woken up if they are idle.

The current support for a non-CPU device is that its driver can only
prevent an already powered on CPU PM domain from being powered off. This
leads to problems for a driver while probing its device or when it needs to
call pm_runtime_get_sync() to turn on the power for it. From the driver
point of view it looks like it all works fine, but when accessing the
device it may end up with various errors as the device may not be fully
powered on.

To fix the behavior for these types of devices, let's adjust the behaviour
in genpd_power_on() to wake up an idle CPU that belongs to it, in cases
when it's needed.

Link: https://lore.kernel.org/all/CAPx+jO-sCierYj8jnoKQHckJG16dOBxnNrsZVYO=38R2cLV8nw@mail.gmail.com/
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Reviewed-by: Dhruva Gole <goledhruva@gmail.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v4:
	- Decreased the timeout.

Changes in v3:
	- Moved to atomic polling, pointed out by Dhruva.

Changes in v2:
	- Rename a function according to Abel's suggestion.

---
 drivers/pmdomain/core.c | 80 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 6abe8b198949..c593a3479ad0 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -10,6 +10,7 @@
 #include <linux/idr.h>
 #include <linux/kernel.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
@@ -19,11 +20,14 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/sched.h>
+#include <linux/smp.h>
 #include <linux/suspend.h>
 #include <linux/export.h>
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 
+#include <trace/events/ipi.h>
+
 /* Provides a unique ID for each genpd device */
 static DEFINE_IDA(genpd_ida);
 
@@ -32,7 +36,9 @@ static const struct bus_type genpd_provider_bus_type = {
 	.name		= "genpd_provider",
 };
 
-#define GENPD_RETRY_MAX_MS	250		/* Approximate */
+#define GENPD_RETRY_MAX_MS		250		/* Approximate */
+#define GENPD_CPU_ON_POLL_PERIOD_US	100		/* 100us */
+#define GENPD_CPU_ON_TIMEOUT_US		300000		/* 300ms */
 
 #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)		\
 ({								\
@@ -1026,15 +1032,75 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 	}
 }
 
+static bool genpd_status_on(struct generic_pm_domain *genpd)
+{
+	bool is_on;
+
+	genpd_lock(genpd);
+	is_on = genpd_status_on_unlocked(genpd);
+	genpd_unlock(genpd);
+
+	return is_on;
+}
+
+static int genpd_wakeup_cpu(struct generic_pm_domain *genpd)
+{
+	unsigned int cpu;
+	bool is_on;
+	int ret;
+
+	/* Find the first online CPU in the genpd's cpumask. */
+	cpu = cpumask_first_and(genpd->cpus, cpu_online_mask);
+	if (cpu >= nr_cpu_ids)
+		return -EAGAIN;
+
+	genpd_unlock(genpd);
+
+	/* Send a IPI to wakeup the selected CPU. */
+	smp_send_reschedule(cpu);
+
+	/* Poll to wait for it to complete the power on sequence. */
+	ret = readx_poll_timeout_atomic(genpd_status_on, genpd, is_on, is_on,
+					GENPD_CPU_ON_POLL_PERIOD_US,
+					GENPD_CPU_ON_TIMEOUT_US);
+
+	genpd_lock(genpd);
+
+	/* Re-check the status as we have released the lock in between. */
+	if (ret || !genpd_status_on_unlocked(genpd))
+		return -EAGAIN;
+
+	return 0;
+}
+
+static bool genpd_need_alive_cpu(struct generic_pm_domain *genpd,
+				 struct device *dev)
+{
+	if (!genpd_is_cpu_domain(genpd))
+		return false;
+
+	/* This is not for CPU devices as those are managed differently. */
+	if (to_gpd_data(dev->power.subsys_data->domain_data)->cpu >= 0)
+		return false;
+
+	/*
+	 * If the current CPU doesn't belong to the genpd's cpumask, we need to
+	 * wake up one of those idle CPUs to power on the CPU domain correctly.
+	 */
+	return !cpumask_test_cpu(smp_processor_id(), genpd->cpus);
+}
+
 /**
  * genpd_power_on - Restore power to a given PM domain and its parents.
  * @genpd: PM domain to power up.
+ * @dev: The device that needs the PM domain to power on.
  * @depth: nesting count for lockdep.
  *
  * Restore power to @genpd and all of its parents so that it is possible to
  * resume a device belonging to it.
  */
-static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
+static int genpd_power_on(struct generic_pm_domain *genpd, struct device *dev,
+			  unsigned int depth)
 {
 	struct gpd_link *link;
 	int ret = 0;
@@ -1042,6 +1108,10 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
 	if (genpd_status_on_unlocked(genpd))
 		return 0;
 
+	/* Special case for a device attached to a CPU domain. */
+	if (genpd_need_alive_cpu(genpd, dev))
+		return genpd_wakeup_cpu(genpd);
+
 	/* Reflect over the entered idle-states residency for debugfs. */
 	genpd_reflect_residency(genpd);
 
@@ -1056,7 +1126,7 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
 		genpd_sd_counter_inc(parent);
 
 		genpd_lock_nested(parent, depth + 1);
-		ret = genpd_power_on(parent, depth + 1);
+		ret = genpd_power_on(parent, dev, depth + 1);
 		genpd_unlock(parent);
 
 		if (ret) {
@@ -1306,7 +1376,7 @@ static int genpd_runtime_resume(struct device *dev)
 
 	genpd_lock(genpd);
 	genpd_restore_performance_state(dev, gpd_data->rpm_pstate);
-	ret = genpd_power_on(genpd, 0);
+	ret = genpd_power_on(genpd, dev, 0);
 	genpd_unlock(genpd);
 
 	if (ret)
@@ -3410,7 +3480,7 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
 
 	if (power_on) {
 		genpd_lock(pd);
-		ret = genpd_power_on(pd, 0);
+		ret = genpd_power_on(pd, dev, 0);
 		genpd_unlock(pd);
 	}
 
-- 
2.43.0

