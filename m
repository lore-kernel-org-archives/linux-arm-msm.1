Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A689D339395
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717326; cv=pass; b=JaXgix4Qamb/5XSn5tz1oo8pc9Uq1sYxLUdlVcU8Xtw32qU7JlNA7fw367ECqcNjsh1GU8+Ql2D+TENINSJNhVD2zkf8/ZAcAiQtHv7vxfY6d6yZF3X0LHbXksrHSKyLz/vmaxni/t/Od5KQUyamJQ2T9JTlMKXv6ctbaBfv9j4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717326; c=relaxed/simple;
	bh=TJdCxPLRucrgpVqb8Q/p90ezgDTTziOz+2tb9QKZq8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Za50eBl2vNLO5ZzEshaSjoYK1B8St4PChEs5YZDQpoF9JtcuJoJ5x+3zzyZRocr97JAoqxjBLR5QMQCkN2qBus+Tw5uS3OWjnd4huV4uH92p757s+QkwOcSEJ2kVQNeCHqaHUNUS/qj2VR0/tqgQAYbYAAEwrVh3b0XA9IMegRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eYrH2IjR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6LAl3/l; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eYrH2IjR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6LAl3/l"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xLVT412301
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x9weLpInmFviAD3H6syM6zH0
	Gtd5QFWFlEYwRfjMy1o=; b=eYrH2IjRrClTZEc8uQyOWXvoeYbNQoAygCso+l/5
	cNABL4Z/N1JyhErVGDFRCfdTUUfFeu3hwxiHLf2KPV70UJh9HlnCDJEOnG2AQWyQ
	vyZRGnMwCf2MALMuLsMAE+MGnf9cdmqiMnoetZWQ5iRUTGoWW7lS0bRK1AFrCXGs
	94NJ2dinlv8VZuF6wQ5PJyUN2uFrMdqewIMtMZtl3TFjgKOEppCiwo5OQIaXd1/Z
	QMsr8ccJn8kd72utiHts34Vh5PTeLwdct52WZERLCgrHCn25ssh432ooNzL1smJt
	l4tqx5+leDCGxARByr8Fs1wlCl4kWyH+p3AQaDa0UGbRDw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjpxdhevk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 10:48:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cec4226c70so202377845ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 03:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784717322; cv=none;
        d=google.com; s=arc-20260327;
        b=a9sHSTEdr6fy18heq22rSygNthHm3TDIPkLhVlaxLh/fd2r9bOkWEIvkiDARLhdOYY
         bFkonr6Xkfz8co0xFwLls8ffNhObi0R9tJoBe7/EbbjkZJe4GznSZps5mcaaBM7c9/PS
         +i0RpcJOUcCpoqe63ieUuP73Ro9VeH//u2gw+JOPCXAUI7TndWjWIaOovZX0qsa1bCrW
         PVbtRWbj/loQICqMlA7pEWFZbLIXQsMP0XtVEDiFAcOJTfCMa5zdi/+91EU6oKIAbOy0
         G0LFgIFjfGtWjzf2l61ZXzvOI5AvahtXvwdCjxN8q8SO7YJTLDzvvIGgCjqYa9bKtW69
         weUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x9weLpInmFviAD3H6syM6zH0Gtd5QFWFlEYwRfjMy1o=;
        fh=qN4Tn8Qay+AP9lqkdsJWBr00tLkr6nW/+XdfiE5KUF4=;
        b=i7OjOAzci4gQ5v0I3E8oAejsaRYHXw5Q5tTEdeBVRCNe4uyxzVQWZ3T8+1mKVmaFzR
         bLXhTlXOFjupTxXDdbRDFlb2SGQmhXj9KzmwNG3mfuFJVa149gUj/OnnsRvIf1efkv9y
         HdcwkbjNjQHjOYtN9fOtzfBOSmFLKVelAe5QXeN8tAJp7zFJaUQUY/DK45O+XUKZQQPY
         YVASOTT0dJ1/lWnXTzjdYrxHd3vMZtVxbo6j5IAJPKu5rSHEsTjvAaFhiUMqTpzGbxWf
         cejdNq7pWubPoO8x1gWLtJR40k5B+wfQXeapQ+1NvuJCuNNQ20O0p5gzkZVrZVK0LieG
         bYxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717322; x=1785322122; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9weLpInmFviAD3H6syM6zH0Gtd5QFWFlEYwRfjMy1o=;
        b=c6LAl3/lhfmCxgrp3Ec40S44lTOzlxoFn1qirkdxZcpJWvhMt6l1Szykm1xyQTqKs4
         iEVZdMjmqjQ0UkiUUm6vExsiTtNihx0tOaGVWMcgMVxdwFtr/mWYOU3+LliTfOLSwzCX
         39LMFdT74gCFOLeJJXtvVh2V4HDWe3LK7i3oR+aPIo9kTVnAssGBWE6dmZUnoSniD7H6
         wZ59LiSYlEYv60c2Xvj09L+BCXEn+gI9cBFiarauaEyNm7Z7E9/HD3+9bnm2X1Y3u7uv
         KKroI6zTBCrk6DNKtn4h24GFqs44VbluCDbku0cVmjGmVnsxBpx4d5vahtMXMrF345j8
         WEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717322; x=1785322122;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x9weLpInmFviAD3H6syM6zH0Gtd5QFWFlEYwRfjMy1o=;
        b=abkp/cL4QzQZhU8t7xzjiYaz3GOFl8Dbt5KeEARqE3DKimT0AhsI3zeK1anHs06YaC
         Fx2PiuaAcrGMt+cmboEwrInQzNxfrvexkhK82K1P5LsfTwXu4NM08LnN4yX++zCye4EK
         xzlm2muMf9Gaa7ew+MfzyvczQc7ZupIHvbiYO5rYIyzC5mIe3UPLckjdLwN0+7XtHc1V
         KinP/eWI2Vc/0wqSmUOlfSMsU0fSIMA2sIm5wGHd0d2zoeWqr+22KbaJ9+JjoK3Ym4Lp
         ihBUaq5t3bZdidZPOhUQocyv2ZAm0HQQ+DxTmmzMZpxU7clAv3ey9OaIHrzL9QZWBawM
         m0+g==
