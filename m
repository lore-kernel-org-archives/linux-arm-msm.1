Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196434;
	b=hfvU5LAiOAWwl6pEgtNF3S5kiODpaLsuyhsZTxeI01k0h7XvGG3nWkd7O2xEyZiMt3Pv
	 8pILx0R91Gv57CCYRyPCrvW6tHLiUFLviEHFYeI48gs95VO2L7R1tmCdLiDVgeiy5EoTI
	 B7ixawHsAd+fQnyYLliTrbbf9mqaAwNG/gDflvJmRpyVVZfdBOKQM6fTI2XYvqvTHJ2+8
	 6At0vQIHpTv76LqNUM6kP3qp4euWr0Ivala4tHkn91YYTlKlBNHfaiFXNHoIarmkjRV7A
	 NGtMtO9HtJ6va4JIbMkES28Z8iOtNJ3iNHHJ7Eb/OLyUjj42Ipww+4V/0xBa807wqGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Uq9H+1lFYYvgo3IDYWApxfWNUbzn0gKG5Ril08BpDPA=;
	b=gVR3b0r4ao0R0Rjd8rQgt6cjZWbOFMd8ubevgw/0mtPK+J2OH7sL75JowzNJ3ZEjVRGU
	 4NybQa2a8YjDhjRuP3cqoZ/anXoaZG0A5ieTc8Yiy8qhkLvJL8jTcijUSDs50MJGtc3GA
	 2cMGLavIagGxDHSTiFo0iR2UYj456TLRbsfWHA4a8WiE8i1bwT8k0YAfYAjSQ12Eombil
	 d8Ss9t+sOJZG8pHEaXivvfVeOeJhyYk86YXpqNwKfcQqTtE8R9XAM7rimfLWmzc2jrx03
	 s4i11H/trYvLo3CjGbpS/zmRfok++XNtdY+b5j4B9eL7abWoM2AEGyLuLEiPv/Oav6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oj+kBFl2;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D82060A260A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 17:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D82060A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oj+kBFl2
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55d03bfd477so13575811cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196426; x=1795801226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uq9H+1lFYYvgo3IDYWApxfWNUbzn0gKG5Ril08BpDPA=;
        b=oj+kBFl2mFyou4ugg5xyx756ynmWosuj6EnM4EqEifbQVF1upP8tAc4NC+4u3DD+bM
         B5e4mAnLzH06i/ryZMER2uThnbcQvc21pxmQwNar/yrWX5dizUq6B/8NTVgufjjJAB6f
         hP30V39JUmBavLgizJ6nXAkIrWHnwhDEUKDbQgkjvdk14ePChjaDJtfk75hp4BHwYMIt
         nV5GI+F1Jj97v/2pANN8X/4yregVxxUzEqcyfJ4kDgK+orPkncMGSpEjxd81u00Y+fIg
         QZtP0J2E/MWURxT5w5qWOPPgUK9BUS9qilHsKnrrJKk3FTNKPZ6NcdvVJkWL/+Qn4bja
         wCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196426; x=1795801226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uq9H+1lFYYvgo3IDYWApxfWNUbzn0gKG5Ril08BpDPA=;
        b=XhWrjg9i9eV/DuOAOCiYYYjarJ/sz/GAEbEoHyePAC//PQh+78CY2DUSagcC1LXHw1
         1qt+okPjNvPNE+5RkddtLuivoONTNZcKuZqxxCs6XqsuKFgdEAD7WCWhVcCPHkI4f/9A
         c8o7EmGcX9TvQLSnwdLFi4KSGpBQGwWxEioxMWZGmZvR8H4LwM9Clcdh08ymKrEzFoFI
         JZ4bp3Lnpg8gM/hu43exz37iKdfPvuSfRKTaIUkUFw9G8EQ+TEopiy6J5XR5fQD0Gkxj
         7ne1mnBXM2u0hjLt/pcMQ0Gvlt5KyZUxWDKU/dcsbI6uBE8xP5bLp0LhlBa7eVMyDXdU
         VWAQ==
X-Forwarded-Encrypted: i=1; AL+hErEiFywUgQGFWbO0hRU3cKqFJLrvNNCtPsVcgYyJmSjGWdC4i1/L6uvvYlQhRoExQSzS5UP4rrFpV7EKIU8H@vger.kernel.org
X-Gm-Message-State: APuU4Z/Oq2YQEK9gLj99WTShL+uqwZJl1hFjqKOMODsyTxVBFx2Wt51g
	wJB/bdF6x1ASVrgr1uR7vWt1TxFxzsn2vBpOWwqxp4Iuso1in9lL69uaguJzL8s8T55Akg==
