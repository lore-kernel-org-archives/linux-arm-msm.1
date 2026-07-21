Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246B343784E
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620705; cv=none; b=O+ixKSt39i4uthxxNHyot+rajhLAJRr/VPbwwE+SqNPHvaTHDPCgghcZyA1R/t0EDNsU79I2mjjfk7Lg0LJRkZP8SL4hUouxVLBRLOS613HhRoR4ayknzgK1nsbcfIZfQvMRwtTL3rqtffVMEweN/U0ltODJ/m6gXntLHNIz3HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620705; c=relaxed/simple;
	bh=o7SzHZtWOVx3MD6EXbKzqdNM37BrOtw87B76MVUk8Yo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRqe102Ou0tzBeTXYw6LEJE4KXwmkVPBLscYrass2YUegVMswoCkOyOEno/NY0+FTOgH63lBS4pqurfl5hpzzu6bzVTFpIvTmonvAN02UxKOaCDlyrQg2oY+2v+FGutSU43OETvpKf3ZiAnWRf+ypOxCsGpyt6yycLN2iwrVf3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SIiGB10C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SIiGB10C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0741F00A3D
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784620703;
	bh=o7SzHZtWOVx3MD6EXbKzqdNM37BrOtw87B76MVUk8Yo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=SIiGB10CB4FQc5eLHQKkzapu5YgYIXQIsxdNqGbhKOuZK46ActjPIoZ1p4c1lNhCt
	 U1ss8kPpJ24OG+ynoRDVF1OUfZkzaSuOwlxpBREKCNjaf8NFFvAVLua/3TPUY45hRQ
	 1HTSNIrGk38pWdsSxxhRUrwxr7tw1cj9p6sSZkxrwzpqaVwFTLv3AlWSEUtoB/zO+y
	 aXWvOTc6TbSNFgPYMbxPZyg6/udYrHTWMSdLd8px3l94PWPM9Zgz07zsb8jh+csNyl
	 1/s5ysmCEbCfUhl57putcZavsxxQIuGCc5y4uFg6BkG545mNNhaC6P4AmLl3qhT6LY
	 Xn+qmFWLz3a6g==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aec201b582so11102885e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 00:58:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RraLmI1ygcMvUDbVzn5v86S0ntLKvg3mcWJ5EzAvoLvj70Iat2uIxp5wFS/AdgEpXAInP5cb2cfgW+XWfpO@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ5xbA9T4SfiOMQHOj+Ln71RJnz8T55mR2BYPNcV+LGRSJqmT+
	kjI7I9IfxSDImh5mmZYcy2m42ZlzwcgiAYZfFcMkU7yex+3F6oYIWQRwraAXt16+AIXnircW7fy
	0KKkP3LKTNVP/ByeERYWcOYXttPCQToG1luRbSYxaCg==
X-Received: by 2002:a05:6512:61b1:b0:5b2:a21a:10e7 with SMTP id
 2adb3069b0e04-5b2a21a12d5mr968914e87.25.1784620702646; Tue, 21 Jul 2026
 00:58:22 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 00:58:20 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 21 Jul 2026 00:58:20 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260720232716.118402-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720232716.118402-3-thorsten.blum@linux.dev>
Date: Tue, 21 Jul 2026 00:58:20 -0700
X-Gmail-Original-Message-ID: <CAMRc=MebextZeQxYuEs-MSPUkYT4pSumVLcdxnGk8yO1XSW+nQ@mail.gmail.com>
X-Gm-Features: AUfX_mxMs76i9Sf9Nh22ahtsh2b9O-7DLBfPk3nQAiIgoMIJmMKPK8X5oTaEOCA
Message-ID: <CAMRc=MebextZeQxYuEs-MSPUkYT4pSumVLcdxnGk8yO1XSW+nQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: qce - drop redundant variable in qce_skcipher_done
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Jul 2026 01:27:17 +0200, Thorsten Blum
<thorsten.blum@linux.dev> said:
> Remove the local ret variable and return the result directly.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
