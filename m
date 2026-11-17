Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936954;
	b=isi8ro80W4nw9KlYnIGbRru9Uk8d9G1eaOlN/gu0b0JlhpB3dC3HahCLIgP3LDmqoZ3w
	 dGgEiYuNUvczqYpw0YPFh28KJ9cDI4O9h0/2sKVyRsmAAmytEZMypjbywSvDU2NpiQVtu
	 sL4bs6Tl5qWljVhr+PM1EH2IpMIvdDLmhF/qbWQPhFSy95wmNLCwwvuwoqDD9Guc0ohy3
	 pcetDUXMlWbTlgW03Mt5DXpgpGCdYfJaNG+MdFzpCAYGkWqdI2kKc+Z0dBxKVXttdUwJv
	 wNcmAsenoG8S34skcx63admheD0lnKMca7hMAU8JG03dH4Geou5csPRnxG13HNQg3LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ehDPQMS1CgUNGIZmcAtlpOqErWJKhsWUSWC8X9QQDz4=;
	b=TVP0R5ZqTsemwyS1JMStcCrbkwr0koRP7QFMFPVFUNABaDTxpkF1k6EbGT8Fs1/X3F/c
	 rQ7Mthmig+ATEIf4WFmL7pwLps7SDQqyoZb64+6DU3EEOxEb9pL87KehQ6wYyM8MSeLDc
	 x7JsjKrDTpP2l5XkC1meENxfWP4mHEQPNVTQBaVHykIrdNqgzPhnsvK0tPTdWJnEDnC3a
	 nL219xYiamf6Y3d9SC9DIETgpG6c91h9Lo6LENlJYtyTSi6u0xkpmN4eWi6hfIE9o/V/m
	 k3o1xR+gck0xbSGjI1MBBKHr7xwMe1ieWOYKawObO/o6Ajd2Q2mo/5YbutBeI/pNgfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpwZ0hRI;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFFD606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 17:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAFFD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gpwZ0hRI
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c50e9408873so294610766b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936952; x=1795541752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ehDPQMS1CgUNGIZmcAtlpOqErWJKhsWUSWC8X9QQDz4=;
        b=gpwZ0hRIJ0pid42fGOtKDjmjtS+n1dGRHvIVeP0VJdOUEpwL+S3/+EMKHqIKY+8nVJ
         ZCwrjZnS3Do5vVK5klQrHrzBTZzCOAJZrqi04dVLBtdAjtfXksm2Icwsax73K9CaaP+D
         hgcdQwC/a37TF3bjUlYprcF1uLFRETn66xIXLjy+KiloUcJ0oFKBJudbT3nZjWkAL/CP
         nCt5p97NnObGwHllTgYBPz6W5H9AdOLDcAclWmvZ1VvyGJ2oz+wai3iKln/NO0QBZ7Zq
         EnT/k+XLPnRZkmlRRqU412/gDWlOzI31rmuU9H19XRhPH9aSIKh1xuKZalopbRABi7dN
         jnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936952; x=1795541752;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehDPQMS1CgUNGIZmcAtlpOqErWJKhsWUSWC8X9QQDz4=;
        b=GOj6WfJuf6LpSUZYlf6wfkS9u3Ubo4oZ7povegegh2s/I7lS6YdSCyy1+goplPxxgU
         SIFNtKgoXQ8knfCjGUtwRM5gtn3S1SEs6AecuFBY5yZ7RbKNRlfqNwD6jQXWhuQxjfV4
         uBGOlDkr2BR7fGaj4S4ehSn5FXB1rLDLqLJhppAQ3WuFjUXtdK4qmdXep8LAQFAheAr2
         wpAxd4Z0sHwpMFkjSelykZyTCSC/37/BWoXqeu5ZQlVBvu/YAWxIlPnD0GEKNdXDlvTG
         fmV5YpWL8PnQsF18FpObEBs+323m8sNbZMcmJ6ZoB2i0+UX9j90fU1OJ4rSl5VXMTrKG
         DesQ==
X-Forwarded-Encrypted: i=1; AL+hErHeb1Sj3rGu5rWCtDkDLTbJQg4TxsK9oP4XNRhRr+hrkgwPWge2+DG0zt2n1AB8svnq+4UJCr66e3UZRSYG@vger.kernel.org
X-Gm-Message-State: APuU4Z8jApjcBarZmAHuZQDPNH6Q1S1XiN5TY/m5YscqEX5NDerjBfJv
	o8bwyScQn0imsJHLx0P+luGDjGqRJkgPoP0PYrMvwPHI98mGJdnGapg=
