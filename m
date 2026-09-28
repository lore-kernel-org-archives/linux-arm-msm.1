Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D3E3ACA48
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790574298; cv=pass; b=cZ2JoyoT2o8I+N8GihFjypLyk4U9Oyp56kLAaXa45uoY7YRT+o1Iy8wpoQ/UeNtpVy1Sq0cYK3tI9b6Ld353xpeQ8PEoqnR5hbqPTDO1t2yWYH6JEMDTuBM6CCSr4GsgT7/Kra4zztD7M6x4AMqwxwvGqxbuPC+lOWKjbIDFmac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790574298; c=relaxed/simple;
	bh=I9Mp/Py13xSxFWieB7EbhwjPp/EFqEXl6CXyIvK73sY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VSNz8uHOrLgxpufsoN4qHKngT534glo0Eja1xitdYuE+G4d14LSHiFxQLvou6gQBKJ3o3PUcD+Tui4D3kD1U61MCg25UNTdegSJbJH6Bfj6T6fU7PLLjorxN18vK4LJ0XH3Ey8w90GwDneH0cfbRg8X1fR287T1V6hM4a3uRNl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnlEQq0r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKb3OSTt; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnlEQq0r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKb3OSTt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S0sTBw1478410
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 05:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LwgxT6g7CzK/lb0vgQ1MfEf1Woq38eVDHc4Gj0WfteY=; b=AnlEQq0rZX1irCcW
	e1eybMhm5vHLxz5hTbuHab+sMTVHDvt6joyW67y35GODMR06qdkalK8lqGw2/+kV
	OonGx7d9eWraCLsJSZtgG8CuOTY2bq1qEQoWyBXfuvcZMwS/80AyTrNvyFPaZe4e
	BhKW8SiuT/f6X7LxLBZw8TLjXdZApQ+0qhsImm8lVdD5bGieALA31FDkFDZu+WUv
	XqDtkqVdQbG5MyQaHyDFtSor/TfA+vjLzzrjng4VNN3gK4Ck4m4dLzLcvC3s50Qr
	HHCy7VoQImDgYYgIEC0BVSRgG9MIRoTnbTftATleLWUl6y7MkBQqk6Ne2jHCZNL8
	I8ZnnQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx526ms0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 05:44:52 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6711a336db0so3994830d50.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 22:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790574292; cv=none;
        d=google.com; s=arc-20260327;
        b=eSCrIc3K+uVDynl3vTeJQJC/N1dkCLIKxftvq7dFN37wyJ0S4QwlDdTSrU6R70oZRH
         BchATwN4EtMLWi5hZgdkRue+07d++i6Tuf0GCLKv/kOA9rY/9m2JsYH+vHD3S2nIf12g
         rAbPHFx4ZlPz0oC+YuavHscn6ZVz0wiG/3ksYnp8yUPc1MFT2Zi1v/7eigb5iwRP4P6b
         SLRh+7Bhz+bYdbGaMlQ4bGWHJEiS8DHiyA4tu9kRGGE9bFwWY4b4Yy//XPAn/gVKie42
         vU8Fea508mgU1Szt9ZwMI0WFwX1iAUycjsUgQN05jnRHMzOCPdQEFXR+NZHpUKPp2E1R
         gvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LwgxT6g7CzK/lb0vgQ1MfEf1Woq38eVDHc4Gj0WfteY=;
        fh=K4JHpq0Rv5Fv/pc03/sMfp23OQYLbRvrYaVGMIoX3uA=;
        b=NBDMRuv32Lir17nsCLLrjrqmXvuaBMt69kbi/cBFYNw8imiU90F099OHCnwAptNckr
         R60fOmDLUy7p9OCqqwHxVuD79tT4R8TzlNGHhmP3fMl8iyDlsOiXtejqDgh+HYjFcATm
         fVka5VhDtnzwqOq+RWC+Y8cBNIP9d2/gxZkAOyYVG9utPoBCbage+RoBaw2eWhGrEsgu
         RK7uIcEZA5pINynxTNzqGoe4JS1ekUGryxLVAoY+IxMV8lGatwf65yrXC/x27PNkVkRA
         2CgBCyprOcHJtG2SO0W9ThxxKZZUzejk2hpeyumJg7Zhf9gufPsv8FYVQJ78ob9LsOXH
         dgQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790574292; x=1791179092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LwgxT6g7CzK/lb0vgQ1MfEf1Woq38eVDHc4Gj0WfteY=;
        b=OKb3OSTtXcbXxLH8ak6HbUTJDuH1q+y8yM5yRA9SW8J3ykfhl5Hc6bnNPSvn9+Jp8v
         WRfIKZveWUD+rlcvc/Durj01iyy5KJQnTL/wVBZJ4xq9Y7f4hdDufiGLEAfgE+YmFBp6
         yQhLjAwUPDYRZqpMKSJ+ADN1nFTYREDQaAj7uDUszPpsrUlqTH0MP2XxA4outVFN/703
         1klRLVqapIz2UNc0vsbj6ZxUkeCkOgzlDLjOxE8YniCKzUOLsR+xGMYN8F4efgjv68/Y
         yVfNdnxFeqg32Dg7YpjBhJxLAsYfK8aQMIUzOuAeGe0MNHnrGHI7LDXrTnCph/UgLiok
         SCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790574292; x=1791179092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LwgxT6g7CzK/lb0vgQ1MfEf1Woq38eVDHc4Gj0WfteY=;
        b=dSITjfWBcwz31CSIXTcaTXAm1EjEFqIXy/HnOKNZQ2nDtT4kCbTmh+rY8iR1GbqksY
         4bAGtYCYVubGWUU+jH+HNisHS8wwxIfe35xMoRdAD8fdHglTY0jS1AhLkpGdq3uRcqqJ
         7QJATH7Ivp7mugfTeVK6CgZhFKzIkQDjshbhnEh9nJs7oJADUg3lWDMArLvpHa6F1ijP
         /BbL6D5OYQPiSppId6zXkWosax0gg06nVKyJlBNAAA2lGCM1Z1loNJMJwy32K600pXJT
         hHn4IspQN7BXpAWLM3Dy4eVT4m6Ytqg/Za24UYQoyvPugt+P6Wwb23umZnJg3ir7UIIK
         17wA==
