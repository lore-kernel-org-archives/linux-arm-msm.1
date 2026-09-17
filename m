Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76555381EBB
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 18:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669688; cv=none; b=c1A/BnZpSpJ74Zp7/KBg3hdQbfHbcH26EtDi/aQ3iriwi4XgP8xC+jrJ0bH2LY/hCL6W9QsUAbAXoSBxDI+pQ7I3aLUDApg+7XeZtXfsY6YqwuO2LgjJhhcnJlSem+T6jQHXkL5MCS7i1LNwa1EwU+GC1M4rQ1ykHgSr3uKH/i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669688; c=relaxed/simple;
	bh=xdKyLiIvia9bLIAOVF5QT9eZb6J+17bObHxnS/Ki1Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bzMISOk2E3gF0CVw1sA7KvoiZ+R8wXzG2qheY+o4zDuTpvbvqNE0WoDm+mkClRBZrOhffWxXnhgprNv+x95VGFdCIFSFy4R+rvG/AAPP4XIG5HZ3fqcTHawjmSCPv56eYRBQDseqVeAJaLBvjBo5DWB1C9aqG6MSL49ZdI8CNTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0Vghfzm; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0Vghfzm"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso5836635e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669684; x=1790274484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wXQrE0cSC2j1UcC86SeRkMHcu0uW3qI+LeREPCrSbF4=;
        b=T0VghfzmgbFVPQqTJoIsA6iQIFywn4TP0cDpa5xxDsuy9hd5ESPNX5pIH6uLnCfeBb
         B+FMPnmTR/7bARa+pMPr0v96Vpv4qPOhbphBOfk3/MmuQ+j0hOcVMH9J1l1l6UpsPGur
         vLgZk3KVYrke4idxY7Y5tDlTH6aDzxaOM5zbabt9/V8VqM9da8MH8xtWvEhkxqKOqlx0
         KG71zMtt4DqkKwWf/S6FK0H7/7dFJRyzsqMRc437jgDg2X4/TMEJwS/5Zqynop8ItLR9
         Ev5YRnIBwXslmw5voAjlS1W3V2tEYT8jMaXmqUSxUaR2XSD3lVfl671O3xpEFTu0B70p
         ygOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669684; x=1790274484;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXQrE0cSC2j1UcC86SeRkMHcu0uW3qI+LeREPCrSbF4=;
        b=B13c78tgYoYDf0Yg7wRKFmzzSpAXjODAcgUoEKF7rVWWdsv3re4U+i/ujRMdEkUbYc
         DUYPgl66tEuy919iUCnbUSmXTrEDwEozMuK5VOLcC1YYN1BSiVUZ7vcbxrIebai6+D1S
         WCPTU2xmrIAithSEyEXzhfyCu7ts3FBIEPjLMUKk3h5wRPU6JZ9/vYklWVWXK2w6mG1O
         H2vOiFwCLDbGA7k5zRSOG6ZTlBpUQgEXiV93yiCxRG22G81fafCG4PkIKNP8NY83Ex2Y
         48uKQatu5UvJ1f0XUagt2htUlhZThplVGwNm+VAxMu6XeN3pJIZbBOUXTEa/QMkoXiNL
         Odnw==
X-Gm-Message-State: AFuF++nQ5BIogyDOzYcVsx9g4R+6kfE8oeYkJ+V3LN4TFk/eZVR87gWr
	J+ZoUJ6UORnLHqxYMwmTXIVd5gx1ft2DBBSgigP6CPKw/iqDfEjDBah8
