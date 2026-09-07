Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4EC46D2A9
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 11:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779841; cv=none; b=Hv4po0SHk8nMTiGt1Yyxku0IsSCa0r7D79IQh4OhdV5Q0LwyXQuUblY8k+4m1GUPT+ms42FT2s8Vu9wXC91EuS1ssAo5Fj1n6EDdNFQs7GqlIWoiraO9ZnYhhhZVsT7JmoNUOXOAc4ngO81Fop+1Mvp0JHnt6U2jtaRAFgtmb2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779841; c=relaxed/simple;
	bh=HksTSH5nZIdSJicXwafbbfriQ2xJFLxE5NRRSdeL95I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ew0Uu5rPSJ2h3BvoKYT0mDT1zkqapvlIRGGQRQoHNL8ZZu2G6AnFCCMe+2OxxOhgrsBPSbCG0DW+NFdzI4+iK3XxhIvT1vI8WN469wOgT7iki6Oc26s5fHnUpvPabydSVMmPoQUbeDUT6Cf2ySq1zxiAyDYAF8HvkE0aBx/Ex6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KM9RgnRB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OUmaZOtj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KM9RgnRB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OUmaZOtj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmrYG3872679
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 11:17:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qc3aItDznK9
	eNLgbGrQcjkgrtgUZI6baFp+cJdIi190=; b=KM9RgnRBoCz1wPP+BQZ1Q5Oq01+
	RazZJXqBUbpn5yUGvYC9zTiaV4Ln2eMHYutAomBj2tloDuWuxISBPUV3Ls+Nq3br
	GbRtdq36E7Pb9RDcD55E4DHZyDyn34bSkKRA0zaJk0o7lcdU003o+ao3yuQSPKlY
	RBdDij03LCuY5qN2arSlWCu94glqp7clD8AX3H5fvientMxrpUlNAu7XQUiHVJbX
	LSy7GZ0uJEoT17p+hDR7s1ZxpVlSk10N2ELjx+d5YnPJl/Da/XEydLDF4usR0nUw
	PktKGkG2CAQpREwx8hqshIxxG5c+lNT7wEybQOOGsNppayk6r4XLGHyU9zA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj1rjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 11:17:17 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7a814bfc1so878727e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779836; x=1789384636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qc3aItDznK9eNLgbGrQcjkgrtgUZI6baFp+cJdIi190=;
        b=OUmaZOtjagA128yvJGrhtDZ2JErUcjlEe2XWDgXHzRrG9IUJM+Jo808TqvRg1b/h8L
         8UfaaISoNv1mEYZGi34Di4EdS65G9T0c6EDp+Ge7TSKF+9iyK4IIs3GmO3YgNw4Xdcp/
         oRszj42KCAumSHohHr+3SpdkAjW+AN+zeq8hcxSg8pGMqklEyG7XMrT9lJAIx7V2N/JT
         aQEJ6UjPVXdGShFz1Qba61yECzGdFhVWDoXuiPIFfhrwyWWQOnB+H3NwZkOilmYF7TNB
         VwC2kQzoYWlEvGBvCy+PiAuz1NlGpk8u4v9XFhpNQuc7cmnxvdlNi4bHC9SqCYv85hvA
         TXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779836; x=1789384636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qc3aItDznK9eNLgbGrQcjkgrtgUZI6baFp+cJdIi190=;
        b=B7CsioIiC1VdDGgCj+WXc2HV4qtIZHt66BJaEhq1/hX5Hd0xy8kv37rsqSxpRESsku
         N06fuDlPRyCrh8W/7HcwSAhg+URnJZHKqjB2oZZRcPDJMqxHTZP45oRACCXqOh7pmM+0
         m0xqNe/9O4+f+6W3RwCmm8w4h9YOql0/kGBT4COdUFxMboUS95hAInV/ThEruQNeu9Dm
         F2gB6zQwl22GS+9yCJiUPV4Qg06sF+xmM5B574XVAAxo0D8UtClLAXFCDIz9zArhs2/s
         fgrt0G/iWSe6PfsfAc9lTPDDM+YWugm8tob9IlyjU9q7yIjTchs9csz7JAu0cA9fzGt8
         +qHA==
