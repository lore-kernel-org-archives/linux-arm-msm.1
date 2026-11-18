Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795014609;
	b=i1qqxDu1puuzPMS1QfRZ4ZCHYLaZeEIIenTGqfcvGL9zU+8e53yTWn5LBhpN8z4BNNpm
	 g/hM9hmMsZ7MyGLhzEJ9lts26CHlRRi38mHsYLXet6V9ftYAZDpIGocEPS6DR/GZZyvvx
	 pGU2ySLEP8Yn45uX6ksm2MamZuVAkw4e3os/b3UBX+IWn0L3HwXWiwRUbL/NWOhqnD6BX
	 QL81zekExqAM1mbvAsebHAEvOU39Celzvw4R4V3fa3gc96eZZW9s+Xx6+qeI8shNNfyp1
	 w7SUy0LETpp63NxLzNBvF6zwyyf7+Hab5pDddg3euNC4eWpYZ2UNOL9oOXomqtdzGZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014609;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=flTkdZEYbmHHX8uDsGTqb+GbA4JNBQ1tY4XceC/t+Xw=;
	b=d+bBeD4SxRURvNPAUKUKZjzSUSPheZYhMzTEf8w/bZaH1Bx1Td5GI8IGszGEzhv5BQ5U
	 iGEg2EKeEz3UB7/VAPzZqDdTiOqUSwhAZEyZ6K+J9WtV7LpMMCqNLV97i9I90OPmlmoU6
	 pZwds/Vo13r42g02GT9sZtQM4fsWLRKPk3GKGgVPvTJ/8tLcRkXSDrjWA3K5YYcMDjF3+
	 u7yot/EazIyX0DugaciIRN04uzT66B9EGZ6tW9kYKGs1Aj2qnuvUZTGV7NHYwYBOqgd1o
	 FyYhrJE3gqEkqo0ZF3tFXv5tqJUhFCUB5tcthS/Hp33r2NQ0eqVxpPpNZgPmRDZiEdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF+QsBGW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apikv5VN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15D3606A32F
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D15D3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bF+QsBGW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=apikv5VN
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQL8W3912416
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	flTkdZEYbmHHX8uDsGTqb+GbA4JNBQ1tY4XceC/t+Xw=; b=bF+QsBGW2eNNOq4M
	1o18j2IRQvedJAbrFgv18WbJ0L9nfEkbNvK5p3rFjFZv3vuxdIpgImIKggAHvJhI
	gvJ0qQOFkcVPhN8o6jSom5+Sm/Rvi0Rz5vkrK+56bipuIV2WO0T1rThXxjxeOBh+
	p7YTBrZkd5bLWHYSWRQkv7LEKXTUxzwMSq7l0Mxo7gNiau4tvH/z1ObJ06M77uFm
	PNOyGElIps2VaSU5gvHBXYVzV6GXsHLLMtfDBSWJCWWPTQ16sF59kQaxF2ZkVQPX
	iJ1gUuKDwAPngixY2+6OxvBSO4747sRWXISlxP6xPhPajjFHTO/o1Fh9kjodq2Qw
	nu0Hrw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9bn9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 15:10:02 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cde2fadb00cso940635a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:10:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795014602; cv=none;
        d=google.com; s=arc-20260327;
        b=GzkgP8wOOzjvFdeDS7Dv4S/DUosP1EaOA6RmLBVXWG7OkamW8qg5Ny2OFeebaEg6yr
         uwysE1jGoeoeCDdNhc+LlPSW3juZSKHonmj3SemshNcUCD1qupyAAKvvd99Gu5Ex0bfK
         Dd14n46x8HFm1KidCzPZGVN6uXTMto9qFNJSt+q10Pj9RhkqaI1QYuTms/L/CiWn8gtR
         GREXgALl19sHCN889gAKYDakQ/HeQynekaRp6dCXmT+41naZw2umRjqf0RIXpM4GLpyv
         QZbjKv6e1zte38EQeNgHX1dRgYpCm3w3yhrp0EcKgHESTSGrDVw8T4zKAEDTI0wRyffD
         9oRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=flTkdZEYbmHHX8uDsGTqb+GbA4JNBQ1tY4XceC/t+Xw=;
        fh=7BdOBNiptNjeu7TVhOQ8a/moW7iaur0qe9jYYALOLiA=;
        b=SvZfMw3tznuKfU4S5sMQbE7f3/NYKTN51nzqivLico1CDI/y3WLPnDjQsd4RuhlPCR
         I/YMMZWT0+9QdPVzGArzhRzCkLOAILrG+X9xQ0cL1fR0hx7yVIyILNwa/uzWqgwIESqy
         7fsSoPUMFwMjIP9MjJupHqq7X6qs0nTNiQj+Qxh5PeC+OWQ7y1dibNUaddpStw9ktoo5
         9fQS2rvXEB8Nc6wWPn6VMKri4HzMkVhlZnVl4iBj0UqiO3uaH8Hdl0RA3DAXmgUWEHa3
         DTUGbsr1xEJ64ByvfR8zNlmosI0mI7wdjX74n50G3azqKcru7VXhr+3+GcID+8l3Jd0g
         GbXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795014602; x=1795619402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=flTkdZEYbmHHX8uDsGTqb+GbA4JNBQ1tY4XceC/t+Xw=;
        b=apikv5VNqioVqZY0y16A8FlF3b8jNYI/nngyif+HWQoTTUOmYq/WvtuOFSpC4V82Xc
         5UmCbNRdXkCZFstKPiM0uWOkdwuSgIgEMDcqbbIK6QpVoeYP8gn+ML0CTcZ1hPJ+YjtB
         jHY3Vfr6p++uEh2xcWstn1C2zJgGpkXpEreNG/JfdISPVyISQCKnNMCA21xJ+bJnFSj6
         K4asXnebzEqIcUy+77aAfeKL1ieHsEI64Lj9cD2WbFksIUKOxpHLpPEhmrB6UnfSMzby
         UStBSk4KN1pfKWaOy0ZESTbRTXu3fQ1azQIEKKMxf8dbl+vQsCExe19Fr7+VH5MzqRPM
         gPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014602; x=1795619402;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flTkdZEYbmHHX8uDsGTqb+GbA4JNBQ1tY4XceC/t+Xw=;
        b=mehclnX4R+tZe9fpNumkgcwgfJffOk6zdCsfBbEaVvkXTQ+MbfZSyxEiFle64mj1f+
         1pQqfUYPNqjgQYiRTKXN2y+kJ4a7DRPd0I2+kRk7tOxqlqqm29mi2OfQ8OQSlj+BJ0Y3
         ejTgjtz4pM8QnLT2wSfJ1uDU96qeD1GWk0F7bFjRlzl6DPsm1uZeztdK8rCNO0ez5g1B
         2+nnwgj9Qvjf1/jmAWth/M3RnLzw8rSkQqxWZJuZ6V0iG8QZDmDdlIJefQfw9j7aX8zT
         Da116YLYDzViss0j27LWjgxUnyUXjBGArliUINNNZw6vzKoVYBaHdPG5T+gUNRln0ZSg
         9oDA==
