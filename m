Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138467;
	b=rTtSLgS5tvyfGmIXm6IFsLLWQHHx8VPvKfYRgWDjfHwJkOtPHc+Ursls2dsBcfB2Z80p
	 f7a3ml/gjh71gadGcWb8B34Lb03urK737FOwg/icDIfgLjkSPyPtJbZuaLQU/WdMMO9Pu
	 Xp3ef13d4FBKG00ZJq/6WQa6SEzI7mcxmq93y9ZctO3mU7pT5JtJS7y60Ti+Tuzjo604G
	 4yufDj6amOByCfXfzdkfUPF6ZD50RXlmkJ4aVTk1rFBMlWvMLk8US1OPBde54VGplSN41
	 TZAmDrMk3o1nqYN+NDb6qkU4sfIj89omtNzXrVrfATYYY0fSHwhcWj+16NJp/NOLPzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iTqyRiQDnfi1QXpBcj2SLobHel1AzC8JZ2/AVmqLjCQ=;
	b=ZmdiKNxULNYwGKe6ThDVS1vFUL9PAfZX3M6/Qx52HOovqJ6hbB0tcoGEh/G1nrmuntL1
	 s6P3I7oHN/6f4YrdTI3f3QCjsH9QNTAUMFpFj9V/lxdTbS7tvLNzDWef49x5Yy+ckMZxR
	 MQd7Qu2xPJOJioOqr07wHJmUVFr2sjSWmnjRDKtzRtpoI01kz/eRS5adP5JMhZ3ivpdw4
	 7ANRZ5+cdjlp6OohjoFPlG0YQepdsfdJNir6nwup6BM0+PgN3920IHHVNHt7zXsmatubt
	 fmfKWHAMRxV21t87FnxcD3gsiqAtccf05gH47DDaVvdlxTwHpWsrWjKb1xUGzPjOjpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="XBMkG/II";
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BD0606A31C
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 11:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78BD0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=XBMkG/II
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d5cb1b181so6402766b.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 03:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138466; x=1794743266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTqyRiQDnfi1QXpBcj2SLobHel1AzC8JZ2/AVmqLjCQ=;
        b=XBMkG/IIcRv2erhu0jLaUyRAxZewraw5dmsWN3hr/txMuy8Pcpc2x0D7vuGlZPphI9
         gRZvOga9mqvWxhPARZxqRgkk/+kxoUSkKfxz0ZWOEy1WEtBbk7AkkYeWFRi/ldzlivXa
         7DXCGnN8GohkSU7uwFuF109XOQveohNLVZfYFXtqr7sk6/EbRcUTh/WV5abnKsqG6nuc
         tzIl55i/zN1+cK9Bz16/UPM29dp2cpvMLQo6Q/TdP9fSSw+4j49wcpxK9edWYfvPhbCS
         eQanoJkJ6vbOLAcDwlyFKxonmU783L4jU2aJOV+/eyjjw7B5igoGxDacquIwVDQA5VZp
         AXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138466; x=1794743266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTqyRiQDnfi1QXpBcj2SLobHel1AzC8JZ2/AVmqLjCQ=;
        b=gyqLI/KAMPZHVna/6FZ3zxuKXrVJ1kW4ACfY/2SaDFYYPR502POVkZldTAlx5ouOpO
         m8TGPyM0lNvOh9aZi9zw+1g+9uYLbZMh5s0mUQV1OUb5CB5PmV5uNtClHO+eeN6tmPZq
         uvm8NR9GqM6sFFbB9E63KMKvOD2ezyUQ2oLi3LSHUDwqo5aVearDJU0dPFylbrhqLwe5
         IcEozJvtrfNA12xOIUvGK/WcyGRhi0dcYcBSsAM7vbRv5SUdr5VUVnNWvl/NcKS5kYOh
         JnaZEa3n6FkmxqkltRFnhJuJLfxY+UElFJtuIjG65CINEN/Mp2w+muAienKV4koeMgZh
         FVVA==
X-Forwarded-Encrypted: i=1; AL+hErHcAP8IzXGH6ltPrhRljrvvtGACSkwkSH6WiQZsc5ykQ2qub02m8vYcetOL/v5yc0yFk9jW5JnYhIoLV2jx@vger.kernel.org
X-Gm-Message-State: APuU4Z8t++Ar7t5qFsJiI17vd16ZBzNQoTjXzKegY2gTbFtAXh4n5N4j
	6D/qNaZETfJL5XNuFf75t81OJ9eqoswZu2DCNGQnlv/aZ2zLVZXLcK6WVQEIMH0IKw==