X-Forwarded-Encrypted: i=1; AKwUvBxJqJiEX3BNi2lvvPasc5Q66nspgmrGVQ84soyF5uxeCHPnU96FE6k2wA6OtldpP+utILVrjFNVDdLdqp04@vger.kernel.org
X-Gm-Message-State: AFuF++n5nioDzXY8VUw/Fxa7uuG6dgCpAq14nYilAj+f1gvZm4f8bpl9
	R4SkntoKvR5ZBLxKnYxwKh50sWG8pyzH7bQ1BjiOg2qIOgLgzb+S3IXiJWrWLixtpZkVGhC/t9S
	R4GB6FDZDzHoiJkS08UxZtOUG8B2TIzDRIRtTcH2f0eF4Qw4JoxdXMp9AuY+89FwWCYiH
X-Gm-Gg: AYBFou2HAEq39YU118ZV1iw+mHzalZjDV1Z5Y5iz4bh+w2zLu+59f4j3vmqDGRUNLpz
	IKt6ITFgFoKqHrFjHtAcxKFeJ/Mz6nI0Rsg0cCZ9eTwn/4b55w3vJ4d+bL2F14uBK0TA7gJj1QT
	Nox0WKUt4WmrDSFrpF+Dt/F4NKnbjWJf0+jAiAW0R8ActPtA3n+w2aZYX0ubqb0Lu0oncybttGX
	eeUvm3qOQpNAamJALvd4ghAT2ovIgqtnUa1nxVwqUjy7YZuZLEl2kcfeGbYpk0aXMtBZENfSzip
	Fr+iYxL6AXB8xf9hqzEXg9gDqCsslwaUgF9gCHHRjqvveZCSATgG5yyNbm7RzSAmBMGMzLUgh4n
	X381B1an3q6j9a8+GgEKTB+2UhoLkgN5F2SGX0GskAJ+1HJAc63WQuyYWjA==
X-Received: by 2002:a05:6102:5814:b0:786:b28e:f980 with SMTP id ada2fe7eead31-78a4a99f7c6mr7574469137.10.1788779835907;
        Mon, 07 Sep 2026 04:17:15 -0700 (PDT)
X-Received: by 2002:a05:6102:5814:b0:786:b28e:f980 with SMTP id ada2fe7eead31-78a4a99f7c6mr7574414137.10.1788779834862;
        Mon, 07 Sep 2026 04:17:14 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cfaa2sm456120066b.59.2026.09.07.04.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:17:13 -0700 (PDT)
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
Subject: [PATCH v3 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM domain to do power on
Date: Mon,  7 Sep 2026 13:16:52 +0200
Message-ID: <20260907111659.263324-3-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfXxO8lbex76y2q
 Q5O6xcM0hZIYNVj08yUBcT2iMm3mRAL5z8PjK5kFEDG2niOZW4bby46/hRvWiU5WxUhoq2bWA0I
 YBqjDgTZCGdiJheUXs9C3qg+73kFnU8rOZRSgxXQ9maOVNoeWSwj3taR89UmsG4ca5q3zBTT/qv
 MAoEWy2CQ9Y3jyfGj7wWtVBJsWjCglz5GzyQoju95WxAc1a75lTg/pt6CY3oseh0ftHSMtSeByd
 YD0I3FZZXJjUL0LjvpavSwlk2fKF9t6UEkfnS/KOo7ll4iDGRp8BGx3fjrzi+u0giWVQQ4xOzsA
 r1PdOQUaDPdT73C+uyeX+hnr4VkMloaWRZHUSolTJxoE9NrSryawk/sGHlVbciBS4zO2hJT1BQs
 SdZtEA+heGsC6ooc5AsAZq8Xz+Lsvrb4+K0GAkiAHmCcCqsRIOuZJ+H3md7385/BVTMesJvmXse
 0m/E/GWsJk8QIO/6ZqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfX7wMdyOwfAIOS
 GoUwoid1+NNRBOiCSxRdZYkfcKCMreUwULBYDvnEQuJcIESmL7BdXKpMGhHzC069S3HUyplEYbX
 8BlSeoqC0k1iT0ScRpLr+gMNMpeGCOM=
X-Proofpoint-ORIG-GUID: qQBE-JIm6Hyq5ShZu4McqbrP4ZohpDt7
X-Proofpoint-GUID: qQBE-JIm6Hyq5ShZu4McqbrP4ZohpDt7
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e9d3d cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=u8BtVuMVLpZXKRMe:21 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VqZmVlX21PZHT1he1CgA:9
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070124

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
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v3:
	- Moved to atomic polling, pointed out by Dhruva.

Changes in v2:
	- Rename a function according to Abel's suggestion.
---
 drivers/pmdomain/core.c | 80 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 6abe8b198949..b62d4e544bc5 100644
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
+#define GENPD_CPU_ON_TIMEOUT_US		5000000		/* 5s */
 
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

