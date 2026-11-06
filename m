Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793950004;
	b=tyWwqCv0zaDw8dVFAahL55MDtZK+nh/qMqYkmJ3ayywVg8jxlNE18C4uKO6srsNDw9VR
	 jz3f98uxAY4nJ+CHHax3s8KVWmCxWkqh0TJrfg1AVpfEHLQDWiF8kNUSEdSlvQnpXHw7z
	 Aq3C6TjW6bRR23MT13j8Gq82bociZ27fRHmn2MtzAyg0mf3kLnUPLL9QJK+Jk+bggzJbT
	 lgkEnyMFv5qXLixlYkgIcgF9m3BVOB0PviyOZU03HJae45mKRamsV6R4z1JfSu+MdJuP8
	 OgsRyaqxBGP8d0fHiH5dL8+yc8TvXVjkfxKdFkPfLlI5snyhCc2SqXiucD8MtJ4dO6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=0wHhJk7JXw417GbDbzGrwP+0+sSnFJtzgONRZtas4S8=;
	b=SDhccf5v5GPndF34lFcgOxjAyi8auWTkUob6pA1kVKxmTycVPCvVoD9Gd99ek4SJkm9W
	 daibcFtKosWotrHT0g86PJ7jfpfFeOOp7P0xWgmd4g82s6nVyl7HZnSCayaV6WuTxqYOf
	 59qdngY+J2LwLjwcF3qka/vvfiZ1BNLnhKMEN7zcFMKvPBLGZu9cJCWUJYUOMzkcfculj
	 oTIkYQcJj25hthBES1+KBIum4aKncEOa64RJu4XfrPJpTxqprnMtu5pbs3Nz+xiYkLiLl
	 F7ds1GJr1ZcUrlExKDaaMUI/OcBiLWE75d+nq4zyn/mNZuFtta+EUytY1g0xjHDndyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i43l9L3s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00881606A328
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 07:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00881606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i43l9L3s
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso1619349e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 23:26:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793950002; cv=none;
        d=google.com; s=arc-20260327;
        b=gjLw6PD2N9G9Va39TeNNe+xqe9M7VZvdOtrNoPNebW62T4Zcpx7rsIw1MDBq4B47mH
         HxFk6Gn4fUWSszvyz08q7517NmFub/Wo476fjlQTFc7G4jsGxf5v3gd65MeWsGL6IUMk
         1Dk0KGnQoTBYijSpPv0cSlJP0n/RALiw7gyAzngsQoEbecFT3RAb7IDzk6jxOQFRGADl
         SK+sZ5vFEorMlXuzDNgzz+niaPQz2vf+qSjbjXutT0BWwtFRt0RIXLTi7AqOhSATdJca
         7Lu3WVplsVRqIQKELIPlWI5jEx5F3xussDmNiRh+zc9Zz/KSstfqTiiDov0IIrJhv5Eq
         ZR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0wHhJk7JXw417GbDbzGrwP+0+sSnFJtzgONRZtas4S8=;
        fh=JCwzJ7VUbnjmBYUsifAvFHaH5xNS/qyOZyT3rO2NSD0=;
        b=PSxfQs8yhYk3QtfKvrEM9vps16MLqhTQh3ps/ewZIew5RMoOg5Oj25kKwkefnKI+fv
         y4SGv+6fFkjWV9CNUquK+yRCyi6SL6yKqkGlJWovrb196VwPn2P8+ZTwxlGHCWkUjDYe
         BGaJ5YzewQy9MsJZx3/y6sAbBcuRsBvJONPLHVqf6HGS/ruudRkKpELnbGyzxJpD4nCO
         Xo9JgUkNymw9p62IxVzmpdNgKgrtIW+YfbnNEzLa3r2Age5OUkA9okKvf1PEPFFfLAm8
         SDQow1c+hZADy1kEHm2wMu7wjhw00ExGm7TPJVh8AsJ0GZJzXHMcHaHe17D258zFGNng
         AMrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793950002; x=1794554802; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0wHhJk7JXw417GbDbzGrwP+0+sSnFJtzgONRZtas4S8=;
        b=i43l9L3sQspG6oUeZ0ovsW/UEnjQMYiJ2YHwoeSoXECunHxmAqTKwDZyOFzu61cVIw
         UXEKybbQImGj3Omb+XVTxJMP/S51I1RCBuXisIz6Svvx3nV8SWQiYx9J494g1nC2NbwX
         BHQuka3pkMow+6xEQCba7PEajwoqbFs/06SNDPrnoUSdiMk9/jZ2ICRipSDTHmXKSBiT
         vE2ygQ0ViotXloj3UGLFNq6/Ya6kKT1jBjtwRHEmDDJHxnKLeNQYUPZqD7ywpQaQuNXW
         SfC07CzHEVjl/cnz89KyPbNOu78WoYi2+zeEgtqKzkAPTsJ+W/T/6M841vi78YJVEJHA
         PZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793950002; x=1794554802;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0wHhJk7JXw417GbDbzGrwP+0+sSnFJtzgONRZtas4S8=;
        b=FFYjhwKaLdENOCOKlKtIrJW2qFivCBNeSQ8Nu7pVfiPvf+UL1YBbe/CMOKTeAcPs9S
         XxrakIVPRQjrsNEapTCBFqzfaiu36zsUstcgaE/p3XCS1z4rWybMymIxNGgFKUtjddfE
         gXyxNjxjHg+NCK0mPCZaXJF6p30uN/LiY45MFRWXPYYTphSk4NqJYxrfWAdS1v7LYEJF
         WPe5h6QnngkOQKDURGtSA/VY3H5xm4nppY8gJk7sZlTnimEXNOF5VU8xtnRcgZ2VjczN
         s4LM7T6RhJZbKLuAfKvMM9dokeZV+jEeZjQw+tF15J3dLTU66DzgbMDO0hbNPFCCOquA
         qIGQ==
