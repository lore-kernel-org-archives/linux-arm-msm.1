Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134CB33B6F1
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Aug 2026 17:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786209213; cv=none; b=bHInWgzJiJc8W42JzTax7YBcMj/3+mxI+3Z3L4kA0RPa4mYCZu3rg14lB3Jqoc2gz6+esJIr6g1GJE69JtAEADP3YRjS/brnfSiATCbLfzQOxowEYBcpGHoAnAtAkpFi2/jT5YXSz7EYmnfX7aBQbdh/fT+Juj/OnqiVO0GKQcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786209213; c=relaxed/simple;
	bh=/5WR1kuA9d0MD++CPjLuWZLfVM9V/6peYSG7Dopmysg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h44pjZwb+BZOmZOHGWljsKwjXx3kJvgzYtU3HRSS/bQ5hg4pl9poshYSsdAntHYYz0O7BgzGRRslsKIZCJ3CU2vVk2cb3eFylnHtSsqMWUEtWNQWPiJobKxi0L8iTh+NzdPYFAjG9iO4eLitf70a2NH3DQe7BIWSPrrLhVQw5+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hu0qcbTF; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hu0qcbTF"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-9030f8ea3b3so4437116d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 10:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786209211; x=1786814011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zSCFYsJi/YGsDjjzu9hgHmFBCe9GvVmfnZf9x92NT8=;
        b=hu0qcbTF3TGOWA0ghtzfgD9neoVYviW4DPyPuv7z7P7kBUh26nrWw4nddZ0db2PhlL
         iDh9zP0K3liTzgeKymb+sj3d9qMjt6LKoNSB+/2lrF9A/zS2Cg5Y1n6c8+Mcxvk9CFQ9
         euRjzs0gXEH5x4iSHSik9O8ynQnrHhnd//SgKCQRMS8aynk2wpo3AW8/v1K2grATTUz6
         xJsECEmffkpoF1/0x/aJ56Dqpqb7JG3Eo3LoXb7IqkW1/igxWPihsQFqHuMYlbKDtGAI
         BOkzOZSNu42bsYGpB1YEbohybn5PsYGNKUxuyc26Y2RYJWxIWPwMp1cgF8FZl3rwJ85g
         rMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786209211; x=1786814011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zSCFYsJi/YGsDjjzu9hgHmFBCe9GvVmfnZf9x92NT8=;
        b=qUa5AsXFeoOZa41J552wHxHA2gDKvmhr7xJPCsK5ttDdV4nkU4RjIoI2FFT95vrkxo
         xSNlPPbIjkvZpw4x9p6lcb/TBojkv2W6p8KvnxzBKQ/1WXb4q5CUOhJr2kN7zlLIwmKw
         1nSv/SEeMMIPvbcf9cG6HQv6f8pcuSZaRVg/6sm02QUqNY2j9ZSxMU80YASHuJ4ZaAxy
         RYRRULWFm2brkwahghHj20ioOPPl6ZQE+jUXEZvHEaze3yHGpA/VzRxNUb4UZ8kSdrav
         HP94ZzerQomAxKr5rgv4pKxhwPdaUBdhWRv5aTNRsfIWUR8KR4AXo2eAjCs7pFmJPZla
         6aeA==
X-Forwarded-Encrypted: i=1; AHgh+Rpqbwg7TVzXtOGRp0BvQ9L2YsT+C+9qiTUi1JSp8TUaMyh0yLeLnp9EyYCSdxZxwzybmhGXVbhtYXGkHgGE@vger.kernel.org
X-Gm-Message-State: AOJu0YxD0Sdng3bdutmVOs1797LuMHx94XTj/MYkJvJhRwqiVw7D2Jx7
	12Ehq1VDdIm0IyowagowaVhPOi11q17RixVqQNoZ0sk9NNM/KvSHx8yG
X-Gm-Gg: AR+sD10N+MnntrtsLDzcwQUR9AgNNXBhRNyE4rnCDrgRagHO5v5tXGYD2eUV8SUZ3fm
	9xDoIE+3McM0Lcn2eK8w6/TO1CDNBD8vuA5rU+4yIcEu251EO3phyXwJdqtM1C3gDDPiSy4w8k9
	s2D499jXNkMZX5ZYbK1LF2fkhIdPDxf50I8hUtj/+kwamnm4GcJ+fbpKXbaEqBlzDIk8VkeaeFy
	lsDZ6dyjZvTX0avDBiRPO4OdII+FQayNsoIyGrKn3ZKqjhMJCyUFhnPjXZrYUMF5hRHbZwStMsM
	F3KDcuHOukiFN2Dyq6ZwiaH96vbZRN2AtbDVKZwdgX7cFghUxcj+s9vTqSdG65GZiUkCrPAhYF4
	knyDrmoffEIRUJfv4wmmUbPzrl5Qya333IfXtMAuATbL0p8RAXsVDc+gPV4aaDMGZ7TZ8RZGrm1
	p6qw0jeVy3Fh/YDLt/WRi2LPIt6vHHsFGL42aUvPGhmRpCkMuB8dnjqbf91/p8pN/neLsh0ZOtd
	/5g5UVniQn+03/KzpTv92540FbedCjoP9ihEE0RTItTI5355oD5DZRRXpiSmnBeiTd1EDvv2g==