X-Forwarded-Encrypted: i=1; AL+hErEd43pSc2UjL5H4fZaY2TWNxuKUxY06UWuu/muiID8w+odt/7ILNtYBQhKEOB8ldG+wqxHlSWklcXyTKOZc@vger.kernel.org
X-Gm-Message-State: APuU4Z9AZhDPCYki/PiNT4pUHK0aSCdgZbOCEjwfHwODAgSOmV6sz/ul
	ieWOljAxZRAmvcXhJ0kCUR1iv+KiAcnDI5cnq3kKWKKrb69MbR2IY8FZWA+O7bxaRSLxb5Zl0uR
	0rcPFuegYR9aXaXjmTmiJzMMLf1J1/OAMCpB+OjgZFHFZr9qGRcKx/ZPp0n2exqqMUpsD7q+sc8
	KR0cRxHVHyCM4JD85SXX6e4051rxo5d5MCKLFCzad5+mI=
X-Gm-Gg: AYBFou3gFj1v3bCIJu/kSu1iWe99SP2HTFVJ9N1uNyNl13mViKTXzstn2Y9Ps8/7Zg5
	LfcrWswOgku4Sp/Afx50eSiB/70hZ55LCfNgZtYKo+NmsHdz9K/Qrd1YLCvMudIHtlwD5WRCrVv
	QK6ihk06bQx03oK2kYrfmgILWvL4qjj6aavZEOqTh6jf0Hznsdlq/f1rToLw==
