Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793118324;
	b=GgyZidL1Iv9E21xy9gnSHOCmazAswPKsHh5cgi+ZWcty1Rn2PAe6SND5zqmddfFrEuJY
	 yCIx+qwVEtIWnWVCzke9AgasoBBXA9njHUI7lDzZy55lPAkkd+VGwFC7e0zVBmGYa4Nxx
	 9i4jS1EjDPItYxW03uDsnpNq5YALMZ34JagPuc34+pvrozN5UO0NFV1tsLQJXGS5U2Fe8
	 Wl6h5Nnnqwj5yU7vb76LSYnZcVpPThImM7pcv8nPS2of9WiOukhL/LuCckY3IZ3lWEQf+
	 2Zfe8MfQdepReentOUKxCe9wAPBrLvg9ohOW8YAQqsqH+AFEIpChMhMMuhU8WIaTCpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=/kfeTwXgqCxPdS8Y/UTZ2+F+St1gnOqgFCGoK1yJzcU=;
	b=n0XBUUrHaRNZ07CcLxuHt40mAfcfdm8bsoezA5yZWkaYonFLbcXOrdyhzEGJE0Jo132x
	 8O8LIrONQJYSYySEOLY34LI6gJvFqUpWg9IQEFwu4xaNzMX8U4DdjMIPfKXIg9K5k2TxF
	 gQ0zJ4p9vH1Lj5W3rch16xY+rVW3r3Da+7XmcS0q3vM7s6dPnr7Q67VOQ5Kc0LrBci8yt
	 g3psnPVg6Nv1xmXk7CXw52Uv7O1W7T12Pw6dlm/4/QlSAn2uMo2vRRQkepZ+nlJFzNnUS
	 ZCsDub2D895B69j7zy3TgoRT56ave+1EYi35AxFUMtXuh9bq6Mq47oGT2mR03+nKATA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xkNG1gDk;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E61D606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 16:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E61D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xkNG1gDk
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso83195e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793118322; x=1793723122; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/kfeTwXgqCxPdS8Y/UTZ2+F+St1gnOqgFCGoK1yJzcU=;
        b=xkNG1gDkHvSeaYokYpCIMabsoJLB2gKcRtGLwY0v1E5SdrTFQ2jsMcEI6hye4sIZ1k
         CwMn8il+i0oHtEIf56W0WaHs/1MQG0TV6ii9yRa4CHLkjoOGGiAn21PBz1ndNpIwtNYu
         92oTZkFxvnwsifI5TsEfN5KN0dLhddDbhQQwr6ltLY37olNHbYRt6cEKetlNy0m7huwG
         Jjb4fEZ/usyu8Y7kZlccK+8S2Z+CMuLHdQUWD3/lSAOBwELvcBde33jNzBFJWQy3jhze
         i39PMlQKSEL67fJg2t8SB/E3hdBkDrEYy35ahMLsiS01nvk+9vxhEl3sFm6xAs1Z0JEi
         cRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118322; x=1793723122;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/kfeTwXgqCxPdS8Y/UTZ2+F+St1gnOqgFCGoK1yJzcU=;
        b=GpX7lGbbiuz0Gu1j7Kc6YDhwIXFMfHk3HBTABVr3bxcRiaef/OLZviBWnf9Uljp0/a
         cI4gvuPHrOJ3/jgGJvv4suIlU4Ffl/vKKl9UreN6jQZGxmT+VE7/7BS15FSpvq/EKpEZ
         0GG0p9Ls62ohiZtFUdSuy24rVpckGuWvpMoGRk5SJApjN3ZO8f9AbrmRSMqZmjpidHgy
         neGagdJW3jsIKCs/P0JdrFqU4XvdfMQafYUliSMCBbhn1ZKTzduZtWCjWDjX+pN80Ksq
         lEjFzPGeljo6Sqd1sTBEUzbXPbYi8BhxHr4FX0F3EnGsNfwqm67+2twdyQEg5fJe3UR8
         b8AQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhm9u2Gd2T/0fFELIV0tJX9jDy0phDgJa0Z971bQNLO2kniRD/H4Gh4yUR8TkxMOvlcn6jIN1hOaPKvKsR@vger.kernel.org
