Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15703A7F45
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 06:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935198; cv=pass; b=QykZ5VbL2FKn5nOlE0uICkNwMmAH6TaP79/FeE44K8edl9I9b2xZww4BL9WaUObzzwXpoyP1b516DI+gHCNTyG6kCxAj2m3WQtvd+u1LuQoWxiE/nK0gYb/riIklaqCz3nkEJ6I0pCwtZcHWF5snEBZhYmBKH94A/C68e+rHw14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935198; c=relaxed/simple;
	bh=NKoJ6JE3E+luIRxglgalTNs8vDhX048M3Yn5LzxShXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DY1KGDYvFz9DP4qsqjqfMECFzoesAm67L6RAGzqAZHjIuuk0KvqY/An2r2AeJ5+wg1BgIttFhrdHK80lej//Z63fwdsNL4cjJdlpxvNZGEpvSYG0NmwDrJctIbm8wotBSRDEy5giv0U0qIlGYCJICBBwdiZAaff0GG9J18UuUCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/H5nfBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A7MPN6HM; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/H5nfBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A7MPN6HM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6893p0Tx3771184
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 06:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z9txVF1E2CwqfuIlPlfen4d7jX6bNOZdy7o/BqDBXj4=; b=L/H5nfBf/HUiNmWd
	unIzWDWxr38VJB/3XxIaweghFfymZGIYjltXc7ElRQUfChY1VY5Rb3/u4PVPAKDa
	4hYs2GtyWx2f+Tm3bFXHhaZ4L+Tp5fBJybix0R/I1LXJsrto2PAilf8fMuGokstN
	tmw3NC+20CfJgYJ5b5gDwKoMXvehV1t6CxU+6xwfwTl7WtENZwAnED3jVLPjmInt
	Oeq5+Dc0qrfWaE/E1AVq2GUGD+0JS6xnWskGiyH2YaOj0YO8d8WyviruKe/gj3mT
	jTlz1FES2ZiW5AlpvbYwxqkFOrFNmz0TFbTuLl+INGdvflkAT0WRxCPpFrAf0g/1
	SpJPtg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr0h1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 06:26:36 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66f8a19cf9cso6150158d50.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 23:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788935195; cv=none;
        d=google.com; s=arc-20260327;
        b=PnreDxrF25rOB7qSCuFQF4Us5vYybdOKX9UQBCGHtD21Wf6hDcLdCqL65omF7VI1Rh
         ypdMvdFTPqTC/yirJgh/afhNwNzmjaYXM9rA71BdNCOvrESfhSiL7R7QjEB7scPF4SZs
         FNdWZMNO+2jNCQ2wezIaMrERPioihkjBKk7KLbGLx6vlI5zrtrtva/ZKksx31Kem3KOb
         Y4C0TIA0F/iNc11fuL758TyMULBSRr79EuZL+Dt1PR997zK6KsitY5D/4GDvpORZ5otj
         YwbcsXDa9oaRZU+260go6k4U5pUV+XpQXKf8aJd2XNCvA4brUIUgICGRW7ODvY2vcRGi
         NrfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z9txVF1E2CwqfuIlPlfen4d7jX6bNOZdy7o/BqDBXj4=;
        fh=qVsDIh7Oi2VTxRoDE+j7JGmL8qJ6sCbksC6jVv1zOfA=;
        b=nRbGD1HTZXQscNEM05c31Sq/TKBMyifnRmuOpYSXSkg4o5+pQNYaryErC8hCq+Rz+t
         TI33KeSju0Bj8sORKWRPbKsSRCuWUrKzjEO3DSsJWbxDoteoW5VFQhY5mE+/b3GuEJI8
         CIUKCet1izJ5rbSxadroSSFYjR6EgXWE2vk6PCiZ9qX5fLuf0vSfi8sPRwL4QEnhGbU0
         +roX2pyG7xPct/Ro2uPzaeqAF6fPwdk+eDnD+ZDM9g6eRqvgrnebqLe4Dyu4we5EvD5q
         deubNhddnW2XsYQuGYTyCG1gObTPnCHORK5hFDrqBfbaxHqhmcyfd1+q6TGW6P04rJnj
         IAcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788935195; x=1789539995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z9txVF1E2CwqfuIlPlfen4d7jX6bNOZdy7o/BqDBXj4=;
        b=A7MPN6HMYDrQWv5fC5ucSz0zVoM9rf/CUSaTI7NYEKXyau+hILqsZDVmedrGtc/eSw
         LIF3pCsJOePH086YjJRAeBqFGp4VBphX4Kp4I365bmvTDeKK9E+9YBY8tXyNl7eZ1zPz
         yDiZ+QNAjVw80SbuW5LPAL36Mmhpzp9z+Aoo6a4r4nMiMixQSmI7d1WY2XwBhfvR45MK
         PBdS/4bQQ1nlty8gW885q0AC4YShGQGh2SXnhIwcngs8Bz/Ckpq/ad1M5k6zv1q5v4sa
         AerlRzzFp7AdQJOGsenT8dVN6VRpfFnq0jBOBzPlQLEBhcTOjcF8aKTgpE8WYzpJowcC
         VHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935195; x=1789539995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9txVF1E2CwqfuIlPlfen4d7jX6bNOZdy7o/BqDBXj4=;
        b=EUJ3NDd/S2aIWSmojiYh7QsewODr/ShCLzBzbIlwNhU6pvLKY0WzW/5NXUfvHwv6MQ
         HH/LQVxHHhHvDQusRpAM219DgjKd5Lby9uMQ8U5G0gad2rZtM6wPrBDZvLgrg3vpBosV
         OqfJGWOaDoJtvzLsgD+HQncftST5MG4xkRZ1879g4wHfq3NMM+e1Jp2Z044S1Y6SVmBB
         eq7UvE3IqLkOw/zauMp6QRElx3KilCinkdDxE0RO4Jw5nErw166GhMVrugC6brT0J7Wt
         udO2ysc+uNhOwB2b30tmsLDB9+oE4KJDV6xksVRBu5zWUofHdgW7Cg5GzrjGUfRuYiLA
         tVQw==