X-Received: by 2002:ad4:5ca9:0:b0:8ee:fbc5:8110 with SMTP id 6a1803df08f44-908813d33e8mr359375546d6.32.1786209210858;
        Sat, 08 Aug 2026 10:13:30 -0700 (PDT)
Received: from JesseofTheNorth.internal ([2600:4041:502b:ea00::1408])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a93258cbsm34265286d6.33.2026.08.08.10.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 10:13:29 -0700 (PDT)
From: Jesse Casco <jesse.casco@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dp: skip PUSH_IDLE when the link was never enabled
Date: Sat,  8 Aug 2026 13:13:25 -0400
Message-ID: <20260808171325.133041-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msm_dp_display_atomic_enable() returns early when link training fails,
leaving ->power_on false and the main link down.
msm_dp_display_atomic_disable() nevertheless writes DP_STATE_CTRL_PUSH_IDLE
and waits for an idle-pattern completion that cannot arrive, so every failed
enable is followed by "PUSH_IDLE pattern timedout".

Every other step of the teardown is already gated on that flag:
msm_dp_display_disable(), called from .atomic_post_disable(), returns early
on !power_on. The PUSH_IDLE write is the only one that is not, so the
controller's runtime-PM reference is then dropped without the link having
been taken down.

On glymur (Snapdragon X2 Elite) the consequence is not a warning. The SoC
does not survive it: TrustZone force-stops the SOCCP and ADSP remote
processors and the machine resets silently about 50 ms later, with no oops
and no panic. On an ASUS Zenbook A16 (UX3607OA), whose eDP panel does not
currently train, this reproduces without any compositor or GPU involvement:

  # eDP enable has already failed with "Failed link training (rc=-104)"
  echo 1 > /sys/class/graphics/fb0/blank

  [535.645455] === marker ===
  [535.694833] qcom_q6v5_pas d00000.remoteproc: fatal error received: \
                 sys_m_smsm.c:512:TZ force stop
  [535.694875] remoteproc remoteproc0: crash detected in soccp: type fatal error
  [535.728857] qcom_q6v5_pas 6800000.remoteproc: fatal error received: \
                 sys_m_smsm.c:783:err fatal notification received from TZ
  <SoC reset>

Gate the PUSH_IDLE write on ->power_on so the disable path is consistent
with the rest of the teardown. With this applied the same sequence is
harmless and the machine stays up; without it, it resets every time.

The unconditional write dates back to the original DP driver
(c943b4948b58 ("drm/msm/dp: add displayPort driver support")), but the
surrounding code has been restructured several times since, so no Fixes:
tag is offered.

Note that the eDP link-training failure that exposes this on the A16 is a
separate problem in the glymur eDP PHY and is reported separately; this
change is about not damaging the machine when training fails, for whatever
reason.

Tested on ASUS Zenbook A16 (UX3607OA), Snapdragon X2 Elite Extreme, on
linux-next next-20260803 and next-20260807. The machine has since been
running next-20260807 with this patch as its daily driver.

Assisted-by: Anthropic:Claude-Opus-5
Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bc646d172..5d2ddf180 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1458,6 +1458,20 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)

 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);

+	/*
+	 * If .atomic_enable() bailed out - link training failure is the common
+	 * case - the mainlink was never brought up and ->power_on stayed false.
+	 * Driving the PUSH_IDLE pattern into a controller that was never
+	 * enabled times out, and .atomic_post_disable() then drops the
+	 * controller's runtime-PM reference without tearing the PHY back down,
+	 * because msm_dp_display_disable() returns early on !power_on.  On
+	 * glymur (Snapdragon X2 Elite) that combination is answered by a
+	 * TrustZone-level SOCCP/ADSP force-stop and a silent SoC reset.
+	 * There is nothing to push idle, so leave it alone.
+	 */
+	if (!dp->power_on)
+		return;
+
 	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
 }

--
2.55.0