X-Gm-Message-State: AFq9FYK56ZSQgYa6naNDrP9qX7/H/u5HeWyEnc2f21uH8YygbFSHVsT9
	dicScgtRYWtN5bseKmq2IS+WjxgtgTZkaRMmJL3UDMPvh+jw5OzWagpnHJQ8rzCbU2Y=
X-Gm-Gg: AYBFou0mj5uAQ4pXKCt2c2sn7/t6oQko36hfdWcLaBHhA0jj4J7C6WuzOW7Un4DduA/
	8i+BBHiABQQbYN4G578gTQD/ih+qwJEDiyf0m+AiMMz9rLHabpQ/AwAd4LGNNV6zJ5DBui4foMt
	yunsbKSK3gAhpvhUZF/bjdEmYuIgUvK8PhIKio/O7MnhYWRi/1mv46EHaObSdU3C9x2DtTBLUpq
	KsTwbNuYpBCtXYBMaijpFLQ+58vKgZOnO6UBJMWJWjySa3Mkhreo/TDEnb8nUZ6lxLPzSAfaNtD
	aa7RYUgukFzxiaF1EZYl97kBljGOXFvNJDvDNXsWFRzWS0FxG/UvkHyBIjSHmQSOZmcFHKikkZP
	lsLdvHCyR8YdtmIArIeZDD8qgZVaYdzHAdaU5uEmO4Ke6Ktdi8c7mNF7v2vMar3Pj+HzVwEiq2d
	g6Ea+/6ZH101T576LHtS4pIylTGC0PLjIJod8B0sH6N7J9ASRL4WErPqUU/ZJATm8+1ihSa9bla
	bGLVL9Yt0y9DelpzZBvemLCA/W2mA+HZkeq/NuMh/BCAJ3tMITeuUoi5iMdBxEaHGEKV4PRUjkN
	P2Qr8TiQeS87SEP8yrpnHdms0fj+/Oo2OdmoiljJIz6png7z/n0P2bDalmgDMwg9BjuU
X-Received: by 2002:a05:600c:1909:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4a35ac95fa0mr188333205e9.16.1793118322543;
        Tue, 27 Oct 2026 09:25:22 -0700 (PDT)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a931232e6esm80005e9.13.2026.10.27.09.25.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 09:25:21 -0700 (PDT)
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
Date: Tue, 27 Oct 2026 17:25:21 +0100
Message-Id: <DMFRE8PRV4MD.3DSSCQVOLZTIP@linaro.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1:
 Add PWM backlight
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: =?utf-8?q?S=C3=A9rgio_Ferreira?= <ferreira@se-rg.io>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Abel Vesa" <abelvesa@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linux Arm Msm"
 <linux-arm-msm@vger.kernel.org>, "Devicetree" <devicetree@vger.kernel.org>,
 "Linux Kernel" <linux-kernel@vger.kernel.org>, "Georg Gottleuber"
 <ggo@tuxedocomputers.com>, "Ettore Chimenti" <ek5.chimenti@gmail.com>,
 "Jens Glathe" <jens.glathe@oldschoolsolutions.biz>, "Srinivas Kandagatla"
 <srini@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261025-medion-sprchrgd-14-backlight-v2-1-bf2979485ec2@se-rg.io> <DMEXOUF2X7O6.3W5B9URS8YOEF@linaro.org> <P4tSXlD--F-9@se-rg.io>
In-Reply-To: <P4tSXlD--F-9@se-rg.io>

Hi S=C3=A9rgio,

On Mon Oct 26, 2026 at 7:26 PM CET, S=C3=A9rgio Ferreira wrote:
> Hi Ettore,
>
> thanks for testing.
>
> No, i can not reproduce the value inversion. A brightness of 1 equals ver=
y dark while 4095 is maximum brightness. 0 is turning the screen off as exp=
ected.
>
> Here is my edid:
>
> ```
> edid-decode /sys/class/drm/card1-eDP-1/edid
> edid-decode (hex):
> ```
[...]

I have the same EDID so the panel is the same. I guess my unit has a
different circuit revision.=20

>
> I can confirm the PWM period value mapping is a bit off for the top-end v=
alues, though I haven't noticed that in day-to-day use.

I agree, not a big deal indeed, I see other laptops (e.g.
x1p42100-lenovo-thinkbook-16.dts) using the same range.

Tested-by: Ettore Chimenti <ettore.chimenti@linaro.org>

Thanks,
Ettore
