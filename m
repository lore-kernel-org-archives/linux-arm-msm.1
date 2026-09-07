Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221D546C858
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 11:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788779837; cv=none; b=eiZFTOxfa3zK6O9cwrd5AKG87Ymq5BhvCODSBlsnJlIpb8wZzDHhVnGokJCgrxTzs5B3GnlxcRo5eVQW8Xku3eCW4bXIa1oJdA28LNqF8hhukKV69iG5ki3EWpoSMwIR0x6PXCfZNguq8dJil68wC9p7H+1U7zD5pwwC89TfkvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788779837; c=relaxed/simple;
	bh=rtfTi8s7RnrDdgBmfWgzW5pFKcIkk1Hq5E0Rp7CqHm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Azah6tBWKlHqo3eC966EI08nGUtdkH1DYf5iGqxaa8iWM+qIeaeFXqSGLk2n+Gs/RazfDPaGSNKqQYjd7PMbWObOKgFrSuM5W//QC/CVoaHuR1HP005GOsBTRjTxuI1jyGG2beC2S+zKLM1rninwvbQ7ZDZulZIncHVc1kNgrR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e9E0eb5f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TdsctEgE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e9E0eb5f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TdsctEgE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnQoG217657
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 11:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uMpBv2fRBJd
	s8dHrhYUMdWkn5lQ9prASbg0GWZNOMRc=; b=e9E0eb5fQtChLbGgluVBn5yBJzG
	X0C/+XM2EPfeutvph+M/8GNqEgAIICjC0QGqwezaFPuT4bVwDncPRHhQGliD/znA
	SnjZjPxrs+suLrWdz+2KhEPbE1i37VCJ0HTCy7U4kk8yEYq2Wc/gUkD8Lj3WxflA
	Fnl/EZXHQYoL2eiKAzohK9GaC4axH0rqzpjrdRtKE6+iQSFEMh76cxxYQ2DhFHM6
	96kLjObHC4lOkSWlznpnC7xF9dxDdN7+LNUgnIc7b4LFg/+h2wkZhl/pfEiNvlqr
	Cv706Vrz3XDtb15sUSqdX/Oa0BQh7FaufilNr835ZoHeJKRmac0811ZTZ9w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqgheu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 11:17:13 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c58ce17b10so4214224e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 04:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779833; x=1789384633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uMpBv2fRBJds8dHrhYUMdWkn5lQ9prASbg0GWZNOMRc=;
        b=TdsctEgE86HAOK1j5qHrDSI47NTxfEbC/UI27rrI0cZZyAOB9J2FEh9MSPnzyOJbWk
         rAwh8hS+Kv8XuTleYtvDMzYl7Fmq2owncIookJjnF1iAtaja0OIJHMdSfLxmrTcE09W1
         7S75bKtiUnzd7oZjns7MOdsxshDAa9CJP8KSLjStUskcPG6TTnDQl3aG3Ws9X+tO6Tnb
         WqMhf1jJ4xvlDgDy8tj2GdpOI9/hemoG00p0XzfnkZxfCE0YT6YXTlO+g9HKYRgxJ2N6
         JMOC2jrQs+DVzmLR7jC7yGECqJ6UqOC9dreWUBEJryKODUddNNzy+HeJ9Ah0128R5q/G
         3oqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779833; x=1789384633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uMpBv2fRBJds8dHrhYUMdWkn5lQ9prASbg0GWZNOMRc=;
        b=FQuf9SyYThKrzgMjeRehS7JomV69rnkjLc4vuxnMPPj+y+Q9ZSKJvx6WujHu5Pd8gx
         sNF5nnbUI4RJ/khhiZFGzZ+Vp3moyyqsPUbKluKzImkIhF1xn6HWLK5lJcXjXjEIqZ+s
         IrnHnUBhJF2S87UTkgounDvGpcAq9xaXniqLEbQxzsmmbaeYh5K0W2qVP8l8sbk4JPAq
         rLLC9ntq1VUNpRfgJqCpKNipnbouSg1p4o12MSsjT9fjVCzJF+y6VzJvgKJnATdGib36
         hu5zSu6LDWSlcZiC7UkMXczm3jjvbJK074nHTmzoQZlXfyxfLTrTO3Gh5AESoY6ET5zA
         zLgA==
X-Forwarded-Encrypted: i=1; AKwUvBzpdxbgYI+DJwzJOBevGP6velhk7ZKkTBx+8Dd1JIbRKhHpCVRp5Aj0AMsGdqstMRD35wo1g0FSRchrCQ+h@vger.kernel.org
X-Gm-Message-State: AFuF++nJsvnzqA6dqy7QjkBh4JRrz0obgMTLk/4t1cyTNj+wUytZ8pEz
	C+6Hm1pT71sWgEEAH0Mqu6wSQvx84cWAERkE/ZQEVX5JXyhjBaojbz2ban7Y2Pcah9MpH/9tnaP
	SFjA/GR9oiVctvFX7F0b90CLhe6+3APaAv38tDQOIi74Llqujge5cVgoxBJhFvWdQLtR4
