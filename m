Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F1C4ABBA9
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718737; cv=none; b=Xhxlqud/lkk0mb5SDgqBbHxqpqY1BiqeDXqxz0pB7JgMCjdG/lDF0/ENUfwRaaNvtgzs5iaaLAvPoUz4O9k52wHz08FhDUzjB6tbbGW/ggWL3+ndaFJVD9v2meU56BMyFeWXkAyhpMpkRV1ibExRzz5BcFfzOTstsdN21jxFNlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718737; c=relaxed/simple;
	bh=zeUe3eo1GoklWPIUxo4YT9pFQt1O8xr63Nmkn6q3zaI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oHlSa4wJY8yYIK6BA43u/g5+rqNlWwxiPXtELts2rUGLBUu6BZYS/IyLkzsCS/5krXIucjCv0Wz4eLxbjlchZg42eNJlX0zLc79XKUMxKLr1yDu02AvHPWUhj/vwksLrcsfANqWxw/bSpSTmGyengtF4w86j0GaGt95in7v2maA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQ3NFU71; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQ3NFU71"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B201F000FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 08:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789718736;
	bh=zeUe3eo1GoklWPIUxo4YT9pFQt1O8xr63Nmkn6q3zaI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=BQ3NFU71WtENk2VI6kLA/LLw0x3qsl0yq6kxittj1BhmvPwNQABm/iQm0tbg0TeIE
	 CnNFgkaegPSinweOkXrAw87PKW1LTrX9Z06dk/bWD6/Z4Gz1UnFSipO7wjsn865I09
	 tYq0S+sQcCI8rl6ciM8fgluslHPsimy7eXCqZN8x2FFfu5IiDx5HXi407dzSi6wXYn
	 gP/ke4gsQ9E6iAyQ84OFUxrhjYcwCD9L29JxoNpk8nKCJf02V7arNNl3OXxp/9vM65
	 CjyTwbJrlMW6529NyQwh17zYM/wDrtaQfkLCfTy9ekOhLkucJeeaGTaWx+bGuVZGou
	 gqVNj+wE3u3nQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so420700e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 01:05:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByshHETv4mpwqm/b7/rPDZTHwr5d0TWgHGo5bkb23aSegMpMbZXJmgUOdvCeratFC+zTIhq9iPW6UEXF5bB@vger.kernel.org
X-Gm-Message-State: AFuF++lj/fkPS/qyomNLcxTiWrNctwSIubdXLvRMZS9VINRYshA2T70e
	MfeMeggO/ZYfiN8Zvv7aw8B/o4RKm2dfygz20B9iqw+34f0GID/Qrex0lOlQTbPfmMmMUQC3GBc
	od1/KDuRePHobImuDDJ7PnMfSQK6JzgPVLO+SNPcr2g==
X-Received: by 2002:a05:6512:2348:b0:5b0:113d:8ae5 with SMTP id
 2adb3069b0e04-5b8c181f532mr469072e87.10.1789718731959; Fri, 18 Sep 2026
 01:05:31 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Sep 2026 03:05:30 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Sep 2026 03:05:30 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aqyPs5d72s80G6b8@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
 <20260915014447.282121-3-shengchao.guo@oss.qualcomm.com> <0d0ee38b-8ded-480d-a586-d26b3c292427@linaro.org>
 <aqyPs5d72s80G6b8@QCOM-aGQu4IUr3Y>
Date: Fri, 18 Sep 2026 03:05:30 -0500
X-Gmail-Original-Message-ID: <CAMRc=MeB75OeOLeO8nqLXQJMHcny-fN-0J7QGQaSbof++TqFmg@mail.gmail.com>
X-Gm-Features: AcwNN1VMwnU0XUPvXYqgB07GC6-_9-ydwdfjzqt_HuRis4BNTrvb-EaOoN0gg4Y
Message-ID: <CAMRc=MeB75OeOLeO8nqLXQJMHcny-fN-0J7QGQaSbof++TqFmg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: make direction changes exclusive
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Yu Zhang <yu.zhang@oss.qualcomm.com>, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Sep 2026 03:11:15 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
>>
>> Personally I would prefer patch 1 instead of this change.
>
> As I mentioned in the cover letter, both patches are fixing real bugs
> existing at different level. So I prefer to merge both. But it's a call
> up to Bartosz.
>

I'd take both but I'm not sure if the ASIS case for shared proxy can be
addressed without reading back the direction.

Bart
