Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9238F26E165;
	Wed, 12 Aug 2026 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542756; cv=none; b=craP+dxx0PGRpnQ/VcJIlfF1C41n4PS7saApSvxVvCtmenaRXBr2WevE6/WOvOUoT+Gyp37MfNFVcprK9huPr8gvP7qDxqsJ01y//jOgw3byEkfw5YpTuvDm5kTpy0iCZHN5tsb8MyV4gBcKJzznUm3UKB92bIsSAuep2uTJ23U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542756; c=relaxed/simple;
	bh=U3RvL+rlMu374xFMQP4iFMpSxFLiN4olhqaps1cHmJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnLh0Gv/Cm4KsF/LjwqSTiVePQKYaIXe17Egsta4XG0M40ljUkBpdI5pXgFQ8vxN70HOHilYuyhH+QHyqtTps/cA30uFuL90mQ+UcB6QmoTeqseD6icCQRv6p9ChHT9+7r/q9U07BTldaVNQDUavY1talEorUxEweVbKGJ7sS/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FuGOa3va; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FuGOa3va"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2953E1F00A3A;
	Wed, 12 Aug 2026 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786542755;
	bh=E8L/wWgaYRaSHpsYJAGyZ1ZsE/P9xyI+QYDoYBgYLM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FuGOa3vaq6Q2P5UKROIgRWYLDHkh4GPoeHEOZ2v6wUbtjmUKfnr/cuVTkUhBJ8p6t
	 37wMqjnYhGcc3xfZqrhDIJV/EojRUX8CC6/9IX/BgrCp3ac77r1Y7xt4G1/GJmDKJn
	 AH55IHnpLxRxnPXZbtFMqyGyAdb8qxs4lyJIlBPpBlsFAzozdl5E99UskWq4lN5BHB
	 5S54HHLh0jISg0I7+FtWB6NHyR8vVvSUCBi74H4G7BMv40Mvd+XktTYkCuEW25M200
	 BtYokSNgM4VZnh02HET/xL8YHKGVgshpy+UaCq9TErGjslqoesJtBxwDbJjL850EW+
	 AF6FKbiYwof/g==
Date: Wed, 12 Aug 2026 15:52:26 +0200
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
Subject: Re: [PATCH v9 3/5] phy: qcom: apq8064-sata: extract UNI PLL register
 defines
Message-ID: <7hrs2a53xpjw24nyawklqr2p3p5yaxm7rsnpu7buvf46hhc4fs@cdi25r3hsrsh>
References: <20260513-fd-hdmi-phy-v9-0-ca98c72f1f9f@oss.qualcomm.com>
 <20260513-fd-hdmi-phy-v9-3-ca98c72f1f9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513-fd-hdmi-phy-v9-3-ca98c72f1f9f@oss.qualcomm.com>

On Wed, May 13, 2026 at 09:14:06PM +0300, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> The "uni" PLL is shared between several PHYS: APQ8064's SATA,
> MSM8974/APQ8084 HDMI, MSM8916 DSI, MSM8974/APQ8084 DSI. Extract the
> common register names to a separate header with the hope of later having
> the common code to handle PLL in those PHYs.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
