Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB112264AB
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 14:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791036189; cv=none; b=XDi2bYXmt1l6BHPBQ9wx6nir+/1Y3UAhXwDokzyojuvUflJJWOquOAtslaSqb2Xljiuno/Tp8JNvACWTzx2xTG0s/SbaGCeGLgTVr1cPh8s6WhOxFjseBr89vQEEZhg+5pR6VHjpYAjcVSSd1dsENkVRQ6D1/5IPJulFXUs/usc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791036189; c=relaxed/simple;
	bh=IBaxeDLan9/i0bQtOItAj+9uT9KYyqUuZvN8eMDm540=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B8+iLCE2xvSfxNBRcimI5xXrqOLD+GlT9hFUrhK9/sGJYq83ie56kP5HsFqeBs9SeLfV7FCCtI1WzLfu6+sWmUq6e9+Txw/+xSdP2Y3PuiIdKY5M7NGezcsEkF2XH4Lwn27FauKPelXQ5OWjtCKPrvzE/Arl/pGmPlkqc26RF40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfB438OU; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfB438OU"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a7ae04fef9so3117a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 07:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791036187; x=1791640987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPVsfgAMqK+ywkK3KFf7cHbYjBolttDJpT9AUFHshgc=;
        b=EfB438OUifNpHNbxY61YsBrgqIgtsF1p3uO2aYjabPLfOpkESCt/HNHvYQAJoCHbUd
         qbcGj/mymzNVoCkAcqxuMspDPo5S4wauvm/x6dKXAFlK9LMuXtRfUS/zHNLHabxqkcnK
         9EPTOIKbVV5vprFwxSdVc8P71YR+iOh6/XudpIsuTO93Ywnu5+w06BwpwEG5AtAlrP/a
         velwJmAcZPM24l9NONRcg3NT1/r927yGaSt2P/QWvNwCCsHotRvKgDtRXFZ5KBlIWrLe
         mCIfNYfqCy/9bKe3X3/MlXAqGCKlOrn86hTXlQniRzn3TPHYg1zvWW2KD+VHgcQI+J1E
         Rr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791036187; x=1791640987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gPVsfgAMqK+ywkK3KFf7cHbYjBolttDJpT9AUFHshgc=;
        b=qucVTSIMIgkADK0ya6jCaRfp5ON+QdMkYyaGAfOcf0ygGil0vbrfjZTwMMeSIV7JSx
         rtyhluR+k8Y4Z6D7D5pQTCmUUYiyge9TVG521GuPpwRmrVZLL0YFjd2Jhsupj1gl3/LK
         wae+MWOGZt0DyRc/Q8YsxCKCmSaI+hQURIACzx5UaB6y9irLOZJed/7t2asqJPkksTVb
         4RBaQUWFnOsOGwv3vo6AXvzqDA5HrXEpdsKJheKSiWXjOVL1bRJeAeWOfX/1qHzNqgen
         P/IRuH3SdC2jpXmgK0X0oKLdGPBvJ7Bs6CS4EUci/0Ifwssi4t5a6NMxvF9kab9EihhD
         WX/w==
X-Forwarded-Encrypted: i=1; AKwUvBzbnkPWOz4X0OlzFFzbKlXAEKt5AAOCkndIDZxiK+J6lbQf5FYYWST33rxMdZm8zazp7fuBwEXeVW5/IHhf@vger.kernel.org
X-Gm-Message-State: AFq9FYIGfID0NhbmnKmAdWJQGpZYID97Xn0GBFCCWnxjxwztqada/ybX
	j4B/iriOXDSjqxiXXmOgRtBIMB0VTO6HNgy7wKaqF8jkRgK+wz/7SE67
X-Gm-Gg: AYBFou2MLEbE3CdGSMNmC0ZjXg5WnwCsQTYTsMuIPbLm3+fqg6Ju9PcapiTxsoKIrbo
	TysghnYSmb5wz8XM9ki0FI/38xT6TzL9A+c1+OQcAl/3XrA4huvBI9AuiaG+nr4mbjQfsxvGxYb
	k5Hk9cGUjBe57oVGO7AA43oKa3zo1Evs56KO0HOx+Rd48Pr/zQX7JlP27nGxmeZaJO702wFZSO+
	2v9VtrcVaxfcZX0xbEOujWG4Zj9S1K/9nUzpQTYmK+wO26BFHyrUHYIiVUX3CRbX7EGyJ86I5/O
	OxFSyk4JEn1Uz1eENCtGA4Ed3Uv6xPsWR+L/48fkTcwYC6OTE2ypsRWNPMp6wkloaE8ARvve2Zd
	/roPidwnRKEtAJ1/RdsoYc5JtYbPwhfJJZ84ZhL+1GhnQoLObhEfjrW4PX6DVBr+5lEfhhg61Hd
	rvEGwc9JrigPipQRVeTxl5Co09tjPVrxupwWEoPwazz3AxCE9oIyL89efpUbKPdzIK8dJFPuUiZ
	9Q5EEEZh1AQxbBAW3r+PFYG
