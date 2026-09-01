Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37C947D938
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 11:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788261305; cv=none; b=sXRVY0pQ28NMXzEgE+SQ5WRxm1BJIhHcx7sGWyrLioV+aHcJSZvEaq78UkM1X3H4fKHiGNCXJXgRiQVmwQWu6AYvQqtG/dB49GioZAwwtIsZmIKmpZSMqp9R6DDjuavpPb8GMLk9arBkZ13GmzMp5Jt3SlvBLta3BhfsZhQ/cV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788261305; c=relaxed/simple;
	bh=XMnpwKZrNARuXZb6puLfbaYUBZOhDXc1LgZgzOf5kdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hs3uAXBDoV1GtqtYjXxdg5RYQp1GyZd0maQuzk1J63Pz5ED9Zvi8zB54Ri7zGjtOjzHN0rDTwJ2SVR7G0cUXPEbu7mMP6k9p5PgHi6/QSPCiP+EoRQCUMBGP36cOKAZFskXLb+Y5YSHYfpVXnWXreNtCMgQFa58x4EFZsR7oETA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQWeNZEo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evJDtSmH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQWeNZEo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evJDtSmH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJcQr1713036
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 11:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rKQIdRf0x1m
	9XiJr/mtJMCpV7S0ghyR6HfmB0sQ4tyA=; b=hQWeNZEoayrCfa//QNEezARTFOn
	vwX/dlRWTSftRMLJMPQufjxr6nIccwl4dxUf6m87K2+3TCETs5sNFVi1EA2A1scL
	5sla7q3BGFtPwI0e8U0KEojXE31LrXxBK2jvjCy++ZNA4ikqdXgEtcPNJ4sd2QYx
	RSLfYxmGHV8jZmxAXgl/KZS3jJ0v15+xew1Qs/fXWtPIWPwHWdaheiILiii0Lhci
	pMonreXTnYqbaf+rP7zZrZW+ob/aFImkU/dbc5FImBghV7NzIEYSwkQvDGklEK6W
	oattx9BDsdEaOZ2sfEQgubJo/eax4p8vD8aUN3+9OAqXV200dEnjodJKrOA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndxa6vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 11:15:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e820609d9so917812085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 04:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261301; x=1788866101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKQIdRf0x1m9XiJr/mtJMCpV7S0ghyR6HfmB0sQ4tyA=;
        b=evJDtSmH3NtMIVcs2FnoOl5NZP/If6/3B9OKfeG9bz0bZjD72K5Bgppx/qNUlUagFa
         wmE8G+Pl15zSNWv5qqWuLy/oqnt3tpQs7ns2t4c5dCt7g7YrLHO3PLR2gzsQXsbLFA95
         aHOJ0msDvyYwki0pmnCnFYuvU4l9Jg1xlMW3TbUy06YhcW+Hwo6zvrwsU9+4eSr7Bro3
         dKKsCw4E1A0uXH2quA4Rko20AzZX6wWxYnMcFjzoDZSLqAdInT9uC9Ik8/47Kkd3XYwa
         QPeUQ7cVTax5A8a0DvU7uahtv/FMbDl0VIPshqYtDA2w0WLlYUew7YPbNGWcivjoHX9S
         LEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261301; x=1788866101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rKQIdRf0x1m9XiJr/mtJMCpV7S0ghyR6HfmB0sQ4tyA=;
        b=E0J6PJ/JSviWM6okAe1aVo7MM1za+YWvk/UqekGLdyrMm+yIVfyQVnzCwnkiCuFIdo
         Yo1jmMmDflwidb8AaCKJG1EDybnr9RU6OuWsJzo8aSvYS/M8P86Sf4IuwNuFKGtHyRrL
         +MIfCFHgsKwv5BMc1YBdxIDJiOmUgPrcxXE2LOFy5v6LQxdpN11J6BHakR65gCuUxF95
         Ef0ZAuOdwTIHwkLNrb+xsVhhj0KhIRYZfICXIcsi8KohvdYsStYuX+BVa4OEGqrgWouq
         Ckhy8gsneOyWEaKX8hA+epUO6zkvLr5eh2IZdpsxQvYGvy2nA+LtsGcZavZkgRjoCqQ0
         X9uA==
X-Forwarded-Encrypted: i=1; AHgh+RpYzS9iJlp5yQfAbX8Hgz8OJRZgv+Mbsoj08weYDohmXp/S5x9fhbZSBzGJ4zt7eRWk3ARoY0V/UX1xG2lQ@vger.kernel.org
X-Gm-Message-State: AFuF++l5yS/S7QFBi2BJFVkck5NlJQrzgvoCw9MFoygl8COYptAivuWg
	Nz9gmEYqNJDoUk6pDtQpbvo4aM2KJe+m8QTLaX/tl+ycLbzbfskMyqn07mB0FFNgreqOpaK4LKe
	wP3LlRzzw9K6nhsz6dZYD1VYKz9UP3b0fyqA85Sa2cYde5ZGJOz3haH/QrLtHCPVldpvB