X-Gm-Message-State: APuU4Z8NyRUrH9fYr0lrAOrM3fRPD6LIzXrAXztzRk4qcTydHOSPZBsC
	IM/TUgX5OeKxWBKmn65kNw65mVxdmDo1yI4J3JblyfrDcoCzuThNuiv2sWRWoGqSl1/7lhmYldU
	NLsVuDYeE7lloRoCYLjp1WBlkPYjX0I5LIq+APA9lJw==
X-Gm-Gg: AYBFou1mIthYKJVKYp6fGRAOVqRSsvHe/lNZfECqGOWh6lwTKNw93sgNArJb4XMa+Xt
	YOOnxnxzdQKcLJySgGfsc8rYYuwIqfnCM0PE3QjfAP26oWb6CL6hY88+3VlQMGJPRhHhREzKQBd
	uVyfb4nz2O/6//fYHUCULDdGzN2grzyWOzzcX4WVSrtZEm27FymZAnvYTsCnSE/lxfLAIar2but
	Y56nh7J+pv/k8beS7zYc93vLbgAjcc7lCvVobldw4C9+Jzxc6YN59xLforOsmUVMKzMBJwRzYKw
	QUBye6wuOTcFSOPBZfeXigE3D6MU8C9oJZ9NW5/qrPFj33ThWaGvelGbx4fbb5QWTK9DK7c3jL/
	kUM7QRbANdvmIJwB/GV+chre9/cQK9Jzi8uyMKoK4jibXGGtD1EjjQNd3oQ==
X-Received: by 2002:a05:651c:888:b0:3aa:f4c5:8920 with SMTP id
 38308e7fff4ca-3acf3b31029mr2910091fa.12.1793950001835; Thu, 05 Nov 2026
 23:26:41 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030013135.158157-1-dc_redstone@outlook.com>
In-Reply-To: <20261030013135.158157-1-dc_redstone@outlook.com>
From: Stone Red <redstone.dcity@gmail.com>
Date: Fri, 6 Nov 2026 15:26:30 +0800
X-Gm-Features: AclHuK8OgaKc8ovDjTSMAgYe8ZcFtMznJBsRB4oxNpwujlSQyHmW4Mmsqhs97-o
Message-ID: <CALkEBsx4z+5tbxEerC2M4uNmG-UnOsy8mvYdTgQevh_=+4keqw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] arm64: dts: qcom: sm8250-hdk: Enable additional peripherals
To: andersson@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	ShiTou Hong <dc_redstone@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, how's it going? :D

ShiTou Hong <redstone.dcity@gmail.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=8830=
=E6=97=A5=E5=91=A8=E4=BA=94 09:32=E5=86=99=E9=81=93=EF=BC=9A
>
> This series enables additional peripherals on the Qualcomm SM8250 HDK.
>
> It wires up the SDHC2 controller, the LT9611UXC HDMI bridge, the FSA4480
> USB-C protocol chip, the PCIe ports, QCA6390 Wi-Fi/BT support, and the
> PM8150B LEDs in the SM8250 HDK device tree.
>
> Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
> ---
> Changes in v3:
> - Move the omitted `status` properties to the end of the nodes
> - Reordered the root nodes alphabetically which were also omitted in v2.
>
> Link to v2: https://lore.kernel.org/all/20261027080758.3990418-7-dc_redst=
one@outlook.com/
>
> Changes in v2:
> - Add a cover letter to the patch series.
> - Reordered nodes alphabetically
> - Drop `output-low` and `output-high` properties of the LT9611UXC pinctrl=
 node.
> - Move the `status` properties to the end of the nodes.
>
> Link to v1: https://lore.kernel.org/all/20261023072832.2642647-6-dc_redst=
one@outlook.com/
> ---
>
> ShiTou Hong (6):
>   arm64: dts: qcom: sm8250-hdk: Enable the sdhc_2 port
>   arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI bridge
>   arm64: dts: qcom: sm8250-hdk: Add FSA4480 USB-C protocol chip
>   arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports
>   arm64: dts: qcom: sm8250-hdk: Add support of QCA6390
>   arm64: dts: qcom: sm8250-hdk: Add PM8150b LEDs
>
>  arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 460 +++++++++++++++++++++++-
>  1 file changed, 444 insertions(+), 16 deletions(-)
>
> --
> 2.47.3
>
