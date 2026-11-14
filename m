Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794691849;
	b=YxMs7SnFN4SaQPX/+1hKpsVk49Ff9fgiktAK45c92V7MAVM7+Zll0xQOuRlTWm7taAbf
	 PNQe6eyKJLgJFeK/xh+SvXln/UBUMinoe9DfqS/1JJND1xKkD9CudU22ZDpB3A4ehjvSu
	 1TuDjJXtYeVWndDcV8J1dj8HNneQ0xCx8fFrZ/4mmXgcp3EgR1VRP4Xa1VdqbnvvBw6cz
	 HCYqnsXjGVTLPdmM1r3v0tk8wxyyoapqWYOxc559w75JEDqfeoQqsQBI7ODjPt03yv12x
	 YT7/bIPaprHJSoy17zt2dttYveuT8HGXsUah+zxiN3466pAIamyyYkIHfLq7EZZ4wtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794691849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=;
	b=VLbQYfcLZ5vZFo72pOcE5X0d9iB6wllgdSpiKkRqQsne3An7LjxCoeDd3Y8wDo3tXMui
	 cCuQMNlAgpItBL+G6HaR49T8oy4q+mWBX28M0kK4Txt18fIVyvVBNg4BAwBnyMldHvSyV
	 IByxjy5Zdc0EZgtK5W4efBiCgjC8oq1dtq7Ol02q9CmEQrFEL2Ujn+Q7NtMWwxx6697o9
	 G1otb40nN5ZMtgW+na9A+ybroLn7lpiKeYDPbuLi/Sr3o6jIALYQy8IEaaibU8T/s+ywc
	 edbPMNgx3XDTF7KUaUmE1VCWcZbCmK07Ec/KivdCx/KoNA/ImEUI8iCyAgi7dZf3d8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWlSLmZa;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3E1606A32E
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 21:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD3E1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWlSLmZa
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so22067665e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794691847; x=1795296647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=;
        b=lWlSLmZaPq3CwNa2GvJ5HLBZxwrHAyR4KYWcNLYDoejqq+bHE47WezKQusTce17cqB
         UTWjdD/IlmKTsXW86lcI5Re+obIoVIb9t86LrcMAeziz9eDWUmhlf0tEDJWLXl6iumFV
         A0KOTfltxQB7iH/1NZqAz8vQsctKFp7PZfZL10agBOyW0+/+Nlq4fquLxNOefQolK0q1
         7b1VyBrgPTzn3K2O93/7d5x0teNBV9W1gjmQsMpDfJX8yxuUQvPJ+6K/Js0FjGNLg/bj
         pddRJxGyyKNTa55ItmUV+vqh3pU2XKCHu2EjpM7+mnWtIVQHlY7yLwHWBA9Qc69Hd/il
         +DeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794691847; x=1795296647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vju4Tmf9HxWLCGDozxlRYY/dKPR1MEju5ORsVHds9AY=;
        b=T/UbN4F29Ag8QHu4B4WbPnQONHC2HRQLWxFM5wZ390rmrN8NSuyUTBEnBdpiFG0/nV
         b9+ShquemKFqISGasPdb8Y7Vi0dI+dBttDWXQsgmN7ypq7+eu3Wb+7m8UeAjiNAQuGV7
         J4jleuwsyun+Fl3fnYt3kaIo1BrxdyHqo5hdo17qXNOYWwSepAYLzP1W5ANVRj3jdU21
         9YDvYmOf7MtvHPdlqhF1yxAxzOCpZWwzS7zqTr+SFisWpF2AyLtBq1AGYKD5FqEWB93A
         bd7EO/ja53AwdkstAU0BjkkdSjhMEJqMAnePi0FOYPmScZXhBrkxanqw5w9xkPGVHUhJ
         DBHw==
X-Forwarded-Encrypted: i=1; AL+hErHYTPVJDouui9JRYjK6u3ZFDvnUdLamgj9zM3Jn/WfAKplpWREOf3PioMiCB7sO1Mzvoy/aDW8EZX3TpzX8@vger.kernel.org
X-Gm-Message-State: APuU4Z/xWFwjg/CXHnK8tM3DUvrwfLARkUw9xzqUkN2cOmYbpMi/fsLW
	J/PQ9Bbc9HlAR31zhmMgstKPakRgupChKJRYurhaGmxklgPB2EhEIBtt
X-Gm-Gg: AYBFou3Y21mRk6FFTQrdxymCjrclO2VTjEqrFxpLCk/tTWyvTVylaiktzGd+akkhScH
	qLlwz/8AcrN94YNTYc3VNFzzSlk3Yqx/nyfEaaaC0XYZdoKvbLHdAxr2ed8KKJDDMnIKUzXwWdV
	tLEB4jj5gx+i6vURwcuFVryYkwZzcQAmOpcIZl1789jtVUe7AcIEEyk7sm3zi+KpKVu2byZj6Ww
	THPX78s19KdZjPsZeZ+7JnzeA73JnVLKVGZJK50+AKES56KLKrNvBnVK38OYwYjPY6gLcnXgdI3
	RBoRFjMcpz/gtzKJ+osyKtQp2ar+Nt0XalQT6QRw2/zJry4BF38iemRNtmSjbj1O8Ha6Fmo7p3+
	HAZ4k5rpnnyOyOPpsP0cul/tT1MriCRm2bnlAaNVL/VP1UEoaKxxdXak3vcHSbpGOAfI/IHbck/
	fWpLLos02KXJf0idLoqoV/ohkdiSrElvHQAelmGoMgQ7mOx6hsOYFBFzPy4j2x2BwWh6Nm6smRE
	5oxixc4hiQJ5CZN+Nue2USuGgjow29lxDMRlkjN5P0IbxIW5EZqRNVVQSWRhdIEbuHNblPSdpsr
	EpbpFpxulRSAmYRraD8OP2DBenU=
X-Received: by 2002:a05:600c:2784:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb4e2918b1mr187322445e9.2.1794691847097;
        Sat, 14 Nov 2026 13:30:47 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4e2esm12803478f8f.36.2026.11.14.13.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:30:46 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
Date: Sat, 14 Nov 2026 21:30:28 +0000
Message-ID: <20261114213028.1933448-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0cac5090-a135-4a6c-8221-846b34ed5513@oss.qualcomm.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-16-289114ab8197@gmail.com> <0cac5090-a135-4a6c-8221-846b34ed5513@oss.qualcomm.com>
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

On 13/11/2026 13:10, Konrad Dybcio wrote:
> Please add the other idle states (D4 and E3) from the downstream
> devicetree and match the order of properties (psci-suspend param)
> to glymur.dtsi

Thanks for the review. D4 and E3 are already there, as cluster_sleep_0
(0x41000044) and cluster_sleep_1 (0x4100c344) in domain-idle-states,
just above idle-states. In v2 I'll move that node below idle-states and
order the properties like glymur.dtsi.

> Please use '0x0' for zeroes in reg values

> Let's break up such long lists into one-a-line

I'll fix both in v2.

Best regards,
Stanislav
