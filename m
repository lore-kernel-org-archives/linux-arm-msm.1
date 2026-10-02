Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD1649891F
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 17:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790963248; cv=none; b=KKeF1nv4T4uNu3neVDPMd/4ufEpXuZq5f70qOBkosqUO8fVZWCZ22maxOE326VfTRSmdYCkiU0b41Oz2gbTcOKA9xUpRXkEy0lcuBUd+PZJvqmU3l1GCoeJ8XHfc55sO+/iZaC1Ddab8lkIkXWbiFX/19rAIdbXmRE5BuB/JoE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790963248; c=relaxed/simple;
	bh=Cd2QE3iYz63jTSegzxUdKqxdpgigqksvpDvPJ3x44Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C/bDrMCN964ponhNVOFolQBCW4uVbJhDpfnFY6Yd9d+BtCwd2a8M/a4Ngm1TBqMfpWXbL9sM3nHcVqNiSRbeOeeSvGomi4l6RhBf3GaZ3h0+lQXK2vGR5H8d+JWUajobntdiKwRfx3dbCb9m2oHUvUSEyG5Jv/CzoHU6Db73Els=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZcYJnWF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZcYJnWF"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso579765e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 10:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790963240; x=1791568040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ekbcB0Q6K0Df7evy98c+D1I4IxidAbimqgNUlWNjtzw=;
        b=jZcYJnWF5DIyzw+p/6dQtK18vAtNqCgzmrHtmXucQHlSTvJoza+T75F9ztLaJPZt/l
         +rTSzWbttIayzqQXY+MMzOxFmeark7mKwn8zs2b2OGSy/SkivRXT7T99WhRxPWOXNVCw
         xh50aWBkJ4LhXDeAM3+a9c1zYcAbiEt8msDhFxj1eGtptfzYNtaaCPd44UcGRNvwEa4G
         MLw53vNULzcLA9UqECsWqYj3yeYA6d7bzay8VMN8Q9uPXUY7ngK/tRvIleijJOVZXtqW
         dI0vVl5g4ok5bcjRhogNGArol9cHJyh8lrJZlJTqIqO9hP5kBmElAirPkVihzKbc7gij
         rSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790963240; x=1791568040;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekbcB0Q6K0Df7evy98c+D1I4IxidAbimqgNUlWNjtzw=;
        b=lg1x1uAJOT30xp/dFlcwFDjGVkHh9lktSybgnrhC07fInp2ZLaEvRyO9J8+UF1TnXq
         Q4/+x4NWxdJcx7J1NrXJjcJomHHEXDgmz4QWG6gOLyw1UGVYabkyA5h7F8MF4MqM7dcH
         0zDoEvIKeWkbeIWhkekYZt/d2yuRBojt6YbwDWk63WPmfd/dvEdtMxbSgpW4nhwUt3Pj
         4+c54fPDg/Hq2qF6r5AgRFN9w5iZIFyIwD90XDsS5vJ7b3I3kwbiNgHrXb/uAtv97qVw
         8cfADxRx7RTTcTs05wNJIF2n/mLsPevPvB61pqb5JYag13bl5OcURDuQxzTOXfEhz0VI
         qXvA==
X-Forwarded-Encrypted: i=1; AKwUvBxv90wXLitKGoR4ut2GDZan6ZjqktA7h8V6Wla/l16Sg2VT7F3Bm10niyBISGQf2miBK2xUKsep5t9lCfjr@vger.kernel.org
X-Gm-Message-State: AFuF++kfqJMK4/BMPi4qdGoENU2u//ufSRQm3J4SQ+rE2SM0m1JsNXaA
	rKFTYZM0/9psGaAJCggBmpN+Hn3E6P6QeAsmKplOfWWkDFEt1C1Q4ewm
X-Gm-Gg: AYBFou1dsp45PmTonbMM1Pxb2tE4M3RZwLv1wuJ+93CCzPvSuFboeL7eF93N/ZgQ/bO
	i12vRZ471SwilPUxDXFFp64/3T6wwEhum2WkpttZy0vPIezhvbH4wZBz7Y5pbmgrhjUvfB6Dr4G
	E+mwmUYWqGhxkeXMlxQi8w7+jynyj/jFjNGX27WmOCYOmEA/cbYt7BQL55B1EKoKhRPcuyjpQXL
	4PyjQacuUFecMcDanDYPuWMhTcVrizQdCTM1BUqxbUMBGU+zlhsYmkQ+htteApKT+23vWmVAXiC
	5ShQI5acCGVC0mwK1n5YSVdQtnUd6E3RfTUgMXLSe6f2hcz7CBMNnYszegvz4i7H7q37TruOVZA
	qiqmYhhrT8whOlFMahUDd75bqbThZLfmyhOl99aW4GkuGjoEtTvl/KWAJoZmjzhdU6fSV5UsXGz
	huY3WUjPufyrO0S4iHVp+klRdL8DlQMdqBGWuotTDr0P9DzB7cJamOhVgzsCQ6cRwc7IvY5AmA6
	IrSpShzupwmStr0
X-Received: by 2002:a05:600c:a012:b0:49e:81db:4926 with SMTP id 5b1f17b1804b1-4a1680e76dcmr2993815e9.5.1790963240043;
        Fri, 02 Oct 2026 10:47:20 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48b382f9ae1sm7515541f8f.39.2026.10.02.10.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:47:19 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
Date: Fri,  2 Oct 2026 19:47:10 +0200
Message-ID: <179096320161.1973.2852858792260211089@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ar_AuRr1eaZzOfw9@baldur>
References: <ar_AuRr1eaZzOfw9@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Same on a Lenovo Yoga Slim 7x Gen 11 (Glymur) with next-20261001, GMU
firmware v5.2.38:

[    1.632277] platform 3d6c000.gmu: [drm:a6xx_hfi_wait_for_msg_interrupt] *ERROR* Message HFI_H2F_MSG_GX_BW_PERF_VOTE id 11 timed out waiting for response
[    1.642345] platform 3d6c000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x4
[    1.642360] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] *ERROR* gpu hw init failed: -110
[    8.053367] platform 3d6c000.gmu: [drm:a6xx_gmu_resume] *ERROR* GMU firmware initialization timed out
[    8.053584] msm_dpu ae01000.display-controller: [drm:adreno_load_gpu] *ERROR* Couldn't power up the GPU: -110

Compositor fails on the first start and works on the second.

Reverting this patch fixes it here as well.

Oleg
