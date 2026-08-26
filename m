Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEF53803FD
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732073; cv=pass; b=uyLKR2OsNqHTxVJat2dtglII273MSwi38PaJysziwi2H5fhuGxFqGfLwTaj9agoz1RzgACXJnV1YVI7eAIVhF1y+2TrdnG+1IeY2uWSMRVrTUWV1E37vefIBi3hRx9J/r0WPZpxRqEKiuScQVLu3LHPRSeH4uAIJzmP0iXWl5RA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732073; c=relaxed/simple;
	bh=R9amIzEFA8q5uB6W0hUHTDML7nWF8S2I9fUZICwpgSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NIgZKbDFhZWXYV2RGizmxpdMHnZlQuGLK8272P4X66Oj5DReErl/jFT4Z2Pp9XpcIl3SLCiL/H7y3qmTjJKSVXSXuw1i59L97/x0fGVBAeanZRkRvc46jjpmSplh3Ylh12ncMSwBxT3EHoo1tJUzh6jYExne3tGRWC6roL0QWrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAU8Xm7l; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAU8Xm7l"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66825847b2cso854286d50.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 01:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787732071; cv=none;
        d=google.com; s=arc-20260327;
        b=aZEs7K4NwWSaEs1hTYQXPne0Jgswm/W1diFQxL9xSx7ROImEuGnFy7PcxspSZys324
         hGPpcT85SfrMLgel0yMv2wwdP4Za6rXyhVGMCyaBBEK+JJ+zgBoGJ0kTJMm1HsUbbDWq
         eQFqe58A0eq1/4DuENHnvK9j1+qeJPbMtEiBKtcCqZobf4IYsLaIzfNUYIb57q1vi6P0
         3aHKNCh2fb/sBH3jKOkmhQrfHVmVVLVuqfH8i2lCMAHluDJLL1tWlXHTFttXSkJdn6Z4
         QZJeQAHkUE2is8bM1cdpYCGlhrcMlyoHL9OLVgCG6P2WbY8hAD1IxfIEKIr2VxACINJn
         JtwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R9amIzEFA8q5uB6W0hUHTDML7nWF8S2I9fUZICwpgSY=;
        fh=DwihoghHs+JfGro3djOWm1QUNGbqbkm35L9G7SwG300=;
        b=gOLoom9sNPJ1LsHWnB9GTHwtAv9deU9tEuyTZ9XJQwiIUe8BkodqJGDUrniFbMKsL6
         Pxhy9goeS7D753hBIPvXBK9XP/PDLr+laF4X6SAuyr/Vsl5W5jkg6vyN9ybuVSRUJesj
         jQ0x3bSPxUI/oC5A0gFKmSMQDvo+2yWW1oiRbvzFHQ2pJizGpqffrRynhoPBsClNhXqD
         EnJqvXJQ4hdmTf2TW/ew8CdQkrVpnR/XNBtwrGWEG1a46LbiPNwYH5G6WbRayaxxJ4lw
         TupL0EtgURb+njcO9N7HLCvrbHYVW6ixnvc5BtlTqKWn5ucx9M9z8gOpnOJiE8kH79qV
         VVRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787732071; x=1788336871; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9amIzEFA8q5uB6W0hUHTDML7nWF8S2I9fUZICwpgSY=;
        b=CAU8Xm7lzdq1b1qO40sGEQasOMuOPt91pJDd62FxN3OIyDJXcmmUbpIqvRrC4QUuGn
         qpHtR1B2GKXZSckfzUt6vVW62uHCDOiWhJYzqkkZfmE+dyeGYdDSRNqa4LSzULwKgDIW
         pOMwN0VGK4ZNzUemiU9wI+5Y/6N9niw6Lp/r08lgrm6jiY4/2YdVAmBfkA1bcFUMXPna
         kiHzsiJjblwHgLoxzVWQSk6oVBrguHCoE2Sv/tnoR3LyaLyyatub1zPUGFcjvpmT1N/B
         11ihuug8+FLdBTQOpmv2oUvMTU/HXCohtBzpFEINpxiJOJ3Ym6DdftmfGJqXMY78JOyg
         XdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732071; x=1788336871;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R9amIzEFA8q5uB6W0hUHTDML7nWF8S2I9fUZICwpgSY=;
        b=DNNlyY0qkTsaDLs/mUOXHM5TZQImI9G8rklb7V4dpuiGfgGT4cJgkAAsHV4a5wFQ/l
         NTMh3WFOaOImEFRHwDndLvmXjUhXrIqmdK8whFfVDM7nRVsrdxeAh6YjyqIVr9/U0nHS
         5ckAZxUIAbY93feKpuvuEHlCw53VvffWv6EBhIC5nEQII+pS9jhW8zp3D5Kv1GzwX+He
         cyBGp91VmT9vCMlGERq+3N4RbiPyMCZBSL1DCWcYLsYw8VWQxlTR0fin8QeWTkYr5EYL
         mMlCKkSZB52Wy0A/3mcsJnrJ+Sjb74WfO3RFSvr2xTzsVdDjYsOrUHq8oe29eRRztZCv
         B8cw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1Jnl4V5fjnhjsz2M0qd/5UAJ7LIjRB01CRzL1eq0t3w1sSm01gRbKt2YX30CueFrguZGQ7JemLLY5YIOC@vger.kernel.org
