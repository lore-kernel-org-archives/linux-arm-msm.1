Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532889;
	b=y5ntU2iOLBXfPlTgCWcOYuI9I4wlxWBjBk3ONXfkISTpD/zC/PR1d6KmAjum1p1Pi8Yh
	 VuluR7DL2JlYYNRQHO2juLD5x6TFItTd0rkBQRV1nMKx90fz0TOip/xgRPUHdDpzXqR5r
	 rBt0Gxy3QAGCnbFlBEYOOiwPUkp+roSu5SruOvjObWwCl8RZwyoZc1y5G8bythx9wV7VO
	 7VddLjCEDnSAD0MOcWt2y65/Clb0MSAfmhoFwPhau4KSW/H5lRPqgH50Khyivu28irqge
	 WDwiRLl0+a0CMT0WZAjXgPXFsy1e3TqrFF59dHq4Tv+7sw34QdPssxCMrDKH7krOo2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=dS/zEZFm3CMfKIKMDJSYDk1UoNYMbw50K9+WVASna88=;
	b=uZf20vWtqIzpeOIBlQR6blryAJMN7V/wsZr+7EF++vMD8YzT0y8ajVhs/vVwvi7qlL52
	 RAUIO3M3kIhVn3TDRTMnKuGA9RwinSr1Vt/xrPdK6hsA5C+IpjqPnv5kf73unon9DMh40
	 KxYRVZyUFMkA419L89DViCznV0sIXx34BauWnpeXfrFRXi7gpqiehLkOf8RufFgPHvTN6
	 0Ncj3aSDlYhHbSqYVMB4KFpNAGzE6pzwzIvTQM1168zp2gLkOZhWw1nXIVOttl82vkOwn
	 /i23zBFSeVdKBd4foOHVILYDlg1I+dSpt0j70ZP3i3GZPAtfaFNkcF+BvezjaCsDkpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=huF2aXSt;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60D4606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 15:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B60D4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=huF2aXSt
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c1acfdb638so371213e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 07:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795532887; x=1796137687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dS/zEZFm3CMfKIKMDJSYDk1UoNYMbw50K9+WVASna88=;
        b=huF2aXStSJ3iFxCXkTKtIQdWRau9f3KhaHfnoWm4LkxmLu66ckgjoilV4M4Lc2sg/J
         7QEuaTuHprhXTIgZDJSpnbhXdV2MrKITuGdzJC33e8RCX3gVQXSGcsJ49Wc6Qi9y52ry
         EhdFJmEc5Nndcg0ajGWZQFBvSe5ZpVTnb20fIThl7g2NTFytiJ2lvBAHILrIYk0CfNsD
         EsMDhlz3clKlw4YsvjB6m/rWYTvp+KFGcbov/w8BfduICgSy8Njc2EUhItghetpN/fcp
         4C3MmiQO+2QWSXHPKsOctRpKDSM34GUkfKHgSXcCEcIMM/gOAAjHDobcPyUHpFEBp/oq
         h/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532887; x=1796137687;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dS/zEZFm3CMfKIKMDJSYDk1UoNYMbw50K9+WVASna88=;
        b=YSlHmkgMEfZY5dg9Jh1QWYEWOn5l/mMJ3rMPzMIq7uMtPH3ASwAX4x2Pcqq7y7seM2
         umOwymejL6azRyogJOlRGmlGAPANU3YCHtEa1Npi6GuhMOE3q0SGhOFAPsNfhw2xK/pZ
         0IKREFC3YuW71Cdwe+2CQrClmvTekquFUqMwa14YUfuOzl/zX9zphG7JjxKBbnKcRmsM
         wYcsNXORIzE/XkZcb/vBfVKPqgg0LtdhgTKvbldVfxIcXpTovxYn6yCNMtGF+/48fxqx
         yI6kXZw6VPtXJhFtwiMl9dhUdKMSq4OUahq23QcJRbZJuR4+6p+K3wjzbukIOV3OYCOS
         v4ig==
X-Forwarded-Encrypted: i=1; AL+hErFSVkMVc85seI8oi7F4JMAg4h60ZPXmyOK1h+W/Ag4QkdpRX6CtSfHfnIqeD+sx7W6tq2SDfW7+dn97RHQf@vger.kernel.org
X-Gm-Message-State: APuU4Z/btKu6Xj1QrTRRblLjVNn0r8lUhT4k8zkBqm3kjzBWCEuQW2hW
	Raw4OG2ga+MgoPngsemMitzpUlo/x18sqTK8pd+DawZ/PHAgAQ/ayZFSLvkMOlmgbX8=
X-Gm-Gg: AZFdTZcAspO884TPQGkxmON63mJNU6xR8pPOXqWr3rGTskP7CE1Giy/AtDvXMt6xucH
	9efy7+o3FGj/33qj/L9DbatkzmRU691gBxqQX9c1Ry2Vu8+MbXdaAPEULg7QKqFM/tE1vop/VEx
	bFAMcbsHXOG27AdXTdBC8wvQ8aQNl0ut50vnN+q1Xz8yQQ9w+UqbQUzvMfnC+oWPqPnn3f/9AV0
	LfO2RezOYX2MYAH3XzbNw9Kts/3NjFzLJZ/zbd9hCUH2pNPb6G9JcM108Gz7SM6xDe/wG3zIYJS
	h5Rrt2UtmPTrK2gzuyKgvw3HNzfXKfBrHqdf6DY64I52itnkqIRVo6Of+SvBSvN3Fyr3z9Bwx46
	6hAn7Xb0KjkWNbYQTetUQRlhvTuQfurKG+RJyNBNiaSCIlZInmuXlRhhxGOXgNTUdetonZWWCWC
	o+TsB5t7NU8RujaU7c8Li38InoT5Jsw+e/g2jVFAxgLsdMLMIBFmRU/CPTsbQgxoP5L+OPnQ+MB
	0XlptERbk29CfIfIdvyUpH/v+Hw9FZd34N4ocR86QM5XvA0KsWL1YK2DoLVv67cAhg/2nkcHbqD
	W8Tu4xPVDtQ0Qbyg/2UckLMobQsDl4J99OmdbB1Qhm2WtNmjZ2auvbFJ56fDK9Z8sp40g6XklfQ
	Pb8vfXw392PcI0yACa6tLxGh2CJL8
X-Received: by 2002:ac2:4c4d:0:b0:5c1:5703:46ed with SMTP id 2adb3069b0e04-5c308ed81f9mr3280060e87.6.1795532886937;
        Tue, 24 Nov 2026 07:08:06 -0800 (PST)
Received: from [192.168.1.101] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff6e32sm3854033e87.17.2026.11.24.07.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 07:08:06 -0800 (PST)
Message-ID: <725d024b-ac3b-404e-80e1-5e3d6f43ac65@linaro.org>
Date: Tue, 24 Nov 2026 17:08:03 +0200
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
Subject: Re: [PATCH 3/3] media: qcom: camss: vfe: Eliminate ever expanding
 src_pad_code switch logic
To: bryan.odonoghue@linaro.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
 <20261122-camss-routing-fixes-v1-3-0deeeaca2622@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-3-0deeeaca2622@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/26 04:10, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Every time we add a SoC the src_pad_code switch statement is expanded. This
> expansion has continued to the point where there are more SoCs listed for
> what used to be the exceptional state, than the reverse.
> 
> Invert the logic. The exception to the rule is the old SoC set there's no
> purpose in expanding this switch continuously.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
