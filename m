Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463996;
	b=XD9VXlRF9gAXy83uexHs5VeV2F3ab523CP5C/vYwQ26AoXDXAOV/hJHEDvlc7Ap/vcLJ
	 uIaFvqo9Pa0C0mzF2j/naeK+/oSe9NsnrmE2PoD6QZCG7MuIsCMTaTEf/JnoMfX7AsoXA
	 BlEXkZkKPHD9d78jBQ13DhTNOUagWmfd3OL+izjs2eWtJcswQ+Qe1IwjFdK0SJxNfZYIL
	 JUDTey/uzAYt50nIs6hS2PWC99BSHjAxGeXo3od35iHOZ5wZ6bQWiMRXU9JXytjPFB+q5
	 lAmE16pLIa/j157ogMzBDbwyicypMro405Xc1c+dWjxYOSZPeTly0sLEctCKaCHp8OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g8D7FjHM0xGs0u5fsJgGRY1OLWeFaHEMIdi1LwzAiTk=;
	b=EB1nMuuGS68IZMmFJGdr28ef9s7E7MKUbNtF4Zy/Ez8N/NU+zr0Q1JNp31W5VGeCdH2B
	 2RX8YTuoWbOFPXKCYO/TBT1sGI+1QAggAL+oPsPSn0afiowESue+OCIwqpmtJ/Dq8lQvK
	 lTbCZ6eoR2hRSFQYQgEg+14SzSldmvWe1x2YUFBWvyK9oRbuNLn8JdPH79S6C2DnWz2Gk
	 Y7iqk/rhZB+GJteVMegG8Wsqq+zR0+MFyV3NE97vm+QvqGgw38QMinZLeeaHXcpcbTivC
	 ibQ141hPDQt/fLKFNIU0Vyj4xVHb8CPkfMM+3Z+LhIugxza3anu3jGdWXaHWI9i6KvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFHeGqxX;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C98606A32D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95C98606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CFHeGqxX
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so608372266b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795463994; x=1796068794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8D7FjHM0xGs0u5fsJgGRY1OLWeFaHEMIdi1LwzAiTk=;
        b=CFHeGqxXFkgbioxsx902NP4Q3FgTr+AgI6YI92t5flfnFbdo6XafKRV+quirlSXi+5
         yD8hVEGvro2b9ofUpHjLTq4sUhcrzTX9tc/OJyK4TPFKYFKr3UlsCMXqGo7lZJiFKKqZ
         vnqzwnkm/BCMhXu0WB96hjm+88ErR3E1PfbziBDjdTS+rCi/diFkrqxSBPJsN+znXLDY
         yqJ9vcDfcMNo6UWkiOWDoXDimVIL2I2Lt6bpHvip3j1h/KGqhMvu9/ci7Lz6WBUhSN8p
         s/MkpBa8/okjzYdWa7jwpUytJxLME15MOUjyBVGpvQQHUiA9nyf6X4v88+9QxVg3yYBN
         jnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463994; x=1796068794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8D7FjHM0xGs0u5fsJgGRY1OLWeFaHEMIdi1LwzAiTk=;
        b=NWoumvxRCywQTZGkbaUGMLIN6QAIL0zmjj39jxQFc3kHg7UlFhMXpzP2VVZMlUs/hG
         O0/ryd8QbzKlhjfc3fZm8TRSUuy97hM4N1Saz2Y154aW5mLwzhDRTHF3kKI37u6mSQaP
         SZjPS54ySk3NN545bgeW6ktxDxyXXlp0f6DEhryvQmnP3GdBG+m5lwFmdKCXnOp5NKyi
         XsIyd0IuQO2e2T0mbBwOEKPyh/MrIzcpZg5Lrh1UbEU6Gh2iRNG2HvdxUTDsJIRFJ54V
         SPndYrXutYfw5rI8AomIXvM7M3XsXv/om5JzlQcZtdmPWog0yjIHktMOotv73VVTr0d6
         +4mQ==
X-Forwarded-Encrypted: i=1; AL+hErE6Pl5xCMgx1iCaigU6Mtbb7lHTAeiiTP8Kzc+IpaNeqBBxdMewmdG3lGqtg/Ig4mIZBKxGdLaLR4LYolCS@vger.kernel.org
X-Gm-Message-State: APuU4Z/OD0u1Jpu2KdV4i8wJ6MrxxGvDXd4RaTsUUznW6Cfsyj//J9VK
	zYNQeA2m/GB2LaeeCYD5g4+LCmhptEYFCg5p9gfSw+OfQcREmZFSzcp+
