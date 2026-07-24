Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B01D36C597
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877569; cv=none; b=Fh1q4WA5e6ULpweQ6icQO1gdT374h8ptdYuYRFj9ZtHZeyrRyMR9eTy7wTcMsucF0V8Kp1uWfKJmuq9jdrN6JpTHd38f49REEL118TDDb4792Hg9wzNYvuDuuUvToWQZEwBJ0/8X3byNPOdSmmv7f7rv0zgeXx0QtmaVH3nH2rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877569; c=relaxed/simple;
	bh=AppA0b6xjMgMgMBr1DVj/TOCK0pKlrmrewVYLEVWI5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a3MMz3ykzSbUMDW2gOlCuibGi5ccFy0esveYMf+rxR+yPykDNf9pmAkTzPb3k3Kh/40MWD2z4le0MxpRDQoNxcCRATSV78mZQcI01y02wyElwUX5I6XrgH7p7TG+33z4xVqnnSxuc1/XezD4kW5WpurM5lVwHkllsC2S6OkxB9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Agcevg42; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jFZrAnJq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Agcevg42";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jFZrAnJq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lHWo1869019
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O2Fyl6tXW8E245A0wNUYdczphKifLK8Qf8aFQGZJccI=; b=Agcevg42jmr919cy
	jtZOrB6358NDM3CNKhcHJwxUvntNDKI1PlkJOmF29TUiL/PXgalEdxNYvfvYNTMz
	GIJOh7YuAHAciINQPTdJ3RwQOjqqHS6u6vVRRPes4EsaoB9llxlDVyShmWySv1dt
	G5MtUYkpjc2ok9XN3sBLsn1wlhgCLB9r68qPV4GUSvAtf+zIo/D4tFS74tpa5ioA
	KtdBRaHu8X/rZ3OMmplsWZ1KLBmVWdrIXR+y2AcQmBqWNqzwwucNi0VzT2wYk3hR
	L8xU/6b3AjPGlkEsLcf6Yc4tOpC/ZEYxHdqNm/1fziitsU97CAq8LXkXxyDfQ+VN
	rX6rPg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw8ms3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:19:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb6823efcso1690255ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 00:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877566; x=1785482366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O2Fyl6tXW8E245A0wNUYdczphKifLK8Qf8aFQGZJccI=;
        b=jFZrAnJqB7w5DZDZBACDaRMNao3wFKCDPASDT1KoTzqrXw8uKCssRtfyPNz3wRFVEh
         VWNQLVwMxaUMBvbEGTpDa8xFOBUah7mR+s8HJyG2RLNkCBUBV79sBP5cn96W+3pxu0w8
         dB7cy3MwBYG4q45YzAWxDsn+2cmY8NhA98v9oeh1eUIK3YyvcQ51MRFvO2jn6lXQyoQm
         eeq7ZJA9cfrBzBIkV8BdRj+C2Wi86vbs9VxeS1nI3Gl7YZvOhfiM6oizvWVpocaLDcYS
         Kqa6dlSmJqbSYi6vpkaCFl3spRN17vH/n7NQbjHEfSM7+okVPO5y9OFH9aEXouGs4yrs
         j9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877566; x=1785482366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O2Fyl6tXW8E245A0wNUYdczphKifLK8Qf8aFQGZJccI=;
        b=USoGavOTiHX+yB6GJLG33UfjFVxGTV9LPJOv94KkRjvekVjZHkA5PZqMF25unOXDWV
         CK5Cn6HxYfLZpou1yJORyXmB48F44HubSpOBvYhDyKWXwfATCjhTm0sHEB/5eD7hXEZn
         wudY8hMPm/ryeSlgE/RYHy2NW6UJg3B9/MgTxB3905VMb/BVPH/U4OWfyvgFLyNdS5Yg
         L+BxG9mWvr8O4gFf95XuiACX1EjXI6MmyCSC5fzAgxY2jDhvZi9J6FwICUybXfr/1zub
         0QvqPekIVxJDKxsVlCfNskAXtytjDhtaMR24SE2JvEu38tTTojvUc87NwvGDAyu80Eun
         XnNw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0dV5Wm5AgnAV7Q5Q7KRb0XjRIEcpd6zBU5BNEUml0bC2uwkR0c0RIhmcmTboEXnYVeoeM91kpIjukGzdg@vger.kernel.org
X-Gm-Message-State: AOJu0YyKxCrN8WMOhvQkeFsFFJfJKkDHxGuJ7OdOoYSR5TsoeBo6LEwv
	PNiIQ30xKX0V8/W3fJpmAuEPSjzlFwImMWpbYyXAWTcq6XXeYJv9iTJQq6hgMLJJFFf0XAJgzz1
	s8oWKiOFTg2mFXvvmKFbsRFB4WcOiXevXPDnB3wNfB+gd2dejeutyMBkun2VAuxCaWxA7
