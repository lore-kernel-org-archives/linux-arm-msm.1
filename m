Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792486650;
	b=AGIXYNqYJR4C1QGP0uiy+mpiaRKOJi/q7lcOTEZd8CnJorCN9CvSoWd4Yvo4AA0aD1a2
	 8dmrel9iGOKa5jwpGpdHG8QAqQp4mzpEfsUC+9u2Nt9R8dZqiMlf+jrQO+33Ou5ahmly5
	 oZDwIajRj3rYF9WoGd85hJmcdqMEfBIO9gY+FjCbJwywVVxV9sGOjnM1kXf0vcvzZoNPY
	 I7d0owAkv9Vsg3ktBWpbA+hYaMsjbVPMC27Ei/dqqquIER9KkhXFN1cjhe7OWqr1uqzbX
	 7ubxYbIHqU6jpVXI8CNI4Hk1LgHiBKgg7V/jaj5GmoMiMxReHA04dEyhPTGfj/P2EbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792486650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=yRgxxPfGJY8DFWCh/QAVbioiWlq3zShp/hCewrsxoHY=;
	b=rnYzGIS3ahgjbsU27g6S2htadPDghoB6bKYM94nGFAji1B6rI/vfJe9M6UKthfaAZWPX
	 SpyEqdQDQfIr0m4IMwY+eYJ87dmK8xZOFvS2IyDVNKjJGcQa8A1gaE6uNiAmXeGQSLR/m
	 CC//JNzOzKNk56wC+X3UkJ0LXHv3wscJOBT1r4A5pjMFA8iyD/FRdomuKlSXiempJOM4j
	 hiYh145TZunkT4c91e85gKSSHBOATmGU6QtWjMvZ5VCCFWGJdejxqHNjcGhju6uL5Ou9W
	 X8khKSxZU7QCTiyZnoczHpHnCuFqUoaUdmmy8DHyWGaaGh5L8NLDlcI8UXHbfI7K+Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lkiMEne0;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E13606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43E13606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lkiMEne0
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so14387175e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792486648; x=1793091448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yRgxxPfGJY8DFWCh/QAVbioiWlq3zShp/hCewrsxoHY=;
        b=lkiMEne0upiBrvkuuLz4cwNnunnb2ScP2EK56cdD1HVn7eRj5c1k27pSvXoa2IQ/+1
         R7hIldbiJtOU3LmUuzRON3nVS6Q9vWQ7iFTXqjv1Rz+mpgVaYdgSjhCUIYzHFegfdxWP
         24Ceg1aSBaQDxrZcefd4HFm3TZEPQ8wOOLZ3B3VIv6QjdoS0E7+eswEuBJ5v6YLFtZK+
         YvXiSNVBxxXb71TfKjSiWmSDo6YHS6uftSh50bDU6c27RLqUEshRkwD+bKJq3jZDqj27
         ZFv+QKxhOc7G7vaDF+RNKqZBluPVxQO8bfiuFmQqAICnNolE94D7SB/VJvyco0co+rtr
         +NKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792486648; x=1793091448;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yRgxxPfGJY8DFWCh/QAVbioiWlq3zShp/hCewrsxoHY=;
        b=0eohovx4AUZDU1P3jNx4sAsaJus4hglPlGbrnCf1IfjpFTy5FYrJxG5dU8iJuDIcjz
         T0vDvrB9fkTDIP6FtfD7XEgTIxfknYQOvn+tsCMavv/y+nYSUu4QUkj0oB4ZQtGj3VEA
         XXCaToLhophKSVctyeew/8HYLCKvO6VErH/236gmSi+2R9TIjTabQte2AR9GXvsACYg5
         gm6E6mh4w63YxHYMGVF4OGb9K25GYXeZTmjymB04yEsAK+gUCI/q4Bjj+zjSZ6mdjDJu
         GvnKu7eJhWtexx89ZGkDTkgncQd8v+vE+Wmw3lQWUH27+qto996DBtmx85rRBKcfhzLo
         uUSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqp1ar9mxhpJEObb5U0Lpv+B+Pt6dB3G0FoYEcivUtG/mbmP07IAFAUDFzFoaY6B8LozFAAgrA8FB+8nuM@vger.kernel.org
X-Gm-Message-State: AFq9FYKgswQ3o5iXg3zWxI7FFR7rgbD2eO+TVYTlJJBHk9Zng2y/hAZS
	mRZxWf2AUgBiXYYhoAuWUOTLT8C2oEBP6I4g+eBVIj/Xt5rbTZAXH2ba