X-Forwarded-Encrypted: i=1; AKwUvBycoO1yVZhjVDd2Rhwq0JcAkaw+1eMriXVA0ZC5n7uCwW7axpCf1VQKaFP10wHifQQS5PbV/0r8ReTplw//@vger.kernel.org
X-Gm-Message-State: AFuF++lpAJKj8WvyY0BGaRS/vaaj8lYn6R/Faxg+JcCRxxw5AO6ySRn6
	5GelbGU9MUPTsWnxqdg8o44CCatqAxvDwaE0deQOao1u//96a5JOl+AisAEE15W+8Tb103oqTM0
	Oco2gR4WF/LLuAm8XidVV/GqVB+HOtz2oa/xnYdc0Rz/x8EXFBejH+oVJS0nSOMna6pYeio3gD0
	yqLkiHLXvHybsQc3IxbaNitZo9LAaIZbTZqMijTZLFNB4=
X-Gm-Gg: AYBFou1EGy0oG+qv0KlMWqRVum9KjDoTyNtQaS2LmBjoyM9JgmW3PYBKfQC5pNiWGJN
	PY4hqwp4SHPeSdE0naYk8TVm/PBEoGtXLaWALIHFZ0ucFzXXjCzHqn+cvWqSZqaJAv75GS8zfCS
	JsChpl+zPFPA2082GfVm3x4DWHXktBMt8f9BC6zVX3JUd/aLVTqxZHcV5SSg==
X-Received: by 2002:a53:ac9a:0:b0:671:b80:e8ed with SMTP id 956f58d0204a3-6710b80f5b4mr71250d50.34.1788935195181;
        Tue, 08 Sep 2026 23:26:35 -0700 (PDT)