X-Gm-Gg: AYBFou35Jny5oGUAJM9pw7K+y8yFXRNegjIiv4ARPO6cmjT/Mejh3GfzaZgLHh1Y5/y
	J3fpSHrdCFztsHVqT6eQEuoGPfzXVc732kId3LwQhOTaemWYn4aNrh7+6CfiJvFNW0mwy+Xfdb7
	N1vEoLzAE++l5C3Y78LxfMa1DduiXm3yVaqYRvz4lvzsYtbLq21T9+l6C9C+mU72WmXApUYBnba
	xveiXUjdfXCRUbRWrfEmjzV1eDCneQA8BwdDEVt4HTTlw91+zOATbgFw5EhZLQxXIk8ggje8uUt
	rGA1mYUe9klDwKn0z5P2Dm2c6lKvaRUKlvSr65f/ihqIBi75OXDRu8nsWxqyco0ZsEX3QWtMeTA
	aRHg49smEJ5kC8bRzszqB+VKsU5rQT9QxorcrZ/l4OKBGfB8sT50PB5U8VAjXzHSpKjoA7Rmm6E
	dRlvKcKX5AG8CVS/rJb7Qm6NZlqOAPFWLPXNTgjCI3O0OPM3I+3zpopLHGQaxPhS/hbJ7ZIzq/F
	+M0p4Bf
X-Received: by 2002:a05:600c:3492:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49eb72fb7f2mr83849295e9.12.1789669684372;
        Thu, 17 Sep 2026 11:28:04 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.113])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fbbd83e39sm126935705e9.4.2026.09.17.11.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:28:03 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/9] phy: qualcomm: qmp-combo: Add hardware-specific DP PHY config fields
Date: Thu, 17 Sep 2026 20:27:54 +0200
Message-ID: <178966967452.3333.16125740437772430030@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908-glymur-phy-v3-v4-4-ff22e5150538@oss.qualcomm.com>
References: <20260908-glymur-phy-v3-v4-4-ff22e5150538@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Nabige,

On Tue, Sep 08, 2026, Nabige Aala wrote:
> Update qmp_combo_configure_dp_mode() to honor dp_mode_ignore_reverse,
> so Glymur can bypass TypeC orientation-based lane reversal.

This breaks 2-lane DP with a reversed plug on a Lenovo Yoga Slim 7x
Gen 11 (Glymur), with the whole v4 series on next-20260916.

With dp_mode_ignore_reverse set, qmp_combo_configure_dp_mode() always
programs the normal side (DP_PHY_MODE 0x5c, lane 2/3 power bits in
DP_PHY_PD_CTL), while qmp_v8_configure_dp_phy() still follows the real
orientation and enables TXA for a reversed plug. With fewer than four
lanes the two no longer match.

On a 2-lane DP + USB3 dock (HBR2, one LTTPR) the reversed plug passes
clock recovery and then never reaches channel EQ: the LTTPR reports
CR_DONE on both lanes but never EQ_DONE or SYMBOL_LOCKED, walks its
pre-emphasis request up to level 3 at swing level 0, and then clock
recovery is lost. All four attempts end the same way:

  [drm:msm_dp_ctrl_link_train_1_2] *ERROR* link training #2 on phy 1 failed. ret=-110
  [drm:msm_dp_ctrl_setup_main_link] *ERROR* link training of LTTPR(s) failed. ret=-110
  [drm:msm_dp_display_atomic_enable] *ERROR* Failed link training (rc=-104)

The same dock trains at once with the plug the other way round. UCSI
and pmic_glink_altmode report the same orientation in both cases, so
the orientation itself is right.

Ignoring the orientation only when all four lanes carry DP fixes it
here, both orientations train:

-	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE) &&
-		       !cfg->dp_mode_ignore_reverse;
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
+	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE) &&
+		       !(cfg->dp_mode_ignore_reverse && dp_opts->lanes == 4);

I have no 4-lane sink to check whether 0x5c is really needed for a
reversed 4-lane link; could you say what the flag is for?

Separately, on 7/9: LN0/LN1_DRV_LVL is now looked up from v/p levels,
but only in qmp_v8_configure_dp_clocks(), i.e. at power-on when both
are zero. Level changes during training go through configure_dp_tx(),
which does not touch these registers, so they stay at the [0][0] entry
(0x02 at HBR2) where the old code had 0x1f. I can test a v5 on this
machine.

Thanks,
Oleg
