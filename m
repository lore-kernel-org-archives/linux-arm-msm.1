Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094819;
	b=Q861GcUm95qyb+V8RQdgPJN+7I6vcVLQXK3dxbWJMOfVf6+iUwrXa4tkzyHgYCWeMUxw
	 uCJCfut0j+gtgXyisyP5RMLUNTuGBp2/0ecx1i3LcjEA8TI/ypqyGGqBwHT+C4nuTFqQD
	 0cWQJYNn5oPWl0EZudVjqt+BSdDaiIlIGXV+wxRGTV1AOOhI1wlneBax1tH5M9AC7cxUz
	 CcjRURGyJsv7QgfSAdPLHvJ1ojtcMLVMrBl/iyTvLIgA4Qe3fl19fXHjdGg5h31t3nF1w
	 nzJe841xi6vjpmWVZ7s2dGhHfoZ/ahpExGzzbBTI046lVeHRA6GjZqX68FA3an9iKZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094819;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sQbbzbHleRgMhYk4MRlxuNqWv/S0BzKdWRRLqbhStz8=;
	b=gw01NPhq8K/rA8E8q2NfaS/nKrlUk7BQLDmBrxe4rpAy3XK+73yVyivqtGPsmeWetBbS
	 AyyImc39H5mytGOVREcu/eZIl3owK71wmbwuR6EqbK7miATtkPkrRDY56UbX0SF+KrVhV
	 ovEU9LjmzHfUrSprFx5nr/OlFs7ZFGR8H68FkgP/aK/7Svdie11z1qGVY+GWARBbWFb/o
	 62cAGKM87t2d6K3Q1zMnOVt81YvW+QdOBslu+/nqRJYcuyHloniXG1+3JGadKqFWKil+X
	 56/zUiNR2Yl30mKNLp1o3O+iPzbzyyU8mDGJo5bHVTPebYZNeAUA2j2+jCaPDsy+uIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RmQHl5fe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 80CE9606A320;
	Thu, 19 Nov 2026 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RmQHl5fe
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 3DF471F000C4;
	Thu, 19 Nov 2026 13:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795094819;
	bh=sQbbzbHleRgMhYk4MRlxuNqWv/S0BzKdWRRLqbhStz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RmQHl5feQvyzuWYIBe4qFMTIMRjIO4Rb0a6jFnKaCVr8Dyp+s9j2Rhcr8Zb+FAHgt
	 vLtqwf07JRGEqoUkxxBA+r4nN32hfRt4xERUKG3a0ZH3T33mWc1ksvuDYSONWL4jo4
	 EUXmqjEXFMAQjAYvzuzidOOqBZ0xwS/bj704pRG0h/Q4FmOFUobbXbH565Jx446ywl
	 qgKjg45toZCTlz3DrfTnoG+4cz/J6S/XaxW/pJMMpdE06ntJh1BFtw2jPXesf1Ne/i
	 fgfh92Utc3RixUSKR644JaWWJh3Ujwe0KdjhpU9QKCEs4Qvb3RkSbOfXkuytGR5Nxk
	 UAnlDobX4n/gw==
Date: Thu, 19 Nov 2026 14:26:55 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org, 
	quic_eberman@quicinc.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: tzmem: Clean up SHM bridge on pool add
 failure
Message-ID: <epx2xupsshafyjbqgbnezpgrklioduhf7d5f7tqkisyouu33br@7wmobjxnmsly>
References: <20261118132343.2350034-1-haoxiang_li2024@163.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118132343.2350034-1-haoxiang_li2024@163.com>

On Wed, Nov 18, 2026 at 09:23:43PM +0800, Haoxiang Li wrote:
> If gen_pool_add_virt() fails after qcom_tzmem_init_area() succeeds,
> qcom_tzmem_pool_add_memory() frees the DMA memory and area descriptor
> but leaves the SHM bridge and its handle allocated.
> 
> Since the area has not been added to pool->areas, pool destruction
> cannot reclaim these resources. Call qcom_tzmem_cleanup_area() before
> freeing the DMA memory to delete the bridge and release its handle.
> 
> Fixes: f86c61498a57 ("firmware: qcom: tzmem: enable SHM Bridge support")
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> 
