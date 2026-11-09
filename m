Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244688;
	b=T5HGrVlMrYQJJgk+4h+DJSdRavbW+bqSqKu9gd0Tpot7YmupbUk79PAbf4z8vOH3JpSi
	 7kN3fBVieaBCeccxXsTmkguBI4gGv+H0M7gX3lt+Wi3+RCL4TTS5W5shGVz2rF1fD+Sbb
	 iVHRyya5zxMfKNlv6v76l+sEE/SSB8TZTffk63t9Js98mXqrOV/NT8iAZqnBVX28W1imq
	 esKwB8cjuFBXrhfX5Q9PQHl0xnAedq2xRPNczON5IdfKetX3Rc1NfGkpdYA7CTgqHRDGX
	 T/j52lHt+vZOqRet2yIsRQ7aOsTkJ4J4K9QA+A2LhgULAjsfDFo60XucINMSb6NSTSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4TaVc8RNeAzFNs1Ph3vgOybQkr83PU7asLdiABCA4EI=;
	b=eK+m0uHLhOTpny56QWxCQxUwYqPVlj9DvVWwOytO4Kvhcs9xIkatPPZWsjP0mJW2ckdu
	 ngit7pd9TzkPzLSKwRYRZjKW1IPHB+FP3mxnPcMb9tn0mEmehri6Qwyh8f2oTxjEsI70g
	 e2hzNOCns+QaAtxag6zCPsQxkoOLihYZW05K8X3hxqiGcENSNP53otS+AA36g/Wdq0mIi
	 9jhazmHn6rrgE/9KwZ8GwEjiThJHk30p/rcJyHs+N82fZJlbAdnfBLWL6ODFTDSP3P0sc
	 uHcq9lALPLntur1tA8+AAdZit7tDgNz9wsx5N3PwTZQax2rgQY8gANJfm11BHmYlAcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fatecpompeia.edu.br;
	spf=none smtp.mailfrom=fatecpompeia.edu.br;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FD5606A333
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 17:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23FD5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatecpompeia.edu.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fatecpompeia.edu.br
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7d2d18f1bf5so583319137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fatecpompeia-edu-br.20260707.gappssmtp.com; s=20260707; t=1794244677; x=1794849477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TaVc8RNeAzFNs1Ph3vgOybQkr83PU7asLdiABCA4EI=;
        b=WjEApXFE1pTnIb+KmmPuTjctaOkqfyxAgG2LeCOpwF4Csad+fG/qqRpt/cdm+D9G0M
         1pP6PJHRBFg+h1ltlJZycyYIwFiWqylUZAVSOsK16VKLgp6XHPleHVTM6rVuNCByXiVv
         4GTwnAMk/drrkd/D3ZbjHpDr2NszDRBGF9uxwvxqmS8/RVEpAD3b6VSI1JpP8wbgsZO+
         3Dm8KX3Ep3EjqFPEmwpzerftrK7VnpLb6691tL2/9qEXtnhFhct8uouFz96K2gI0P3BR
         co2shXK4eXnDpAiBL0vkj7Hgr/VHsOhjzAi+c8bFoVsDz8wMffsgYGQkOszFmGbVcWip
         KC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244677; x=1794849477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4TaVc8RNeAzFNs1Ph3vgOybQkr83PU7asLdiABCA4EI=;
        b=Jhbs029hfEJZrMHxSIkCxjPqoxGcfLgbHfYpwdAEsyMbqCLzhfDNxLIaQ6+gsC36lq
         Zt8ZolFEfG5UVWh1OvJLF3hBHOg2x/kgTYe+mZi90vLlRoRzVioOfwEVb0RtQA1FLcoK
         1Li6hV+6sY2qXQRL05zOQQm2+CeR+xmVRRH08UXtdo6QZAMjbqq6In6XmxCwLEUwJYw0
         WAg6/TAnN+gCZw0JfSHHrSBxoq518DS9x4Xqq2kIqj/1QTnCanv//BlirCdWt6MHI0Xr
         4+CxlxeVbZ4pUjIfWC2JSHKYhf8KAs3k56o75EKgifCT3EYR7JBuJB2bwAigE5xeZaxP
         uTEw==
