Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5474A4858
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377686; cv=none; b=S6xUO3navFJ64wwqBNQ+JKiP6OCEsqjNR5dRDE9O7mJtPBXVx87pX0wVWCtNeh5oSJNkCpqqQq9WsfmPykEo9CWZ9lZ1rdd+HCtrII3DM/I7hwU3UcQE2LHhR7lc/Q3JOzDXI3aHt+Jl6GYiRiJNyhpsirlOuDdGIHK9sVZgiN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377686; c=relaxed/simple;
	bh=dXlEoLZn8xIfnNC7jxrPUVl7m9FtX0nbVYNpExtd+WE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r01EUr1A94kIchH1f1qUzXbizUdjyWcWBTpjjYnbVbMwbl2hxXGOPilE+7ULuMjrTDUcZlCsDYUl84iQtZqtZmwR5KJsBLTEx+BBP1b0ZHS0t8XyzujgAGCcje2704vYzKJyEt/iz5pf0kwS7qEIPVqxz4upnslSRYk4tWZWBSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VHnPLwpy; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VHnPLwpy"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bad794b197so1828930e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791377669; x=1791982469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R+rvRY3MxyDDJlHyGuP46Q73CKubNnzJd6vSmt+6L74=;
        b=VHnPLwpyK4+g0fPQEELGlQkHgobyUEjFVcnpMd6FUn2Ksr8IQ9SxnbxQa6NNLSiAjb
         v5S1p+gPoXfw5SsjfC6eCvJ5RORK97KdQcF35JtNlin48I7sCGUqfJn68VUoEaN1tGEv
         PTPL5WZaSYp85fo2kr8X+FAjG8nrN9UaeG+Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377669; x=1791982469;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+rvRY3MxyDDJlHyGuP46Q73CKubNnzJd6vSmt+6L74=;
        b=aKMpdKfCWxKrXZQEuK0FwiRtTGSUZTJMv6nJByJL38426OBDjmjSIC1YRRr8YO4Lwd
         VG5D5lZMjr4jluH75g9AI9wGPPHZtxZ7W0TD9n8LyHCSew8T5XBE7dF0JCZHtiqfv3u6
         vpT2bXUpH/mUYkvM8ZJPkeE1kHUPF/Uu0CWEzpJku/EJLEmy3snxYdPz7iA6O7GD9Wrj
         aShCz58NovWDCVT4x5s1sT+kasvmTotvAXblB2JqRg7kOKevPxJCjAjw+CIayL1mlhFx
         Hl+TNma1qQD+d4sywfLcS3U/zkif9MZRGivw7Jg89qPygd5XZEDpy0cNBTXaSH9j4wM2
         ktNA==
X-Forwarded-Encrypted: i=1; AKwUvBxJYE7aGmfLFfNwbdz1BQQpeZ9Ic2K1LHqTvaoAQPNFtsoOJqJyYM9EHYTzohagNqcHPz7WqQO0U+pF8JKc@vger.kernel.org
X-Gm-Message-State: AFq9FYI2Wp0lUqOhzzP5x6+ZKZ1zo9wZOGsamcS/yqhvrYx7D5e3z6Je
	KyA89pOTYWvnb82FnEhsVCwjWfdv16+XnTaNpS/aMV88qdiD89mYdG5ETUAZlfjJ5xSJzonAEUw
	nIm5rtw==
X-Gm-Gg: AYBFou1gF4TRnzmFz1cQ/nNgrKwiriPYEFq1F/063WkrvZCXtjzCB184edtoAokMyTh
	bTEo96jQIX5bvc75W6heHkCee8KvvdGAApK3eY0LnrDsj+zMbNSyY5ZaICydrh2rgyptoXCUp/2
	XO3xT11h+Vp0enQu0nOIkfdDFEt8ax75avteCxYQ95mDItC6LOTlEMMk908A7bu7BUw6ZjZ9p7X
	96k1bMynkB4CYhPD59DFl5ckqL42z7C60tL+2KyTd7o2dioRmcGUdh0clHetC/W7ye47+bosWWv
	kn9j0kO6A5crliWC+pn705hqe3TxTSZFZ1C0kXFHyJjodMjFfexf2FtfDY1aOnszL9ov7xZTIg1
	xnFIbcI1TY7RMuSZ9KAaJBhLaiWn/aDd5WPstz12zyneFTxBbYeocX9S4uQ/o4fxnoM9nbLwznT
	fFQnLqRe3wF3vGURwQnEnfpp4nONidONNaX9tI16WWGqsEFGDYkCHfu9rspv5Qh3mFSAhvewWsM
	S978CYuJader8T5EI5PWir3famXtyXYVsVXNw==
