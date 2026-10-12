Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000A34AC156
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 20:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791838666; cv=pass; b=sXb3mPOZvMpnDL2uCxFQWMaRxnBGJq7LqrvT3pXe+iJOoPvsdxIOU0K5KnFOEW/4aCyH4yKb8ATBAglB3F0kt6T8cRrrdxnDWomxZjOMhkLDYTkn+V/3EXu5UrFVwW2z0F1wVKjtKgbcQvGmVdmQm691lPmgWIKGI1orWHOA4bU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791838666; c=relaxed/simple;
	bh=qfhNpMKikTUE4GXuTXMhSz598q5HToAtxwd6kVZHfsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzYMI9TA2DWz6WrXJgNnpltaST7nik7aWqfyJ6rn7bzhtrXuvrM9CE7SEW0mxwDS1SuDRr1NZS25tQKc55yDb6jpti+DyOD/YlONZHxHLPR4acIZ/4gPvoCn8fr7pLl6DNzaYZtgRCmfv5qMqrA6Xc90mCrej1Z7Uc999MUM4E4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bbz16QiI; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bbz16QiI"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcb2ecebb4so1710559e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791838663; cv=none;
        d=google.com; s=arc-20260327;
        b=B1dctbS/1iHRgjL3CqMsAp3ifSThvqmx/wheNMouTtpae2M6F+g4VWNyN6idU2rvQE
         SrVEu6pETOzaAGv/dY95sXc7/jda3mAPaFURbhClXDlrHWAbYa3Yp11U59DaMSXrxDUE
         lZYnESKx8uQK+Lewwoqb9jUegD6WmIfMLVsGI6k9MwvH2gonRmTe7BgV9qPIPUWAEJjO
         t8L9Yogx+6Yclt8+XQzo7xhOn6ArmJ10/OZs0N6Zc2gQ9E37/QJRq9/4/Jn+CCC1u2KO
         mdxmTAOX6PuLGA6GnpbVjO9y2EEiX7U6jfP7wQ4mFEmqC4unlIv5zkj4bEcqSbMz9NyA
         3iZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jLix4JrWc+gaL1YtlKdXsZNF8UYItzc7REKQDH8C5y4=;
        fh=fKwPzt6XTTNkk+XAq4rk10I5pngsbGk3F80qL/k3qNs=;
        b=Gws5AiqMC559Ge/TIxmwjS/BGiEHP3xjgZJxm2FlJVlT28FmR81rJcaolmvZudAfnU
         GKLz62O6giacPxPjnyUz5rUvcQY57E6nItCi+r2K4yTe1EEcNTRKcIYguIJZCS4vswFw
         0NOehLvh2tNaqBR3cGWpmixG4rNiq0ueNf5UxSxx03EWWTfqB7NQtFdW5+2emxgqoSN3
         0HN+J3Vw4ytgcBXlTCD+jJUFVBHyohKbNNQ3rv0acAYP+YhtjaKyeJrhnCVK6YJuCTGP
         KUD6P/aXy6gBBNT3zBpDRv4I71pbwyHxLto8yQJ+iDyNOOvyGJv/FT0UMVBlpEuiNk2R
         FTcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791838663; x=1792443463; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLix4JrWc+gaL1YtlKdXsZNF8UYItzc7REKQDH8C5y4=;
        b=Bbz16QiI9Ar3XCnJJS2neAbkOd1tzEK8qJMur6Va/i2SojzGri0Z/wTNMwdO0kbDDm
         JONh0CLLZJhp3l7V3dbmAhiPsSh+TfkDsuDw+tWbXGb6okvORkv5ccMQYwwTdefC1Uh5
         B8T85pvKrT3DTCkeFmw0HKAF/Kx7mqsXEw6o6nrT0XmTo+Ds/8PrDYvFI0oWA2p+l9oz
         LNtY+KPUlRTFSEbzn5dxe0YBvA5bvpRVdA3S3Mtx5k51shqQmRg4+SWmcjDJ+oZtB7cC
         E791JiFSd+XewQgw2D69Ugr1dCsZBKTw3XQMGT8rRj/PHtE18OABbAAzf6TCElUeDSyj
         Hc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791838663; x=1792443463;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jLix4JrWc+gaL1YtlKdXsZNF8UYItzc7REKQDH8C5y4=;
        b=PwORKAvaTch1JxwFjZaCN92Yj40lINA+ucZSXgOIYF+NiScnv4nW0w1QKaKezD3nsp
         qg6XEKi5xBhoxHS4iZHXcxJ1EQHe1JTYhmEvGLeIpi+T4/0Xdib3mwS3KB6iVWDBppWI
         qVBsQoF8AwEgqAu2JORa9nNzVTBXb0wNDUbAbNHnKJ8BKgcxkWjm+V0sJjBqHqKmr8cF
         NpD/tZu5c9ZYg4IK3lEvvPeGEiwNhK/cr843Q1035fxD1xr90msTNWB7QwSpntnCgryD
         ALGend1f7526ab3FRSJursbfNOAVswMlgUIG1llEUvCNjQLvXw6mbte2Wvu6+BtgjBbd
         Oy4A==
