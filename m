Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261579;
	b=HL81xKEKwtWmYanDVtWmQIu3O9aCgo4Vq5fi2yh1DO6Hk0XWSiO/eRtcUwylRxPBpfOy
	 +iF7X3eBsoCYdKr2lC91stmVDg64z/PGyq6CMoVs9Rb9aA5XgeGdjQx/+va0mw+TCPaRb
	 mNAhtU4ko3nbImCbcskKuzxQdqVHZG+yt4Vumw4GYmuLwVVLn4ku4KscGIl97T8V9aXb6
	 QBxgE+++RXUFzb9U9vo1Ks+Cm644x3WikWWcxslt4ejccfx7sOtHKenvtPgsP5yAQHLgp
	 kvs+YPIExP13tKUJmSLlPbdq5KqWm0Ag7hV9/pYTXsn7NiKrIpoTyUfQrAd1MUrRSWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261579;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0JHuIrO6HeQW90zGwb8mXlKmQS/KkaD9r735yyDrBqE=;
	b=s3dDwV58auObrvjU2LFbR2/1enYy9olip8n71V6s+UhHkhIU7F4OcVpANlPkldG9Mcos
	 /JBYxUqdiEQmRc3rW4RW8k8uH57g+T1aL7tcaccI9hYsvIQ6caChiX6CB4uQTwhEtwMAu
	 WI6zE9Y2tC+uUSnPjpDKKyIFUfe/Y5wY2ZZRwlEqtdyBfv0VqiiSyryWtd8p0SjuLOavF
	 ANb3uqReR8LD/4ke5dlkVCvjCmH6FFjj40TVVpJCucrB+ZuNHdF0sxn5tWajmF+zCeGpL
	 75hICXCkCo/fTbtZ+MIZ39thGzeLf1a/7ZxyJosMEzfit1nTJQy0GJFKbx4SrOMblHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ch7ENt1R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3wlStDb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DDF606A321
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 21:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97DDF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ch7ENt1R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3wlStDb
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA1Qw2029494
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 21:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0JHuIrO6HeQW90zGwb8mXlKm
	QS/KkaD9r735yyDrBqE=; b=ch7ENt1RzDTd0Cy7LxpzaWmCtj9d3F01+Hesh4BO
	N9/scIG+o0vWI7Afc0J/S+FawtUid/nr8dHGkwsttMKKFtg8PycXQr3b9blscG3A
	XQbV3K4sLckCt9xGYeyA3WDY3hv7aEeEEpb84ZR7LwXjZ3aIIxbMFxBUZhmUeiCy
	8an16Vyl773x2e46hibUyNnBozTfG5TanrEmW5CN6oNFZ+sLCeI/RUGLa8GFqwzD
	oCUY4svEPyRjJoR5sLCtgK/3LVqMUGdjTvLQHHoouKW0O57bUel68STegcYV3mTJ
	aSzC6kRc9wN4TRFfcI35Z7T9H3ucxJcD8HPtMZw3wh9eGw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hufx81nv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 21:59:37 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2c61d4475so84904137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 13:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794261577; x=1794866377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0JHuIrO6HeQW90zGwb8mXlKmQS/KkaD9r735yyDrBqE=;
        b=X3wlStDbDzUkelKbfNuZ9htfiYQglqCloPyFrmv+wu2BNQziLEP2elRzoY3HEYIv6u
         WvI8fRvKuR85P4v+g/iF9NTEOLZApHNefT6bMlBnj5ApnfpMjs4WjB563P4LFHTrxrXf
         xJdOVbSsnMgb04D7Sp0XlgyQm6JkQ2WmA3BWtToLy1dmHm8Os/t6OOf4RSVWxX2V33ID
         mFV4PL5PX5m0ngfeRYh2mBjOqOYxVLUkP/NL743fRoOKiJVh6/rXBxfDNtQST2VfpgUX
         1czJkDbbSbO4YXcPAPaMqGKFe+nOC9xDVQhAvCl+Ih5wwWLgDQF+DAtuHDY8k+rVmoLv
         ipvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794261577; x=1794866377;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0JHuIrO6HeQW90zGwb8mXlKmQS/KkaD9r735yyDrBqE=;
        b=v6UJ5FRtrX6tjXy2F+BUAWXniMPUhp8nXaFZi/rfbp8DTfV+QCpvukVK7qGDsDB21U
         5gHv7n7CjEH8O6044h7/Iww0bXAXAVCXjCiDBkmbwmuoW3oyforHPxCmH1GlKui5fU+v
         lwSUw8TJwpPc9SqzUyXPP8zofi6222uRPlVBrqnZqNB9UDVMJLTWewJ1z4hf2zWkZ99e
         dRTJtz4477bqWxiv09ErBvHbv5jZP6QhW0a+YElJGaOjKEpjaIfzKxvYj6TWgU9fT5Mf
         ttuygD9mVxOZvId+i8zm194xRahE7sw3/NyR75ygQRLHbcamr2Zzr4c+5L6SMKWZ9VfF
         70vA==
