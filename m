Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182139;
	b=f8IHL23pZXoK+NtyG/H380ssU14CmBx468InKfvxNd+JPZGJ/a3ySw/N98O0R98wJXiC
	 z+ju1j5TeBsvR4+NwytbA0xsqKMa9ffh4itROP6acbrUQuK38webvCp5RLlZvV0QqX9hB
	 1Bw8h+ihuijNHRQHHiauZiX82HbLMSOb01RC7bd7f71iOKYLSmw4cdq/USWsqaa4/vZEa
	 F8tFAUpSf8M/0K5EdQdRJPLjGWdZzCdayw7B7rIsMkY1OpUySQ7bKD4jK4E+BNwZxB/TP
	 js+42oQpPwhgbyFG6ym0L2ebxE12ub+N8a2LBeYzPoCUQW0gK0iOj3eBRthuRmoX5Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182139;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=Yte27HBiRkdFA3azARIYK+aMt5gtvslfN3WS8p7psZ8=;
	b=ksay5ZGEN+CTMlJCu4OmedDhTKBIAnnNTGH+x/xzJDNI5FDFUagE7A0giQwUpJlY/vFH
	 8FQbk0WGwwjWuAG/wD9dhTZOP2Iu4touYFDjLVzVbVdA+8nckoJBD/dRU/Q2z+ZcDxkXb
	 O5Vy5qMQ11/CB4nj4Q5D4zI4L37F9Pa6TnBkw0+LuRBKVtQNW7ZThejdr8kcv22E5NypU
	 5yriiMeOnTddREwA6huUK/mhz3DajFtbzSpkdoBdCE0jtOSZoVKsaV/eBKXE1B8jSvmAl
	 R9BjmVqd8onkjwaQPO0dv8fMD6vDTInVN/0MUrhPfD6bjXhTbqlGmLakGxz/8O1ThZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HRuYh8d2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4CC606A322
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HRuYh8d2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0CC1F031E3
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793182138;
	bh=Yte27HBiRkdFA3azARIYK+aMt5gtvslfN3WS8p7psZ8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=HRuYh8d2l2fAcPmnK5M+n/W6LWCtc+z9gb74LfJX9zkHupJo8qUeQt7Wr9h0//J9D
	 c2Ruv52j4vlvHNpBR3xl/vKbhl0hlZHZYxXCY+Y/yFfQ+eBr4DGakSHiNMK9f3fSfp
	 jCNlUbyyrMyrwKMif9rsfLGVjetaBm6m0CNAqsHxlRzC0VTf86DMYAoabno+JcZvrE
	 VOcy63tUKpVTcVOYQuIvc0JJeUBz5FbIcbBWkWKXvOKhk8Yo4DB0IoodkQDtlamAIS
	 l6eLYqb9CpUl7M5lG5CfYHKAKCKf42xHRjwUENEWSHm6pT6lwD+1WyFszR3kJdong3
	 IVD1QTROtiNvw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso2541849e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:08:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzcZaUoXP+q7Zrd/MxImMB5MhA2U0XxtNpgrCwrmeCsDVe+88iRCwp3dLrJQ2d6dm1CqQwp/kabZzUizE1Z@vger.kernel.org
X-Gm-Message-State: AFq9FYIkpjOLmoKXYS6smlzg9jD97mIyajEKL3MHf8O2LO4ztvZs5jLE
	CHng27+tA7S64y7ME5iOTBhsmP31UBlz0y+4Lrud6AOnMflPngrFh2fjBj4s0WSCrBis15ePth7
	7zUA6DuRADizZGfdznfcET3O2XKotaQ9zLcPb7eSwnA==
X-Received: by 2002:a05:651c:211d:b0:3a8:7caa:cd4e with SMTP id
 38308e7fff4ca-3ac909156f3mr13186001fa.13.1793182137147; Wed, 28 Oct 2026
 03:08:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 05:08:55 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 05:08:55 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261027193615.1930624-1-valorcool@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027193615.1930624-1-valorcool@gmail.com>
Date: Wed, 28 Oct 2026 05:08:55 -0500
X-Gmail-Original-Message-ID: <CAMRc=Meo38pdx-kwdp7MpLLj5tmpPp+rzyR6B7DwUxD9m-1M+Q@mail.gmail.com>
X-Gm-Features: AclHuK8_q3eA62VLomRClgOM6Tt0o79Lb9MGtsx33mboJBo8uklE3gqL7pIwBew
Message-ID: <CAMRc=Meo38pdx-kwdp7MpLLj5tmpPp+rzyR6B7DwUxD9m-1M+Q@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_qca: Fix WCN3950 missing regulator release
To: Stanislavs Nilovs <valorcool@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org, marcel@holtmann.org, 
	luiz.dentz@gmail.com, lumag@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2026 20:36:15 +0100, Stanislavs Nilovs
<valorcool@gmail.com> said:
> hci_qca driver is missing release of power regulators when module is
> powered off or serial device is removed. This issue is most noticeable
> during system shutdown, since the regulator core is firing a warning
> backtrace that regulator to be freed still has enable_count.
>
> The issue was found with the help of Claude Opus 5 (Anthropic), which
> was asked to review drivers/bluetooth/hci_qca.c for the appearing
> regulator warning backtrace during system shutdown. The fix itself was
> generated by the tool and reviewed by me by applying it, building the
> code and verifying issue is not reproduced anymore.
>
> Tested on real hardware, but not on Linux's master branch. Driver was
> backported to Linux 5.15 for internal testing and this is when the issue
> was noticed.
>
> Fixes: d5712c511cb3 ("Bluetooth: qca: add WCN3950 support")
> Signed-off-by: Stanislavs Nilovs <valorcool@gmail.com>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
