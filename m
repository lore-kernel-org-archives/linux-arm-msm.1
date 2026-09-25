Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DD0418346
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 06:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790318511; cv=pass; b=cZt7xSth0AnQzKDwP7KrNqqSBC5EI3H2mebRvGWMqrNwWyK5hj1ZJrtHgbUNelkSNyc4oBKmuf+Qp0UgGuLaek/CcGQtOQUraeQWGC/0yXHlwIc6l53Yak6GAHUYSEROSjEWBGPZtJm450keM/ygp36F00lCDuaFZGoJTcZt3hE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790318511; c=relaxed/simple;
	bh=RkD0ncrXK0q4FdIjZkUOUclIn2t5h5U0/ZqoP0P9Mzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oynEN/VBoxByQ7o71r6RKpekMpsqnqgU3b8YsxKjJrS0wZWWSInh0h4NrgH6qenfqWDy/FZXpsQ9rL7x5lrGqsmYq8giivO8BBybx77d8vYSLpPHCHL+egBHokNrcoI3tKEZMf7gICebyScEOW005el3h0RMwdHBSdtO5T2SOVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k8OriHiS; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k8OriHiS"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76ff64d78so568222e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 23:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790318508; cv=none;
        d=google.com; s=arc-20260327;
        b=lp7DznDQvnO4OZaL35FlDqFkGqfamM+e+7WfniHbEuoPMoLwX39As9QuxPBvBVUkhK
         FzUqTup1/oElmInFe65FzfC7Vp6YiSR+7lRIo8yl0UUcU5HpRX81lu76eCiTI4mNb2oI
         qTlWYK5saVwRYqThEJtvbqY1dhzrn+vpKm4jjXN6VbDXnpgrbTHah06AzLiHngOBOvFF
         yYtMfDODzbkROkzzn702B+qMjRuTiDJqcKEmEzKP8TGuxXdDMZomvpDsy9HbQV49ajDd
         ejrjEmYzfABiyJ48FeWUPIPyiJmQeLE/rk/epPm6GXHBCBD5MMDMlugWX0+372Hf++o7
         R3Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oCUKdWQbsHJgUOSvdlicS2cHjAoZu9s1v/XdrzjTDIU=;
        fh=uSwp8skuuL46+mBj9CyKeY2bXRR5y3FNQlgO7deQhnE=;
        b=IjoaYkElqNmvWLu5qbL1N8DzmxEKuYTQzxt4Od/qOykHTTMlbBg+T+9kQdZB/Uuda7
         BE2JZ+tYAGPFKN+KouiUPzDw9rxwLrbDgAcwOU65cMLmk0KA4ilqgbP6sksjQ6ne9eHU
         PW1cTkIVrlMIpR3AjkiQFwJ80jrLSw0MyDLLkKduLgTXZCH2JzdTYVkxWaBvoE0MaD3O
         guUemypZhHvsPXUcrXK4zaMnz+QOzagb45/2XCJuJeXJwtS2JmU0qRh2VLZPz3A7j/Bp
         YmJSKB3kdcvgbWbntNbGnsIFXlLv0u3hUTV1MEpy7SCSQL8ymeQl87qjN6hG20TMbMXX
         QaNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790318508; x=1790923308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oCUKdWQbsHJgUOSvdlicS2cHjAoZu9s1v/XdrzjTDIU=;
        b=k8OriHiSUhYSimjZzzOgSQ7fiEthApf0hKVCTywB39HydjMmF7ElQ7E5hbLnK/D7X2
         lsL+IyNTnAFrXfSBQBDEKiRXUlIOgrhcaKVz+yOoVuKumnZqlVZa+NyBzq8aFLPzaJMf
         qwywzm58NdIhx26NEYDfvBloknkhd6IXUp8s+t8t84SGSA5n5/CnvHAQxeclKQtBkVTc
         ISodHerrV/Vsr9t5pzFAGVWJwCmTBXm5vfgMt8QxX+iDDCWc3ZfyhEbr0tUOKBjKJXCN
         SMjQLydGyjTJL6rON25JN7RW31yvpkk83v15UaIczLo42OXj9zQdgPc32hQowIGcNtX2
         8SSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790318508; x=1790923308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCUKdWQbsHJgUOSvdlicS2cHjAoZu9s1v/XdrzjTDIU=;
        b=EiHpxgBgRC3uwAuD/I0T12oDJxA769JDKWk8g96cnbX4HAUyKoOZVFe9WFa+qOQaCu
         kkxqbuXJYwNldxrFW2WyOXnxSr21jx2J0UP/uvGeqa6050zCN972ZsJkdIOTnRN9SvTd
         SpcrycTh84epSovqDvpdj3Lz0lPjSCyqo9nHXL06FODQnVxAsP1zr2M2N1KCSi5Dw4Ga
         qmAt5olPxO6kO/LKcAikR/NQPbs1bkQ5rHOoF4g4rNWTSZHCgFTdY4j2lXNAKwJh1j2L
         jtLYY3wpOuTfmk3nPlVe/Y7vhC/IAq/KfUyaLrLKlH+BTpiNr0CBTUBH+gnYW4nB0TE2
         UYnw==
