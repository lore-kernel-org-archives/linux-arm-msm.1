Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB48037999D
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 22:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785017167; cv=pass; b=hQTfXHj2eeIzkMBI0IZHp5l5fnxsrYv9sqC6Fzq4HNU0QeYeQBf8CUjvLe270Cx/sxOCf3zPLX1CLy6RxlXheqCrBW9OJyC4ZgqR8TCAcQXVjQhZEi+Il2z9ecpw78aOSTKmtKFUgz9IN2qD1cnQRL+359wFb4GxXyIIgbI+y6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785017167; c=relaxed/simple;
	bh=PuJxkWbxxjGwAHNUh1rcqgo6iNIRPAowfqugEAiHDOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c1kzN8xICcVcej/xo3cdpmOLryQ24Qg4pYfQf2lreUdJZtdEH4i7Wltv/UHtMTLTFKxmC+Hh/xKZi4AvNnsUCTAlCHbInDqUDTygyxF3o4920xnz6mLUfI0XbwQCS9+A6ACp+a1zuQQC28/derDzPdDS5Xkgi1UzY3CQNj8wiOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=qzwpqnwu; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="qzwpqnwu"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cea3004256so17174865ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 15:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785017159; cv=none;
        d=google.com; s=arc-20260327;
        b=jztItulwAdMsw0IJyrUDWzEYWnNXuYBPMI/aglAjAIOvgV0MXV7+w87MPtrQ7RM6Xd
         D+smYrc18T4iMZXc1SPgBQoNw8/1BzZStlNvOQQZHhH6GKOG7BxGDmcTjA/GdsEGbHub
         VSiDA4HvxOJK4lMcWGvY5W5JXI3LWi1b49eiYuWo55+cFjG6QAufOpY5NFAznvLCexDH
         45cktxOka+ZgVKdVMa35pSH+1OeVwzlItYPPUQlGiWALwV/PPC4e9nnvU8APVDk3LypD
         F8tLBtBFyI2aEnvYPmMthaX7kmuTpCKIQbdEJabnHZzrftmgEQb5U1ZJXueLAUC6ctYL
         SkVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zImywQZnzpvQhiwmwZ529O7OAp/WrjEjQ2gnTEWU+lA=;
        fh=BCJrGS31qX5YUiIDEpAP0WSHRMzpSrkEWQc3/a4a5+o=;
        b=RKESxhjJnuDLbBbJCW/ZWZuy9dOUILj5l198ryAjjeg/CT+6B/l84A5ZnoGWdp9Yt7
         UvGQKGqzz+me/+4KmqkPPYkFG1m1JnuncJC2iHhQI6AAnQIuleLpwTDoK19nxGECx5+M
         cZn7AFidynVSmK6lzGLa3floFTfl3jFH7U4qFYzTfHEEwlcHgRZD4c9uYdi+RRU7iTyF
         za6ED3EZbZDq4kRWPOajeEibHPZf4yKunDMS1X7E51n+IKsdxDsQ6dlZFt/JJiGQW6rV
         +C4qmxWvdlO0EVEWj1dr4xBp50yMsVKXAddDpjFvv9pq7Qf5XK9+MzDEB1WfSvSCjAII
         F14A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1785017159; x=1785621959; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zImywQZnzpvQhiwmwZ529O7OAp/WrjEjQ2gnTEWU+lA=;
        b=qzwpqnwu9BV3OhHOqDlLIsbmurMYPVqzAgOy/8gSMts1FKVlMRVz3xH8qRjezm5kCM
         8EL6CfaKxyBoX3wmLyfJVT9t9ov29OOtIYlCal79RNrbkRxslakqdpqkzMXDWb41uvHQ
         FONox5h1KSTnoLoFadk2M+aBCaoUKhVAclqV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785017159; x=1785621959;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zImywQZnzpvQhiwmwZ529O7OAp/WrjEjQ2gnTEWU+lA=;
        b=EEVQ4CkdKsT3zn3Vom+HB4tTlKHKkIl9ERVGK0Wm1SHzwf0Isn7qlhYFU34YMAMN9x
         SQUg5qr946JfUsRQu2jiJViPRQeQI3en5tQaGv3SQMpwkNkN3qgYBJ7nCnrzEvcb6yMl
         x3FA7PuZDJtAejl6xqXN+ezLqC45ru7ywW7guu2LLZP8nNWaRLih99gijJ54Mq0JIyUX
         UDA/8mqAthcHNPiBso4Y+WlsunC1nxSb6YEpi/1bVMiXT4sY3EC6bgeGzv8Cu4jD4Crh
         rm2erNVvJhTbgNTUI2m7Hh+/pNQi06QgrlzVuBylHmnQAwTQ+OgobHOIM46llYBhyll/
         Cqpw==
