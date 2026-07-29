Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0EC26B971
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785287413; cv=none; b=OcEgaGvzoo7txbK31nyHFZoJpeV68vStFBkQ2Xq8hgyjO1QpgTQl/s+EDlMC9aHv1J+76sky1Ag4ftZmOGU4iARZCaRpF4PHjdJDTHjzHgcmKvb9bmGSW/8JDooxGQQXcmCaw0kbiELGseTrA2Xj24XHOA0k51oL6ntbpMmyxhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785287413; c=relaxed/simple;
	bh=x81cnYi5xOey78pJKPMlaZD41CNHN+/vxuJqqkYhFFU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qGml8nn6Nob6GvjHJj+ZTIeqIfKIiT5/exbXftdBg7aaijT5X2HE82j++bbDbfQQ8jX/q4S+OGajObXz/WrahHvPFT1ynlVacd1TbuWuplt4YL0l40TLlATzuyUrv4Q4j6/544UXX3T2P1sleMjixYMRuCxD9Lt077UzR/36j7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2Az2hJS; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2Az2hJS"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-38111ea8a88so243070a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 18:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785287412; x=1785892212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RrRHwamG/gB0Gq5CSny5NYLFwDvRskbs4e08DWoZ9Jc=;
        b=m2Az2hJSnMYvjSIocaf/+NAQGNuy9z3iUZHf1UiqKKwUAlBSzbKxBU7f4Cpwg6Vy2T
         i8x9hN5o5ISyXVVtAwkTiqTCqSvWL9O06HKa16bffRVq6V8Glj9NM3WM42WPGovOZxzr
         55fckwpKIZ71ZHthQIupwABxDTMFRTSKlb1b6BJ5T2kPP+RbGxYiQdjCh53RYD0pX+Ky
         LMyn/zwZRSg7GnHcxDJvIZgWTg9tUSoN2JjOb/akerSt15ZQpYv9GqqQj2p1lx4UcrNl
         MdlV35hxlFzC0kjMnh1uSpnKbpv/WXYHtKFUOXx6KCoBrRcFwc+2q5drXvT6fmss/qBq
         vr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785287412; x=1785892212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RrRHwamG/gB0Gq5CSny5NYLFwDvRskbs4e08DWoZ9Jc=;
        b=Vj6ij8pgvyOZ5QLzjCHwUtZNy/1cMpQY9Bqayy3k75WT7tTbyM06cnbNQ4FyKebvDS
         K7PkQT8MzItObmYY+bpimhP1Fvx5DDrWjy7jVPceSya/GrYRWbq/86AMEizJIefMBXkX
         a54tqTwuirrxkeKhzWD8KmnzgUqxBOCKIoMLPbfo1v35a9VZRM4sQaCI9nb2tXGHM6AH
         unXw0TtJRqiYctSRNuqdI05UeZJkdTKrA5k9X86axJs1J7idOeZFpPx+Hd2vJ4kKBKAM
         MtbWOIeigVUTrotHkBbueuR8L6LtDfndLfGCuq8/M6u5SVDz4ry9J05TK4tTPYvAZmP9
         YC9w==
X-Forwarded-Encrypted: i=1; AHgh+RoPwepirFJTp3YxGrvxbF48nKKTYFnTOPkDLS4ncXm8fJ9V9eRvvuf7QmMR1nemu30t12YlXUgiYRcS8lxm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7DbKLJ86TPT9jBOqq1/TsQrRphZnWH+mgcTUNsquS0lZyDqsf
	Vu0nThWEQ7P4ajKuhz1UqhiZ+PkTnDlh9dHAPkudkTYYwbJj72cKep2A
