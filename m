Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794969713;
	b=lNBulTZAb689chkdAMJHAp4XgvhiOJOzIAQmrpaHxGdhm19iY+X6wYFjr4q6lCuHENTy
	 3/58+zvgqqxE9zYG9RCjr7vlIfnbXGwTdMoQLNokqXzKhkwT1smHdkbpuYSaOxbgwW0sl
	 LgZmOvXk4uO0GGVs0HpU5PdhpipcQKSzjZIzoSK5H4d0Q08SDm6YngTgF1OcfoxqlDnOr
	 1P94vW+44O8m+0GM5tp2zka37kpE44xQd3REiKclhPXJrSFLHJED2JIwM6dvPTtL2EAU6
	 J1bHlgRHNkct5Icku3vEegFSeBX296gjV1nMKRZYIVj/I4nrygUcTPvF1mhA0eohG2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969713;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EXpBEUN76Cn3ev1irIMt3vFHpTxfdNZ02V8Sny5G99E=;
	b=B5IzqIn6G8zqx+vrNwR9mjFuwfYMAbiW1UDjp9JiO6cv4Zhlt+7AX1GVGvdjzlxmHAKz
	 xHU03yU7BOz7Htz5EkBPOXVc0XdMzVmqAkJeohlJRn9jfr1wHicz5o4ssij+5kxXkEAbJ
	 MzvKYmUfyP6IkZ+0S5bzQpvO+thKs7L1L9AwsUWQwv4TVMlk3sFBwp5HQNOgxZHtHQ4Jz
	 pw4vMZwjeNiQCIg1unMDT39hEMK54fxqfeqt7LjGP7yd2Mva0yz/cTa43M9bZIRF7N9zq
	 gT4cXJsItcjZxfnEpgzInEBHY3byclspkSthFlaoF/fYENHvdaz6I59Qn18xM06igGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VdfiQh9T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vp7baz0+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334C6606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 02:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 334C6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VdfiQh9T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vp7baz0+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UmQb3371251
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 02:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EXpBEUN76Cn3ev1irIMt3vFHpTxfdNZ02V8Sny5G99E=; b=VdfiQh9TO143Yzve
	d8LMPHXsMHq66Uhcwgp/xbKf2czRZqOr0IqD7m1ZW4cHfEE/MjlxawqGlxDUvfYE
	3DlWZGT6+wT/qxNkK7NsRmQ/QVhWG7RuFKwt3Q2PM1DHd8ttW++HUS+NFKW4/Bk+
	OclCa0TN6v4RGMtQqUlFGUEedXIVOhk0Uiu+UgT2WwKURV/0Wcs9W5sr6Vg3DGBQ
	pJkkrd6ggcOX9GKX0zZNmmus7oMJh//EphyrsVAA+LY7kgVnBfa4uAcbq+V54z7X
	Vq0BO+nAz17xoaSaQ+PV/kRkc0f/njQ9sQrIUXftxVWWcmHFDTR1o0EBmv3wBzA+
	I+y3hA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8rrs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 02:41:52 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e95f8543c9so6926305ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 18:41:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794969712; cv=none;
        d=google.com; s=arc-20260327;
        b=FIthhL+URS3r1aejMcV1ULufd59wvK8RzYEAbhoGZ/p6dTWNXhpjwLBe2bThpyJixO
         BxPXG/qY/3G/t1Eeb6t5twyfBqCWlXk58Uzl8X2x8M8dJ3XEFZzBSVy/EfXWzC0C6f1d
         21cg71Bca9JijCxN5StoJg/XPuqaDp3TdS4bKcTYFcVAszTCsGty9X94SbOeEC/m/DsZ
         /3IwZWJl/n+7sckgdmLvKTnpyy/1GO4/auBw2TpVxwPmB5NpVvHGUlB02QE1miJh/Bxh
         gQL1JMsia52+JCvHjaKJDJ2j1nCjZ7MsvypUGcU41bqMmbSLdQ1l1G7H4CdZ7b+ducze
         gM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EXpBEUN76Cn3ev1irIMt3vFHpTxfdNZ02V8Sny5G99E=;
        fh=UfwJzhVjJfjOQw5/knq4r0Zyp9ilk/IXbXkHGE2gz8k=;
        b=mzx+kktqybvSK+gO4HBhiZsRc1vWstsr4cU7wMbkTelpQ2zOzgdNGhgLGnXr9z1sVI
         XUpxoN+5jNGK0x/mQwkrPga1a1gn6qAj21Y1wabDxkF9ncQcaVqG1pugQ9UdqrZTSRfe
         r+E/PkGmDyOhPufnEzTcf03kSiAacMsdIG2+POJC+ZLi24Zplt8DaxzN8iFgjGhc0qif
         hmDGiUb2u9pMPgHnD2mRKMBeVQDlo++DsjVbIgjzJzF5jp6r5+ql/9Gq/gMuUhVsoDNZ
         v5GSm8bzjYt8gawIyX8gEwmCbmgJWhNugi9soyYSFBn8/F35YnNmCIIDEyy835ZHTa0S
         OgnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794969712; x=1795574512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EXpBEUN76Cn3ev1irIMt3vFHpTxfdNZ02V8Sny5G99E=;
        b=Vp7baz0+wt1RvyWMBwlrbOmNzuEutbbb0l/oBEFQqq1Nj4Xks1SEPJ6sGmhNQ5PdVP
         mnI0YgQpQFlFArtmj5ac5nWE8af8MHDebRTZIWLkgFuvqgdW9s6GQ97zIrl1IAph9/ce
         LM207zcxmRGWBwVoQc7YxYF3tlzk9BEl6j4QOyGIV7Ad9Ga44pIKwdGLXB0G4+mbWg8F
         YLeZaooH2+ajYjgbIQWdC07G0x8SL0ufPxsVd0xHaKqMlPnPULFvrnmaI1HUUNz2urJt
         SyhEks2+GA+eZUiUvD9MmSWFDEjt77Y4qzYrNlHF5xckQqfX1UpnGVMS1HBa0KURiAzv
         dzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794969712; x=1795574512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXpBEUN76Cn3ev1irIMt3vFHpTxfdNZ02V8Sny5G99E=;
        b=bz3hd9CRBukdL6U/WLr6SXgPrvfev+Gr7kCR4aQZnJzhiauQPvi5GtG3csq9V47uIM
         LaoYB46HNPIqEcgItOE75CjQ8eIhXAAC0JEFn4qMuC+15UGJCompZss6TkZxPcGKJsnA
         mVcyGG/H6O+IShIEESY0VM0zWpLdC9ACF2F4pr5dvtjCmQwG+6rTqHdiIaGAb3yEPbBo
         4ux+MhO8wbQQavRjp6ZCzWR86RKeLFWZG7FwsdxTeXuckCrd9/hp9YxWzjEULXQxxhH/
         ga0wKifwN+h0DmlyjefU7jZv4/Ny/Gw/r7KEkG9ZJA8XXBwMmIHCiKfPfGNYbX13GgWu
         Z/Gw==
