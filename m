Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0823AD52A
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787731866; cv=pass; b=cseI0lRVMWUP2jMZez7xF1TCh57a4RssiW3gvhQCtxXQYwJSeCazeQxCsnpH1zqUwnPELCb2/zcA5M3/bFbKklrRkCdIpzBJbKMJg1aVhbJ62ZUHbqeDTDByvsQ4lGXIOAuhTN1sve21uOAHiIBdMHyHk4WAZ6cmsQCyH6ztYb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787731866; c=relaxed/simple;
	bh=5yyh1VvWI+vaETl8iuGoTVN8P021SyOBwMiKg7S/KSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KjO9IWTyiLGPRsFYlwN5y95+E1OZJbL3aAe/n5rEuirNxT6rrJ3jbOv/gSdD8QhaK+so3IT4YFYUZxWIPloLMSDbpw5Si2RcjnK3X/5X5YZ22mA1SetGN74cy2z83srYTFCtnRlyFx6lZPvgCXgj6HSVsEDoZcZJHIsINt9Ml4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lr+vgW92; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lr+vgW92"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66d1447e2b1so943226d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 01:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787731864; cv=none;
        d=google.com; s=arc-20260327;
        b=e8a7VEeoEMdBPI4HKqSRcD6+8t+0GMrHJt2XLcWumF666aZ7LhFdSeFkKVjxMuSMiT
         feQ1X/sb7HJrF56RNCwIwte/NAEbCrNw0zkosU/sQnbBNWxzO8ldR/fVw7Qn6ZleXnhd
         REH3JGYlXwVYdPAN3c36u431c+x6zC2sUKvV6/vyaBeWheeoF/j46aM6Yq/KdJiKP2yp
         af0FvIFKvbXzr7794YJsYyrpd3+GofiekawhRDG0XpYc4xBvmoRp2HTH1n+MbKikQtLf
         sBp4Znoykrpxk4am4EH/8qpyHX5caASHWLpMF9dvRwCr5MPl+NVSSOAuVXZlsog4E01+
         dW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5yyh1VvWI+vaETl8iuGoTVN8P021SyOBwMiKg7S/KSA=;
        fh=jXsH4xXcIbWqAk4PMSARpIAR4z+UpkFFINpi0qDwRWw=;
        b=YEBwZ9upeTtsfU2eKTSVaTBuVIGz/NypAVD1D4WdTw0PhJbm4aZTVwwf/4OzKEHUls
         Voja1/RuGik86WdZJPeHTi1ZLDpmHV/MtUw65EXoXzJL1oDjPQxrGbIb35GxqgukOCYt
         ORBV2963tkRpCvWlWeFj7aCrhFtCf6zcM2/fRdUizzwfNI6qSQaWN02STA/wI/klNJTy
         XLvOCzP2/5XFjNdGImYR4wcget1LBZCegnKXzfzGOQ2m5jMJZQ82FtY8C426dK7D9KdU
         YQ9PIRLjMyFznmSSLhHJlEVMG3rTxsjcLhTF7/5jieJ5APWd+xjnPsX+jiIQFj1GDc23
         JdTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787731864; x=1788336664; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5yyh1VvWI+vaETl8iuGoTVN8P021SyOBwMiKg7S/KSA=;
        b=Lr+vgW92ye+oaEzoXzTK8hlpJBNdB1DBQSZTpTpbEMXzPkyUlCY9z0QWXr1rr1H+91
         pyp+5UmX0PHS1vNABd/h5efHbnjiUutDJUOdPLZn4Qi7nUotv59zYK7ZrY9BQqHm/5Bb
         pEL9gEFCvKHoRyCtn1KHWg2qVq/TUrty35g37F9MiWJaR1hEo0FnTMHcFIehu4kogCLD
         zisWIwVVUoZ/paXB+Zqa2WN4fJrYJTtI4NwR8amTFSYLdv+S3/6v2nFgd7/qOOhUwCR1
         Zi+B7r9f8nzmdEzQBUa80jYWEVVe6p65qFhRCUFKMKI9h2ubdMJml7gd6GG+zz3FxVf5
         Qr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731864; x=1788336664;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5yyh1VvWI+vaETl8iuGoTVN8P021SyOBwMiKg7S/KSA=;
        b=OQ9humsVgHcMAbg9Bqp/bWXYQL4+j/z+NsuXa2At/5KHmK6G3QswnPf3ax07b9xiqh
         OYmLnmJ+3O4Z7NdD4OshI6TEBuRnKSmLMkK00XJ9+Pqd0aPpyJxI9Nw0Xno3UmH2ujAF
         WL/nni/XVFJAzKiTnJwQA924luJUtoICXa4jt3iirNucRgvmnarKoX/R5WpYb3ZX7uLQ
         iU45CrnelPmO7GN68zb8yYZ2JLquGEdYdXFcmBgSHy5CjUpjnZf+SjrCmpcIfAVVmtsi
         J/faA2JO95aNTlXYpTal/DZlRRY3EWNFcN/XGTOogHOcn+3ZenJoPtfXr1sxMT1KbSct
         x4Kg==
