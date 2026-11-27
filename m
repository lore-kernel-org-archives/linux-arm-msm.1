Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797643;
	b=YWUsMLssG3VT5nBjO8KlvGfIGZRP2T4FB2RMXCj2e+Rs4RLgwI+yMUGwq4oobLaqoYVW
	 6XfFHTehKoAVwn+CHtws4NJ9IwNJQordUmN7nXIN6jhritoxsazwitN8cEZ5Ogo4t7tT3
	 70jHuPA119iDtlPyWfZRlwhJQekDaTpf6IcJO+KiMIleaof4EbFFz/7tNjKMn3PTiB1Ue
	 D8D/3hqch1Jru9NKg2P5IszIXox8ZyBDtjbIP3nVPQ5vJ1JqtAQ279dMUxd4xqTBrwJf5
	 mXLGUY9LbUVP8ATFuqek/MQkacRrCtKgjbNwCuhtyP4XRRio7vv3k9RjqTzn0iPSppA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=XUwqQ76NdAJUSx0nAgTzca4PsZDjn9b3TAqsJayi8ig=;
	b=lcBnDLpwSNQWWuHIgdNNMp+eLX3vFRVQ0ZRCDCnfp8n9tm5qLQ0mbgfocpeLYbXCTvXZ
	 WtJGfdfhc3ffdDANyWFaoLO+zDngKMEYvt9ZYDFviq3HtgnYEYbT6B11bnprm8H1wcrD6
	 0yLKhocWoez2TxZIYsBpNpAiH1ZbFASEKzop2HcIavuzMcKHjTWLGm4zjeUY2dZXwRV/l
	 6uilt/zsA4ubmHfHb6p5Nkw7FbNlazoC39I5PjtWETz1SbCTDDoeiWzakk2VRWLVjt3uO
	 +PnH5V5KLiFQnHibbpiKEDmdPgYbleQsen5nRAsqXqJxKL0kI3CeTD3Npmw5dDbuJVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v8D0HPG5;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE98606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EE98606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v8D0HPG5
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso3628878a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795797634; x=1796402434; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XUwqQ76NdAJUSx0nAgTzca4PsZDjn9b3TAqsJayi8ig=;
        b=v8D0HPG5SrMDtS67IZb1pkHKSk/WlmWSmt2FKBx36gm+wJx09D8v27+i3x3gQasJjs
         pPT5bu/fX/ox451LY4xXYl/XhrM7lleWf0ZS2dF7Ul4nFXJq2VVHy+OA6FJz3ONYxANm
         IH+OR2Bcmfbtg798BqCiM41ezaxq/eGjlnZuEf2kOQZFDIONKAuTTHePZ98l6j87afJB
         y8FFSg6MAHYDqykdlRcZdsn7rrmSO2qpu4Ek8NkhBvh4T51cPlTK/oiuF8haWlBjs7iB
         j0EcxYKSmJameVcx85RNRVqe6RWB7I/v7iBBNDixhsH6eboth6dqjJvP2zz2ca+hKlOw
         o0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797634; x=1796402434;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XUwqQ76NdAJUSx0nAgTzca4PsZDjn9b3TAqsJayi8ig=;
        b=fLp2dLJXMdoJt1NYzdtCklHZ75zaud4NBvWIjjUyPgCG2u7mCMjyPWC7e3zCU2IMlo
         9l5b/cGMdduAwr0Dz4XD7ZHLANks1vaGzjLievcjYbq39AAoGS0RSyattITZA7xnfNb1
         2daqlVuaqGy80O7O1xnmi9yR2OPnAQxbCKbG33dvqrphdoN9l41Zg3xiffaTCDoQaTfx
         Jx4k1cd/L9j7vsdx1FHL+lSzDnk1kLwXPWpLsc7nOZHKX0mWQJz1yWRBTA5uiiR1DpVK
         PbLtxxkKYK09l2JUBlNtNyZqcgnqCOch2CVeVtPX1Sdahee60lMKJvVVYgjRX/zkkaBc
         PwMQ==
X-Forwarded-Encrypted: i=1; AL+hErEOwOstDl5u7rJQD1f1il4eS5ZVnZYRh33WKA+ZdlLUiaDSuZecSZU2sEUhCa+qLlPTgL4kDQRvvPOrAGgK@vger.kernel.org
X-Gm-Message-State: APuU4Z8bVzyhs6XnVec+8rBCcbg91s7SPVGZQ8/91h6Glls12Nki9qp8
	bGoK1bYwn2/y4rZtR5JuiI3DN9sibQDwfq1lDRPW8Iuz+Sfw71OoGo34l+7U6Vc4iGc=
X-Gm-Gg: AZFdTZcwfrmdQZSPyhth3GFgBXNkvSJNIs+vtoqoahJgTdRPXlG1qqDjxU7gcj9eXW8
	pm2D5VnJ0ERgrRgVlrbKEqRF5nUHPhOuQvZYlpZYtign1ltnw7STx/g09dY9wRRk2Ljyd9gaeH5
	vMHGSlkm3akNduzMfGYLW1MXiMQ/4u2dlGm8RRZhmgvi1gq+tf/m2hSFV4t6pkWvlnhn3sPQtP0
	JWEhkYf73noJ490ges/gkzKe+7+8kFvcF+j9cenKFf63/IWDyIcZNcSXQ2RAAaqu6HD5ZzeBLVq
	KtdwPKBVEyzWGfiZkt/ZVlNSdpbV/sTvbNglUF4Ikwr95R9bIc1e5WHVue1tqaN4qXWuva1VdSO
	4EqLw80rFCPA/ta7ak09ZvlXWSYAz1xawC4Bqykv1XddTF36uWoY8XE191vHCdwhGJwhVpBKFeq
	DYMEVAoNgiKDLy0e90z76ugJfREsnliTe0i8xEwu4rOj2nPyVkpfKAJz70clm4w+FZ5jXypq54B
	oDkBKNkyD9I0dPNYfSqQqn6V+pNZrmP+lRj59qricjHQ9nRzPw/mVlsT70lA+0j7I3R97wBYRlM
	K0ndNHrOtHGgbA3YwwJgMfOr1Wc9ZgnK
