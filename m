Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC22D2EB5A6
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785415607; cv=none; b=TPeYCnhjPmTwPNNyKa0Qo/xc41m+Jc9D6BVv+fuDyCNtoCXJ4jVBlQnN9Yko4sgzF7dz1HSN+/jlXUkWhtZaWzfH8gFj117krr1Rhl3nYGGlsaZrHG1J2R3kwmtFydu6ap4lSUBPwLCe/mgQ1RIl81Fmv6swmxUzJnQskRcHyeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785415607; c=relaxed/simple;
	bh=EFGTEjAar5YhWvy8+yn14BXjJJUj+nzWsgy1UuC08vU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nIgguQInvqjKbK7Tz2gIgNC/rel+MvVflTA/6V5FpeDBuw1uzzy/LH9Mk9/7kb9u1B2UT0DsNhfDkTjDO8VVtqebWh8OKunpI+TJp8cNOYNiUYZabhwyAVPb2kzmHn8kW14PuYhGw8PB6SOIxLxaGeXPDeXUetW0Cy52mGgI3Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+Srbpp6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fwyenrln; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+Srbpp6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fwyenrln"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UCkDH2779005
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BqbrmHoDLhgXhTFX5QmIyC
	tjQJ8YVIbFwSlJNmOQKlk=; b=o+Srbpp6NQVjwn7F7wSHgxJCd1fHqMQ0Kpz3H5
	W5T++fttx3gpwLCiaRFoQRS8BYHK0Z8MGodB9+OAWskvSMLFvQZ09MY4gt7DLPcl
	UV4+HavGsw31ITktZNT1Jvkxbj23oJcQA3uZTkZQJVYWW+0igybwnQcNXY+UtYb/
	fLAT8SzF1inBPk8WM3g2gsBjlNcJZcydolznKeLi/cWGv7SYS0N80XSjzER8PKGw
	YjohthjT1FPIcmlH7dlBge+VZmu0RMYWYO0KRBDX6wYAZaSQ4fenXIxuxEYiUD8+
	yyyjCRPK9qk9CHDIeMslWMXAievamMtKEkZEjB/Eo0QM7D0Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6wmg035-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 12:46:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so1338922a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 05:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785415604; x=1786020404; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BqbrmHoDLhgXhTFX5QmIyCtjQJ8YVIbFwSlJNmOQKlk=;
        b=Fwyenrlnn71F5nsad/DB18bhaYAjdWDakDjMkmFDdKBVl5hsFECcduHSwTDOlcqxpc
         kHSam7zZNThKdLo8d+Acs+0bL/h0f/sCpjGQqIRB2QnmolBAV9ZunkNvdET5UFCOyWxI
         T1ekgpUIVjtgQ7hlhZbclZvjtSE5bWuHMuhIAcUGDEji6X0S0CPPl0LsxyG1GOHdo/3a
         wFM1FCocEiBcfZb66ct8NQD8WLrowtEBZ+it7uhhAQUiwdHUbGzokjznW1UwDciJuS4N
         6fM3KohEOoFdD2szB9SDG9qtXTTWmqNHEQOfQPyeX74py8vCAv3yu59I31cDNFvz2pte
         dgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785415604; x=1786020404;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BqbrmHoDLhgXhTFX5QmIyCtjQJ8YVIbFwSlJNmOQKlk=;
        b=NlyDfAd3c7FfT1mTOyeyDkPYwkK4qIdU3uiUoM4D0mRTAcs8OWE6VXWAb2U2lRCLeX
         Mm0sBNP7n+tFVI6iBoe2D/SfcJtPz6vrqDP8REWMUNgbWdx3Vlb/OlA6Ch/zD0/wVTrT
         /35Jn38+UNckmtd4OACAppOeugtBfwCddg/w01yWHYcGEgpSAkQJMtB6KDuLSOAanfs7
         7xxf+Tc3KJRnzKLthqM4FjSfkosachC7nQsO7898+mNsl3+R1MvUb8kzmv4ygM4c2xs1
         JItDApIwwlfKQ3JL93SLm3PLk1SG3H7JLOJpqnuAmeMaFytDZbo0GsJ1UrLSFrnD+GBP
         J5Vg==
