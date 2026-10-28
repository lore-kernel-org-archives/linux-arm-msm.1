Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192245;
	b=W531DoY0k9MfDtj6dpwWbCDPZ7eke5LEIKOxKjf36T0akphLfFzg86+O4I2j5BXUvTCt
	 vDNu98gcdFf91t4Tzlr2BFO4iQvpalCEjD5r0JlXxFU1WWa0HjTlGG/w3MFK0RSfDcju2
	 XDcq9WWiN0uBVO44XUtxPrybbZXBfAgeLkydaKJ4NgdQ7ZiKe3W1KvjYy2FU++3TO6a3W
	 MYISIo68hWx/jJvr6hIGSxYTVhq6yzHK0geWuqeyTTZaBXS8jN5jUsSO3pSxiiIOpUiZP
	 s7gEBnBc/E6YSjE9Y0uy8t69YVWdaotkyeVuPe6btm0Ql9Ca9zUwpdm87PO0PSHY8og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192245;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NgkQsGJ7F0ZEbrdBMJdtiIj1xr4L3acMDrweUpa/DcA=;
	b=LUySObzF2NW9VC6JfBMQaj582r3zUjFuqVvvW1SV6GrOgvR3XhGPn6xb9Uf11RIE/+Np
	 J91ltmtME4BDksLAm6goztOObre9hrZyzPXKQl9AqXWY4C3yUFODqmZnkodkqeqXxkhGU
	 WY3zvGnzoLxBrantsL0YWTOMvwRVoZ+lrQ4aisQAQ/nYwJHj7e+l8O1VmBU29JUfp1Qwf
	 mG582PMoXY2y1z8DEena5rbUQKXvl1Mo5SzZ5dC3+pbMBpRbtH6fUi2z9Tj0QQ1iDtyf/
	 9s6xiEJfvTewGFdp0dEmFg/LsibAPCbDC6664JBwSuQAKm6YHeBDdcAM+YQuCvBgnEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErqdaxSX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4Jnug7Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32C4606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:57:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E32C4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErqdaxSX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4Jnug7Q
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe48k2082635
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NgkQsGJ7F0ZEbrdBMJdtiIj1xr4L3acMDrweUpa/DcA=; b=ErqdaxSXIYUEb5j3
	LNq2HhQf4/3lRGxpLyRRTCBCzJNmltvBveEPBMKLuqEOtoShGjjDE94UCNMRpIhb
	HPnFmuocikNEpyrINUfycILX5SuO5W7PUEl3pm+exYGLZ/7opCOPdehDf26OYBh5
	/ncX14bV6YEVsToe/dqaAR462SqsJRp123nFCZYWXv3Mo3hDNXyY7/N8dcxEow87
	bk/57PvSI7xF2QGzUK96vGJyU5frbvGLBSw+K56/eiKZaYd0637CJfV4aqFUDHwd
	Mqe6n2Q+K6DwMYNQ6E7XRFoZMy2bgNDSi5DPevoxGgeDEEsLvvo7cqc52lKl7JxV
	Mcg4fw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpv28q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:57:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a190c53a3so1099768eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192244; x=1793797044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgkQsGJ7F0ZEbrdBMJdtiIj1xr4L3acMDrweUpa/DcA=;
        b=G4Jnug7QkxdTnIAqONxnqkbCBus/Ux+tZgayoou5AQWJCbe6EDEUw80BfHCJzS8VR1
         Mi+xJNzdLCTzFvZmQIy0yPV6TvSd1uPg9XU918SoD0iu8Y45/2ZHwKeAbX5bZrnF0Guw
         hrZhwn6VUpXtyLlgu+UVY61rGOPy2mXUxYoQ7nyO12HNs3J39j1QNaqWSkJ88LgrfTMs
         42HToJ95/ZngnSY7eRXt5DgSritQeCmtLnDnLlGUaqWdkr8pNy4zPi6gRSiIPx3utiIM
         cPMPwf+DLNfDffTPWvR1EOciezJD8jgoDSu6VbEZnQd0ZgsIhVVaY7q+gXcdc2MHpcx8
         1l/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192244; x=1793797044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgkQsGJ7F0ZEbrdBMJdtiIj1xr4L3acMDrweUpa/DcA=;
        b=V3yW/K2+Nt/avKddjlx5wvn+zUWcU++uYot+4wjYhTzadkdYMeFEuikuTlSWSqT03B
         +ZLYG+B1Est6wRaMGnNDC1u+z5r5oOLnYaNP40XT/WfPKN/d3KEyFxOxYSJau5N77mrm
         F8kdu96WfvGmoE1wUTY2x+T7/adCb/gHXCIY6+ldD7CDTlud24zhbSmX7xTuXsjlSmOW
         DAu9s8nsBe++GDN5xsUdo4dV68DsTvRpLSQOnxwsW+LG5NXgyxoXDvA3sBGBlb0QwAul
         CQKZCdE/SFXt4O/fspQGT4JFXHGlIRSVyrv6Ku0P5esqVxFn7bu+7dNHyXXIYvmVZZHN
         By5Q==