X-Forwarded-Encrypted: i=1; AKwUvBzx1jDfre4W5bSIbg2EwDznC52jUuyCWNDc5XDZzc42Bi2JtxflmyYGYfRYLYd6acUdRbXgaZrrqwucH061@vger.kernel.org
X-Gm-Message-State: AFq9FYKYJ+WBLvVc4CPIgiNib3T6YL3cOi6zzyRsCQsZI500ISVBjozF
	VRIVdpiWmjomCTG8B35LIjfb7FRfWGayYo63IWzJ4UbrCjz/yJyHeTXKaIIqXx6awZvOslEDoRC
	Cn2EJUjvx8apSsSXBoDY9mSLLcjtQDqY=
X-Gm-Gg: AYBFou2iI/uH4AfeTUGsCiRuF1CjzalGafCvGbMK9ElODtg57u1QuKQsQUvseQtv+lf
	JwCoUpy3l9liJh2mESUB6fNWeMB5SPjw78zTxOy5QhlSkvT+DqY3/49ATdEmpNA6fERp8LzN4/+
	th9U5todBXSQuxC2ZZ9QQFGpMOX867Yte2/76eGMgz8qEZlsz1cfpUvN+8+GKQiHtbTc71LPbqU
	VPGqO1JC3VyU2mFsgin9uqtkvGHzIEynR01IdfusSirv6aFPFYgN8Aqvy7QX5vt+vEPRrQucGjf
	C7CnLNYm9iKIGbOKy5HYTHpyMg4Ubgzu7g47RJ8JUtLvMkICKxSMV4gyQw==
X-Received: by 2002:a05:6512:12cf:b0:5bc:d0fd:8c13 with SMTP id
 2adb3069b0e04-5bcde6c99b0mr3562593e87.30.1791838662732; Mon, 12 Oct 2026
 13:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-sdm660-icc-sync-state-v1-1-77b8d2501cb2@gmail.com> <0ee83fd8-dcc2-4666-a864-de52fdef1c7f@oss.qualcomm.com>
In-Reply-To: <0ee83fd8-dcc2-4666-a864-de52fdef1c7f@oss.qualcomm.com>
From: Fabricio Akio <fabricioakio@gmail.com>
Date: Mon, 12 Oct 2026 17:57:05 -0300
X-Gm-Features: AclHuK9R2roF5QsBv8_V9u4Vazf51mZ_EeLjSM2qy9Ih7_PcYXeb3AMjJuQTvEI
Message-ID: <CANxzQdH196iquX=kKFm450W63E6=v9H1N-=OQygr64z90a_11Q@mail.gmail.com>
Subject: Re: [PATCH] interconnect: qcom: sdm660: Enable keep_alive and sync_state
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexey Minnekhanov <alexeymin@postmarketos.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Martin Botka <martin.botka@somainline.org>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> None should be necessary on 660, except on bus_0 / RPM_CNOC_PERIPH_CLK,
> which is not associated with any interconnect master on this platform
> (so it will actually get disabled through clock cleanup!)

I tested removing the keep_alives on a Moto X4 (SDM630), on the
sdm660-mainline 7.2 tree with this patch:

  keep_alive on    result
  ---------------  ------------------------------------
  none             resets during boot
  all but bimc     resets during boot
  all but mnoc     boots, powers off in the first suspend
  bimc and mnoc    boots, 10/10 suspends
  all five         boots, 2/2 suspends

So on payton those two seem required, and the other three not.

I also checked bus_0: it isn't disabled here, its active-only clock is
CLK_IS_CRITICAL at 19.2 MHz since your commit e1cd74b6dccb ("clk: qcom:
smd-rpm: Set XO rate and CLK_IS_CRITICAL on PCNoC"), and the RPM votes
logged on the device show it held at 19.2 MHz while the CPUs run.

Would a v2 with keep_alive on bimc and mnoc only look right to you?
