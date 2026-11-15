Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744306;
	b=eLHHTWRlgG+CxaToGFVNc9iLwGAVpSAZWc1jBTmm2wtWXFN4XMNI1RwX5y/GYKcdUuwE
	 Kj4lTvrZbojZX+fK4c2FOU2KEFb6jWE2BpuGpDcqv0x+AS7Mv+hpi4xuEMZcxQGy0zvR4
	 nv1f/b4QSwHAPdALsaqI2mqKwOMi8bKSl8iEpSPd/oUf2fXnNSSNFdG018gLlhT3YXq6v
	 stvUVaWiUjHtgy9xagsLo7rAuuXaiXCsQahObD9CJEFt+XX6T97Oa3nObSI6XUb/oiDJU
	 V65iRzAQZADv2c+Gjpys2VGCxwM8pnWPIWKm/QpEnXJoRi/KaCT3dSR7+WHz/w71BqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZX7ZEhQfl7zn0ja70UCAxY+bTQCiZDULfmlHtdn9utU=;
	b=TCMjNT/Em1zhLbkOAdyl/rXHT7q0RZ+tp1PkokaVKpzGYc4xMltLUt21VLDNVDjpCeTR
	 zVPysyRMeP4853neQ7xtv5cRGSMBoWc1WlvsizQgfQ6C4QSDQ94RGmE1jC3pz3v3RhrjM
	 u6gaqh+ttxEq2Am/ATXNva8m/5QGGtkaQ4z/ggjZe4vHrstaWTJQgfya3WUFKrXf4w0rK
	 CBt6rp6wCbA4zK7lQkH2Ib+GCJEtylhU4W28aOBJSJLEwolbmT6+gpoMlVkcHOSoIOGGu
	 F+bGLvVhhkugy6GGyZcnMI27RFVCYJmXq0A5H/iTQXoaubZgjDcqdfRPf6j27aUlQug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BWNNjBki;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D95606A329
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 12:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D95606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BWNNjBki
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so33252915e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 04:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744304; x=1795349104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZX7ZEhQfl7zn0ja70UCAxY+bTQCiZDULfmlHtdn9utU=;
        b=BWNNjBkib8an+oyBZyJADhDa56gBBq04KQvE0jWVFpSJfKxpF4gKrAJaqtGgQ9A7Sk
         ojS6OtMdXCNiENKdce+QVKFflf9mEeRXGuwOfIUJ6ge95F2lMlClOFtMNlc4TMSPM0J8
         OV2FXRdUFoZjdPN3arL5fxZOttuMPOroAyZZOBC7Ur5ZUcnxq1huRbmcstdqw1kgjnAr
         p0ABZijR6NLOhZ2WnekX3RIVDKxp+9ngiyZWFPwfZXDz4vy9t+jSaKtI1nNue4l72DDh
         cQtlj1JRMaanxpySB0K8/6m66GzX8SQjTDawrPFHoWZ3u1MpjINNtwJRoQM1ToXyNUfW
         1a4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744304; x=1795349104;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZX7ZEhQfl7zn0ja70UCAxY+bTQCiZDULfmlHtdn9utU=;
        b=KuJEhNbmWO+c+Sd2ei8eUmqVX9x+02bi2ZXsed3Ja59gW8f1KMwlKHu4ipLUs+jkHm
         sR7EROQNe+T5IFThrmy3QngEU0Ka7zX6cahKY9XAm9Zspwd38TClfWhIsBOCMFmaQJM5
         gbR7iWYGGrK3g/KpsOa5uAoioV59POpWVR7ejvDhYEOBaNizvOkeP2gx4Pzusg0N5NY1
         8vAB+LPh1kQ7tNgxk23Xwh3GMZF+gk0ss5thIeMzL6QUwpegPCXbaQX4Y5rdra5LyUj4
         nEhkA+o2029RQRIKyrG7LwCGtFfhpaek/+4u1NV/ZEyR182xDGy/6P2yN7nyCETZ5/Ds
         39kw==
X-Forwarded-Encrypted: i=1; AL+hErEnfulieQFVIxgpRK0sgVpUJbx3byt+Sw1mHYGGRup9mop7563zaJygObtrqgcnPemUom7FTLWkfk8ERr9P@vger.kernel.org
X-Gm-Message-State: APuU4Z+uuEl2iAS9rGv7jbr/Ceq8h0GIzDo/ffuImTU2olStmTYXOQkX
	FbpG3eAclrC5IvgL57J5jM+6h8T/qegMtKvT1LSCjWqWtmZy7EKMTGYQTLBb9sBD1uo=
X-Gm-Gg: AYBFou2kF7YQF5vUwbHdCZkFXnQiITdLxyxGzohxZVPiHcf9mND9FENmrnZ09zARVrU
	Rl3A9K80FNnPJaOIaA2Ok8LfkUqKr49S6AeLCi0CBCCyjkZBrr8pYiKDA+iXaNkdpgRj0EqQxFK
	hp/uxmMAdWg2tPcXLqAxwOBFr9RqiDZp8sc2CVR3bDZysEDmTmmNqQObm4KhbQG98lVgKxEQJ5v
	Fv81kjNGlW+AVGPTNsvNF4q8Vs+sA3sWCGiCVWpsB3FDAW1MzM+p1g6Ipb4z+t14c3M96lorTqn
	2jBhznEqUa4ixY17LKKuJMHb6J4/cJjvOKOYJipoO0x1dlCPuATjb8c9vfTJDKLEmEXkXFH/tde
	2rJDmM5JpNzBUus3V4kkTPfqPrZLJcp/AuEMyDmc6F+Z86vmn9W4gcOiIiU3FvWTlK6Xg1bYspX
	DkNOi6/suOVNdCp/QfJAF00pighwwEmzuvphFZF2PP+wU8wS/B0EozfKpmE69AP/F2RWweuBQ/e
	X5gw2ZMG+J3JsybTazdN/H2mIMVFFHLtxFe9rBuIMyv1oUSMcKSuY2uKd34VshuXGJdlx+bk0Tr
	AAS3xCQbtFN0NjK6mY3YXWXRgFRb1H3Ys0lGTPMH3fU=
X-Received: by 2002:a05:600c:698d:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb5de1f262mr108419295e9.26.1794744304054;
        Sun, 15 Nov 2026 04:05:04 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e33ae5bsm267265565e9.3.2026.11.15.04.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:05:03 -0800 (PST)
Message-ID: <a4a3df2a-eb90-427f-8881-f857100779db@linaro.org>
Date: Sun, 15 Nov 2026 12:05:02 +0000
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
Subject: Re: [PATCH v7 01/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 11:29, Wenmeng Liu wrote:
> The SM8750 camera subsystem has six CSI2 D-PHY blocks. Describe them
> with a standalone "qcom,sm8750-csi2-phy" compatible, so the CAMSS
> binding can instantiate the CSIPHY nodes as separate phy devices.

C-PHY, D-PHY and combo mode ?

It would be nice to get an accurate description.

> Signed-off-by: Hangxiang Ma<hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Wenmeng Liu<wenmeng.liu@oss.qualcomm.com>

---
bod
