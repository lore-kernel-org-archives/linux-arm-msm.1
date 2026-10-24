Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792851943;
	b=YwdOSXQpRAJoDp2qB+BaixTeFc/LQrSX73pJE1diYwqwdu+s18aW9gpLGQtwdJ1sSUyn
	 tNGwZECtOTC+bfBC63vxF8vQG3Z7dIqWAeDS27OxM5sUXh52/7ybgWErW+6A4YWl/eQ27
	 tH/Z4V1PGQrWpeX0+/TjBlNIQWh6sl+0xCS2kLa9bemZcZ86FI1hrvQZUil1X814CRuy8
	 KvQX9SkrAvPtUJKhR/9hpoGNqzglocP4tsm9u/6zYYQMhpbiLBCimtfzfMfd4HhsNgAbo
	 xGsf/gfVQzqpF6qpmXjg5hP68xAaP/3isXVB/lgh9diLTdAgTtyvHrkNwpNfrNWUmsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792851943;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:References:In-Reply-To;
	bh=cCphAvYO75OUmxhIYJK5YQNa9hTJbt+3TPGwsGv6BVo=;
	b=oK8t95WVR/ckWQ1fP5199EsT6ptSJ3Ao77mInSWFDk5QxAVdJ+ZiIj7Wg/0TEuKu/P6u
	 snE4QJR65kzSAc+bZVSAdKxe9yh+UTqeojwjjey2seKLatYO1AZLOWU51ZH1cLeuhTSJZ
	 QYpdZkc+5ykNPBxPpTuCZxuz6LFTPVUYPZvgzYP/Z2se+9vRKafWyFKs+YaVrkaHo68ac
	 9xo0ba/RS5ar5gmDtxSPGSYTs8YiT97ogLKLJVsIh7Url685Sotmk0y4S1MX40JJehg89
	 2zlrdPEg2ZuPFiP0plhL78LfYE1MxWBsKcS0UTYb3AcpfH4HAfCAUt1rZnN+krNF1UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=posteo.net;
	spf=pass smtp.mailfrom=posteo.net;
	dkim=pass header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=KefUI85b;
	arc=none smtp.remote-ip=185.67.36.65
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C3D606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 14:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0C3D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=1984.8680eb header.b=KefUI85b
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 1FC4924002B
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 16:25:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1792851940;
	bh=cCphAvYO75OUmxhIYJK5YQNa9hTJbt+3TPGwsGv6BVo=;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:
	 Message-Id:Cc:Subject:From:To:From;
	b=KefUI85bTXKsAWIn0893TnZmXpghcPmG/xWBR5OZohJzZVpwrqd4FHnIosG4e5hGA
	 pDG0Rog8FJZzE0MICpzxNeXNufxNNHfl7MXuexAq6VDw9qfgsidzyCy0fsL9obxfk2
	 DEYgG12YlWZoGM02woHH18EYGTUulbwpbQBaNIhSJLXymfkUNChC+w3Udo1CJ/5vky
	 EDDTdorYZxGlPPgWkybW3jNnrA+1lAsosn3M+Gr5dWkX9KGTlwzu65cDF1XSBudO16
	 DkYJ3/pbXCJl+qY2UltU/KtcsyAUqturv//NbERmR46RIcK3L2C3IyG49Ce6KT7WHJ
	 qVZY7wqgcR+yQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4jBhxq74NGz6twR;
	Sat, 24 Oct 2026 16:25:35 +0200 (CEST)
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
Date: Sat, 24 Oct 2026 14:25:38 +0000
Message-Id: <DMD4YWIP2TFH.23VEGM4QAFO9D@posteo.net>
Cc: <akhilpo@oss.qualcomm.com>, <andersson@kernel.org>,
 <freedreno@lists.freedesktop.org>, <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <lumag@kernel.org>,
 <rob.clark@oss.qualcomm.com>, <sumit.garg@kernel.org>
Subject: Re: Adreno 829 (SM8845) zap shader: PAS init rejected by TZ under
 Gunyah
From: "James Wilson" <james.wilson@posteo.net>
To: "Venkat Yadlapati" <venkat.yadlapati@hotmail.com>,
 <james.wilson@posteo.net>
References: <DMBYHSAP8KY7.K9L1DON3KDR4@posteo.net>
 <TYCPR01MB1184706197E878D59F9E82E629F642@TYCPR01MB11847.jpnprd01.prod.outlook.com>
In-Reply-To: <>

On Fri Oct 23, 2026 at 8:40 PM IST, Venkat Yadlapati wrote:
> Hi James,
>
> Thanks for the heads up. To avoid duplicating work, here is what I have
> on a Motorola Signature (SM8845 "alor"), none of it posted yet:
>
>  - TLMM driver and binding (205 GPIOs, own GPIO->PDC wakeup map), alor PD=
C
>  - SoC dtsi on top of kaanapali.dtsi, plus the board DT
>  - gpucc variant, A829 catalog, panel, touch, DSI1
>  - UFS, USB, SMMU, charging, audio and modem work on hardware
>
> I used the downstream codename "alor" for compatibles and file names.
> What do you use?
>
> Do you want to post the SoC base (clock, pinctrl, interconnect, dtsi)
> and I rebase on it? I would first diff my TLMM/PDC against yours. Or I
> post TLMM/PDC since it is tested on hardware, your call.

Hello Venkat,

Sounds good. Give me some days to clean up on my side, then I will share
my patches with you.

Best,
James

>
> Separately: I carry a hack disabling icc-rpmh QoS programming, because
> with it the display dies at boot. Do you have a tree with your
> interconnect driver that I can test?
>
> Venkat


