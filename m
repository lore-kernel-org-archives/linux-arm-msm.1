Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794711196;
	b=TZR9paSCMJl9kGUPZP9fILy1P2aF7IivU7xnxOUv3ROA8pxW/wI83BRcoLn7RQDdDmq8
	 wDh9i95UuukbQ3nszyv2gv804l3ZS8Sf1pnIgTQRQwAd0YGjKPs1aFgvR1Jvdxtfsa5XG
	 nNNTHUyxxUj5tex3Zn8UxMZCBrMy8I5H7VPeyI9Iyy4EexSKGyES0rSZ0tzF4FRYy1ODy
	 I8OSGHEy9P0hTbQBv1hKlD7F0TaO8KNeij3hjdPVjlzt+c7XhAtHu9CaA5maXloiZ1Iev
	 2Bxz+5SupLAB7bpbbcvEeAV6MVd4HDnPr0YTiClSl3H9l4QO+FjWJrBN5Dg6MJzYePg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794711196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FEFqR+LrcVL3DPo39+xuQCQE0txVSiEwhPQ2lR4VeeI=;
	b=tjR/oGcEmz+3aUTL14WEZfE0Hnc46sjz/MjU9Pk+gJET0Cn+YQS7qOYNs8PUY9cd0KDi
	 Kmbdj/dE5Awjhdtv1HhJx1hf62DGqpV4KXRMOoFDackaOZM/OEdkwaenNqgW8sclo6qZ0
	 jfOELP4CIKdkToUAeh+BDBG+9p7cwdpVIKUt5LoKUkfONuI07xV+8GmM4BhLeJusuUxYu
	 AYMNt4h9QN/g3Rbn7JGRXardpOKcTDamhZ+qe+Gy2fPR/st/jtY4s5fXhAFz626dq2jYs
	 iplIvX7U6u7RyRAatNEiHMVhuvhV9jYLZetP85a2wymHlwcWYs4BVCAGP4WophpR60Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qcrn69dz;
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D01606A32C
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 02:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0D01606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qcrn69dz
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f2f2edb19so277312085a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 18:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794711195; x=1795315995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEFqR+LrcVL3DPo39+xuQCQE0txVSiEwhPQ2lR4VeeI=;
        b=qcrn69dzmQolEs+h5yEiGzVJHu4bLX1DKf+xYNeVJXaDRLsor4tZEhx0QaAMSct2Tz
         LN798TXybSwRmQRtctyWLyEz+Jjw8D1neNJ9la9K39X0ZbxWbPtEJbREdwkj+ZY/dozn
         G1DTejOIXmlYRFDHgnWyoT1JygHcZjaH+ZjvOSwRZsh5R1u0YEkp88Aiq61QignskC1k
         DXDZ2yAK595kXGwUTtrSzpqB22ijBdfQrZMXI/vKtcw2O6umgX92Z2Ke6L1QcxCwAo8k
         UGtwfpzn5iCUd9ae//G54GJeHk8wUvPcwBEOmVUPzBikroIQJN8ai85vc7c5qVW1oyML
         ypUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794711195; x=1795315995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEFqR+LrcVL3DPo39+xuQCQE0txVSiEwhPQ2lR4VeeI=;
        b=WwEW/I8S+wMC+jeKecrCOs7vj0qE0QEwGJ++3eJfXF8b95/4BywWim8ItP89e4yhuZ
         hktfJaGbO/RbgSPCGpx4QrVq59qBss7qybOeMHJ+RGAe0e1nHH+ZaAQV/U4dSwO7scEh
         rp7KaCNnhlAwdKkC/CWs13UWlWwfKFcazZHhD4rFCuzPL4dkjaFnehrVGuH4PdOVbpag
         LOsEFSsIoZzBguVq7+2RwNPzcE8jTRxovbIs+PzgZKPMnCXkGL+7Xm/g2tk76kQhKM4Y
         QMVE4uldXFxcKHOPybXFrYdZglhUDlmjPAvTESSnH8Ro0PdBGQCdx2/t1swWisEB+k/d
         AWRg==
X-Forwarded-Encrypted: i=1; AL+hErEjk9H59b8/SLFXZUZE4cxFEgXEZUfbFMUP8rofMzBK4jfYl4rAOaIy8x/rujS1XvBshn0OxzsyzfVjlKQE@vger.kernel.org
X-Gm-Message-State: APuU4Z/QP/d1IXM9xohLMxT+w7E4/sFb5/NFmRvKiyVyaFDCsL/4VXm9
	ICKcac4RYAaucHFMUwhHkl7U6vFN1EnhT3gZLS+ERFkK/ejHb/ayC857