X-Forwarded-Encrypted: i=1; AL+hErGqp7AmTskHHv1JjtmKbiLXlJOF/fpvW58fOm+X+3DskjEwOT1bgdysW8Rvhe/ssTe903dMR8TeMuVg22/Y@vger.kernel.org
X-Gm-Message-State: APuU4Z8gf+B8wGxW+pRSNFWeACAOIE++YOYVrPvzBXy78v7+itCMdxdr
	cvAdxJo85uv4+yiOidqlt+K9ejf19fAYZvXTRvXZ9z61YlZauK+zdEp5Vfw6xpFtWQQwnhF2KYY
	2m5fnp3AiS7OQft0RdLdYoiOcVcHgYzCwWDByPvt+eJHr6BAdvQdaD+oBVWH41lORkcPXXaa3GR
	oKRu6ezbVZv/guGz9I5CDLZ9x6j6qdAhI7Rh6zYgXA+yk=
X-Gm-Gg: AZFdTZf/o27k5ppAuYEUUaenBthR3psNnbW4UTvufcViVug8mQU7AfnueTMDzlA+qW0
	svWHKTGjim81KrH0YJUWHFj0fqY/01ab2fAbf7Lf2C7s9teMAfkSsVz66eg10368q+yLB5TXNmH
	+CBpHA9vxYXk3inQWgLF164BPITRqsdYr08HNy3dX8rDXxE6exvNAS9KunlA==
