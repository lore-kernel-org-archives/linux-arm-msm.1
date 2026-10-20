Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524568;
	b=jmtXuse4UzD/SxHUSsfhHPMpwR2CUCxw4IbCv8aSBXShGn+GnStn2BBE/yUSQuyBxB62
	 6JgZp8B1kK56q+QGErFdixT1GziX2kmHDQKH4ArzkISN4TusFnweWACXuDdKtIH4c2rOo
	 FWKd3ohRgmnZpQ2V3Ki9E816S98RyeA86kyW8wPlV25Ao2y4mmhdxzBrYC5F5JFQvxSl0
	 BdPUAPICxPzFbXmg4RAJr0mJG3alm4hAEU0zjaURyTTUkFeR1YuJN0mzzdXPRXwr5m56+
	 6PLBv/TnAR9VzN8UqRuUeOEEx+u7zwv+QfvyrqjDzlS3GtXKd/0NC1uo8LWOnk6+lHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=C/iSPX73nR7XVogkkTvvUPc6C5UsSw8Yeh0YEAvQaKg=;
	b=bjfopTwFRCj7CfdAszVwF86PG+GT+Ls57zHcxGMFl18CB8uH/kEG+zvRTvWTE2i8yAgM
	 XcyV7OFtn/8al1ZtY5T/rQaQ5sWh7cYBBauCOSqMWt62s1NC8j4KmACLpJu+EZ17R6sW+
	 LdAJfwenfQi7/Oc74/BIXGeedLaRtiWVKO7Jmij1cU1GcUgjflCJywFdIZSvrBqfHpuNg
	 XuU752USeAvOjk77HnDMYhGGHk2hqTSQJ5tZBFYF4DgR0V9JdUpc4ik5QmgkEZgmDfd+P
	 HV+Y4bw9/2nw96v/zgF9fdBgs9/CR+j80GwL3v0qI/dCEAkkfICYQTDZEFxkjBfJO7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=nE9Sss1A;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36106606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 19:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36106606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=nE9Sss1A
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1d293b293so20621635e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792524566; x=1793129366; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C/iSPX73nR7XVogkkTvvUPc6C5UsSw8Yeh0YEAvQaKg=;
        b=nE9Sss1A6JrrIagj2oLOrZ5xA7aMiP8Py01Fl+A+eWG2XrHLHYXiEyEydoeMkWa/1J
         sQamhTV9IL9dl+/1t49FKXNF5jNMzYHu2CKrlVa9H8Xs1ho3x7AaPB+uQAfEVMRflWih
         HOiI4v9MEcOxlfoo+DeMF16uIejUNvT3sZKaq/Ax0wDNqpeIZY1oAuq6cfVVtYks6bqo
         yRxwRDvxk0xzIxevHspyQ+P7+r+/Gn2aAImMDSqAq90e1XYJrvGAdkjGGZR+2U6o2Vn9
         kwjDrTZvOVS55kw//ZsP2dveerWUSDVmVawsts6r+HnllLWbmsFL2cUg8ghhxbOYJrfk
         twQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792524566; x=1793129366;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/iSPX73nR7XVogkkTvvUPc6C5UsSw8Yeh0YEAvQaKg=;
        b=GwzWtyyegVuStBCD92rY10tEIGfgY4hU1zXqCrVslOifBHLMNhzt7bgWGr+yz9WM47
         Oq7RTC2WARKuJ4d2Wq6jt5LiL/rT5C539XgHwZbiBiK7cQoFBPqcwumC09CIguxyXF14
         e0aC/twWRe1DwCbVAwEJxHOPOLyevuqknKuNv3Tjrw8f3CPa02e2ePgTjkagF/8INRa4
         Bc+/CFqf8u56uPAKrYfQLQYpHD23fjTiBjSOgxZYTGIbMKfu/fqBNGHxldZvLuN8K5ID
         xAfOOUPtIyG9t6mXYsW6ZROw2SzP8P5Np8UWi3gQW+hxidIEFrVR4C29MbYkIhjLNrHP
         G9GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTsRpz3NU4yPKXWGCl6MPpOIIR2gWlZ74zmAhTdy/NEAK05g9DKt2eqcW7PH1Rz0+HeD8ZXFWzPJx/gzwu@vger.kernel.org
X-Gm-Message-State: AFq9FYJKmpzGLsDq4JrrcYYaTN5H8mnCIxsQB1RN4LJM8v5ZL2qWHu+d
	5kyBE91qcgZoKLbbebio1rUEHnOECrHy/jA/G+VjEk8XL1tdU9WmhBtBh2XLKvx54ls=