X-Gm-Gg: AYBFou0c3l0/St9c9sqF5DEt1n0CT1nwWT05BhjtyiN9MFAkXRA9L/Zjs4GZMo+B0fY
	awgLCKK2yarouZDx6rTv09ymkEG+lrzkMYw4CKhSUNA6n3bPBk/XD8H66K+Cff3mCOUXxnvNLdX
	6YxBCgB+i5UTgN7BqBq94FExrw+i5tNMjqqRKv6qlAFUBlGD75YE1CVWQH4pGVZKCXpLd0dZQ8q
	HPoWeKNHVh4VwxdTkbpWSAdK9mWU2u8zzHc6sTlWd/vo0ZymSzkwrN+9LdT/tzDCeuwwmJiWX4Z
	0H6qROrEXiAs0eoSgiZ5dj2lc2Wy/LhYoJ+wgE/DlYtZuOsaTZasVHNQeJiusFU+Wv48c35K8XR
	YHabV/Syjm74rVtv2B5Mb7aC7TftQy4RarYWdsvCKmjnSWZBWyXZblcMlFJAuQqzSDoIe4EHx2t
	ydF95jHu8E+Wl54XPDKgziCOGfoW9Q3+cJ2VzbROJ3Wu6WMOXqsWcCuh+1ASz8d9vP9JJXsmFNG
	rMEln7hqvJpPMZmPw0lsYnZ4zxKF4+WAus1KfqPEC2AHqRshI0OV8aCqkvvQPTQu4YBEpbR4XXB
	TWhd3X29xGOdnEATkO+3uONqMuvOljevDoxzgLWPeUpUekFqHcrf8D25EnY0SCf0J2A+726f7CN
	2fZm7a8Fqnrteb/E6AANZy07bVoXHVk9V/blt6jo7GVl9cStopmUEzaK27u8umvZWZsmEC5Mjgr
	c=
X-Received: by 2002:a05:620a:2614:b0:939:fde0:a71b with SMTP id af79cd13be357-9494b86e99fmr1082857185a.0.1794711194579;
        Sat, 14 Nov 2026 18:53:14 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836156sm531348285a.19.2026.11.14.18.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 18:53:14 -0800 (PST)
Message-ID: <9c17de44-8c69-432a-a196-90a4765be871@gmail.com>
Date: Sat, 14 Nov 2026 21:53:13 -0500
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add support for the Microsoft Surface Pro X
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maximilian Luz
 <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20261104070441.74127-1-val@packett.cool>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <20261104070441.74127-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 2:04 AM, Val Packett wrote:
> The Surface Pro X is a 2019-era tablet powered by the Qualcomm SC8180X SoC,
> released in three variants (SQ1, Wi-Fi, SQ2).
> 
> Patches to support it have been around in a downstream tree at
> https://github.com/linux-surface/kernel for a while. Let's upstream it!
> 
> I have permission from Maximilian Luz to use his From/S-o-b with modified
> (squashed, stripped down and split by model variant) patches:
> https://github.com/linux-surface/surface-pro-x/issues/7#issuecomment-6597291831
> [...]

Hi Val,

Thanks for your work upstreaming this. I've been running the 
linux-surface SPX patches on my Surface Pro X Wi-Fi SQ2
(Surface_Pro_X_2010) for a while and tested this series on it (v7.4-rc1
+ your SLPI + this series) plus a few fixups needed to get it working:

1. Labels for smb2351_2 (pmic@2) and smb2351_a (pmic@a) in
   sc8180x-pmics.dtsi so the board DTS files build.

2. &qupv3_id_2 { status = "okay"; } in the SPX dtsi so uart13 (BT) and
   uart15 (SAM EC) are populated.

3. Tested caspar.dtb as-is but this will cap CPU4 at 2.995 GHz (SQ1
   clocks). Added carina's two SQ2 CPU4 OPPs to reach 3.15 GHz on my
   SQ2 Wi-Fi. Please see reply to 2/5.

4. Wi-Fi: I had to revert v7.4-rc1 544d85de4dc2 ("net: qrtr: Send HELLO
   message on endpoint registration") otherwise MPSS hits a fatal error
   ~40s after every start and crash-loops. Wi-Fi associates but never 
   passes traffic.
   After reverting it the modem starts up so this may be a regression
   unrelated to this series.

With the fixups noted above, for
- Surface Pro X Wi-Fi SQ2 (Surface_Pro_X_2010)

Tested-by: Haipeng Lin <jimmie.lin@gmail.com>

Happy to re-test v2 on this unit if needed.

Thanks,
Haipeng
