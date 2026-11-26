Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706831;
	b=Eqc3ZAlVR8LPWpfFPSe7SPdL52Qdk3v9Wa5ZZJeJOG8FfLJG4DOYSy5FCTJIvUvreI5h
	 rHc90LvnD747koj6g+VkM9mzXEY65SSsjvysLGrvKwEOatzHVAJ4WgJF9HuL34FNA7xEz
	 Nz6V1y8mC6BZEMxXBIz5+nDDYaflkWOB3ojUsr0q5Wwwh+ve09S/x4SseuARg7p0qf1uV
	 HsNwFuacqiJU2FKjxFBgZaNPREIu3BNkKJcN7m9F0j5b45+2ssLM+uoMOCMvzWeDzKxGl
	 4tSmJEpJIrM7zty/TB6Qebw1lSAzu4L2TyUgflmgMofUx2d6kjvbf1uiY5QZ77bXF0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D3r9Q658gfr02qv4CfLMyI+BO9QiyLcf5UpWpj5dPrE=;
	b=RYIC0E0JdEH1fLWbSL43BDAe7mQ3eZcsBR7pgP8cytUQHwnaNhgBoDXdRJE5eqGYF2io
	 HJw9bJn0RQCS/+mXJFV8Hni7NMjdXyYj0F2PYD9Dw2Add3AU7hLDmaX6G96NESZjkVDzI
	 GOU2jch+2n/OJ6vU2Z0/WiRVCAC+FhF04qbxBYkaHyafX99lbFbMnxWCSWR6NSfw4Xv0E
	 /Om/fwvKDcRGoB2RzHwwyZRFfIkYQqBwnDnvs0e7Ss4kPsm1WfZ7D0KRyQ6Xh6gq2LWZT
	 wMH5CzjwYiEC1svY5KeoL+sOBLg6CsjVja27K67/pE6yewhlJn/fvynBXA9Ec4rC6Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0u3APBei;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C63606A330
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70C63606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0u3APBei
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so73097005e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706830; x=1796311630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3r9Q658gfr02qv4CfLMyI+BO9QiyLcf5UpWpj5dPrE=;
        b=0u3APBeidcNd11Z2j3eXaAjA285OdvSXjJLehh5NHWt6xAxNEA+yxFk808nOV+lKxR
         wTz606h7VsjqgUh2yQ2oWJcCsrw9JMQQ7crRF5Beymr4N8ogKAjE2jfXFSCoHbC2+huc
         0TRrGnBl31IEIZ0O+V5vXWR8MHHJqERUOTHM5JOIPw16TYDG0KjM0O8Ci2Jxtx2eYFg9
         tssnkzzAwh/U09Y2BX56vJHGAsq/K0O6o6w4zvtx6rphXDNkjMpaFNA3An7vClLbUpqK
         L4T+dpMPxI92wNYPPn9Rv6FP50M5UE/uFl9AP5Udx72kK+1lTdJXmYOKUDB8DTOconFR
         R2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706830; x=1796311630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3r9Q658gfr02qv4CfLMyI+BO9QiyLcf5UpWpj5dPrE=;
        b=bnqrF2kwuVkkE6l8wNiW5T8BjNnvtnkwVfVBCF2G0qMyFUVx503s+CaPCe5CSbOkf+
         9w3oXlAmbM3Xh0QHSDUB9q++T7g59weKt7Bpfjc/JrxYSE8aV8FDM0ZXlu6vtwsEMR+M
         zKqRPrMovHY0Lj3vh3gYL5rnjG9DExzxsr9Ui/2yaRwWukIii07tq2a9Gtofan8EFQzI
         gS88CureEuLM0q1+6TQMAJnr/7qazxiWo0quWM9c+03OuZgOYer4sLxckFI9tSDQQGeK
         r9MViVNqXZU/bBcTztNdzEUxh55b1x9U55g7C3Z8jOuwZ8ZoiQR3bRraPciytqxpHgjj
         CGIw==
X-Forwarded-Encrypted: i=1; AL+hErHTiPXYMUoG8cDUTf8xlzNfaPudAT/C73FL5KFI3PDZncoFxrboRGpK8THVjUD/gO7p8YiNvPyCZetbEAJ2@vger.kernel.org
X-Gm-Message-State: APuU4Z/3S49uzVXANKxC9cXpHBgilzmIA8YEZfpfys28RUfjJI75uJsI
	+6gQsqYOSEE+BopZU3HirIvdteJv3qCdsgTSDm5E32ty2+eQL+DHauK6
X-Gm-Gg: AZFdTZeow92A1OEQfYSBuInJ8q1OnVMrZlEtZ5ETpl4Y+809hTUShdHvdxT/w3YkN24
	8+bF+q7exnJz5x0b1CASMRoD4wAdzQa17PRar3RhGeuQLKr7bAIjnANCxrOunk8kaaSMh0vcbtX
	HQEAymDMqGIzYB+0Kxjqke9AT+pZqS4fBccDdDmjbpcze8du0OtzmuXaSQexP/9CuIw8xQuX8IY
	fCuNFpvaZKqmpSnqYtwiTKffgfCwJy9xzXr2nCgBENcgZZPN0eWdEUYvtovS2MO/XC8Ic/ZeeCC
	KPzmgH42fWLLvpp07RjSTH03xpcrblIMw8g65Ysj+emhOSlmAmC7/Rlbn7pnUaawYr2iOrVf+uM
	gqonWXe5p6MfhNE+JAjzN3l3Je1bXR52+NmQxl0t4nqhLuKPPEevnNG1htJT/mQ74rSIaWylZs9
	0WgclhnuixDtS9ut6wF0MoLUJOk7ECmaYG6epd5yuMT2hSZCR9YKPBA+lnWOVjj90DzBmlMpWrV
	s5WSMMEuJV0axtD5T+T60yt8hPzy90lZnAcHf2cVg8TkMkdsAzSL8Sh8q5UghZgcrJLskyNPNNB
	3eYJcd8ra0gzm2mk0UuNMEj84bDy
X-Received: by 2002:a05:600c:154e:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb887c3b63mr460217725e9.4.1795706829787;
        Thu, 26 Nov 2026 07:27:09 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm619118905e9.5.2026.11.26.07.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:27:09 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Thu, 26 Nov 2026 15:26:56 +0000
Message-ID: <20261126152656.3207931-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <wezjaspgdq2rm4frq5r4wynlsvhwmogxftzb2nyzmvsc5aavwu@hdvb6a2i6cpp>
References: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com> <84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com> <wezjaspgdq2rm4frq5r4wynlsvhwmogxftzb2nyzmvsc5aavwu@hdvb6a2i6cpp>
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

On Thu, Nov 26, 2026 at 04:10:22PM +0100, Bartosz Golaszewski wrote:
> Eek, -ETOOEARLY. I have more patches on top of this already so Stanislav: can
> you please send a follow-up with fixes?

Sure, here it is:
https://lore.kernel.org/r/20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com

Stanislav
