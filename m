Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348755;
	b=0CiQ3A2DhLQLeCaudb6beKr5LZwlRwahIo4MoLWY2B6np0K0jrKzHppDuFl3a2mOwIWL
	 +Z6xcNFTzbnnFqUL0HAVYUMuybU6N99hQcqer5z7TfqaFNrKUkElkM6bAQtUcgCwT6QSX
	 lustkkQ/h8Ae9swpTTu0ILVkF7ayYaYJvmCFCrQoG0Y8Rzgen46Fu1FKV8gR/8VEDuYFa
	 3MiT4PYPumJWXi7psGDE8gG3Yz8hT22PiBcCHp0B6WuXCM5peGXfm8yZoVVq4ZnWHRsAB
	 j+H5rUO4SJRDLxfFLsSqCHixJnOmB02db994rAUQx1ptQt/d4vD0yUIzrJy/18wQu6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QvuQY+dI7Cg/hO7294zVJsdHa2mxSYpqdORdJaVQ9KA=;
	b=cRRiAYJ9eed3dr7vcHLe3zaVs3JOMEhuBwKWXU+L/UqQtzknbdard6wQZNzgBp5pwsAB
	 7N/2tJnWxjAzb2WGm2MrLrMEhSr4s4GEqTqF2zKl9lGQQz0YuxkapQWJbzNRICw1e7MxT
	 79R3BdmOqgfptEqIOF7x+g5ojric3CiyM1lwIbin7OQUymO2SofUaZJTn4M56Pyt/V7d4
	 GGxRfKbauUoTSOwjgBzc+svO1S9dqcDplT5p5KvPIaVHF216KR7/Nm5nWij/ztoggKXOa
	 X7COG1z9M5tRLWjB9OpRFH9sPig8Gfdxs1MO5JQOCxlv5N1rZr7GVLESoj7FoXtOWzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7aTYqVP;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724E2606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 22:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 724E2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7aTYqVP
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93e64d52949so223157085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 14:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794348754; x=1794953554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QvuQY+dI7Cg/hO7294zVJsdHa2mxSYpqdORdJaVQ9KA=;
        b=X7aTYqVPbG5cqr4kNYOlVXseMw8UYfuxiw/e4mO4JL6PiwzbyMKDAmXe2s4foYJNSO
         7wGvtSx0Bc6XbtZufCkUgha15tfTNZ6Q+9TXyr/WcRWwEEFdaxS5SZDnpFWRCO63nvHM
         cVYbbaBoC14Fig9LfOCqp/OT+KqgF+yUgzS+KFA3wPLGixmpidGjInk5cM8AW+lE3SAY
         XcneGJKlEUn+TxITC2PzRKuv9JUUTkske6YVJBgotxZgLcZnpUWlvlKxe36zzHsNx6u8
         fFuuivfjtUYX0yBBhbmMPWQLnIXjzxC92ASwejNyNerUOyd1xmhfg6kbc1erixnCtEED
         5bQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348754; x=1794953554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QvuQY+dI7Cg/hO7294zVJsdHa2mxSYpqdORdJaVQ9KA=;
        b=1HbV6G//39A1VK/MfvHE9XHNzCVzdRPeYyP8A1x4FeBGGltDTvQ6B7oZ/ZuMJk4/kO
         0niLhkyG8PaoWZVxEz9Fl//H3DH8bVya9lQ5UMMHQZS1WYXuRFjW4e+9nCWAeAi7hLML
         3N3BwQCqfsMDLMcLYbE/ZqGqWsa+OM9UNI8YhsuaJv6v806TrM/53fgyBI0ydOUYPMAb
         KSXyaCNXDGsJQMCW5Q6d1jvqhA7mVMDls695ewvZ2/nDGPdX8rWiYloF7KRfF1WGk/IV
         OOSsJvc76bSFfhd3mNqAJy17P3zuR9TkYc5/rEch+UJ5YvledAWhaqF7y0kH/mbYON89
         nmNA==
X-Forwarded-Encrypted: i=1; AL+hErFP8jQS7qmzh6zzPshAEjZzFOy1pJHNlqEFv9JItLQBwruIDuU13XEEV3hZgStKi5z29QG19otpe5jrleyk@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qe25lHXfk25Ptb9OdZ9z3y7f6bJoK7QUYuBo9GjbCoq8tfxD+
	droy4fuea76lw9bRNctGkWzq9uHW8EjKm3jBeaz9uGctO55fueN7ak7F
