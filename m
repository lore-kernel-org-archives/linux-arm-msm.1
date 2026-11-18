Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018472;
	b=IUgFFdLEINgrUXahQwRrhX/+XURueqvYmxwl021H9OyyqO6BbwLnV621ueofTkoBegnc
	 GNjBdUasHEHVBjwILOxbbRjXWqjpCbHqhX+SokEst3lTXaANV2t1NXTstDnPZhEWO1LgX
	 tbitExNBfWgV7DY4hDhNIE8MDnglco/FUUSIQA0pY+SfqY//MiQoGkDICtwI6Ahd5TN9l
	 gKsPvdeE892yHWuJZpom83nedrIZkNlRpxvFs/gWbEXW7/JTDgsjhAmsgxF4O+fnT0vL5
	 UTqQMZCQbgrAPWSDazPDJnwBW2tkXejlbucv4ybl2G24m0D84ZUPMLxgILP1Yo652RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018472;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=Q0xjTpI07HlgviMHo4KyWLXIxNMlTqAZgoOaTK7mdCg=;
	b=GPjNYJ/2wmidgIcRDnSDJh7FvgHp5JVBCRS8tbj3bs7o7zZKMazX7ZctJlq4gx+rm6L5
	 4q/4dVhP+BHKh8kM02v8+GLcDA8ZgUDDdjj+lBke2utF55bNzRdKSnHfVc3GrTZm/hJTE
	 xowk3Pf3lu+LIvrzuXatKXeIf9BWBeSGa3rMdUoAl1tENqR+E9kf7tVjwQ3V7GhHedC4N
	 gak9e2llswjqyBVfk8+XjutPzpmxU87rYW4VYTQEOvBYjT86QgcMdMAvek74QT5vFbz5C
	 Lo9eCxeFbdj/HQRPg0gFtjU1q68tEgWPL1LY97uxk9RVn+tVkgxCUAh0Rk5dSA8M9yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=N8cHuzSG;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545C1606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 16:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 545C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=N8cHuzSG
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so835824a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795018471; x=1795623271; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q0xjTpI07HlgviMHo4KyWLXIxNMlTqAZgoOaTK7mdCg=;
        b=N8cHuzSGx59kCzVaVvnnVDk+m0o/5FzrJte3k8qYPYBAfARJ7jS1mCpj1MFBk/8ZW9
         X+OfTRhuYHACV1grTRV7ntmN2SlvUZzZLFp5CtIoyP9ooDJ5c08mcoBgez6alR64ZtL/
         9XL20VL0fme5aCnLjXWVBXb4+AyWV1RYbTssZAZXTtlL5OdCBWcb3NChgu7RSw0TRJJd
         pS+Wz11rnhsmi4o3ezQuy/xAtokMN7lW+v1CRT0nFs+ZsUlkJWacXB46MHijaOdI4Mi9
         mrskFTmQmTk9qbVPdP1K0DZsXpX+Mi3+phzqlcnyfTe5JHGMeNY53i2/JiYH36bJsvNk
         e2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018471; x=1795623271;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q0xjTpI07HlgviMHo4KyWLXIxNMlTqAZgoOaTK7mdCg=;
        b=hsFTIKNN0IzBgGPJ1cik8gxw7PDokmyWqT4GJ021mDX+5h2BmivZUO50f/2pJtdTrH
         +yEXnVSbfeZv/fh6E0QyQbMUjJXFhS7gRwUANfjdB77fkClhwo0g6ruQBGNjE9pmkWNh
         92H7szGURfLoYNhjtaE2SoP/F+w4U0sJSPnxtiBvB8g08YkI3eQM1lWvxAUD1CwfWHNN
         wOYlE6uHRrF1HwKnv+qYPttgaaBpPLq21w/dLoxgasog1I40iPF4tDk3pbcR8Kw6TuWj
         4p2TNy+rjUghI/J28KefePrD+HsR5ItxKhbUvX4eAoC7qqMGXxmmz+xizzwQL7cex3rD
         TZlA==