X-Gm-Gg: AYBFou0y/2jyThEge037Z9hqEe06ZHL31pAIYYLMQrzn/2gsRrjzPfUjCUqsxjhQJ++
	SLWecx6dke6h16YAF8dgv+Xl0lE7rfcPb85r3YlSlOQin14LVuSG/XmEFaSJp8Ofmifw1C1dKXp
	bghfZTlgaSvjl6O0oOYKKcHQ/aNirDGOBlzG7zY997XCVUIqRtjQXhfa1OCF128XZuwuSiL7oJJ
	OsHnSWhCUwGMjr52K+DCma2XVptQ2Wd3G9frg82PnZKg35KRkX8j0AYnPB+TXyxdJhwPrtZ0OTk
	RCBGSRtRCsbiQpEsSfYq/PBR1F0HMggFgaXfg01hgTeX+DE/XNxJxQ8VpBJR7Qch7ro2NYTj/tP
	f2/PPmKYHOcGENJunbfq2y+/+Au+5o0i0o3LvD3mAj6Az00HxLLM4l5AXXCul0YXZYk4wzkW0RM
	xakphvNlshVUpWt1TmG/eu2uZIpa4zAJkft5kxMlM0LoG98q2B3GL0Lp/0xUNQ4oPP5R+nCGuq9
	yB5wIfVbzOTOa5DqCmKTPr7qBH6AUiAXZpautiVzISnyVqmmwiICi8CS/4YfoHcTG99oFg8+690
	X9v1CJJ2ceDFc7j+1ud0dHE8DbS7uUElLT5z0fLknhmOujd9RiVBys3YaBaFNBSyl6DS9+e0j1S
	mYWS1zEjU5eKPWEp1GBshp7VpeA==
X-Received: by 2002:a17:906:794c:b0:c41:7e99:c6c2 with SMTP id a640c23a62f3a-c5096409d32mr1211919466b.44.1794936951974;
        Tue, 17 Nov 2026 09:35:51 -0800 (PST)
Received: from sohrab-omarchy.fritz.box (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510ca049c7sm6863166b.20.2026.11.17.09.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:35:51 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: barnabas.czeman@mainlining.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abelvesa@kernel.org,
	mani@kernel.org,
	admin@mswin.me,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm6125: Add cpufreq-hw node
Date: Tue, 17 Nov 2026 18:35:44 +0100
Message-ID: <20261117173547.1656090-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <a3cbbfa897e960db0d671098be710032@mainlining.org>
References: <a3cbbfa897e960db0d671098be710032@mainlining.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Barnabás,

thanks for the review, and for your answer on the cover letter. Both
mails reached me but neither shows up on lore, so I am answering both
here and quoting the relevant parts.

On 2026-11-16 14:41, Barnabás Czémán wrote:
>> +			reg = <0x0 0x0f521000 0x0 0x1000>,
>> +			      <0x0 0x0f523000 0x0 0x1000>;
> If you check the available sources SM6125 is different from SM6115 the
> size is 0x1400 instead of 0x1000.

You are right. The downstream trinket device tree has 0x1400 for both
regions; I took 0x1000 over from sm6115.dtsi. I will fix that in v2.

>> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gcc GPLL0_OUT_EARLY>;
> There is no proof GPLL0_OUT_EARLY is related to cpufreq, the driver
> using the clocks for getting the initial rate from them, it is working
> because this clock have similar rate but i am not sure it is logically
> correct to bind a clock without proof it is related. That is why i
> have made changes in the driver to make the clocks optional.

Agreed that downstream does not tell us where the 300 MHz row comes
from; it has OSM_INIT_RATE and XO_RATE as constants. But that is the
same file and the same constants for every SoC it serves, and the
mainline binding still requires both clocks ("XO Clock", "GPLL0 Clock")
for all of them, SM6115 included. I followed that:

- SM6115 uses <&gcc GPLL0>, which in gcc-sm6115 is the alpha PLL
  itself. gcc-sm6125 has no index with that name; the PLL is
  GPLL0_OUT_EARLY, with OUT_MAIN and OUT_AUX2 as its /2 outputs. On my
  phone it runs at 600 MHz, so the driver's /2 gives the 300 MHz row.

- The mainline driver uses "xo" for every PLL row (xo_rate * lval), not
  only for the initial rate, so I think at least that one should stay a
  real clock rather than a constant in the driver.

So with the binding as it is today the DT in this series is what the
schema asks for, and a node without clocks would need a binding change
first. Whether the clocks should become optional for these SoCs is
something I would leave to Viresh, Konrad and Krzysztof.

From your mail on the cover letter (2026-11-15):
> Also i have added a new SoC data because SM6125 and SM6115 have less
> LUT entries (12) [2] and there are no throttling IRQs there.

That part I agree with, the trinket fixup in downstream is clear. On
laurel the generic data happens to stop at the repeated row before it
gets that far, but nothing guarantees that. Would you send your soc
data with lut_max_entries = 12 as a driver patch? It does not depend on
the clock question. Your branch as a whole already ran fine on laurel
(see my mail of 15 November), and once the patch is on the list I will
boot it on top of this series and reply with a Tested-by. If the
maintainers prefer that to go in first, or prefer your DT, I am fine
with either and will rebase or drop my cpufreq patch accordingly.

Thanks,
Majid
