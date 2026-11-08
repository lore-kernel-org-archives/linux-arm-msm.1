Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794100503;
	b=aKYU3aHvbvhdHctWtOaAhfmLqvBH+udlY4DhIUi9wmuBtj4p+v83Kqz+Pxh6YBnsW3VG
	 mW4JtzgYUrr7/KeUfLuhIz+9dWjgoeODUJtj1jIjLxP6iBbqYsDY4w+thgNYgBgx0VJzW
	 n+dMirQhxB89cbYubhif82U1fqlnxXaPVGtQYekWN1ql8+SPP7dRYsMuXPJVBo485ykI7
	 tOF4sO8mx58Uao31UM4wbIWpIrLT1zjDggNg9w1up0S10gtxmGa69UeJMfih5NH1zFI/W
	 moifBcxvJ5TjOQMMWuY2fr+lZE5OvmicAUIXjYg9lUud9NDeaW0Hmo930HSfofS+jJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794100503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=u9X20r2n586k0YtBJ9MVy2V2Dt8dvj2V/QpRqyWFCCU=;
	b=YWbG1KrpZTJ5Pu236X+vZPkbOsDvR0naRc3NtqP51h4LCJEmhKV2052hAZDeCDTwpE8C
	 FwMPeSPTaJ2BsjyZS/LM3dv0qghufCernCf9G/mC2uIjyEotoJVhVrLPaZvtv5kQ+AizJ
	 es03Y68/z7k6eJCOKhpi+2o/YHVQNMvyZDBC0ZzM1TmL1rkHJPL11r1lnX4RqCTvTn4S8
	 EvouLaYmKH2mngGsf119dLqf5epPnc2BDjnLXKIDLou1NI33iry3F9BnEPH2AnZTqfg6X
	 sMAjUw2RzGUhabqTpF5tPs1t16dM+YxrlA2bPJ8GYzz3ftP4C/2wW6I2cFmT1rC1jJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IdS6S4Bg;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25823606A337
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 01:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25823606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IdS6S4Bg
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-170135e43c7so113172c88.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 17:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794100502; x=1794705302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u9X20r2n586k0YtBJ9MVy2V2Dt8dvj2V/QpRqyWFCCU=;
        b=IdS6S4Bg7/G8WvQe6u6Ge/5XSOgKCT/uxehRpBDd3WD7rJJWwPZfW6UeUCy3nY1Z6Y
         uMzrsaEuUzUJAGgf6pxlJB7COSzivO89RQUupmf/gxBN6X90wcSe7MMbAPt40H84mKCW
         7jsr5ZwfJJqTGN2T2aV66dBZyVDcC1I3tRfcdouXhzTKlrcxGW/X7HJUcpBIzUNjV+F0
         HeAA8VG2MocGX/MDpynswKZZPFdjV7z1eXiGxjIMPp4I1j8X8EM45TaGBdRr3OHuFiG/
         fUxpYQva4D6tBpa/Wt1ePn10O+SprOnbcIom5EiPZowqqXVxKw/p+cllV8Pa286VtsJi
         pdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794100502; x=1794705302;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9X20r2n586k0YtBJ9MVy2V2Dt8dvj2V/QpRqyWFCCU=;
        b=CII2RctO/BYbeQuo7TYxJiF3QiKepl1imUY+miK5C3gRD+6ci7GTQRJ1h3vj0c8ZqU
         7vD0ry3vzarqXiKG3wzvBlWv9WfuwsmTeRZ9rGqw/r4LlUbVx4UEI1obIP3zPtQu4k/d
         19KidywrEU4Qmyp0LT6Wirhkd458X3TmLIEMTvPud3KtZtx1oAGqwA+CghlFnFskYoln
         bCeEft4SGJ3QHaDSPt9KR06Im8I5waVxOQl6jGH9q/V/iCvcrTDr9sL5HbNONBzYzeOE
         vA/HFrLu1DK4tUdXk+YWrYR85Py+jSKp4DQI/EArPYpM8r8bV1BDizkAiyruJZdNOggA
         T/4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzeus27kVXrjlWlsT4kjy5cUxgjev5B01AB/4XQEp2vOpn+q36GJGPajiu3aaruEyh+o53GaFj6wLF1zqX9@vger.kernel.org
X-Gm-Message-State: APuU4Z8VpAFXy3BUCWrdjZpOhApuNXYqTuXqxXy9bjgYysYz7IbFVwVP
	xCMdjYaNQZ2aDav7Fb8yc027g+OtxvZATiNSk2zAv0EtklrjBKnIv3YS
