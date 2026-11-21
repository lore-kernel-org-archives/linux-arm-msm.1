Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795297280;
	b=1HgK4ajyKnQYOD3LGfwqFPXwrV8SxBw+U9PZC5cGs0lZdwg0/Zl2xm2HMoXbacp7qlN1
	 HwyFQ1M9mjGjPwXazw1xuxdCcpsGN22098OAYzen4Z4TOvwb0i3AsSUTBnEba5A9y7AhB
	 88KJ2VjZbuU06EtZg2hFWpjbH2XJ8wuPozSO2oZ6G8FKS/UNNlBu/1Z/qd2PxdthGk3BA
	 nw9YV9h8l5M3zdAU6zOJtqefe1GZtdRSDzdRWq+neEbSLUKhSOgX9W2Krfsx8xc7dP0ot
	 +CqJ2vvMHnwZrei4lU3NdH2gSMUI46cHGm8m1sme0g7+EdITz7AJADr+cJgShppZ1aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795297280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VciGgAHE9AKbwhjShHEMH37yF95luzzv2P4k7R87BOw=;
	b=HINA+no+IrUkpkzSdAgZh0Aq+1c/OoU2LqaDWSKZdPhrwdhrmL6zwIelHxnfgk1sIs7l
	 H8jDKT2xvrTje1giiRJ6KfzDJM42IixOnlLASnN4q8r4VjbtwGYQlKv8S9bIe+rSIHeqx
	 DeGtHOxYLEGu4/D0h1YY36MP9N9CRVVEsLALmpuUdB09xtejvI61re/0LsuZfr2CivIjw
	 Xfjl9wyFKjteiv0HO6HRbgbg6BcfXw7oJaADQ8AQt9cmgAOgdSnjziRqrrd8MDE7ww6ay
	 MiSQIzuywxEmP8guHdSJJKS/NphS3QzhAcatLrv2RO6JIWNT8HEVrzNFu/coWyAwPYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vms/8fN+";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101E2606A32C
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 21:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 101E2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vms/8fN+
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so15028895e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 13:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795297277; x=1795902077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VciGgAHE9AKbwhjShHEMH37yF95luzzv2P4k7R87BOw=;
        b=vms/8fN+Bl8w2xU2W6cWQYeTyeoa+tp9vpy/hXhIzyb+w0gG++VWAc9Xv5xSUHqR7/
         yLNAMVJU9BX8eRj5r55da3Cpk0RQuAiNU0zkfauuy+DAGx0JFZCaFTGRiBRULrrTh4bZ
         KL7oyWYri5WosyrQGPgC32K6uX7e/VSnysFHek/jdlqxN6kx+JHXP/VihNw2X2Tf1TFx
         +TWPxFvjKENRTVMXzHaPHZ6cpxvUIGrJDQL8t3yIcXYZ71oS5xeNQXA1S67JRAJFSS1L
         A3k1lIIAftEzE09jyzGTGaGKiQ3cDcwQnD5peQSPY8OzPGVcyLwZB+Coz0cRUqFCSfCU
         js/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795297277; x=1795902077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VciGgAHE9AKbwhjShHEMH37yF95luzzv2P4k7R87BOw=;
        b=fD2eJQ0mlv+tqrKKEG15iRsHiE0i0KIfoOx4sSpIOHg0AB5Qp9U9R0YhPW2VD3BJd9
         2GxzUMcKEL6/rmw3lWIml6hJoDVQUdJD8i4NutWdkFKHUUqTZi8eR7OlzatOAkMMmdfR
         qFCkiggCqmdaIf2d2rBHWTvyop3BH37yJILvo/vRGR79/1KEBK0dFgq/Z9mj5ZIQ2/nf
         3bU+SGVsUluukXRlO7ILGXJT79yTwrrbBrTACFA+F3eVoEdjbhA4+bnpTfdRalBVLNPN
         4sbLVEsn62DkklmGCjJN6o8CK/brOgP4RotOVSaShTNkg9WMgqOhvNyG5IgL68bLoX/w
         92mA==
X-Forwarded-Encrypted: i=1; AL+hErFNgx1PmRus0Im5M89aTa4pMrmTtqW3iTU4ZPSLv3h0gA3Kf2sW7ElrS3OL5xgJAUPMhycc65eKT4Htvzt6@vger.kernel.org
X-Gm-Message-State: APuU4Z9RBcrHKDhvgagXyldHdqb+qK/W0CTVWYxJgRefhOdqwUnibLQe
	1OO7H/8alHRWM9aPUHo4NMeKFrrrME8CSpqpHNB6rkrxmb2gnMTbfbo=