X-Gm-Gg: AR+sD10RGe4tfBDfYfkwYgoVhn6URBJBp6Acu931PmnLtoZMARC8/64dZex+ian0L7w
	Vp2/NBxoWzOXQCXd9nEji9fvcaPi98sWCOIOoljXb0A313TBKC4yUHuJjB3Vq9ZlADUMUbWJV+d
	Hnr4Q5t4MWbSx8nFod/kPnTVAz5HnFrOsAdZTX22C4PzRE95zE418AeVqa7jmcPdTDoGoF46tNV
	DHAvPwMKCbh8GGoOnhYuM3AOOh0ektR0EZjmYb4i5+GEzI2KBRCTEIW9NyvKZO/Db0Q70qQWfU0
	CgsFnFBX7HkyDNtgS5TAiVuqUux2jJlrfn1OuS5hqSzK2+3x9bOmt8kM3ibdffaSPT9afhoNbuO
	E+qPavRnPBNAI342rLQGC00hQICDzpw+8apuxycd1XTsad/kGngSKjeoCMOZrCk4pr1lbK3vK7G
	LsniQWnjkb9jEcUXm0tpDGEJqLPOM=
X-Received: by 2002:a17:903:286:b0:2ce:ced3:490e with SMTP id d9443c01a7336-2cfa6d878admr71283725ad.39.1784877565560;
        Fri, 24 Jul 2026 00:19:25 -0700 (PDT)
X-Received: by 2002:a17:903:286:b0:2ce:ced3:490e with SMTP id d9443c01a7336-2cfa6d878admr71283455ad.39.1784877565070;
        Fri, 24 Jul 2026 00:19:25 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:24 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:11 +0530
Subject: [PATCH RFC 06/10] PM / devfreq: Add a governor for tracking remote
 device frequencies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-6-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=4891;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=L8aBIKJ/12pti7dx2J+q6kxEAWTDwCr7YwrZkrU6k3w=;
 b=Y5gFfN+ZHt6er8WmQ7b2LGb0q+kTmPmMG2zPz1wNRuU6UxgxdScnYk4GdWAZ1cSBYGPD+eAW4
 mArChceiY2CD8MwjYsCRzLmtYshCpoqnm7Xx8Cksh4k8H6zTmEGi2U/
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX27LnpM+hDP+O
 p4dFIf3dISsk7tjhN/Pu+dADtZvQCO+ajOKqJgJ4QNkRTDmwghPL+53njLK6+VV8maMt0GL0nQu
 LnoQH9lkVfOTbFroWn1mCK8iQJEu/19+M51ewEVeMy11AOtCNH4g+Rx/SUGUQhl5k9MM6sJHP/Z
 ctfCPmI6trCmruvErVkWqtoax72khhQk6MYpJVMAXnG/bn3R767dFncDWUDwWqA7Lz1qLqs9umM
 6X0SHORmSyD1mgl5j6YHdCXfvm5NxELb+B+r7Mlod036WBPYBmCZ4b27lu3YLw+vHW5+NSlI9Pt
 ooc72/vq4hEG/BwY7Fo4uoAjSIEAOtRepvL/dB4o+Vn+bYAcxy8kBRSR80VuxuXNmhvyFoUCHo6
 VBnYcxQxM5igFU/YBClfEH7OHXJfmVLJJ761aK7GNlvUhfz/Emu+Y7FHfnHR240g74G+N0zrJth
 Rw0oQrhmVGNEy7yQG7g==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a6311ff cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DkxomDJNIKAFLi0tgcIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: iv9eEamHmIO7_rCZYghXgxhIVa91a_Qd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX9UeyXADJ5x+3
 CDNqIVYXpp9ki8Pr16yp+lsr5tsTWE2NyMHBXue1AwWkGtya9Z6feGAK6LN9TrDiOomaMz8RRCe
 RL3vcN8haN0U+uhmgVVjR+3peK7Qp7Q=
X-Proofpoint-GUID: iv9eEamHmIO7_rCZYghXgxhIVa91a_Qd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On SoCs where the governor and the mechanism to control the frequency for
devices like caches is hosted on the System Control Processor (SCP), there
exists a need to track the frequency changes in a reliable way and provide
ways to tweak parameters on the remote governor.

