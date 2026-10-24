Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829826;
	b=UHki3/Xk0Afx5a49/OFL/mALcsvg0kbJXLpySJrWO89cn4M58DHFUl/NdviG3D8TypOY
	 TT/1C9AxzwmcNTSsWeQoZ/941ZUQF/233hFtJBOH0K8DDf31ZZFSStp1+YywHdQYJgpZ1
	 MTn9UIEPv+nGdKgQghT48/pco0YGWJnYWwUrDLZKRjF2erAjaWk5wBVV2eQE7TltQZ7Zj
	 RzbYn9GMfOD/aLWIDIwjeiuFhwUUpluKJuIsYhUH1iifXCkhJ+/HTRv1ZQIAU4y9fr4vO
	 28RCv0iymPCQwOmQkoRbrHGF4wgajJtyWoMD2FdafABH4D3suCyhESLKhQV3Nk3PRuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
	b=ZTUCl31ZUlUNgSUhewUkCdAWzWOOIviMPkmVI2yQmjPsQb0nhz3jt2QvPU2xTUeUkQg4
	 viKs3jefLlKsQRSs7iFC65Fm5WcK6osVbe76W+I0Lg3UCsDaLVx8AVPWa6MJoCjvvc3Mf
	 2ShZB0QOrJOAwy20dHJqd7lj8dRJVNf69MrwvNRW0GpQsRPRSDnQjRVRqTishZ9vGzwfz
	 DSKt7KxJ1CoOAQ6NelEm0SSbd1Wkt2f4EqYZ0mGqDdZETulPxPE+GZwM8IozMY4RXSzTI
	 4EBavW9ytdYYBr/6LRrmHD779GbX/v1RW44x55+JpYpCvc5YJovnVe20/YvBUMqig8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+U+I4vJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5465D606A32D
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 08:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5465D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W+U+I4vJ
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso2118374a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 01:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829824; cv=none;
        d=google.com; s=arc-20260327;
        b=YVXDlglmoeGvh2q44BQY4642/NfKRf3IMJYIU5MeMnsKMD8y8PxVIKMrBztAynf90n
         7Wcu9U2Kfgm3BmylEc51YSUNjEbwvEhaME6uKjyxDer6JDyN4geD5PsAotpBARcAJG2x
         04dwEchzz7USCv9s5rF97TiYxE00BC6NsVjiYzIuRIRB7slL1x8UOu+LYrcLFW3zgX7o
         y77WIawrF0iwSZrWtZ5CukYLuoPwUfY/8nwydiALDYN+Px7rkWiVRRoiJ2kigCERd0Jy
         6WLfYQggS0CHCGmoU1JHwKG0Kw50BgCEDmoXTaNUIEypfpoTT2itaoEwMHVAMf5GrPKP
         K2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        fh=DW5hEGIgM9l5zHOoLFQYV6+evfyOzJ8RIecwblUOYI0=;
        b=NO8r2zzXGscvlglZNi3tYkm/HVmkRWEprc2BD4WSkRato1S5xlvg028ZaGa9Lk6lk8
         Tz3hYh28Okak7c7MhVGoyVhGvYe/FU+GYAYydzeyv9kOnMa2L4LAEUT/sb99GYmkuZo1
         kDzSILn+POo5jf8ifqhlXmd4EOZcTwae1YDphBhYgoTDU1BGHSAwsLJck1D9j92yHbYF
         VTjj2FuFeHJXnJQJmLQtn3VGn5gYgjSKlCO2LN4a/Zx2oz7PqYU1Pnmxi/v1Gynxhsdz
         zrqkjIx78MydsI0Pd8BnsRLj6ux2dUAhs7BnGKFYGuEwfI6RfCtTeQ7cK1/n8TWjY1/K
         /SfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829824; x=1793434624; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        b=W+U+I4vJebkEFb5QNBPTCYwC9ApUfixleuac2ENZaWXkwOuFj6DuA3cnaW3c8yPds0
         tHi/WvTYjGDVefxbMVw1K5IsCkrCxG4VepnxhsGx9ZqGiq0iU8X6iCkgER//dJugJW3r
         0D51CHQEWQQOefESyNTnu/XmmwlHjQ+dwEs2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829824; x=1793434624;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TLRJCFJ6/AvG5AtMUG4l8vJsoXlpkLFbV3r+kxPNexI=;
        b=z2Z/vI03ZWNhAzB7MEjtkIg8wG7O4dZubOb/VdAsSjcKMX8lZHtOxM+QoJjVPVjlwK
         zs/kddhlquOvdt+7Uzy64ofOhhcWPOwT+vyrpCYEraMuDShQ36ei6tm5jgag30nzVALd
         JhNRQN4mkf59aYcU0Z2hJdj24cikcoGXuNSJdkHDm4SmQf4jn96HgLkt48mcYbf6uDQ0
         Si53zDvddsRHjFkTMyVw2FwDwQS9LX7CyRB6icR2YkzveeICxbvbI9XrM0QuLzP2fV7j
         8AyFexIt1+MWttPFAVscwt+CpA55giR6y6mqWA6NzbfKs/xPVbDNkuQ5EREQyhbBDPHB
         T4kQ==
