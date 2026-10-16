Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378BC175A9D
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145251; cv=none; b=nIlp+1g0FMOIRo2k/cXWVdWiTkjBmIj+sQPY+cnG8iiucVGyDB9324VaP3TBq8uEOL4ae0VMY1UdDivrib7RWJTNrE59OTUi/EiAl5+TCxZm9x1adJ4w71/Rc7KGdsPBx8jpwAhNGtVmc2DMXN4DPqH3ut8sGIL1tndc6ucVQdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145251; c=relaxed/simple;
	bh=svnknxrvxPFY2XhHHB/7UYk5zvriBKO1HYflPEGoWls=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YkpAqe5pQTftqwbhW6LfcxjMPgql4ZbqThPx9lZ+fPpQ9sb5sxVfEhilnAthZTJdlNQ5tfoOvIcTbYWObec0EMSh8yysrh4VBovlE+OUwubvQD/pi5GnnqxHQJFPj8iyJvoRAPRIJAqgNN4ZoZzVXItWu+bP+BIKVOXU9+Jv8Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kg4flyau; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZUficEH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kg4flyau";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZUficEH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lfa01218677
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJlytiMq5O9B5oYpwl9msTwHluCBe8tunjW7J/SptPM=; b=kg4flyauA7YvAGA1
	jUkKTAMXw/CPF+ibJ5mBtCM0lCB3T/mgWwK5NzgGMUod8oXD4S/8hR0yKpDAJTP8
	xpgKweJVxIggcCVA4eybqjPQJcOb9rGW9ZITVAFSCvCiRnqzNrVRdR9Cg36x0fII
	AsQI42QBOfQl20qTA852okbLuZxS8Yxa9FqinMVjDi07j9tWzvRd7YGjF1evbqGy
	Bi/O6ZOoz7atiREFHClHWuPdEpi9V4hhFMFikj5VFCfMv7/Y0y1W4CBZh3DQDtpg
	epDN4tO0BcHte9qWpflDYaKTepK2pEe29Jeid8l4xAPZoEgyaU1xO8ozeZSuzFnZ
	MGfWoA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb5seaqm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 10:07:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so123222585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 03:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792145241; x=1792750041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJlytiMq5O9B5oYpwl9msTwHluCBe8tunjW7J/SptPM=;
        b=cZUficEHSTOEaqBtnWYbpplQBEw5S1faBKZ1FRccMXLUrykTtaSReci7+2cUVRcjQ1
         ECmcmcpWZe9kLlGyq+TZvEoDWo2lYARPZ0ATxSkAfZRWC+zKKsL4KX5Xr/nl1I5RXYeb
         mh/joqrvgJWcUYbYPI7MTUACxvG8jdQEAqeMWUotX9cLhMDZKRVHV9DJgvTP6zcjut4B
         OVP33O7HtWMMgw/d5quEaGvy9rj7480DpkyWNAfzu8TwxDAAmep4BY9SB5tGeQusEQVP
         d3Tsu5mYtZ9yQW2iREFXLPsNszO21schIQhsgO/+XwYtO3eWFPUpBbMQLXeU8Yg6hlnH
         4SVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145241; x=1792750041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJlytiMq5O9B5oYpwl9msTwHluCBe8tunjW7J/SptPM=;
        b=1CdrQH/3FXXcOQiCVI+f2LPx8b3+bwaYFoeFRSAZ264uZ3T+rl+Szl1Ua0X8rdZYjb
         VOWxqrcsvGW7tAwH0iSeMU4pr3dCpDGxWH/G4KbJJArnDGdsHUIuMYZ9yF8qLcAYmzy2
         XqxgBQfkzNytB0841YX/3leFsH6AR1OsQ0bTLy/yqP8m1lXE/VZZ80L4KT/2SdhNyCi7
         s0beLOXWoJDCKwGmg1uUxGZAxCeFFZpqxwVkY803vbhBTt1mk675cgp/uXJXs07O2F5Y
         1ZRJcur/qGcwZwQ9C6c01sTO3CZ/kOZwiq0/Bq3MN3nDSHiEgapWCgFycL0g0qJD0xmg
         p+eg==
