Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201770;
	b=vhxJ9OhQREetYRlmk90/FfCqJ3OWlh30uWW263QTpgAhimaBoOSxG8EflGBmrQn8hd3E
	 mb94qiIrWKx7fkJBkQR86toX6B63Ksk+i/cfDNVtuk2dQJPe7G2fA/rZ6ra67QBjzm0wU
	 sfxjfd8t6mTR10tCShdQSSVaPYcnCuU9bTdSIOm+JbDMErOm/zIsG7cG7Gj4QO1295Sne
	 fpwUp8SCa001Hx/OoTZqj9PFuyXS5cZWBvUUWAZWX+pYpoOb3shwGumtTjgjLfeTzIqYS
	 A6vFOWiE/zRBTRWrNNm2ALnFrFH7fgd7NFCNAyWAl/ZBz+6LcE+h0mAsYet+FRjIyCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201770;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=tnqJ5WEWuOH/sryca1mtSF1R/jE94CQ0TEC1LthA+kg=;
	b=hqv6t0KMzfUiUPng0DwxoJQrkfo0pan0ij9tckORiBYtBgZSvifrCCLWM/qzIF/Ahsl7
	 F5UcRRNuPdFsJXEVlw4e7Bntn7Zz66KRMoSY8SIYChOXAzyZfwgAz+ZkDT5L/M3A3E2aa
	 igjijub3DzBbjKNRNCOjs0mRtzlGxotSf27xS5c+PgkhbI4HEkLyej/xcZaIQVGO0fT8c
	 9xskx9U+fXbwqK0COys1As5Q5YTkb4FLIkLejlJB9WiCI90gl6rxM7+MCaz1e/djHXAl7
	 luNe40wns78vl6DYN2OE6kCHOvNKiPE+zTPk5v3NMceSLm2Yhe6qI7QKaRFfectYv0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UZ5vxgZU;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE425606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE425606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UZ5vxgZU
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so9801805e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793201768; x=1793806568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tnqJ5WEWuOH/sryca1mtSF1R/jE94CQ0TEC1LthA+kg=;
        b=UZ5vxgZUunglt4G10pOQzIVVK9fHKqQKfOoFuVBy7okRyLDlBjGEnBOAeVPvW/aOMu
         1wadd36u1eZDO9mNluALYMFMr2+yMlApFveU9bZa2AhqrkIBMH/ZGT2XzMH6Ip8dReJJ
         aaKalseqlpgjcq1GqbUOS7FDjwY75yP2MlyOmAtKaBRs9Z9m+SAd4S/uYNDPG25kNINs
         F2Xa+qviSLXUBhO+NSoVvdoqYgTbouK6lRfZEf9zuBTvBNF0FDMNl3Epf/CG6nwqcmeA
         V3hZ7yHlmaIiiI71wRfyx3A5JlWFE1+dM8uK/o1xLtkwEzrLDHmo+8/AzAaLuXjZJ6K2
         8mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201768; x=1793806568;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnqJ5WEWuOH/sryca1mtSF1R/jE94CQ0TEC1LthA+kg=;
        b=qTWzMzbxPAtS7V+56gAv9WqdZ6jHennJ/byrpE7EaqVO23Tso7utl/15+G9F6gQZKY
         AjzUdmkg7DbBShCn2AO3Tdi9TSx53+GWyUrfJlgMVFJlhL90rC8yQuqSQ6wZfIswnBza
         JWSNAxaUAwloj2OfmVxtKQfoObGmK9fX/aNExyNgr5d5SSby/XWYVvW1Zimlv18i+QgJ
         75T/SAKB2ihULnEklShATsECzEOz5Ulpb3b9RpVSH5uJGRUkaQfUMNxheOvmsrNBXGrl
         cQI8vDEsSiZqQVMLzJopPFeBuWTD7LQPduVlGp2Nq9EruKHjzbYnbhl5KZ+cJGeQK5GV
         spvw==
X-Forwarded-Encrypted: i=1; AKwUvBwsGgnFZ0H89hqwSd7KnkTG9HnvG4cWgA2XSuG/rBMcj+JlV57avYUFAGAwxQdSZEgixZIrzvk/ACkzAZ4K@vger.kernel.org
X-Gm-Message-State: AFq9FYIXi0LOwL1KpvV0Zwsinb79kFJwrJ8Wl3qW8g7sIuGliA7J6cKC
	Y8zIsEYoq+qSa9n3J9LsAQBLEsRc6aAiEtKFYjzLQwFWrWTEyqL8pOT/ox56nDXiGfQ=
X-Gm-Gg: AYBFou1y3dS53IjtbkmgflriScdH2zqGFV09tiiBGuiV/irfk5bMf4pciZtb3ITgXHX
	pjedQ7o3tz4FHF+IEtH/Rt29OI5uotszIIgxs5nyj7dHZ3byDaYtkj09d0t9EMOdq1uPB82SrhJ
	2Lw6ZmVAkZxRYGhQDW3dTEGqVeqopYTb/6v6wNXV6guXkD90pijiW3qo3EbiUST7ZBSaGkTOhRe
	g/XMoRA9qB67TKXiPEtYZBRzwAUhELI+HoTvdya+ag1dOCF04z91a9hbKoZElMoLIMWRz4FW/v+
	NmykMRsrYvFMbzBN2dSD7J1fdRpG/9MtLChJ7K3tObKlUXE0mKGtjzFsTfUFvEtiiq7k/Gl8XeC
	nGoKvVZ1+qpZf4vXeWCDMzgP/GAJS2bPXSzFLvET/mdIe7IBcKtYD6hDkg1bQKsw7mQtNbGwowO
	Qpy5sSnq8dPEPBFcFm1eAwMD8CsclhuTVbyYfdBiQfXhttHjjFo2SE4e7K7tMgpKQHE0yU8nbxf
	R4uW7CQQRpxJvEF8tytOkc6Np9jK/Ysp3mLpAW/do5+l2bde19kwHYW+uq7v5sbTObxfS5IFuor
	lF0Syhb2dbCMf2zFbAp27o+RkD0qa8Q16Y7Paxu6xw==
X-Received: by 2002:a05:600c:154d:b0:4a3:5a42:b2a4 with SMTP id 5b1f17b1804b1-4a96720266bmr62849985e9.12.1793201768098;
        Wed, 28 Oct 2026 08:36:08 -0700 (PDT)
Received: from [192.168.0.167] ([109.79.76.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm41594465e9.4.2026.10.28.08.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:36:07 -0700 (PDT)
Message-ID: <ba560f04-d817-4b01-a1c4-293165625f07@linaro.org>
Date: Wed, 28 Oct 2026 15:36:05 +0000
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
Subject: Re: [PATCH v23 11/15] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261028-kaanapali-camss-v23-11-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2026 15:20, Hangxiang Ma wrote:
> Add support for the TPG found on Kaanapali. This TPG uses hardware
> version 2.4.0, which drives test-enable and reset through the
> TPG_CTRL_CMD register at offset 0x1f4 instead of the TEST_EN bit in
> TPG_CTRL and the TPG_CLEAR register. Its output is routed into the
> CSID 1080 RX through the CSI2 TPG mux, so the CSID selects the TPG as
> the data source when a test pattern is selected.
> 
> Add the TPG resources to the Kaanapali camss resources so that the TPG
> subdevices are created on this SoC.
> 
> Signed-off-by: Hangxiang Ma<hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