X-Gm-Message-State: AFuF++m6DWcNtl+ZPFo/oaWkUWUM5mz3h6TsHEV3uzi8l/6uHxZhWSHS
	V0RbufwtpzCK/juRScXXliR/M0Iu625C+sT/y1G3pe81jjz+FPNdKqKrO69iGITXDTOb9Nosz+0
	VcszbV+4r4nGhd9vH5T6YQp1a12n902s=
X-Gm-Gg: AR+sD12nwPzz04l2bhO5MZis3usdEJYt0Dl7zity+Gn1rvfRzZU48rSf7PsnGrN87Cp
	q8J5s/QYIf+b/AsIy3fWD9XRNiJPAHLq8KKr+KF0b9zdcQ9gTa4GeXfk1VQCIE0i1sJqizoqevf
	YDYnJ0uvq3LA9xX0JJ1kfdn65++vZYCgQ6p1QNkwcNPky+Aks7uVxg4J/otlHLv2ebyJad/IoQF
	1+saspySISQ32NsfmFRC5T4gk7K5dP00psV+By4DeX7A2lJyxOXKT1GnT0XFMmUFgsejTgqAQb1
	L6M9TFcSgGLs4AGZ+yYnmmaEDYGK/CnDi9DcSuHo11u2JZY=
X-Received: by 2002:a05:690e:e8a:b0:66c:d6f6:eaef with SMTP id
 956f58d0204a3-66d25694eeamr1750611d50.18.1787732071154; Wed, 26 Aug 2026
 01:14:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812094425.3515179-1-lgs201920130244@gmail.com> <327de6a8-6c67-4328-83a2-bfea332aba7c@kernel.org>
In-Reply-To: <327de6a8-6c67-4328-83a2-bfea332aba7c@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 26 Aug 2026 16:14:19 +0800
X-Gm-Features: AcwNN1WbmUut-7AuuFCqwoZdX5jzcjMrvGCq4xDXrennGXYAL0ALsEP7Epy-Qzg
Message-ID: <CANUHTR9+a8OYmsezZFWMvm+a7DQ980sjiVOjynyjv3ChyPSTLg@mail.gmail.com>
Subject: Re: [PATCH] i2c: qcom-cci: fix autosuspend cleanup
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Wolfram Sang <wsa@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 20 Aug 2026 at 22:01, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 12/08/2026 11:44, Guangshuo Li wrote:
> > cci_probe() calls pm_runtime_use_autosuspend(), but the remove path
> > does not call the matching pm_runtime_dont_use_autosuspend() before
> > disabling runtime PM.
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without undoing the autosuspend setting during
> > teardown, this reference is not dropped and usage_count remains
> > unbalanced.
> >
> > Use devm_pm_runtime_set_active_enabled() to manage the runtime PM
> > state. Its managed cleanup disables autosuspend and runtime PM and
> > restores the suspended state on probe failure and driver removal.
> > Remove the now redundant manual runtime PM cleanup.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>
> You sent vast amount of patches, all separate, making it very difficult
> to track and respond in efficient way. Do not do that.
>
> Group your work per subsystem.
>
> You were asked to clarify and respond to incorrect fixes statement. I do
> not see how you clarified and responded at all.
>
> Best regards,
> Krzysztof

Sorry about that. I should have replied to the earlier review comments
explicitly, and I also should not have sent so many separate patches.

I will group future patches by subsystem and make sure to respond
clearly to review feedback before resending.

Thanks for pointing this out.

Best regards,
Guangshuo
