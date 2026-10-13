Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB9C54EEBF
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 20:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791924139; cv=none; b=R3EH/93ZVeG+ereXUC/RsFZE7z5MGdwZzmHVszcQIlPzWUM7vqMcMqCSYBYZ05XT6cOlspA8v/M+QhtAV7zh5SvcK8ogxTOI0t5/f9K83AinpYalmMOJ0j6PL0xZqZorJ+olsh1DWUzy57Lqo12Te2XK37ySMD9ho8Y3d3HCQ4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791924139; c=relaxed/simple;
	bh=vSdc/GgrjZjvW48jrW3QLCyEw09wBJTQiSl8ktErzpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kw4Mzkz9a6IVWs4unlTEe7TAYiJ2Km/qogQiZdM3XajJN7HHGKke7YiTphTHprODTd1j/iQu5NjlRPMpKGyrRiZur1VTCIeBftr0s2GDUH6e4qFHQkIeR5wxNBzS623ehHrfcotG6j/IJ+K4QEC1DIonfSVOaXX6noT3wwnpVQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NQrDGcHh; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NQrDGcHh"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e43f3d1fdso50118566b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 13:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791924136; x=1792528936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LW10asy9KSTOiiqztGh47B9kXPqdbR7tUZT+37TKLvs=;
        b=NQrDGcHhqaC7K6hXmRpTCX+7QL07K1zUibqYheWCRClhDdOtZtvzZ/GyqnKWuI8UYF
         lXgcz4LonXrxb7BY5j/3WfWRgwW25jfcZIzXZ8cHSYLcspW9LqO1WhqnPLdmU+JyvK5Z
         veXQM6lVlE1tYy4V4TaxKrSnvb7/1+dH4Vj9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791924136; x=1792528936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LW10asy9KSTOiiqztGh47B9kXPqdbR7tUZT+37TKLvs=;
        b=CU4QBdFgc3bfcz+hyAfrmF8+VXCb5+MI3+US2Zsh23o529Ect2euyOtn2/YjjtZmiT
         fvJZcKc8Yir5Nj5FMo3kucSJ11XTwK62TcHzt0JV1IOwD+UCrFj6wzyUt2lTE+6fx8QI
         IAvGPM80saC9oXCcc6EGyj5xWO0E05VVwAeixQN492MmaOAuTCj1PotOhzT8Sm0R1lXu
         HTuWzHC4gzLOn00k5bzS+4o6+QalZL+5DDx5WxBsiJKxx4pCWJRVjAt0K55sk2QkON9g
         6KlQweZrEgdESf26xbDqKh2G8Bqnif3YcVSZSSWsQtxcXtKkza7s6J3c49nTN7X82Bob
         CgRg==
X-Forwarded-Encrypted: i=1; AKwUvBykGMUuu5MyBNC1TWdW6jIjHQ5cUUR/vIESEoTlDf/+UbTT9yt+PVpnTkmEM37vhW5IyDclrHVAQOKR0jA8@vger.kernel.org
X-Gm-Message-State: AFq9FYK8hmPUFgh+ZLe9dlxp4p2/lsRQSBlnsonH5TNITEq2xXy3eXcv
	juYRipW6k/5uvl3lYHMpfr/84BLTZ664ce168A8DSi+kFCh59+ypUULOSwC6LzLtmj3j6Pp7+cX
	4U2TD27/r