X-Received: by 2002:a05:6512:250e:b0:5b8:f960:1bd8 with SMTP id 2adb3069b0e04-5bcd0748b2amr740825e87.61.1791377668959;
        Wed, 07 Oct 2026 05:54:28 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd30833ddsm7431e87.44.2026.10.07.05.54.26
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:54:28 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bad794b197so1828857e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 05:54:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxQxd5gawGxktnJ6anas5X6ThbEEtHlUuxanThd0qv0VkJU8qrJ6IhveZoARqTT8AmTmwRA5Txnw+0Id3JN@vger.kernel.org
X-Received: by 2002:a05:6512:b83:b0:5bc:a9f9:b649 with SMTP id
 2adb3069b0e04-5bcd06e8b11mr798936e87.31.1791377665307; Wed, 07 Oct 2026
 05:54:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com> <20261006-mahua-surface-laptop-v1-4-406fc042162a@oss.qualcomm.com>
In-Reply-To: <20261006-mahua-surface-laptop-v1-4-406fc042162a@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Oct 2026 05:54:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vh-GRYtuGM+By9BfpO4X7skp9QOYeHRj7Rzc_tgQ0KEA@mail.gmail.com>
X-Gm-Features: AclHuK-ILqIUiSWOn4shaOpkE4nC07lDEACeQZtcv49rxdfgv5oCmNXTTOAhHtk
Message-ID: <CAD=FV=Vh-GRYtuGM+By9BfpO4X7skp9QOYeHRj7Rzc_tgQ0KEA@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/panel-edp: Add Sharp LQ138P1JX61 (Surface Laptop
 8th Ed.)
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 6, 2026 at 2:50=E2=80=AFAM Gopikrishna Garmidi
<gopikrishna.garmidi@oss.qualcomm.com> wrote:
>
> The internal eDP panel of the Microsoft Surface Laptop 13.8" 8th Edition
> is not in edp_panels[], so panel-edp falls back to conservative timings.
>
> EDID, read over the panel's DP AUX DDC bus:
>
>   00 ff ff ff ff ff ff 00 4d 10 72 15 a1 31 05 54
>   31 23 01 04 b5 1d 13 78 03 7d 77 ad 50 46 ad 26
>   0f 50 53 00 00 00 01 01 01 01 01 01 01 01 01 01
>   01 01 01 01 01 01 60 b6 00 a0 90 00 2b 60 30 20
>   3a 00 23 c2 10 00 00 18 60 b6 00 a0 90 00 56 66
>   30 20 3a 00 23 c2 10 00 00 18 00 00 00 fd 00 18
>   78 be be 2f 01 00 00 00 00 00 00 00 00 00 00 fc
>   00 4c 51 31 33 38 50 31 4a 58 36 31 0a 20 01 4e
>
>   02 03 0f 00 e3 05 80 00 e6 06 05 01 73 6a 0b 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 aa
>
>   Manufacturer: SHP
>   Model: 0x1572
>   Made in: week 49 of 2025
>   Display Product Name: 'LQ138P1JX61'
>   DTD 1: 2304x1536 120.000329 Hz 3:2 (291 mm x 194 mm)
>   DTD 2: 2304x1536  60.000164 Hz 3:2 (291 mm x 194 mm)
>
> No datasheet is available, so use delay_200_500_e200: it keeps the
> 200 ms enable delay of the conservative fallback, but uses the 500 ms
> unprepare delay of the real panels in the table. This matches the entry
> for the closely related Sharp LQ120P1JX51 (SHP 0x15a7).
>
> Assisted-by: LLM
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[4/5] drm/panel-edp: Add Sharp LQ138P1JX61 (Surface Laptop 8th Ed.)
      commit: 7cf88d0a3f5324eb44c2ae9840568adb2374ec10
