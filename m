Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411DB4307AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786972336; cv=none; b=KYuvDSDuIvdHc4NptICvX5cciJmeIUsFdYpJPy8yjLXZLCe7mJa0+sBFgVITgq3QAWmXwspowb4vFUevkmfvmQKPPQTkwS0lZE+muieHcM+7DUZeTEuYUfehR9hdIXiH0DgNViHj7U40Axe7SNdXIMvh6N74Hro5J48AqP0Xh7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786972336; c=relaxed/simple;
	bh=dQ/H3XY5fTRlGrTTCRMgcg6R2IED5vstP6YDZZ2Lg60=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DM4GAeGVipYRklh/i2zrXZc79y22jNIWltJvj/WRNzJUvpqWuVigHY9eJOd5azAu4fXQ4gKagYZ8jAPn3eRrgigmR/AE5OkCmAHJQraCyJY2KhzyjIvoG3ri1pDcfqOQQ3wp9RzJtcxaxYgm/d6ahY77uzLm3cXdXqjIzwZNvRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLPLY0rq; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLPLY0rq"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so3416256a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 06:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786972331; x=1787577131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lTHpr993bewVeu2QK28PUz7lB7HML+v/keJBM3aBb4I=;
        b=LLPLY0rqtVEZmAYEyhp/QqI4NaPWXIOECPv2R2SB1iFC9Rp864xMZgNgpqua+8Wowu
         0iYkdiG9ov9Qx5aGuk5e/ou+yODJ8h5iNEz7RuEZTn1yJMdv/BSAcsWt6SsmRoD/FN45
         bSJUv16/5FjH6SgOVNIKnd8IuHU76B1bSMLt/TQsLffz3X2RRJ1ZphVnYJV6o9fAXBca
         XrgQ1sNOaR//lrLYCM63h2qex2Nq61jiUtZ1Izj3M/vWgS+77BjmZi1WV3RJhGBLDle/
         LV9SFUvXkQnMOCAFC4SqoZEO+BIr5Viq2LmSczqtx43L7UmQEcgu0efN5q0sFN+P2RsU
         6ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972331; x=1787577131;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTHpr993bewVeu2QK28PUz7lB7HML+v/keJBM3aBb4I=;
        b=XUI5Fa7WUY9pSxb+E3N8ZohUf4JiSpMhv3j5TOxe7hRt/2GBZNdH4aoREMF1fzJ1xu
         tChqtx1oTW0PbiHWsTEIR3Is1vtb8QeTjm/+w0PSABnrd+GW9jNBPWHjc0kb4tLJLV9n
         qwrh79yXfQZ0sziw0JvMKrX4O4JgbVVDM/Vy5XYVxuIcoqf/bvWth4s2NxD76MryK+vw
         dnHJKLIGys5frHHrtFLTD3uo+vDeNXQEh1/pXZHnC7kzyMU3antVNMqBYNuaC8ABlZq4
         sIDL6hAZbUs1Ffw3L335YuZ36M1pPspk6WzQHXaY5xv281CxY1z24/FJzmd1xrDpqyP4
         WN8w==
X-Forwarded-Encrypted: i=1; AHgh+Ror8dx5gWZi8eDyMq5elzPbXkHqIifDlt9+YWwP8firwu7IW3x94vI1nidwUgIdkldoZUh00+lN7GvB5F8F@vger.kernel.org
X-Gm-Message-State: AOJu0YwBEBmjc4ZMGR0sF7i9S/0AoYScw/5o2+US1gNqsCBBNKDt9UAV
	4hOlvC4ocX6IiatjcLhDJdDXLV1CrzgmIUc0w1xtoQtOQyL6g1BdZf8=
X-Gm-Gg: AR+sD12rVX/zrVna5+yg3Ojj6UPAa7qYypV2564qXY/T+e0ddE+5FFZ0rCoRv1mKEE3
	ldB9W/oV7dcaEF9yXQvPfXSnez7a/4UU0HR/1Rk8WQpVPDvnhDeZrmumQH57EHaFvnxkiBXJWz8
	0Ctv+BfvFkU/50S0WDte0H0k5KGOnOr6+My53FLNzkH459zS7Tnnhb6b92CzCQgz9/jt1AXtX7n
	CYrqYQ2nz1YnfE2ms6mOxBkja3Mdd7t82kiFgfVZs+mAhhs8H/4BGl/AXlPIkT5AQH2vj6WtW/m
	pHby//yd1dVuz32uMME22AiyQcFerofxNn4rZVAU5JbFoi+JwMZB8B5Afkso+3GpvIC55H3AbYw
	5tU38dE8raTCqRdXqTMtiKOWmNwXX5xRzHEhcG1NktprVCu+ckw+jY0LSWz0wPN4nH2ev2zdYsP
	FLJxqfMYOLg5jdk6Gh7TZkX8Vsa6OmZT7APL3TZIWmlV4OgzmOxMDfVA==
