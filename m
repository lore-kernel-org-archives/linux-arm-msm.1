Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B73D305047
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 17:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783098600; cv=none; b=LRH/8oHmooNE/nHM+x0+Na8+pSZJjjPKQ+oFaH3LbiPOpspl8a4SMhxEk0J8cwjqgbbfuXfJTiod1HF6HpAjeyH5mpqyNz3BqR7icYBuHnzQDYe28ddoQ8thomzLx6Hm/EpwTFEpDIZbmKol8sI8SiigwB0wySuFSZZd2gnwGwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783098600; c=relaxed/simple;
	bh=emGfKnmIZb6rCs8OZKzdZXrwFmAuQEq6nMNa9HGSfnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=he2Y+t8Ufs78ZwfFX5W+ixpQ4wVoiRRrDPbgjFHQ0OOrzTC4ck8u4M2CjvpHnPiU57vXtsSUNQNqpG8Q/7XSwoho9uG33VVYy9Lg2569KElfWucWCj0Nov2tDG75Plh4xf/4HBxy85nIrzgsxMn8BSb/NqBwP11m8efbd8drXE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBHB2g/e; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBHB2g/e"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b779003fso3710395e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 10:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783098597; x=1783703397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BVVBWacKQnUKHRJ/kNMwnkPuIh3dvCLwl9oDeRFKEKI=;
        b=RBHB2g/e6ijufvET+gxYBqY51EkljKeCzobdWq//vxzxbADtOt1DHtWiD1jn62kxeh
         jg/sH1hNIXd2mcTRz8ZNnxRBcWrVOgZVpzjPNBCGTLXUI0C0AcdmCQ7s0hdNxeI3FNby
         j00JDfMXgQ4JADKOWr4kttn0twUAdl5Inpza4aSS+FGSJGcVBhqnXiD1k2ZbK/QjrM9Z
         5kBAsToJ5naREClrrcd9whva+qBwOpS8ehAulz5Gy4sHLyCP+JrcRF5QkeCwYlL9+gb+
         OGf0r4YVxAur1xQNYJwVrUhYZD33y7F3UnOmmd08vOrko9GurdPZCkC5Ewu/WFT9lbhi
         XohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783098597; x=1783703397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVVBWacKQnUKHRJ/kNMwnkPuIh3dvCLwl9oDeRFKEKI=;
        b=QmXHN5m/NzRrMycR6FjMzgfASuQwiRGih7UK0mDSpkjtC0+UTwBHdoUs658l7v3lTE
         kgmVN3eN1Ri601QU3F5FHQZ0VGzA5RW8xcRaW1N8VUYa9EnSFy9jfgVci0hjZe1usLRW
         HNFXa0ZD2vpE/+rKbIRpaJJ00IxYX02TcFsGhU4AED2RcHokVUVIFTasEm+SkEYYD7bb
         jUfXf+JjplL72Hz53YSC0XfSCoNqpLwiExNnKDSsiCiwniWSIVHNSijwqyUDaxaopURI
         fEUYdWkg3gFmRdmhtMlMbmuFGwXYAgov5NQmPQFP+JDwZGdAShB64VGgvjDsF3xDApD7
         FcJw==
X-Gm-Message-State: AOJu0Yy+kQPvMw3BuP8oRUgz63eXS4WJH1soBvAwaCDRNHFzvQ0QymHa
	F2QG5LyiWLdxIOXU0BKtaRjVumFNgkRVcgTsvQsfKt9OlvHJ+Pa1RYsL
X-Gm-Gg: AfdE7cmZg88X8khVqQ9TayZ9pnAZT6X0v43FBCOtqDTcxzWeZmGGBqcs78rMu+VDebl
	hKPjSE1YBztFOnVGxmPP02r93jURjB5oG2VSQlcjuAVrvKYPIW0Q4dlDzETkl+GMgySKRvRcpdU
	4D/pHJaOZcLq3k8dTj+gn4pQYHzc8urpItOcuKWLEjsAONjmaTVvX1Y8Uz/O9b4wSaveXZAEvpI
	KcOXA8/IyMZUTPeJ21/XDlmwqrYWFycbbD1GymncEyRNABN956iQrNJMseTMu7Yc0vKOogRPXs3
	UnV3fdsF8cmehBBi8MOS25ck9C/kNN81czen9nKsafCVzmDPSR+t3fdoaWFQpoWWzKONpuxOXJR
	BIE9J+mlPLkTga2wU9xZsSBXtt6LdcbszKUtEi1Rq+x8ABE/AqF0q+54FfPe8IYPkn1Gtu21sxI
	mm3eF9Xj8OXRP1r1O06jnrkCnAYp5mJXr0ryHiTegl7NXOnmBnTFSt3P5FKrrbG2RDnhap3ns32
	yJU6CMv
X-Received: by 2002:a05:600c:6087:b0:492:58d6:2565 with SMTP id 5b1f17b1804b1-493d11f2920mr1870605e9.25.1783098596625;
        Fri, 03 Jul 2026 10:09:56 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d91bsm919323f8f.4.2026.07.03.10.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 10:09:56 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <297d28ae-78ff-4a15-a4a8-0de6a9e2cfa5@gmail.com>
Date: Fri, 3 Jul 2026 18:09:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] media: qcom: camss: Switch on ICP and BPS as make
 options
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Bryan O'Donoghue <bod@kernel.org>
References: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-0-595df9e67790@kernel.org>
 <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-6-595df9e67790@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260703-qcom-laptops-v6-18-rc4-camss-icp-bps-ipe-icp-boots-stats-b4-v1-6-595df9e67790@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bryan,

On 7/3/26 16:51, Bryan O'Donoghue wrote:
> +	  be called camss-icp, camss-ipe, and camss-bps, respecitvely.

Small thing: typo in your kconfig help text.

- Julian Braha
