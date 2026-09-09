Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167155452AF
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 15:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968319; cv=none; b=gtkXxmgP6vVcJpZ1xZF1sKKX32nCLXOnQlsTLXpQiqtXYNgPJo9Na4sDbZKMq9dpyQ3cAk+4TCd4vNQRVDk69tAaJct7po7F6VSQpsfRXzgXRwiEiAoCInttRE0E1uoxGi5QNG7sJlqinTxM7tQ1KGHI5B+0jbtKK8zckfhTnRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968319; c=relaxed/simple;
	bh=bK+pjTe6cSWevCbFdLphzTe7FC7872g1Yx7XEYe6vzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tBb3llJxBfib9oKd5ll02OCAK3FxIBFplPvkazb99P86n2gfYyyb/b6d854d/59zOWZn5IBuSQeOIP36sai/eD6mScxrnSyWyq4KMfHifpz5nLDxYxGZAFEi/U1zEIW0u664wJige4NfTyrevgWBGJGzfU9d6hk6RhZIktHkqVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzbSr+yx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzbSr+yx"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d036e0e99so25348045e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 08:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788968316; x=1789573116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8S3fBhkCPJSV3cRNUQtxcR+vjeMJsdADNC9uYmwfZuQ=;
        b=bzbSr+yxXgC+zbqcZJT+TgOtNHhGxu8LMWsX2FAl0u27VjuxdXyFZGyxYdjPxvRMMI
         Ysev0faQyOVDQWUNLOmfQfxIhjEALE922aMdWhPSqd1tB+5Cce2XLbhNIvW6Eq5AnT3m
         BaVOlQb52y5LF7XER04H0I+qr1wVmeb3P0gGr9dy0V8is/srZBcqTFoRwOPe2qhilywW
         J/eJnzVlxfQLzy8kpgSBLBdEWRogmpwNYVYHKhov71pJ/AA9CchW33EtRAHfOBHB8vuv
         75H4rmtbj112+fj/jtX4yevRkxg2TIRDwP9kJB6lsKRGW6rebF7yArgv9JRWz/+I/Bw5
         +s2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968316; x=1789573116;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8S3fBhkCPJSV3cRNUQtxcR+vjeMJsdADNC9uYmwfZuQ=;
        b=CM/NkyBdiiM2KrvDQxIPqArAaz1Pv+1+tGLwJKsHnOJ3nRXX7RTKd/L5jyFWKSfmOJ
         TzXSJVQy1XLxVt4OyCcFtOGU2lQIXi/1EV/DIKNsju1kp7ECWXS78Dhibm3bEZWu677f
         SvBgWV00lCuXRpjI5e1HTsBGSxQxNSPSggpsF+79enT/pGQnOwUjrb3rH4NjVysUCWuO
         eMBomYxUmQ4wFIW701mPIgM7dKaSz7dcgvUEneyIkG0Dcamp894vBf7kCiAnYEMqC2xg
         s++jfpJdsCc0GWpGATfTNcNLB1g7l0MswT5Pj2iqE4tDoCq4UzhAzIL1RHzhlSzHORU1
         yslg==
X-Forwarded-Encrypted: i=1; AKwUvBxTLa89rJdyIU1R+3WU2WRVz+ZsMU8c1VY9RQcJwS9OEnp/UzmtS41ccGp/Da/DI00flaZLoHkyZtYTzXzs@vger.kernel.org
X-Gm-Message-State: AFuF++mpzUerhj2MnDm1q6A4V5WlDov552qGiEh4KX2ZgyDQHvXekJfE
	OlqXVomnTpEL9cq/63k2SJ9SFVxBoAMobiQHrFhXjxvMJ1Juxkx2+1eL
X-Gm-Gg: AYBFou0skNw7JPZWfGjKuJT7/XobJo4Gnszae3JdKsjBRo9TJxo0mwMrTHz7Ys6YQ6t
	mcJMXQX5SzSz2G5GzAWULj76JvOzIHcSJKRpLcL6WIKBk5M83BxdCNBFzUOCwWh1/Er1oPdoBl9
	i1/9A1Mgfb5jQGcMAC+cbP3VkwdqmW3xt4WP89RH0ojteIe9k79QcaeTdLCdNZXWOol+hPa6Qjr
	sMnTxY/e93O7iGhZ9cLSWIJOllkGtmkRb44Og7SPqzouOCyNYTpsF0lSqqd+dDc8wv8/XYjkKSn
	OB+7oad/mVadqVNsWFRVgDTt9LfQDqdwysSN7s5gC5Th1c77hrXrx2EEJrwtgTvR1NHJknKRTSE
	gkUW7S8GfxvHGN6K6KcsMVTq15kgtSDDUEP4PfvybTkVjZrFSlk/8LgZ7x30iKliR3nBDP1EG9v
	mLTjJAnCEy3E9udsWOaqy40rQA+h/3bxFJfMwb9ZW6Vb3S5RnmJsM+fTJ62EPA8ju7l2srX9p9q
	W+jemBdwUrwoU1a5ydw9yMdJpLrrejPUq6JwjnwaBsrROgDt0oBQg==
X-Received: by 2002:a05:600c:4505:b0:49c:dca2:ac47 with SMTP id 5b1f17b1804b1-49cf7fe607cmr338568715e9.2.1788968315686;
        Wed, 09 Sep 2026 08:38:35 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485883c81c3sm45437055f8f.26.2026.09.09.08.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:38:34 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Scott <mike.scott@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] phy: qcom: qmp-combo: do not decrement init_count on a forced init failure
Date: Wed,  9 Sep 2026 17:38:25 +0200
Message-ID: <178896830509.10915.10301668870227152275@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909152846.3C3931F00A3A@smtp.kernel.org>
References: <20260909152846.3C3931F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

You are right, and this patch should be dropped.  Please do not apply it.

The diagnosis in the commit message holds - a forced qmp_combo_com_init()
never takes the reference, because && short-circuits on !force, so the
unconditional decrement in the error path drops one that was never taken.
The remedy does not.

Tracing a consumer that holds phy_init(), so init_count is 1 and the block
is up, through a typec callback that does com_exit(force) then a com_init(force)
which fails:

  before this patch   init_count 0, hardware down.
                      a later com_exit(false) does --init_count -> -1, which
                      is non-zero, so it returns early: no double disable,
                      but the reference is lost and the count stays negative.

  with this patch     init_count 1, hardware down.
                      a later com_exit(false) does --init_count -> 0 and
                      proceeds to the full teardown, so
                      clk_disable_unprepare(), clk_bulk_disable_unprepare()
                      and regulator_bulk_disable() all run against resources
                      the error path already released.

So it swaps a silently negative counter for a real unbalanced disable, which
is worse than what it replaces.  Exactly what you asked.

The underlying problem is that init_count is being used for two different
things - how many consumers hold a reference, and whether the common block
is currently powered - and after a failed forced re-init those two diverge.
No adjustment to the single counter can express that, so I would rather send
nothing here than send another half fix.  I will come back to it with the
hardware state tracked separately, once I can convince myself the teardown
paths are balanced in every case.

Patch 2/2 does not touch the counter at all - it only stops both callbacks
carrying on to write PHY registers after the bringup has already failed and
left the clocks disabled - so it stands on its own and can still be applied.

The runtime PM patch it was a follow-up to is likewise independent:
https://lore.kernel.org/all/20260909140345.4239-1-okerixx@gmail.com/

pw-bot: changes-requested
