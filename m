Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01AB430CD8
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 18:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781332; cv=pass; b=Rz8BpHIC9mAUibc4BRTxN8nzzEWaTmUIKlgjgPl/ARmYUd1zN/jrFWPnnOxD2ZxX8iLHBt2gulYybJBPATv+1yBuntloygpK6AIiuiWpuyacfk9V5NtQF7/Rwj0hhMSUATcvXpXHwnMEb/WkzXgO8np0+r5sNzGSvQLkiktHK7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781332; c=relaxed/simple;
	bh=x9ZImVd/rO7BV0YppEaOdAU/wiWFe96AuvDqT6HskHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9tH5CBTaE9BI2AEb1Ujpwd4ju0c0ThCqfQYVDcMNmfruwjAXLP+AkCepFgvQ16tZZHkD17vrfMPoC3cMqoFvk3xj8xNiJxAPqjMmO/vvACYtTUKd74IDdcmyqmPlN4mzK9c2OzwF9dDeW303XPNjmN2hFMVDNWcAF2veRJY1ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVaeOD19; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVaeOD19"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c1f7666a90bso568589666b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 11:22:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785781329; cv=none;
        d=google.com; s=arc-20260327;
        b=aNw3j7CcpBcWUdJBY0usGbpTWFCFU7fkfxu5pbvJMegYZI+bk/ZboitCdaKdtok2KO
         NNMY5uEnqX3lmwQZOAIYvVu6yR9NFt85RCSjpFmOgaMlFTRngQm6rgEazRxX/alYGGCw
         Ldiy1ctUTKoaB8rfRODxA28rWKFYh8oP1I9D+EF3J2vpa4h2ugaKeI7DEwdEt483Ra9I
         p+Qtq2nSk1fBnwMG9orA8gmYzGM8uxo3u44nvnGNo+b7dCxnYZbRMgKD4mW/8W2yjp7L
         Q6MqWxGy8eTCpns0bObTtsULX405l3epUyEgziahZhjBav9imcjKp0W1S+8RkRNQUUhG
         NGxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x9ZImVd/rO7BV0YppEaOdAU/wiWFe96AuvDqT6HskHA=;
        fh=Fu+OqkThwwWrcJni0KwCbjyc+8RumaY35PSML3kfyQs=;
        b=MQLy0f+ZAhiDQOsRMtaZZ2iaTtgTMxsCDf5A+LG7/XcXRj95Re1FhBXgfoPD+ANSaw
         xZ57kgqDXaDMWGrZKjxsOYa7xUBTd3aJzubWt3MB2ovDHywSMhKVjpPxDcdU4K+ErxAX
         kLKzx/jY2YzMJWukJAJDEJMEzbSeEFqYCh2RolJysQcJfnzKOggqpHl0zhXu/9aMAZMr
         FKnrlattcracWxinxrbTsd5pjtsBYCjwh/WBIas5Q2tVx/MADEJ1M9X5kkg2mJafy71z
         4jF0shHYkoYAq4fAUSdJzUk6YY+XlR1BakNL4KL6eEjXGVoaERr5G4LagIgaEd1fwxAE
         KtYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785781329; x=1786386129; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9ZImVd/rO7BV0YppEaOdAU/wiWFe96AuvDqT6HskHA=;
        b=eVaeOD19QBELBd8Wp4625FzXPvWYFEHjLpC7r54TcAm9I6Q/Z5cMKC8BzkfWYDqIXg
         FAKTcB+J/D97BeQlCF7jywKHd8mxE3bhq2KmYve6NU1+0RIh4k+tS9Oow4govN15Apw+
         9j8wTDjcjn4dXjr4Z99HlaW+RuuZDyXhw4CbrJdNB9BdE+OoW9FMZpp0hj+X7XoxiO7h
         8qITwcyNB1DhZbhKS+lqFKDOjsln+4FbD27gr0WXEIsoAcRTfF8eD8hlT0YR+Bow+++Y
         Gh4XBIr4Oy+V2XwxaZzuVkJnwm4Pf/YfwtbWlKGggUz4L9TGx5LWHy17ydVyC071l88J
         rL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785781329; x=1786386129;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x9ZImVd/rO7BV0YppEaOdAU/wiWFe96AuvDqT6HskHA=;
        b=SlTVBUAasWq5NJQT1DQ1jh/WuEZBSshy0R7VGlLMoHVVBxGzdKUvwienRwgniU4pHC
         eZfSqTBqTUSn65HuV9RqanMJUmICiEIZ8f/5+NYaRfpUDfnYWKK1wekTHwSZye7zQqqK
         64jhXGBiXdscsjdGoKDx/LBFVVOynZp3aeFwkFKvhOXv+7R7HrgZmzIYNTKm8hGt8sD2
         +U5CwcuXx4j7D5AToNw4gauNLZ7dEbuNMlTx7d3aIm3Q+Zcq6riLBJbEyRkNDIlKnFhJ
         WPe9VhiWeWtnC0xM7cnjXHvWcNWHXz1QFNfGlOI7OinmTVoMqOS5X8cMpeBzIGtwkPO8
         /3fA==
