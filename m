Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214238;
	b=fcExAyB+KidTfGFoUVAY8ZkWYq2ut1zQJuispT9jTaTi8Hm2vG4imGHdrpoqM46Cb5Ob
	 h7xS5wUw/3Woh4ft45C5xNe/wByn6c32U0iK2elXLRYGRkB0Tv3pFi/YS/d56D6dD73c8
	 MiJ7uClqjgyHzsRsBwKgfG8gMneNP7uNS5XskiG2hYx+1Mw3hvKC/ElAckVe6XQmupE2j
	 dQYzBztB7yKRBdJP8ipG3wRgIJiuAjEUTgGjov3T1l9bm8CTymhtqXAiZ96mHanxsQyUZ
	 KVj5YIm/2K8z1jlLbQjzOUX9BJoECvfsx7n9SdhLSo3EhGzdj7BUn1E6SnrMtiNVNSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vjj4rdSbpcMkkjnNoByhSOYk/2BEXBPon42q9R20zeY=;
	b=3i3zSp+O2iSiweTj1XdL+i033awQq1MiIXJU0EPOgRI7hf0iD2ExhftjswXrrJX6myJf
	 R6H7+iCUiaQiNi2AaBVnLlgdq2Fnm7bex+LWrry7Ef3V33/qjAHRMGUaEx75duwNwYzJT
	 EjpfB9Ld7qNXpXbiX8OE1cZLra1qbjovjh5Buzzd0p5L7UV/QYc+LTXirL6sQldqv7mBu
	 xUIfU7zHGGCz8AHdMdIVbdBvFM9tase654GbW/9Ff+u6K4rg/H/71YlLw98Us/FOZYzMB
	 ZXcFxt/jdDE0NqEs4dPswR7DSeFMzu09eQresof8x2qypOsY4xlaTyOWHq8ufXN5zbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGqde3Ho;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35C1606A335
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 08:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35C1606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGqde3Ho
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso4038085e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794214236; x=1794819036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vjj4rdSbpcMkkjnNoByhSOYk/2BEXBPon42q9R20zeY=;
        b=TGqde3Hoeoi+P+P1MJHy6yFa7TDuVfP4g4ZGwX2ih4xjRGjRFWnypRzOP1Xa4L0IPm
         s/DPVbSTnEn6+vQabgyMvzXoPqHofh2/mImSCnYL5a12zXk5bVCjZsmkY8NnMPUi2SVc
         xAgwi/orvf9pFkFiAXO532yOUQEFgNvW8m3sxgUIowoBqxTIMXeJ2WTdj1dQHwKMPf0V
         cCNQoCDDyIF0nns6PDu+LZixogYHFd2CbQ0mtJSAP17FhsmRFJQnz4kJM2w5Emebd5cL
         Ug3ZqCYI9cMwu6iJ7WzAlyerv17zrvmPyC1IUPu31nRNXyg9pX/XYW5Pjf8n++ZvU2Ya
         pTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214236; x=1794819036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vjj4rdSbpcMkkjnNoByhSOYk/2BEXBPon42q9R20zeY=;
        b=YePoRzPKeendf1u46MLHuUTEsoqWcPR3I0K9+OcK6QsRuteVAXHSDaeQlzxOkiZpax
         91Un29rjuF3S7y0wKocL4pc+bAMFXoNOR/KMas4t3nijb9ZwNVNyjSMJoNTgh3LiC+vN
         fcOqMZ5YZ92jcM1KUk1iYzBEHxeeRlV/WrikfCxImkD5DkvWZBkfH866C4TXHh/HWQjF
         KGJomOXBB3704geiXQx1y/NGyczJgM+GUFLPqPVJ9MJBs9GQUh7LDf1kSMxewWT0NNjl
         tkFji3pcHOzYPOdJxoXQLFaGmk9OPFWmspjmzAfWrIv5ns1nw+UwTX3BEjADIl+Nvq4k
         fbcQ==
X-Forwarded-Encrypted: i=1; AL+hErFDxkUFCX+8u7XhOt3gibX7d0shAGwt1nPC/5Vxnbwx52a2Omd++Z3japGYzlsi+E3ocKNNpuDznYa21GPR@vger.kernel.org
X-Gm-Message-State: APuU4Z9xLKkoJeh3yLCQWIZxe3cqTrnOwMhJ468wIQ+ciwcWuonyhKgw
	UEHNQLZNH/VxhhqIas46dUOm18OXtLN7IucHKaS2FnfnWqs7O7UBwT8U
X-Gm-Gg: AYBFou0DxvavjpPAdszq81YNQ5EYXNMv4HOymA0xvPytdYC9Ixh53PCI7U04bB9kGSd
	4CarUSgJXNlwdG2ma/pEUm1vAnpf6hgpfhKdkOh9JZcab/PKkiaS4WHjyfQWlf050mBD/I21AEw
	mD10o2Ql2XMduOMWq+ppArFX1n8Z/16lyN5FBqVspKervrQkAgVOFh9OnYLokx6qEVv47q+AVWY
	a4FLP7geqis0rpWTZeUerGJK6iX0A79vVV1cEwd4aeVY0gvyyqpfk8Sh2CujB409k2n49MUpc3Y
	NVDCCt5hi6McKYhQxxfKw7ie4lRfSmDDzR3VOGU7M825C++z91TpFKaP9Yy2oJvJ3Yvhhf6yXk7
	qXbG5JOssOnooZVThux9zTVikhBC2pRxvmyqxKiDy4SC7bGNfODH6+G076aHlozERP2JJtbmObB
	Lryfgnszbt42C4+uXxnwcfsiXYjIHo2Zaa+WGpIWHdR92GBLOGfjtzitIfP5fVgjVgRj56VRKB0
	m3JJyOuW5B7Pqsg+IA58+Tn5kAHZBVWVtj40L7L9PfLyHsJI+T/x6WLrXN5AcnOYfoDzT20/3GE
	8gBfLPGpw+xTLK/US9VVBhspHVQ=
X-Received: by 2002:a05:600c:3b1a:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4b963c7e496mr65389125e9.29.1794214235848;
        Mon, 09 Nov 2026 00:50:35 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502d5b1sm147015055e9.5.2026.11.09.00.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:50:35 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lee Jones <lee@kernel.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 16/17] arm64: dts: qcom: Add initial Halliday dtsi
Date: Mon,  9 Nov 2026 08:50:19 +0000
Message-ID: <20261109085019.1751534-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9dbfc665-089c-45f7-bca2-74caee322885@kernel.org>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-16-289114ab8197@gmail.com> <9dbfc665-089c-45f7-bca2-74caee322885@kernel.org>
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

On 09/11/2026 09:29, Krzysztof Kozlowski wrote:
> Odd license, suggests you copied it.
>
> You should retain original copyrights as well.

The license is BSD-3-Clause because I used sm8550.dtsi as the template
for the node layout. The values come from Qualcomm's downstream
anorak.dtsi, which has no license or copyright header. v2 will add the
Linaro copyright from sm8550.dtsi. I'll fix the other comments in v2
too.

Stanislav