X-Received: by 2002:a17:90b:53c8:b0:392:c80b:8ef7 with SMTP id 98e67ed59e1d1-3955aa68f86mr513356a91.18.1786972331373;
        Mon, 17 Aug 2026 06:12:11 -0700 (PDT)
Received: from octoberrain ([2405:1200:418f:8400::5d9b:1e58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531e3184bsm4941870a91.1.2026.08.17.06.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 06:12:11 -0700 (PDT)
Date: Mon, 17 Aug 2026 22:12:03 +0900
From: Robert Eckelmann <longnoserob@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vladimir.zapolskiy@linaro.org, andersson@kernel.org, bmasney@redhat.com,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 m.szyprowski@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
 val@packett.cool, david@ixit.cz
Subject: Re: [PATCH] Revert "clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks"
Message-ID: <20260817221203.462c7d31@octoberrain>
In-Reply-To: <CAO9ioeX-PB+v=OiuDakFE9NX5tDJdhjwvONJSmURKh1ABM=fgQ@mail.gmail.com>
References: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
	<20260811174822.1f4bcbf8@octoberrain>
	<gwdrtsvqcgdfccyrmyjgstcrr575xv4ltotrdl7ml4lzsfof4b@iv4lae7446yx>
	<CAO9ioeX-PB+v=OiuDakFE9NX5tDJdhjwvONJSmURKh1ABM=fgQ@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Aug 2026 16:21:54 +0300
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:

> > Yes, please.  
> 
> And then almost immediately (sorry). No. The flag is correct. To
> unblock SDM845 try adding GENPD_FLAG_NO_STAY_ON to the MDSS_GDSC. The
> MDSS reset is not working / accessible, so it might be the only way
> forward for now.
> 
> 

Like this?

diff --git a/drivers/clk/qcom/dispcc-sdm845.c
b/drivers/clk/qcom/dispcc-sdm845.c index e060097be413..bfa657113ec0
100644 --- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -764,7 +764,7 @@ static struct gdsc mdss_gdsc = {
                .name = "mdss_gdsc",
        },
        .pwrsts = PWRSTS_OFF_ON,
-       .flags = HW_CTRL | POLL_CFG_GDSCR,
+       .flags = HW_CTRL | POLL_CFG_GDSCR | GENPD_FLAG_NO_STAY_ON,
 };
 
 static struct clk_regmap *disp_cc_sdm845_clocks[] = {

This alone does not seem to solve the problem, I still get crashreports
like:

[    3.493402] /soc@0/display-subsystem@ae00000/dsi@ae94000: Fixed
dependency cycle(s) with
/soc@0/geniqup@8c0000/i2c@88c000/hdmi-bridge@3b [    3.513397]
/soc@0/display-subsystem@ae00000/dsi@ae94000: Fixed dependency cycle(s)
with /soc@0/display-subsystem@ae00000/display-controller@ae01000 [
3.537096] msm_dsi_phy ae94400.phy: [drm:dsi_pll_10nm_vco_prepare]
*ERROR* DSI PLL(0) lock failed, status=0x00000000 [    3.547813]
msm_dsi_phy ae94400.phy: [drm:dsi_pll_10nm_vco_prepare] *ERROR* PLL(0)
lock failed [    3.548807] qcom-pcie 1c00000.pcie: iATU: unroll F, 32
ob, 8 ib, align 4K, limit 4G [    3.556493] ------------[ cut here
]------------ [    3.556495] dsi0_phy_pll_out_dsiclk already disabled [
   3.556512] WARNING: drivers/clk/clk.c:1188 at
clk_core_disable+0xb0/0xd0, CPU#4: kworker/u32:1/60 [    3.556518]
Modules linked in: [    3.556524] CPU: 4 UID: 0 PID: 60 Comm:
kworker/u32:1 Not tainted 7.2.0-rc7-sdm845 #1-postmarketos-qcom-sdm845
PREEMPT [    3.556528] Hardware name: qcom  Inc. SDM845 HDK/ Inc.
SDM845 HDK, BIOS 2026.07-rc1-g2abf33b7c8ea-dirty 07/01/2026 [
3.556530] Workqueue: events_unbound deferred_probe_work_func [
3.572719] qcom-pcie 1c08000.pcie: iATU: unroll F, 8 ob, 8 ib, align 4K,
limit 1024G

[    3.573911] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS
BTYPE=--) [    3.573914] pc : clk_core_disable+0xb0/0xd0
[    3.573916] lr : clk_core_disable+0xb0/0xd0

Can share the full dump off-list if wanted.

BR,
RObert Eckelmann