X-Forwarded-Encrypted: i=1; AL+hErEgFsW3RnrrCbCSJJMJP/wYfI6Kju+kCQ/s5bGq3rQcL5wT2bsTGXmtnmXBqV0lDxKN5tdtFADRRTq80apk@vger.kernel.org
X-Gm-Message-State: APuU4Z8iK9xw9yA3kfyhoDFIu1DKjtUI06yaAL//Jnn2C1P5lRI1i1x4
	zfBUv8bZsoM4MBpRwW5/uvcRwwiJxhqTLlBOjnK5Zf5xycFIBuJwX44+JeDM1WURBZQ=
X-Gm-Gg: AYBFou3C/ENz3Dx3Olff+zJx2x2PdknobNXQ8tbC65VOOqQJaAYCK81NCbivNC00ewv
	QRUnaE0VyEA5FSbWYBBY2hvbO2Iej7KBcc28HaemjDvnLsV3ah6lBDD3JTxIY3mXwSCAZ1u+K8Y
	1/GZb7voFRIe4NP4ZU/ipuI4D8lk3zfI5kPnk7Y0vUtQcVc1q16Oka87SfFN78KjW7aeMBw8Cas
	Ia+Za+UxxJZWxB2p2PyYwOvD74kCeiHqjkwPrNBD9xFcg/mXlMu4s22IyucocZSIqisBJTLet0Z
	Nzxr2dM5wIds1se/t/1T0MeQxf+TLVDU2ppyX1FsiAN5ZEmGiMKFqgAtR1quuVohjcBMhDKLXol
	2fIahXznNMnlfFfdqm4vnhciUXl+K2ObEb6gQHAXS95iPU50DUpXh9oqQNoA7oucn8+aFQI0h6O
	gJi5J6p53bh7/Mor7Soy5mVM2z8Sz2tr1ZX7iAk4shI06aLkj4i+FPd9ii7rbMVrt0+hS64d0SJ
	1odWeVJxhsRfxxcQGUt7zj38VO4K9DpH9HGH6E0htBWsaoxE2qjsPqRwdka+KwSVKL9Sb9dxtzO
	B2VCayDBR5aEIQRZFDIb7JzkblrvRlbxrLK7C1LBsFzneRtx7Cup+3XIBDO16mnIekMX
X-Received: by 2002:a05:6102:2922:b0:7d2:b348:6355 with SMTP id ada2fe7eead31-7d2db26a095mr1451337137.23.1794244676733;
        Mon, 09 Nov 2026 09:17:56 -0800 (PST)
Received: from localhost.localdomain ([2a09:bac5:dd4:1c96::2d9:5d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c200838f0sm156302241.9.2026.11.09.09.17.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 09:17:56 -0800 (PST)
From: Allan Siriani <allan@fatecpompeia.edu.br>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Todor Tomov <todor.too@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] media: qcom: camss: vfe-4-1: program the RDI write master buffer size
Date: Mon,  9 Nov 2026 14:17:50 -0300
Message-Id: <20261109171750.76883-1-allan@fatecpompeia.edu.br>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <7f8e0938-2b35-43df-afe7-18b0ad917698@linaro.org>
References: <20261109112611.94010-1-allan@fatecpompeia.edu.br> <20261109112611.94010-3-allan@fatecpompeia.edu.br> <7f8e0938-2b35-43df-afe7-18b0ad917698@linaro.org>
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

On 09/11/2026 12:57, Bryan O'Donoghue wrote:
> Requires a Fixes: tag

Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")

> This feels like a slop-comment which is no bueno

Agreed, it adds nothing. Dropped in v3, together with the comment above
the function.

> (pix->height - 1) << 4
>
> Silently truncating here is incorrect.

Done, v3 writes (pix->height - 1) << 4 as vfe_wm_line_based() does.