X-Forwarded-Encrypted: i=1; AKwUvBwPTNUWcPdAKjil0VCVREuPjUo7Nhj7MU6iLtVV0Po5J4v6q/2X4assSuUSEMJCPgVPrtXxpWIseGqjgPLM@vger.kernel.org
X-Gm-Message-State: AFuF++lLO3riM78PGsc/j4OfoYN6BNdq2yEvzrg6rabJDs4BOQ6sFMiN
	mdSHOXGI5ZlHH9IY+aSatvkgoX334JHi/R7FFN1N30sdedrgg8voHMb5LL4Je76cqRqIrUOgAoz
	gXPFyCFzUFicAG25Chq/PwZWp5P4F7qo6uw==
X-Gm-Gg: AYBFou0PpllCQTiXWtRJRd5U82lyBWOg9lyLRBuQ9RxQPg2qJ1VPk2UpeIXTIUpnOAx
	LA3jV26yzR/RJrV5miVIV8MHNmvk08YLFv+DTzfVguIfmshdVDzqXpjg0ONVdyylOzTIwVzl7U/
	V18GuVYD3T8U7W7g+zGtduOzj0tbnP4tE65RMD+SqLdl9wqJJnN0YYe83CbNh76hNb0FxwaOh/2
	PBC/h586zs8+JFCFyONrqEO+0Ntbx06/vOrPf4gwOhQ4NTbNFIkkUa+3nMDMHnOjGOnqpVxmVUL
	liE5BFTGgNmYht2Jts9+jfVrpMeqI1ulOXhF0P25VstWdzbim4+S206v+HgzJ8h/V76ZSABGv+R
	Yq3hJddZ9xjB9h0v3hj+8NkVlZWU0GUmeyElsgklQsTw=
X-Received: by 2002:a05:6512:b23:b0:5b6:1a7c:59e7 with SMTP id
 2adb3069b0e04-5b8e0fda144mr1478322e87.65.1790318507668; Thu, 24 Sep 2026
 23:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
