Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830008;
	b=cYLdOrrmo5zxeoJvnXmsjDSeLbGy/OOImth6sWKZE8qxrC+C3a/gy5TZ1QA7MJzHYDh0
	 0DpozqCpIsBcXuBLqRQ1nPhLsDX9dt8YZUCWmlNcF5uV3sH4reCr7dQzeM3vGDisjYjBc
	 pszU3McNDbpXrnHH3Xys1j8zpzD22UNnmn9BrAHNfUnKNVJnGUcmhiFuDS12qdv+lkRYg
	 X6rZMlaPyM8TQvYW/KFoldO7bnL0sFYHs4XlOdO7dRCEG+V5l2ob6yvJMxeu6jSdMGRPT
	 /SiF2wSOWJoG8JydIOttQTUWc1VUOGjIOsqP38ZJRI7PkFSFEPDIPElvfiPT4yld3gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830008;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GiqvpLecSe4b5b1P6D4a/gHwKLcxVWShjE7SHphQJfw=;
	b=ii+7wD8ON1VO5ZGbYqQp22edgI9RFElFI0TUoFieFeDiBYk8w8OB1jk9yVfNl1ya1pm/
	 v2EYH3s69UA1y4CcfVpSqoZtlBgn/MAevIY31zpVP7aAm6CogBrqHo7Iy9EOBWh6txpT4
	 ImlandU/whPrin0M680T6gtRSB0VY/u9xeVdHYSccUnKOnUUHp9Ij0dYLFo4slr+hZpiq
	 xNoJ2M7qa82NVpljFQ9PtC4W5tCPwabOP3ypuiWZVqb04rAngwmxemeFTWyVlV7rPNQFM
	 mWDC9ay5p9eoyfdbxmBBpyLJ1Krr0H3+X41IDlp2ceAGsuQ8cspQD/qXrZaSFSEXm9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N/hwZ8Oz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZbQC5xd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8669606A335
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 08:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8669606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N/hwZ8Oz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZbQC5xd
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O3jaoG3679002
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 08:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GiqvpLecSe4
	b5b1P6D4a/gHwKLcxVWShjE7SHphQJfw=; b=N/hwZ8OzMHsSn6NShlRIQTvDMvK
	IZA8h0NGwW5OnPLl60vnRZzQGx65lBVFHtk74eB7yIeciULp11VLOl7PAijBnOXd
	KLH/sENCFYdlNeqxWy5DI+fOlooWeqn1ekHwyT3teSyaUtxjwCPRNVnyX0cetBdo
	HAqOZOK5ZzLGkAZZAucrQnbPeDw5txoNkZWaBZaHMWpqF+eUyPKUOYgL6juHnqp1
	4u/SyKUw3CaL2kJ2R0UAhZzfqEJCSi5qwbwgsP0ub5Gl9arKpH0Ea0U6R63fYvCc
	o4zhYQS8G8NijfdnV4dB1HSaU4S1/YTn6oUrh9UupkK7BePSeO2yBrhPTiw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27rfvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 08:20:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5337f26ee19so1203311cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 01:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792830006; x=1793434806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GiqvpLecSe4b5b1P6D4a/gHwKLcxVWShjE7SHphQJfw=;
        b=WZbQC5xdDBrWar6d0nGaSxEK6YzwzBTmmNnS0mQ+QSm7FWBGWxgOViHD6BZBfLM+RJ
         lFKiQ4P/2ONshM9U2+j85yUrzDhMgv49SOxN89sLwjDdcMYxJ45REhxMQO+MuJ5ZuLWE
         29zwbV/QPGUf/S0K9uDq05RNTrtUrDDRSJRUyPDlHHpJARRwOCE2GgP7pBAHLWmUrVgm
         HaTL2H1UbC2dmX+b3WiWpN7fT82tRN/zuMFMT97/Rjuo7Xnpx8IMVgTxcxVXOHTAiTYk
         Q4mSnH8vXwmDcoUL/Qu1U9+MbwieQCF+oSS/Y3JMSjJc7Nl9o7LpOUj144wQQHEjlLkU
         DBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792830006; x=1793434806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GiqvpLecSe4b5b1P6D4a/gHwKLcxVWShjE7SHphQJfw=;
        b=NC+qzjZ9GuQjh/yVYTk+wEPnHc+HDmUy1bQTy66QTZe3Y73IKFdvga0RiFXxUrxd2O
         D6rmqGbP6Lwua2zA4v4e3rbcxar+3aoWGhnHlbCj+2m2Uf/HUB6FT48n0QdLLc64CgMr
         71oppUyCbajrNzgchlz7uJtZ0XOWOwJICc/UoIRH4RB315YpVzwrY90wgyTuHspe7DCc
         b5QrzWhQGygwiaNUfo4REYi9dgn8x8S6DngyLoBF7Swj2wm9G26PBFsKUgEsBu7RMfV1
         SF6gJOs65r6VCx6MNOzdgZrjh6JG7HSr/122Dv5K2DJhcsl/SIqMt/VTC/P76jgUVdow
         H+LA==
X-Forwarded-Encrypted: i=1; AKwUvByquOicGa/42I/8+SdgjbwwUroAQlfbQ3rLujOR7lrQ2pa82GHFQWJfB9YTl9NR7veNJbRGys+o64VSqX0n@vger.kernel.org
X-Gm-Message-State: AFq9FYJn4a5TE3deAeS83qwnQSaTdRHUWOJaJHW7ZnSrLemhxhAQrZIA
	EP7wmDRSmb+KkuJ8Ug+aNLO5cCrQZg8fKYEozlPtHk+ov1dgqLSZ9yoxdDw/wiWohfJyTIpcAK1
	+KHAE2XdkuAHTqWVbzlS1/SLvHOVmyNRg1NaWnXqnpG5l/TggF4A9XNq2378Iyi89dVZv