X-Gm-Gg: AZFdTZdimi32WNO8e+4I9wbmInyEKJZQkPvYhOjoLHVeld4gzrIoHQjkPoAMc/MP4ZL
	BEiprhLnqvCPjDPPfsEF6hLbIt3rW7dcIJwesb2wQdfZwpwFaTmT2QqJWEbcFFEm/1usTOfqVtN
	zZ50lYm64MoDAlEXHTiSx2dWYzH510KFtbp/qO6jb14A/x0Pwzg9b1cAcm02ixXV0Z2hh8YEB5U
	XpPI6yjwDxj9VmeRQnkXSumIFGK+Keuut2jE4jdHcrGY5C8uO3+1R56GJS2nZ35cFDIJGV9ioA0
	g2VGECbAWGRRIG3ykaaF1vwEy1Cc8ytLKC3s5Q17nJ0i/PjVhqQXSdMKgfnJWWewna9Tsbec30K
	bX2SyGP9Q41TTU3wuvsEzKb9xXNquyPl0CODzO69Q9y/HMeJdKqaEs0C12rCUQDDnEesi1KOggL
	TXG0VKHtx4t224nvmbjhiA29NhrWBrknVlULzxQK9JYnEugAj0esiCuJ4y9gWaJzWr9Tw5K8JsO
	OP1sUDE4R3MS25LRiWIKHwu89Qv7nTfcZt37vKas279qhBZCDB064nysKmVEmSmMB52Wb76Jzab
	SbvB/h8WhEFBmhEyFxRAr26+Vtcg
X-Received: by 2002:a17:906:e28a:b0:c31:e958:408c with SMTP id a640c23a62f3a-c513aab021fmr708355066b.38.1795463993838;
        Mon, 23 Nov 2026 11:59:53 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm438660266b.8.2026.11.23.11.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:59:53 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add Halliday pinctrl driver
Date: Mon, 23 Nov 2026 19:59:34 +0000
Message-ID: <20261123195935.1046144-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <su7onpn56wd2dtsn63qwbv5v65kci54rhqjndh6qjpb6gwlwnj@m2kxvcdrpjws>
References: <20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com> <20261116-halliday-tlmm-v2-2-b4dd502ca142@gmail.com> <su7onpn56wd2dtsn63qwbv5v65kci54rhqjndh6qjpb6gwlwnj@m2kxvcdrpjws>
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

On Mon, Nov 23, 2026 at 05:16:55PM +0100, Bartosz Golaszewski wrote:
> Can you verify the pdc map against the interrupt map? It looks incomplete to
> me, there should be more wake GPIOs. Unless you have a reason to not
> include all of them?

I do not have the interrupt map. The PDC map is from the pinctrl-anorak
driver in Samsung's kernel source. There are 93 GPIOs with a wakeup
enable bit, but its PDC map contains only 76.

I did a test: set an interrupt handler on every unused PDC pin on
my headset and then I toggled each GPIO to see which pin fires.

1. Out of existing 76 entries 42 PDC pins got triggered. 26 are used
   by devices on the headset and 8 do not change their level,
   so these 34 are not tested.

2. 17 missing GPIOs: only 14 give a result:

     GPIO 42 -> PDC 105, 48 -> 87, 63 -> 122, 80 -> 42, 97 -> 96,
     105 -> 55, 143 -> 72, 151 -> 118, 168 -> 94, 205 -> 130,
     218 -> 124, 219 -> 68, 221 -> 133, 223 -> 134

   I am not sure about 151 and 168, their lines are not quiet on the
   headset. GPIOs 114, 125 and 162 do not change their level.

I think it is not a good idea to add these pins without documentation.
If someone can confirm these pins are correct then I will add them in
the next version.

> There's no egpio function. I assume you copied it from sm8550 but I
> think you should do something similar to commit a326b0523fc1 ("pinctrl:
> qcom: sa8775p: Enable egpio function") here.

I'll add this in v3. EGPIO_PRESENT is set on GPIOs 185 to 223.

Best regards,
Stanislav