X-Forwarded-Encrypted: i=1; AKwUvBzYy8mOP7cM86S05aVQwYedRpd9aeXudDFlLXfWt9uaAmlDG4xq2Ug6M6jHeWppWfJ0e/5DmDzra+C85BKi@vger.kernel.org
X-Gm-Message-State: AFq9FYI3Xz1oCh0Yd7lf35Stdvry1M1BrBEdt9zuY4bt+aic204AQgmq
	XaCWlcO28MaK8oK2aTW/uJBAN1LEzkuswsEtSHd9tUBopilDvbn4TD1peQNW4LPACNlSuRvtPZf
	bJa7YjIZDYD4Y8SOAvNPHyPVfngON8jgXXcQIuVMwsM1y5TbcMd85tD3B2ZVblAQBrIPCp9IHUA
	UJf8XJWmXzynWYcELoDlUImJB1jhKTrjBVADEAHO5sWaU=
X-Gm-Gg: AYBFou0GyuxyVxw97pgKp50Krt6rLshLN2a2L5hRgEomdnXOd+JoyPF6UcziFpBvxgi
	JTNicA8V/BnD1ZsRWhOi4RKhn8w7zOssFzK3xPbd6Q+gVmNwZ4qj3oYXx/Jh97yjmV4QWEvWphT
	dZBaH626N4eU7tv7weJavN7rXYnl+ewBYRElSAhev64k5V1OYM0kBzMX6UTGg=