X-Gm-Gg: AYBFou0vKYudpXhrslvRdfeX7JJ18eN+LKttLg7pDB02MvcP/+SpjlGEgs0Q1sDAIte
	q0cXgjM71UKO4u+bWgQUB5660gNVeearSf6SDAVeiVQH3gBsaHX6obloV4u9jSMq9fE6XmDtBNQ
	bCVKjgxXh/hkvlrMk7x3bMok6NNiaCTWhvTIRUZCRw0cxQRbRXMEf8vdq23SGKAffUgmEhYCVOF
	XomYtq8EozeeTnib+PalSMM+JZF+jOztnEzm/MTvYm5REleD7ZuixDl+cpCS1rnT6XUc71x8Ebt
	ymzo2aq9oF7YDfWoIrPpXpNnCvHUFZZOp5crEBsxCtpdlq+jv2J6GIiNy1jWdBPgOVlQiKjKq/C
	9PbwqIQMljddvdQ69+IszIo4DU9ZWP/bs/nvSZ4QS0M5yjNJM/RU0esu+9g==
X-Received: by 2002:a05:6102:2c8e:b0:785:b0ac:54bb with SMTP id ada2fe7eead31-78a4a9eebcbmr7883343137.7.1788779832761;
        Mon, 07 Sep 2026 04:17:12 -0700 (PDT)
X-Received: by 2002:a05:6102:2c8e:b0:785:b0ac:54bb with SMTP id ada2fe7eead31-78a4a9eebcbmr7883320137.7.1788779832329;
        Mon, 07 Sep 2026 04:17:12 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cfaa2sm456120066b.59.2026.09.07.04.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:17:11 -0700 (PDT)
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
Subject: [PATCH v3 1/5] pmdomain: core: Rename genpd_status_on()
Date: Mon,  7 Sep 2026 13:16:51 +0200
Message-ID: <20260907111659.263324-2-ulf.hansson@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfX6G5ikP4ior6x
 arvsPmkOsqN80TLIH/RZpPIoMPvm/fvACgmPysXPpU0fRTPz9yOvkubhCOpihbkUshJZqly7u7U
 endivg8A1s6KT+CF6+/6epSqaiZrU3+V7UnD/aG5RDS6899Nxq5WPyLl/yeUfKG6cB+syHp9f/a
 9O/j3CmBM13vu+HQYq8k/xYlkhKei2i/14R87O9jb7OCkaedfYJZaMCvW52P77ePL+xEjcnTIB6
 LKPDp+vofdpl4M66vdvYODB3Obep72BTZCeCHZ1BaEXUkR4R05Wpl4lSiaNFPMURfyMO8K9la8J
 VkDWHOcfshAYe1wwgWiXtWHw1PbFe7cGxiNPhL7cYFtxUGGHCcvJ6kdmtqAaq5YGuYljdrjEbUA
 9uRQFcaR4C5YmatPTuQk2RkI/J7PKhC0JKrh/8tvE+I0YRP8x2IFDK2tA6QS80fd+Lre2tBujEE
 DYF8/HLQsINhJ/Kd1SQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfX++tEugpMMTpj
 9rABdHSAIrhxi+R9fE8JIQl3D5waSZ8o7zwAAHOEctMICBt8adwhS0oD6MYMQmCaycNYePIIEHp
 tI2/3JcUlH2UN29TqDCGlmOYYQXi7Ho=
X-Proofpoint-ORIG-GUID: WedLO1CdZWVq8vfsPh1liqsa-mPryHkH
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9e9d39 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=zIFADOUqQBSm_Ft5s84A:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: WedLO1CdZWVq8vfsPh1liqsa-mPryHkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070124

Rename the genpd_status_on() to genpd_status_on_unlocked() to make the name
available for a lock taking wrapper introduced by a subsequent change.

Suggested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Reviewed-by: Dhruva Gole <goledhruva@gmail.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v3:
	- Updated a comment in the code and the commit message.

Changes in v2:
	- New patch.
---
 drivers/pmdomain/core.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 052ec478dfcc..6abe8b198949 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -173,7 +173,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
 #define genpd_lock_interruptible(p)	p->lock_ops->lock_interruptible(p)
 #define genpd_unlock(p)			p->lock_ops->unlock(p)
 
