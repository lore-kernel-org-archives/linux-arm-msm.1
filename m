Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138461;
	b=3V5cDL/dxGBMjPkgZ5fZElRMnnPi0X0oHt3i9Hfs6LAl6vsmhXgd1gT2yd+/dVHxTqWI
	 7+9A5Bub+I0VcqAP7ELkaPmHA0F1j6sjwiwjIcHfG9DT2HVX8u7QS3XFr8JGgZ1UYbHkR
	 TlmfWj6s+xBoFL+KPliQNCG+0IGJXWKHf1y77vqh1gI3FL/NL7kqnOu2yLEaAMmqqROvX
	 b7A5e370OR6oqer/wKu60qnes//9bxF3vZPLMQu5kkr1qBl3iDJ708WMT6msKKbUa2Ttd
	 eVW+jt11JAT/dhN+o+hOEiT3oI+HWne5F81/dVSNUUacu1jU0NZRs38OiumHNKtXVZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N8zDFvi1hwLlYUjQ4trPMNS9MFLc9+fuiBPttzeF26M=;
	b=zzf2vQjGfFtJuPMmctCHQatUvy7QKVm9ZbkYoZtp7l2vVMgXQDL94O93aImkExFCZb9O
	 jmpk3tWw6hwVvGngXMlFzF/clktkyVOiAjDV76sjXAUL49c3OLUlf7pFl3PdDxOd7RlSV
	 6dcZHDzRGkTYNnEO3IN2jBkmXvRRXS66KIPSTIlTifpB/wxhjGh5bF0xgN96N/w6iCppy
	 mi0SomtfpKc98z4JiJZMWwACpLn1Ae/ydnEKFRhKKzUqzIgibc8Tihc1h8Jz4YHcAM+7g
	 4uF99cVvKKfwiGR1E4PANNC44jlDln6+j4LUfd6ahkditlZh8Vtv8Qjqs8lgG13GxsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kYDIvc8H;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54776606A33E
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 11:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54776606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kYDIvc8H
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso7902966b.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 03:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138460; x=1794743260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8zDFvi1hwLlYUjQ4trPMNS9MFLc9+fuiBPttzeF26M=;
        b=kYDIvc8HNmoGxfswBqPc/bn3mblGxFo6X+NJ3L6oqsxEZkkr+m4t0mn2WCfFkisaZO
         +KFV1GKZrUODGH1jwVzp2dNnj5AQFg8tobqawkkepyMCV76jlsH26F4xcbj5rx8O3AwI
         9y9XDB7H4Mj24QgP7ASo8k+gnbTy8bB844IB0ftN+jI98Z6wP7IalktLXytAnly4TLSb
         tnegld6MS9agPwfzU16YT5rqdpiykyv6RmW0AXz+25fiT4fvHfhrKl7YCilvolQ7pby7
         KCM2rNosTVSg6+YYd+rjunPAhjVoIVGBUQnx6yoLGsIubCuL3LXN2LPTQd2tbfdK180W
         7Oew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138460; x=1794743260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8zDFvi1hwLlYUjQ4trPMNS9MFLc9+fuiBPttzeF26M=;
        b=EE2t4Jt66MAIXIfzkS/OZAWz6HK/KhsWZLOMXumO74Lk1FnvD9yy/jx7Bgh/ECo4du
         URFrfABBy3iucG2ADhB0aYI4HjosMPI13cFM0JRkPIyW5ObzH/jCjSX7N5Lvb0WM2tVG
         xuGMrhmA1SyUIv9nsMKTxrP4BH81Sp1RmP7Rsr8ArYpQUJvi1tS5xUz6cHXjNMV7m11i
         nwXaaxkf9ESBCgVe60t5vHMpP3b/a2UYTeYsaiwMuZTIX8d0dPzF9/9O7Z8JGqsnl4pd
         5INcU6iU2HS3uTeT92sBC9zMLurQhEvqbtPyaJRU5k196tn+ZNafuJYClC0ErjYAdJ45
         hbdQ==
