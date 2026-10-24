Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810949;
	b=ssHYl9r22Qyx7h5SUs+X4lUl+H9QdhCd7rVfyY4blvVrIp6Y3+oxKjtFHPKCt1fpIZvH
	 ufkRh8jceyYNMkZW/hM4AHR/sLdAlWXP5C5sAq43+kPWOAMd13YlcZBrcgFlrEXTs8F76
	 HJve/zmVz7GiclMprZHRZUIDpox5zM8vX6P4w+P+pEgiGI+5K7nRwigCy2Ed4Yb4BUfjN
	 TfkvcouDHkP8jlFSBwaREMpq90a8umU1o2cqESKrJRGScBkW4WAj0vmzS08c757klHLPF
	 SQHsXdKj/Z0+vQ0oKarcvoNouCB6/wSs4XMjfLZz9pwBelSNWDya5ZaMXuDmoocrpUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fAkzqZbGN3Mvn3Rb0iYOn/dd4HhG4tyMlp6PIvyFcpA=;
	b=y0UWRsq3Go5z0RtAiIxKxm9tGILc1C8Vridm9FfusMXFv57NR5G24kRo3yxR1vzMhxBh
	 2zCgKijx0MjAhjscXi1+ljPczFx/9/1Ks8btACIAsWE+5ZH/qwKWWXc7Ab1o7cKhyiENj
	 jrW3keKg4K/1quw7XdNP8BoWPOiegbELX5VXEHd5WOisOX4RAlpC1vNod0ismsKJClkxN
	 nF+OtJBaWFMjxbkOOUOI+3Zj7l7n29Sk4cc23Uwmx6OTwATqXosp9R/dUnQIAg367aBiN
	 gWc99c9ooyhV2ezPmyonuVQETg8qSSTHjig9k51M9HKP+uqd1rCBXYseBk2txaYLj6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J9WwTF74;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EAA60A263F
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 03:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98EAA60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J9WwTF74
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6f8a519e215so1041461eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 20:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810947; x=1793415747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fAkzqZbGN3Mvn3Rb0iYOn/dd4HhG4tyMlp6PIvyFcpA=;
        b=J9WwTF74MXV9RawHKLq9pGOKhC8CQansEN6WF9F/UnVApAErB6LSr8qUewcHRsvk4C
         V3U2iCe420Mssa2W8mB8Mmq4BS0JLXM2smcvdwXgpLyqEvsV6IeC6dp3qVrjjAyqw84z
         G6N2/u2D/WuClR+oThFwze+V0fhOErE8rYq0uNxuzrr6mdWhQbCdYoEeFETbmx5agFAr
         vlzMBO3fqTQdLgR6QxxylK6WwmHUyQIRsjADXdbgEbmUPu180+BXB3/Dtr30jjUClPhn
         nHxT0vQ+zeVSwHRrPO+4O4AuuILGlkOheoCUh9UOxSfwxTV5IEEX2eBKMhIEhlabQzk7
         7hXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810947; x=1793415747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fAkzqZbGN3Mvn3Rb0iYOn/dd4HhG4tyMlp6PIvyFcpA=;
        b=GMGgvvkt+wOXlYYrlnctO9gmxJjCwUTBucKJx+Kg1YgAi7ur+poWFNZBgjPb/ZUX/n
         fAl/SdacBE2f8CocmptiWV/RS/XeMohk5hFECVVzFtwxDBmwpQvPQocBFF76COXNZX/A
         YWpnrWbg/2mJLOoTVFTUJ28DrPHvFC0W0tG+44ha1uQmr27a+IgFOBQbhO6VhH9KjpVO
         RoKOgepirlBIrUOdXJcKk2UP51VspeV+BXX5fYzH2hbab2fnWal7kyjeabKnO0xHYqkK
         kuQmiPLas5IbolgCCH93wMvnACXdq/fz0DFenkhH6xb7HNS7TQtnpl+vR+J2IZNEicsK
         qJwQ==
X-Forwarded-Encrypted: i=1; AKwUvBybS4pANhof+uoTNCEGg5fHFTJYV4ze6cMi7nSUEQpCS2Y/BGc8hxJCSG+LzOwIBy2cn7Gw9honaODWWDIt@vger.kernel.org
X-Gm-Message-State: AFq9FYJokpqRmG4XFMYC6LM/ni1u6dK6W5WNOnC/yBmo25Sg92934qZi
	dhpWDGt4SDH65A9I3C2MpoZl5lp4iFdWeqzG/X+N+VvUyHcdx4pgcWK6
X-Gm-Gg: AYBFou3Ek/hOOoGMmGAkJPPBhBO1tTDCu8F0ldUsImORwp4UCaQgBxL19bpiGogb+AJ
	/pDpY2mqHgGul64yrZfmdGsCKboJax3v19Nw5F3CkIJ6ouf+TeH3QB1Ga9+8lY3gsWwDSJboceP
	LhKCa5jMwy3Oa/iwrJys9CVNqAR9jHjrJAB/olCXIqYS5NPK6T0k6JN9ZQXzkiQQ4MMUM5Cg3jE
	1IyCuhsgsGPQMrBFzji3jUH5YR/ZEq+gX/RRyxSOzaOZGAeCIJHTKNFhncbWwmCxnUnn98DVQ57
	9RHIF6U4+54A6rhTBic0KT1iL7BLLNYaEO4ke6T4/fvYl2YV+l6uL1qgJF5caEytblHz3grZXLR
	C0Qwyc6BswpgWb+hj3K9QJOtkIigWrADsNMdbcgmIDSuXBzb+y8Ga6gyq5NqBZudoIgcla+BJoW
	XVSdxNJ2qHlN961rwlFDtbzEVSghFxctnZ3gN587+54r/zdugajqEU0xzt6ugjZ37d3D/Pj7E+W
	5CzrJWsVFGVKX8jclo0Cd8dfAznmDr0qmCQVoeqn56sSuXk+qHtOAr9iUSX/yrktj8Jt6uViUap
	oEsZHcwt3LWBcO5LP/PLy1kMVQ==
X-Received: by 2002:a05:6820:60c:b0:706:5b0b:4e74 with SMTP id 006d021491bc7-70ba11762d3mr238542eaf.5.1792810947509;
        Fri, 23 Oct 2026 20:02:27 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:27 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v5 05/11] phy: qualcomm: qmp-combo: Add hardware-specific dp_aux_cfg2 and dp_phy_cfg1 fields
Date: Fri, 23 Oct 2026 22:01:30 -0500
Message-ID: <20261024030142.13643-7-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-5-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-5-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:22 +0530, Nabige Aala wrote:
> Add dp_aux_cfg2 and dp_phy_cfg1 fields to qmp_phy_cfg to allow
> hardware-specific DP PHY register values to be specified per-platform
> rather than hardcoded in the configure functions.
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