X-Gm-Gg: AYBFou22NdP2Hnb0o9sLFhC8KB/DIk3z6sigs96Wid0ZVo3DCePraXFwsp6+E3ksG2W
	hvXF6HZR1CABCC0Wnb35kvDmes+gkBcibiYWu1ZSxDDHXU/EkE9fxspagjb8wp7LdBaYvUo0Zpi
	hsU6XnqRAOMXQeGJsbxBXxem4fmHu8vZMAPAgU3FwzmXI2Oghn+6GdeIhgaYWOjKxcCeZbSZdTE
	wbGE11Em73MjjMGd5j7lzlv+0AMUF0mp3NAxxuWi7Dr2Zjp2LD9OHF6eSQT4nZNtS+UuCcuLBfE
	SX8a1hifWOWj3tupy58UzSD90Zz9FJOpXTZySs9kWronTEYxPVbzhLXJy8UuqM/NPjOoLU1S/2i
	TqmKs2/CuPmyeCxTmY8fh6XmOrIxSUoAQIHHXCUA1jcXtfLiRBc2Hax34z+W26o1s/wz4enJzop
	VsTzfZI/aLAZpQOXfQrJIqaGzsKHZL7x1Ukota4+uIZobFe+cHYOQDCZNFPHxPiHY9RlYmsv4yP
	AyhMEI8bQiUarKigCpjNPck2IQrNuj6bNrEPhUE4JqXScNo
X-Received: by 2002:a17:907:2d88:b0:c2e:3acb:34df with SMTP id a640c23a62f3a-c31aa0ae788mr1247633166b.39.1791924136119;
        Tue, 13 Oct 2026 13:42:16 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c32cff67d2dsm477539866b.78.2026.10.13.13.42.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:42:15 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1aa29e06bso441947a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 13:42:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzUZwjLDBQqL6FHiqF8jV1TTDrN5p4Bfh7FBD7Z8QT9r9kXzp7n1D+ojl5SDB9RyMzCSKkmjDACXJOPI3Iq@vger.kernel.org
X-Received: by 2002:a5d:4b4c:0:b0:48b:f92:1f67 with SMTP id
 ffacd0b85a97d-48dbaae6d3cmr18389338f8f.21.1791923713788; Tue, 13 Oct 2026
 13:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com> <20261012-book2go-v1-1-7188e7ea7a15@fairphone.com>
In-Reply-To: <20261012-book2go-v1-1-7188e7ea7a15@fairphone.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Oct 2026 13:35:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WVAnohGm8kmaLpfchk_MxCiUB8EcyyWBxZqtnc+9YPcg@mail.gmail.com>
X-Gm-Features: AclHuK_Kdnq_Nm7orMZLL2zoW1RgGH3OpgePi2fH32LmSKFmFT8VrWVBo8fW_FI
Message-ID: <CAD=FV=WVAnohGm8kmaLpfchk_MxCiUB8EcyyWBxZqtnc+9YPcg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/panel-edp: Add AUO B140HAN04.0 panel entry
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, Jasper Korten <jja2000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 12, 2026 at 11:11=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.c=
om> wrote:
>
> From: Jasper Korten <jja2000@gmail.com>
>
> Add an entry for the B140HAN04.0 eDP panel. It is found on the Samsung
> Galaxy Book2 Go.
>
> $ edid-decode /sys/class/drm/card0-eDP-1/edid
>
> 00 ff ff ff ff ff ff 00 06 af a9 65 00 00 00 00
> 28 20 01 04 a5 1f 11 78 02 9b 85 92 56 59 90 29
> 20 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 14 37 80 b8 70 38 24 40 10 10
> 3e 00 35 ae 10 00 00 18 00 00 00 0f 00 00 00 00
> 00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
> 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 42 31 34 30 48 41 4e 30 34 2e 30 20 0a 00 ed
>
> Signed-off-by: Jasper Korten <jja2000@gmail.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 2b455369ed70..73cdc2d37ab7 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1986,6 +1986,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116X=
AN06.3"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140H=
AK02.7"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x643d, &delay_200_500_e50, "B140H=
AN06.4"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x65a9, &delay_200_500_e50, "B140H=
AN04.0"),

I'd assume you don't have a datasheet here and that the timings are a
bit of a guess. It's nice if you put that in the commit message, but I
won't block it. Ideally you could reply here and let me know if you
referred to a datasheet or just made a guess about the timings so if
the question ever comes up later we can find the conversation based on
the Link: tag...

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/3] drm/panel-edp: Add AUO B140HAN04.0 panel entry
      commit: 9125232bc2a5020710db1eadd21973757f740648