X-Gm-Message-State: AFq9FYLMu8sWnzCOiQ/sBA68dvggPAUmTXUPd5neeA9WvDQu00MNGBMx
	NnnQrKx+w6gqI41rwRq9xV1egIemV1tprAJSGDqn9sbPK8ayQBhHhTnUJeFW/b9F8hlJmLYhvF9
	EhZWd5ve8LGn3DpvCvIfhT3+ruBRHblaE/kVrPJXDiVE4gX1Ljd+lTn37KrEHTuG3Imn/
X-Gm-Gg: AYBFou1TsqgLx23TuXdzNkJIquFqVgIgfkz8FSLNG56LGV7gsDKKXV65SvjTrth6u1Q
	fcnRaQ9dmgjiCQpjQDxp5WarZOiVDspUfBSWr+PZrPd9WFhxJX8LFtfolIs9jhoGm/nUXx922Uo
	7l4kKERlL89IDJbvePr7uCQIT7T1QXOAdWBKHl9PKEBDPttG5uDQjnGT/8m2P37P1dH8Bvld+bL
	jk6XBm2CQnLd+DpeImlzLj3tDvsimnMWuF7NViRH91ZYKHaECjml5qzWccuVnr/YehUf+r9JiDS
	LwGai9O3WHc1yzJGxcD9MSTX96GjEQRX0YsrPlgcNGJ/JgIuv7KjgEhiNohdkq3ICpaMvy/X+IY
	uak4VngFfBGPmyBet4ELTZ6hZFARBHkcObVJU/XPYXvD4SzNCeCmUKFGrCii/qRcefry2TGv9MZ
	70BF8jkiaX
X-Received: by 2002:a05:693c:6382:10b0:361:2a55:b94e with SMTP id 5a478bee46e88-36a24ef79d3mr1805707eec.15.1793192243499;
        Wed, 28 Oct 2026 05:57:23 -0700 (PDT)
X-Received: by 2002:a05:693c:6382:10b0:361:2a55:b94e with SMTP id 5a478bee46e88-36a24ef79d3mr1805670eec.15.1793192242839;
        Wed, 28 Oct 2026 05:57:22 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23908449sm6625610eec.11.2026.10.28.05.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:57:22 -0700 (PDT)
Message-ID: <aab38b8f-9e13-4c77-91b5-d3e12c0c5ce8@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:27:15 +0530
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
Subject: Re: [PATCH v2 4/5] ASoC: qcom: sc8280xp: Add shikra-cqs-evk
 compatible support
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-4-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-4-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX1/TUvAMy3NDu
 OM2jCk8+orpm1pBiU4quGhWgB8sDQJS97cLPJoD3/WiV458KGWjTHJsDrBDjajGqEFEi7tbVlpW
 ZpGPUpvtBSkT8DE0wA1ABfG3OTtNVVxfM3lgd8caWvFlbVkV747t2Z3RtsFsNkomr83fzFu6h62
 pKJR1cqlZBcnO7Yaeb8iMn/IUCPDAhxLjLGIns8a2WCMsviFZ17M+QdVkJSd2HY98CfeUFhA3LX
 XtC29MgExeahA/87vvP1XCzbTJsjHljunJ2Hsxb0A/7AhPBL0nNyYop9Wou7TAlgmc7o0Jf8MJB
 hHspBUonBadqlIIIqTg5OZVccGbYhREBnY7efqRbs+8Ucwi+UEMlAQsWo5HsHm+KLEH6K1eiGKy
 OfIdkWuV6Jx1O+GP68hEDkgrGSf5yc1985XvkiM8tGj/IhE8R5N9SrTZR961/3sbc4+hn/lytSe
 s/9UcXfgMVhRFits+vw==
X-Proofpoint-ORIG-GUID: LRM3mFUqsLmqhqMQVYELyjF7Hv8YW7ht
X-Proofpoint-GUID: LRM3mFUqsLmqhqMQVYELyjF7Hv8YW7ht
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX3FkBB9LvbiYg
 TymKKtKTvzii7izNHEOw6NwSQnTup6TYwAX823/FmPf3ku4Ja8LKz8mYbg1UhAGFwU978iLBFQe
 kvPvw3OZ9bR4F/Rz0EoSth3pbMCNOA0=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1f134 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ct-79n1Jcior63b1T_kA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280051


On 9/10/2026 8:32 PM, Ajay Kumar Nandam wrote:
> Add machine driver support for the Qualcomm Shikra CQS EVK board.
> The Shikra CQS platform uses an I2S-based audio path with WSA885x
> amplifiers and PM4125/Rouleur codec components with modem-DSP based
> audio processing.
>
> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>   sound/soc/qcom/sc8280xp.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
LGTM.

Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad

