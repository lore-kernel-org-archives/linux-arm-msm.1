Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804173;
	b=DK6dz6h+cQZKMxKq3nV1jsyUbPZRPmEuc3cgXvsA8c9jmQXSaEweK9JCJ3WNzkB0WMOB
	 QB+/lRqqMPCs1hWofUVeJGZeuHn8u82XSqLockYDGth5OT8cnSFzlRNR5FZ42kwfQOygM
	 Abzrhd6WLvNkxebZLVuHJ0e7ElKY7XVD2ovjEvDCzLtv4F4613TiYIUam9QfZ1FvGrDjv
	 cJHKevxvc7amTBhQLXnexh9G8N6AAOlmZ2LtzH+3AOJa027ObGu5RQErjp8ufNTqEmoZ1
	 UYNFKDZkSYVp3YD8cBuG0VFYikrY8gdnHxVvc2OIk94vDRIqjbCEsWl0lUeVLG+pZng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804173;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=NFYP7Mnhk+gbYwzYQNwIrmmMssv+PF1qkliHdpdYKQw=;
	b=FMlXNX8oM3sgnlEFu9e0aglELsAZuL3axrE+io1iCZ900TxUUQo+xOX/wrBFT1puOBpM
	 6o2insp8i1St0OWTWgZVQMdo1wz51JzAbZA6QH/x/Qb84n73y6AW4z4Wqk2hT15nQ5WE4
	 n06OcGRdunrOVw6jdrKNDYsMAvb4uI60kReDA4lVsqYXktuRaocXRvA+a3vVgKzTlMbu0
	 W2ZL0dRnE18CCvtD5H1YCPt48GLJkukNLKtPWhpgSpM3RmY6/WANsHSyZfJfu98mk72Jt
	 4F0JWoNp68SKQ6YDg6DuGWWze/s9ySch2aBzsrR6U9w0pOEdRiMvRV+UolSxvsHc9Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=n0ONqiIM;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BVjtbpuQ;
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD90E606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 18:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD90E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=n0ONqiIM;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BVjtbpuQ
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7F87B140036B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:29:31 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 27 Nov 2026 13:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1795804165;
	 x=1795890565; bh=NFYP7Mnhk+gbYwzYQNwIrmmMssv+PF1qkliHdpdYKQw=; b=
	n0ONqiIMPwI40ZRgqs85MqiH6u6YZQkhH8mIgE4F8wjiMFSZczjdaOurOWDkkKjD
	3a43vHBsJyX8NBHYJHlVp+H18LUVEYVHPuWoDMLIXwQzstg4AQPu56KeQvSSM/4v
	UutKeEkRPR8gekJiIHfKYb8pQk5mtBS3IWx6px5LO63d8PeMFuLqTwpUmBh+1ZsV
	CCf6bUovS03ZaZT1PzfpXM2yQ3vlNY4s2UZ9dxisYeCP1902MQPMAXTdoloawrQs
	lim5H7IxZjM/ajISgPmJJppye/8VXOJI9VMkz91d4a6ue2Bn4c7N8e6C+koxtxx8
	/GZxBhijEmuchF98/nbX+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795804165; x=
	1795890565; bh=NFYP7Mnhk+gbYwzYQNwIrmmMssv+PF1qkliHdpdYKQw=; b=B
	VjtbpuQlJLg9pveOD5oivpL2S/pz7E0qBEw7M5u4DY1HSt8BXmMkHM+a0sZprHZs
	riTuvtSTirqEVyIvM6DaG6XZgrQBgebIBvJrOv/XESeaWH8KW3HgtIBPhArJexUS
	+nYYgX9YjELNIhpuU+ezxCoU2aZkkEJ2r5pKIFSQjKu3yRECajHhrtHnGEvctvxg
	MOfwMa2ayGkqFCP7nq0wRnXidnlVJMC2suHVVwGrUwWQsQsmkadl/cWWCLt8aWUF
	ZVGki8d10buPbl0x5rpYC4iyTZsbeh+aVpZoFNIZbG6COmMLMdZ7Og0ShBb/vMy+
	/jPmDpA/P1wHyovYy3xrQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795804165; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:CUc/cQ/jnYfJ9jnKosNzt0uvmTy3G710XUJckBZ6ENgyES2
	nKNK+ZQyBlRh0AbIDiyW+fAyg4IiyyA5BQbu9kzt8ndKQdP5ZWsGt1WGUcQCSMMg
	IROwR42IfMgDYRiMq9OB8aKImgxBVYOdzXLAgL33rNxR5c+DnpH4zZ3/CA5vNfg/
	C4dYOTrxt804mDcv5VD6oMr0CZx5NoB0kwoUiGXjGooDmeMj4HOODOupTpBAV1Br
	aRaAQQ9m55sy5p0Ct8rVEG0gPcuLaCKvO1vnZv7dLtoVqyAHqVpRIOmonIqVOgq2
	D3dQ2qAKVgyOhO9przxpKXSvik3A0ggvCLCHy5g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:FS9+xTMbX/QFa04FzYFBpGpWbFSjVsaaN82lemGq5pI=:bYIDvSgwaoejMxjJ+spE8S6D9q5RDTrLXwcidEC/JwI=;
X-ME-Sender: <xms:AMwJa6zFlc4qCkpE8mMRNlw9YQFSVtNIOXdi7TkuL3InvB2Yx3QDHA>
    <xme:AMwJaxGGfMND0M0hlCVTTD5QDBhuA_BvKZeaEPcjy4CddfXH4pyj5547AxOSTbBKo
    wmEfCguIsu88hYjqUiNXfOURqeEbsbdEYGpq6rSlXbiXVVMED9CkwO4>
