Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.36.144.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526867;
	b=KwOzozc0B4bq/1+B/eWYAdXMapqH9vqHyYALQ1dEvHSsVzoB/QINhDzFTvB9E+C9CLsm
	 /9Em5vWL0trX5PR5OLLieJLbZNmmXmFnDbY55WPfKQiedQnXAvFbqZpdp3qpYvcGHSYye
	 JkVqn3FCb0kT6+Mvsz5KEyrb7s88Ddsqipwr0nq2EFRuBr5NZZKocE6JrseF+yfTtOPMp
	 1CN/kg2nuB1i5TvFeHkSuwf6PgoHclwdQoIhi2kOLGfHtgZe45W3efcKeQePnToDgrIdk
	 9QoR9HdGnpWiRWgJAn26ZNyIzvD2H1I16x8VLMtrXdensHAkSMgGll16ElNX2uCqa3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526867;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=xGe8Byqtdet6m9b6JcFfd7IFIJu9dIrTGmJqkbX0I3I=;
	b=FNVo6FUROraLF+hIqmn533KLFVft1SEMOuynWBluu5+aM6mAHriYjT9BxZb80Uay5AtR
	 GjZAK5/0/BoO8xcVcAJgey0R8brqFmjTuDpZ8mAvy4p8rBCCfzDjf9+blPrpVBjv2R1De
	 LYtEvmWIVky723vWI9k5Ja4cCi8guLbzqCdVi6JCXZVJ7RoGNSggbWDFqFKzcjDZhFi3t
	 lUclrTBKWu13uqSVPZBb6wUUTe9I9MfThXw6HNVhciqhz9QRwQnChOIov/vXfkClijw6P
	 IV/kDagnNZ8go04LKmNEjs453PAdB1jWnGgn2Fo7kgklKHedKZrrndUntbz4PbqLqWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yoxcu.de;
	spf=pass smtp.mailfrom=yoxcu.de;
	dkim=pass header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=enKs106V;
	arc=none smtp.remote-ip=194.36.144.171
Received: from morty.yoxcu.de (morty.yoxcu.de [194.36.144.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31AD606A31E;
	Tue, 24 Nov 2026 13:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A31AD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=enKs106V
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B12081D8145A;
	Tue, 24 Nov 2026 14:27:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoxcu.de; s=dkim;
	t=1795526863; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xGe8Byqtdet6m9b6JcFfd7IFIJu9dIrTGmJqkbX0I3I=;
	b=enKs106VKN6gDLYipo/qpiLQktAD0vnahiwO8I1bgRbdHdVTvzDV54vxoypjXHPMbx7tYD
	BdwQGGEbztjT7N6gtgbbijg0V26+iOGC04h9iORn3A3FlLfBVPg8cBAWx2xJd+hpi1NwUl
	wD9fyLH7NSRhpnR8XVY0hQPoTft1N+U2HuQnTRcaxUW9x/+qdZVcZvPRkL6ZfqsMfk9pjD
	sIT/zjIDj8M/27X5HfdcUQ9RGfKFnXp5Udwirs1oDBN0YxNheIDCQ2zFEO01RiVDLJb4gF
	6uynGgmIawPOQKfMmGmU4/fDQMpgilUaNJh4dqUNHYCPG6cPHwg6KCOub3zgMQ==
From: Michael Auer <mick@yoxcu.de>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Akisaira <akisaira@outlook.com>,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Val Packett <val@packett.cool>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Haitao Xu <haitao.xu@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/8] drm/msm: Attach a driver to GMU
Date: Tue, 24 Nov 2026 14:27:29 +0100
Message-ID: <20261124132729.1763111-1-mick@yoxcu.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
References: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
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
X-Last-TLS-Session-Version: TLSv1.3

Hi Akhil,

I tested v2 on a OnePlus 6 (SDM845, A630) on a 7.1-rc1 based kernel.

The series does not apply there, because it builds on the
separate_gpu_kms auto mode from next. I dropped 4/8 and used
msm_gpu_no_components() in place of msm_separate_gpu_kms_components()
in 1/8, 5/8, 6/8 and 8/8. In 6/8 I moved of_node_put(node) in
a6xx_gpu_init() after the gmu_is_wrapper check, as node is not
__free() there.

Without the series this phone needs fw_devlink.sync_state=timeout:
nothing binds to the GMU, so gcc and gpucc never get sync_state and
their GDSCs stay on. With the series and without that option:

- the GMU binds to adreno_gmu, the gcc and gpucc links to it are
  active, and both reach state_synced without "Timed out. Forcing
  sync_state()"
- the GDSCs end up in the same state as with the timeout (the
  hlos1_vote_*_tbu GDSCs and ufs_card_gdsc off, gpu_cx and gpu_gx off
  when idle)
- the UI renders under KWin, GPU devfreq changes frequency, and there
  were no GMU or HFI errors over 332 suspend/resume cycles
- in a 7 hour suspend test the SoC was in CX collapse for 87 % of the
  suspended time, the same as with the timeout option

Tested-by: Michael Auer <mick@yoxcu.de> # sdm845-oneplus-enchilada

Michael
