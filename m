Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794354378;
	b=nIWQ3MH8YXzT9PE8R+wFBSMfNs1xt9HxySMKYWD6RsWdDLIF0BHjGgf8y5V7U9AUQ+nC
	 19Mz0py21xsVxV5xIyDROdY9v65M8qN0Lnzzz6gyDE/0PhyYLIWoz9dEf64Z69YrUuCIh
	 9AOj7iuwWUWgn123BkrQ5mhy09tcQupWfgZREzo7ed4eytCe5dXxc5pzkSuXEV8b+t8QV
	 u6O/ywQQs8TJ+PUmYQOwggfG7/zjoPfUjJbY9qtFUaeGMx9CHoFBnX0E/c1mwhnHLC1JQ
	 yqalKajUiAvqjcKz+5DbVIA3AS6WfgZoj9t13fuxheA7zRa868mryVVPTGfRRDIFKyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794354378;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=WCdKUUEAMgyuIUvweS/CVZqWS7quwtCy3Zzak2dFXXY=;
	b=PMQTv22aTQ0Luo20eyrVrXN+8h/ajn7b+IwaPnjbVFEXvmCTdGlYExPMHGbAmnJeHU2K
	 3tNXUtWsKXvdN7d9Xsv+uW50j/fWJEIxXkAmgX7AuBJ2VEjAtNTVsXJikUpmsEWTKrHIg
	 NLq6ECilOH9CUtB0b2ToDhrWPpcRL35rebdYNYGL9GsdNzGGkY2eVaLEq05ilAQJHNZbe
	 es8m3EnIF7OvaNJ3x56a5jm5Boic0wl2eZ8xapQg0lTcwjv4JVqcM19Sd7LsaawcsNZK5
	 xhhHeUc7UEBycVYshf3yBovCny6GwjewFpFQFk7Nu9VF5svzThyZ7kGBP02HCZzxNOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D7D606A325
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 23:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9D7D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b335ef6441so23931867b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 15:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354376; x=1794959176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCdKUUEAMgyuIUvweS/CVZqWS7quwtCy3Zzak2dFXXY=;
        b=FtOwfPY0do5yAtwvrSEnK1+BxgATfUJ8wec3De2GJDGojU3Yoce8RQZbIGhMYQ2aHu
         edmmw1z2cmH65dcYFpJcOOCCNBYkTPCfVd8lIxeViRWGmXAtQqaTyUpYQHpb8zs/eYqm
         z8prQjHbqAP+v0MeLwSsOSOVcV3GFJ5X0JcD545CX9MfMHbmrTJgbj3QeAigYfUfs3cx
         ZQ2zkeNvehWdl/3UfZd+xl/AC2mK0ayArhzbFxX+nchnUHN1LaqtGMBwXQb7pI3rKwMj
         k29ylaZ3eksNJM4Bp3qFV3d8GvhlxCJP5BGPyV7e/yCN/T95M/tI1MPKiw9MZ61m9z0D
         Kd3w==
X-Gm-Message-State: APuU4Z+B8XQBMOpV9HYn5E2M3ls7MNpMZmeHPygvuHp0+2xGu6LP4raZ
	Sb4moHCW+Yg0ow/NoAAwU+Y+pfPVXs0vV8ZJ2BhnvNm5NELNXM660pU3
X-Gm-Gg: AYBFou0jIgVFlW5RYSLwngVz2au5gsuoyFJ4wRK5u+YeDUnYkgP69KhPKuCK+BnadL+
	phL31c+ipXu4ivOSEFhzfsgVqCQoUMUD2uMY3X6HFFE6HHkvOGOHt6o2whWBJxVIk4ZIM1bT548
	4GEy4lV6baJdTJnFRX3BdFwavHDSco6bH5drvm2w+aNJQHcwH1lEX8UvaPbdn6BHL3m6imMrdLS
	kHZ0M3VacAQ5tiOe++I/LkOYBZKz1yQjUBgBhZDZpUEAxxJr8lgIfxgeJBNsjWOEFKR+47sailE
	6zqPxp+JP7bj4H95LdpBXC0gbm/rKDDsWMNzxyPNgxGjNAvvrhXWmje8Jo/CN4i0n1e2QLS7HFu
	56CZbhoKF70TJsFtQWFsyOurzFEWfB8oXsWjcg2z1c6iY1EoxDIYm5qbvJ64EuJXY5dTe9jO5ub
	j9lh0RMTpMm3rPZVncNsK7WACSOut3S4GXZkhQWLWTgSAuz+WiJCLXjZ8NkLYgqr2Xegp9VGuhJ
	8ILTrjTW70TqjYiqIq0kbdn8CqRF55zy4a9n9rCXWbjFywMCgw2rOc29MLPcvABAirFxFSsH5a/
	vk6ISnss+TIN6VN32hRiPv+7YDsfNirtoDtvtDT/NX1ymSWATgkw71yE8EAkCvCkMYIJjW75
X-Received: by 2002:a05:690c:e3ea:b0:8b3:15c2:24a6 with SMTP id 00721157ae682-8b3a7ff3419mr7031107b3.17.1794354376630;
        Tue, 10 Nov 2026 15:46:16 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:2f77:7097:372d:6d14? ([2800:a4:806:ef00:2f77:7097:372d:6d14])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933c59cfsm31871827b3.17.2026.11.10.15.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 15:46:16 -0800 (PST)
Message-ID: <ab79818e-4b4c-4b58-bd2f-57d9ae4cddc3@andrewgigena.dev>
Date: Tue, 10 Nov 2026 23:46:06 +0000
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
Subject: Re: [PATCH v3 2/7] dt-bindings: media: qcom,sm8150-camss: Add SM8150
 CAMSS
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org
References: <20261106-sm8150-v7.4-rc1-camss-v3-0-0103e8a0bbcd@andrewgigena.dev>
 <20261106-sm8150-v7.4-rc1-camss-v3-2-0103e8a0bbcd@andrewgigena.dev>
 <21be3761-9da9-48c6-aaa1-b56f8625167a@linaro.org>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <21be3761-9da9-48c6-aaa1-b56f8625167a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Vladimir,

> That's an intermix of names, and you will get a review comment from
> Krzysztof about it, I stand aside.
>
> Here too.

Krzysztof did comment. I kept the vfe0/csid0/vfe1/csid1 order from
sc8280xp-camss.yaml in reg-names and interrupt-names, and asked him if
he prefers another grouping.

> Drop 'gcc_axi_sf'.

Downstream sm8150-camera.dtsi feeds GCC_CAMERA_SF_AXI_CLK to CPAS and
x1e80100-camss.yaml has gcc_axi_sf, so it is used. Can you explain why it
should go?

> Drop 'cam_' prefix and 'cam_sf_0_mnoc' also.

Prefix dropped. I kept sf_0_mnoc because SM8150 has a CAMNOC SF path.
Should I remove it too?

> Or C-PHY, right?..
> In fact you shall drop bus-type from here, because the link between
> CAMSS and PHY's output is not a CSI-2 bus, it makes it inapplicable.

Agreed, bus-type is gone from the CAMSS ports. It only exists on the PHY
sensor input now.

Best regards,
Andrew