X-Gm-Message-State: APuU4Z8ezvKoIdEvh0g9/LwjoRzM/AXBrrRCBspY4JQe19VHRwlwplXf
	Xf8+t+boJlpHBzqWudIvF27Nh1fAVPmuXKsE0JVMdmEyMAzQp/zViPOWXhFhvYEPm518au6skzB
	IsAdYAr9NTQ==
X-Gm-Gg: AYBFou2bJoAGMERhhHPKpl6sZQ0faBuL81Xf2X1H9dc3d9xUSkwsaS5btZk5cRZM30b
	VcGhZizMYmyiU648o/h6c7cRHZ0f+tFQprgWRzXtRg1xYWZAoUOsJ6lhkJ2RpHhZaQt2x45udke
	brDIiva6umXIQ6h9Toq9EuLn71/DzwKdgS2Mo9U6RaSC3u1UDEPWemBIybgP4fkcDnE2aRwOgmn
	rUAsH5MZZujrygvIy7zPeXS8Ud/FNVwgXQMJiYgE/PAk1cev0yz5aryrSWkNy1eE+sQ9oG4cUio
	S6+A+ZP3H8LAJ6HF3QpyLCI/caQ2qvRhK0FbsKSd+1R5UARcvI+sgdwuQea3rHxCYFglFm7j3hS
	q67BwNAuQYDRkxQNdzB6K2MFL+cRJF6v5CU9Tb4Nxk/bxlY7Ds8430OUF+f+7W8Aih9MKAzZsoU
	8t44hQE4uN/YrMD00VEvQp1KR7OYpcseiViLu1y1HBY5Y83jf6IQwP5JA2F5FWAzJ3P0ACpYI8o
	BzPaf6ylKDAM+aocaOSBoNkTOqjvnffDAIAjTuf5G7ofbThw35OOpR9YJQFI/BDRDSFTeHv0rq7
	0ezRu8GghvwSnMikq3uh9DidicFm3bNvTIQ9odn5yB1XrHUUeJxGVkVrBgPvRZMOJEbF7Lhmqw=
	=
X-Received: by 2002:a05:6402:5409:b0:6b6:7231:7ebc with SMTP id 4fb4d7f45d1cf-6b887e50d5emr2734312a12.14.1795018470789;
        Wed, 18 Nov 2026 08:14:30 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b888ef94b0sm1356826a12.5.2026.11.18.08.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:14:30 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 17:14:30 +0100
Message-Id: <DMYGXX4GAHRV.2I4NFHBVVJG0V@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <wcn36xx@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/3] ARM: dts: qcom: msm8974: Fix WCNSS wifi interrupt
 trigger type
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <arapaille@atlr-engineering.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abel
 Vesa" <abelvesa@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Loic Poulain" <loic.poulain@oss.qualcomm.com>, "Luca Weiss"
 <luca@lucaweiss.eu>, "Eugene Krasnikov" <k.eugene.e@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com> <20261118-wcnss-series-v1-v1-1-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-1-a64d82e151bf@atlr-engineering.com>

On Wed Nov 18, 2026 at 3:57 PM CET, Alexandre Rapaille via B4 Relay wrote:
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> wcn36xx requests tx/rx as IRQF_TRIGGER_HIGH, overriding this edge type, s=
o
> the re-probe after a WCNSS restart fails ("type mismatch, failed to map
> hwirq-177") and wlan0 never returns. Use level high like other WCNSS SoCs=
.

Looks sane, I've had plenty issues like this before with other SoCs.

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

>
> Fixes: c7c0edecfba8 ("ARM: dts: msm8974: Introduce the wcnss remoteproc n=
ode")
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts=
/qcom/qcom-msm8974.dtsi
> index f300de74c4..b9666feb8b 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -814,8 +814,8 @@ bluetooth {
>  					wifi {
>  						compatible =3D "qcom,wcnss-wlan";
> =20
> -						interrupts =3D <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>,
> -							     <GIC_SPI 146 IRQ_TYPE_EDGE_RISING>;
> +						interrupts =3D <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +							     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
>  						interrupt-names =3D "tx", "rx";
> =20
>  						qcom,smem-states =3D <&apps_smsm 10>, <&apps_smsm 9>;