X-Forwarded-Encrypted: i=1; AL+hErH+PK/tHXi4bw60BDFP9ZviKVcwY5eTRqzB2knka87Ypt0hgY0BdMeGF82lo5nn0tYx1PGxvMQrYvZBhkUY@vger.kernel.org
X-Gm-Message-State: APuU4Z93nbUsxlsuSnTJfTgZWKcdj8MhF9Y4/Uko+/F3sAOJL7jkbh/L
	G5/CRmimf9vjcwtqcxweYrXNiqlr7j2lJMMNFElOS0LMG2kB3VIfOg4tHYmbGMOJblazDO4EbgS
	NDn7glIwWhpaMSrlu3md9dPWHdW2Nol4LIoB2AJyg1iOkxaDFHKm8Axat3ufizS/EbZXj
X-Gm-Gg: AYBFou0S78FemO0PpxTKohkNnFh/fFsldUGsArSSfdIgwaRTrHF6DxPp+CaXWDwAFK2
	lbiQUq+5Sjzam2nxS01YJUQbK9JGNR9Tv3t5qe7QNEXQEFoWwqmiL5ZluXiv4hdfYEOZ8Kb8tjJ
	x/XqrJHFwMSzmMiS8L8IongCKVS5LyinLeeTAGeX5qNfbMZ6hhGSEekUh7w9nKnr508aFJ+HN9k
	ba7Ja9RSmOr+NlFqkmidhiYX8ijXisdWHncfFDFwTziRcGatIxLg9EB2LPiW/xg7wvgujH4y55Y
	+jFVNKE425zA006kR+LNriIzmiaoqCfSkiXzkzMfUNAxYB2hxJh2zzoGbiUEersGsEopkjL8+/1
	I50+Snf8gcIHzqoZK+/4IOXwpaqLMjVNUM6fS02YO1PxdtZaqMFYI2gm5hPa/8jM=
X-Received: by 2002:a05:6102:3753:b0:7cc:828b:41f4 with SMTP id ada2fe7eead31-7d301c3f850mr257640137.35.1794261576511;
        Mon, 09 Nov 2026 13:59:36 -0800 (PST)
X-Received: by 2002:a05:6102:3753:b0:7cc:828b:41f4 with SMTP id ada2fe7eead31-7d301c3f850mr257625137.35.1794261575843;
        Mon, 09 Nov 2026 13:59:35 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363e0019sm1354173f8f.38.2026.11.09.13.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:59:34 -0800 (PST)
Date: Mon, 9 Nov 2026 23:59:33 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] platform: arm64: lenovo-thinkpad-t14s: Add Gen 7 EC
 support
Message-ID: <o55caq7vadrcc6ioc7n7aplbyh55n63mqgno6j2mgcksrjzb35@ptnencuakeo6>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
 <20261107-t14s-gen7-ec-v1-2-f4a8edaac447@oss.qualcomm.com>
 <44e4ede9-3eb8-418a-b1f1-7e9dc75e2e75@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44e4ede9-3eb8-418a-b1f1-7e9dc75e2e75@kernel.org>
X-Authority-Analysis: v=2.4 cv=AbYkjHXG c=1 sm=1 tr=0 ts=6af24249 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=5kuUbzVnSpjELaQO4TEA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: t7lBHx8WY7GRahzcM0ve1q3MDPZEr5Ye
X-Proofpoint-ORIG-GUID: t7lBHx8WY7GRahzcM0ve1q3MDPZEr5Ye
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX8wwpMqRhuPem
 t61aAEDtTZL+s1/zgfuN48E9mjwBEPQdxw6mUIk0ndlBnRZrFM221L7CMqDEmtyUVQk37X5QIsU
 1fQgH79Puz9ZpR710YgWvEXtxcExjn0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NyBTYWx0ZWRfX744BMH7OUQXA
 zk/1pbIaSR4JkMSUcVZCOKe0BOJcaAwjkpZJ6fZhCgK7oHNxT218hCnFDe0vJhTdgIiQsgYQhkP
 Fnxm01qycHQzBW1eZ5RfS7BHtlMkqdyLF1dBDSzij5tSWAh4XJ4avZ7Gz9eoYQd7XTrek1a7i+l
 5rlGiV1aM4CPGwU4A294p18mMFJHPJK2VabhFA4/KCkAx5vOFodbfPzsX6K25N98h3KVhRCR/C6
 X8V87LIZCdlq539XYqvMfbkRp6ncPemAsjjHTPjBNnjVxCtCVM7Kp3EsNc2yKntGrUiaK1MQUdX
 TYkLZVXljfw5HBQI8itAYGNWLJALzdgy3jOfyYlmByPno1/Vwq6O8aOfYj2HdWTnKpR/fjFmByo
 Ag+gF9Yejuha5P+4/rphfsAX9BO0aEYDj85XBMl0XC0eRnwPJ3DQvZgiXTc2hbml6u+D2Mp08nK
 mBVIxJfWMOmoiIW2z8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090087

