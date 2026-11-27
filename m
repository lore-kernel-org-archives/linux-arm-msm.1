Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786908;
	b=kXsMMlGY8AYIlKPV7Zh5GRVXKYFr7Q5eiARCGJd04ER1obIuXo/rRB1XzGBcTeruNi1N
	 uUTXv+W2CXQZlL1zXbS8A38H84cpVQArflkeWGfEpEi5bI533irv8UIy9QMmJHTUywlBn
	 BpA+1sUy4tfg/NodJP9Rrv6iqwT0FlorCGHQrrVw6DoTOwnsMqoSJVqKwxftD7ykxeIxc
	 C7Yw0Pv3EdZpyOyGd8bJ7DeFPVBxvHuBYq3u7SAm24bAEkxbgjroQFZ8Q/BxTYqCMLzdm
	 IyM6ymB5A2tGxPwkmLob/I4Rsa+hnyV/1DphuB11Bsu7ZWUDcaefcnp6GX2s0IddbWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786908;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=BDo//JmYwl1UQRJ5WVgMZg3yymgH4OPVdjLNDAoJQ+A=;
	b=C1NIZXme18lSgP/6gWGu1/Y5fd4GjDTR/nW3lEvtRtnv2bHkFpU8iiousBuDUH6YVk8B
	 +jR0JCZdkSutZe4eyVt0zSgt2v8gtL9Wm+HwQ/K5AflJ0uIKTGH6eDLgHOexmgGyoai5e
	 ougxTWAF+sRJsa2e1RrT6YtnXb4bUFhRZcIRTLtDO9qhSvIKJ2WLgDBuZDu0l0X6FVWwm
	 wQGdqLp7ZlzgPwnBbKaQDwmXZgFKGLHHBGllrrL2PkDKn7FsFmA9nF/0UWc22IYZTkURL
	 bgpEGao/1kXdMmeHB+gOsguzqfrGrNiZ1MDjL5/KuhSDrZkDVY9hDDLrCIokTzhKyPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UKQWceuC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCF1606A330;
	Fri, 27 Nov 2026 13:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UKQWceuC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02541F00893;
	Fri, 27 Nov 2026 13:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795786907;
	bh=BDo//JmYwl1UQRJ5WVgMZg3yymgH4OPVdjLNDAoJQ+A=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=UKQWceuCZyzZ+uqcWviiLyA5Kg9HClcVe3LQ59lbX/flKnZg7g/I9z5sRyAHbxJt8
	 4mDgKYcWOacgr7upCIGw2TDDcKq0zEPP5j3vZFwRFyDI+yXT1XuMq6OpM/hngufg7v
	 6fzz6tboP9rm+ZnVdi4+kK9aJrLmL1yxNcbI2RQFiJk6blKnkF1RxfZvj3s0GXgQZL
	 q9RCNDWj+CI045lpGZ1VbQqyPIhqBym43InYk6xnUkDrKbnLIzkthArZ3wBjzn2ll4
	 bv/sDs9R1MLwW74Ra93Skcv5Da4W/ol/TpfGUVlV53u6RM+0n53GOMBokhuTVITlQD
	 /3VY1aLaZ5jhA==
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
Subject: Re: [PATCH v2 2/2] phy: qcom: qmp-combo: Add PM suspend/resume
 callbacks
From: Manivannan Sadhasivam <mani@kernel.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261113103111.156476-3-prashanth.k@oss.qualcomm.com>
References: <20261113103111.156476-1-prashanth.k@oss.qualcomm.com>
 <20261113103111.156476-3-prashanth.k@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:11:41 +0530
Message-Id: <179578690105.13164.10122053052435645688.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985; i=mani@kernel.org;
 h=from:subject:message-id; bh=y1ICl9vTrafLL51TQXZn7JctWWJLDdci3DtJErJWppU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCYiXVAgM1GXDFYHgHjC61HHDNS0KF/izNjPux
 3WXJzR1geWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmIlwAKCRBVnxHm/pHO
 9ScMB/4ymnEjlhbG+zY4Hv/PZ2nwUxVkgwo4O0/1+0zXApW2fmgRW+FMNCnoVvgiDxyz2MMxhcJ
 yRGAbjkUD/cmWHd48yl5OyO2dRE0NGC5703NBUKIzchfNO4IKEk4FUnQNbb58qzUwWdXeIKWz8J
 KbIJIe3x7NfgfDVijf96Ya2rh0kXpgx7AcVlDJAOcAcL59f8JponXG3bn5DRJtgfwsgE14lQaML
 oPjfkDsfBxVh1oiLDKM7czHGKOpZCUh6xrdKsnNJEOywKBzlESwOe9RKpgy3HXS8gsgMeA6XP2P
 5SczwWMOptHQC2pWPYRyfCHO6sOqfoNr9+mWjv1zktpFuixA
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-13 16:01 +0530, Prashanth K wrote:
> Currently when we perform system suspend, the phy clocks aren't
> turned off leading to power leakage. Prevent this by adding PM
> suspend/resume callbacks for the qmp-combo-phy which toggles
> clocks on/off correspondingly.
> 
> While at it, add mutex guard in runtime_suspend/resume in order
> to prevent any race between RT operations and phy_init/exit(),
> as it can lead to unclocked register access crash, underflowing
> the clock enable counts.
> 

I don't see how this race can happen.

> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 187f0cd11f6c..65d280f45db1 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -4717,6 +4717,8 @@ static int __maybe_unused qmp_combo_runtime_suspend(struct device *dev)
>  
>  	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->phy_mode);
>  
> +	guard(mutex)(&qmp->phy_mutex);
> +
>  	if (!qmp->init_count) {
>  		dev_vdbg(dev, "PHY not initialized, bailing out\n");
>  		return 0;
> @@ -4737,6 +4739,8 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
>  
>  	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->phy_mode);
>  
> +	guard(mutex)(&qmp->phy_mutex);
> +
>  	if (!qmp->init_count) {
>  		dev_vdbg(dev, "PHY not initialized, bailing out\n");
>  		return 0;
> @@ -4761,6 +4765,7 @@ static int __maybe_unused qmp_combo_runtime_resume(struct device *dev)
>  static const struct dev_pm_ops qmp_combo_pm_ops = {
>  	SET_RUNTIME_PM_OPS(qmp_combo_runtime_suspend,
>  			   qmp_combo_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)

Same comment as patch 1.

- Mani


