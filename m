Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0C73C1986
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 15:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869536; cv=none; b=k3wkYcRQoNAXGfSP6IbG0J9nMYYaqeTYICXKEwfmW3VwDPwqOnl+peoPeA2ehgEG+OKsxK6IDD1BVe6ynDvuEZ+W9uC1h2lUgQByhBnGvthkjZNAvLH/MtV6nwNSV9VTnEZzUqpBzOPQrTqzPPe+DBrdQtUl56oPxUjrU3gHhjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869536; c=relaxed/simple;
	bh=Ghe6fEUCCenF+Ta7gb+uXMeiwYxD1Md/lBsKHp67rtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SnGghTGC8t6qoxqGu0nDqCAyA6t0Cy8rIxY6ha9CTOKeWdPA21zJSlYMC08OYg8ZSc8wS7wx077TFt3OWSMbaGE/Zj2g0+NqlwuZwG61tDVO5MuuRp+hwawCIUbninMcl5ihcnwK670amTsw2JpMD8uES47S81CORMRku+pgsJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKIvmZ+R; arc=none smtp.client-ip=74.125.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKIvmZ+R"
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-333c363917bso2672302eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 08:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869533; x=1791474333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iGU1hp8RKvrBj9z5Cp9aU6FTf9xO9MFvbkhy3G4ASLY=;
        b=SKIvmZ+RFVxiynCPXi6gwt7jeqNhggt4krtKVg2uSfKGLOSjpYshafvJxCxWBxgqbE
         hbrDDM2cGj36Lqy83uwuSPx40avCZD8H8t7CI+Ft2smgEIV4Rl8aqQz8+u7fwnBhJdbm
         35scURKxejUjiN5ee+zJTm/QqoVec+/IrMgI4oGjqu7LiE02n4VhaqCL6RWnQ7wsUb7I
         hGoN5WTFN9kOEwFNnMFyPf/r2z+PRREXMNyTMiRQgF0cDVGul9oTk/4FiB4L1O/e4xVg
         fvvZq+R2jn9UDPdHIzcjCcSkbXR241vllDFQVcjjbiEjq53cgyPg88Ndu3vY3PSVlFwp
         hhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869533; x=1791474333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGU1hp8RKvrBj9z5Cp9aU6FTf9xO9MFvbkhy3G4ASLY=;
        b=IIOcfq+YuL3Dbz0O+b0B7fCvitbCX/jbMBfbF2Q9EfbFgslAYlQwPGoj7KV8gS/xJk
         DiFllGZVePjFv5qK9ghhvWHv4B/tHMuWQu6lEeSAJQeUdHu1XBUTL79w/7KHd3ARk6gd
         IkYmVBHwjoDzsUiH3q5MAw37kOukY227wQSNpkGLxIuw09g/rbGcqmALzGRLr/9c7uXb
         nH128kRqWtzKiahaF1mwgFtkaBW9spK4p/urM4WwECHsgX2BFGV0d8tYaEmtaY3qFqXb
         +t3yL05BsL+Kns79xkcXH2+o0753GgRIvDhp/bTZt60GAxWme5S2slMpKi9woIqKGU2q
         EoSg==
X-Forwarded-Encrypted: i=1; AKwUvBxOlnssTAM3gGgGq034qyJ7UdGBSJot1YUF0FdPkcXdPtA5izAo1IL7nVeg3imINMD2RXGeQxkf0Ltmo9Ai@vger.kernel.org
X-Gm-Message-State: AFuF++kGaC+rSDw1sXAvErKrVHe2kDbr7jTNpAli06lmN2hfD1K1tgRj
	6Pws/84CE0SBuoTJJeHuBtRnY2dxWZo1fjh2bf4+U9XYO6zr8ChLxen1
X-Gm-Gg: AYBFou0PPYnioHjOG76MFtszaTteDZYrg2XSWv0GJk+UNOQuCjbm4s4tzdVvvb+qG9a
	TBTnv+UGOcngjytsf6nJt+KPSE/i1WWYkp1ZPbQeG1pzeRo7BpbYixKqAE7aEvqyha0wvqD04uI
	f+/9BdI3TuLAPYZO/r6qumuNRfEjvgWR2ygJgmzy92ESSXifXleLi9n8xQYK0OlOqPyIQ4iO5Dl
	gQA9oNt9GdEK+04kqZIaId+y4p+sBEM3GHl1RT52qnFmG51p2asQFZRgX2iwwkCS5g6lANx3FLJ
	/9qgbrGYNwx/YScVrqwY/jiCfOGmftPUBRObs5w9EOG7zxOtAXrPGzHBzLiC4FZOzLSp0NSUVYJ
	orRJrK2l/EDhq0C+0TcD++ETvzpk8fM4H4ZXN7RE7XSnBD/3t5KY7AsgO9qJcRlgA+wTz7xVghU
	ajF+t4lu8zR+Nj1168aO7XhnapUAWAmYd/Z0NYPHumwXRMMgOFZqE1ijVpH3x9Z+BV8EKZQV4aJ
	vVFfJ04nr6eWRiFjHJBMDIl3nQ=
