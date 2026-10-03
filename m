Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE5748EC72
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 19:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791054852; cv=none; b=IKKb3t2dDH+NsTAOeoP5pCMduWNGwmlnBlAEBO8KiRsKQ6E2Mn4kiinP8LVeUbdBuROaSVp3MJFF4ssvSvuYiSVL4cFaePUnWBBp9BJmLncIti5dYr8Hkaa4nPN2fggYOGk0xHCQ5RuDcLs/ANnJKw30qA22Hia1Lq4wxRcRgoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791054852; c=relaxed/simple;
	bh=o2SsJ/QcIsSEwjwMTmQkK/81ZAEDrnlVJnW+TJO5BtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tm0FnA0dmF08zR/N8uL18ZfWQ1hrTUjTOsUkXa9MUlqXvPmMVxp9TbBpIc4HQSIXBgt6uuWctmj8Ocn0XmTJCwJtjq8vEFH/CIEzIcXWisDfEmSyFccw834rCyL8N0Rwbva1vXtcckN+r8ak6U13HRHtOi6syns2BvEP6HyqZXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/3mKkJK; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/3mKkJK"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e66390995so4521245e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 12:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791054849; x=1791659649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o2SsJ/QcIsSEwjwMTmQkK/81ZAEDrnlVJnW+TJO5BtY=;
        b=M/3mKkJK50e2/8NW/XYMHONps8inh/PJfkYn6hJa5sWJqPq5aj8esx42XrE5K7QiMa
         P7XzyEbpNwkN26+lGtteVNGzjfYftP/uhckPdQh/Nva/ZW2KdtRA0nVn0gMnQxQDOnA3
         xFayrRIBiOi/v5+4HfOGESGjfrl/GCmvjFyC2EiipBRl0Pq6avhOViBoxZw/VQBunvEQ
         jogzEz07GV8TnlcyRUlLFaVaE7yFJXvMGOBAAJdYPhn07miykzHrpFrtzIkyf9e4WyLY
         CePaWef+7iYrJptO3diOn6NJmn5f4knTRVaoD2TMfUEGg0mLxaQdVD9wP2guWrC6TpbT
         9JRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791054849; x=1791659649;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2SsJ/QcIsSEwjwMTmQkK/81ZAEDrnlVJnW+TJO5BtY=;
        b=zVYrXQNh9TiRWYVE6GxdR/Zj3knwVjXF4o9QG17XPhTDS3XZHprJl2S5UfmPyexq4U
         7CkPYS1IQfkx+m/ekZVU8czS+15YDZAGsvFcTOBqwZIueNuVwVoA2PblrGS8eQ+ygvkg
         Tf37TtcBZz6Wrq9M8P9f0CLVM/lkirG2cj6zUpgAnzKg/nVqrmctdtciPlbMtORVYYis
         HarGb6ZKwr0On7FcPreQTbIzZzvQfMM70RvLpdo84Hh3E4i9YCDkIHGdnxGIl5qVkQec
         3SPAVTnOy76ktO11Vy3Ta27jlQJirObIhORsWAvBnpehh6Zkel1ZaAlPfr3GeJUwRGY2
         zxQA==
X-Forwarded-Encrypted: i=1; AKwUvBwqOkz9blQ1E50keBlqiGBFsOhOTqLyukqsir2pG6nbEeCKeakS1zKZ4BS/wISu2w7Ay8QHVVQlededcnn4@vger.kernel.org
X-Gm-Message-State: AFuF++m7JH41ryI1HBw62cmqAL8NqftmE2E0Ha7yiR1hg5iUy+sdS778
	JG2oFOpbrInQdncGd6rvBtvbUVrPGQ6XBNPzQWSwqY4ZRi/Ec//emaDY
X-Gm-Gg: AYBFou3M4SShfF2mkRgIo17W+55ZJj7kEyjkTlODQ0NTnC67c3NZauBe4VCrVD3vwsa
	M+TCFqbHseYn84uVs7zAzXN8OBs7Hl0QaHrVyExloTUQuGn9c3UxiGcTB0fCxWe6EsEXhGF+3l3
	ou4rd8NbYWwfMPmbaRjA0XS0aEPPASUsEFZloxDz02wRg5n28a8aPKXZd3dHfJ1lrNdIw2EDhby
	aLxCSFY5CA95hnZm2VOk3dWbaiz5uXbD8amb5gvJ6oIbE2IOi6sOON2tAGUX0Q00jDLSVtAw+Vn
	yifFZxJyuXvvnkJZrImZTdpOEhmE6o4BOosjsL6ydBjkRvAsYEwVbPvqPnO3cVmYspy8RMvDy26
	Q/SGZMNg0BDrQvtDFJk+vawHRkNKR0WLs0/c9RGCExnWWgTH5GtmGN1CmG889fs86Yd0BqFy/us
	BxwJ3PWBE0ts81rFBLreLWGBFCcphi/SC0I7Ou0spNlQbguWhb98gVcmiSt++FmnIK5YRJALvUz
	yvLncKsFawOK0ZX
X-Received: by 2002:a05:600c:6995:b0:4a0:1e53:e51f with SMTP id 5b1f17b1804b1-4a02758572amr109139105e9.14.1791054849210;
        Sat, 03 Oct 2026 12:14:09 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a0280dc6e7sm258672005e9.15.2026.10.03.12.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 12:14:08 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>
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
	regressions@lists.linux.dev,
	Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] drm/msm/a8xx: Enable CLX feature on Adreno X2-85
Date: Sat,  3 Oct 2026 21:13:59 +0200
Message-ID: <179105480736.32023.13572677576800176858@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9355acaf-60a1-4fc0-a27e-8195eda3aac4@oss.qualcomm.com>
References: <9355acaf-60a1-4fc0-a27e-8195eda3aac4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Oct 03, 2026, Akhil P Oommen wrote:
> Could you please try this fix?

I tried it on the Lenovo Yoga Slim 7x Gen 11 (next-20261001, built-in
firmware): no change, the first GPU init still times out on
HFI_H2F_MSG_GX_BW_PERF_VOTE.

What I noticed: the first init at probe always fails, and every retry
fails as well until gpucc's sync_state is forced by the fw_devlink
timeout about 12 s into boot. The GMU node never binds a driver, so
gpucc gets no earlier sync_state, and until then genpd keeps
gpu_cc_cx_gdsc on. With GENPD_FLAG_NO_STAY_ON on gpu_cc_cx_gdsc the
retry when the compositor starts succeeds.

Oleg
