Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784D25304B1
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790120381; cv=none; b=KySYDRhjCgrnA+7g/h1jbrR2ETikCNWJop3Z/PzJIOqVVTDSyzGhXi0YgrihhlSav8psqJMY+8l+rdYssL++joRGLYCkZ4LxjQol8oCwSaYzi73Sfc/XCQMCZPFTIyWmo270xQhGAinlOnkpvXKxxdt6bdnhMI2fyTjlzwCgTaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790120381; c=relaxed/simple;
	bh=b4PyemOas51sLYTItG1LKlf5UMn0KctJVlyzgXvS4fk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=jbrFV1Gl/bj0+zvmlByIb5Z7pxc0B3zpaEkwtEB8NMmksS6WbQ4AK2LJnamhYEffDLg+pPDYPUG3nxAFHdG/KiDqFdofbg66Oi7ntkSVUZMQKQM3pJPI56er7GU9ePXYPs5OH/iuUIOM+hlumbGi27pCeoKBZ2X9jF1XoqzvKgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nGTZ3u/k; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nGTZ3u/k"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so1424055e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790120375; x=1790725175; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b4PyemOas51sLYTItG1LKlf5UMn0KctJVlyzgXvS4fk=;
        b=nGTZ3u/kWzZEqaIqg+axaFdnzXCJuW+PrSaAzT+4cTEknGMQsJCLDJswUVeF4vneU2
         OCNR5n3p4ybKz8SsSCLFH9Y7apg/H75Z6vi8sMhlEI4ulO45TLmN2LREXMfWQV6Jfxrl
         TAulGa8oSGX4hTgEsrnoEuvfK2h0HEoZG96cGEmC6HxonTbIKQQtxShKcCxd/S7UksNi
         y2qjltP1TzW7tTxobdyQYnkAmrDLLpB8PfE1lRe2OGkR3Mzs8xaPdFvZWoiTnQo/FF39
         UYh+JdFjfZIxInLB2dv513cvYG95H7rr5v5WpbMRMR00QetKZ+FQGhN2EvJhA0KxXVOC
         6Rpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790120375; x=1790725175;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4PyemOas51sLYTItG1LKlf5UMn0KctJVlyzgXvS4fk=;
        b=yq+Joddim8F1tDy/bD4WRWT4bbDlpnRzvEadk52B2sy3m/DlL052dvCOOKlLOMX1kc
         /yHfT1ORDnWq/nxBW6KB/yiLvNnHi9YA+nbJOBje+Jjb1+pr4ShFriV9k9UFA0oApfAI
         1Z2n3RAXRtdJMskJKn8Zv1VnmDtum9BDGrMGO6MmVxUP7PO53AEEByGczWmnJTP5jeOh
         4JPzZr7cBXoHGXzGnYYMVU/617iLZJNUtbMUCtmJ+qCiJK1D24+r4xQmvTiDoqaLZSwe
         B1lMBWoutaSWmgcy5Jn8dCJbVjn/fFr654algaPVUvMS6K5CsMZ4vJe2HWNEstmZxVr9
         Ehmg==
X-Forwarded-Encrypted: i=1; AKwUvBzf9d4Xy8HGg3dSoP9hi5VbSkRaXJI3knegXSOksydPpi0PeYfBpxo0ZUdM9OFB0PaMZMEvDsvI+KZsrtqL@vger.kernel.org
X-Gm-Message-State: AFuF++k2sOs8/VRBPfyZEwhImTpXMbQ1VlzOhkAgY5qZu68/rX/rejgl
	USr7CzlrCqxnm1F2U20F9+aS5Nfp4JniM2pQykiwE8Ys1aVAKxC6CxNKkPfkS+IqVC0=
X-Gm-Gg: AYBFou3A88Eudbv+aFLNRiNRHmwXR1FaITE1oO75fOQuZ973td2VFGXYU6XV5p2yOxy
	QlFv8KLPX7JKd3/KQ4qCXFQ7AxnfmJxSQaD4vBJnqmbKAaulnJ4Okrlc9LAWaPy0er9t8gpsl5M
	TkUcfSG0o0L9B6Ho37ciTiyk36AqytC7TxxoCSJYz3acu3433Q3QlQ1qZChTKMYWk0Es9Y8W0gM
	MxUZS3d5Dn8fHqT4BB04vkILNsuOFJnQqWHlZZO4QkJ1gsjqWDSc0oMhtPHzhySXQ4GlPJM2Uet
	hYHyx1QNTsC5CrU0KLM7zZxM2FQIyx2DJOuhYg137dqFB/uo4+Rw6iKvgfCzP9t0hoH6z8xJQfe
	E/AOzKAIdwLhFZe9SvvcCEwjaNfnG9lyQwW0TEdmnPHP7mczPuA1pQbZvQjpu9KVB28SDBenBue
	zqS5v9V/yjgaK1EAFJM0jRCUjt8HAC1GaeQx7gzWXru8BlxY5KbvhrWi0HqY5W5QiYhwd+2k946
	UZL56xFeg8IHyLKJ8rIFA2J1BxraGhrkAN+lDxBvxPgHHZe4Y9Ys9sSMYSySf8ryULvYA==
X-Received: by 2002:a05:600c:4f84:b0:49f:cbae:3414 with SMTP id 5b1f17b1804b1-49fdee0af33mr8327405e9.4.1790120375291;
        Tue, 22 Sep 2026 16:39:35 -0700 (PDT)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1a0e00sm23315025e9.10.2026.09.22.16.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 16:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 00:39:34 +0100
Message-Id: <DLM8PMZGW3LZ.37Z3VI9NHG5D6@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <andersson@kernel.org>, <konradybcio@kernel.org>,
 <sboyd@kernel.org>
Cc: <dmitry.baryshkov@oss.qualcomm.com>, <alexey.klimov@linaro.org>,
 <r.mereu@arduino.cc>, <srini@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/5] arm64: defconfig: Enable configs for audio
 drivers on Arduino UnoQ
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <d7e64ce498db8aec475b8652563c6cd8bc8cd429.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <d7e64ce498db8aec475b8652563c6cd8bc8cd429.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>

On Tue Sep 22, 2026 at 11:11 PM BST, Srinivas Kandagatla wrote:
> Enable reset controller and pm4125 audio codec driver that are required
> to enable audio support on Arduino UnoQ board.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>