X-Gm-Message-State: AOJu0YwPRvA9jaoMZspbihgEvO3lxIewBiZV/EHf+s/IZxQp7xt49rla
	7OQMKeqjS7Ts2NfRY06UTa9UpWGUwoTZrU18sW+ReC3CrEShXLVsxNGce734fUP8CN5E10k0kFy
	YIZabrfUXiVLnX4E9OIGQxG+HKuF9C+zgDWYB/jaAFYKc+vRuCnTQaunK8PTAo+hXV6+4
X-Gm-Gg: AR+sD10leBvy2VFzzpn6VEIgaatuD8FgFM6fdilyevkoyIgHe++e9Slxokz9FbdggJx
	nu5UUqjlHk+RNp5+UnxNGJF2efcIcVHYwpWQZwF/F8It0i+5KMhYMpoI/ArBvRsBnWh5pLZWs60
	ohLQY3SNn88Lsri2DuCuqyl3apYNz5+Wb75md1eHJ4zyjUuiQUAm7Q7lqzUAhFh48rq1fqcLAIm
	c7KOBPrzkGiJVeVJS6QPnNYsp/rka/tiXOIeG7XRpeikpJuHWZXU85oJQF4xQh2+1DjK2jwkNn+
	3MTCoBRsAVAXqESXymUo5HguWYBNbuL5bUkHmOkHda1CizXWhYlVlyAgU8NkmoYIwJ18uGbUs0l
	/TcYNPk2SdMhJkepo0bxt7mKtPyI=
X-Received: by 2002:a05:6a21:3212:b0:3c3:8315:80b7 with SMTP id adf61e73a8af0-3c90066cd34mr2432464637.9.1785415604055;
        Thu, 30 Jul 2026 05:46:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:3212:b0:3c3:8315:80b7 with SMTP id adf61e73a8af0-3c90066cd34mr2432429637.9.1785415603465;
        Thu, 30 Jul 2026 05:46:43 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb824d421sm2137336a12.10.2026.07.30.05.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 05:46:42 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:16:26 +0530
Subject: [PATCH v2] drm/atomic-helper: tear down HPD/polling in
 drm_atomic_helper_shutdown()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-dpshutdown-v2-1-441fc5543bed@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKFHa2oC/22MywrDIBQFfyXcdQ0qRWlX/Y+SRXxVodHUm5iW4
 L/XZt3NgTkwswPaHCzCtdsh2xIwpNiAnzrQfowPS4JpDJxyQSWTxMzo18WkLRJ6lhfGnXaCKmj
 CnK0L7yN2Hxr7gEvKn6Nd2O/9mymMMKKo4Jo7aZxit4TYv9bxqdM09W1gqLV+AfXYiAKrAAAA
X-Change-ID: 20260717-dpshutdown-047912fcf60b
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785415598; l=3268;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=EFGTEjAar5YhWvy8+yn14BXjJJUj+nzWsgy1UuC08vU=;
 b=Eny1S2NirVpYVYcbGMfZ4+XgUkdnQhmG/cIII5qgjK70slzsbxMRLPZkzT6DqbbzX/nCsSBt5
 bRJTZ7HzH5ZDfzRraZnrlLkGiGyPT8FH7L7tWVfTYzb4gmVWCg2Yaoz
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5NiBTYWx0ZWRfXy7LhRDEeJTS5
 JK2OfgdqLA8zmH4TCiAtPYsC+bBK75alygI8vtCul+2zx4T2o6ewDMTaPnxD7Dowl4IaJDqcuw5
 hmIxvJ+/E155DDjJpU6ccDEhGJM8bgY=
