Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829818;
	b=t1INRVA4o7GBsC3UANcJ5yOBIxcGgVJJHXKwJJpQ4FsuITN/ZK7FmcBbcGe8VYNE/Qh8
	 qFYXIKjAqzFwb4v4dEi1Zg/zLv9lY1QmSUwVpHNfCl7XM6ygXWq4XVQfzCQLo4PHyhfip
	 l1DvH377uO5SMpomStghG4FF1V/zKX5BtaUks082M2JKNPM/avqWyrLbZUtcj7QKUKIJQ
	 PZZ0TkGmfb/NpbE/o1XwXux03kniORjqz+GI8nBfWDA6177uvngVJ0tr3jsMRKBcNF42i
	 nzdF81dwfDjV6EfYHJreW6/XuRwfbV2M2qrbzWiNtFQGoC+ARJXILv8YmWhn4CyRQ2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
	b=DOHjdYLcYnxCuxbl4FWuvTDZ7ASFHw0wQ21FRRSethCautkVN2f6OnXMP8OrEgnXQJk4
	 tTD11h0PvWALPNDqCZf2n7XIMPBk8kXel4GCsKSswdI3X9GGn9j1i4DPADzQUR2ePGO4m
	 Vs0G0yoNMfYQ59S2Il0E8Y+GdvCPYSx6/0OQa+9RRUGEwJ3PHP1IPl8F2ItREIIg7yYjY
	 K7k3FRR2YjNmVmxIlR7Ovr/vwDOmY/YYqjdTV+ew+UgtMbhmFXB4X7ENZJ254/6Tm+JvM
	 IGFoYC3vx3QqS79HX/N7VP1y1XttjR50Abt6vvXEr9M2C+RuzSV1UMbepmNG0SkYf6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J7SknmwT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E77B606A31E
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 08:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E77B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J7SknmwT
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c43fbcb4393so223430066b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 01:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829816; cv=none;
        d=google.com; s=arc-20260327;
        b=c3t2hit8MirwLVW64UF14J9kCjhRdk4JcttY21uxVic1wpDYD1FZVv3+mhKGW7XfPk
         th8vBzF4vKMwklOqbOuOS4NsDeK8+xR8gdJRUrSDwYr/EctM6tYXxZpFH7oZPsnn9grp
         X89d3blxVS5s1tSXRM3slrOoWybu2UNJUD1GvhVYLC8B74u00rA4LIAwHT1sjypsY9wp
         +YFeVd9puhB5evo6FYE8hRucVNGjZCJauvvlTasKCvmIKn+NTiIXVsj9HYmZP+8Qkb6Z
         0Qbg0OEMLpVMKW0cqtzDLuW3iipaKEFaTgOxWACAXQSL16B5/bNSLZpCJ8ZBgzZFKYC8
         KYVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        fh=gM2/klg6Pa6DdCrxnKrQpRwFCZrc1ajHz+bSfBlKMNo=;
        b=T340LwQ5GW43qq+cEnEjYs6bEyNiLlB+kpn/Ia52ozGa3SHLbgeblouoQsh4aHf+fy
         EDl8+VVZ8Jiz/8PMrXXD+6EnUxoo3uo2XGr52xGYTnzyKHkFu87f+3mBp2TDU6TcAjYh
         S0hwI3BzghNtxwOIjPnr3m5c9t2fk2pDsf1AEMAN2xZyQizwXZ2BXvE78e/3StsSzxws
         fR2CuGFzADhYv/Jy6MCRDWWmyB3J/59KfhEIIRnuzXvqgpIMRrJXcCA2hAaGCE063gYx
         dZEinedKA5W0jyIanVVaYCnSaxahSCQNUtHW56SXLKqZf/n7V1QPGiG18Tsdc8IQd87e
         EVTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829816; x=1793434616; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        b=J7SknmwTTzL7ECy7vAoxuDafrONez3XeCWql0X/0YXhgvAQE2BfBECDlTFWueGZ8Jh
         klrfah4NQphtxV5+spcx32j1zY8Lj6vh+cJFzrPDn1Ptw8VqQ53UpyioqrJd6EaGMvWO
         eSd9MJuHBLn7s+f0x+KjG9NHtf+4lfLEvhiOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829816; x=1793434616;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        b=2pfghXwFtIWzs7K0GaaUetNQaLkqW6CCiNy97m7HyMugO8tYx/ipzqGcH+Tn96dh5m
         w0VF1H4c2DonbpafNVI1UDkR9l1MATTN42+wAB+GwBUtZUYN47UUKlN6JgBjpaovneRn
         4RNTpwYWVa2Ot7aGlCZSLQC6ygdUPlTzjbmHu1ixdExM9oOvMAv4AfdpBRKqC+v1UM2X
         TpNIpRZ111vr93m2iob3i/q49XdJLfZqRAWYbr7vb0Z6ngOYebOTEAtQnMA2dYp9TS12
         rV5heuL9Brl1fk7bhosmpmrs4BatvPegTVS/hxscByNEpF5CTocPKhHkJCpYKJQ9W9k+
         8/bg==