X-Gm-Gg: AYBFou3dxXBMca6trM4NoxnZE+R3AcvtquO6bfwvpSjak+hg8b/OgQ1WBv15TOBeSqu
	sBvjPm6YkF8i1H6XSy9UlBuG6MO98znHTnTAFx7bjF3cGbq7Ybc2N5mBZL3iw1iJHnd6zJiS9rH
	F8RfjA3XGsR0okK5SeYzcJfg3SO4VSSAWi8tQ+cxSZHWIvJl7X2qVm5oRENiRD7FqSHppQbjHq2
	mS7iocmcx1ck0CTGW/dQay3HU9g4dxIS/JWUfLKR0CPgWOFgOUTzK6Mnlzwx/H9ES+ibWnnTgBh
	Qs0Qpaz7keQNfv0Ilmdo+hJwMOod8JTwkLbrVdLMbLgoxIQAM0zsC0qWB/DIhdO92P4/xoV9HkO
	+GbpdQEPeY528UB8rajNLWsrm
X-Received: by 2002:a05:622a:5e89:b0:533:9753:4e03 with SMTP id d75a77b69052e-5383af10a20mr15964931cf.0.1792830006126;
        Sat, 24 Oct 2026 01:20:06 -0700 (PDT)
X-Received: by 2002:a05:622a:5e89:b0:533:9753:4e03 with SMTP id d75a77b69052e-5383af10a20mr15964801cf.0.1792830005767;
        Sat, 24 Oct 2026 01:20:05 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a573f65sm38496385e9.10.2026.10.24.01.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:20:04 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] media: qcom: camss: share VFE clock sources by the highest rate
Date: Sat, 24 Oct 2026 11:19:59 +0300
Message-Id: <20261024081959.2887288-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4a88a2ab-0020-41d1-8924-bba8ac42f429@linaro.org>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com> <20261023152857.2859767-4-atanas.filipov@oss.qualcomm.com> <4a88a2ab-0020-41d1-8924-bba8ac42f429@linaro.org>
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
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adc6a36 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=7PVpw9Zm12totNsPFDYA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: -Z5_aStJlPQH1q0zkxFW1k_7bTPgsWWs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfX08B66xQG+E5w
 JgrLyAOl1kAvR0nqQm0MVy7i62lzmCWaxp+f3hW0LI8WKWjCJ79ssLW8wbAirVmlo/C9JQ/T+Cr
 ub3zKJS3EXoDWnUkNjQAfZzMVBBaZg8=
X-Proofpoint-GUID: -Z5_aStJlPQH1q0zkxFW1k_7bTPgsWWs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfX8D+fymtwTr+F
 7niUJ1l8OhWcSLaEVrxpEK86tzOMXJ6JCrlUFgXn7Hd15na7gojpL2eGsfr8toccV+iURumjDn5
 tSmmFEMwPQwGRkGZeEcUJ6yOxVN7faJo2DuUlEDqQ/bQ/4pVgUwkQKlQZawgC28IDpedkxLVl12
 vRwRLsr0tFdoftBmXJdhsPw6l/ECqp5b3tNKDM2T7f+GhsLLCtlEqkM9Wsqm5b4JxEo9daAdSMu
 Nkosu2fViv1sBMhD7vcgUWRbnYFo1758Ls8DorDgupe5G4RJIdvkHlo0VBGX6TTSOBrkiFjGyDt
 j8H5mFpkwuWLwQLLBWvGzFLLpB3ciMjvXzUt/bZ61AfohsWM6KVmsjlXt+ZNZWiKdW6hRXVkjyv
 mPx12GgF/a/uFrgEfPYgMolOmsdnyzPU0aLd/+oLcYQkj9SRz9YCrcsirwJPUl/MzPeXXZ4+Jej
 oU2SakduMcT9vLOmdZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240033

On 23/10/2026 22:41, Bryan O'Donoghue wrote:
> You're simultaneously adding a new clock to an existing list and
> introducing a behaviour change at the same time.
>
> Those two things should be split on principle.

Agreed, I will split it in v2. The grouping goes first, then a
separate patch lets the VFE set the AREG clock rate. In that order the
two VFEs never set the shared fast AHB source without the grouping in
place.

> It seems to me as a read this that the above text is the abstract
> description of at least one patch - which should have examples in the
> commit log, to make it less abstract.

Will do. For example, on SM8250 the two VFE Lite share one core clock
source, which the VFE sets to 400 or 480 MHz from the pixel rate:

  - VFE Lite 0 streams the CSID test pattern and sets the source to
    480 MHz.
  - VFE Lite 1 then starts an imx577 stream, needs only 400 MHz, and
    sets the shared source to 400 MHz under the running VFE Lite 0.

With the grouping the source stays at 480 MHz until VFE Lite 0 stops,
and then drops to the 400 MHz still requested by VFE Lite 1. Once the
VFE also sets the AREG clock rate, the same applies to the fast AHB
source shared by the AREG clocks of VFE0 and VFE1.

> What do you mean by user here, its not clear to me. Another engine ? I
> think so - you mean the JPEG has a dependency on the clocks listed in
> CAMSS ?

No, JPEG is not involved. A user is a VFE clock fed by the shared
source, so the users of the fast AHB source are the AREG clocks of
VFE0 and VFE1, both inside CAMSS. The grouping only covers the VFEs,
which is why the cover letter says that drivers outside CAMSS are not
covered.

I can rename it in v2 if a different name reads better.

> I thought we decided for full separation of JPEG and CAMSS/IFE ?

Yes, and this series keeps that: it only touches CAMSS.

Regards,
Atanas