On 26-11-09 15:52:16, Hans de Goede wrote:
> Hi Abel,
> 
> On 6-Nov-26 23:01, Abel Vesa wrote:
> > The embedded controller of the ThinkPad T14s Gen 7 uses the same
> > register layout and event codes as the Gen 6 one, but a different set
> > of I2C commands. Going by the ACPI EC accessors in the Gen 7 firmware:
> > 
> >   - register read:  write {0x80, reg}, then write {0x80} + read 1 byte
> >   - register write: write {0x81, reg, val}
> >   - event read:     write {0x84, 0x00}, then write {0x84} + read 1 byte
> > > With the Gen 6 commands the EC never reports any event and the LED
> > and keyboard backlight accesses have no effect.
> 
> Thank you for working in this. I've been testing this and my own T14s gen7
> and also I've taken a closer look at the DSDT leading to a bunch of
> improvements. Instead of making these as suggested I've just gone ahead and
> implemented these as fixup-s to be squashed into a v2 patch.
> 
> For easier review by you I've split the improvements into 4 patches (attached):
> 
> 1: Fix Fn-F12 not emitting a key-press + filter out some EC codes being reported
> when pressing Fn + Fxx key combos which already send an I2C-HID kbd event.
> 
> 2: Add Gen 7 suspend/resume handling
> 
> 3: Cleanup: has_kbd_bl2_and_standby and mic_mute_led_generic checks are
> really just checks for the original (gen6) support vs gen7 support
> drop the bools and directly check which variant ec->variant points
> at instead.
> 4: Cleanup: has_kbd_bl2_and_standby and mic_mute_led_generic checks are
> really just checks for the original (gen6) support vs gen7 support
> drop the bools and directly check which variant ec->variant points
> at instead.
> 
> > Describe the bus accessors and event read per variant and add one for
> > the Gen 7. The Gen 7 firmware does not use the second keyboard backlight
> > register or the modern standby register, it drives the mic mute LED as a
> > generic LED (id 0x0e) instead of a bit in the audio register and, when
> > the keyboard backlight is cycled with Fn+Space, it also reports 3 for
> > the high level, so handle those differences too. Also handle the Gen 7
> > only events as known ones.
> 
> So about these differences:
> 
> 1: For the spk / mic mute LEDs, on a hunch I tried using std LED controls
> with a LED idx/id of 15 for the spk mute LED and that also works.
> 
> I did not find either way (REG_AUD vs REG_LED) for the spk mute LED in
> the DSDT, instead the DSDT ends up sending an ACPI notify event, relying
> on some windows driver to handle this.
> 
> How did you find that REG_AUD still works, did you just try the gen 6
> method ?

Yep, just tried the Gen 6 method and it worked. Nothing in the DSDT
for it either.

Re-checked just now: the speaker mute led lights up both via REG_AUD bit 6
and as generic led 15 via REG_LED. Since the mic mute led is already a generic
led (0x0e) on Gen 7, I'm fine with moving the speaker mute one to 15 too,
if you prefer. Otherwise I'll keep REG_AUD, since that path is shared with Gen 6.

> 
> 2: For the kbd backlight, again the DSDT ends up sending an ACPI notify event
> and does not access the EC itself at all.
> 
> How did you find that T14S_EC_REG_KBD_BL1 also works on gen 7?

Same, tried the Gen 6 register and it worked. Writes change the level
and reads follow the Fn+Space changes, which is how I noticed the extra
level.

> 
> 3: For suspend/resume the DSDT does have modern-standby handling both
> making the LEDS glow and setting some magic bit (which presumably makes
> the EC use less power or maybe makes it send less wakeup events if we
> were to make the EC IRQ a wakeup source) ?  This is implemented in
> my second fixup patch.

Squashed it in, thanks. Haven't been able to verify this path on my
unit though, suspend has some unrelated other issues. Will try tomorrow.

> 
> Regards,
> 
> Hans

All four fixups are squashed into patch 2 for v2, with your
Co-developed-by and Signed-off-by.

Thanks,
Abel