X-Forwarded-Encrypted: i=1; AKwUvBy51KBsaTwViXzCmXbSWQAWkbCezU4r/dUY8vrZ9fGQ9RcJys/0+zGzyhZC8DyulDn6inNJ6aBYwLKgf5EH@vger.kernel.org
X-Gm-Message-State: AFq9FYIgGcLHu6EUPgLoDuQH4nu4m8Vdc/RsL7W3kKzqCjBZ1ISU+EUl
	t0UsjNh+eglJ1SOkqrYVw8wAO1ypYxo3P1Jdd31MyMjKZ6vKbEDUaUjZsswCMyvhCxk/Bt9M45E
	sOPGyQi3j49H6yxQ/Z2JACdZebPfB9C4jn6bmkQ9I
X-Gm-Gg: AYBFou3WFKGDCyO4dQlpoG6R3MI27AGzG7jq7/RXpJJ4B2auMiGzqw1YP1Cj8ZH8Gpv
	1rHmNb6fKYjqVQT6MFpSxLK4wu9Q23459ejrBAm/vrO441cYHioytZ8nL3X9x8EBqqjQk60i7Yj
	UArjevrstBE8EF567NPMTLFCyheWLxG+IoWahpZcE1Kqlpps0xTb5b1v6SswsfkX1zE06U1JShf
	kdXJga7n8QAlQ8rFzHpNArZDLKk1p+gFboeiyA7hvnyiwaklxWWzm2btF1+fbB3xENICuJc0qXH
	VxEv+0aZkkIZ85ktYZat/XS8E1cDLwY/+NOEe4gMBlSiCS10tn7sf1/khr04Xho20RE9ABLoii6
	BzFpqjK5e/YpS32DNigpuEdjYzVdysb5y5jg=
X-Received: by 2002:a17:906:9f84:b0:c44:494:692b with SMTP id
 a640c23a62f3a-c46bde198e0mr151110066b.22.1792829815874; Sat, 24 Oct 2026
 01:16:55 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:54 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:49 -0700
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:16:54 -0700
X-Gm-Features: AclHuK_VJyuusU7nyQWEvJVdBRj5rBge31M7RaY0GTXZjSe04p7xrEJjqvNNRK4
Message-ID: <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
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
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug!

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:

> 1. It uses a checked-in .its script to associate metadata with each
>    board's devicetree. Other tools can parse this metadata in order to
>    craft a package that the Pixel bootloader can understand.

One thing I'd like to check before this goes further. In lga.its the
metadata is a string packed into the configuration description
(board_id=...,board_rev=...,soc_id=...,soc_rev=...). The FIT spec
treats 'description' as human-readable text, so this turns a
free-form, undocumented string into an ABI that bootloaders and
packaging tools must parse. I'd much prefer proper properties in the
configuration node, defined in the FIT spec [1], so that every tool
can rely on the same names and types. I'm happy to help get that into
the spec. What do you think?

> How does this series help us?

The FIT_ITS path is a second way to build image.fit alongside
make_fit.py, and much of it repeats what make_fit.py already does: it
puts the root compatible from each DTB into the configuration and
compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
/incbin/ paths and a shell loop in Makefile.lib to do the same for a
hand-written .its file, and the .its files repeat the DTB lists from
the Makefiles. Have you thought about extending make_fit.py to take
the per-board metadata (e.g. from a small file next to the DTs, or via
FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
logic, and trogdor would come almost for free.

The new FIT_ITS, FIT_FACTOR_DTBS and FDTFACTOR_ARGS variables aren't
documented anywhere, including the image.fit entry in the arm64 'make
help' output. Please can you add something, perhaps alongside wherever
FIT_DECOMPOSE_DTBS ends up being described.

[1] https://github.com/open-source-firmware/flat-image-tree

Regards,
Simon