X-ME-Proxy-Cause: dmFkZTGxlAZtYZTqWhyUt4AgPgpIrvLLPUzMzv4nN0DJixhlQGowoxwHGrRvrjqPzREHAH
    3w7xcSWMVjJJxiSeiO6o4PJtZBVlb2a6PTQrjY8U9X3AkKSOLPyTx0KhYMAtGwmNMXVhKy
    B53nE16fqxxQIeLaiUQHHhQqDKjIjAUUylwB3o9XDbTlGHBywX5StSQdt2x1U+AHYJi2F6
    0fuE5gs7tuxSUAeeIY7t2Jh3zW/gu12M4GzhdY9p/d7g/3iPcU3Jg/K7fNrE9+Jc3tSJWc
    sCzSFzKi4crKTgXmA2UhEZwdjt/RR/1ePUOtVj69BHWkps4vJGPiNya61BtGiKG00ETKeC
    iftW1WXRFj/sfsjVqFZeKCyId5M7oIu6nz3tRnPNoY983aFYjOwODV9nZxZU/1nX/0dB0I
    ntAXhI9063Kk1JaN0Vz44HUXF5i1Ln2hPIKRlx+s2wTfiq5yWGBWSrcfmg3TJX/Cl4okCZ
    q+XvHi2ZMA4yFVyvK+znpUuIg+9QZumQ1+XcWN0FwsKJBcyIo4F+zaaBnWj2Fg+p2F1zo4
    r2TAERN8GKK3Rv16AxPAd92ukFfXqkf5VjHGOPIPNq4LQkZT3Cr1l3dWMIEbSXndI6UnYL
    x3mDtrq5Q0BFc9MRKWg2NjGepz7lX4CEltG8BeUvOeM4iWt1UzUO2mcJibpw
X-ME-Proxy: <xmx:AswJa2AzWjQrL-m-jHJ8kKfz4n8VMva6N87jpBSVvWbKFwyeRHoJAA>
    <xmx:AswJa3C_fVbQut_BETpbRIT9vNSnRlQymWJxiJyYCGjU6MQZXW5RBQ>
    <xmx:AswJa3ktswHizTmmMpa5XNKbot3ODcmztPi3q2v0SIwaNalBFXNxMw>
    <xmx:AswJa3heW5tKkXf8OP3r53syace0tnecSyLtm1S1wO3OZbCczH83sg>
    <xmx:BcwJay_C11L5CoKEUHFcekgh_t1G0v9nVELC-kMxAypJa-EYLKnJr14_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D8AE132A0099; Fri, 27 Nov 2026 13:29:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A9TzPJ_Mub-w
Date: Fri, 27 Nov 2026 19:29:00 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Manivannan Sadhasivam" <mani@kernel.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Vinod Koul" <vkoul@kernel.org>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>,
 "Thinh Nguyen" <Thinh.Nguyen@synopsys.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Krishna Kurapati" <krishna.kurapati@oss.qualcomm.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Kees Cook" <kees+treewide@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, "Sasha Levin" <sashal@kernel.org>
Message-Id: <ad645fc2-9b2f-49ba-98c2-8ccda8899e18@app.fastmail.com>
In-Reply-To: <179579549935.13164.15609895718346972637.b4-reply@b4>
References: <20261124105939.1440586-1-arnd@kernel.org>
 <179579549935.13164.15609895718346972637.b4-reply@b4>
Subject: Re: [PATCH] phy: qcom-uniphy: avoid build failure from duplicate PHY_TYPE_PCIE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Nov 27, 2026, at 17:04, Manivannan Sadhasivam wrote:
> On 2026-11-24 11:59 +0100, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> Both the DT-binding and the driver define a PHY_TYPE_PCIE constant,
>> which clashes at compile time:
>> 
>> In file included from include/linux/phy/phy.h:25,
>>                  from drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:15:
>> include/dt-bindings/phy/phy.h:15:33: error: expected identifier before numeric constant
>>    15 | #define PHY_TYPE_PCIE           2
>>       |                                 ^
>> drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:47:9: note: in expansion of macro 'PHY_TYPE_PCIE'
>>    47 |         PHY_TYPE_PCIE = 1,
>>       |         ^~~~~~~~~~~~~
>> drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:127:27: error: 'PHY_TYPE_PCIE_GEN2' undeclared here (not in a function); did you mean 'PHY_TYPE_PCIE'?
>>   127 |         .phy_type       = PHY_TYPE_PCIE_GEN2,
>>       |                           ^~~~~~~~~~~~~~~~~~
>>       |                           PHY_TYPE_PCIE
>> drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c:135:27: error: 'PHY_TYPE_PCIE_GEN3' undeclared here (not in a function); did you mean 'PHY_TYPE_PCIE'?
>>   135 |         .phy_type       = PHY_TYPE_PCIE_GEN3,
>>       |                           ^~~~~~~~~~~~~~~~~~
>>       |                           PHY_TYPE_PCIE
>> 
>> Nothing uses the definition in the driver, so just remove it.
>> 
>> Fixes: b28eecc89399 ("include: linux: phy: Add phy attribute "type" and associated helpers")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

FWIW, this is already fixed in linux-next by 90d6263e867b ("phy: qcom:
uniphy-pcie-28lp: Rename the PHY type enum values"), which renames
the constants instead of removing them. I assume we'll leave it at that
version.

      Arnd
