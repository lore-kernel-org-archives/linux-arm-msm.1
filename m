Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB769368291;
	Thu, 30 Jul 2026 21:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785445462; cv=none; b=dLmZjJAtg8Wvf8hQSm2hmto7qfHyXnUv+FNu+EKRGCqXA6m7B0VpmLcIdsGpCN0TlHWvxLHwPmP5iXEnGuKlxE3AJIsSxrgWQJllR2S9QW061hveDi0A8KHnX6UdzmtAfPhTZAgMGrtR66Krr+0sqHdk9aeCCAbzhj+Sf/irMC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785445462; c=relaxed/simple;
	bh=QG4ceUAaQmSm24/4iNiKcQgI0wxWA+0Imdmk0iR5X4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=us2goJRQ2W31Adv4H2ZtrgqGFFUcfhZoW9lqjwbCYPbt1P8uuQVMNO2WblK96pj9fmuEzYhxsZkmSm/SUq8ySnuTzpHu7deKvutsG7sCDIFpd8c1SO6no7WYQy5SFkUgIJYHwsd/gOAarusLFvKTa4qI1vZ+pZtc89aHjwRd4WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfIgBtxK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfIgBtxK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D2E1F000E9;
	Thu, 30 Jul 2026 21:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785445461;
	bh=FOui1ExpHE0Jd4HAMqesI8RtLaWIpX+rbhQt8p5Q01s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MfIgBtxK13KLkKyjWDtVos31aKZo/ShKlGJLr1cIPUdGuv+fjbw+79gQjiSMxA8gg
	 b8noKkBJrbyQgCSbrcMgqBY2CLs1+E9jF9A2+VdY/gWf08iLMHrPRe7/3+DtowlKBx
	 2/irvkVevoFLVTQ1NCiNyJm8WMoZdhdAo1mKcqXWxw/GKNzn14f7JFEWmvEB+6RC8Z
	 2vZVhhVUo3yajK3ighT/iDKG4a2yY+BvXDLcc4mQTiME9OyvBqy+IbLVqJSMDE3kxl
	 hRmYBOXT3bpKa7lpV9LfxQ9o3XdOTRkWBCHCCkjwGqp7ywdN4aOpqUiUU/2yREL3jC
	 wsnxHzRZ+2FXw==
Date: Thu, 30 Jul 2026 16:04:18 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] firmware: qcom: scm: simplify code by using classes
Message-ID: <amu8OkjKt4v4t4CN@baldur>
References: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-qcom-scm-code-shrink-v1-0-02f5ce02c95a@oss.qualcomm.com>

On Wed, Jul 01, 2026 at 03:38:54PM +0200, Bartosz Golaszewski wrote:
> There's a pattern of enabling the clocks and/or setting the bandwith
> limits before performing an SCM call and reverting the above after it's
> node. In all places it's done unconditionally and can be simplified by
> providing appropriate classes. There are also a few places where we can
> use __free() for tzmem pointers.
> 

This ended up conflicting with the PAS changes, can you please rebase?

Regards,
Bjorn

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Bartosz Golaszewski (4):
>       firmware: qcom: tzmem: guard against IS_ERR() in the cleanup handler
>       firmware: qcom: scm: use __free(qcom_tzmem) to simplify cleanup
>       firmware: qcom: scm: introduce qcom_scm_clk class for clock management
>       firmware: qcom: scm: introduce qcom_scm_bw class for bandwidth management
> 
>  drivers/firmware/qcom/qcom_scm.c         | 184 ++++++++++++-------------------
>  include/linux/firmware/qcom/qcom_tzmem.h |   2 +-
>  2 files changed, 73 insertions(+), 113 deletions(-)
> ---
> base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
> change-id: 20260701-qcom-scm-code-shrink-c9aff845537d
> 
> Best regards,
> -- 
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