X-Gm-Gg: AYBFou0PdMyAhISWRItBMfaXUbS4rBSIvKgP04M7xFvzPIKUTCCDMR9zexZwOC1uXpq
	51qKxE7J9IfF+dUmbIFqecoOBva8Q4rPNApetZUr/eMEdJmU2K1aQxTWzX+HBCfvjFJuGar8dPa
	sFWxjDnVnXYpbCAEqznWwsa03HazZrlQjbxUQbo5IJzHFrjyP23HhUhnRxYTFzGIVeDaLV4s1e9
	ChFdDXdRRmAah3d7qei3JHsZ4DiSJt+Zns/l5Dei2C9F8+0J33ISc4xuK/2OrNBgaFXsJ6M33SX
	rQE+q8Pf3BsBAdlg0q4gxCgMBpw5FeSXOqYmhZ/88XcDvPJPPpUa4zV4iTYvVVPdHcQ/QOnzxfr
	qmL8EY7zclaI4Z9LCd6D0fZAXtxJPTJJUPhrUcHfyda60xI2y6ndeWSr2FS6jhEZ4afUXg4eOne
	zEZG0+e3ks52fYsgdHVbV1vTtNR4LgtKw705pJ94n+XNjjQPLhBONAqv8jDhBL7B2GfyuNoRFlW
	HHdCd3iOb4=
X-Received: by 2002:a05:600c:190e:b0:4a1:90d7:88a8 with SMTP id 5b1f17b1804b1-4a1d76106c0mr258091055e9.25.1792524566645;
        Tue, 20 Oct 2026 12:29:26 -0700 (PDT)
Received: from localhost ([103.239.146.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm1049611eec.26.2026.10.20.12.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 12:29:25 -0700 (PDT)
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
Date: Wed, 21 Oct 2026 00:59:15 +0530
Message-Id: <DM9WX8LJQ2VD.3QUBHZYBWDBC2@fairphone.com>
Cc: "Douglas Anderson" <dianders@chromium.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>, "Jasper
 Korten" <jja2000@gmail.com>, "Federico Amedeo Izzo" <federico@izzo.pro>,
 "Luca Weiss" <luca@lucaweiss.eu>, "Hans de Goede"
 <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
 <emdm463llmoi6vsv3zmfjddqrfaf2iubdnydsqye2n6ui56oae@frsvj6el3zvq>
 <DM4DIJZOLJC0.2KAZET8VYUDY0@fairphone.com>
 <a69738f1-1c6a-4476-9c0c-8443650d1f6a@oss.qualcomm.com>
In-Reply-To: <a69738f1-1c6a-4476-9c0c-8443650d1f6a@oss.qualcomm.com>

On Tue Oct 20, 2026 at 1:05 PM IST, Konrad Dybcio wrote:
> On 10/14/26 9:13 AM, Luca Weiss wrote:
>> On Wed Oct 14, 2026 at 3:28 AM CEST, Dmitry Baryshkov wrote:
>>> On Tue, Oct 13, 2026 at 12:17:05PM +0200, Luca Weiss wrote:
>>>> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
>>>>> On 10/12/26 8:11 PM, Luca Weiss wrote:
>>>>>> From: Jasper Korten <jja2000@gmail.com>
>
> [...]
>
>
>>>>> I'm assuming there's no pmic-glink on this device?
>>>>
>>>> I'm not quite sure yet how the USB stuff works. For sure from
>>>> observation, USB-C only works when stuff was plugged-in at boot time
>>>> (UEFI?), and charger also only supplies any power (but not actually
>>>> charging) when plugged in at boot time.
>>>
>>> This means that something is not 100% correct, for example, missing EC
>>> support.
>>=20
>> For sure some bits are missing. This laptop doesn't have an EC per-se,
>> it's got a "EMEC" - Emulated EC, where on Windows there's just a bunch
>> of drivers handling EC-like functionality.
>>=20
>> So e.g. already for battery, we just talk with the sbs-battery directly.
>> I assume this will be the case for the other components on this laptop
>> as well.
>
> I guess sweeping the i2c busses would be a good start. The other day

We have one list of I2C devices from ACPI description, and a different
list from i2cdetect. They overlap to a certain extent but also have
enough bits that differ for some reason.

> we got a contribution for a SM8550-based Samsung tablet which also
> didn't have pmic-glink, but used a SM5714 IC instead:

Interesting, will keep that in mind. Difficult to figure out what an I2C
chip is based on just the address and potentially basic register reads.
Downstream Linux devicetree would help where it's not just an obscure
"EMEC" device with a million I2C addresses in ACPI.

Regards
Luca

>
> https://lore.kernel.org/linux-arm-msm/f7ba4d5a-0e8c-417d-a1fd-5b5e392df71=
a@dxdmail.cc/
>
> Konrad