X-Forwarded-Encrypted: i=1; AHgh+RoMNAyjTsnqASjWifs/at4uYzxO+U63ebeNJ6uHm9w0kPqkT76MYgnQCZMPEELaiN0B09nYbXs4sQ5GqqUK@vger.kernel.org
X-Gm-Message-State: AFuF++kc5e6nmnDv4/i934wQ+fs9aCszARIydRMaIFtTgNJY69oC5sDS
	dUdTplTL3AesJkfcHILYsmLzUJdcbCsBE/em/dnwraeYTUKObV5L/ebhWbjfF1PsjTGTxdpixhf
	CqpBIYDLM/+DaR8fZLnlxxNXG3BsQbvs=
X-Gm-Gg: AR+sD10Fn71J5cGZi1gvHugeKLrUDgF3yl1MCz+3SuOVvER+gSQHnC6Oil+MAqiN8Dh
	LEAOneNY7DJkVt6I+1pTaRBHWG6d1mbHjYRQC9neUyhkjEfPlJamYlMxYTsrsRV5mEJpuuiaGqY
	dc9wnzrNXsjrSTWks5HCfcfh5Qphs0CsODzF9YQH4ltTRmGInlcS8Lm8X/n862spDKaZ/080y+Y
	ceyoijK0rRPw58d6bKlj237qPU4hilJ1lThzlB6jrA7FBcP/qFQr5Cq6YmWmDFjYuX8THDzRNmm
	KbvDFZIowrL1v5E/xteCsT26IdVN7hu1o007CWBjJ/X3cb0=
X-Received: by 2002:a05:690e:214f:b0:66a:b15e:bb93 with SMTP id
 956f58d0204a3-66d25197bf4mr1276551d50.13.1787731863957; Wed, 26 Aug 2026
 01:11:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808131624.2854412-1-lgs201920130244@gmail.com>
 <e5964398-cc23-440c-8c69-01353b5a5ecc@oss.qualcomm.com> <d85c9ffc-d9a4-4f33-bd63-5cb7a505a840@kernel.org>
In-Reply-To: <d85c9ffc-d9a4-4f33-bd63-5cb7a505a840@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 26 Aug 2026 16:10:51 +0800
X-Gm-Features: AcwNN1X9rQBObyVrmy9DFrGufRcw2p9RUUYyy3KtMY7rqaV5_V0d3WC11PgO3Yo
Message-ID: <CANUHTR8sA2xbXsex1VQu2acL2kZyCHAK6xQk1EKA_Hxv4n12rQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: fix autosuspend cleanup during teardown
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Mon, 24 Aug 2026 at 14:17, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 18/08/2026 12:40, Konrad Dybcio wrote:
> > On 8/8/26 3:16 PM, Guangshuo Li wrote:
> >> adreno_gpu_init() calls pm_runtime_use_autosuspend(), but
> >> adreno_gpu_cleanup() does not call the matching
> >> pm_runtime_dont_use_autosuspend() during teardown.
> >>
> >> If the autosuspend delay is set to a negative value while autosuspend
> >> is enabled, the runtime PM core increments usage_count to prevent
> >> runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> >> during teardown, this reference is not dropped and usage_count remains
> >> unbalanced.
> >>
> >> The documentation for pm_runtime_use_autosuspend() also notes that it
> >> is important to undo it with pm_runtime_dont_use_autosuspend() at
> >> driver exit time, unless runtime PM was initially enabled with
> >> devm_pm_runtime_enable().
> >>
> >> Add the missing pm_runtime_dont_use_autosuspend() call to
> >> adreno_gpu_cleanup().
> >>
> >> This issue was found by manual code inspection.
> >>
> >> Fixes: eeb754746b14 ("drm/msm/gpu: use pm-runtime")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> >> ---
> >
> > I think we can use devm_pm_runtime_enable() instead, which will take
> > care of cleaning up both the autosuspend and runpm halves
> >
>
> Author here is unresponsive, he was told a few times to send corrections
> for his vast amount of unthreaded patches and there is zero reaction.
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