X-Forwarded-Encrypted: i=1; AHgh+Ro0oDM1dcKkIOeghzhAKa1+IKNVqLCLMBzxT/ewwaIkBS+S+F6TPA9dCRYJxzz8Fnw9xed1PYq/JoPUmlq6@vger.kernel.org
X-Gm-Message-State: AOJu0YzotCQ1nBybQFcCOv54I4qPcoIlMVr+BA83bYfiw+uTk/FBYMr1
	CfRtMgVm9zhCNzJde+l+fxMynf/UpNyD0PQ1Q08GQAnT3VM9r3UJvGvCM9uuy362z2o9CJhOd19
	bmk0j1oxnEkFadnUZ/2UUWmFtQ9NmjQ5Cbo/LG1AbGOK6VG8/Nut7Wta7VlosWqIMNNSXKrZd7y
	+jROSyh/YxKuH+UUq1wQuXoEHoMOpAfnWnRVYA5WznRn8=
X-Gm-Gg: AR+sD11rgZ5K2rKP0VTJsbzQKGVlAbSCpDLwEvXLRyYYDJAOWQ4VeLZdu4oYAYDoRBX
	4ZMU9DnS/mAB48DUFHyz362SKFZBH6ZSSbi/LwwsmaMGr06t1QFzfN3zyc7t8jPkQnzOLjFWpKL
	mDUzjK3P1y0O83zStI0xAfuDVOwpITX1XhpbOlI0G05ixAH7zoA747EeBHz+IJ4kGVFOnmKhk=
X-Received: by 2002:a17:902:e80e:b0:2cc:9179:32e with SMTP id d9443c01a7336-2cf3481bc46mr240434195ad.10.1784717322121;
        Wed, 22 Jul 2026 03:48:42 -0700 (PDT)
X-Received: by 2002:a17:902:e80e:b0:2cc:9179:32e with SMTP id
 d9443c01a7336-2cf3481bc46mr240433755ad.10.1784717321579; Wed, 22 Jul 2026
 03:48:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
 <85f2799d-fadf-478d-9f3f-fb8ff91ba84d@oss.qualcomm.com> <6a609d87.87c5160c.1accad.0f33@mx.google.com>
