Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792748484;
	b=n1twiWNBpTqA2PlasjSyMxKzSjX5XD5pPzIyf+7c8Z01BrHXGLB0hocKCTljD6hnK8o0
	 hfFxndxaYPV+E4tyVdlZUbpTvN6i6iYif+56ylMuTn0vy2cKItf5UkmYQ5uzTX6f22emb
	 5W4hg9TICQAAfdj4VlANsripPrlIm5V9lqxhYFmwxntq1QdjrAPJ/CGek/jjxUSGMiKHl
	 mkvuRsaoAoxid41BsfO1dL2XikV3Tw0uhf+9DgkCm7724Y+4DAhMAC5FG7PC/mjrmmmEz
	 KuuI++OXzZgBpL7CW+xZKvZdNJmton8+n7c1eG0+yLG8Q2cYjoz/30YSMnfMhR4TPNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Okgw5IuIeyoGQZ+JzmeJO9+dqCKtCII160B3B426Y1k=;
	b=ub7OB5XghLoPlbM/WpRp+ghR8C9p19KDjUlNkOosA1KGcaZtIIcl4md3zX4kJN7fPf9c
	 fgnfKJKXLGGHBA2v+VHASO+6D1xovuLM2IAQCd/ZAuHwuIBuV7EkjkC/qg1KhgJrAwRGX
	 1Scd/bMfGmKPZ+SIIdoVnvsx3qiHDKHe5qH1QBZfDx15m1dje5u8mLaV8ET543r2fSRBM
	 ed0GkO7ecjDUit09KRneEgDcm9stHDslVg4mjJtHuK+DrjEQ+eXvuxyKz/Bde6WTjrsky
	 Pv3PTxiwGgEvkIVv0bv97SZDOJvHK+T6fyrFoJYsCPLXDBXSgc/kFUgEeae1Oec0bJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=NbnFC6ic;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7602E606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 09:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7602E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=NbnFC6ic
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so405395a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792748484; cv=none;
        d=google.com; s=arc-20260327;
        b=CR+bKB0cLdCU9Oeoi+bdMOoLTcASWC+/TOpSKKv3aS1zHbX//6FaywE3ff35jDyjVn
         SQqi6tZMWqrj8Vwcy6M+M+aRTjFtbH/PPEEqez7ASdDx1/PV0+28MPr8XEye8wzKarPd
         VwntgkB0AWIu/DG6HQSJ1pxmKpCEEvQud2X2Qhe2imUNtJtg/vzfQLKaoRBVrxKc6sen
         QJHMiTcpCAl8cOPizqPGM+mYQ3WxsiPPbMfCq1jaRucRXquhbbdxuyAo4+Du1SJ2l5NH
         /LMunNMyQrZ9hDYugAfwu2kFgQAvwfyOJKYCzRh9QMgEzMEvNQTrs/xLWluaNdyu62fY
         9hyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Okgw5IuIeyoGQZ+JzmeJO9+dqCKtCII160B3B426Y1k=;
        fh=qnfhF9iGsFa7Q3PJpz9hl3bDLmLYknL9ZBlwoq0Hn7g=;
        b=c8VjJNSjDDSJGA4XVJtDPnckqgSu+MwvSYu8p/VMlRYXjR68zWd8wzOlZZrepMZpQ3
         qx2/VS6I0iGM0qXj9mNEJf/uN0RrbOFUSeUsJ9A55jaH3b2uarey+hXPfJF8wwiPz2zJ
         qWKEHNbRViNvse38NjEMzfJ4zsnPQb80SNnhF7RzNlJC19VRiTgHsL1sOpTGRJILxF7f
         Vaj0gSuYZCv3uDK7YL03hbwWpUHp/yQKTt3H5Nlz9B0ynsm2QlywDR1Uux2AkIvejBsn
         3InAOMB80uZrjxfvlJwKWQkvyzenfiZ/Esyjel2SzP1qQYhsdVyfW369nRDCJewuGGZI
         2DWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1792748484; x=1793353284; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Okgw5IuIeyoGQZ+JzmeJO9+dqCKtCII160B3B426Y1k=;
        b=NbnFC6ic7YCzTwBcbpR7q/m6kM1BIsWqz6AVmGqI2UzTJ+lilYdayfl9Dyqyd8Jlj0
         LqKSdThWJ9k/Pfw78uVKyxE95Uu5wC3zbvaeyEzFc7D8m0MkQQZtVA/zy57hGDoqcUsd
         AuNJkeR+JiGxFYp+RWwkId8zDBR8pg16lKQEls9eA2U+PPWJLA0gTKAsCx/cP/bcYOqO
         pcltwsbn4oP5ffSMY4fEXa7KBDsVINYTbgAEqEfuUJLUO5gNu7xKSMgVi5RkiawqerjX
         yNSaca1p+va8vnMpfklHN7Hy3wTFru44ogGI5wpGLFj1j2e/tXOKbflXa1anevxV7Dkj
         FoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792748484; x=1793353284;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Okgw5IuIeyoGQZ+JzmeJO9+dqCKtCII160B3B426Y1k=;
        b=glIGTIi7LiPF5gr383lsCFcqhPn/PzsCOO3AFZ4yOVi0E2l7D9aXV8n92sq221Ng6z
         SR/7Y5DKMmZ2xCJGTHyXjsR7jbAXdPppsW47eJ2QkSZaPAnI+aU7VqzTZdVr2mgwNpLh
         jeApptUEh7H2VQuTQo5JIX24xtRRuiz26T0GJyQ9Dee8wl+CNSe3r0i+ck2VZKznavwW
         R9ysIqOeeitywIR9GGVPOajkjxulho4or/mLKV2GALR1sf2f2wZ+JRN4EyiaV+OP8tBc
         2SR17pWOSopLXnBDDu7F3gRJlGy/1Uf6GhoKzHvQ79NfOCywBZy3iKWbWGgFcuch/Tb1
         Lw1g==
