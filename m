Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569991;
	b=j2exELh2LpHLzBtrdnCk/zEfF5Bf4u69iqfXRwnHqdtnsAoNvDWdLPhh95IHCjero7uv
	 vlM+870TQkZ0rVf5RNrXyGPcz+Gt1feOxTXNTge3oPjY5Nw4Aa4LzQvCBURsLNXkI6ZBC
	 xT3SkA/y1yy0a3x+5TtuvYDk7yaJQA81qxS9f5MMB6uRO8frdZLO6eSCDsKBBdvIyawbU
	 7WvkxbYi3eXMnpO7BC0KabDyhAzYQqkk2FB0I6slPU9zipFmpWeAxOgMLN4VKQhKICRsV
	 3ux6Z5aQnYZFmIyEohTaoDpHj7ZR9+dUX+KBB7dmoiMVRCXH/wkgCUaoIb1Y/fAHsoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LiOs04YGXLTIFXmdwEgbkoJICneWkcQrh/KS3klkgwI=;
	b=WOdHtHnOKHuaHctifirQfeI1TW2qgZ9lk2gk8z+1Vrtryylu6Lcha3eH8mCsVZatFBfT
	 E26IFVmfGpWc47tPg0/WEvBZGab+birJ3BkkcGKLN3E1fYT+HCbwQJDEtV5soO1AmKSN/
	 9mcsfTvqOTcKam0FtZquhGnUDNG6NcUOziqO4zFsfgUH0UeEyTmQGEmfzuZF/m9lq0jW8
	 QU8dEk2NA9E+opKUttHGk5dbTuoypqXjSunBhrOTPLvH6hdpsNewm+GaU4FWjb0Bqnea5
	 a/jFL3XQn36gVm9gwj8vSeSi/Do8NOhPHNQ6nu6+QD02OgjWb7Mk0uv/dWBwyR0e57w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eG1X3yM8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="P/mGDFIm";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F6B606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61F6B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eG1X3yM8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P/mGDFIm
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j3qb3926591
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LiOs04YGXLTIFXmdwEgbkoJICneWkcQrh/KS3klkgwI=; b=eG1X3yM8s7cBfup+
	7FRm0p7sGm9xEClsivOl9XKgz7XNgMjPqlUJvPg7Jye5BKzc4qZhobz7R6wn13nI
	/IJsVf18d1knSYEL4RTqmUuNr35MdgJ+xOnrl8KgMulRlxQmsQB6yll8IKFz1wyi
	/bcOwwoOipOMQv8VT03eUe4/iZR9YZ/U+5bt2xwWkF4482Jwj38xc8OBw8sG/dxj
	D2qe01p7KnPp+A2V5HQzLK0uz8fe7THidg3/fnLWUH7+drWLlYsPd9eM1tFegSRG
	Txdz2z12phDT8f3AVePuSIeZ0YN10DGV2XRvGvNjBplzrLfCU3b1UWdU+9MrqdoB
	RDoIRw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h2c9py-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:06:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5360b8cf8f5so1394561cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569990; x=1793174790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LiOs04YGXLTIFXmdwEgbkoJICneWkcQrh/KS3klkgwI=;
        b=P/mGDFIm+90heRka1liwivcHFy0NCdzIG+JzsR8G/ZzWduS+vKe41gqdHOUKS25/JI
         OSrMr6JbEGv1vr0CEGNfch2pXEVWmmWNQ+VLhfbcdABZxuCuMO7+Z32l8XUbX0letWiE
         QYWoCwZfiTFAdOm82INC0KcbWH5CAu4CsXMVIBSE8h+nsVtysAwzE39lutmt35aEIoq/
         eYILJbl5/es7+hZKdbhSCVoKauV5mHPg0aoAv+9xPtPQ242EW0moWkkAGI9QCHHvmBMS
         mNbmfONmS1wcnp1//92n4NGElwtKZpiS6Z1H6+HLZ2VnPnkIFw05Vgx13u8Z4aADtyjh
         1jaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569990; x=1793174790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LiOs04YGXLTIFXmdwEgbkoJICneWkcQrh/KS3klkgwI=;
        b=jAZq41sINyY5gcVLsPAJgm4RPK3bskmK7ioFxVQCtiefElIaVJtQYB5uudSZTy15LX
         CNDNmABTdxlVqRWeduxFABOOnH1wl/VOqOIUbIonipbvF+Y6E1O+KY4/5bhZo95eXGIV
         3Jd+2IiKbTDVMcf0XjIDE0q8xeS8RihqgyAcGx7dPUhvmAwmUn1TzMjmf/8BLfn41VHY
         2siPEDYYKcAFJFNyeAx3U2FlMPH0BN18gBgJ5yO0Sac4lw28eBXYF/WSid5mrX8OlG/7
         t6xA23KYD1ueCdWk7tePr4aTTgt3mOapKfoXcwNYLrrwCb+2aXQCn07mfo8KvTooJVE2
         IhMA==
