Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663405;
	b=3wQG/FtepOzGmu77Wq9hBylFwzAGdcIcAX1vPVqvkn1cqC22RQUwZSoul2PkO4pg1Jle
	 +qiX04qwWUoK0NIfnAYSMnEmboY5hs8oAwBCWhrFOLXtQHbaK6Svglot+LPRKD6OlklVC
	 hZsyF63b7L/xiSn0xoNKgh9END4Zv5QYBQyvH7vTigkK+dt5W+2SiCGjn1vwZAW7yrSJv
	 lQwbQ5IgYkp2vbx+VXqYNr4e6Az2gyn5MxrJGwLc4Fjzep38nwo1UxkkSz+oVD60zpjtD
	 JRJ30bZH33gJ5L5ieVFt8UFF/clLWWMsPARg7JZzA2LCqmv97zyJf1oxiRQ8oXuiAYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HtWcfzq6QYRKud0neDB6yUmZQgDuRRFbJcQVKQlnPhY=;
	b=Qryr1eRwNR0dyh7523FKa9B6/9ICyS9jLAoGp6uMyq3PS3IU9c3XfojrdvBl07JBV35V
	 x4XrQDd3O9RfVKdZf77T9Q7lW3+SZxS7Ke+UJtcz4EBmSe2V+JBeDZu+V4ImFTl3oUpkW
	 uYtcPLuBSfzshQVLRhd10A2uqeX2z2+A09NVnmYovgGewjmpcvRld5LAyUyJ01krv532a
	 tU9z6OERwxUhY/4i4kHZdLOUJATo8Im/o+xEO8HaB2Gn4XC1L0ROW8ErVhZNUDsx1KSfG
	 kjN5wrPA1Ln0vtMBUvCJAScMQ0JLiCYzZUSgpp0+bScLQ8asX+7yRsrFqgu6oqy+J7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZ8omOQH;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82FE606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 03:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C82FE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZ8omOQH
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b51284667cso46660a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 19:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795663404; x=1796268204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HtWcfzq6QYRKud0neDB6yUmZQgDuRRFbJcQVKQlnPhY=;
        b=MZ8omOQHP+4FtzemVgluZ07wogDoVxnEWU7QChkmcm/I6PKG3R2Sx40QVCkasgkmvR
         k13Gpx4dEKzkvwZA64ZgN0DfaVuP8PAk1Fkeg1wtrtUewQ66j4Ju1z49G+gfiboOKgjK
         OplyMiqF3oaKbYCHT+RaW21OFvkfl5925+QnTJYXcBcwaAbbRDdWIJhtfEDZ8285sWb4
         8Ad/EDVAYOuMk5T8PiRP4twyX6+JM2uEe6TntYruNC5tJTnNH1fUlTUADZa+yxTb+Ehj
         +h4255cvw2515MIno6yVFy1RXGzuf2ZmaCkv7vWkeb5jRbGjEZ7eYCsOBll1A1eD5yNg
         pSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795663404; x=1796268204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HtWcfzq6QYRKud0neDB6yUmZQgDuRRFbJcQVKQlnPhY=;
        b=wsyEJB9d4/YYIE+pPMU2L0R6JNihY6XGj7wVvwBuV2MzR5ijKMkxGBoT+lqmmMXISQ
         ch+Wnhvj/bmre08HqWB7ZqdpMMLppCvXWx+JkJdLwFZ214IUMd62IHOnM+BQ99NM2kuV
         ww1/WlruaoBM8q1jYKSGYRIintj17fTq6216YXq6niV/1RHx4TVEXHXgSlCIA2zrm0HN
         gU+MKXL+n7Pnkx5jze4y6IZ5oppa+BjGUC0HC1NRw8oHmYxxh+JiughWkPC3XH9Nd06l
         K55heQ5CispRKrOHmr45GYy7Ewt7tij7edsh9fgEfpGXiEjCTSX4bykGRxrUMFPKXsyf
         YbNQ==
