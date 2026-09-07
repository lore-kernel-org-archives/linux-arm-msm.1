Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21F646EF8A
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 11:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779845; cv=none; b=oZna0huqNiz1rr0jFOdhVzXU/4+66fgs0PuMZF1ld2W0lyBxu9UHEJo/+rnlHBNkAnbNHy+7t9Tl8OQfWmFDzqo50h2Au0zNU3IZfaOeJr6CaQYJeT8dBdFUIjIVvHzRVtZUwS0d0Tiwp2/Vueiu1B1f23qwsnMlMzkCkK8ZG78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779845; c=relaxed/simple;
	bh=JtqgtDd2Rh6o3JXJUkEK1dOiQ9UhEEkpFWR+pRyPsVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1tOBb91QqbGwnP648mI9D09dbzxhXXOlyu6m0gYE3hjlO3SE0QIv7H1quUu6WpvzEKLh2sWMhBsTTUKEZfd/k5Q/PmbZOyq59WcAhxoYEgc7Efpu6QKaSux7kDWAuJSyOUE4cHdvXihyQe1ggUFQddIdAzDLl1U4pewtYUxxvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnzZioYA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fj8lZoUW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnzZioYA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fj8lZoUW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An4eO3349855
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 11:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=If4KmujJICE
	2NXAFfEbDRw+d56OpcwRKDELWSYebh9w=; b=KnzZioYA94fARoHLzS0nDuRDl1p
	7mYHCgrsxYB+pnvwjMCgn1DLfIKLb2bzB7GgFdDKURkslOrDyrtwXDYoTO9+O8QW
	xur2qtmoxBz7wIUIP4n3XWjcmVnehFWYYFOvzlxdDeHQBxZF4X+s6LfzGxeJ3mAn
	T7eUGGUmG2fOehnsGRBYXyyUXNxFZzgAMrjS5zNELXcNuS6akrJUAegQuQTFB1Yl
	IA5k9wewNj2wWfpyfSPIsx94NI0LiO8vTOoUG9x5K2qKYfPrzgdaQVBo/un6OqMv
	ihJPhTUVJ8vn64K5U6nWR26aPQSBFouJett9DPLSojdQMjPb4EvYDCRYgcA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0gmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 11:17:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9102f07f2fdso76148506d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 04:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779840; x=1789384640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=If4KmujJICE2NXAFfEbDRw+d56OpcwRKDELWSYebh9w=;
        b=Fj8lZoUWS8F1o/LYEOwRIWh/P/XQOsJlk1Y1Hm0A/G1jOFdNpPAe8V8hPlTaeaZ0rf
         Qh4yhQQjciRoORbtvW92AFh9fwC0vIfvA3MAKC3z+So/rd8IgbtOZye2QdKVF/y7b7aE
         Lork53doSeeobTHqan7j3ERmzUs3lQE7Vc2LcYzQf4OFt2k1BMkafY8APOsXl8/clAFr
         +PPOvB3eQ9xOgFXAB1aIQjshZFr4k0vCsYPJ0DCAqZPFh+ZYUJZHgBCw8gS1J92D3hhE
         DHHCcBL3C0awnMyshLprHvoATgPMLgpwy/04KZtJ2t6fAd3CwJriX5Si0HJBkVwXnywH
         9gEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779840; x=1789384640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=If4KmujJICE2NXAFfEbDRw+d56OpcwRKDELWSYebh9w=;
        b=jC5lCt6ooWMXn4JDm51TyHa54q5t1opk6gHKk79BqbfFnlQMtkCm3sGbNqYYk/GMMq
         B35S3JJXZ+6joVw1kGyca9EuwqUPkv2Vk+GahLUy2MrRqabYzNJkjQHaTiVdvyhguXVr
         /rkdG63sOdnd0Drj5w1vFfAg28kMjdT5VH5hxPBTm+0jtL9L0kH9pPRaoxfJWjCTI0KG
         fjqHqAKHLUsO392EKCQrw71M4nNmRNNBaeWP45GdD4KMiT5mKr8Rw52whjarx+mDETpE
         9cCgB+UA7MI3uINT0RRuJLhoKWUvIDzgU5On/a1R8NyE5Z+7A3MDZr3ElVdIS6+Re+7x
         6/Ug==