X-Received: by 2002:a17:903:1666:b0:2df:90d4:7847 with SMTP id d9443c01a7336-2eff75188a6mr12050685ad.35.1794969711520;
        Tue, 17 Nov 2026 18:41:51 -0800 (PST)
X-Received: by 2002:a17:903:1666:b0:2df:90d4:7847 with SMTP id
 d9443c01a7336-2eff75188a6mr12050495ad.35.1794969711011; Tue, 17 Nov 2026
 18:41:51 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117050328.213157-1-zhangfei.gao@oss.qualcomm.com> <6410d170-305e-4b24-a20f-3b5e2ee9654d@sirena.org.uk>
In-Reply-To: <6410d170-305e-4b24-a20f-3b5e2ee9654d@sirena.org.uk>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:41:38 +0800
X-Gm-Features: AclHuK-VLWBxgIZ0XisTSXibfSltulzootARIxFetC1ERo1sszBwmUSj4N4pF_8
Message-ID: <CAFkd8hs+H6TLg7rCbX=5vtbouDQmW-xRNb3riGZEDmtxSf00jw@mail.gmail.com>
Subject: Re: [PATCH v4] ASoC: qcom: audioreach: support multichannel PCM formats
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
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd1070 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QqkvHvLY7Ef6vnktetUA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: cNAsl_04tf4bnnV4H4NDfG5ZNtvqScRO
X-Proofpoint-ORIG-GUID: cNAsl_04tf4bnnV4H4NDfG5ZNtvqScRO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMCBTYWx0ZWRfX6zF3+pbmONvc
 ud/13Fe1mgJDA/EfaS2G3VZ7oxMfyuWceYFXWENn4d0hU0Lp+C+l4WFuirgvmX30ttE4TD2HQP7
 rsBgRzOLJZ8zPyUMOPmckyCZwfzhJtInTTLzIz8SMsAuofyPcbIptnjhD1/JLuuv3e2/RdVEx8H
 iotvb6uY3yFnfuFE1J2wGu/g5D67pKQTe8GwGs7E1sJIhhesgiIiTsZNUQpIOkb9BAg/Uz/sBS6
 Yf4kCv20fmJlS88j81GSh8vh4IL0V4KUP5olzl8F6VC+sS9ep87IeNhZ91Ed0qgAqwQNbaQWV1c
 DMWlz0sq6LWeQv+r0PheqcgYuXpgoTSxApmpA4bz4ex1azX3Mn/jT25tPpHJeWb2SaX9g4ti8Ms
 IKpqMyvRkYSWcL8vntJi8S++1312yeFEXJQB+1f1EiFiTpxPiGBs/dEBG06V0F+vAtyK+xBQMFT
 MbHpiHqAa5uqFpq9yxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMCBTYWx0ZWRfXyhad5VVHC6GO
 Q6BoDLVHJggxuJuiVdBUjzSfdyCRT476Re17mdM0wPXTkioHgOexEVb9FBpF/Ne0EiHqxsxbXm4
 E5NP/8fYiq4dDbx1+wjGonSl1jyhQ3o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180010

On Wed, Nov 18, 2026 at 5:48=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Nov 17, 2026 at 01:03:28PM +0800, Zhangfei Gao wrote:
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
> > v4: Rebased onto sound.git/for-next at 7cd6b1fd8f9c
>
> This doesn't apply against current code, please check and resend (there
> were more updates since then).

Sorry, has resend rebased onto sound.git/for-next at fcfcd6db32adbd.

The conflict was caused by commit 347e02073b08
("ASoC: qcom: q6apm-lpass-dais: Reset the codec DMA channel map in hw_param=
s").
The fix remains preserved because q6dsp_map_channels() clears the
channel map before populating it.

I also noticed that q6dsp_map_channels() does not support 7-channel
configurations.
Is this intentional because there is no single default mapping for a
7-channel layout?

Thanks
