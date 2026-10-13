Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADBD43846C
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791856656; cv=none; b=DCn8EmIE6B3RksQJetLvnr+qFHqOq9Qy7gZHD1BjsdBiGorPX3Seqjks8eZOAUDLl9AKZufm/5P9DmWxtIZZvhbVSQc0FclwSdQOVmfcAThooKFaFSvHyBqi4SLMwmNOx1yEM3msF7+D0mVcUCHwVFtak6+Z0I0QFKm0DD5B7oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791856656; c=relaxed/simple;
	bh=OIqYKR7x+vapQREvHec6EpfZXxtTZMYi/hDKDHZqrm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XsBmCmY2K46diPvfYaC2fFxaz6JGNZEHsF3iyknGPWXTM+yBOyXU/DaygSaNmoi5gr7VYDPckOPcS133aMf/gcqyTuLABJZmmMIimuYeXRSWuez+FrVrywWsQFQlX28S7xlqg+JQpZhApAwquRfTXbDZ0hEI29Qlkae05gnHL0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2xW/qAF; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2xW/qAF"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a47d4fb7feso141764a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791856654; x=1792461454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ehjgEMj6/RVBDUJWsS+YpxJjQGwMw9r7SVgT28c/XUs=;
        b=B2xW/qAFFnVogtzldLK3C8r3rMFvBKygzqichQcRcpwx2G8LHF3PrksGC4lx1BFPlA
         M07jLgYIgTlJoANebi1MbiahUjU3l17SO8kuTrhJkb15K48gXnSLuiMHzFR8aqmUwjQs
         I5MhS5OLmqS3oTqmrbBk5f/GtvlFcdDy/O1WWB0gR+JEpZ5sYu0A8mt0KjoioBcRxVtH
         PKOKzUh+cPkSbKQcnif6vInI0JxAy45MqeM2Hr85IL7EATTk+RL00Sklu069Nt//pYXd
         c8NsUJqIpQ6831O9epq3cAkkAzJd3grjz/v/xHVp+KSNMwvCiq/cKchekPplC9HQUGth
         TKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791856654; x=1792461454;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehjgEMj6/RVBDUJWsS+YpxJjQGwMw9r7SVgT28c/XUs=;
        b=iKXtb/AaAei8be+JC8IH5TrmVu/n7v5D8+IEJJAKWaiXgueNP7ZM8gv4o27jqucYcU
         j96ZGmOPD7Lgk2e1rllTEa+KzY3wZxr0iVIV/nrgC1m0U4dlphnPwMQ8vNxhxWBRwXsV
         6nxtScunyz18QFpnA4ItBwl5RfsPpHRXVF9PhoMrfT9pDq7KGHaoZjd7bzQnzea8cNGj
         rRH/50HCoUiXsLnuZHJeBiZ63B/+SQliGRZd6EiVKOQwsfAXGwbLql8VvbM36deRUty/
         hSm39biLqm6Vic8GTqwW5VSaY2fGg6Ll8OcNMe/Cfwwi3OHhyXt7Eo7Un2+L0A268IDw
         KGoQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6G7yxzZSXpdmMtyiH/CCG7JRznhRmg4RluDvEHAYVQZ13ApT4Uj9kuLhGCE/StjCw3RAUqdVqeajh0ART@vger.kernel.org
X-Gm-Message-State: AFq9FYIRB09B21fjImTnxGc2DzGQjGZfNR+af8hGVo1EHLSMR6zMD+2G
	XhntB4IN8wl6kIlOQFVEGeswsx38+RxCdz3lo8Zr39aD8qBSpYoeDkVj