X-Gm-Gg: AYBFou2Ye3WTqCoH+gMzd6Qz5WpSZrvDZ3iqVNrjetHpoEZetkfQr/iXmJbtTRqInOj
	/DuhfZKxNgXY/w358zyJfAXHqYYNsByYfbfcrHh6BEeX4lcAstY16/F92yU/MQAw4lTsfBTsHm6
	xMncw+CA53NVZqMmWvyKmxklrJw/i+/qLJta9C69kNOT+eds/Uffh7FChPDHUk57fzkubyzb6OJ
	f8Lume1RLMQfPoXmw8fnyjC8PsugsN5OXENL+Ofovrw2mk2fDrPADodz66uftDpeT08cAeLdOgT
	PEiToiyXAfZ3jifIOo0UgJwNTMKolzea1oym+zwm6f83c7N8CF0a8FuePq0iOoTotkfN6F90wYs
	ecMeqwr5Dq4u/q7sTM2VogZCFvPVNKDGtmOBUEN46tCvNiHqHSFyf0FY+A534UHLwD1+9Z5gX4s
	jCVpdtLmm/6KNQC8OwexlhToSxB/Yu4EfACYAdcLB0h7BvN4kwFKu3ToxYkewTaOjEjB0UDG/A6
	CWx0FP6HTDg9h+ojCqW3Y6w4jhGyiEJRe8PtvjAYySHWeezMCjdSRE7U+D2WoVa1JcMDyYaKyMx
	cqWZVslrzlqhcF1qEuos83R1c5Lf2kiGd+0IrXNduTgJOa2FjlOsSsRWpQuwCBMiJpnOFu9XrIU
	K46JURGyGyZYjwWQjqBvuoZkVz9a9fFvKc6x8lYJX+2FMXbwlgxQeJx/+6UuI9S7/LmkoKj/XTZ
	SkZBrnZbQwxBJtOotpfetCia5bxdx2WBGiOWfjFXEt0Dmnj7rUJZYtcIog32Hk/pkS0rIGdKscp
	yWDVuZEyklzto7VF09H2jP4EjrTfz79ROdOXdILUwFauQ==
X-Received: by 2002:ac8:5d93:0:b0:533:39bc:efec with SMTP id d75a77b69052e-55d76938609mr70320971cf.2.1795196426393;
        Fri, 20 Nov 2026 09:40:26 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:d420:4621:169f:8773])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm28110831cf.28.2026.11.20.09.40.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:40:26 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Allan Siriani <allan@fatecpompeia.edu.br>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] media: qcom: camss: Fix the X1E80100 lite CSID paths
Date: Fri, 20 Nov 2026 12:40:23 -0500
Message-ID: <cover.1795196107.git.jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The X1E80100 CAMSS resources, which Glymur reuses for its CSIDs and VFEs
(also with Nihal's Glymur-specific resources [1]), have two problems on
the lite paths:

- the lite CSIDs are given the full CSID clocks, so their CSI-2
  receiver is never clocked and they never see a frame;
- CAMSS assumes CSID n feeds VFE n, but X1E80100 has three full CSIDs
  and two full VFEs, so CSID_LITE0 powers VFE_LITE1, CSID_LITE1 has no
  VFE to power and CSID2 powers VFE_LITE0.

Tested on an Asus Zenbook A16 (Glymur), Linux 7.3 with the X1E80100
CSID/VFE tables, streaming 8 frames from the HM1092 IR sensor on CSIPHY0
through each CSID/VFE pair with media-ctl and v4l2-ctl:

                     before          after
  CSID0 -> VFE0      8 frames        8 frames
  CSID1 -> VFE1      8 frames        8 frames
  LITE0 -> LITE0     no frames       8 frames
  LITE1 -> LITE1     -EINVAL         8 frames
  CSID2 -> VFE0      no frames       -EINVAL

The OV02C10 RGB sensor on CSIPHY4 through LITE1 -> LITE1 also goes from
-EINVAL to 8 frames. libcamera still captures from both cameras. I ran
the same tests again with Nihal's v3 [1] applied and the board's CSIPHY4
link on port@2, with the same results.

I don't have an X1E80100 machine; testing there would be welcome.

The series applies on its own and in either order with [1]. Patch 2
touches vfe_parent_dev_ops_get() like Allan's "media: qcom: camss: do
not fail CSID power up without a matching VFE" [2]. They don't depend
on each other; I'm happy to rebase on whichever lands first.

[1] https://lore.kernel.org/r/20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com
[2] https://lore.kernel.org/r/20261111135338.27008-5-allan@fatecpompeia.edu.br

Jesse Casco (2):
  media: qcom: camss: x1e80100: Use the lite clocks for the lite CSIDs
  media: qcom: camss: Map each CSID to the VFE it feeds

 drivers/media/platform/qcom/camss/camss.c | 54 +++++++++++++++++++----
 1 file changed, 45 insertions(+), 9 deletions(-)


base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
-- 
2.56.1