X-Received: by 2002:a05:690e:4004:b0:674:1cc0:3523 with SMTP id 956f58d0204a3-6741cc07025mr2873105d50.10.1790574292220;
        Sun, 27 Sep 2026 22:44:52 -0700 (PDT)
X-Received: by 2002:a05:690e:4004:b0:674:1cc0:3523 with SMTP id
 956f58d0204a3-6741cc07025mr2873087d50.10.1790574291796; Sun, 27 Sep 2026
 22:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com> <arObexxuRRmQ5qqw@sirena.co.uk>
In-Reply-To: <arObexxuRRmQ5qqw@sirena.co.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:14:41 +0530
X-Gm-Features: AclHuK8wlZTyoF8oTJGu3l_EQgkbegRC3BqnooxmGUCthXkptRkdIGPllML5mPo
Message-ID: <CAC-tS8CpbnvV28AtziXzOd9CTCwN8ToM5JqFXPRn-4h3=GAGog@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] ASoC: qcom: Add QAIF driver for Shikra audio platform
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VvS2kO2n c=1 sm=1 tr=0 ts=6ab9fed4 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6K1A5ce8U_YVOHI9IiYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-GUID: TdrwQ4TCclF_cxj_algdfzi5Ep1YAFa8
X-Proofpoint-ORIG-GUID: TdrwQ4TCclF_cxj_algdfzi5Ep1YAFa8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyMiBTYWx0ZWRfXxCBMMShjeAB4
 DSbF8g6j75y4BpiB3w2E7lNyBcagMYn98tSXW1Myn8U0YHB8atxqt0nNmHWq3sv838RuhnBgdPF
 ftsyES98SWmd82OugKk1h2t/qXm6Smpubpu2srsGaOyxZzrcs5l8aQbDMz0+tfWnry5XkSS6yh6
 oExLa2uZKa/wxz8PDcEzU18UskQfs27EGOMsgcNxri/bLjGy6ahGm6odLFINWG4UZ2XsW31hDvH
 xYixfMIedbW0YkiQkE5pc1IkFvYZBnGBXCWRBsg5OKTA/5W1u/Gh1U9cp9hHvIKc6+02Elbt8tV
 GWvXFqswC1uB9WmrqECWRd4GhAOwO9az+1oQaZcBimDxk9/Ql6902MbqVitJhTexDN2dckhtFK6
 H2EMXvSqqgasGCf7Lb8bY/RQgLTwWgUEPCPqb7q0LGMb3MZgm6rexFQ1DElol2drpNGCHeubM+Q
 9urA+7I74ydInFgXv3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyMiBTYWx0ZWRfX5cTYM7DmGHE6
 JLLvX68RKFZRoEkjlzRFOwPRyap+TEMBLtY6P4vxIMxU4cqEqnjodLB8Om7YI4SP/Y8uMCaBQuW
 NBpJgxfBlK2hDfrQCtyTm3dSTFtcOao=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280022

On Wed, Sep 23, 2026 at 2:57=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Sep 23, 2026 at 12:18:20PM +0530, Harendra Gautam wrote:
>
> > base-commit: 46e864b539a2d2f6c0e5d08623654513ee50c556
> > change-id: 20260907-b4-qaif-shikra-audio-729007ceff72
> > prerequisite-message-id: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e4=
5@oss.qualcomm.com>
> > prerequisite-patch-id: 446fe28b27dbf5ce4240704d89296a5af69e8b21
> > prerequisite-patch-id: dc5ac9645789f25b3742dc4fca08dab4c1e4826d
> > prerequisite-patch-id: 0521512205679cad2462ecda959239aadc48cce6
>
> So, this does actually apply independently but does have the
> dependencies above.  I have repeatedtly asked Qualcomm in general to
> please stop sending things with in flight dependencies, it makes things
> very hard to manage.
Thanks for your input, Raised with dependency to avoid any compilation
error. I see that the dependent change is merged, and will raise the
next version without prerequisite or dependencies.
-Harendra
