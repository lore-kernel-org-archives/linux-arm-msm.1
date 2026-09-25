Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38D62BEC2B
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340807; cv=none; b=B/3GJe/ebkGGXtdqaVGi46WLHyNwCBfRlrGKqpF4I5lEq7UL9a56RVV0OhDA0hVKIUKY5/8Vzo83ZrQPmA9voy27JCr/Is86Q5UvkuCypQpbMjUftkssjqILpehFMgu7S3zNaKvoNvxOq1Ubz5J0ytf8x8EnvGym4T7eo/Ev8Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340807; c=relaxed/simple;
	bh=/7nhtfx0jmc9Eeafdo764s7X0PrVnvbgpM99LJYn/MI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kQAJFPmCuN5PW8w7AdzIOjGtPPUiUtZEI0SeTAPAOMZjGGipltnXrOd6leqjSvcf9+0TBvkp3CPISN2WkHj51K4oA3KQJ5w7SrMkCAVmxwCLtpLp1XVY5b5lb/rDZg9uxwWzSQZMuLtkB8TzC0cMvaOJIbOk7RViRTs2Lda4miQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pmjv/4FR; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pmjv/4FR"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so463177f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 05:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790340804; x=1790945604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HaRnV5HNxYS3xKGjNmztf83AWXiwarq2vGsbWimUVzc=;
        b=Pmjv/4FRknTyju4rLIG20qv+ITrfxeZY3lUv2lr07BuLdFLbx0ZW/fjnNO+bQwiadW
         mHC7iyx/ef4BWkjb+uLt53tMTQatIftfrswSHKg5PyjnmUIK84GOFlb5QcPsvaFUwxhS
         7FxxkN7+95+zl4h4JzCykaD4EKez+X562FodfF1C9slNy3awGvswhmDreZ2U/hEBE7F/
         9fLrvqNBGvwGSFSOPrgz+K/1tCwtVwmgAlePmxUeyz49i/iuL396kFBBNKYAwCGy1wGf
         2JajZHgpS9aILIU8Xu/s7CQslAjPVHz3749kDZzBRLZlcLTUMiIsI1FiVYvixtgIPTUy
         Nk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340804; x=1790945604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HaRnV5HNxYS3xKGjNmztf83AWXiwarq2vGsbWimUVzc=;
        b=Az10wNGMu6A5VGDTrYn8ccKB14F6voOGQlBAyK+ZcL7stN4yb+t/pv1KUT+H6Z8WhJ
         CjbmFjlEGanGM1B8e+46c7MvE8a8aI/4tchjcGn1kW8ad/07Y7gECyB8yrVTy+7wFbme
         aMCuQeE47s9GRyu8u4jdxxmue7crNhSgUb6iEljhJj0kqs9iZAgvHEYLWsnP4LYNB765
         1WMlFSRimPyMpNxx2RtaVKqitzDaZFANWeKG8V0akLaujGR0HeRRyR+WdmcqDfMrYMEy
         NnVjZ/urX8vcyobjO52mmkxwWkMPhfRvIJSNTi/66R4CmwahH1sb13eL1t9VeHLJZQFf
         +gMA==
X-Gm-Message-State: AFuF++kN5VgFdDOx8PmAcswqNJT5o4lq5as8Oj4lH8avIt9BXxKD15Ze
	CjBP9Wt0RxTmhOmiN7tdmgjKqKutkBHzo3dSrfvn5+gV2fQF78TSglew
X-Gm-Gg: AYBFou24fsFEUIJHb18/7VkNwHQwoRj4+kWqCYb7JoYXcrMMqrMzPcTKrHqLyjv4Npz
	Q8pjjvhFN1jw1TCcik6KV7K4htOVvYbPHWSkYlE6q44oa2TwkynHmc74FyZrIOvFHBFyj5r3TXZ
	RTv0rKu/jg4Z6gpWCytgP7o6vUQVaEvk50uMWvJZpxAGO6KQYq5D9sZFtto2aeniLNuMsbkG0rA
	ZbEOAE4/KeqaL0rXpOVfSKb2RemlsjELg9JXoXHRjvVvf6EFVUYWs4adFxUVQe+2zyEopIaJf92
	tkidSeIL96oAKwF1RPIosiuloyxBhxvQkjU1w420ycIaRzDZjjg4+xE+47tiy2aO08IDknsW6lF
	+z0rynV0+TDeQEmcp2BiKi0mx6v0t308sh0lNlCGQ9i71vHqodYjnZNe2PcBG7fa3S+33IRj+UB
	tQHaotg5qfJtqj8jSaNPuhnZSRyX+PqoAOnjwikrrXfupXQPeLrNSJQjd1MN+AxsIEsgkqKdX3P
	77G2vd/vA==
X-Received: by 2002:a05:6000:2083:b0:487:463:92d3 with SMTP id ffacd0b85a97d-4887171a473mr9808865f8f.20.1790340803845;
        Fri, 25 Sep 2026 05:53:23 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a355826sm7170296f8f.18.2026.09.25.05.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:53:23 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: don't report link training success after a reinit
Date: Fri, 25 Sep 2026 14:53:14 +0200
Message-ID: <20260925125314.16563-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When every training attempt fails, the retry loop in
msm_dp_ctrl_on_link() ends on a successful
msm_dp_ctrl_reinitialize_mainlink(), leaving rc at 0. The caller then
enables the stream on an untrained link and the display stays dark.

The retry counter only reaches zero in that case, so treat it as a
training failure.

Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2434,6 +2434,9 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
 	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN)
 		return rc;
 
+	if (!link_train_max_retries)
+		rc = -ETIMEDOUT;
+
 	if (rc == 0) {  /* link train successfully */
 		/*
 		 * do not stop train pattern here

base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
-- 
2.55.0
