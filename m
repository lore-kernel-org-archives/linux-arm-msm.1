Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793566500;
	b=uDHOZfmt7b1Y8Pe2ySMuDuFkWQytBE/41w5E77N2Lkj8if6Tawt3URyWtuwQoibM7SC0
	 gsJwM6t0Q57FtFs8xFdw2MgYrrlOzw7ipqfWL8BV6OCQl4YuGqVkm927sTIBzlfwTNdw2
	 HZn9T+0U6uUcDn+oDjDmauYNRtZlefxmkdJ6ww30l3iPoWA6VMc503x8WYbDfJC3EfIf6
	 EAdqTtmfJQ9p7XARXQ2zVA5ikmXLufH7JYdR8EzXSCcCKR+/RX2HrMyYiwqR5eMTEoald
	 UXuXSmofQLCYfAmRDzyQ7NujpDU3R0NrM8zV65xV6fFJ2nctFvf/drqOgifdCheq1RQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793566500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:from:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
	b=reQ0rPi5jOOYLsZmvaKsCeqiNus+QYtpkr0+kFuCRHF3T851ljqgkPav/aqXq8XMoZI7
	 z6GLxq5WAD3z4HowPK7pZceUfGcl/bFp1iKMWUjMQ59uoLIPkw5bKj3CAEusT5j1CFZAi
	 EPQIICi6cFwQsIlC8xLeQFJ9K0cLKR2cLgFnvGSxulG/QocRSBs63TNUez5bidC5V90cW
	 oWovQNqQQcHrb7ozzDu4ETnshlWrYJvAY0832jQ593RO3jDpRI/c9pld4y7dMUf7+J8Lh
	 FPm2n4qCipfHt9atFlcSyToP+r9zMygmtcbb8gyKhFu8PH1/1TGFAjpDsQFu6vD7NDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OxB94iZp;
	arc=fail smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48048606A327
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 20:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48048606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OxB94iZp
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so3818101a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 12:55:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793566499; cv=none;
        d=google.com; s=arc-20260327;
        b=RVl62x5igl92NPvcohIq6NyFegGAKJa0+u77YTwDeJPUFQYBz5sdNW/vY4bhV1VhAG
         YICP/lN3bTF6+bwy7fLGQbnXVV4dU6KH+KF2oQGIIBlmD9GbcXrgh8Uq7WL/30+t5uAl
         2QQQrRqql3TBw09B0Pl/Qb1CX6y7t+c1ZIdHZlUPFRuQSiHE0alFYOS7HBFAOihrDaB7
         Didc111RDSsScKL7VtIVqv4TTN4luEM0LI2JPsIj5XYJ6BdJwCLslImVkE8wcPVhcZGw
         LNGIo+248kHqNueJ1qcXxV3ZC+nRkp1qKXt7EP7UpfKfwQqBv6+VhQzcQmfFBTIZ4rzZ
         Xkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        fh=rGu0dD9jqVu7Jzc7kUzEsv7rpFvW+SzG5/HcUxG/g1k=;
        b=ouV179ZmpxBeHGz1d5fDddqRiYYr7ls+cA1PeGzCXuZ2RU/tnxTB92HaWfVrrMonSQ
         UUH84Sh2ciZvfae1LEIAF+ZCBPRpJBWyDexZEqPCZDlV/qerGK6sWYTuWDsGe06xHelk
         0RjmoQ6iYH5bweaMbTl4DynZRrm1vhAcoLYidy8hgMH+b1D6mcjJ3eYDgq9wDGZOLjcB
         lHwYg0rsQzw9j9BRfsJUEnu2unA5pcgDRK9RVpW+vg79fPmOXQqTprC2feNfutQlTyvN
         Fezv5YqerhNZ6qW2XLTFlAZcv5mraBfirl8Q0yPgPA8q1spNAzJsGeZy43ys27+zJw9X
         VvGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793566499; x=1794171299; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        b=OxB94iZp8kdfd8GGKl7b92g3lomCornpCWOX5vG+FCefMPIoOtL/O2J/UfZYK5YxrF
         Ivv6cnQUQcyQUIfr8TQDTGMme9b8bQMpK5Q4EOvhLX6eZsOHWv2ctm3ukB5MBhYYPoY5
         4u3OOXQt4eXFHxmaIMUeQ0mJTZaMyYE/c/7qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793566499; x=1794171299;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kCPgkP3tJIKUq6HjUk2cnhLusIqDW1cMIwFuwNzeHhU=;
        b=hy7xG9LHF7FOP6Eq8I7RI7WxnsJF7SFMhKiiA4LNbZ1TVfsJsHsnplTDHLr2u9Xt7k
         VJ3y9jpDMMKtwmycGme0tA2S1L8Bj6vhx0vOPJkdBNTXL027Zin2R/mazKgzjgBRFNpw
         246uIjE+/mRG4WxKAK0yhaLZyfLagQfA+UnatbgxrHVScGulAVBcMDzCs79cuuBG8y4x
         XD7WavJmB5RJzb6rjmq0ZVZa5FAmohvHNvHeK5Nw/bXCqnMm+NH6hf7kB0VmLQGJYYmW
         HFuTCthWHx9AWPXeaQJqLhScAiXWCXXljqMBLUTqCcuFq6+AHjMMsUdhbSN+M57txMJb
         ZqXA==