X-Gm-Gg: AYBFou137ziR/a83ZftYmLFbTZlX2Y439FVUuKmN1zz+wKp95+M819gLK44BId8vg9p
	aST1tXkiKz4Ozv/OixZS75j8q/KBGgvbDi6c+bhVgUcqvPRSihNxxzQfLwMIL1NOKCoo+RD9xN6
	Wo9gsc1z11yqQbeLGyWYBC7yb66Bs11u58S5KyjcUc1RsnmJBfpMYBILfRYaFTw9PEmODtpgnv3
	6nEQv1b4zqifPJXKUWEnVTx9Vjd8Cy4p4mtbJqkVj5jo5+orlRpupFnLykVezAZvCq82QjxdfO3
	M+raUIWXNxk+3XlCM5K8g+ou9lxaAuD5l3bBxBeU9TN2i9K0MSsjREAYbjLPxaOI7bJ3Ii8cySG
	gu1qluvCDC5Il7/ZWKQ0Rs7EVol5I3CNltktVZ5h0jGKlWrm+qrvvY9mTcCIZCYyxyFK2ef0sVc
	ZqCsqV1Rzi+TMucI93t2ZNWtxB3fViE2I0Eu79FIfWaBzor94vTdrpH9FDftv9+/yAEnva6LTcJ
	Nv92LJwRatuTQ==
X-Received: by 2002:a17:90b:1d03:b0:3a0:45f7:b361 with SMTP id 98e67ed59e1d1-3ab3a8a4794mr13965643a91.3.1791856654310;
        Mon, 12 Oct 2026 18:57:34 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38dd5864sm18431400a91.8.2026.10.12.18.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 18:57:33 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: jactry92@gmail.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	kaipeng94@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	liujianfeng1994@gmail.com,
	robh@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com
Subject: Re: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI
Date: Tue, 13 Oct 2026 09:57:27 +0800
Message-ID: <20261013015728.43307-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <13181dfa-b92c-43b5-ae12-912abaf79c41@gmail.com>
References: <13181dfa-b92c-43b5-ae12-912abaf79c41@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On Mon, 12 Oct 2026 22:18:13 +0800, Jactry Zeng wrote:
>I think we are about confusing the product name and the model name here?
>It is clear that the product name is Acer Swift (aka '非凡' in Chinese) Go 
>Pro AI; the link to Ubuntu stubble you provided also reveals this somehow.
I agree the product name / model name distinction is the right frame. It
turns out we can settle the product name fairly directly, though: if I look
my machine up on Acer's support site by its SNID, it resolves to
"Swift SFA14-11" in every region I tried — Japan, US, Australia, UK —
and on the China support site as well. So within Acer's support database
the product name is uniformly "Swift SFA14-11", and "非凡 Go Pro AI" was
only the retail marketing name used on the Chinese storefront, whose page
has since been taken down. It is not even a China-vs-global split — the
support identification is the same everywhere.

>Also, IMHO, I think we can't use 'stable' to describe this situation. As
>soon as the product is produced, it was given a product/model name;
>unless Acer renames it, this is it. The vendor can also remove the
>support page that you referred to sometime in the future, just like they
>removed the product page; this isn't rare; I think we always shouldn't
>depend on it.
I fully agree that web pages are not a sound basis — so I'm happy to drop
page-based arguments altogether. That leaves the two sources that cannot be
taken down: the DMI tables provided by the firmware (Product Name:
SFA14-11, which is also what Windows displays as the model) and the SNID
label physically on the machine (SFA14-11-QWU1 on my unit). Both are
model-name only.

I think the resolution follows from the product/model split itself: the
model property is human-readable free text, and per the conventions in tree
(e.g. "Dell XPS 13 9345", "Lenovo ThinkPad T14s Gen 6") it is free to carry
the marketing name — so something like "Acer Swift Go Pro AI (SFA14-11)"
works fine there, and users who bought it as 非凡 Go Pro AI can recognize
their machine by it. The compatible, on the other hand, is the machine
identifier, and it should correspond to what the firmware reports —
either the model-only "acer,sfa14-11" (my v1, following the DMI) or family
+ model "acer,swift-sfa14-11" (what the maintainers asked me to use on my
series). I'd rather not embed a retail marketing name in the compatible.
I'll leave the final call to the maintainers.

Best regards,
Jianfeng
