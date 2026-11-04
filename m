Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786386;
	b=EOQ8qU2fh6uN2MQVWBXZllErk0ZCOx7lEkHsxW163xDu8R2a5Qs/A59Q54vWPDKut+fd
	 yJKHOtB4QV+iPmxbCDDbTKsDPe53K70kQw+b+9rL+xoDeCj6SdyycLWI7RFITUfh2+1KI
	 eF7r1aomLLct+ZTlkXigSAUGAkgshicyZCsDpJ2m6eMh59vdbYJpLxlSms8POh0RYbyM0
	 IkZt9WTF6c+Yrw8wNzYuAYQhx3jWKGt7t0xn/lICJ5zBVI97t1eLwoByvC7GiHIQq4FxM
	 EmlF0iW4y71E4VXx/uR8JqIEGKiow0buY3rp42hqcMtKnzkEGTv3GtnOoHlkvEz5RFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kVV+NwTV+9ZC8EqM9XWPxOExxnVbvCg7pip7E4xE4dU=;
	b=j8jR8yRrIiiGRWjgyMEIw31P45XFiHjiwMmUF/otPzqhUUhnewuZkcXnghaLpmYRpVTC
	 UyxaqLGnxWUWgf3PstMMRbpwFHxbNyfH3ZhBvyeqOxhcPUQrCkKkY16Y+rMFj4gU6lBTY
	 Lo325CrNY2J7gttgFIpxr5ofZrnyUWKFilBMrNbFe9BRGm1cpn/s6ZEsonrq+k5V2cFaa
	 yxw+AfMWH/Y26v1/UQ6BcR774ftLNCDB7kmBgicHN/bp64Nt/LvhGkTY/SET5n5U+RxDS
	 COXkJKomqbLvBbsW9qeNp4JE9CrZ+yXzReBvOxLjWJoNDWA2q69ERZy7dL4XoM1OClw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="by0c4k/G";
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645F7606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 09:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 645F7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=by0c4k/G
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b244fb7fffso752261c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 01:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793786385; x=1794391185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVV+NwTV+9ZC8EqM9XWPxOExxnVbvCg7pip7E4xE4dU=;
        b=by0c4k/G8PDiSTyd8V8QTZUxGYbRRFcRKl82h5qnXoTgfKo0vA+mUDh6kR5bVxygZ/
         bv9B2U0ziou9pEVt2+CcJXB946+SaYN1P/l0s6+O6e6SyXdgKZbXjeVACwDb3tgMXG8Y
         DqxoDy2h+bywhFbX5P6j6cLTaYXpPfZz0uDPfzT8mpoZfVjK8ZXegEgQ6maa71AiCxg+
         ZcakC+uC2+gVBHZEJhVw/d408RRh0mANBEyXuLqZDK3dUtO4SUVgdGi6DU0Qk99rldiL
         R6P6+vSoXRgCiLlWN2nk46QewI41qbNS7S9eaCZegKyIFwyZoUO1rHRcf1WKhzgn1tW3
         en2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786385; x=1794391185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kVV+NwTV+9ZC8EqM9XWPxOExxnVbvCg7pip7E4xE4dU=;
        b=mWHRM+LOoN8K5n4EfU8R2WzOY4n/zura54A9aGUMYZ/QwBeRleMOSajg1vFOKq+gmo
         WBpaqHUZs8mqK971kqM+DmZyYFX3RB7DZ/kCQuQO247R97rpLWFdKt8mxaR7tnBX0Q2n
         RIk7YrL/ktyC10oYClWU5qyM+L4PVsEAcypAgbJoyXLil4RFqBwEdlwrEizNcfCIT/9a
         QaYnWr7PQL1RUl5OD4g1xhkOdwxxclqNc7gr7nG1K7W6/ERQ0lH7vzOtbpNTtdegf9Yf
         Mc//Sjaw2F4ebzZmY8DM0tizYsnnY51Pn27VwIc1Reof/Bxlig2lKk4Gc5UaMKJzfgHO
         Dx2w==
X-Forwarded-Encrypted: i=1; AKwUvBw1B8unAWz/AMhH404ahBcnKK9OnTgJkUk/qgJ+WX5cYsb3FU74dN9o0L3x33f885h+tW5ehnlCzuzY8ek6@vger.kernel.org
X-Gm-Message-State: APuU4Z+oR86NFrcnY30Cu1pD/yaXtzr/eTt2yfDr3bqWkROmkoUQ00Or
	BMPAhsZG6ULC1rSQxD43OMieaoHzQL9Ojn/VedTXa0Fiw4Y52jqzwtlC
X-Gm-Gg: AYBFou260TUsfBwnVkjxeVA/iwa79FVUSu9LIphDlDqGB4RW+5yv8C6WBHUkAjw/6Hv
	lQv9JI1TZUpDu+wHDXI9QXoLNXnAYU8ptmRxT4qqV46qrB2fRbd8dP2rU+/QiDz6vPTVP4mUYkT
	SOnHSCJXTfzkBHiWd6SfAu+x7bFYq+vFOfN7ELmvFB3AoryAbYvmDHaBqktT9u6PU9YB0Un2ZVO
	ZSTl55ip29CKKVD8ne1PLIdVCySewSysEoBPlw4L41Jyj52E7MukJ5MoAqVOE9/QosjCwqftef8
	apJxGdZpsQqwU47z1sfKPZWkgLavD+yC/oex1so7z4bYCZNq9sMU/uMn/apvcaQ0vvGeC4WzaO9
	koXUYxiVEmg+8kAVJZkANP46/X7q6KIHYAeafPSwWd4CeGIVEqqeEWuJdiJesUZ+wrQ8nrSTTIv
	tl31L3aoGIdSd6T66TWhOIwt/Ym9t/3MHo3GRGWgzcbz6cq+6qKmoC5rdScye7F3j276Uya79zX
	GU9Pg2ekewIf+YDIdb+QPFzZ6RAfbvwxgq5sksZe+6VP2D/FmgVGblP2bBypvwY8l1z3g/kJ5F2
	lpHdfijaEWl8uLJ422W6omuvDpCS/cVSw9oQNTR0Ytzo4iw=
X-Received: by 2002:a05:7022:ea56:10b0:176:a225:e364 with SMTP id a92af1059eb24-1ac5de547afmr23249910c88.35.1793786385435;
        Wed, 04 Nov 2026 01:59:45 -0800 (PST)
Received: from localhost.localdomain ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b87c4asm6318999c88.3.2026.11.04.01.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:59:45 -0800 (PST)
From: Amir Hanip <killdeath104@gmail.com>
To: barnabas.czeman@mainlining.org
Cc: a39skl@gmail.com,
	abelvesa@kernel.org,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	killdeath104@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
Date: Wed,  4 Nov 2026 16:58:06 +0700
Message-ID: <20261104095806.18945-1-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <3ec43b1b00bca7506c1ca678c118f8c2@mainlining.org>
References: <3ec43b1b00bca7506c1ca678c118f8c2@mainlining.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 02 Nov 2026 21:11:33 +0100, Barnabas Czeman wrote:
> I have checked it seems lemon have same adsp region like citrus.
> `pil_adsp_region@53800000`

Thanks for checking, Barnabas. Where did you see it for lemon, in a
downstream DT or in the stock firmware? If lemon's stock layout also
starts at 0x53800000, the 0x53400000/0x2600000 in the lemon DTS may
be worth rechecking.

I will keep the ADSP carve-out per variant in v3, since I cannot test
lemon. Adam, if you can try lemon with 0x53800000/0x2200000, the node
could move to the common dtsi in a follow-up.

Thanks,
Amir
