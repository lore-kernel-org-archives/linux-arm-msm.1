Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792649722;
	b=dTRq+9sTR1LOWPGjhDqO5TcGJiPKJKi9tzsJXDWL/mB0yC+vF2JqpcunM+eysu/16AG/
	 sJRwFA5tEUnyHHqvGVXc3bkErlg44vXLV7nJbRZzbCy9Z+V9teQEBi2d06jcs80IaooFN
	 P4QMkCgnYqP3ijyR4yLe5rtjD7Puo6SeBy/0oQRHbZcla4iSkHhTJeCsj+amV7koWraF3
	 1PQMOA3/7rRJh38dasjNWEUdA6opA/QmDVlv4wAU6GrhxbQIL1sceYdYxgAtmIKH0u4Md
	 WPhsxXmOfVDccHW/fx1TazrnrCL5fnpAjnrzh9+2gP78lJOrx94TS8YusN5FFZsrjSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tNAW4moukw1CSqvHk1qqjH8bwOSbgrDYX8YbwR8FDio=;
	b=Wh8WPdU2RkEl7DeZxDWz00tZa9eb+lEO1VDhZe4IBWWN5+OgN8ETWOywkwmsQyg8Z4x5
	 Y7eSkNXjIU9hYVUgdgb4JO2XQkGFnk8bZ3NYxfwZl94Ek9AVLzUhcdWWO6yKwcahnhSRJ
	 wMFaFckuX5hHn1aRop3+LgK1D15xGHscd7iy4xjtuLuTNnOLIcDrDAfISaDB032aE4p21
	 of3/NIKSu2nqN60Nq1FgFYD2sx9TBySi2MbNPE65MROqpTuo9WY+rAhz0c6iknCvMO/Qh
	 BYVPF7AVj/f4wzD0mLes9uLtIzDKrPPRHAdrV3qeZn/lVEyi/JLWP31NJ1Nmnc6DVAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cKTdbRlH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FAF606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 06:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45FAF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cKTdbRlH
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0e21048f8so14427817b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 23:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792649721; cv=none;
        d=google.com; s=arc-20260327;
        b=ULpNpBjhO16gFloyb6ICQsbX9AGKiQIDD+2T018PoOYp3d0KHpRU+Ibn16nqGtfxqL
         2M9+pT9WfED7iab6pfWhYwwY0i2vz08vFWJILe0/3JQiOw7m/8vlktcpMzs31bVG/eBr
         XegLScC9aLTaePz3eT4kAJpFsyJ3f20VTQdiPMXswEpg8oQzkKLiQitni/OJF+IZBKBq
         O0tVpDsWtE8Z9t2manzQnDZ4HvZ/SoCPadu7GjtL9XQE72qk1z8KRMPvtZyMUk4OBo89
         pQQ4gzS1yYooeH+C6CTg7n1BmLQdRTDyKnOaGVmeS9mj2WH7AzYsgwo92ejJdW5mng7B
         tGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tNAW4moukw1CSqvHk1qqjH8bwOSbgrDYX8YbwR8FDio=;
        fh=9YXikjmYFulaqvJb+fkJSNOOQLhwsAQrL7xyHz2xWZI=;
        b=b5lJ2iGFBGAZplmLMVOG1TpE+vBpm/XqBpIM2oJPA7PDFwTey+4qfjkdjdI3XezSbp
         38LVfT8NsEC96E5SyWTX1DwHupcnr7UUptrnwIlhqUDRQagWY24v1gWJi710nfoUKV4k
         8VgvA4oLCxFAT3YZSzw39I0pPSvWNQMOPoyDjuWJeIcMNK5AGMfTpEeNzqV6KlmT35Ez
         W5xJNYleGQMSC/2cdELizavgWwXCs0acB/eAkbpXxjZDlAtOwP1d/PFx9zHqmYvSH1t3
         1ONZMcquTRU19in2uR/0ds9DxMIS9o9XJ8N/+RX014ZJmNsgFzR3iWIRcc9/1m2dy5QV
         peOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792649721; x=1793254521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tNAW4moukw1CSqvHk1qqjH8bwOSbgrDYX8YbwR8FDio=;
        b=cKTdbRlH93tw3PHlpA+KIqygaBRjO0n5TBKcvu5IkjSlTY7T8koruWcRN9DthktJ3+
         l3d7ex8Dt3ArSl3mOX+SL1D9ICQdP9zY9W5kdqc1YW7e3/fZWFt0QgnDzNNysDsrD6i0
         8oCyZbNM+StCCCXlaJ6tYb6DfJ57pi/FEphV0G/XG73LIqojiujgd4bG2UT15GdWbPvG
         Or4hdqQCCVAe7pxQ+xYwhylXBjJtRKZTU3KtqwG8zNPOGBMqkYA41bHh69Xh5aTA4TsM
         1NRemldPZKt78zGFT50bVGLW/JPFgG8LGy2Wb3Sqxl18l8UcSjrw+VeZDPOaf6eZE2Vm
         v2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792649721; x=1793254521;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNAW4moukw1CSqvHk1qqjH8bwOSbgrDYX8YbwR8FDio=;
        b=HDpxFeClDTklAeE53JWp89AgvR73MWVa97qFAwfBeJtGoDGPvViIOMqaIBaBeiJwjo
         vVBr7eV4fLocQZKAprRzde6NB42xK909bMcodIe7JalkSQSpXcSWFT5aLK69nuVAXPcz
         SGdo8wQyCaWBKimX5725JAzwhMvB6bDHWEqltXu66OCqgBhbtQuG1fOMo3uV5ELxufYY
         juTQfZfolKBr6XPGkAPYpR03oWu0DqZFTL5I/MafXnHVxwnbMrvt20b+BwusXbAB/eJs
         23Jny8BlfEDh4IpE/W2wMEu7J0PpPTuKfpRY1s8BNrKWfwQzDT2Tc+3jhzKlHRpvh3+O
         3UAg==