-#define genpd_status_on(genpd)		(genpd->status == GENPD_STATE_ON)
+#define genpd_status_on_unlocked(genpd)	(genpd->status == GENPD_STATE_ON)
 #define genpd_is_irq_safe(genpd)	(genpd->flags & GENPD_FLAG_IRQ_SAFE)
 #define genpd_is_always_on(genpd)	(genpd->flags & GENPD_FLAG_ALWAYS_ON)
 #define genpd_is_active_wakeup(genpd)	(genpd->flags & GENPD_FLAG_ACTIVE_WAKEUP)
@@ -771,8 +771,7 @@ EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
  * @dev: Device to get the current power status
  *
  * This function checks whether the generic power domain associated with the
- * given device is on or not by verifying if genpd_status_on equals
- * GENPD_STATE_ON.
+ * given device is on or not by checking if genpd->status equals GENPD_STATE_ON.
  *
  * Note: this function returns the power status of the genpd at the time of the
  * call. The power status may change after due to activity from other devices
@@ -791,7 +790,7 @@ bool dev_pm_genpd_is_on(struct device *dev)
 		return false;
 
 	genpd_lock(genpd);
-	is_on = genpd_status_on(genpd);
+	is_on = genpd_status_on_unlocked(genpd);
 	genpd_unlock(genpd);
 
 	return is_on;
@@ -963,7 +962,7 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 	 * The domain was on at boot and still need to stay on.
 	 * The domain has a subdomain being powered on.
 	 */
-	if (!genpd_status_on(genpd) || genpd->prepared_count > 0 ||
+	if (!genpd_status_on_unlocked(genpd) || genpd->prepared_count > 0 ||
 	    genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd) ||
 	    genpd->stay_on || atomic_read(&genpd->sd_count) > 0)
 		return;
@@ -1040,7 +1039,7 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
 	struct gpd_link *link;
 	int ret = 0;
 
-	if (genpd_status_on(genpd))
+	if (genpd_status_on_unlocked(genpd))
 		return 0;
 
 	/* Reflect over the entered idle-states residency for debugfs. */
@@ -1406,7 +1405,7 @@ static void genpd_sync_power_off(struct generic_pm_domain *genpd, bool use_lock,
 {
 	struct gpd_link *link;
 
-	if (!genpd_status_on(genpd) || genpd_is_always_on(genpd))
+	if (!genpd_status_on_unlocked(genpd) || genpd_is_always_on(genpd))
 		return;
 
 	if (genpd->suspended_count != genpd->device_count
@@ -1472,7 +1471,7 @@ static void genpd_sync_power_on(struct generic_pm_domain *genpd, bool use_lock,
 {
 	struct gpd_link *link;
 
-	if (genpd_status_on(genpd))
+	if (genpd_status_on_unlocked(genpd))
 		return;
 
 	list_for_each_entry(link, &genpd->child_links, child_node) {
@@ -2170,7 +2169,8 @@ static int genpd_add_subdomain(struct generic_pm_domain *genpd,
 	genpd_lock(subdomain);
 	genpd_lock_nested(genpd, SINGLE_DEPTH_NESTING);
 
-	if (!genpd_status_on(genpd) && genpd_status_on(subdomain)) {
+	if (!genpd_status_on_unlocked(genpd) &&
+	    genpd_status_on_unlocked(subdomain)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -2186,7 +2186,7 @@ static int genpd_add_subdomain(struct generic_pm_domain *genpd,
 	list_add_tail(&link->parent_node, &genpd->parent_links);
 	link->child = subdomain;
 	list_add_tail(&link->child_node, &subdomain->child_links);
-	if (genpd_status_on(subdomain))
+	if (genpd_status_on_unlocked(subdomain))
 		genpd_sd_counter_inc(genpd);
 
  out:
@@ -2246,7 +2246,7 @@ int pm_genpd_remove_subdomain(struct generic_pm_domain *genpd,
 		list_del(&link->parent_node);
 		list_del(&link->child_node);
 		kfree(link);
-		if (genpd_status_on(subdomain))
+		if (genpd_status_on_unlocked(subdomain))
 			genpd_sd_counter_dec(genpd);
 
 		ret = 0;
@@ -2441,7 +2441,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 
 	/* Always-on domains must be powered on at initialization. */
 	if ((genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd)) &&
-			!genpd_status_on(genpd)) {
+			!genpd_status_on_unlocked(genpd)) {
 		pr_err("always-on PM domain %s is not on\n", genpd->name);
 		return -EINVAL;
 	}
@@ -3839,7 +3839,7 @@ static int genpd_summary_one(struct seq_file *s,
 
 	if (WARN_ON(genpd->status >= ARRAY_SIZE(status_lookup)))
 		goto exit;
-	if (!genpd_status_on(genpd))
+	if (!genpd_status_on_unlocked(genpd))
 		snprintf(state, sizeof(state), "%s-%u",
 			 status_lookup[genpd->status], genpd->state_idx);
 	else
-- 
2.43.0