X-Gm-Gg: AYBFou0QN2eQBaOhFTyEVIXezejB33DFqJjkR3VKTeXcQzEisnusSw5R+euFtvHHRrL
	oszqzC3A36E9focJ2INU9UHBpFbcFAbpa1uhBtTnYiADAFJGZOCGxxu0miZmis4LlnaEfjVPw8e
	LHIDGwqmTYtXQ43fN1kgWQQ1eA4m4EnupC6eQ9nEYHNjVtaPoBJG46oGpZFgbrwELKzS1CfCr2N
	JWTDE1+0Bo57XOWfZsmr/Ts4bM5SojQXfaHKAx86x70l3MTqf3b2Zw3DB/4OvCAF+VXWsrA22zE
	S1/C/odfveG/6U4MIbHT9IdJ7JS2InuW0foXGnTB75bY286UD/BUtLWacgO4NsICfqzh/EMupVX
	lWwf/mItOJnh82JYRAPrYzj4DinHo7ypQNRstqFPsF0ug8OK6hu6erKF5D3Q0JhzHdvew24iXAx
	Z657vAnPulwWTKRoice5XYwOewFmIq/HTeCD6iLIMsZXn2TbbH6GXYyMvmbHhsBK0Zm5zBgxDYR
	s23Jr/E9GW/CIH0dUoyKmgvLFknDcvcUjTusr27xp4ptKgo/y/gJDf0kE3RDwV9n0npAMXlExPC
	U2X69CWvu8t/41IV1dH3y1saHCkp3kyjHBCtJHkUbdq4Ui/SKAGvIk1h+fyK3u7WmJmdN8f+u9m
	H7g1rMgfch1qhsgDChcJT4IKj7pJN4VgkKbKowbOTPPmjyXWhZ0OIVjFnLgvLYTpXHJP0BoLWxF
	zeQTpm2sYMED2DMfNnhXyQwgLQLXCzSLtw8MPR2hUBvk07rASM/Aire2VuVwvhpZ2zP3spicW6Y
	bvCbFfVLG7uIahuYqPujFD4IJ2ENqAqfW+ZyTwTX9wu1ZEjkvTUmwNW7N1avR49a/JBBcYgjGaH
	KBt5iXcEOLzXvlOsGA==
X-Received: by 2002:a17:906:9f88:b0:c26:19e3:e98d with SMTP id a640c23a62f3a-c4d6d8ae41cmr91002366b.45.1794138465886;
        Sun, 08 Nov 2026 03:47:45 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a993031sm56570566b.68.2026.11.08.03.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:45 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: robert.marko@sartura.hr
Cc: konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	sboyd@kernel.org,
	abelvesa@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	vladdrako007@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias PLL parents
Date: Sun,  8 Nov 2026 12:47:45 +0100
Message-ID: <20261108114745.125841-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CA+HBbNFiAF03WTz_N-_N8ZJantFdSBud0vZbiNw60_Oxju_=FQ@mail.gmail.com>
References: <20261020065430.1251541-1-julius@bairaktaris.de> <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr> <9699033c-a9e1-4b11-a55f-b1aa216c700f@oss.qualcomm.com> <CA+HBbNELhPAAZoUuXm3SrvgxiU0eMaiu5LB3wfup04_HuZ+yxg@mail.gmail.com> <729312d0-d48b-4c92-ac6c-98ffbb23d7c7@oss.qualcomm.com> <CA+HBbNFiAF03WTz_N-_N8ZJantFdSBud0vZbiNw60_Oxju_=FQ@mail.gmail.com>
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

(Resent with the lists on Cc; the first copy went to the To:
address only.)

On Sat, Oct 24, 2026 at 12:35 PM Robert Marko wrote:
> Thanks for reminding me, I have sent the IPQ8074 wiring.
> IPQ6018 will follow.

Thanks. Please drop this patch then, the CMN PLL wiring replaces it.
The IPQ8074 series works on the Xiaomi AX3600; I replied with
Tested-by there:
https://lore.kernel.org/linux-arm-msm/20261026120920.1667982-1-robimarko@gmail.com/

Julius
