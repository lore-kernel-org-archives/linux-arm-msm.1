Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77FB317166
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786427431; cv=none; b=R9pzhwCseGHWy99u676f/8Glj6LJNftA23N14AhOzm8dIckHXktPVffB0yZRgpP1TLPqMoV91wFV6Te7HLv+mxkSRpgM1U8gngasFRNTdvBto75Sw7Z7Sfyvpx7iEgOBdESD/ew8lbLpEDjhV50FaPsmZsHDIt1Ww6rYj/w61t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786427431; c=relaxed/simple;
	bh=noGCtlEhc01PRgl/TejE7Msr9fur7y8T+UGMXIwtm0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gBWmqpnZejW00C5orcbmFpWhxfWOHgNFQXpVeOZF0MpoJOStLunDx7nGU8QIeAAKA5DsiGw4JmXT8kq6rAEv0eG7Xjz/CoMMlwEwnocam+tutroBK+GZU1/vxCzrv0lFgi/ZBJ9TEFg7RTaH6zwi9hbsvp5wy9qgB0xgxPyRRvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kf2O3pQM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UziucGwE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kf2O3pQM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UziucGwE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMpsv52687288
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fGCMCudQPIfNSyE/z15lzExG5h5W9AfLeMiFY/ee9OY=; b=kf2O3pQMYB8pi+MU
	QHMlTa26UGMqs8WDovc57l/bDQQ9CN/FrrP6q/wywiLDVR6soh5+OLFyFM5dOvfM
	Opi6f3z8ejQcGvLDFoyOJEvMYupTNBL5H+JGv4rmVJoYWLRATUCiGbOZqpMq4jJT
	SttIB7ytPmea8fRq4sXoK5tS6rnn1zduX7SXOeiFYen4B4KlCyAO9To6rXOZmuqU
	y78V+VRO8M6ooH++UXxJWPPulbvY9gMLVuw1vAQwckXroaT7p2OfRYQaY+DCVgEr
	qIUgNmesNMSdXzHBrS43NMwZnquSz8IaaH1rQZUVuJ4J5pXOHT6jrvuwtMsK8Oq6
	Ypq7Ww==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjsjk5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:50:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso3184321a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 22:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786427428; x=1787032228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGCMCudQPIfNSyE/z15lzExG5h5W9AfLeMiFY/ee9OY=;
        b=UziucGwEJGD4XCwhOXPUZyd6iW3VEl5E8AFBOnegRaY4z7nDuJv/5sTcwa8UQoWUg2
         4+d2YCMoCixtNBdP14awg9uxnOCTnNWbY9IWAzNbF7DkkHnAymdRBqfzyacwHAiaTXtb
         M/85cR/ertmUd7ekSZrBcyE+5mLVq5VGzuVPL3zngiFkHZmdYSv2zL1K9afdfRCLFQNM
         POCxs7L0smOU1JOaDrdTK6LVmV3qSFh8bHaJHbW4RFZ/mo4P2rv9VREmKf2ao5TbMg2I
         +3Ebm0NCfTWMlYg/NJDa4h4D/JNHThDb9jqEdfsI7VVbSfDlZT1kwwQGVq89c+FtctnW
         xqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786427428; x=1787032228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGCMCudQPIfNSyE/z15lzExG5h5W9AfLeMiFY/ee9OY=;
        b=kkYTphbS9bopjv8a45MK4LTHnbh6oJKk1btMmSBwX+iMg+CGQNluWTyKCLJftDrE3d
         WoWcmV+s9bNka4zU6N6hhcFKX+9fMn+6UDgIlWTP7ifgSH2eAj5HYE81Ei4CqNs541bm
         0WhTZdPHw0FV2Fj8EnXBT+PgDlgxIeiQeBkONJ9G4Nrc35Kon7xNeC8/iwWWJfDrhlwi
         K6GZ7zVqFBInruhIX6YzqnLAnCpxDCSLW/6CPt2vfCZNlIxjZh+qtn/pwldayarxphCj
         KnfBxgeGn34Jv4EPrpBKkAMCMCBHsjuVqDBwBKcnWxgt6aso9Ga4/pMxV7Qh9MUzd0yx
         liAA==