X-Received: by 2002:a17:90b:224e:b0:3b4:22d:e066 with SMTP id 98e67ed59e1d1-3b41c7d6061mr24239538a91.5.1795797634227;
        Fri, 27 Nov 2026 08:40:34 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:6d00:8302:1937:74ad])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm38838830a91.4.2026.11.27.08.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:40:33 -0800 (PST)
Date: Fri, 27 Nov 2026 10:40:30 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Rob Herring (Arm)" <robh@kernel.org>,
	Sjur =?iso-8859-1?Q?Br=E6ndeland?= <sjur.brandeland@stericsson.com>,
	Alex Elder <elder@kernel.org>, Andrew Davis <afd@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Brian Swetland <swetland@google.com>,
	Clement Leger <cleger@kalray.eu>,
	Daniel Baluta <daniel.baluta@nxp.com>, De Leon <x0095078@ti.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Guzman Lugo <fernando.lugo@ti.com>,
	Hari Kanigeri <h-kanigeri2@ti.com>, Hari Nagalla <hnagalla@ti.com>,
	HyeongJun An <sammiee5311@gmail.com>, imx@lists.linux.dev,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Loic Pallardy <loic.pallardy@st.com>, Mark Grosen <mgrosen@ti.com>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rishabh Bhatnagar <rishabhb@codeaurora.org>,
	Robert Tivy <rtivy@ti.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Siddharth Gupta <sidgup@codeaurora.org>, Suman Anna <s-anna@ti.com>,
	Tero Kristo <t-kristo@ti.com>, Uday Khare <udaykhare77@gmail.com>
Subject: Re: [PATCH 00/10] remoteproc: Assorted bug fixes across remoteproc
 core and drivers
Message-ID: <awmyfo4HYoQ2dqKT@p14s>
References: <20261123172140.3547896-1-lee@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123172140.3547896-1-lee@kernel.org>

Hi,

On Mon, Nov 23, 2026 at 05:20:44PM +0000, Lee Jones wrote:
> These issues were reported by Sashiko.
> 
> None of these changes have been tested on physical hardware.
> 
> Cc: "Rob Herring (Arm)" <robh@kernel.org>
> Cc: "Sjur Brændeland" <sjur.brandeland@stericsson.com>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Andrew Davis <afd@ti.com>
> Cc: Beleswar Padhi <b-padhi@ti.com>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Brian Swetland <swetland@google.com>
> Cc: Clement Leger <cleger@kalray.eu>
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Cc: De Leon <x0095078@ti.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Guzman Lugo <fernando.lugo@ti.com>
> Cc: Hari Kanigeri <h-kanigeri2@ti.com>
> Cc: Hari Nagalla <hnagalla@ti.com>
> Cc: HyeongJun An <sammiee5311@gmail.com>
> Cc: imx@lists.linux.dev
> Cc: Iuliana Prodan <iuliana.prodan@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: Loic Pallardy <loic.pallardy@st.com>
> Cc: Mark Grosen <mgrosen@ti.com>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> Cc: Robert Tivy <rtivy@ti.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
> Cc: Siddharth Gupta <sidgup@codeaurora.org>
> Cc: Suman Anna <s-anna@ti.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Cc: Uday Khare <udaykhare77@gmail.com>
> 
> Lee Jones (10):
>   remoteproc: core: Fix integer overflow in rproc_check_carveout_da()
>   remoteproc: k3: Fix integer overflow in k3_rproc_da_to_va()
>   remoteproc: omap: Fix integer overflow in omap_rproc_da_to_va()
>   remoteproc: elf_loader: Fix overflow in rproc_elf_load_segments()
>   remoteproc: imx_rproc: Avoid stale mailbox pointers on request failure
>   remoteproc: imx_rproc: Register SCU cleanup after resource acquisition
>   remoteproc: qcom: Clear glink->node on allocation failure
>   remoteproc: qcom: Skip unregistering uninitialised SSR subdevice
>   remoteproc: imx_dsp_rproc: Fix pointer stride in
>     imx_dsp_rproc_memset()
>   remoteproc: imx_dsp_rproc: Fix off-by-one bitmask for trailing bytes
>

Other than patches 7 and 8 that will be handled by Bjorn, I have applied this
set.

Thanks,
Mathieu
 
>  drivers/remoteproc/imx_dsp_rproc.c         | 10 ++++---
>  drivers/remoteproc/imx_rproc.c             | 33 ++++++++++++++--------
>  drivers/remoteproc/omap_remoteproc.c       | 11 +++++---
>  drivers/remoteproc/qcom_common.c           |  5 ++++
>  drivers/remoteproc/remoteproc_core.c       |  7 ++---
>  drivers/remoteproc/remoteproc_elf_loader.c |  6 ++--
>  drivers/remoteproc/ti_k3_common.c          | 27 +++++++++++-------
>  7 files changed, 61 insertions(+), 38 deletions(-)
> 
> -- 
> 2.56.1.750.gf70dc682cf-goog
> 
