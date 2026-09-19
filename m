Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E5425DB12
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 13:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789822903; cv=none; b=AesB4uZoanHJ8R77eff06CbdXfn9SVleeDWlYKJkCQLzg837GzMPUmaSXCz9ultTvtU8LNI4aJja2ytlil0pN/gMBY7XmRHoht4FrEBVqOLGGJgG6oTYOuSiPx4DKR2Hydbg296n9/m136gz81E+7FDA8WZNivo586C206SJ8+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789822903; c=relaxed/simple;
	bh=uA+HoBevpg+o3pjy8ENPdza6Bd76MyHGiCyS2GIOcHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q8D1CfjrhuuIqBttZEYhr98mC/7LAqfoF3pKQvofKQIrRqOsauJldYK7pLIz9uXieSES/gAQQOQdkQvFLPCyqmvLD3GAsMx6KyLd3y+VWAAF/zVEaBLBaBkEdn8KI37WnWpBdEwwdHvRoqhIFHTCBbCS/Tv3UE4pJiaHYQ15o7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXdyBIrb; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXdyBIrb"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so8384595e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 06:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789822900; x=1790427700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uA+HoBevpg+o3pjy8ENPdza6Bd76MyHGiCyS2GIOcHw=;
        b=UXdyBIrbzpBh1E77+g/CtssQ1/m0/osSFpCQH/9bZhhZnbwji0JMcFCd6vr7zWjhhu
         OSco+zmhnmhSdrtj7TLuXYa4zUB1KZuuUiD9md2H6d3s3LlAdfHs3SVUd2otPG42+9GC
         ViJeidk3BhQZbRR3/D3O111KYtdV3ltjfVd3YflSDFj8ggT3XzlgPhMD4SKHnYFXOkCK
         La6EKZT4EhFxybk8b5vg/Rb9oBOYUYWv/THvvU9VDQHmkXmmEmUgNOF9k613ITleCx46
         g2xkt6I1YgdhF/5JJmFyHpubOzCiWhT6puaw1n6nR27QjkWX+MqEQoua/o2nkgCcAlbE
         4zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789822900; x=1790427700;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uA+HoBevpg+o3pjy8ENPdza6Bd76MyHGiCyS2GIOcHw=;
        b=sLGM5A4WSSlD02aNrSZwCmICKy3boZ9YkqnCPvjLMYyBvFCam79cRodij+vUayvnrT
         Dj/uQwmTEviHlUbrKR5hhitnawt3m3jcm3l2QAkSkReYBYTctWAnadnpVr7Q307kvpnD
         rtD+gUEFjrH4s7JBJDQ/N5tlNv4yQ61gi0Hn7h0DAf0cnTLSegKfnrrW6rOseLEHqQel
         dOhZc2MkRY2RCKyufkHUjAEJQsFyro57I7Nhf9GZ+IW4fxCBmxl+R/lrCxI38Y/OlEuv
         vbe4d5GDEFJ+XzpRToJRut9ne4hy5Ew4q2TUMjyAhf2Nbu+JUBHJOt5Pp5ouY0BwzhgP
         dj+Q==
X-Gm-Message-State: AFuF++mOLQ4f1e6la6v+ru3wv0vFacCacepQ8EWNrMpNbBXDXL4662An
	zBDmQBZ2m8QAlHj855iqvPPf8DOBvj7phg6IF5H0r2sgRXSbHCk2NOjm
X-Gm-Gg: AYBFou0RUswTSwPGQVcxwlq+bvA1XN+TAuRonxpDn6OBy7dr6peT1CbjDEd5wOsmh1A
	4UJvQTyVegG5rpjf5AA5x2mLN2m+R4VqsJSpDkzoz3HmlV8YG0w+qB+XGu2D+1rv+LduPEx69jA
	gbtRhJGNvn5ST/Jnzp9Y38Ki7dTslu1Fb75gXh/9Fa+EwDlTvKZCIDb7OB67M02eWfMn9wf8Byj
	yw0SHTU+YkKuykbjm6mbUNivL58pBy/bPVwbeUGVKabFZ7fHYsh+CJw+Qh8DIsiuf9eL9vNxe5J
	cic68lxQy3sbBF9Hoca5Oy4hueC4ExGN/7JRSA3RQbi8mCxBQ1xMD7iPBG7GOPqmnoglFYOyyPH
	gYB3ZjvF0rzAjd+rzQ25R5QtmV4urwnu5xft2aI4PUJbtK1M+6VsxE6sqQH+IqGDFSKzQKt30O7
	QJh6UwksJB96HZYq15Ds2nKXF4hfyYYQt0kMeGOQ60gFMOUtzC8SMQGdo7rL86Jw55AdxsIBrcp
	+hXWpf/
X-Received: by 2002:a05:600c:3b05:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-49fc574194amr69801595e9.32.1789822899376;
        Sat, 19 Sep 2026 06:01:39 -0700 (PDT)
Received: from localhost.localdomain ([185.40.61.191])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fc52a5b6esm65037995e9.4.2026.09.19.06.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 06:01:38 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH 0/6] mfd: qcom-pm8008: Add support for PM8010 over I2C
Date: Sat, 19 Sep 2026 15:01:28 +0200
Message-ID: <178982288839.2267.636188297415440296@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jishnu,

On Fri, Sep 18, 2026, Jishnu Prakash wrote:
> PM8010 is the next generation PMIC following PM8008 and has similar
> functionality, providing 7 LDOs that power camera sensors and associated
> hardware, with some differences from PM8008 LDOs. The series also adds
> support for skipping interrupt configurations which is needed to support
> SoCs where the PMIC's interrupt pin is grounded, such as Glymur.

For the series:

Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)

PM8010 at 0x8 on the camera CCI bus with no interrupt line, on
next-20260918. The MFD and the regulator probe, L2, L4 and L7 power an
ov08x40 and the camera streams with libcamera.

Thanks,
Oleg