X-Received: by 2002:a53:ac9a:0:b0:671:b80:e8ed with SMTP id
 956f58d0204a3-6710b80f5b4mr71231d50.34.1788935194710; Tue, 08 Sep 2026
 23:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
 <20260907-b4-qaif-shikra-audio-v5-1-6d8ad9ba5c9f@oss.qualcomm.com> <a69c1fb4-b1cc-4ba2-81d0-7f6488536062@sirena.org.uk>
In-Reply-To: <a69c1fb4-b1cc-4ba2-81d0-7f6488536062@sirena.org.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:56:23 +0530
X-Gm-Features: AcwNN1UG8vvPTUZsvntZ8kx4jgNLH5GSTTTzIh3U6QIOG3hHK7a5SxUyRoYHjrs
Message-ID: <CAC-tS8B2CFFZ5XvTmUpWj_FxfJvfZ1mu91xML5wABOz07aiWTw@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
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
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa0fc1c cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=CrgXKhL8gDnHMrsOWy4A:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MSBTYWx0ZWRfXwkMJ6FLHlwfB
 EkZpylTMK7cjHST02uEDW/xoqag1Wfetod40EMi22y62aDTQ2rfMnpWeME8PMBmPPKQoYAishXQ
 WZc6ICLGfiG4z/TWfIL37L44C/APSgllzCPirBEqaOlid3SqvzB7ZzoXRFcrNXsLkpL7JXTquAS
 mLyjvBrR2c74x7XwY36mryEMsPuHFuVGI3nD+uNpqVr8U11PL3FNIM9O/jgHm3DelrS3H+JfNDI
 ln5Uptmv3UB6sCGGZC6ssgeAhjWErcovwaevwA5BbxLFDQaWXxF85ZS4Dh62flMHYX93TwelkyP
 4DLNBEUP7hnTN2an3XL90bFUXhSk2GOOF+McCyKKu0XUuEZvwoYKOBLooaGqIqSsnbhVnrElaGz
 uq2lw6g5ofZFnJn+SMrwvHC0gpzTzL4m0kvXGwvS9i7ozq7eC57JbucYhjr3VUkIDe/4sKSpVAP
 1colE7mK1vHkuvfrQ1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MSBTYWx0ZWRfX1CCLUuTI9+T4
 z8yhYlik7K11e9uKzxZGC4fKZIEab9bG/1FB9Qt+EirPTV1iWoZxg9kdpWDjK4Xw96xnMpY2+80
 sg2T21G/ZJ6reCy7q6RV30JPF38KhV4=
X-Proofpoint-ORIG-GUID: j2FqrQVmWYKkSid2TgmF3YkI0hm6fcVS
X-Proofpoint-GUID: j2FqrQVmWYKkSid2TgmF3YkI0hm6fcVS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090071

On Wed, Sep 9, 2026 at 1:19=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Sep 07, 2026 at 05:39:26PM +0530, Harendra Gautam wrote:
> > Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU =
DAI
> > controller used on the Shikra audio platform, together with a dt-bindin=
gs
> > header for QAIF DAI and AIF interface IDs.
>
> > +  clocks:
> > +    minItems: 5
> > +    maxItems: 9
> > +
> > +  clock-names:
> > +    description:
> > +      The first five clocks are always required. Any further entries a=
re the
> > +      per-AIF bit clocks (aif_if<N>_ibit), supplied in order starting =
from
> > +      AIF interface 0 for as many serial AIF interfaces as the board u=
ses.
> > +    minItems: 5
> > +    items:
> > +      - const: lpass_config
> > +      - const: lpass_core_axim
> > +      - const: aud_dma
> > +      - const: aud_dma_mem
> > +      - const: bus
> > +      - const: aif_if0_ibit
> > +      - const: aif_if1_ibit
> > +      - const: aif_if2_ibit
> > +      - const: aif_if3_ibit
>
> The driver doesn't request any of these clocks as optional, are they
> really optional?  Probably easier to make them all mandatory and then
> relax later if they can genuinely be optional.
Thanks for your input. Will make all these clocks mandatory in the next ver=
sion.
-Harendra