X-Forwarded-Encrypted: i=1; AHgh+Ro51vSfDSsRyAn60vYhhWMyv3q34SX3yfSVudfiPvv8IJvQf4EYwfM4tdhMKfoiekbR4uLvKDJdqyctochY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa1x0CRrabG+gVstdOUfan8PCHSY+cgofD3ELcmapawwXNGTvi
	8MdJRr2PBSgKCq+QradyikpBTR6RzD+Orgx2/7g4oUU6OLCO4hauOENDjN82fHMi+bLZIyhNAAY
	Bz4634LhZv9ipvkN9PL0L02gR5ao5vqzWuFcNU1A46w==
X-Gm-Gg: AR+sD12G057/o9GAG2Xj2Rm0+RXbuqNX+iiZ09rkrW5vmQBmyhzkcT8wz3yHnC9IZ2Z
	gQsUAwcyONirN4OuTfOmQL392Ze8ew5MaI7xKzF3hcfTdyDh0ifHfwRRYi96r52hMO+W+1LCQtx
	PNdX2RyqkuH9yRK/FNYjjhjLdyRlpK7dKemMjWMGGYjp3KaK+8b55OdxqbCCCTZAnITpHuMzrmG
	8sLfB3Vg1IxoFrflI4ti6ryC+QHNc5uMLxS5kDbFxHayoCpWofLBcqcZv70LUOsh4hqnIBFkGce
	C88rMJSBnpTmvL6M736F1lQTiDejRo4S8TTeMAjAeEGQX4xlAXI+E12HuRX5g2ZDvhkSeNz2Qh5
	AMvu5GSSiF2QbALjTQXHeW+j3
X-Received: by 2002:a17:906:345a:b0:c15:df42:952c with SMTP id
 a640c23a62f3a-c1fe814f9d3mr623164666b.28.1785781329045; Mon, 03 Aug 2026
 11:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707175212.412699-1-dbgh9129@gmail.com> <20260707180553.78C7F1F000E9@smtp.kernel.org>
 <ka3af5qc63pdcvh3uf6ulb25wrsf6udjugm62ooxuscxvz6zhz@mbuivewege2k>
In-Reply-To: <ka3af5qc63pdcvh3uf6ulb25wrsf6udjugm62ooxuscxvz6zhz@mbuivewege2k>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Mon, 3 Aug 2026 14:21:58 -0400
X-Gm-Features: AUfX_mxg5JGAIlsbnyi6v5lSwC5pBz1uJRyo3H-rzUgbkZm2NvpqldQcxoYUhKc
Message-ID: <CACrCO_UUX_A+Z7uCsT9=JkXqqkG0Tp=n0rXO3j+KAzNxGRuVQQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/msm/dp: Disable stream clock after video-ready timeout
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Kees Cook <kees@kernel.org>, Dale Whinham <daleyo@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jul 2026 at 10:05, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Jul 07, 2026 at 06:05:53PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] Disabling the pixel clock while the DP controller is actively in the SEND_VIDEO state violates the teardown sequence and can lock up the hardware.
> > --
>
> Could you please comment on this Sashiko comment?

Thanks, agreed. The posted patch disables the pixel clock before
reverting the controller from SEND_VIDEO, and the bridge disable path
may later issue PUSH_IDLE with the clock disabled. I will send the
revised patch addressing the comment.
I appreciate your time for the review.

Thanks,
Yuho
