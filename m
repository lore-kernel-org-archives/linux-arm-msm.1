Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779884;
	b=X/Z0l6quy+ySvUIIR8PhIeA8bji+O8gnjv5FwZAbNqt9K6Uz30pgebQqi0LNBzGlNkIY
	 X2QvLr6Y/tNmtf3HBfgbnzvgg2VQ1Nlod31KVfoVKYHlr+S52jyixdW94BKjoWqYCVxYy
	 bjbIYKQvrfmWoa1EHSufXy5asi3kkQ07mLurESvGQBcvfxLgDb/Bew43L+oq/UJSPopU9
	 8onqCW/EpJ++IQ1Swr2hETyoDj5JALl3ZTVftSIHq9g48m1Alk7wueGFSaINtvGqROm5v
	 XO86QZPvwCnm7A128XBm1g5+5u2p/RNmTFUFwg4jED3A03fbV+UBdERYtei+rSQ9icA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779884;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=whClQKJ7bilwLLcVXchgxYVKnvUQImcedOodgOWy20Q=;
	b=bZQ7JYhaGu1JuvJcc968BOZVJkXZQIem9ZXuAiK4NN4oB87+O56cVb6oBL48O4hrNCs7
	 NmiIqUYoYKgIX/7q6R6CTq8ImkeQdjz5ukxa4DB/OCtFxBFaRS+SpeQTRnQghcXfEtY0F
	 p1S9DcETovB66u9L+k1b8huGHQuCN2MnhJ6TwikklTTgHjgb8VfuI+MUnr/diMVuhdQdI
	 fgi9MQTZiRJzARDF914PJ2BELJn2DBG0kIma1/YKnRpu4bsJXRIs8Sm2M18fWzoIvGwqs
	 /Kx8WtKcISi6OrUdf1WaNlEjaTnjbmWREjd50/ZCiChhuNwKVO2+WJXg2ySCsyVvpCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hVtAIhKT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14E7606A31C;
	Fri, 27 Nov 2026 11:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hVtAIhKT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5191F00893;
	Fri, 27 Nov 2026 11:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795779884;
	bh=whClQKJ7bilwLLcVXchgxYVKnvUQImcedOodgOWy20Q=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=hVtAIhKThEF0buv2a4dNOWJKjK8VSh1H/obscDvnse7JWoE6BgK/AX9d4fv8kgVFf
	 CEoeGNFxtv1cUu2B6iQnyTEVmu5K24CJgqSz5N8lFb3oYAy3pgqdMW18/JsD8N/i+6
	 rqXwrAhPtaCbRWyh4IghdyQgvMGscdkQKMkioFK5bDNAiPgGMwdgRzP/E3Gkfa2ZS2
	 DSnr0OZiKgXsOSu8GtW7HwsW8DK9ZfFxBnCRHgGAFna/qpQkje2Eic6hx9YfMoawKh
	 8S6iuXBAav742iqR6e2fYvvUl2fvYUa3PTeFjD349X5/o3iDkxUkfvymHakN5a6mda
	 kDOBDFPvb9ytg==
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] phy: ath79-usb: fix the suspend override reset name
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-phy@lists.infradead.org, Alban Bedel <albeu@free.fr>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261106011142.516478-1-rosenp@gmail.com>
References: <20261106011142.516478-1-rosenp@gmail.com>
Date: Fri, 27 Nov 2026 17:14:37 +0530
Message-Id: <179577987749.13164.3981219899044180404.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=753; i=mani@kernel.org;
 h=from:subject:message-id; bh=k4r3F9uNkJHA54pn7+unObljLT9MHxgoO6rb9JuAa+4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCW0ozuBOiQ6/3amQf8E4xn+/ypf5GromKFHCV
 7iWFLdlztaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawltKAAKCRBVnxHm/pHO
 9ShkB/9429HCrug9mkge5t/UM8prguPgQMDShIIqrqvP5co34oUjd5BvfriYwgcPjMu1IZl8jgH
 p1VYVAnEgclnonaujDLDm2rd18ffY+mWH2H+8/fd3qVbVbVo9Gx7Bv6vDYULE3VVrFTIo1DDja5
 iGLWNZbekjPJ4x4elE6WsOxNj5n9lOK5JYIQhJclKwSmdOtkYPMpgOCiRpeMhLCs6UBnWm7tDUn
 D80SG4zU7NCgL/ZDmalAzFpN9VDRodBjJNwFDHp+dY2JcA4xQ4icQKilREz2RvOnjGHPpLGv3xq
 jt5JHOmibcRrbVwq757q8Wdpf76yfi4wnxOLbbWZjMq/dRbk
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-05 17:11 -0800, Rosen Penev wrote:
> The driver gets the suspend override reset as "usb-suspend-override",
> but the binding and both device trees that use it call it
> "suspend-override". The reset is optional, so the lookup silently comes
> back empty and the suspend override has never been used.
> 

Good catch!

> This is the same binding update that commit 827cb0323928 ("phy:
> ath79-usb: Fix the main reset name to match the DT binding") followed
> for the main reset. Follow it for the suspend override as well.
> 
> Fixes: cd3bf368aa7a ("phy: Add a driver for the ATH79 USB phy")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