In-Reply-To: <20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 01:41:36 -0500
X-Gm-Features: AclHuK_MIE9jeQicmnij_O4juXzqsKzVql5g7gyWzlaf76vc-yY3NplBZb2k_9o
Message-ID: <CALHNRZ8kFm98HAxoSya1uzV9TnPL8NAey3y5nUaaiqPiE+Fe4Q@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] arm64: dts: qcom: Support AYN QCS8550 Devices
To: webgeek1234@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Teguh Sobirin <teguh@sobir.in>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 7:20=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> This specifically includes:
> * Odin 2 Mini
> * Odin 2 Portal
> * Thor
>
> The original Odin 2 dts is not currently included as it has not yet
> been verified.
>
> The initial port was done by Teguh Sobirin for ROCKNIX and was made
> available on the AYN github [0].
>
> Support has been removed for things not yet supported by the upstream
> kernel, these will be added later when the related drivers are submitted
> and picked up. Such includes:
>
> * The Odin 2 Mini panel, backlight, and touch
> * All rgb leds
> * The built-in uart gamepad
>
> [0] https://github.com/AYNTechnologies/linux/commits/sm8550/v6.17.5/
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v9:
> - Add mi2s clock control in patch 2 as driver support for such was
>   recently picked up
> - Drop unnecessary address and size cells from patches 4 and 5
> - Track renamed pcie port label from current linux-next
> - Add panels to patches 4 and 5 as driver support has been picked up
> - Add patch to document chipwealth vendor as used by patch 5
> - Delete ipa node in patch 2 as it now depends on the mem node already
>   being deleted
> - Link to v8: https://lore.kernel.org/r/20260503-ayn-qcs8550-v8-0-d733f5e=
57446@gmail.com
>
> Changes in v8:
> - Properly order and format amplifier properties
> - Set amplifiers name prefix to Amplifier L/R
> - Link to v7: https://lore.kernel.org/r/20260430-ayn-qcs8550-v7-0-591a967=
35fa3@gmail.com
>
> Changes in v7:
> - Add back pinmuxes dropped last revision, but without output-low
> - Link to v6: https://lore.kernel.org/r/20260430-ayn-qcs8550-v6-0-06a7e7b=
54aaa@gmail.com
>
> Changes in v6:
> - Fix comment style in patch 3
> - Drop a pair of unnecessary pinmuxes in patch 3
> - Lower usb sbu pins drive strength in patch 3
> - Link to v5: https://lore.kernel.org/r/20260408-ayn-qcs8550-v5-0-c90abeb=
7a152@gmail.com
>
> Changes in v5:
> - Fix some style reviews in patch 6 which required matching labels in
>   patch 3
> - Drop hdmi support in patch 4, since it doesn't work
> - Link to v4: https://lore.kernel.org/r/20260323-ayn-qcs8550-v4-0-33a8ac3=
d53fa@gmail.com
>
> Changes in v4:
> - Fold vendor description patch into the series
> - Link to v3: https://lore.kernel.org/r/20260322-ayn-qcs8550-v3-0-4afa89c=
20888@gmail.com
>
> Changes in v3:
> - Drop unused backlight regulator in patch 3
> - Move zap shader firmware to standalone reference
> - Move i2c controller enables from common to devices
> - Add ABL dtbo workarounds to patch 2 as per:
>   https://lore.kernel.org/linux-arm-msm/dczz4uvcq4hc6p3zb6xnrsgmfeomwliag=
whf36tewdz4z6mndp@afbxzhjziiwv/
> - Fix multiple property alphabetical order issues in patch 2
> - Use interrupts-extended for pwm-fan in patch 2
> - Ensure blank line before status in patches 2-5
> - Rename spk_amp_l/r to amplifier in patch 2
> - Remove a few properties that are already in the soc dtsi in patch 2
> - Order tlmm nodes by pin index in patch 2
> - Drop qcom,dll-config from sdhc node in patch 2
> - Drop dtbo support, convert common to dtsi, and include it directly in
>   device specific dts'
> - Link to v2: https://lore.kernel.org/r/20260311-ayn-qcs8550-v2-0-e66986e=
0f0cb@gmail.com
>
> Changes in v2:
> - Drop awinic bindings dep as a duplicated patch already exists
> - Change Co-authored-by tags to Co-developed-by
> - Drop alias to currently unused uart15 in patch 2
> - Link to v1: https://lore.kernel.org/r/20260311-ayn-qcs8550-v1-0-fe8b2fa=
ad1ea@gmail.com
>
> ---
> Aaron Kling (2):
>       dt-bindings: vendor-prefixes: Add Chip Wealth Technology
>       dt-bindings: arm: qcom: Add AYN QCS8550 Devices
>
> Teguh Sobirin (4):
>       arm64: dts: qcom: Add AYN QCS8550 Common
>       arm64: dts: qcom: Add AYN Odin 2 Mini
>       arm64: dts: qcom: Add AYN Odin 2 Portal
>       arm64: dts: qcom: Add AYN Thor
>
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    9 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    3 +
>  .../arm64/boot/dts/qcom/qcs8550-ayntec-common.dtsi | 1819 ++++++++++++++=
++++++
>  .../boot/dts/qcom/qcs8550-ayntec-odin2mini.dts     |   44 +
>  .../boot/dts/qcom/qcs8550-ayntec-odin2portal.dts   |   99 ++
>  arch/arm64/boot/dts/qcom/qcs8550-ayntec-thor.dts   |  250 +++
>  7 files changed, 2226 insertions(+)
> ---
> base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
> change-id: 20260217-ayn-qcs8550-16c07b63de26
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>

Is there anything holding this series and the matching Retroid Pocket
one? As far as I know, there's nothing more I need to do. Could these
please get picked up?

Aaron
