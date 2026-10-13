Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5597D3E5598
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886631; cv=none; b=BUyXtps2ilSErql7KXNaIB9+69C6441RKkZO285ugHal7v3R5cElESH0arxkQefcn0GZ0ilu+bK1rygX6+U685MIhPubCuLHOLPkJ5tUzSYcxxm7+OFp25eC96fmlynbWPU54DWVnugE3koJJ1F4fiYFjmWNSxpXmZs/a4ya1MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886631; c=relaxed/simple;
	bh=HgfOYVUmqK15tK1qAZjGuLmszhgYJK9TaV4k+O5nopQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=J3eq1gs7cxGko85DF85i89sZXR8XOklEkDGUrNUbAWrnNyNxEkMfCl5weIRY732FaYDBOvdCzJCkMgC9eYFYpb9gdPj4zcwsVUzlAvv2zgik+JoIarrIAzthyj+ODGqJykG0RrfYRlxUzp9ZD+MQt+pPRjyHtAQzT2VzItBZ6r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=uAdGDiEk; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="uAdGDiEk"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso3419423a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791886626; x=1792491426; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q1nANBNsyQWXnn8HGzdSfGCDeYeCmohBuEkqclHHM04=;
        b=uAdGDiEkXuKLYoaaVIT8Xsf73y7curREzVjaWEX6gSY2Assgsa2+Ro3Zc6A09Yna8T
         j39I9MRjdKbuxOdSHC7sbvc4MU8mSdgjjOfhVGOpOpAchvjDMWRpPOlPQXK5mH4iXpJr
         g8VMtp4ix3EtRELtIRPMklg/7UfyQY0TWqSmcgvAb3giEuYQihxz42DD4OVJbIFzWMtF
         h+8rTrYYWCKKKJozBmDgVG/b1F9FJw9+x1/+ZTAk3vGO5fgLsfY5zyM+YHFeyHaV+0Hd
         yzaN9y8xc+H+CUgKsxpSdyF8o0OfN12iQvD0hQ7OLVNSeaGA2P7Z4QFOMYL29HvmzqJq
         EMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886626; x=1792491426;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1nANBNsyQWXnn8HGzdSfGCDeYeCmohBuEkqclHHM04=;
        b=pqBsiXpcXX8Mb1ER9ykVPhqs3szlcmnjpetsG/ATZDVeg3wcleTjh0OLcm0z6xGxVE
         x7meLO1PI8GDJMt5TPDoB7S45+bEwI+du/WyOtXTdZWUBGV0VPN5jumlyWFb6kULAh4O
         6PZvj6/z1uyfajphA+USAoXFKIqGcBLKUU/Wdafh8mIhdJqupzpUXlAwXrOFk/othuJj
         4NHj87wodkLM/Sznw6I7cFeOJzpkaQ7Ome2qrygG92Tfe8awphj0xqWsSVT9MCAAUSPC
         zwokEKxN+crD/wY7EQi6wfSqlzuRgSPQ2qgTxhIXoylqmGUnJIVokhgRe7lWlRvfxNyY
         IysA==
X-Forwarded-Encrypted: i=1; AKwUvByOYirXy9X2VIB6grjWAUK4twff14cC9zx3DsSV7kb0GDA3SxWA9Hc28wcrM9Ws7xQmWImD1KTc0ph9HtOy@vger.kernel.org
X-Gm-Message-State: AFq9FYL8jK+ee8Xsa1R3rYON5+kSYDDW1cb4zQsYRI72gjSHylsusbvM
	8zm5pmEYwxDvLdMOqnszxo7eK0yhBY/QQ8Jyr8a+yNJLiJeG2NR+t03yIwa/F2SiZB8=