X-Received: by 2002:a05:6a21:3a41:b0:3f8:78ed:b4fe with SMTP id adf61e73a8af0-3fe980f6d1amr3184467637.46.1795014601767;
        Wed, 18 Nov 2026 07:10:01 -0800 (PST)
X-Received: by 2002:a05:6a21:3a41:b0:3f8:78ed:b4fe with SMTP id
 adf61e73a8af0-3fe980f6d1amr3184430637.46.1795014601308; Wed, 18 Nov 2026
 07:10:01 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118023201.2031211-1-zhangfei.gao@oss.qualcomm.com> <6aeedf05-a8ae-46ac-bf1c-58ecab7ec6aa@sirena.org.uk>
In-Reply-To: <6aeedf05-a8ae-46ac-bf1c-58ecab7ec6aa@sirena.org.uk>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 23:09:50 +0800
X-Gm-Features: AclHuK9NVLbGP6CpcTR1T8ysZ9VKjGHAEIip-iOoYZVrM4ubgXtHt96rt46OEkM
Message-ID: <CAFkd8hu1K_4kfGJyuD2NeD0S=K5fPBk=9=V8Ziv3Qu89YPCxrQ@mail.gmail.com>
Subject: Re: [PATCH v4 resend] ASoC: qcom: audioreach: support multichannel
 PCM formats
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2MCBTYWx0ZWRfX7WtJoxX6uNQh
 44gF7IPPRLJ2Sd3Y2xy2ZO+1iO7Js4KDOXROow4Bem4kS2MZ8iAMe+kxC4bocI+0+0EiIGwrdd+
 VVYPKW51NT0kUsOYenZDW/blRiz4QV8=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afdbfca cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=_LpRk2n8-sDezK4FkoYA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2MCBTYWx0ZWRfX8jk0R4OV6RVk
 oS80IWhPp0M3T5DFbbw1G4Vb20kW97kfsLKYgolDD2GnMsHwKJwH/aatvWWMTBXCbgpNFIaGDc6
 CGTJaxFg5O6LqRdZ+Xnrde68SraeauJGJnu9ZRCcPVezuvYavux8s/nstz8+OJ+aX/28RQnQQOY
 Jc4Q8h1yEF8X56QX+WRph0ZBkk5/YsBjDRJC5rAyPkQvxl/5C9bgc9i4aB8bEIpHrtl20zOdeDr
 BNGdMaZREBr+uOxsl2pI46YuUHOCAWbxuGbYm3Mu6BN+SpI0MwfHL3eXWyV0nTO4zUbdXp18NeC
 038gmko+GzUR/XDFMWA8IxGEO0JBTskj+yx/e2l+KwIAN/DpyGv8IkPYjW2nXpdeVkfsF3c1Q3L
 /4g/MF+jfrY5W6wwo6NWksUoEuLOAEZYi3JKsvLwiyjNe9Ey01Xu1Oa/RfXQDpuzNUmEwuzTbJb
 96olO32I4K8kbYHhrJw==
X-Proofpoint-ORIG-GUID: v3gJT2FgPdtASOwYgPh9Rrvnaa79gNN5
X-Proofpoint-GUID: v3gJT2FgPdtASOwYgPh9Rrvnaa79gNN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180060

On Wed, Nov 18, 2026 at 9:18=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Nov 18, 2026 at 10:32:01AM +0800, Zhangfei Gao wrote:
> > AudioReach currently rejects PCM streams with more than four channels i=
n
> > the PCM and shared-memory media format paths.
> >
> > This prevents TDM links that expose more channels, such as the 6-channe=
l
> > playback path used on SA8797P Ride, from being configured.
> >
> > Reuse q6dsp_map_channels() to support multichannel PCM formats and use
> > the common PCM channel limit definition.
> >
> > Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> > Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> > Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> > ---
> >
> > v4: Rebased onto sound.git/for-next at fcfcd6db32adbd
>
> v4 was this rebased onto some other commit.  If you have changed what
> you are sending, including a rebase, you need to change the version
> number otherwise both people and tools are going to have a hard time.

OK, will change to v5,

Thanks