X-Gm-Gg: AYBFou1pxbOoFS48ikEmKfRzpf1h6RrC3P0qtbdGMPc0H2pZVLJ3ZuLf8PIDS2EUPOq
	ZGEJ1uYNvCxFBhKn4qkHNBX77zn6KVxqmm0bXBpPoF/rB5t8wMwiJmtVCmsvDx5Dc31/b3GJu34
	cU9l+0nWEVKX38xTSYP6liL+pKo7DSFWppoNkR2zS+uNuW7ZvxTWX/FL1+NQjnuBhW9RNlhe2rs
	08oEPoPRRKTGiC5+AbnEtGvgc8cFuD6bI/GVDYSNEMznE3aPugMTr/ioEVPUmC1EEHTdpy/PfaA
	2vGuLqR3yA1FlC31kA3e87/hAwRNLjgWEWrmVN1UDKLLI80zQei0ZgblAMKV/zqMlWXO71T2Ohp
	H9uynirHL7uTcTvJsF/cT48hPIdB5L1rUgY92TVXl3JZ0mI5lERhpE9FOGOCGW3XNGaVZ46Ve/l
	sLkuB0S2IEkvJ3Sw7BoI37HIG3k1ocaL5BFY1082jSNRP73qcziil8/U2yPU6XkyY0D2C55ZPY8
	9ez1CXg
X-Received: by 2002:a05:600c:8883:b0:4a1:80d8:aed0 with SMTP id 5b1f17b1804b1-4a1d75fe793mr166287925e9.15.1792486648186;
        Tue, 20 Oct 2026 01:57:28 -0700 (PDT)
Received: from localhost.localdomain ([94.252.74.55])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1f2e8daffsm57580335e9.4.2026.10.20.01.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:57:27 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
Date: Tue, 20 Oct 2026 10:57:18 +0200
Message-ID: <179248663855.32151.9955864156939592299@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CACSVV00x091i7BKW+bj0RUnkd4rOrHXbhZ4zF6SuTU1NAqsFTA@mail.gmail.com>
References: <CACSVV00x091i7BKW+bj0RUnkd4rOrHXbhZ4zF6SuTU1NAqsFTA@mail.gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I guess this should be investigated further. Yoga Slim 7x Gen 11, no modules,
firmware built in, so the GMU comes up at 0.6 s.

It's rpmhpd. Before its sync_state, rpmhpd_aggregate_corner() pushes every
vote to the highest corner. The gxclkctl probe does a runtime resume/suspend
of its GFX and GMXC domains at 0.18 s (qcom_cc_probe -> pm_runtime -> genpd
-> rpmhpd_power_on), and from that point both rails are stuck at max until
rpmhpd syncs, which is at 2.8 s here. The GMU then does its CLX DCVS
calibration on a rail that won't move.

The GMU log buffer (fw v5.2.38) agrees: the calibration trace of the bad
boot matches the first good one step for step up to the ninth level. There
it stops, and the firmware puts HFI_F2H_MSG_ERROR 0x007306c7
"ResMgrCalibrateDcvsLvl" on the debug queue. The GX_BW_PERF_VOTE timeout is
simply the next message we send.

With gfx and gmxc taken out of the clamp (hack below) the first GPU init at
0.6 s just works, CLX tables included. Three boots so far.

The wedged GMU after a failed attempt is a different story. Retries after
rpmhpd's sync_state still die with "GMU firmware initialization timed out"
until gpucc's sync_state (fw_devlink timeout, 13 s) collapses CX. That's
what the gpu_cc_cx_gdsc/NO_STAY_ON thing in my earlier mail was about: the
recovery, not the cause.

The RSC side is not it. On A8xx the GMU firmware loads the RSC sequencer
code and TCS slots on its own; preloading them before the first boot made
no difference.

Abel's CRD failing even with msm loaded at 90 s doesn't match this, unless
something keeps gfx.lvl high on the CRD after sync_state. Could be a second
problem.

--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -1009,7 +1009,7 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *pd, unsigned int corner)
-	if (pd->state_synced) {
+	if (pd->state_synced || pd == &gfx || pd == &gmxc) {
 		to_active_sleep(pd, corner, &this_active_corner, &this_sleep_corner);
 	} else {
 		/* Clamp to highest corner if sync_state hasn't happened */

Oleg