X-Gm-Gg: AR+sD13baKxDNMDWFk6IKSBXjEUwmYlWj8blGTPEJUHFTFH8VhJ/QKaHNgAusDqJ/6H
	N9iNjUSn1RKvk065IfhesmVoRKUxNe/yNPLxji7u5mT6oTHAs5CrDA7IXltRlMQs9ywiNEWACol
	OONEoAvA8IsZ+nq9zQg9DeAYl9IVm2hldalX0r+vMDm5BflKAMHpxm1N4re676V8lGFIhHFohxv
	EYVeZV7eaFzpHkzoga0dH+WG5vu87uqOOu3VwVmOGMa2hAlgAmOQqQOTeGmVGVw+Or+447rbY0g
	XmBTY4S1N773EH/WBgtiMwYSMBhljK1PPHk95TNSKRPcYEDW1N8l0as98blXmSO0IO60OpOltxn
	YIzWJrm8RdpRIyHu+Tz+wWhOyG+6tADjQmwO0/vG4+WqVy1/CnGQcDdqvmA==
X-Received: by 2002:a05:620a:4086:b0:936:d360:2eb7 with SMTP id af79cd13be357-939480e7077mr922218385a.20.1788261300696;
        Tue, 01 Sep 2026 04:15:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4086:b0:936:d360:2eb7 with SMTP id af79cd13be357-939480e7077mr922183985a.20.1788261298122;
        Tue, 01 Sep 2026 04:14:58 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25878ba94csm380686366b.47.2026.09.01.04.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:14:57 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] cpuidle: psci: Initialize the PM domains in powered off state for OSI
Date: Tue,  1 Sep 2026 13:14:07 +0200
Message-ID: <20260901111441.122436-5-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4byY6-z5-ZtdvdaA1ydZb9TkPPpMNf2a
X-Proofpoint-ORIG-GUID: 4byY6-z5-ZtdvdaA1ydZb9TkPPpMNf2a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX3SWKwsfabpBD
 6jSLVv0vCXzt1h+BzF0MXXuatm/VlbW2c3ojxRFZauCxy7Uo428o5D8syIhd5uXEWKGc3MLZg3o
 0Td146jg+NY46HeJ8c9AU97to3ohLYo=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96b3b5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GddhhVl5-a8N4MGu71oA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX8iSu/WrZ7EHC
 vC+7AJQmUHeLkEYVNsTz5q0z5zKTgicfaEyqEDjoFW00ZlhP6NNQeLEkknezcHPpTVv+86FaALo
 PTkZno40c4R3xD9yRLTkRjODkwotIQTb2pj7JXhq9NlxAMUWBw0siGAdoffOPOkiOCNsv5/0gSK
 AF44+l3GUaSU1dxSGvhXo+0XJ8KtPg0SsC6zGuhAz466A7a7840BaLyewZ55J6Sr7HRWtjyppr4
 7YdPPok2n7rWYcjQ+Vgs2yGYh7HRmXy1VypocoufONScI3iiKZPjD7px1GRl8AJbdzy3Rjzqbss
 hJbkxky3bkW6y1aNUW9L6Rw74tWq72Ao1ugeRcyVON4C9z8HtZKUGa/S0iXEtRZo2JY2ZhZPyMJ
 c8FpszO/ToEgzMZ1v+7yoDwCa/ZY6r+zkhBskgDPZZ1lTTuSGFa9g9z79RziqxGqDrpA3OQLP4R
 AeToCeSEVn1F12/q9Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010099

At the point when the PM domain and the topology are registered through the
genpd subsystem, it's not really known whether corresponding CPUs are
online and thus if the PM domain should be initialized as powered on or
not. Instead this information becomes available when the CPU devices gets
attached to their respective PM domain through dt_idle_attach_cpu().

This is a problem when using PSCI OS-initiated mode, as we may end up with
a PM domain that has the genpd's status indicating it to be powered on,
while it in fact may not be the case. In the less severe scenario, this
leads to selecting a shallower domain idle state for the PM domain than
necessary. A more critical problem is when a non-CPU device shares the PM
domain, leading to their corresponding drivers not being able to trust the
status of it.

Let's fix these problems by initializing the state for the genpd's to be
powered off and in the deepest possible domain idle state, when using
OS-initiated mode. The support for ->sync_state() is maintained by setting
the GENPD_FLAG_POWER_UNKNOWN for the genpds in question.

Reported-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Link: https://lore.kernel.org/all/20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com/
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v2:
	- Fix a bug in the call to pm_genpd_init().

---
 drivers/cpuidle/cpuidle-psci-domain.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b9e4ad7d43a3..4d8c63d329c2 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -68,7 +68,8 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	 */
 	if (use_osi) {
 		pd->power_off = psci_pd_power_off;
-		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
+		pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP | GENPD_FLAG_POWER_UNKNOWN;
+		pd->state_idx = pd->state_count ? pd->state_count - 1 : 0;
 		if (IS_ENABLED(CONFIG_PREEMPT_RT))
 			pd->flags |= GENPD_FLAG_RPM_ALWAYS_ON;
 	} else {
@@ -78,7 +79,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	/* Use governor for CPU PM domains if it has some states to manage. */
 	pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
 
-	ret = pm_genpd_init(pd, pd_gov, false);
+	ret = pm_genpd_init(pd, pd_gov, use_osi);
 	if (ret)
 		goto free_pd_prov;
 
-- 
2.43.0