X-Proofpoint-GUID: C9r4bdF2aWgLQ1N6Z3EwbaMEfS5fJJqb
X-Authority-Analysis: v=2.4 cv=OauoyBTY c=1 sm=1 tr=0 ts=6a6b47b4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-dNxFGlIl_otlAVcVrYA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: C9r4bdF2aWgLQ1N6Z3EwbaMEfS5fJJqb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5NiBTYWx0ZWRfX9k90NMqz3CaT
 3Czwgqe8png0YpgRal6KlieAviry/RIAgP5htoiOxwBu8hKSUkxOxAulE6k2i5iAGGRWfhFW6Rn
 pjbJmbv+aXyq3SPrrq3XzXLf7ol6tkytBiG50/UxEIvnzSB5D90GNs4RZfhBGzKeish1GHlYHlw
 YT3uqtug3KI7Jt4J4K9um4gi84Cdlqo3bldVQPwIVRhYE5JS3AbO08uZzi1zZc/Hjj0oys4Pt2d
 jbSPSAL+llqYSk/kyIgbhkzOcJtxlWLh8rqa89OqHkR/kcscVHZtpXFrx142XzvwXDrMbwmEi6P
 nH0E2ai02fEDR+xWmjVr2vU0TgJLcIBhNLeaV2QJ7R0PMA+TpxvI4DPRJwRLzvZmPu7vJmhDkUA
 5TeF/N16O4RZJUZn9U8GH0dFJjhPdAnVKgmYPvKkjy6cGxdutnnQHWuK5O0XXSK+1TS39ia/wMa
 Fq8A/vU3k52C81L9JmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300096

drm_atomic_helper_shutdown() disables all CRTCs but leaves output
polling and IRQ-driven hot-plug detection running. On reboot, a late
DP hot-plug-detect (HPD) IRQ can fire after apps_smmu has already
disabled translation for the display subsystem, causing the HPD
thread to kick off a new modeset that drives DPU/DP hardware and DMA
through a stale IOMMU mapping.

drm_atomic_helper_shutdown() disables all CRTCs first, but a pending
HPD IRQ thread wakes up afterwards, reads the DPCD, and fires an
unsolicited hotplug event that triggers a second atomic commit
turning the display back on -- right as the IOMMU is disabling
translation:

  systemd-shutdown[1]: Rebooting.
  msm_dpu: drm_atomic_commit: committing (shutdown disabling CRTCs)
  arm-smmu 3da0000.iommu: disabling translation
  msm_dpu: drm_dp_read_dpcd_caps (late HPD IRQ thread wakes up)
  msm_dpu: drm_sysfs_connector_hotplug_event: DP-1 hotplug event
  msm_dpu: drm_client_modeset_probe: DP-1 found preferred mode
  msm_dpu: drm_atomic_commit: committing (unsolicited, re-enables display)
  dpu_crtc_commit_kickoff: crtc94 first commit
  arm-smmu 15200000.iommu: disabling translation

drm_kms_helper_poll_fini() tears down this: it stops the output poll
worker and calls each connector's &drm_connector_helper_funcs.disable_hpd,
which for HPD-capable bridges masks the interrupt in hardware.

Reported on Qualcomm platforms such as lemans-evk and monaco-evk
during reboot stress testing.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
Changes in v2:
- Dropped the drm/msm/dp local .shutdown patch (disable_irq()/
  synchronize_irq() in dp_display.c)., fixed this at the DRM core
  level instead so every driver benefits, not just msm_dp.(Dmitry).
- Link to v1: https://lore.kernel.org/r/20260717-dpshutdown-v1-1-b062c2f7dfb1@oss.qualcomm.com
---
 drivers/gpu/drm/drm_atomic_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 285aac3554df..80c67623180a 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -43,6 +43,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_panic.h>
 #include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
 #include <drm/drm_self_refresh_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
@@ -3676,6 +3677,8 @@ EXPORT_SYMBOL(drm_atomic_helper_reset_crtc);
  *
  * This is just a convenience wrapper around drm_atomic_helper_disable_all(),
  * and it is the atomic version of drm_helper_force_disable_all().
+ *
+ * This also tears down output polling and HPD via drm_kms_helper_poll_fini().
  */
 void drm_atomic_helper_shutdown(struct drm_device *dev)
 {
@@ -3685,6 +3688,8 @@ void drm_atomic_helper_shutdown(struct drm_device *dev)
 	if (dev == NULL)
 		return;
 
+	drm_kms_helper_poll_fini(dev);
+
 	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 
 	ret = drm_atomic_helper_disable_all(dev, &ctx);

---
base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
change-id: 20260717-dpshutdown-047912fcf60b

Best regards,
-- 
Mahadevan P <mahadevan.p@oss.qualcomm.com>