X-Forwarded-Encrypted: i=1; AKwUvBy+HcHr3tl93jPyZRh3jWlfj04x3R9Rq4zKcWORYyW+POv2C0dlnC4cj0TptODbWNswLICl3C/6Qr24rlzY@vger.kernel.org
X-Gm-Message-State: AFq9FYJHEASvZ4T7lxT5n+yiw3E2FJvXOB68n8A8QuoHYr2TAszKs0cL
	j+piNTJP0rK/zbFy8A91+uUL0uHddpqOeAOvEsFiLsbSXBBZWtry+4EKxQhwtmSXEy+PtYZyBil
	51PJ5RRA8WSmFN26QiYzT/C0kYI3TdBHyIj30UHsgew==
X-Gm-Gg: AYBFou0uqbDEFP/qeyvfr04lrK5DFCrV3WfiutLxhT2lBG7CtHrOm4YgBJF6HWmhlC3
	7EaZuDhKGkw6+qTvlFpSbPCGxTXGwj7hI7tH7cngiwGZlcrkcRx7DD93OAXYI6e2InUf3VyoQVR
	vfwmmd78Mtl3r+TEty7FacScEqGDFHwL1b52+MElT1QMyP0mGXv89f2nJYOq+TkdLg0qkv7NOS3
	sp7xHGb0CTqBKYce+bUur3tPmVy0/aO80TVuT25wHi8PNASBQUDs1sRglBnsSOtnmZzaKIjpBLx
	tL8TAJ+XZNF0AEgKaJl8gsVERHdIT2vOpt/WtVSUFaYntHamO+Sj3Z6YOtOw0zTT865DACxc4Ly
	iW7FbOOTGfuUm8X2QMDbKTqih9TPKkFlwlk0A3PZfbJ46Dhuoe0dQgai06rXYOytamkHmfSlMOH
	1tgTdtS6ppO34wBXxp
X-Received: by 2002:a17:90b:3805:b0:3a8:59d3:530f with SMTP id
 98e67ed59e1d1-3adce0df541mr1412012a91.57.1792748483778; Fri, 23 Oct 2026
 02:41:23 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020065430.1251541-1-julius@bairaktaris.de>
 <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr> <9699033c-a9e1-4b11-a55f-b1aa216c700f@oss.qualcomm.com>
In-Reply-To: <9699033c-a9e1-4b11-a55f-b1aa216c700f@oss.qualcomm.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 23 Oct 2026 11:41:12 +0200
X-Gm-Features: AclHuK_z7zkTrXcOEBJ5YdNRtSSjaBF7iP_4-bXy54P0B5j7vSDrFZjtf2Rlh6M
Message-ID: <CA+HBbNELhPAAZoUuXm3SrvgxiU0eMaiu5LB3wfup04_HuZ+yxg@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias
 PLL parents
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Julius Bairaktaris <julius@bairaktaris.de>, Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Vladyslav Andreichykov <vladdrako007@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 10:06=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/20/26 1:39 PM, Robert Marko wrote:
> >
> > On 20/10/2026 08:54, Julius Bairaktaris wrote:
> >> From: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >>
> >> bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
> >> which takes its AHB and SYS clocks from GCC, so the device tree does n=
ot
> >> pass them back to GCC. With only .fw_name these parents never resolve,
> >> nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails with
> >> -EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 Hz.
> >>
> >> Add .name fallbacks so they resolve to the clocks the CMN PLL register=
s,
> >> as gcc-ipq8074 already does.
> >>
> >> Tested-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >> Assisted-by: Claude:claude-opus-5-5
> >> Signed-off-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
> >> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> >> ---
> >
> > Hi,
> >
> > This issue does not exist upstream, as CMN PLL is not yet wired due to =
missing
> > networking, even then the solution is not to add global name matching.
> >
> > The required clock inputs should just be passed to GCC directly which I=
 have
> > just pushed to OpenWrt.
>
> Just read your reply after writing mine, I'm looking forward to seeing
> that patch!

Hi Konrad,
You mean the wiring for CMN PLL or?

Regards,
Robert

>
> Konrad



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
