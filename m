Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829819;
	b=H0zbocS3kam4Kg+Dsv13GmYLA5CSOCWePwfGih1BsvUSh8RbRmT+1O/I8MascVY12Zjx
	 Nmg6epFF27UMQ1Ul4aZWd3pWazQ0Qw8LxMWxdgiH74XUbq+kUFH4hKu6h40n26eouj9hr
	 3WIgYFXzmvzt2jfWkXeKxsanWITZLuc4VjD3AIh7wjvfEctrjbzFbB1idZjL/Xh5f8aBm
	 YSSTIpb5i+4mv5UAz6jjKIpYcxTU7gEv4Qjs3rXq2aKTAvWaQBXFvYC06jaExhlBOk9Ta
	 QFWMFv0V+LEO2dzUqMmik3d2FZaPFpAvDopbZ0lEIZftVRJeZOOfYxyObxG92QNBTog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
	b=IKpTYDHL+gi3L3ZWd64JdZNBqqbetO6K9k1VT8I3UxEcvFR/SNOF98s6lELV5HNWEMiU
	 KeV2l7FBbcHpxNOMxEUdms69pV8tHfBHyXLqD0MItUPyCtnS4kRJu2qZNGj26gbA5CGH0
	 yilhtb5HIyWmWaFgZXSqiRzNOmGGP7xKKzYGk4yGUuFuJqanao2Nuqp93x/+r1I/0+0+G
	 ok4nefQtFonAGoaueqg0nC3wnFlvkArFulMST8dluAXc9UIbRL+Vmo2ZuqzGnA3cMmUdt
	 m/Q2BAjW8Ok2OcKdNLm1nljmcRXdSl2nelBSh6xVSWpLxx0wU1ifrMoreFJGDxkjqaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="j9m/eYvc";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960BB606A328
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 08:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 960BB606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=j9m/eYvc
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so2414258a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 01:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829817; cv=none;
        d=google.com; s=arc-20260327;
        b=U77S+SGW9kDY5/0hlCfxMCEe2OPSXwWgGor4gk7T+ScowfJoDgE73zMAuHKifz8Yex
         Vmf+gTzEphdeG5i4fXQ6c5KbxOCPkMs+RP9pULiZTMQSFl4jj/mz9Ge2QFQd7dXd4N3l
         rOQBZQg+S9PA+ZTarFOSer023LYcuwghWSgaM5VBipzHEUX2fShjNfyp9yB4mLUUuKwy
         cm09ojsFSYfRlYxFXbbm7BLflkd2sVl/C/JND63Ex9LYBnJIgxzdIMzQ9vg6sa5lH/LG
         OTwwyVOuGZ7X013khPA5EGGub0fyNGZvwKPDi7eVWATzDxQ84O/WzfGeIamqbbA8r60V
         q9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        fh=wwyj6OsohwULLyt6zr9CkQfoUAVpv/ZQ/2d+9thB9do=;
        b=dqK1b8lAsaeA93yTnLjxjgJtJGmSxHevfYi8qhgIqC7KnvorsS+961PVhy8vEvWg3u
         X7V83u/jb2UD9xyx0otyNzFca4lD9+f6okWTMuxFtf1n46H63lX+mYiZwbTGXUqwXODz
         TKwTUUaPvnSNw6VxeKpBGpNrc7OI4VqZN8Ra5lWJclDkHDDzgRK0wcpWo+/VHkJnkogX
         1ppPL/hl3tyyWuBTHPJ+QiPCZE6jyz9t0AnUtViECozDiOyk+WBp5xa0qtHw/aGgSEgr
         e5dAn8hzvds9gC6fzeTF2KXLJDCpKThCHAe8LQpU+bd30MUfCnFSz4VVbUDxUpQryFzI
         zRew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829817; x=1793434617; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        b=j9m/eYvcshaqWdxR1RRPRIr1ItYrA1TN4RRH0Tb/73JTmjyGNBA+MSabq/chQ3jRup
         FDO+bPo7UmRdMpdeNPL45rZL+MvdTWsOwUsOK1L3CWBxyBfvgHY1GMnC7+rnUD+uEALq
         OMq+yCYuInNRftXgM4Yo1DFyaRmVERqAUmQ+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829817; x=1793434617;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uUDc+hglJMdcXxhvbv9wrZ+R2kkDMXVbGgG/7tMuxuo=;
        b=vdivFzBbGBIyvLZBZZUzRzAVkO2K867sqlLUA+5vengDTviPyek1oGUex/zw8yBkR5
         RQcq39pMaUXc1JoT5ToItW+zG6SgZt9Dg5Bwu8mdXGP+H2ec8uCG8WnSXGc685aQGADL
         pjB81KCv+r2p0VMHIDkiujF+y8zwH2ai751+3fa0QnQxAi3+D6vEHzP1UOBt4GoYIKnG
         RhfwfHf0MD0rM9YZCNbi2jhBNHDPPD9qVphwsPXS9gyR5CQ9yebSuE1gi/577a4dbkYT
         qCtz7Ec9m0BozQOAGn8dTdZ0prixoyQqSYu06ELs1qpNtEaRNROjzSyFwf4cY4IIXwLc
         Focw==
