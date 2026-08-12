Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4429E314D1A;
	Wed, 12 Aug 2026 13:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542800; cv=none; b=HkaXxFZDcuE1xbAemd27s2W+s7v1zGr6h7DMTmB9Ee9cQjeMfQY9leqeGYNofwSTD3vYK0ZwJrGG5UGm5LtdOgz53P9js8+g6aH/cAm3nGyQ+ULNU6o7MhjyQtsV3X8wB6sljZh7JiOEieBSvUwEVOW831rK46KrsOezIdZ4FIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542800; c=relaxed/simple;
	bh=jnddOTaulreO/MesAyh+45bh4qsPQrhEprnkUQblMIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ir1xD+jQ6yO/avbNqaBv77NJNMCKhVf9urTzoKLyr+Ps4eb5ruqz/Xx2Wju2kJxmNeJ+hdWDpovrjhu54WtTKYIqzWC9wFT0ikpsWafuGIUcivy5qxJvEIJshwtaSXMEza/bGsQqC5hVLXjfCtHiLmcM8s7xyjBzGA9Vog5tsaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsBBYIi4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsBBYIi4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA591F000E9;
	Wed, 12 Aug 2026 13:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786542798;
	bh=lscjbvhu4sZY3Vq6UVhR28UHnVjIyganW1V7Q5v5k50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DsBBYIi4YlKKemyZgZt10pE6owlC543boMsGE/3SZ171NrzLYeKNxXJRB8FfTa9W3
	 Euae2i4B4rI4SW4nh+JuR8IoIl6iCcgq3dyYPhEgRCQzyZ/s/8K/fHb9l5Zs1La9iu
	 UHiG9tE41njuRc2Fc594N6amZOW5JLNzTmUaVYvedBS0eaDbB7OevQnbmuEzSzaR2o
	 AEZqtpF9OVX2gnwhXgtvxUhLDCQBrBfn0nh7Bt/PPWeRCdlM/WLdpI2SpwCdcfx9Fk
	 0bdAFh75DnI8A9NcHFwTHys5khL9jW/SSnqQkvZX7zf80Zx70n8mq7kpDvpn6hkXnm
	 pKulT/tkgPYhw==
Date: Wed, 12 Aug 2026 15:53:09 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v9 4/5] phy: qcom-uniphy: add more registers from display
 PHYs
Message-ID: <bhvd4pv765rbog6wnj5i3log7dzqggtlibjnqeakj7rqibk4bg@wu2asltvxsuu>
References: <20260513-fd-hdmi-phy-v9-0-ca98c72f1f9f@oss.qualcomm.com>
 <20260513-fd-hdmi-phy-v9-4-ca98c72f1f9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513-fd-hdmi-phy-v9-4-ca98c72f1f9f@oss.qualcomm.com>

On Wed, May 13, 2026 at 09:14:07PM +0300, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Import register definitions from 28nm DSI and HDMI PHYs, adding more UNI
> PHY registers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