X-Gm-Gg: AYBFou2ylLxFwUopA4C0OoX9qqnAnckut1JrgMKjCkR3YN9aRIASz1vYhZYjAAREU08
	bH+NjW6off2OJnSeGMx//BumxwuTbJF0MPQUh4hAv4BnE7ot0scVq2rqUKgXU1JgkvGYb25sOwG
	cAUQFkw7XL7drRiZQ+l011PGLHou+9DrWlUS6Oh/XMFNyHwmOdItz1YLDSf4RPQh0QyrJDDxZcX
	tic00zw4CWBYTgdar7ZgYquXxzrsJkaZxkaIRH8ztV4iQzdlyyRbIwFCptMK/9QQ5DjrSF68Lal
	pls6Rfxd2ZCPaTDrvkkoXnACVQtbs+eCoorATA4zoskX9+wi+Ufa2frAPcadk7DeNJYigLVKd+u
	lbNaNbJD4woZdhEHJn8xhxcZHjr3pXp1M2VoYYwiqv9PArp6TjDR+HaSK2EEoXxmZgkv8z5FCrS
	2e43IC5gu6RF6t7mRvHZMaef5zOMQ4UJ/ZtY7wUqE1ZkAu0jSu+PP+y6nh3gEO845XRkJ8kaIBl
	Ngt/cllD9AGjCvdsi8x+PrXt6qUl/0tks4U0n4h/FIEY4gMvPdgbTJq08y2FffsBXkPj3q4ISBH
	Fk2Q7jIMKZSJ2X0CBSeAPDUWeXxBAq2F7lI3dYT2de1Uywu59ZmXfkHznyeX49dsEg==
X-Received: by 2002:a05:7022:b045:20b0:1ac:9da7:e881 with SMTP id a92af1059eb24-1b39ff16e06mr339869c88.36.1794100501891;
        Sat, 07 Nov 2026 17:15:01 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375603ee8sm1916788c88.9.2026.11.07.17.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 17:15:01 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 7/9] drm/msm/dp: handle the IRQ_HPD events reported by USB-C
Date: Sun,  8 Nov 2026 10:15:01 +0900
Message-ID: <20261108011501.4466-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261024-hpd-irq-events-v8-7-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com> <20261024-hpd-irq-events-v8-7-6ee949e7a384@oss.qualcomm.com>
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

On Sat, 24 Oct 2026 03:35:23 +0300, Dmitry Baryshkov wrote:
> +		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
> +		    event == DRM_CONNECTOR_DP_IRQ_HPD)
> +			msm_dp_irq_hpd_handle(dp);

With this, an IRQ_HPD that arrives while the link is down hangs the
board. I hit it on the Lenovo Y700 Gen 5 (TB323FU, Kaanapali), DP over
USB-C (pmic_glink altmode), when booting with a 5120x2160 SST monitor
attached. The tree is Linux v7.3 with this series (6/9 replaced by an
equivalent local change), the MST v7 series [1] and a few local fixes
outside this path.

The path itself is not new: the native HPD block can reach it through
ISR_IRQ_HPD_PULSE_COUNT. This patch makes it reachable from USB-C,
where every IRQ_HPD now goes there.

When the boot-time mode is disabled for the first modeset from
userspace, the monitor loses the link and sends an IRQ_HPD with
LINK_STATUS_UPDATED (DPCD 0x204 = 0x80). From a boot with the
active_stream_cnt check described below and drm.debug=0x100
(msm_dp_irq_hpd_handle() is inlined into msm_dp_bridge_hpd_notify()):

 [    4.572532] [drm:msm_dp_ctrl_off_link] disable
 [    4.573756] [drm:msm_dp_ctrl_link_clk_disable] disabled link clocks
 [    4.608443] msm_dpu 9801000.display-controller: [drm:msm_dp_bridge_hpd_notify] type=10 link hpd_link_status=0x0, status=1
 ...
 [    4.823192] [drm:msm_dp_link_process_link_status_update] channel_eq_done = 0, clock_recovery_done = 0
 [    4.823194] [drm:msm_dp_link_process_request] sink request=0x80
 [    4.823197] msm_dpu 9801000.display-controller: [drm:msm_dp_bridge_hpd_notify] sink_request=128
 [    4.823199] msm_dpu 9801000.display-controller: [drm:msm_dp_bridge_hpd_notify] 128
 [    4.823201] msm_dpu 9801000.display-controller: [drm:msm_dp_bridge_hpd_notify] After, type=10, sink_count=1

Without the check, msm_dp_display_handle_irq_hpd() calls
msm_dp_ctrl_handle_sink_request(), and msm_dp_ctrl_link_maintenance()
starts with msm_dp_ctrl_push_idle(), which writes REG_DP_STATE_CTRL
while the link clocks are off. The board hung on 3 of 3 boots with the
monitor attached. On the one hung boot with drm.debug, the printk ring
ends at the "128" line, the drm_dbg_dp() just before
msm_dp_ctrl_handle_sink_request(). In the two RAM dumps I could
analyse, CPU0 is still running pmic_glink_altmode_worker, which holds
the encoder's bridge_chain_mutex taken in
drm_bridge_connector_hpd_notify(), and ctrl->link_clks_on is false.

Locally I skip sink requests while the link is down. On this series
alone the check would be on power_on:

--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -400,3 +400,6 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 	drm_dbg_dp(dp->drm_dev, "%d\n", sink_request);
 
+	if (!dp->msm_dp_display.power_on)
+		return 0;
+
 	msm_dp_ctrl_handle_sink_request(dp->ctrl, dp->panel);

This matches the !power_on check that already guards
msm_dp_ctrl_push_idle() in msm_dp_display_atomic_disable().

In my tree the MST series replaces power_on with active_stream_cnt.
With the same check on active_stream_cnt, 2 of 2 boots came up on the
monitor; the link is retrained about 1.2 s later, when the stream is
enabled.

A check on ctrl->link_clks_on in msm_dp_ctrl_handle_sink_request()
should also work.

[1] https://lore.kernel.org/all/20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com/

Thanks,
Joonhoe Kim
