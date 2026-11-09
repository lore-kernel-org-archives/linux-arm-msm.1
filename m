Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246184;
	b=zDJJB47lF3vHOfAaIKsYgUQibKZ1Sr/lkEferYTKhfiCGeVg4q6vQXlqRVhFBt77VcgC
	 9xIbWZ6R9wmcdZvBXjXMuj09bYm9OAUsmYE7k7XODBq12fRMUcm3qjP0IB877xqlV/3ta
	 WkuXRSOaS8ZvXBnKqHbdHBJaX1sMnhERuFHdHhg3+J2Q2LLjS+JAMVK3m7aEv/4tw87mD
	 nUDbrQB83GEb9gKGlxdke3M6arQGpr1EmH8Sv5uOjy2RaYrIwonO7ZtPHZtgc0dMEllMO
	 piOxCHuberHcRlqO9wJtbq8Q0YdjZedOn577IRKdcxgkt4+VjqCFfs0nWbbeNe1Jm7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=khVylZJu9szyxK0HpLJ36WiAKpNmjqrATEh+FOlyBps=;
	b=qdSWsp5oraNFS0s6dzQ2a29uVi1dkQsMLCxgWKQFvaz8n+Dd+FSfEL8cUDbLjk1vYJ2J
	 ZIUZWjU8TbyHMxjdxjgAxwu/ED+kLq2uADjz4Gx7FrQ39Cxf5zq2x54/l/vsPvJIg+nK/
	 as+lBEG1GyFIZuE2ctUJZ7LVRpkQVYswjnMSvBV/TjfJOG+Q918HgpsPOmOtRUrYykGyr
	 xmpTNxPAMFZT00qtTKSGXLmnHys6892F/XlRuoKsZJKUNaO2rpNQAP+yA4dGq2bgFecLs
	 wYOBYP9f1l/v6QTmv3TF816bESY0Nf1oH7MIDNF5VgQxBTNfuUsu+ljuN4Ll2fdSFcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ckZoDddc;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD268606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 17:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD268606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ckZoDddc
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4919a880834so750347f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246182; x=1794850982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khVylZJu9szyxK0HpLJ36WiAKpNmjqrATEh+FOlyBps=;
        b=ckZoDddcTDuBB8D2f6vOtjEQlPoWOfaWhUmDEC61PQ0X0I+yEL4gEl5NEH/GGcwKWJ
         m0SWLad/8xv8sXKhB2ex0GoEl/vKHwM4LWi7D4bbNIyr5KUfSAdRJY+CM/A2eRweKoar
         7i0/2AzyZy97qJxXeaOO+fhMRwAPMikx2EC3jEzJADjIUKU5xqX9L+MtbWhs1NWclFTr
         NLmkJ+KaN4LMAT3AIypj3QwrDkVE1vYGvramUDwAix4DzDNmmuiAdd8KkGVC5ROtdDVq
         IPuncVm7K0fdgckXudrURlG7B60nVfPuG4fDg/J4bz7uc0lyfzFoJyKEUW4BvlWXnLTL
         p9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246182; x=1794850982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khVylZJu9szyxK0HpLJ36WiAKpNmjqrATEh+FOlyBps=;
        b=tEKL6603UQPJzUt+FrKA33+JRp1vHZCKuq/IdBuH3XNX/tcClZ6kn7S6g+cUysL0j7
         Uj/O7+NMx+lphBxBHLp/mTbYiygcWoQta2wP72vXpAhJ5mcRe38sOhfI6T707U2wULRx
         suTnn7CZgX/74n0guVxtCTiHZANOfnnBofvYXdzfdNvK8zS2Z7xICumussDK4+WJK9ID
         9q/HJuy2RpBrIP9F8TmSq1zmnSCPD9Dsiau66HhyEFIfjduhieh31N/iQk8ORAEGEDIW
         XBcfVzDWQDrq51v0Rqz3PloDgHj6NR5SXaTtA2ggmRbdazlYkwL+fjJEaGpO52CtDmY1
         A7zg==
X-Forwarded-Encrypted: i=1; AL+hErHRKE8B9aGJKjmxSD3M0/4v8pAlCA/H4PquQpJnFHAyEQppPpMF6vCS284V9TKm1lAuL9F2Ma/d3zYxzcct@vger.kernel.org
X-Gm-Message-State: APuU4Z9Wxyy/yJoc/7piqpfL2nSo8NI8Ik0q1Mm/vln7sxh6ddY/M9uL
	yCzWK64YLipSM6towS9QIrupoJmOvdOjoSJiPev+4X50MjOkHzj63Fjl
X-Gm-Gg: AYBFou0izKiqJZTLWkB24NOQhcY/S7BmuoItwl8NvaonKyoBYODAKJ+6FQRf/e2Nxx0
	YHT9snjicBJoTgihIWE7RVnNFS+dM/f1ITlKah05xKCHQtguB56J9PoOliNaK5H7mhA1Tdh/ABu
	cUZnZhkCYlnZJN1tt54r7Mau2tCxzSHv9JgbLjJ5D15Hvf22kxS8joqs7ecdsMkC/khaIhG3K/G
	BG0c188WEopTX1qgrKFXR013W6VWVf7kT7HmUF8yJf83asMRfyXTjdmFDOR4W2fITODiWDZuhbe
	oJoNOqYARiijQ7ekmGKInjISfulAnsQxKi5rgNVlPgADWnj9TyLwyHMqHhUZPnlxtkUT+HeGUyM
	grGGorE2LfTHmDJtBiilr13gDRLdDaeqmNapr4xFX0urQFx+fThusNAZoZsoHpkGKd6hNbg6v+F
	xrSZheekLnVMLPG2wx5rUBSAeZvEu9VmUYvtITiF09/O8/+6VtzRtRxt1KR4pPlnt+NC8wX3mon
	2QhD8UweuQmCy0m5HTqYA++juRdDp5afDXCgIAqjT3ZjgPGJ1pCA55RIMDTzgonP7A/XcpYN+42
	EObKvYf/QlVBvUIFiBng1lrL2VA=
X-Received: by 2002:a05:6000:38a:b0:48c:72fc:363e with SMTP id ffacd0b85a97d-498309aed15mr286975f8f.44.1794246182227;
        Mon, 09 Nov 2026 09:43:02 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835f175c9sm157557f8f.32.2026.11.09.09.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:43:01 -0800 (PST)
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
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: document the Halliday Top Level Mode Multiplexer
Date: Mon,  9 Nov 2026 17:42:48 +0000
Message-ID: <20261109174248.2086482-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cdfwfoubvs6dvwojrjhryjejeqcpmtllu2ko7vhjcgxshgvsga@65rliahvcppf>
References: <20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com> <20261109-halliday-tlmm-v1-1-a181d54214cd@gmail.com> <cdfwfoubvs6dvwojrjhryjejeqcpmtllu2ko7vhjcgxshgvsga@65rliahvcppf>
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

On 09/11/2026 16:43, Bartosz Golaszewski wrote:
> On Mon, Nov 09, 2026 at 12:28:37AM +0000, Stanislav Aleksandrov wrote:
>> +    pinctrl@f100000 {
>> +        compatible = "qcom,halliday-tlmm";
>> +        reg = <0x0f100000 0x300000>;
>> +        gpio-controller;
>> +        #gpio-cells = <2>;
>> +        gpio-ranges = <&tlmm 0 0 225>;
>
> make dt_binding_check will not raise an error because it ignores
> non-existent phandles but please make the example correct and add the
> tlmm label to the pinctrl node.

Thanks, I'll add it in v2.

Stanislav