X-Forwarded-Encrypted: i=1; AL+hErHnHIoQeKVpFUNv2XR5CdEH4sVpJ8v7LzHMWyvYMxnh1ApFEjyxiHlhQhSUcQ4Wyy5Kuxus5z/5JfG1c2sH@vger.kernel.org
X-Gm-Message-State: APuU4Z/uJnW9N1wqRE0giwUaGqnDDKn6UYpwZXqlBuWEHDK+yUNLfGGk
	Sdg4tOoeOuS4hcCiuX5S/dn4mrBzm5FH1Elg3vnPIun/BO5asOTa5T3swGeciRsPtg==
X-Gm-Gg: AYBFou2RfJjGsod91fNEY8B+ONpYBo5PLlYAt0TcKkfg5YCn3UbctIM2uKmoHq3h2at
	YeZFuZMvQX22tg0cBvVK6c6J9jl9o4y7WMVRdOUoqr2vKvLd+KnrTaxUi86s7dpmzezlqS0WzDI
	xClyYeKh42oq2wU0eV/dtjCkQgxebOWDX5BNUpTnNvZZ1YSe1B1IbvhOduNkU7PiJa9F7g7cvEp
	rG98RSOKsstaIDWZQRESwkx1Fqzdpi+j1qb1D18zZv96ElG2wQg5vXnJSow4PsACevJqaqeT8Y9
	xMmA3u5K944dXwVWP8ceUpxVEDc1KtJ8HReyodpFgiJh8uBdWZcXdoZR44HkuCTRzyihvH2kKNG
	l5PkiWyeZJ7pH3/pS8jWmQJxsVlu22yZFdKvmrb2LinsCbkAGbmA8+hMGfC88i7RQgAfmBJilaw
	HhdNpdpJHOZs3+gEnPZTy3A2LTJg2O5sOEI63YeewI3X3No21bsRtQfehNA4AkB0J8DJwNRrYvT
	QWQFrSLaN1tvGiF6UvF8+VIO+BY9Tw7MV+BOeLQGdiPiWcs996QrlEabUYK//Ht4z/jpQFQ54GP
	6+GKrOzqZHaSXN7RmtmrVPC2AlKApJod1LMKCTjlnXY10LZhYpQR/Buaeg/Vt02Jrq3gkdXHBQZ
	dyFxLPtTJTI4D+4yQx/x59acYc0AQ1OnjlNY+hkfOiXYz04zF+IlUeEQGIne272ILDtd/8GoZai
	2Rc2vp8DGZAsqhiFS0ouIRlz98PnzhO/eNcpscQbb+8RV6I+XUwUqOb1u04IwFVG+XSYFJZECgw
	BVONMOQstkmJjEHgSregC4ZsiN3TfcctdYO1eOtAtxA7rTJ701pyGpKFbWTTnXtMEfaJX652wBR
	iGh1x5cdziY3nnr5Du9dnMLOunS+s0n8ODTzqSU=
X-Received: by 2002:a17:906:c104:b0:c4d:28c7:eb21 with SMTP id a640c23a62f3a-c4d6d4f9deemr95174066b.29.1794138459778;
        Sun, 08 Nov 2026 03:47:39 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f948c8sm56005766b.17.2026.11.08.03.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:39 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: robimarko@gmail.com
Cc: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	konrad.dybcio@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	krzk@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] clk: qcom: ipq-cmn-pll: Correct IPQ8074 NSS NoC rate
Date: Sun,  8 Nov 2026 12:47:39 +0100
Message-ID: <20261108114739.124995-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026120920.1667982-1-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com>
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

(Resent with the lists on Cc; the first copy went to the To:
address only.)

On Mon, Oct 26, 2026 at 13:08:12 +0100, Robert Marko wrote:
> Report the 461.5 MHz output rate so consumers see the correct rate.
>
> Fixes: 4e36f8ab45c4 ("clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support")
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Tested-by: Julius Bairaktaris <julius@bairaktaris.de> # Xiaomi AX3600 (IPQ8074)

On OpenWrt with Linux 6.18: the NSS NoC clocks run at 461.5 MHz from
bias_pll_nss_noc_clk and the PPE and EDMA clocks at 300 MHz from
bias_pll_cc_clk, with no orphan clocks or probe deferrals, and the
EDMA has been forwarding WAN and LAN traffic for 20 hours.