X-Forwarded-Encrypted: i=1; AKwUvBxy8LqEgWdZ3VE0eDO0Wy7HvsmVCb+kE0l09A+ZPJFZU6SweXEWKyY8DBaPSxFf+NX0mC/wl71g/TF8D8Cj@vger.kernel.org
X-Gm-Message-State: AFq9FYIKw/pBus/kl40oazOB7azkCwNyAfchxdNUwM2MWBAw85s92km0
	QBbGuJJuzeIFBnCJC3Whn9CpIOoKFb3W9yFV3yKv65Jdx9RapEXumRTd00T+qZusrR4NDMvH/0t
	XyKsw3oJMG+H6KrOK6HVDDz3+QbDNbxs=
X-Gm-Gg: AYBFou2njOyxK5jIJ4O1DieNGeSOYFCisWUYi0PuSlBdqTaglktym23ZJ3I+zJ+X+9t
	HKnVppNAmQ+h9UestiEoLjgHMolj8khv85lcKGfrQ67fvKeTxxhPNHifEtMezVTLK0npMP7LubU
	Eb6+MEQKBBNF2vl5pXPprL/5/6IajEXayETvwBniKH8fouKlUWImSuX6iuXHr7NPPPt1f8skGSr
	J/qTPUmw8WepiMLkpW6hhHkPXi56Gjd1f/NnnwjX782hyelErsSpKaiZtNJUGKjLxV+4sa7bxdZ
	Q6lWSk2WVA8oB9CaxsFVho5l20uSMWCeHSh0DHnDMl1TRoA9p8P8HrSNq6r3sxozZQITsooxfl3
	JE1+eVy1/Q/2qE1ER9kV50tu7DFtr4ny3
X-Received: by 2002:a05:690c:ec7:b0:8ac:cbaa:1704 with SMTP id
 00721157ae682-8b133fdcf05mr30804577b3.25.1792649721338; Wed, 21 Oct 2026
 23:15:21 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <13181dfa-b92c-43b5-ae12-912abaf79c41@gmail.com>
 <20261013015728.43307-1-liujianfeng1994@gmail.com> <74d7c3dc-0880-40a4-b056-f9a089a0ddc4@oss.qualcomm.com>
In-Reply-To: <74d7c3dc-0880-40a4-b056-f9a089a0ddc4@oss.qualcomm.com>
From: Kaipeng Zeng <kaipeng94@gmail.com>
Date: Thu, 22 Oct 2026 14:15:09 +0800
X-Gm-Features: AclHuK_IAy1t3yMlza72vaYDqeOJBevwsP67Waq6VJ7l78GWxOLa1DEch8zh9BE
Message-ID: <CAHk8ZdvrVt8TkZrSd7qyzi5AirL+FtwUpHT0QLcUd5qBJmhy+w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>, jactry92@gmail.com, andersson@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, konradybcio@kernel.org, 
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, robh@kernel.org, 
	krzysztof.kozlowski@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

Thanks for your reply.

On Wed, Oct 21, 2026 at 8:48=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> This makes it sound like the retailer made up / confused some names,
> let's just go with what the manufacturer says
>

Just want to make sure I don't misunderstand anything, if this is what
you preferred:
```
model =3D "Acer Swift Go Pro AI (SFA14-11)";
compatible =3D "acer,swift-sfa14-11", "qcom,x1e78100", "qcom,x1e80100";
```
Thanks.