X-Received: by 2002:a17:90a:2c84:b0:3a6:e61f:74a5 with SMTP id 98e67ed59e1d1-3a6e61fd172mr4976050a91.2.1791036187517;
        Sat, 03 Oct 2026 07:03:07 -0700 (PDT)
Received: from jfliu-sfa1411.. ([240e:36d:b08:2830:b0c8:a25a:ac61:38bc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d6610a2sm3258882a91.6.2026.10.03.07.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 07:03:06 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: abelvesa@kernel.org,
	andersson@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liujianfeng1994@gmail.com,
	lumag@kernel.org,
	quic_rjendra@quicinc.com,
	sboyd@kernel.org
Subject: Re: [PATCH] clk: qcom: dispcc-x1e80100: don't disable display PLLs in the unused-clock sweep
Date: Sat,  3 Oct 2026 22:02:56 +0800
Message-ID: <20261003140257.3790-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <801e79b4-f45c-4f23-8b8d-5ac301d77e9d@oss.qualcomm.com>
References: <801e79b4-f45c-4f23-8b8d-5ac301d77e9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Konrad,

Thanks for the pointer! I gave Brian's series [1] a shot on a
7.3-rc4 based tree with my pll0 patch reverted (the trivial
conflict in the pmdomain hunk resolved by hand), and on this
platform it does not solve the issue - it actually makes things
worse.

With the series applied, the unused-clock sweeps for the display
providers fire at 1.4-1.5s, which lands *inside* the display
bring-up sequence instead of before it:

    [    1.381597] tcsrcc-x1e80100 1fc0000.clock-controller: clk: Disabling unused clocks
    [    1.468038] qcom-edp-phy aec5a00.phy: clk: Disabling unused clocks
    [    1.468194] dispcc-x1e80100 af00000.clock-controller: clk: Disabling unused clocks
    [    1.807670] msm_dpu ae01000.display-controller: bound ae90000.displayport-controller (ops msm_dp_display_comp_ops [msm])
    [    1.808271] msm_dpu ae01000.display-controller: bound aea0000.displayport-controller (ops msm_dp_display_comp_ops [msm])
    [    1.810010] msm_dpu ae01000.display-controller: bound ae9a000.displayport-controller (ops msm_dp_display_comp_ops [msm])
    [    1.860460] [drm:dpu_kms_hw_init:1168] dpu hardware revision:0x90020000
    [    2.002334] msm_dpu ae01000.display-controller: [drm] fb0: msmdrmfb frame buffer device

The reason is that the mdss device's probe returns early; the
actual display bring-up happens later through the component
framework (controllers binding at 1.8s, first modeset after
that). The driver core only sees "probed", so sync_state fires
before any of the display clocks have been claimed:

  - tcsrcc's sweep at 1.381s disables tcsr_edp_clkref_en while
    the eDP PHY is still mid-probe (the PHY is about to claim it
    as its "ref" clock)
  - the eDP PHY provider's own sweep at 1.468s disables its
    link/pixel output clocks
  - dispcc's sweep at 1.468s disables all of
    disp_cc_mdss_dptx3_{aux,link,pixel0}*, whose consumer (the
    DP controller) only binds at 1.8s
  - disp_cc_pll0 is still swept at 1.468s, so the reset-relock
    lottery from my patch's commit message remains as well

The outcome is again a ~50% per-boot lottery, just with a
different and harsher failure mode. In 2 out of 4 boots the eDP
panel came up broken: the top third of the screen shows fine
green/black striping and the lower two thirds stay black. On
the broken boots the final clk_summary shows the whole eDP link
clock chain disabled and unclaimed (disp_cc_mdss_dptx3_{aux,
link,pixel0}*, tcsr_edp_clkref_en, and even the eDP PHY's own
link/vco_div clocks), i.e. the bring-up failed right where the
sweeps had just fired. On the good boots the same clocks are all
claimed and enabled. The per-boot variable is simply whether the
sweeps at 1.38-1.47s happen to land before or after the DP
controller and the PHY claim their clocks.

So for this class of problems - firmware handover state, where
the hardware consumes clocks that the CCF does not know about
yet, and whose drivers enable them later than probe() - sync_state
trades the old race for a new one: the trigger ("all consumers
probed") still precedes the moment the clocks actually get
enabled, and the decision (enable_count == 0) still cannot see
the firmware-provided state. The original relock lottery remains
as well, since disp_cc_pll0 is still swept at 1.468s, before
mdp_clk is first enabled at ~1.86s.

I do think the series is valuable for the module / late-probe
cases it targets, and I'm happy to help testing it further. But
the pll0 fix still seems needed, not least because it can be
backported to stable branches while the sync_state work lands.

Full dmesg and clk_summary captures from both the good and broken
boots are available on request.

[1] https://lore.kernel.org/linux-arm-msm/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/

Jianfeng