X-Forwarded-Encrypted: i=1; AHgh+RqcXTDj64arUnlW3tHkI3geATQnB34Z5dcb0W3DpTXtgJD2lv0kK2Wux/rNGlt2R7NnbcGYYe8cQhzOLkM8@vger.kernel.org
X-Gm-Message-State: AOJu0YwA7yoeJ0qy0htVWdiXvALcgc0UQ3+FQcoCFzM+h/6aoOniuE+T
	odpBFCiORKSR01Tz75Qa2tPLdqMtoLz1gQsiZK8ruArJ4zS10Q5fqp9NDfum+NAXWD9dfJsdUUw
	RwZ98J3g7CshabldcoU/W9dhXUrhwpFgo88/P+LrdZ+2YjD+TX6U/2Y+DceKZ46ZMZv6u
X-Gm-Gg: AR+sD12vT85tXs8SYggv/bnIiUD++rOTUBEIFMdfV5oCc3tGta+Q57/RQOQv3EdX05/
	s8lYh0jHh1CFDvP0XaE5GWTnqg++gvB2jRFMJOHXCXpNE0yAxMHBXe/AwYkfbkQEu/skt8XmiXs
	AE1MX5GKYn68n8UVE8GZqw+z0g5bt6a3y0D+dpqIxVQOcHR+T19RQrOY1HyHkwr2KhN/G5SDys4
	Fj3yjxBqRsv+w5tVbSka5NoZzeNwZgkkexM6a3+YDNjiFOy1q/RT8KU8NLpNQaa8st/nS6LpIeh
	197WRMrEKfWUzzbWbE0LCixyNypI71zEPD7Q27vKzz8aNHt87qPI+X67zmDU83HEZJSItlOurb/
	zNOrxDD4YMkbux7EDS3+4bYQzsjgx
X-Received: by 2002:a17:90b:2689:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-392ec37c01cmr966958a91.6.1786427428022;
        Mon, 10 Aug 2026 22:50:28 -0700 (PDT)
X-Received: by 2002:a17:90b:2689:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-392ec37c01cmr966903a91.6.1786427427551;
        Mon, 10 Aug 2026 22:50:27 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d534ab78sm2062289a91.12.2026.08.10.22.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:50:27 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 11:20:02 +0530
Subject: [PATCH 2/2] pmdomain: core: Initialize state_idx to deepest state
 for OFF domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-domain_off_ss3-v1-2-6a0a0fc023f5@oss.qualcomm.com>
References: <20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com>
In-Reply-To: <20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786427415; l=3169;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=noGCtlEhc01PRgl/TejE7Msr9fur7y8T+UGMXIwtm0c=;
 b=D9am7/oqe122qna9Nn9H1nPHIpqFD1bL2sZOvl7tLN25181E35dmbfujCBe2tD9iPkJPBih/E
 KbnrOgeVBnNB64D06CJkjFUXgMU5qpDK66xl5dgHjd0dxpUt8CF9pNm
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA0NiBTYWx0ZWRfX7jRqN7TIBV1i
 VWlDh5aZlcYcAGUbniAqm7EgPIp4k2RjtApuSu3GL0GLEy1cgN9WyWp+Im+2q15XxDr2GZlnY3h
 wqrzuPRerop/y6NzS5tz1ULC5f4ScmM=