X-Received: by 2002:a05:693c:6392:10b0:342:39f5:f9c5 with SMTP id 5a478bee46e88-34cdc0d3cd5mr5212034eec.18.1790869495059;
        Thu, 01 Oct 2026 08:44:55 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34edab4beb8sm1869648eec.14.2026.10.01.08.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:44:54 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v8] media: qcom: iris: release OPP constraints on VPU power-on failure
Date: Thu,  1 Oct 2026 15:44:36 +0000
Message-ID: <20261001154436.20798-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The power-domain helpers update the OPP for core->dev while enabling
or disabling individual functional domains. The zero-rate request
used during cleanup selects the minimum OPP rather than disabling
the OPP constraints, so a failed VPU power-on can leave required-OPP
performance-state requests installed. Supplier reference cleanup
after a failed runtime resume does not itself request supplier
suspension.

Move the maximum OPP request to iris_vpu_power_on(), leaving the
power-domain helpers responsible for runtime PM operations.

When controller or hardware power-on fails after the OPP request
succeeds, run the existing resource cleanup, then disable the OPP
constraints with dev_pm_opp_set_opp(dev, NULL).

Report an OPP-disable failure without replacing the original error,
and continue ICC cleanup. Keep failures of the maximum OPP request on
the ICC-only cleanup path. Recovery from partial failures in the OPP
transition itself and the existing normal-power-off behavior are
outside this change.

Fixes: f6940b79fcb6 ("media: iris: Fix opp scaling of power domains")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v8:
- Rebase onto media-committers.git next.
- Adapt the OPP ownership change to the Media tree's separate
  power-domain helpers, preserving their runtime-PM return values.
- Update the commit message to describe the Media helper layout.

Changes in v7:
- Rebase the fix onto the updated power-domain and clock helpers.
- Remove OPP handling from the per-block power-domain and clock helpers.
- Keep the maximum OPP request in iris_vpu_power_on().
- Use the NULL-OPP disable path for failures after a successful maximum
  OPP request.
- Keep a separate ICC-only cleanup path when the maximum OPP request
  itself fails.
- Preserve the original power-on error if OPP disable fails.
- Update the Fixes tag to the commit that enabled required-OPP scaling
  for the supplier domains.

Changes in v6:
- Move OPP handling from the power-domain helpers to
  iris_vpu_power_on().
- Request the maximum OPP before powering on the controller and
  hardware.
- Add a zero-rate OPP request to the VPU power-on error path.
- Keep the power-domain helpers limited to runtime PM operations.
- Replace pm_runtime_get_sync() with pm_runtime_resume_and_get().
- Rename the patch to reflect the new approach.

Changes in v5:
- Return pm_runtime_resume_and_get() directly.
- Handle pm_runtime_put_sync() failures while preserving an earlier
  OPP-update error.
- Add a blank line before the rollback return.

Changes in v4:
- Convert the OPP rollback to a goto-based cleanup path.

 .../media/platform/qcom/iris/iris_resources.c   | 17 +----------------
 .../media/platform/qcom/iris/iris_vpu_common.c  | 12 ++++++++++--
 2 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 883ef7e75291..752b1e81b110 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -74,27 +74,12 @@ int iris_opp_set_rate(struct device *dev, unsigned long freq)
 
 int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
 {
-	int ret;
-
-	ret = iris_opp_set_rate(core->dev, ULONG_MAX);
-	if (ret)
-		return ret;
-
 	return pm_runtime_resume_and_get(pd_dev);
 }
 
 int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
 {
-	int ret;
-	int pm_ret;
-
-	ret = iris_opp_set_rate(core->dev, 0);
-
-	pm_ret = pm_runtime_put_sync(pd_dev);
-	if (!ret)
-		ret = pm_ret;
-
-	return ret;
+	return pm_runtime_put_sync(pd_dev);
 }
 
 static struct clk *iris_get_clk_by_type(struct iris_core *core, enum platform_clk_type clk_type)
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 243bd845349f..f277120e80ab 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -498,16 +498,20 @@ u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_siz
 int iris_vpu_power_on(struct iris_core *core)
 {
 	u32 freq;
-	int ret;
+	int ret, opp_ret;
 
 	ret = iris_set_icc_bw(core, INT_MAX);
 	if (ret)
 		goto err;
 
-	ret = core->iris_platform_data->vpu_ops->power_on_controller(core);
+	ret = iris_opp_set_rate(core->dev, ULONG_MAX);
 	if (ret)
 		goto err_unvote_icc;
 
+	ret = core->iris_platform_data->vpu_ops->power_on_controller(core);
+	if (ret)
+		goto err_opp;
+
 	ret = core->iris_platform_data->vpu_ops->power_on_hw(core);
 	if (ret)
 		goto err_power_off_ctrl;
@@ -527,6 +531,10 @@ int iris_vpu_power_on(struct iris_core *core)
 
 err_power_off_ctrl:
 	core->iris_platform_data->vpu_ops->power_off_controller(core);
+err_opp:
+	opp_ret = dev_pm_opp_set_opp(core->dev, NULL);
+	if (opp_ret)
+		dev_warn(core->dev, "failed to disable OPP: %d\n", opp_ret);
 err_unvote_icc:
 	iris_unset_icc_bw(core);
 err:

base-commit: c6fb304dc0253584cfcb93b6b97970c36850910a
-- 
2.43.0

