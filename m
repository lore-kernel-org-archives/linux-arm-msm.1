Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DE9385516;
	Wed, 12 Aug 2026 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786547363; cv=none; b=ZjYCJhNQvZ+WO8jEJ0CJGUGNbzrWWOCUdVl+yjrvmZnURNmpXTQL2ipnrpjX7dpaNoBiekLJ14mycmY3MNZw9DkJykUBCcV9Nvp0/rgZYarDjX8apYZRnFPlHykOKbE6sb0p7YQTkLOqwKmTu6/WZP/xB1QBVNXtdZKijjBFi2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786547363; c=relaxed/simple;
	bh=UbkPm/BPWRkunaf40BjjjBdcx9gjROKttINrUWWw26c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4mzgYta/utbltJ63born8QmPRTO/lg2RF84Voe0x1X0xP052ale5B15/xTLy7/ojO49sA7MJsgG0iopFtAw4o6luHhyZDpV6i/azF6iDqdJIFFbAUbLLBR1N2zWXqtSQSA6bz83jRCx+gy7kRz5RWdH/mChFsJSuOkXwBRGu3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=knX8w7tu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="knX8w7tu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7161F000E9;
	Wed, 12 Aug 2026 15:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786547362;
	bh=aaqq2H2JimvVJmpoJx6SRa5PHhNV2698HwqcWY02mTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=knX8w7tuFaejNzJ612ZhC4U4PMt8qOPH8Y3y6YDnuHGZl7P9z2xfb0BkaQNDANCPm
	 rai61Ks+jVyMqAl+DHgK/OlTduKSGI5d++w9qaHpR6ZX5VvWVGmuuclQRHJnJyWtXN
	 XqW8FC5QzVTa1IpcLcL2KUoGeRI+PD3A7XOvgM+RAhYbn97UkquAmKBAKEKHuXNS+J
	 ggDMlVaRHk4IOThl/4cZjaXH764+2k7y5qTe2oNZkHaqsay6PV4rTdgHH+yKw0guIO
	 aiLEOj4JumuiFii6f1byHdFOt3q53wTw0oxP4/xto+g3mH3d+6SYt6MCI5kviHSptj
	 /Zm56nlCIzKzQ==
Date: Wed, 12 Aug 2026 17:09:13 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v9 2/5] phy: qualcomm: hdmi-28lpm: provide dynamic
 configuration
Message-ID: <xrkv6tfmaccqbpf2azecbx3kowrqvysgcgvgqpg4avaggb22zv@43uwievfbkzt>
References: <20260513-fd-hdmi-phy-v9-0-ca98c72f1f9f@oss.qualcomm.com>
 <20260513-fd-hdmi-phy-v9-2-ca98c72f1f9f@oss.qualcomm.com>
 <qxuzipnza3tzoig7xp3653vcqwgubf6zerzbgdmx5h6acof7zm@quy7xzjml7kn>
 <w6mq6a63mjzhjirvvgetcdptutkq3upa5v5kmdcezjke6rhkm3@lctdutlbnbud>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <w6mq6a63mjzhjirvvgetcdptutkq3upa5v5kmdcezjke6rhkm3@lctdutlbnbud>

On Wed, Aug 12, 2026 at 05:28:50PM +0300, Dmitry Baryshkov wrote:
> On Wed, Aug 12, 2026 at 03:51:16PM +0200, Manivannan Sadhasivam wrote:
> > On Wed, May 13, 2026 at 09:14:05PM +0300, Dmitry Baryshkov wrote:
> > > Replace fixed value configuration tables with the values calculated at
> > > the runtime. In some cases the values might differ from the original
> > > values. Those were validated on the IFC6410 board.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > One nit below. With that fixed,
> > 
> > Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > 
> > > ---
> > >  drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c | 325 +++++++++--------------------
> > >  1 file changed, 104 insertions(+), 221 deletions(-)
> > > 
> > > -static const struct pll_rate *qcom_hdmi_8960_pll_find_rate(unsigned long rate)
> > > +static inline void write16(u16 val, void __iomem *reg)
> > 
> > No 'inline' keyword in .c files please.
> 
> Why?
> 

Because the modern compilers are smarter enough to decide whether a specific
function should be inlined or not. There is no guarantee that the 'inline'
keyword that you pass will be honored by the compiler also, it is just a hint.
That's why it is preferred to drop 'inline' keyword from .c files to avoid churn
and leave the judgement to the compilers.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
