Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666633B71B5
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787731422; cv=pass; b=eKBSinIt/vamIi9oPW0uhv8t/wUjORBniLPzcHI5C0JAIx/JshlBdGYZw40fa5c6lNte6qMU9tD/UPdm3XFbf5Ld/CSZxuTDNIeoxKXyLyIw9ZRsnBJ4DkxrtMxY1zfrxdLtxasCXVUeuyr3o+Asc6AMFOC1e3A88aw1+NmLcjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787731422; c=relaxed/simple;
	bh=TGWXhg3kIFRbogyDdU2TFv0HSJZmOgnoG5WYlfdiuIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUnvIRUdKmpV521NhZ8qxLeI1Didr8+wm9y7noFrt3sbDBKBDrArEu67hUqV7IlXp2S+csAErgua2kNM23nazsac3sGkG7SnU+vXrLzuPQ4m52NEXJ+3fNuZAhyjgoreTNLXheHieSES9SOlk+XnMq6WlAoE3bqm1Wzl42IRwE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qhKm+q3G; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qhKm+q3G"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66ceaade3f1so603824d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 01:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787731418; cv=none;
        d=google.com; s=arc-20260327;
        b=rzeR037C2AfFS/j0HspD5gklF3gm0eT81UGaxhjdkNpZgJqgvhnMtnqIikk4W59zcW
         0Ivbrw2aCbNR3YbaD2+VwNAhlMcRjb8nM+TJPAa+XQcBUMZIkjcxbXz6kl/BXv5jWc8R
         PptTRH8WOKuOCZ1qFuR6pgIs+HcCI96lmHTUVOJKSmIXyvR33NtenPyOmdn8RLUDm+4z
         43mQu8SHptjKoyBBtk4qa5aALrMtgrWqrQx5KWvPyKuMIuEbTjtEt/hzQI3falp70lxD
         Pj4CKcZAOSn5kUHsQccfGtIY2qZ6MY94dRm2/fpuOuv4YW6lPe/udfpwAx8LhhwxpGsX
         anwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TGWXhg3kIFRbogyDdU2TFv0HSJZmOgnoG5WYlfdiuIY=;
        fh=x1HGgpERK6qHNWiw2zq4VuPYD46HDzBRyiYacOjuGrI=;
        b=Yw1RMHVHRz0yPvswB8UQzlFjFsD6XohAvvAwgS9OxWhKWmLHbqIfUZdyWJnP75Gm3Z
         2KIIitp64bBWkzOk1+R6cmwAOX4UR/30QdpOXEPym1s3alEgvxMLivYqcqVw6O/jLLeF
         JqjNRKtpzreL7Z6ViaI42gm6BUPSWWIlZDYYv/8NJp/IYimSi9IaPqvg8TcKHLUzsGYI
         L656EySoj2XKSF6JxC9Y0AAA2VZBAoTQ8f8c7lB6On7kNZGsV3Thdq5jbkby2MgdrakK
         Kf99E6OIpzaw370tlXdEdkeFDEM/eNCbqpNEAgMX27dekyOIlS8EYJjyNItW/1UquEtH
         K9WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787731418; x=1788336218; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGWXhg3kIFRbogyDdU2TFv0HSJZmOgnoG5WYlfdiuIY=;
        b=qhKm+q3Gihr2fe9cUKB15n1/234rKzy0OXluD3uGVnPpz05VPixI5TYD4jYKC4qc4C
         kNFPqtSXVqExND+j6EDgkhYVuKClczeJLkxfN3gEilvxss66lwWfM2cRdijfFO6AR+W3
         LuNKQsUExbzj/PeAqciqGXLuWqDZ4Fe1ztZ/6xDYZDlP8ny9eeGH+KgpOhMh/O2RZewS
         tjeEHTX5+nn0gw/PfSaC8S2OG3Vn4bYFKJ/Q7HAq/n98M0BR0bVgJn+yuIpBHHSdoESI
         twquvNRoYCz/m1IFRe3U+O+UTu9JnUYBnLI6zOvNjZWPoz74FtkxCp23bPGzpTv+RoYV
         OiWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731418; x=1788336218;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TGWXhg3kIFRbogyDdU2TFv0HSJZmOgnoG5WYlfdiuIY=;
        b=RAayPIKQJqlVPyWSty1psB16pxKGlx8W9/TPbq0ekYUoeiuWTTRcvXQtFqwGteS1g2
         /jMbZKHH0sh+/DsQOZLo1J9HLb2qEjGGtF05n+sWUxd1DCBdAs0wS2/sIsaywMF9FgEx
         lETtqnNHlGrubqqQ0RgVs5w5fa850dsKZ68V2uUrvCMvpcgHXTuKT8GTIcSuy79WSlXd
         9hS1OK0RaTpRUwYo9Y/iDlODce07bGXSGZE5ZOMOVILrydCYcdD6Iv6bWpCBeGQLU9dF
         9bWe0sseLVv97IW6zhgGiZ09OWwYR5PBQCD3vaOLDJsIEcvruThow9fag2XH/hlraFCH
         fnRg==