X-Forwarded-Encrypted: i=1; AL+hErHjI/4ZN/ah+UBXN3TwYZgULIwRGrIWQ4QvKZHginQExU0qj4W0iLSmUB6+/c4CnLlaIkx5f+TzhGpGYDqK@vger.kernel.org
X-Gm-Message-State: APuU4Z95/Z8BoK2XRCo4PqC4Oou7euTzs7QPjwgUKQoLI2A/Ft7kyhXw
	Pu17tN1xvUB86hGVRxGd9C9W29LOUOQ2lTpnMYMEtUPLcVD5enUPpHUb
X-Gm-Gg: AZFdTZdv0gSym+SK6fCSGzRt3lzxhejmn3SCvBAj40FZW7ftrDh36Q0NzyOUC6IzMjA
	f5iXd78PVomRc7VO8Ull31coPHM+7b3EC1qGNF7SVw9XlgPcZyTOgckeEUegWNwUBYdYt4vNmTe
	VNNti2Z6NfDYpdYemzfgwpVRiDEQOcuCbeylDBwrrZjU79CFLf62tRxAML1aGS3MOtibNyaZe/k
	rTg+68ciuVgiI2iQ9AMmfPNqvn+ldq+BZMdPWHJS14bbsI2NcQQa8VSJ24rb8RCzc/JbmA8KVn+
	QzNyLUJv0ko03rDSbtL++0Ik3EeilcMZhrh1kyZ61Csrep8S4eT3+fu6p70AKjxirezgVboEPSr
	qmEYUCKuraI9w2r/Y/kREwNIzwKllxqsMnyYhxijlC/jHfBXL4dQu5/R/AmJEYJbEgTNwYk88HR
	JM0IXDv9Wy2U+GSJQrXasvpxwj8FpPUnBn92cH7gOXsT5TYepyB5FDx8cVjHs5yi0jDySXuoTDG
	ls9B4OezGVNMKxfZ88OQcJcxDgJlUppPuR4Pk110l8pQ4kB5jlyd+UAeN52b1APcXjm+oxwULx+
	E4yaSWluh1yDZBlPW9NwvHHEOOyNJjH9
X-Received: by 2002:a17:90a:e705:b0:3b0:9e2c:9b55 with SMTP id 98e67ed59e1d1-3b41c803ae0mr28913249a91.2.1795663404159;
        Wed, 25 Nov 2026 19:23:24 -0800 (PST)
Received: from localhost.localdomain ([240e:36d:b08:5b40::a60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdea2aed207sm3916423a12.11.2026.11.25.19.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:23:23 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: xiaqinghuan@mail.ustc.edu.cn
Cc: abhinav.kumar@linux.dev,
	dmitry.baryshkov@oss.qualcomm.com,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	jesszhan0024@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lumag@kernel.org,
	marijn.suijten@somainline.org,
	robin.clark@oss.qualcomm.com,
	sean@poorly.run,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dsi/phy: program PLL_SYSTEM_MUXES on the first PHY enable
Date: Thu, 26 Nov 2026 11:23:15 +0800
Message-ID: <20261126032315.2226704-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117052047.32129-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052047.32129-1-xiaqinghuan@mail.ustc.edu.cn>
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

Hi Qianhui,

On Tue, 17 Nov 2026 13:20:47 +0800, Qianhui Xu wrote:
>Fixes: cb55f39bf7b1 ("drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared")
>Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>

Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com>

I can confirm this patch fixes DSI panel on my Xiaomi Pad 5 Pro. Thanks
for your work and I'm looking forward to it getting merged.

BTW I wonder if this mail is ignored by the mailing list because from this
link[1], I can see:

-- strict thread matches above, loose matches on Subject: below --
2026-11-17  5:20 [PATCH v2] " Qianhui Xu

And the mail from 11-17 doesn't have a subject.

[1] https://lore.kernel.org/linux-arm-msm/20261116150334.78710-1-xiaqinghuan@mail.ustc.edu.cn/

Best regards,
Jianfeng