X-Forwarded-Encrypted: i=1; AKwUvBzuMkV09iVFrFC/075/yO/9SwrvqyGvyaJSaa2VY2C4OgPahzYze5lAv2RFs2n1qhAxXhbKz7VeZq2KHTTM@vger.kernel.org
X-Gm-Message-State: AFq9FYJYdzRgPeIlIYODQxwt5TvnO6DB6iMzMaLDpnV4af71PIrEMEbN
	jlCe3TGOiqWAXlsm0O4sudo2W/TvryizvX/sTG57OSsO6g0QIguDX8ocppqWJENkma7pKKGIsPr
	ipqGhYHtd3+hOynndU7xtvYvYDNbgA8uzD16C8PTPSqzvIAgiZPYFfgOLKocXNbr+zs59
X-Gm-Gg: AYBFou2xPAduq2BygKpt1AohfFd9CV0vp5OZe1MOmkxRMnx4D8gNpAWOBY2EuSZ/lr+
	cDJ8W5I4Qoq/Z7dWx7zc5UxupEA4V2NvULB/Gwa00O+swN96JzcpjsqUTKijVY14e8mpM1Er0ca
	nU+SG6CklfP/S9vfT7mjk0Ilze76AuMVvNbmm0x/s0GEbWbKXLE7hNsjjmL1tcTXKVNiiHYt8CM
	xrwGdHCTpALPh1TaoY05KrMZqR+FAZGZN6lqBpomcY2VVC0rwvFYaFtbEJyADaGHFCBpABl26H6
	ugzjEQZ87Y8KR318w13xEjQxznnwFU2k3aKetSq74T3oDaRdSNirkScAxhkn+hn/WJoRNXW2DP0
	EnX1J+vCEea1nPyYT/RTe4g==
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr3865353785a.6.1792145241153;
        Fri, 16 Oct 2026 03:07:21 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr3865347685a.6.1792145240560;
        Fri, 16 Oct 2026 03:07:20 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408b4a85b8sm58824166b.0.2026.10.16.03.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:07:19 -0700 (PDT)
Message-ID: <bf35b332-1d7d-4c1f-9347-dcdc3ae5c7f5@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:07:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
To: Richard Acayan <mailingradian@gmail.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-8-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003175659.23536-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MCBTYWx0ZWRfXy+lchyswrmmu
 XKKebhgiWgH98NoPKEQCTrOUxkk+oZE8nzGKtLE1gAaQX32BwgIDNgNwKuGyBQ/ooboI7swhv5q
 SBIQ00bxdZjeFRuxdjgrmOQhe8llc3M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MCBTYWx0ZWRfX1a12as32t+dP
 bripOZTsELoK/qHu9xvz3ibVa9jaejNRIT6jwPdnjYbuv5TqeIJSR0iwkhUuv1N6zsUv1lOHbXM
 QKk7TPo4hudwjFdjKk5RopesLhzJvwPLaVN02SdDrCBcXy9Vl/KOQNpXgRyutq7T98ucIV9F5fT
 P6hjcQXmEFDEum+dODc6LI9OkjXojSWLSv8dct/qs3ulf3W/JS/eebxkQGSPpgW1aBopgYVYLQt
 ivEfm1CNoXmtc/yndcxPVqn07P4Qr4MxEy4FRZVWoyhwEateRRGZI4QhJLb7b1lfzzXFavnAr7d
 TE5PWWot89K65yGviDeub5QacLyAD3/7qw6eJCA0e5sD+gP7ex6ElIVaXkquqxrvyP+O/nu5UQR
 bXqNNR+0SrNF7JczC75I1MeKRLDwgkz63W7PTysz7hwgySah3FHIlYuiB/dlh6kHaS6QbPtE/eC
 TYT0hUklZeAVWbLYaFg==
X-Authority-Analysis: v=2.4 cv=P4yvFSAu c=1 sm=1 tr=0 ts=6ad1f75a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=UiK73t45R7nl48eyPcwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: nysWZp1SGd0ZJQui5d0any5FR2f_w1-Q
X-Proofpoint-GUID: nysWZp1SGd0ZJQui5d0any5FR2f_w1-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160040

On 10/3/26 7:56 PM, Richard Acayan wrote:
> The Audio DSP (Digital Signal Processor) is responsible for audio and
> sensors on SDM670. Add this, along with the SMP2P nodes used to
> communicate with it.
> 
> The sleep state is included to prevent the following crash:
> 
>     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
> 
> Otherwise, it is unused.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

[...]

> +					q6asm: service@7 {
> +						compatible = "qcom,q6asm";
> +						reg = <APR_SVC_ASM>;
> +						qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";

1 a line would be neat

> +						q6asmdai: dais {

Please keep a \n between the last property and the following subnode,
file-wide

otherwise looks good

Konrad