X-Proofpoint-GUID: zr7q-XnLoP1-07ixxHWyiM9fnyQHkEbt
X-Proofpoint-ORIG-GUID: zr7q-XnLoP1-07ixxHWyiM9fnyQHkEbt
X-Authority-Analysis: v=2.4 cv=cfDiaHDM c=1 sm=1 tr=0 ts=6a7ab824 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Z6difoz2d0IOI9WDWMkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA0NiBTYWx0ZWRfX/2KQTrk2/TGC
 +dCukd6rkwvL1BkFomK4lEeQXGJjtJ5H+aJG2XtmknN0RRnHFSrCy7TxnWChPZiiA8mKcCqpP8v
 7/vHXTa4h2DLBBQLB5YU2YG5aAd9APeKaZc69sOqbcODdZDg1lvKmerrXl4wE5j5CFfyHEkOPmt
 VouetOY+tOSzDws/DyBb/1UQbcqBX39Mqlisk6mtuVMlb7Nq07zY/aweefFv9UgY1zU93MIvzK6
 O4uIEFUYlNnR9anawWoXULxtGtCnOD1mjN/aYWxQTgvP5E0R+zzxk/DQOlRIVRrIq7ZP4QMqbMm
 vib7jvB5eWtt6hTnHBOdpQ4t9xkCpt3iaeJKXGUtETBzSzM8G2v6AIBwt0MuXMJSrxyrB09VOdG
 fAW+nIVqCXP9f9JLOA+JIsrbovdIg9TG7+/yPzusvls3pn0zE+16YlCb4TI+xwrMdgN4LYfZltP
 Go2rKgu4oLqIAiqDc6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110046

pm_genpd_init() sets genpd->status from is_off but never touches state_idx,
which stays at its kzalloc'd value of 0 (dt_idle_pd_alloc()) regardless of
is_off. A domain that starts OFF without ever having gone through an actual
power-off sequence is therefore left looking like it's parked at its
shallowest idle state (state_idx=0) instead of its deepest one, even though
it is fully powered down.

This is visible on hamoa, where cluster0/1/2 each expose two idle states,
CL4 (state_idx=0) and CL5 (state_idx=1, the deepest). When CPU-cluster
genpds are initialised directly into GENPD_STATE_OFF under OSI mode
("cpuidle: psci: Start CPU-cluster pmdomain OFF when OSI is used"),
clusters whose CPUs are excluded at boot (e.g. maxcpus=4, leaving clusters
1 and 2 untouched) never go through a power-off path, so their state_idx
remains 0 instead of the deepest 1. debugfs reports this as "off-0",
meaning the domain is off but parked at idle-state 0 (CL4) rather than
"off-1", idle-state 1 (CL5):

genpd_power_off() and genpd_sync_power_off() both gate parent power-off on
every child being at its deepest state index:

  if (child->state_idx < child->state_count - 1)
      return;

so the parent's check treats these fully-off children as "not yet at
deepest state" and refuses to power off, blocking the deepest system-level
low-power mode (SS3) from ever being entered.

Without this change:

  $ cat .../power-domain-cpu-cluster1/current_state
  off-0

  $ cat /sys/kernel/debug/qcom_stats/apss
  Count: 0
  Last Entered At: 0
  Last Exited At: 0
  Accumulated Duration: 0

Fix this at the source: when a domain is initialised OFF, set its state_idx
to its deepest state (state_count - 1) instead of leaving it at 0. This
makes genpd's reported state consistent with reality for every is_off=true
caller of pm_genpd_init(), not just the PSCI CPU-cluster case, and requires
no special-casing in the parent power-off checks.

With this change, the domain correctly reports its deepest state and SS3
is entered normally:

  $ cat .../power-domain-cpu-cluster1/current_state
  off-1

  $ cat /sys/kernel/debug/qcom_stats/apss
  Count: 218
  Last Entered At: 726792712
  Last Exited At: 726950687
  Accumulated Duration: 199888773

Fixes: e7d90cfac551 ("PM: domains: Prevent power off for parent unless child is in deepest state")
Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pmdomain/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 842c4169e290..5d96d9eabc1f 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2409,6 +2409,8 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 	INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
 	atomic_set(&genpd->sd_count, 0);
 	genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
+	if (is_off && genpd->state_count)
+		genpd->state_idx = genpd->state_count - 1;
 	genpd_set_stay_on(genpd, is_off);
 	genpd->sync_state = GENPD_SYNC_STATE_OFF;
 	genpd->device_count = 0;

-- 
2.43.0

