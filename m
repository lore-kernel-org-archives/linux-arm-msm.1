Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389B545C6E7;
	Wed, 12 Aug 2026 13:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542567; cv=none; b=W71abIuVFv8Px0QtaWR0yDmIlO+azLL0/P2ZYb6ohPcaUmAXXp+Wdf43N6sEMBISQL5pDzxhDBo6okiF6A9LYoE0P4tvUC01N9o34lWFWeTJz7Z0/+gY3xs2mhY29hirkTDf2ZLEIM+R/KQxk6ii4sseFIhYYSYv1a5DMZQRXmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542567; c=relaxed/simple;
	bh=NrI6yhq2y812LLkzpGizfAmvNmVbQUj6bQQCdyoQM10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L25/zZ6z6SdXZ9nnHae9usYfKMxmGvlpaz0OlJYXfd4phq5POgGFKHlT87SiJkp15sQDU50KgYC5U4CyLvMoCxsea8TS/QKFk7YIuHXqqZL+m+n+jxdF6sGxH3C33R6/CqYKmkWU790b6H+Bz7N5EKVQeLiAi9NZh5nJ0APshfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M42KjWXp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M42KjWXp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4031F000E9;
	Wed, 12 Aug 2026 13:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786542565;
	bh=qc+tb2kaon6pC/BAOxE+EancW/8TIBH5x8KL5DrAOxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M42KjWXppc5FA5jAlhRDCRmloZrfvkNRW2PUXI1NsK3qxIYeGF4ioj7gS4fU/Rmp4
	 XDCl9p7ksaknk4O6w9/5hrb9X50u5Zcx9SCVElwKRHDyDuwL990TG5wvEhrmkLeIoJ
	 G0mPkEtbu743dgNbhDiyWENcS/aE4rgmgPHoa9JikMTzUfXeV9moisNiI/Uz0E6/Hi
	 rg4gllAK6QSV9yBJZiU56/iHPy5fhGINln5CZGR1jMAOqslqKg3X51XzpJtN2MjJCZ
	 OLY2kA38W9cU2e1Sfjb4ub/e+BSs6pnjDhvWE6ciQicRRp2Riywb39A/82eq3SoWQR
	 Wkq74mQXoeKig==
Date: Wed, 12 Aug 2026 15:49:15 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v9 1/5] drm/msm/hdmi: switch to generic PHY subsystem
Message-ID: <cph2vu2rgbddshnhfdxws46lkh6gktycd7ppzvcbwdxhsyjnxg@igv3jsg3qi77>
References: <20260513-fd-hdmi-phy-v9-0-ca98c72f1f9f@oss.qualcomm.com>
 <20260513-fd-hdmi-phy-v9-1-ca98c72f1f9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513-fd-hdmi-phy-v9-1-ca98c72f1f9f@oss.qualcomm.com>

On Wed, May 13, 2026 at 09:14:04PM +0300, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Change the MSM HDMI driver to use generic PHY subsystem. Moving PHY
> drivers allows better code sharing with the rest of the PHY system.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

This change it too big to digest, but I don't spot any major issue. So,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