X-Gm-Gg: AYBFou0ggSlmVjsUB5Z30qlDaJhgFyJBAJ4nEreAMDODA8Ao4p3Y8GuhEYU227Xdzzm
	nIkvmiQAb2/nk+pCZT/PmB6XtDkvwW132CX5hK4hK2LEBYOJEJjgb7pNeR4nr9LTQbYCRpm/KAp
	FYhxXy6aDkKs80ldkGXHXWJ6zsXn/YxW44LVC0RSTv2EYfetjoeECNOb+5cnUDVhv38sCDmW9Hz
	mvc6Mqba4yD6dKj5ZmQiDXhVA7NpX9KbueQD36hcL0APln7rGu2UT4M3+Rymk0DEopNBRE2NGlt
	uXW5rpp8cegzZEe3A6kqCxQkV6VPaR+u1k1Sp7Z40ALMW8a+/w4IwRKpZ/lCjvOKaaR0ubBYIlm
	fkZlerZtG54JZHhRrPYhzZo9y/SAGgsBpONScq46ntBSlxZOFKOKfDhpUYflQt1Hhy/5XxUECwv
	T44ziLRJXgjMecXfxk3NOCWgsqAN1xcKdn9rCOPM4LkdW7swWKHyGfR2bgLLDyh80gi6HIUfglq
	kNUuzS4M3YdwMclEnWOCq1TifTbYGsoTFKRVVZht5jHhP9KvrHwR1YqD1wYVSNnvmHQPgVLa7Aa
	UiTfCeAkUE8n9YkqSALiGQnIpLq2cvqYkIo7gBNSz7S3Nhi3LUZahRicnbNGDiloSU1spclc9ll
	TXDJ5GVWWrsBb1WfFa/V7/gUjhFT9hHctDs8Fae+ao8ixSDQzqLvMIjHm7yE7FUeYBZ73uYBBK5
	cr0xskTtN8NodxTIR00FTu3VF5rFkD/mrERjewcKaVDD1z8G+waW6a09lI4tu1vn+hXThGfVyQ2
	W/O5qcCKMl4C8AmdZOZHAUFzBjton/+8tlunpIC82S77w==
X-Received: by 2002:a05:620a:6ccd:b0:93f:6e05:22eb with SMTP id af79cd13be357-947b004790fmr62140885a.48.1794348754197;
        Tue, 10 Nov 2026 14:12:34 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:940a:c6ea:f292:3644])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73a8fasm328270285a.7.2026.11.10.14.12.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 14:12:33 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: glymur: Add camera MCLK pinctrl
Date: Tue, 10 Nov 2026 17:12:32 -0500
Message-ID: <20261110221232.3883-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-glymur_camss_dts-v2-3-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-3-e7b1f403146f@oss.qualcomm.com>
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

On Thu, Oct 15, 2026 at 04:22:28PM +0530, Nihal Kumar Gupta wrote:
> +			cam_mclk4_default: cam-mclk4-default-state {
> +				pins = "gpio100";
> +				function = "cam_asc_mclk4";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};

I've been running this series on an ASUS Zenbook A16 (UX3607OA), which
has an OV02C10 on MCLK4 at 19.2 MHz. With 2 mA here the sensor shows
horizontal banding, and its frame period stretches by about 9%, whenever
the internal DMIC clock (LPASS LPI GPIO6, 2.4 MHz) is running. The bands
are already in the RAW10 frames, and the sensor test pattern is clean,
so it looks like the MCLK pad itself rather than CSI or the ISP.

Changing only this pin to 6 mA fixes it. A/B/A across three boots, same
kernel, fixed exposure/gain, row high-pass RMS / frame period:

  MCLK4   mic off          mic on            after
  2 mA    0.96 / 33.28 ms  20.44 / 36.17 ms  1.04 / 33.27 ms
  6 mA    0.89 / 33.27 ms   0.90 / 33.27 ms  0.90 / 33.27 ms
  2 mA    0.95 / 33.27 ms  15.33 / 34.37 ms  0.93 / 33.28 ms

At 6 mA the frame timing holds steady at 33.27 ms and the image stays
clean in every phase, including while the microphone is recording,
which is exactly the case that couples interference into the 2 mA
clock. Normal camera use with the mic on is also clean at 6 mA, so the
fix holds up on real hardware, not just in the capture script.

Could cam_mclk4_default use 6 mA? If you'd rather keep 2 mA in the SoC
dtsi, I'll override it in the A16 board DT instead.

Thanks,
Jesse