X-Gm-Gg: AZFdTZc1PfOgoGLm7XHUBIpC+6d4gxUTSpRsLx1U6z8KqXhCpaC3t5T8xwzBnvXWtUK
	IDky16K6HKSFQfZdLHpx3x1ZfzS1hvVq+4vNquV8VigZNqa//d7q2T0LkyR3Z46zHVUriSooP/U
	GUFuK/YtgyLnbczHyV/mGhsrbLqlZllcG6DsHitN8jpSXAs3ZJe36jZZuHuSurwIlECMrIv1qkz
	xlVXTeUsJN0LBx+MBWf46llcoHmTMGZz1sJB1d7Wgle1wMzRLLBrwQNp3Ejxk2oqBj/OXmn91fg
	Ackl6RwdAZmxf8MGeyE/E1qk1prEoQZuYTx42VVr7TK7czIJ2z3JVpCiN/i5TCS5qvBFRjNcRV7
	OiM3Dk4ICihvD+wXqlVle679HqruPUz1iuAtxNXIlRrwlgjpyBqOCWh9Obslji+d7XO0NiV0dRY
	hZU1H8/CfMzvWZ3jgzQrTGJk+7l9Rzp+2LWPe8mVo8gb/JLKNvfumJM2lsrlZkeS3tXD+APJFOd
	tBYIkHMNlT/dTuXKbjo4DckUe64cWkC0wR6oO0flSmp305ZC5SDELj/7oI8RgV3ckoDe86h2LjD
	jVkhQLaZlzQsaB6SCjDpS6ZxiAFoGRD1S0HH/N0=
X-Received: by 2002:a05:600c:a0b:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4bb8882432bmr151110535e9.25.1795297277176;
        Sat, 21 Nov 2026 13:41:17 -0800 (PST)
Received: from h7015t.. ([193.207.113.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm54580645e9.4.2026.11.21.13.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:41:16 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dale Whinham <daleyo@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 0/7] drm/msm/dp: fix DisplayPort hotplug, link training, and multi-lane PHY setup
Date: Sat, 21 Nov 2026 22:40:58 +0100
Message-Id: <20261121214105.32596-1-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On platforms with a native DisplayPort connector using direct HPD
interrupts, DisplayPort initializes on cold boot, but physical cable
unplug and re-plug cycles leave the display blank even though link
training and stream enable callbacks report success.

This series fixes the underlying PHY lane setup, DPCD link-rate caching,
SST training-pattern handover, link maintenance BPC restoration, and
HPD / runtime-PM state tracking issues:

1. Configure PHY voltage swing and pre-emphasis across all active lanes
   in msm_dp_ctrl_set_vx_px() instead of only lane 0.
2. Reset cached link_info->rate and link_info->use_rate_set in
   msm_dp_panel_read_dpcd() so re-plugging a different sink does not
   skip drm_dp_max_link_rate().
3. Avoid redundant back-to-back link training in
   msm_dp_display_prepare_link() and keep DP_TRAINING_PATTERN_SET active
   until msm_dp_ctrl_on_stream() is ready to switch REG_DP_STATE_CTRL to
   DP_STATE_CTRL_SEND_VIDEO.
4. Reinitialize ctrl->video_comp and restore source BPC/format
   parameters in msm_dp_ctrl_link_maintenance().
5. Dispatch DP_DP_IRQ_HPD_INT_MASK to msm_dp_irq_hpd_handle() instead of
   misrouting expired 0.5-1.0 ms short pulses to msm_dp_hpd_plug_handle()
   (kept separate as it can be dropped once Dmitry Baryshkov's and
   Yongxing Mou's in-flight DRM_CONNECTOR_DP_IRQ_HPD series land).
6. Use asynchronous pm_runtime_put() on HPD unplug/notify paths called
   from msm_dp_display_irq_thread() to avoid a synchronous disable_irq()
   self-deadlock in msm_dp_pm_runtime_suspend().
7. Keep dp->plugged, dp->link->sink_count, AUX transfer enablement, and
   PHY teardown consistent across plug, detect, unplug, and unprepare.

Testing:
Hardware-tested across cold boot, unplug/re-plug, monitor swap, and
IRQ_HPD link-retrain cycles on a QCS8275 (Monaco) SMARC board (SECO F86)
with a native DisplayPort connector running v6.18 + the FROMLIST DP
HPD/MST series (Qualcomm Linux / QLI 2.0), then forward-ported and
build-tested against msm-next.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>

Gianfranco Mariotti (7):
  drm/msm/dp: configure voltage swing and pre-emphasis for all active
    lanes
  drm/msm/dp: reset cached link rate before reading DPCD capabilities
  drm/msm/dp: keep training pattern active until stream video is ready
  drm/msm/dp: restore source params and reinit video_comp on link
    maintenance
  drm/msm/dp: dispatch native IRQ_HPD directly to
    msm_dp_irq_hpd_handle()
  drm/msm/dp: avoid synchronous runtime PM put from HPD IRQ thread
  drm/msm/dp: fix HPD plugged and sink_count state tracking across
    hotplug

 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 23 ++++++++----
 drivers/gpu/drm/msm/dp/dp_display.c | 55 ++++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_panel.c   |  2 ++
 3 files changed, 48 insertions(+), 32 deletions(-)


base-commit: d024361c631b3f020a26c07d683e5103404b0fbf
-- 
2.25.1