X-Gm-Gg: AYBFou1kDfFwgK/+qczvww+rztNAvOy5S3/XN+hQu8ePAbihZWs7sGScL3FpL+ElHYO
	3qa2yiR4vncR9MaO3aVzWF5hv7f0YPs0drkaZENbwoZ2/BnUMN7ambm83yh6ZRW+lTVddgGloio
	gIG+Jc0t17f3rUtZ27y9iwTjrbkwwsVtx2UbJo++SRtOpVpNauQOpB18IalVMtsKWfHcAt3otDa
	0aykAqVf18f43VVxST8MKMsru85ApTz2eT6Zq0swjzYTnZO4nPsfHarM3zF590LSR8NKJm14qPF
	/GDRjdVcqPivFzgPuL8V6QNJKnnDSi4q+H6KGZY3zR7kG0fe4lK7QtRZC4Dk8M6jFLBYJ9ArN2e
	IrCVcWoiC6KIR5Vk2u2CHKu5lvNKtBTp2aaM+xWP5t9Vxsp93lja9OMqCZyHXayTO1ThCrGj0Le
	xM+03nEB/ye+NmTtM0LZVDuiWdbZAKVx3booPgzi5CKgcyMTrloup5878vBqO8fCsCt1Pht/iIV
	8rsvKyzPaX0jPAYyhyo/W+qx+vAuTYghL0+Qj0zymZG1K/MGHiQRw==
X-Received: by 2002:a05:6402:254c:b0:6b1:b9df:6001 with SMTP id 4fb4d7f45d1cf-6b1b9df64e8mr5421183a12.6.1791886626364;
        Tue, 13 Oct 2026 03:17:06 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179e012a7sm6018180a12.36.2026.10.13.03.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:17:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 12:17:05 +0200
Message-Id: <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Douglas Anderson" <dianders@chromium.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>, "Jasper
 Korten" <jja2000@gmail.com>, "Federico Amedeo Izzo" <federico@izzo.pro>,
 "Luca Weiss" <luca@lucaweiss.eu>, "Hans de Goede"
 <johannes.goede@oss.qualcomm.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
In-Reply-To: <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>

On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
> On 10/12/26 8:11 PM, Luca Weiss wrote:
>> From: Jasper Korten <jja2000@gmail.com>
>
> [...]
>
>> Signed-off-by: Jasper Korten <jja2000@gmail.com>
>> Co-developed-by: Federico Amedeo Izzo <federico@izzo.pro>
>> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
>> Co-developed-by: Luca Weiss <luca@lucaweiss.eu>
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>
> Good to see the Lucas are in agreement ;)

:)

>
> [...]
>
>> +&pm8350c_gpios {
>> +	pmic_lcd_bl_en: pmic-lcd-bl-en-state {
>> +		pins =3D "gpio7";
>> +		function =3D "normal";
>> +		bias-disable;
>> +		qcom,drive-strength =3D <PMIC_GPIO_STRENGTH_LOW>;
>> +		output-low;
>> +		power-source =3D <0>;
>> +	};
>> +
>> +	pmic_lcd_bl_pwm: pmic-lcd-bl-pwm-state {
>> +		pins =3D "gpio8";
>> +		function =3D "func1";
>> +		bias-disable;
>> +		qcom,drive-strength =3D <PMIC_GPIO_STRENGTH_LOW>;
>> +		output-low;
>> +		power-source =3D <0>;
>> +	};
>
> Drop the output-low, the consumers already take care of the state

For both enable and pwm?

>
> [...]
>
>> +&uart7 {
>> +	/delete-property/interrupts;
>
> Let's add a space after the '/'

Will do

>
>> +	interrupts-extended =3D <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
>> +			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
>> +
>> +	pinctrl-1 =3D <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_ua=
rt7_sleep_tx>, <&qup_uart7_sleep_rx>;
>
> And let's wrap this line

Sure

>
> [...]
>
>> +&usb_1 {
>> +	dr_mode =3D "host";
>
> Does OTG not "just work"?

Is this a feature one would want on a laptop? On a phone for sure, but I
don't quite see the use case for the laptop to be a peripheral? But I
didn't try it, the USB basic setup was done by Jasper

>
> I'm assuming there's no pmic-glink on this device?

I'm not quite sure yet how the USB stuff works. For sure from
observation, USB-C only works when stuff was plugged-in at boot time
(UEFI?), and charger also only supplies any power (but not actually
charging) when plugged in at boot time.

Regards
Luca

>
> Konrad