X-Gm-Gg: AR+sD1027If1wRbaVsSwx7j740ddIVGV2lSJ8rxoH9CeDIUvO8dL07MFSnmfXl2Z5nj
	r4e4qfMjO5VayVIF4EJs7TjpuxYCy/JjCD1FisHwRKsk9vPtSImW3huAX3ed/9Z08o32fOrbqOT
	NdXZdsc1aMHp1LR7mpz+h0QbvOWqFCJac4FURpO1Ctyt0oSsliC1Wa/0McbSBq5oH7ex1iWk87n
	Lcmx3KopwFBg0f51/YToa7JHv6JA7Jbqva/lU2n0FvX+RumCfJAym9m4fSQm7Ow5MjddN1DSXcM
	tKXSNeb0/T55pHCqp/1AxeufIQ4G4AsjNWxy5ReLTL3STSMeRF6cmI4P9RTTtNarVkviSnQQQdd
	rDWxVp86vyugz/2itxf7qnGHitKroIQNgyjAbeLbMaqwOcciESiFioPHL1w979BgsEOX9LVxW3c
	swaBRZLxueV+eBIF1VuHKw5kDt5GbNbnMioQq7mBLKnBsYRuQXpl4GHTuKvW4Jn8ZUx7InDj2C6
	yl1rZauXhNXlt4wKSO1
X-Received: by 2002:a05:6300:6698:b0:3c4:3ada:384d with SMTP id adf61e73a8af0-3c8aafda266mr5682923637.30.1785287411686;
        Tue, 28 Jul 2026 18:10:11 -0700 (PDT)
Received: from localhost.localdomain ([76.86.179.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504927a7bsm3843783eec.0.2026.07.28.18.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:10:11 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v6] media: qcom: iris: move OPP handling to VPU power transaction
Date: Wed, 29 Jul 2026 01:10:01 +0000
Message-ID: <20260729011001.16999-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The power-domain helpers currently update the OPP for core->dev while
enabling or disabling one functional power domain. This makes a
transaction-wide performance state depend on a low-level helper and can
leave the maximum OPP selected when a later power-domain resume fails.

Move the maximum OPP request to iris_vpu_power_on(), after the ICC vote
and before powering on the controller and hardware. Unwind the OPP vote
together with the ICC vote on failures.

Keep the power-domain helpers limited to runtime PM and use
pm_runtime_resume_and_get() so a failed resume does not leave the usage
counter incremented.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v6:
- Move OPP handling from the power-domain helpers to
  iris_vpu_power_on().
- Request the maximum OPP before powering on the controller and
  hardware.
- Add OPP cleanup to the VPU power-on error path.
- Keep the power-domain helpers limited to runtime PM operations.
- Replace pm_runtime_get_sync() with pm_runtime_resume_and_get().
- Rename the patch to reflect the new approach.

Changes in v5:
- Add an error path to roll back the OPP vote when
  pm_runtime_resume_and_get() fails.

 .../media/platform/qcom/iris/iris_resources.c    | 16 +---------------
 .../media/platform/qcom/iris/iris_vpu_common.c   |  8 +++++++-
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index df9b7badf0c6..5cccbf0636b0 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -104,39 +104,25 @@ int iris_enable_power_domains(struct iris_core *core, enum platform_pm_domain_ty
 {
 	int pd_index = iris_get_pd_index_by_type(core, pd_type);
 	struct device *pd_dev;
-	int ret;
 
 	if (pd_index < 0)
 		return pd_index;
 
 	pd_dev = core->pmdomain_tbl->pd_devs[pd_index];
 
-	ret = iris_opp_set_rate(core->dev, ULONG_MAX);
-	if (ret)
-		return ret;
-
-	ret = pm_runtime_get_sync(pd_dev);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return pm_runtime_resume_and_get(pd_dev);
 }
 
 int iris_disable_power_domains(struct iris_core *core, enum platform_pm_domain_type pd_type)
 {
 	int pd_index = iris_get_pd_index_by_type(core, pd_type);
 	struct device *pd_dev;
-	int ret;
 
 	if (pd_index < 0)
 		return pd_index;
 
 	pd_dev = core->pmdomain_tbl->pd_devs[pd_index];
 
-	ret = iris_opp_set_rate(core->dev, 0);
-	if (ret)
-		return ret;
-
 	pm_runtime_put_sync(pd_dev);
 
 	return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ac9881e2cdc2..5209c32933db 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -472,10 +472,14 @@ int iris_vpu_power_on(struct iris_core *core)
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
@@ -495,6 +499,8 @@ int iris_vpu_power_on(struct iris_core *core)
 
 err_power_off_ctrl:
 	core->iris_platform_data->vpu_ops->power_off_controller(core);
+err_opp:
+	iris_opp_set_rate(core->dev, 0);
 err_unvote_icc:
 	iris_unset_icc_bw(core);
 err:
-- 
2.43.0