In-Reply-To: <6a609d87.87c5160c.1accad.0f33@mx.google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 13:48:30 +0300
X-Gm-Features: AUfX_mxJVnMuPbQyqLMRl1YwpMnVztpdNpQ2DTiLQfHenm24uUU50tozkQFP1cw
Message-ID: <CAO9ioeUw4QgW47xmC58dGc1_j2UPFjDM+dDRF-bggpBPFA32YQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNCBTYWx0ZWRfX38n/LNukZyhh
 23gnnP3DZ+9X1SMOzwmS1JVNqnXWLABhvROoy31fqIF49ziVAq27yIzMx/pqyG/p7yXH9I1U40q
 5d/I/oZXLdyJGxqZ9RKx3w8PadSof3HRi5ySmTbWgLrexjvhsKainK11/S6DpBtJVepIXnbRqct
 cSSSE7Mw/iqj2RX228ji4BMrTvdbPIQECkpO+d6AoOmN4GOUjQKZW/OWa/Hv879nx5u8B+zyGhr
 xGuu09Nqa7yCgEkN3wgFABKcYLLMfx7w6kujw+ejGWwvxUOs8xmTFh84jNPgJ1V/faVQucIYd/H
 FRO/9DQ1GSjS4LIMUMccM0tAZNWh2v4odgkxizDuxSLnaJcfcct+kz9VxhecjeQ32bVz2oY44az
 MwZQ6LM11/SmEsmVJ3dzZizbFitCLaKIhsn0OSP2CVvpfQu4HmmBN8QaQ+IZ+i0DFcqS/U185Ti
 W55x+FFwrz2vJkqbKgA==
X-Proofpoint-GUID: U3IPkDQw3HCDHAuQAIBc12lip5zrrvrx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNCBTYWx0ZWRfX8Uf2NaQMnHKf
 5dmA5Jzvy80mRpGmYpXnCcvoFogKLKur23Aj5f3TrGp0xaaWYNWCCdjss7Ubx3CMtmYmrUqcOc1
 2JYx9W4gqm907zyqu1JqE/hvrT7s3yI=
X-Authority-Analysis: v=2.4 cv=b7iCJNGx c=1 sm=1 tr=0 ts=6a60a00b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=s11Qgp4bjunoGJnHrnoA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: U3IPkDQw3HCDHAuQAIBc12lip5zrrvrx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220104

On Wed, 22 Jul 2026 at 13:38, Christian Marangi <ansuelsmth@gmail.com> wrote:
>
> On Wed, Jul 22, 2026 at 10:00:34AM +0200, Konrad Dybcio wrote:
> > On 7/21/26 8:12 PM, Dmitry Baryshkov wrote:
> > > The Storm board machine driver targets Google's IPQ806x-based Storm
> > > reference board (a MAX98357A DAC wired to the LPASS I2S bus). This board
> > > has no upstream device tree, no active users and has seen no functional
> > > changes in years, so the driver is dead weight.
> > >
> > > Remove the driver together with its Kconfig entry and Makefile rule.
> > >
> > > Assisted-by: Claude:claude-opus-4-8
> >
> > Using AI to `git rm` is definitely tokenmaxxing!
> >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> >
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >
>
> Honestly I'm pretty angry about the latest changes on ipq806x. First the
> dtsi just because there weren't device (it's ok and understandable) now we
> are starting to remove driver...
>
> There are godzillion situation where there is a driver but absolutely no
> dtsi. Lets remove the dwmac driver, usb phy, pcie and everything else at
> this point and treat this soc like it's a 80-90 code...
>
> I will post dtsi with actual device for the SoC but really I'm not
> following all this hurry in cleaning code for device that still gets used
> and actually some company even produced new one (even if it's EOL)

We have no way to check that the device is being used other than the
DTSI present in the kernel, being updated from time to time with
non-trivial changes.

For the patchset in question, do you (or the community) actually use
OnHub? If so, please consider upstreaming DT files (and also updating
schema FWIW).
If not, the files will eventually go away. Just having unused drivers
_adds_ a burden. I stumbled upon the driver while reviewing a patch
changing the driver (for the sake of changing the ASoC API).

And FWIW the series doesn't touch the IPQ806x LPASS driver (which has
a DT counterpart).

-- 
With best wishes
Dmitry