X-Forwarded-Encrypted: i=1; AKwUvByKo4sP7BZPFRX6cOaTpe4FomBqNiqnqyu0z5DSjduGovp+ld6SANx0IllOcUjFftAZmRoHLjFceu5hmekh@vger.kernel.org
X-Gm-Message-State: APuU4Z/7eYAChpby6ysJM/TYh2+CyMyn7ojckT9Q6QhOXfm+YGCZuLb0
	9VuDw9csb9cuJS26siznITGwSeNVz9ibH2Q2r2NfXA+VbBP57WZbwCjXb/+/AtYw4a8tMWwlYKR
	7UZooWC685W5EnMLm7xSLsHAuH2PlIDiHSS2CLpz8
X-Gm-Gg: AYBFou0ShypPmzh7NoqSPYolcFUE2IB4VoKq2DlOQD3hz/kX9iamJ3rei0nn3nLZ/QX
	uCymIDz1K3TNHlZ681oK3HFj0/Qr4qqki3AYa3dkDMS2FM1u/lr7N+LaRafnUTIDxUUKiddb1hr
	56r3ZEBAWNy8Ttr221m6V+DKUhqbmvBCEC20Ia/gMwjBV3hrfp/u6qrwtN6pntOohzQwLILx4Rs
	n9Z3DDnuhVy/qb1b+ITAD/7Sr5s2hmXV87peXvpySpvGd2JYaq3RAg8Jz3waTSFCxx09SL9LVw1
	cEX8mEzeoZYLIlNzFg3B2STlhO2fUZ7JgCrRv387R4tG+OEK2lzMyvRbl/RjjkU8Q2K1xFOQZz6
	2mEsGyxxJR1wBG0IbGfTfrpmepOozkDtnC30azan5U60CmXpddOThPfeofzEf0tzv94/EfqU=
X-Received: by 2002:aa7:c1cc:0:b0:6b1:bb19:deb3 with SMTP id
 4fb4d7f45d1cf-6b4d4d6f96amr4159175a12.25.1793566498639; Sun, 01 Nov 2026
 12:54:58 -0800 (PST)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 12:54:57 -0800
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 1 Nov 2026 12:54:24 -0800
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
from: Simon Glass <sjg@chromium.org>
In-Reply-To: <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
References: <20261020153652.2907186-1-dianders@chromium.org>
 <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
 <CAFLszTh6vmFGVD4_Reewe9p4QqQjN=CVJ3SgfQKosAhedJpAQA@mail.gmail.com> <CAD=FV=V7neyofHdv-LdAtFaEhAcWEHHNRYAKrr5f2EHXWmKAuA@mail.gmail.com>
Date: Sun, 1 Nov 2026 12:54:57 -0800
X-Gm-Features: AclHuK_IoQTHoKBTaMx-KZNiIPIi7_TIlou2gkeHseuy-klQIv193ZXwZZvOcw4
Message-ID: <CAFLszTiVvuaMUsRHjhRTFxFf8Q2hbN1a1K-G=QFv4DyXNpWY6w@mail.gmail.com>
Subject: Re: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support
 using fdtfactor
To: Doug Anderson <dianders@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Marco Elver <elver@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

Doug Anderson <dianders@chromium.org> wrote:
> I think that was in the the "after the cut" part, where I said:
>
> You can see the fdtfactor post at:
>  http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org

OK, that covers where the tool comes from, and the question goes away
once fdtfactor is imported. Text below the cut doesn't reach the git
log, though, so a sentence or two in the commit message on why this is
wanted would still help.

> The goal was to make sure that we could fully reconstruct
> __local_fixups__ after applying the overlay to the base. v2 of the
> fdtfactor series handled this more properly, and I'm planning to see
> this through and land it unless there are major objections.
>
> By default here, I'm running fdtfactor with "-S" to strip the
> __local_fixups__ out with the assumption that today people don't
> really need them. However, someone could easily override that locally.
>
> I'm a little unclear how things would silently produce a bad overlay, though.

Sorry, I should have been clearer. This is about overlays which kbuild
applies at build time, not runtime ones like Beaglebone capes. An
entry such as:

    lemans-evk-camera-dtbs := lemans-evk.dtb lemans-evk-camera.dtbo

is merged by fdtoverlay into a plain lemans-evk-camera.dtb, which the
make_fit.py path then puts in the FIT like any other DTB. There are
several hundred of these on arm64.

My concern is the input to fdtfactor, not its output. In the in-tree
libfdt, fdt_overlay_apply() uses the .dtbo's __local_fixups__ and
__fixups__ to resolve its phandles, then overlay_merge() copies only
the __overlay__ contents into the base. Only __symbols__ is merged, so
the __local_fixups__ in lemans-evk-camera.dtb cover just the
lemans-evk.dtb part. Cells from the .dtso such as:

    avdd-supply = <&vreg_cam1_1p8>;
    remote-endpoint = <&imx577_ep1>;

end up as plain numbers, with nothing marking them as phandles. If
fdtfactor needs to renumber them, or puts those nodes in a per-board
overlay, it cannot tell they are phandles, so the overlay applies
cleanly but the links are wrong. Stripping the fixups from the output
with -S doesn't change that, since the information is already gone
from the input.

Does v2 make fdt_overlay_apply() keep the overlay's __local_fixups__?
If so, composite DTBs would be fine once that is synced into
scripts/dtc, and my concern goes away. If not, one option is for
FIT_FACTOR_DTBS to imply FIT_DECOMPOSE_DTBS, so that make_fit.py puts
the original .dtb and .dtbo files in the FIT separately and the .dtbo
keeps its own fixups. Leaving composite DTBs out would be a simpler
fallback. What do you think?

Regards,
Simon