X-Forwarded-Encrypted: i=1; AKwUvByBirv27qCX3W/3Xw1HkFbJ9opEIe8DIFyDFwxKd6Mque9YDDVfIs5zN7lH/vlQ57oPkn9m99hfERD1Z137@vger.kernel.org
X-Gm-Message-State: AFq9FYIcAHtiKwGD2erkE9viXReAaPERtvDofpzC2UD8+0Xnov+PXRwK
	YvDw8mWLfFk2BCzOpfNLJtkGjHLxOv8MdnD4gEokme+pQ0xCqZN0v9+3Rt5KiSkg6GJ7SZguCJ4
	8dxqoeeNChb9PMAPPjyfRiLFFZqoTYi0kqp3ohnMfh8VXSJpZlM9DbHTRL0eSTPZca5jy
X-Gm-Gg: AYBFou0F+s9Ba2lM3hLNBkDGatolSCZhvntYYrbNmDV/fipWmDWxYd5moeZK2+b3m/8
	29/rIBMHAQDYiigX3DLvqfJ2q3shOGlIZOmCVski0zq87/LxcbLqfIUVI3vrppZ3NUKDVv1VbM1
	T07CgNI1SND2ugSWUnzNK1v6lN5/s27GuuUHweLdyEYt1QaXR/OfBNge+Eub+WjlW13s8HiUraM
	xbH8M+BALX+oWRet8V+CNNSCY5vgAF76d28C30cwQGECUmR4qPriJecl7bShtSoImLReDsIFxAj
	0VXPkO45SaJ6F5BnuQnzPs1U9yqc/+VJf+b43p4QT5gtsyfPKE0f4PBJI+/4xTy3YUzwAcEoeaQ
	2PhHhn8ctxcHugPRhyANx4g==
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr26472681cf.0.1792569989526;
        Wed, 21 Oct 2026 01:06:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr26472251cf.0.1792569988977;
        Wed, 21 Oct 2026 01:06:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f77729sm50471066b.25.2026.10.21.01.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:06:28 -0700 (PDT)
Message-ID: <9699033c-a9e1-4b11-a55f-b1aa216c700f@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:06:25 +0200
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
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias
 PLL parents
To: Robert Marko <robert.marko@sartura.hr>,
        Julius Bairaktaris <julius@bairaktaris.de>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladyslav Andreichykov <vladdrako007@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020065430.1251541-1-julius@bairaktaris.de>
 <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bZGYPhxfCMfAJBIVvcAT7ZlHf4Osh88X
X-Proofpoint-ORIG-GUID: bZGYPhxfCMfAJBIVvcAT7ZlHf4Osh88X
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad87286 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=8NHwpXmQIE9AyX7o414A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfX+t9/ARzU9rah
 kyUBtDg9RrhjctruzROViXQOZrz2erY8gnGheTmMlpKjYE4mlgNtSgzndr8IAgXw2IKZhJ+Mxfv
 2ApyS/u7v+89ivFcL2miTKuDBfJzIY8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfXxNTijSigRj2k
 w7NvYqWX1+dzvZOy2i0ueXluCtHpp77ficDZk24pYmGtHUaRHt3Tso4UanITu3lTDKpcmhJ4MVO
 qalWWbGLQrkbGXCRdVjvScHfRhlyhtefbmRTmrr33g4JnhEBZ90Dr4Jd3opSFwyuJdVpu0IV3hf
 685C1FoGhzr3ka/M3SaE9tKja9MrHSfJusO/8cyKF7CZQFJZiKMn62wglZDEXVTx4pdM0ob928K
 kdDYBklXZkYifE7/BC5DfHggnQe4pCil/nTjkDFKDEovTPSxJWotSGQGk6rfBhOPDbpmWFvZZ5+
 dOJqg5Ws54W3qOT9QPzuSdCe6Zz5FLYDWoWyC8tB66PtpWzbEb9YiPOSjeVYc8iPt9B2oHGtMLJ
 iIh1j0BaLNz6WpTjouOq+unfwBHm5vyng+wmghTWPUTd/IJ++M8d55uFomgZK2ZGqrJ0wE3w8Qe
 dJVd9la3FFfYf7OO5jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210032

On 10/20/26 1:39 PM, Robert Marko wrote:
> 
> On 20/10/2026 08:54, Julius Bairaktaris wrote:
>> From: Vladyslav Andreichykov <vladdrako007@gmail.com>
>>
>> bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
>> which takes its AHB and SYS clocks from GCC, so the device tree does not
>> pass them back to GCC. With only .fw_name these parents never resolve,
>> nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails with
>> -EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 Hz.
>>
>> Add .name fallbacks so they resolve to the clocks the CMN PLL registers,
>> as gcc-ipq8074 already does.
>>
>> Tested-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
>> Assisted-by: Claude:claude-opus-5-5
>> Signed-off-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
>> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
>> ---
> 
> Hi,
> 
> This issue does not exist upstream, as CMN PLL is not yet wired due to missing
> networking, even then the solution is not to add global name matching.
> 
> The required clock inputs should just be passed to GCC directly which I have
> just pushed to OpenWrt.

Just read your reply after writing mine, I'm looking forward to seeing
that patch!

Konrad