X-Forwarded-Encrypted: i=1; AHgh+RrXZuEX0h3idNlquFixWK7bG2HEjvMc7ayTR/OVzgGJXwNSPvzdKiOPGNWiCIkEyfaTs4yqp/XKzExJ4wzv@vger.kernel.org
X-Gm-Message-State: AFuF++mg46HcdSlLD9O4JxH9izuZLeZRmjSNthmxUO5bXgwR12h1mcjb
	QTGPzkmbbv8P96r0Rvz+tUYBP6UJDT3O8SSDf+loSxbpv0B94g3mYSC/uy+lyIxJ5ixkCNlH/nJ
	Fci/GIhoe8cAslp05oCJV7VTkD3ayYtc=
X-Gm-Gg: AR+sD11t/VrOTg37rcDkq9o9GXftmjFmDx2OCTBNPM1ylYY8cbUdULIn2eHFoEBlysZ
	G/fQ8QXThts7t35wO6h7rjX+csANP2sgGpPsjm41Y37K8MB3Y9LlGO7YsR/IR4z00h9xueR6yy3
	FSn/gM9YI72b2eZqOhwNbiau/OCBrx48sZ7FK38ZrjyK3etNEEbLk1GK6dFNuJxLLtUhVi6uGUi
	1MMhG5B+iect8bubiBGxkTFbwFUvCXM8blsWe/Zndn31oouu15PiseTlMOwNw3ERWEpQm4Uo2+j
	S4TUI6qheMMSro/7gcDTHYKgJgxkaYqYXFjkaxSygr1Ka3g=
X-Received: by 2002:a05:690e:1516:b0:66c:e3b9:f696 with SMTP id
 956f58d0204a3-66d257ea066mr1655899d50.48.1787731418010; Wed, 26 Aug 2026
 01:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808112551.2786782-1-lgs201920130244@gmail.com> <578653c4-a7c7-498b-a283-f3b17f3d4191@kernel.org>
In-Reply-To: <578653c4-a7c7-498b-a283-f3b17f3d4191@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 26 Aug 2026 16:03:25 +0800
X-Gm-Features: AcwNN1XeMS8Nn9F7_AMg2pV323zlKWTVjDvTMsgkH5LpvJ4tmdamIR4FLSMBfwI
Message-ID: <CANUHTR-xZpWYjsCAXCe+uRyJS5zuafsxpm7fNO09xRo-LK7jMQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: qcom: hidma: fix autosuspend cleanup during teardown
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 20 Aug 2026 at 22:03, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 08/08/2026 13:25, Guangshuo Li wrote:
> > hidma_probe() calls pm_runtime_use_autosuspend(), but neither the probe
> > failure path nor hidma_remove() calls the matching
> > pm_runtime_dont_use_autosuspend() before disabling runtime PM.
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during teardown, this reference is not dropped and usage_count remains
> > unbalanced.
> >
> > Add the missing pm_runtime_dont_use_autosuspend() calls to both the
> > probe failure and remove paths before disabling runtime PM.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 67a2003e0607 ("dmaengine: add Qualcomm Technologies HIDMA channel driver")
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