X-Forwarded-Encrypted: i=1; AKwUvBydIs2Edv0reciCnK4VYeakbe2S9raYGkI6+OQNMXr46DUtwp8he+8lUVs3INvyIvFp3HXR7xcuEF4V7P3k@vger.kernel.org
X-Gm-Message-State: AFq9FYJp1xC1+qVkQocjdQh6VpML8mUXxY9NBn0MyFlZAl5T4YEITKcu
	QDWPpYC1jYFycd+wyhJxnOpLnTtvWgPNCWjTkxaHCu/XU2XyENN1umL0/MmqyoMYmfPqKIK3v26
	5Pp6zGn6x3Q5KFjnDLFDTo2ypM5FNYo3ncHdPS67i
X-Gm-Gg: AYBFou3p9UjkAowe9JMWiNKYAaRZmxcqCchDQRczlQFcJ9N+ezgrCYb6tGtiYkfIRag
	tO4NTEOvQNui2uS5w4XR6KhiONzthzl5bjQ+kw0el9IyeEWmglHpx2WAdnUHuFRT3CZ3zJCbmUF
	79jEQjr+VQjY7UMGZ5u3PZ+qz/WBkqMVEJE90F9NLTCoWcZCM+tTHDN8FHEe2Clhi9fnJjRNtkq
	4ZSOgNfmHxpK02ixK4T+YlKxfNE6jLIASRRZ1tZD7xMScVCFk4xwfS2q2nMnlDtgaNL8FwesCGd
	Qy0vaSO374t9THe6Kb8HN8JH+nuI7dI2c3XAGwvzbgqIaAmyaL/3hOf+XTiBp6DyFV0Al7KdeHl
	sOm5swlcBUNqA0u7uZLr+6DyxtxEOxazRv4I=
X-Received: by 2002:a05:6402:1344:b0:6b1:d9fe:88e3 with SMTP id
 4fb4d7f45d1cf-6b442fe4a1dmr1113081a12.25.1792829823688; Sat, 24 Oct 2026
 01:17:03 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:02 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 00:46:32 -0700
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.3.I241638bd918efb045650102349d174cc3216468b@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:02 -0700
X-Gm-Features: AclHuK-hmUOppF09H1eQU74y6c4oDjFc2inDxQbdayDVgWED5bCCmINGnHLl7Qo
Message-ID: <CAFLszTjATXFecK3ryfO=yVY=C9yt9nc52acFZvxfdu5kqGNvZg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/7] scripts/dtc: Build fdtget and fdtput host tools
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
> scripts/dtc: Build fdtget and fdtput host tools
>
> Build `fdtget` and `fdtput` alongside `dtc` and `fdtoverlay` when
> `CONFIG_DTC` is enabled so Kbuild rules can query and update properties
> in compiled device tree / FIT blobs.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>  scripts/dtc/.gitignore | 2 ++
>  scripts/dtc/Makefile   | 6 ++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>