X-Forwarded-Encrypted: i=1; AKwUvBzGpXqch8DqX+fM19Gjud+BrDw+X7rke8bJazXQcO2Xayf9Sq8w7Jc7VpKs88AF8kJBwLWrqBL/0tYSDG8L@vger.kernel.org
X-Gm-Message-State: AFuF++m5jfKTXXwlWdB5lf7/TK4XMMhJz+vbNrg6poNK6Pz4f6y1YMzQ
	7914oCtF5K+PJXGO7Z67QbBj6Dow6KfLCcr4yniqnZ/3l1cyiVAKPk0U6idRCWC9Pkf2TX4/qm8
	Ti2HqClg3tjBMfALd/cBdFWKO9C38xnuUDsTZ+bq1aIgA9zxX+99x5NDqSS/7dl2XNBSC
X-Gm-Gg: AYBFou0Z0Ja0dadTcYNDnE0sPm/KIh/k06TTdo+8jBPHAIuGz+KA22XYVAj8H+dFUP8
	YXVThRCiTb0vr3cXN1wzoM+Dmt31xNQiifT90XxnHqhb1HjFq9ozJBsXoI/BZHkcEfTZs2JHRm0
	xzGflDKBKFLQm+49Qzc3h7kTlxLHXds0sATaavk9Ql6CY8bPFJ4FA3U9eH+tFsr7o/NBXGQycn7
	ry9Z7hmaPxfqYBE4NybaIP7d/I5Wxe0rFD4pAcOfGiaU3AtNp9Iz5eAwFvZykWdOOP0KLvV/kXB
	voX414ORo/ygXN5Jnu3pNYJhIPnPRhfmkKQqhabpUwsbME4aqU/W/LNN6sOpGIVQIk0lEAK4MCq
	6yIDGSpOFQLPEJA/ZlVZnukS++9SzYVasoBy2F4vAqPTs85XbWppBKu2amw==
X-Received: by 2002:a05:620a:a90b:b0:939:319f:d6e3 with SMTP id af79cd13be357-9396deadfa0mr1869565485a.5.1788779840524;
        Mon, 07 Sep 2026 04:17:20 -0700 (PDT)
X-Received: by 2002:a05:620a:a90b:b0:939:319f:d6e3 with SMTP id af79cd13be357-9396deadfa0mr1869560885a.5.1788779839979;
        Mon, 07 Sep 2026 04:17:19 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cfaa2sm456120066b.59.2026.09.07.04.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:17:19 -0700 (PDT)
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
Subject: [PATCH v3 4/5] cpuidle: psci: Initialize the PM domains in powered off state for OSI
Date: Mon,  7 Sep 2026 13:16:54 +0200
Message-ID: <20260907111659.263324-5-ulf.hansson@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9e9d41 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GddhhVl5-a8N4MGu71oA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: PEQn5M6FEbVIhfzJ1DSvBXIfacLnCieX
X-Proofpoint-ORIG-GUID: PEQn5M6FEbVIhfzJ1DSvBXIfacLnCieX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfXyLuqIChItLQm
 9GIUIPF5Hngln9vU6Q6GrA5pKFAQRuoBXfoZ2MDhoskag8KwrU+Pqtnk6Q82U7avdFCVbiGTsGi
 Z+ZQf8wGhvAQpgz9u2N7STW9jOX4Ixg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfXwowGfM0qZjpS
 /2z2R6ZaK6eoMpRLu7m95Xk85gvvAG+UUxnpaKij/PmVOZJcFy9tuyGgIwatI43sW5GZhTYUulK
 YxyeUb1nksmX/fQ1e6qmDnS593zV5m8E//Vb1fAWoBClyr88802DzHzc/8Y0JKvCMF9tSXSqDWE
 KBQoZ/eOsGqpuULcADLWh78eiszKfB+ct5jklHAkXZNayy0F0DbSdbom6kpx0HyN5/nIPYBnp8J
 oFLTLycrHCJSYaKO8hbU5nfUiaR8+eWGdFDBj8aAxUNjUKZVTcdfoj84nnBO+ikOO7q3RwSRPWM
 FkM/XjlpgrGWONInjH1UWNfv7EMe3EqKYuTjGmRw0Y6gMrbMi56qNNKKByBIvZUGa6Qt69lNYX+
 R78128WWA0ocLCxTnmCruKlPKVV9uG7I/w1fHens1cZHkIJlpZj6cJtDHdC8rseXVMR54g3cjOl
 jcyy+ggYSmfcHRkPGzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070124

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
Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v3:
	- None.
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