X-Forwarded-Encrypted: i=1; AHgh+Ro9HL2zoyd74lx8Bl27lgs8D7EBAZ0w7vmlBLCV7q8DAZSz1lTuZaY0gYTgLVR2sSL+XMxB55niQ6ur5QXh@vger.kernel.org
X-Gm-Message-State: AOJu0YwmR/OJPe2RDnfX1AKDgsmm/PcIgVwMn7iZrXFOGVwFAAhd1U5g
	3SMa6JYTddY6bWpQK2uqXEbmUQDmxDRFSHuXaRAmGRDkPseNbBBthQeUKtL4Ozx4ScSDYuLdEHT
	0NaNIOAdC3G7M/uhSByGQZFoSgt5oe6XcXP42OTMsug==
X-Gm-Gg: AR+sD12r5V9GjaKyQ+HEMwUYljM7XN3ElS4Y/EGeaTCGvVXRaJTLZ/3G62pKuQ2ypwF
	5Jt5bqSSoRdpH88Y4FEe1pGE/KYYu8cdUs8rvHPH/gALF8BKJtkQ+ZtH+Zl03TO9lQZypnDJWqa
	nTNcQlpxf46E1uUH8uBruurOMfeOsa4ZZxAW1xL9jUKkU2AH9EXMozqFcJbaeeS0Tir7hXVDyW7
	JcVtgCLc1FeA35PJBeBt8z0CK+IAHu3kQmv8vOnvo8e/lFJARB+vD9H4G6qN5iV3TXFafALPw7F
	GkK4gmRQb/rk+ByOwIrLeFon4B7SAiMlvijnH45Q8C31cTpT60KXPbEBrGnREz0Hm3Zf8bZxWa5
	uPte4GDOp6zseCigebTtf2FvXUJGNQ/YRSOCF7y2v1NohcnNSaUqpUg4jjAfGGKo/hJiVpLAYhC
	wjUxjYT8oX9X7cZxNYkzO5Pmd8k6lhbTEaZG2JUdcbIZnJNe9c1w8/aw0rZJc4
X-Received: by 2002:a17:903:22c9:b0:2cc:864b:539 with SMTP id
 d9443c01a7336-2cfde687914mr33554325ad.6.1785017159017; Sat, 25 Jul 2026
 15:05:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
 <CAMVG2stKmNxe-mdqbqO4MDLDrJCiNXw9kt8SA8egYAmByf9fKw@mail.gmail.com> <0eca3486-57c9-469f-b846-8c10ec07ffba@kernel.org>
In-Reply-To: <0eca3486-57c9-469f-b846-8c10ec07ffba@kernel.org>
From: Daniel J Blueman <daniel@quora.org>
Date: Sun, 26 Jul 2026 06:05:47 +0800
X-Gm-Features: AUfX_myiHAoB9UrW4Ep9Nn6HkjmTDkhFOjfKf8GaUMMaVbSg4cGPO6RekbYQPSY
Message-ID: <CAMVG2suGdLUcA1gCjNq4xi_wq8QJhx3LeLcNqDJpgBUZLZ-2uA@mail.gmail.com>
Subject: Re: [PATCH v12 0/6] Add dt-bindings and PHY updates for CAMSS on
 x1e80100 silicon
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 25 Jul 2026 at 22:47, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 25/07/2026 14:47, Daniel J Blueman wrote:
> > On Wed, 8 Jul 2026 at 08:06, Bryan O'Donoghue
> > <bryan.odonoghue@linaro.org> wrote:
> >> Changes in v12:
> >> - Updates camss sensor find method to find the sensor in the CSIPHY port. -
> >>   Neil, Vlad, Bryan
> >> - Drops dependency on passing polarities and positions. Moved into CSIPHY
> >>   port as agreed. Neil, Vlad, Bryan
> >> - Omitted mux to CSID as discussed this will be done when splitting CSID
> >>   out as its own individual node. Neil, Bryan
> >> - Updated Reviewed-by: - Loic
> >> - Link to v11: https://lore.kernel.org/r/20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org
> > [...]
> >> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >
> > Works for me on 7.2.0-rc4 with 'qcam'.
> >
> > Tested-by: Daniel J Blueman <daniel@quora.org> # Lenovo Slim 7x X1E80100
> >
>
> You cannot test bindings and I doubt that you actually tested even the
> driver code without DTS.

This series was tested as a dependent of and together with
https://lore.kernel.org/lkml/20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org/
and other dependents on my X1E setup.

Thanks,
  Dan
-- 
Daniel J Blueman
