Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091402;
	b=OpyuaKy9baawdtBncE5Yf1vF4yyfWW2F8WBthvspVDICb8m9wepdIku5UPagmRmEHH4r
	 ucpN3bIGJaEQM7Z6XBM93g4xhbNx4UjdCy7Cpq0qE3B4ngRdj02TQWktygyY6RTqDC1ra
	 KAav0TJ+v+wmHLNSm/VOYTgxkCN0PxtxsXjVUccFMJcbV2D36sx4bGjp7MklUZdIsvDb0
	 Wgv3I11I0hmGDVDZQsbcBuROCdvGi2TXA1aco7CRjJuPcqVR7BhnKCXKkYsdcbPS2+K4Q
	 esQMa+1SPQwlO8IOO/F0Q/dUYmeJZS4Heni7ETY/TJUmsoDsos8Qe+O+Ia5a/nTHgnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091402;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:User-Agent:
	 From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:
	 MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=PpUAjffc3ygpdLyFEy7XL2LBPpt+TdVv1xCfzr7NnnM=;
	b=CYfmS84MKCZrsZSTq+4I9hVRei/geP8OP7JgzPTrp9PKgkIrwfZFbCX6unclKXPntxbA
	 eG4edim1Hw/BurNHfDfM9+a7Rp/+8EkudmAS9n0pUza5ZVQi7eyo8I1DlwvHjhnegE7r0
	 EvNc9U9ldkERkQSZGXE42k9FgQCpi60P8H/Eg2RyEE48g72jVHsk/HDxGHdE9DAznNBES
	 Fsz0TbwD2CfKyo/6ogVi+fP3uz1UTdlXBJ7lf5ry06pgmSbeciHC+eU4nVvpMWZXRiauR
	 l2+3RO2d2lUS+Rlmj7HlnPpVDtIBRM+FujeTVR0ZxC3UimcE1wDAPouPGjg5TQiN6Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=seaslug.moe;
	spf=pass smtp.mailfrom=rsend.seaslug.moe;
	dkim=pass header.d=seaslug.moe header.i=@seaslug.moe header.a=rsa-sha256 header.s=resend header.b=G4Xkt6P0;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=bY+OoHeK;
	arc=none smtp.remote-ip=23.251.234.57