X-Forwarded-Encrypted: i=1; AKwUvBwhBZwZRxdGQ/xcHtbzYlylPP/ccZKlw1CICNGwMx/KfWwX9Q0md8h8w7g6dVcc8kRzdsr20yXmrMYJlB58@vger.kernel.org
X-Gm-Message-State: AFq9FYKxst4R6/N/8jVldpvwuIQhbgg1zWf0+lA6aBkEP/pWINqwLpPP
	KK5ALuc1iagz1fyiUiCsv5uH5gLOzoXU4kXTmLOMfjskJAfmys/q2BxdLQA1ebgqeDwIF46+p05
	wROt5UppKKwWDIO7deHrySNk+SgKtAJ+lYEtOIYGw
X-Gm-Gg: AYBFou3fpvPuMvqM7pPoBy8XmNu5AblbZ8UQCR+eAsQT1m529xpms6Rxtai9kr2fcy8
	YvzCyfiAQ3Hv1L5kDtuCDMXCjDTZSxEht7WlnROjITYVGTiDKvFAuVR5vgKHOCfKTbNY59r9i91
	Yd6YCtgl57afCHUK7N5qSLTIJx2CE/piQJ0LG4JxcJC7mt5cOeMWrHKi2rcpSzkXoMZQPJDQiMl
	n2xt8bQKGaZoDbqPvsKKNs+HubcRvNWbTFBiuhlaVQ5sRF0kZJaLQKesu8mYY5rDvHf0c05AKty
	KcsSlN+SZE8maYt99jnkdmMCVIPXWzI8RO1tCT4bLs7oXpX/UTepMMhnUA4dEWcOUjOYHtBP5OO
	QCCvzoVkTNWhvN97C/xQJ+Ij0SeE9f4wUT8A=
X-Received: by 2002:aa7:c9d4:0:b0:6b1:c355:c7c0 with SMTP id
 4fb4d7f45d1cf-6b442fde26emr1152906a12.26.1792829816963; Sat, 24 Oct 2026
 01:16:56 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:55 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:28 -0700
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.1.I7ef2211f59d5912146a6816d533638605edd0f36@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:16:55 -0700
X-Gm-Features: AclHuK-X20URHOUw51jVSQxB-TyQaLgWVXdt5sH3O8YNafmV3nonazmm4bHkTWI
Message-ID: <CAFLszTjoZ=TZqW8BTFTot0ZRcv_--BYZgdOCUD-rv6nT479--Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/7] scripts/dtc: Add fdtget.c and fdtput.c to sync script
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> scripts/dtc: Add fdtget.c and fdtput.c to sync script
>
> fdtget.c and fdtput.c were imported into scripts/dtc/ in commit
> cd296721a964 ("dtc: import latest upstream dtc") prior to the creation
> of update-dtc-source.sh, and were never added to the sync script.
>
> Add FDTGET_SOURCE and FDTPUT_SOURCE to update-dtc-source.sh so they are
> kept in sync with the rest of scripts/dtc/.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/dtc/update-dtc-source.sh | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