Add a new "remote" devfreq governor that uses the track_remote flag to
expose the remote device's frequency to userspace via trans_stat. The
governor deliberately does not advertise the DEVFREQ_GOV_ATTR_TARGET_FREQ
attribute since the kernel cannot set the frequency on a remote-managed
device; reads of the target_freq sysfs node therefore return -EINVAL.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 drivers/devfreq/Kconfig           |  8 +++++
 drivers/devfreq/Makefile          |  1 +
 drivers/devfreq/governor_remote.c | 73 +++++++++++++++++++++++++++++++++++++++
 include/linux/devfreq.h           |  1 +
 4 files changed, 83 insertions(+)

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index c999c4a1e567..2caa87554914 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -56,6 +56,14 @@ config DEVFREQ_GOV_POWERSAVE
 	  the DEVFREQ framework returns the lowest frequency available
 	  at any time.
 
+config DEVFREQ_GOV_REMOTE
+	tristate "Remote"
+	help
+	  A simple governor to track the frequency of devices whose
+	  dvfs control lies outside the kernel. This governor acts
+	  as an observer and provides for ways to track frequency and
+	  set/get information related to the remote dvfs device.
+
 config DEVFREQ_GOV_USERSPACE
 	tristate "Userspace"
 	help
diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
index 404179d79a9d..cde57c8cda76 100644
--- a/drivers/devfreq/Makefile
+++ b/drivers/devfreq/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_PM_DEVFREQ_EVENT)	+= devfreq-event.o
 obj-$(CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND)	+= governor_simpleondemand.o
 obj-$(CONFIG_DEVFREQ_GOV_PERFORMANCE)	+= governor_performance.o
 obj-$(CONFIG_DEVFREQ_GOV_POWERSAVE)	+= governor_powersave.o
+obj-$(CONFIG_DEVFREQ_GOV_REMOTE)	+= governor_remote.o
 obj-$(CONFIG_DEVFREQ_GOV_USERSPACE)	+= governor_userspace.o
 obj-$(CONFIG_DEVFREQ_GOV_PASSIVE)	+= governor_passive.o
 
diff --git a/drivers/devfreq/governor_remote.c b/drivers/devfreq/governor_remote.c
new file mode 100644
index 000000000000..df3819757e56
--- /dev/null
+++ b/drivers/devfreq/governor_remote.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/devfreq.h>
+#include <linux/devfreq-governor.h>
+
+static int devfreq_remote_track_func(struct devfreq *devfreq, unsigned long *freq)
+{
+	if (!devfreq->profile->get_cur_freq)
+		return -ENXIO;
+
+	return devfreq->profile->get_cur_freq(devfreq->dev.parent, freq);
+}
+
+static int devfreq_remote_track_handler(struct devfreq *devfreq, unsigned int event, void *data)
+{
+	switch (event) {
+	case DEVFREQ_GOV_START:
+		devfreq_monitor_start(devfreq);
+		break;
+
+	case DEVFREQ_GOV_STOP:
+		devfreq_monitor_stop(devfreq);
+		break;
+
+	case DEVFREQ_GOV_UPDATE_INTERVAL:
+		devfreq_update_interval(devfreq, (unsigned int *)data);
+		break;
+
+	case DEVFREQ_GOV_SUSPEND:
+		devfreq_monitor_suspend(devfreq);
+		break;
+
+	case DEVFREQ_GOV_RESUME:
+		devfreq_monitor_resume(devfreq);
+		break;
+	}
+
+	return 0;
+}
+
+static struct devfreq_governor devfreq_remote_track = {
+	.name = DEVFREQ_GOV_REMOTE,
+	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
+		| DEVFREQ_GOV_ATTR_TIMER,
+	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE
+		| DEVFREQ_GOV_FLAG_TRACK_REMOTE,
+	.get_target_freq = devfreq_remote_track_func,
+	.event_handler = devfreq_remote_track_handler,
+};
+
+static int __init devfreq_remote_track_init(void)
+{
+	return devfreq_add_governor(&devfreq_remote_track);
+}
+subsys_initcall(devfreq_remote_track_init);
+
+static void __exit devfreq_remote_track_exit(void)
+{
+	int ret;
+
+	ret = devfreq_remove_governor(&devfreq_remote_track);
+	if (ret)
+		pr_err("%s: failed to remove governor %d\n", __func__, ret);
+}
+module_exit(devfreq_remote_track_exit);
+
+MODULE_DESCRIPTION("DEVFREQ Remote Tracking governor");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/devfreq.h b/include/linux/devfreq.h
index dc1075dc3446..4d50cf230950 100644
--- a/include/linux/devfreq.h
+++ b/include/linux/devfreq.h
@@ -21,6 +21,7 @@
 #define DEVFREQ_GOV_POWERSAVE		"powersave"
 #define DEVFREQ_GOV_USERSPACE		"userspace"
 #define DEVFREQ_GOV_PASSIVE		"passive"
+#define DEVFREQ_GOV_REMOTE		"remote"
 
 /* DEVFREQ notifier interface */
 #define DEVFREQ_TRANSITION_NOTIFIER	(0)

-- 
2.34.1