Received: from e234-57.smtp-out.ap-northeast-1.amazonses.com (e234-57.smtp-out.ap-northeast-1.amazonses.com [23.251.234.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106BC606A324;
	Thu, 19 Nov 2026 12:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 106BC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seaslug.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rsend.seaslug.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=seaslug.moe header.i=@seaslug.moe header.a=rsa-sha256 header.s=resend header.b=G4Xkt6P0;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=bY+OoHeK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=seaslug.moe; t=1795091400;
	h=In-Reply-To:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=JXtLKbVlG5i8eI7LTsWMxZUnowzvG+erauNvU5r7u2g=;
	b=G4Xkt6P04X1D63fICgjBbsFyM96ui76i2p4tUW3i6TaMc8XrL6xtPJz7ClIPiloP
	002QS7I6Uy3HdFhcX6wHVHkdFRB5HmCaYHhsdjkpNs/KSrV1eTxOIKiUv0gxwFtk6yI
	SrMks4yCukFg1okm9d7GiQsJBvHLM5ohFCZszchE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1795091400;
	h=In-Reply-To:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=JXtLKbVlG5i8eI7LTsWMxZUnowzvG+erauNvU5r7u2g=;
	b=bY+OoHeKXy9P595ASgBMnvAFFmUwqXR1Pd9ljKwAY4vpMMUwdfQHQ8tl4EopcV+Y
	xesTkJYMWST6owgNWfUpvTPI4uSRM9HFWcYRyCxfs3gOgTPQLqScIymqv0Qsj4kzM9O
	pMkVJ2WW5b8J0yYOhZWbaE1evT+vN9BGNbM59Nms=
In-Reply-To: <c5ba7bca-6ec9-4679-9e9c-a2bf4ccd4250@linaro.org>
User-Agent: Mozilla Thunderbird
From: Jiekai He <i@seaslug.moe>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev, 
	jesszhan0024@gmail.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: drm/msm/dsi: LANE_CFG1 hardcoded to 0x84 on a 3-lane C-PHY
 panel (7nm PHY, SM8250)
Message-ID: <010601a1f3c9070d-685cf2ed-5db6-49ab-80d9-cb97bc0ca7a3-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: 7bit
Date: Thu, 19 Nov 2026 12:30:00 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.ZNuWYJTX3AC0+KBOptCLUmfpt7SHI3IHQOkB5LcUBhBP6cY5WSpWElQ2N5/Rm+HvriE3mnDhS+CVg02tsA3KAKkClMNixvejJkY0vVdjLtRJQuD2EBZHHHT1rD84raItQTVO4CxeNwLsHKoTx4hYfcdB/UVTn0LeTis7osgztBXJRrMsmYLNe50eLAKwP82x:1.ap-northeast-1.tL27A1JIpKR2Y51a8BkHZBekDcSR82jwOhKrSwgRw2U=:AmazonSES
X-SES-Outgoing: 2026.11.19-23.251.234.57

Thanks, that clears it up completely. So 0x04 is not a magic value: lane2
keeps the value 4, and lane3 becomes 0 = DSI_PHYSICAL_LANE_INVALID. (We had
guessed that lane3 was being dropped, but without the field layout there was
no way to confirm it.)

That matches the readback exactly:

    LANE_CFG1=0x84   LANE_ST0/LANE_ST1 = 0x1f   (four lanes ready)
    LANE_CFG1=0x04   LANE_ST0/LANE_ST1 = 0x17   (lane3 not ready)

and only the second configuration drives a 3-lane panel.

The DT for this board already says data-lanes = <0 1 2>, on both DSI
instances, and dsi_host.c parses that into num_data_lanes. But dsi_phy_7nm.c
ignores it and writes LANE_CFG1 as the fixed constant 0x84, so a 3-lane
C-PHY
link still gets the four-lane mapping, lane3 included.

Two things I am unsure about:

 - whether LANE_CFG1 should follow the number of entries in data-lanes
   (which dsi_host already knows as num_data_lanes) rather than cphy_mode
   alone, or

 - whether you would expect a qcom,lane-map-v2 style binding upstream, with
   0 meaning INVALID as it does downstream.

And to check my understanding: on later SoCs, enabling the fourth lane in
C-PHY mode is harmless because the lane simply stays idle, and sm8250 -- or
perhaps only the SM8250-AC (870) variant used here -- is the odd one that
does not tolerate it?

Thanks,
Jiekai He

On 19/11/2026 18:44, Neil Armstrong wrote:
> LANE_CFG0 and LANE_CFG1 are lane mappings. LANE_CFG0 maps lanes 0 & 1,
while
> LANE_CFG1 maps lanes 2 & 3.
>
> 4 first bits is lane0 for CFG2 and lane2 for CFG1,
> 4 following bits is lane1 for CFG2 and lane3 for CFG1.
>
> LANE_CFG0=0x21 selects 1 for lane0, 2 for lane1
> LANE_CFG1=0x84 selects 4 for lane2, 8 for lane3
>
> Your working setup:
> LANE_CFG1=0x04 selects 4 for lane2, 0 for lane3
>
> Looking at downstream, it sets the value from the `qcom,lane-map-v2` DT
> property, and 0 is `DSI_PHYSICAL_LANE_INVALID`, meaning writing 0x04
> disables lane3.
>
> The downstream Linux code always enables the 4 lanes, even in C-PHY mode,
> and doesn't support not enabling a lane.
>
> I guess since C-PHY is 3 lanes, it's expect not to route lane3, it
definitely
> works on later SoCs, but perhaps sm8250 behaves differently ?
