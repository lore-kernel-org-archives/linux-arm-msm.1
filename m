Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCC1369D7C
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920669; cv=none; b=OStrPyySYIs6IM2YxFclrltApdyVF5DRmNKgYY1Ra8z0QElBHeZiqGPJZnVbn2AqTuw6QbsiY1IU7tC7AzFsiDmGU3cVjTMHq43AUnnr/pqOBxtCsfUivMEcmbhyV/DOtyzdFEpCY/byWlzl2mptxY3H0JOMToMn7rGTZcK1T60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920669; c=relaxed/simple;
	bh=xNHLosBmH0XiPfdIaRXd6JhnDcpZkYxuucgrupLtItA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxzdKhzymDTMqpL2lcw40yWEd+VFfergTfCrejWvB6tbUxaNnqVDmwHO7hGXkqWQYO19HWzu6D1p3CdYUndPerhcCkqqBQMRAIurdEeio2FJ66tjeONDRIkJrBuD59AwpRTr+q5U438scpmU29B+0G6hS47t6uYIvrHKUMBElYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pu4t0v3w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ARx4T/ML; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pu4t0v3w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ARx4T/ML"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7VMo2167855
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sVGs2yC+wr0Kx/gwM5INziNp+kp+s6je+k96BIrufmQ=; b=pu4t0v3wCfoosE9g
	dXq2hXl7rqTokh70/S9oWaNHqcyT9htAUIagX+Jxg0eotImdPdpDr5czgi3m2yfP
	iTXVBZMG/2uW54FGGSdbgq3EShkLNbJIZfoLOuKPv6dUWRxiJDbSpRlJt5QiVkmj
	XHC4OtdSBLwylx+7UO389Q/gz4DKCzZcmdj87VuQ3B5YGgrT3D+INrloYYFT4OQl
	oGjrX3bfRFXH30g0q5wBNjuB6avveEfAUqfQyRQZO+eyJoQpvXFfGuaLXkOMJErc
	Y5wG8T9rzp3Afw9DUiu7YxnxxahEL6UIbFNHU5ZVQh0nVADplY/0FWfd9vFamk6w
	WNI+/Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb6h01070-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:37:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c01ff996dso11131161cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 05:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920654; x=1788525454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sVGs2yC+wr0Kx/gwM5INziNp+kp+s6je+k96BIrufmQ=;
        b=ARx4T/MLPXwGn4p+b/NHcTIzNhsCai0DYn6x5HDPhRWGKuN4/f265Q8/q5/WYbl0Hs
         LLFqj4j5IJXDfjzVuiG2fMbykl3qqxQpw4WN7mhew2Jbk7oTinXPqB0EQFiFy7oR00Kj
         IMas3GxUkP5/IEL8heVdmYV9l6zvtuc7teVir7jdSrLyEXYk+O9El/yL3XcrgzMaL8ln
         GVu//vFop9Kth5nc+7IpL8SrtwaOfshxdqY542vY0OzjbBbtGw48woe74Lzx9fhNftz1
         TG2IYp/I6A/YvEHszo5DHE3dzFbMe3Ap2breibP1NL9DzfwZ8iP/D38iwekX5150cVDs
         O2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920654; x=1788525454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sVGs2yC+wr0Kx/gwM5INziNp+kp+s6je+k96BIrufmQ=;
        b=JimiVGP1ekGsLoFjQbEGSTF0c/X39SxZNjEmFbJDZCMZB5ws/8PnWBHbtjAWM27YRV
         l2FLf6t3jM36uycuLeQ8+Rdvf3G3RDL2WDwAdbpjTUkJesRn0lbJ3nDSRnFQgAHcLGLq
         8PlxAfcEwMj/LeXQM3tvrAZlt1eINXpnvjxb4051wphdmCFs7H3MRlrDclnqopaAfshc
         stafUV8QnnyKtyXUTevrgqiWrZ2p20A38aKnLiyCKptUVGs+hnQq+OaGfrPSWUNqz45g
         pmYPuDDPg3Fal+kGw3Qp/B1W71fk9Df4cO8DGARqasMBmgQViD/iLNwyJEOUhRRdVNdT
         3yCA==
X-Forwarded-Encrypted: i=1; AHgh+RruU3XhhwFr5ouQAcj8lwxLuUWPfdSzRgcRdvszce7S15qA5YfBhHZffZANQYZfoa6sPXFDC7F0sggoUfNA@vger.kernel.org
X-Gm-Message-State: AFuF++noJQr+OtkUUZII2Pa8Ve7Z8qsouH40K6V+Bd7cAhs+JpsRynCE
	tsWYpPx92MAUxPgYBZ/WP7e29JmAYw+PLl0sgPosTDSZ9v7EVwz0xj+McOz4Elg7NFkYjo06gSf
	0i+MaJAJE+qbKufx97Wkjrp0aV9zmCgcLXiNWkqrQ6eyHR6287c76zypaAHQvvEGkGwqL
X-Gm-Gg: AR+sD121DTKvxpACT3E6AtueNEYDUx9INpaBoSWuUv2B/dnL36BSctXIZviTP30i5Un
	cPr994J7O7S9zKlKqwOzM3nhECsInyJokIZOirf0YtEOA0gpSj7XIBduEfWDi3RPnRoTncdGGWg
	aTJYaI6EWz/0sLYfDRhF7PDY97SR67c9j4zLf4CkE8YTW+EoxOFiy9iT4dKtoK1MI6tIoWZOkHK
	gcl3H3OnuDQtGbIES7oe8+8PYEZvdipECI+DPhGbry4n1q5vsAnkpZVIyQd9WAVuA/Mk84oTbDd
	liiACCBSefjVhvK85hT6Ae7i2/U2NklmMfniBSTn1F1xc5jeo7VMnOrbvDplElbi9pdVAWluURR
	7/+2StDkdfhTMqNVUDxtZp28U9zo=
X-Received: by 2002:a05:622a:1f95:b0:52d:ea18:a9c with SMTP id d75a77b69052e-52fb96ae584mr81958511cf.34.1787920653699;
        Fri, 28 Aug 2026 05:37:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1f95:b0:52d:ea18:a9c with SMTP id d75a77b69052e-52fb96ae584mr81957671cf.34.1787920653235;
        Fri, 28 Aug 2026 05:37:33 -0700 (PDT)
Received: from [192.168.68.119] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm66837655e9.12.2026.08.28.05.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 05:37:32 -0700 (PDT)
Message-ID: <375dfd48-4351-445b-890f-cbf3a835f65a@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 13:37:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com>
 <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com>
 <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org>
 <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cxLap7BMJmFrK5puEXuc_Kp4tbIjugrK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX+mRYsKrl8lTe
 eKwAgZGZnvQ+ppxtRDLsJo/NJ28YyYzmfr/r7DPY8QmhbfO65UYJghCr8dDS6171hqaXrNAWzD0
 NJ3ueFnZEbeUcskvymnWoJHqHa/iSq8=
X-Authority-Analysis: v=2.4 cv=KPpqylFo c=1 sm=1 tr=0 ts=6a91810e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=P-IC7800AAAA:8 a=bIOyMTNkgNfJq1KbeLIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: cxLap7BMJmFrK5puEXuc_Kp4tbIjugrK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX/kEMPDifWAzH
 yQ52Vusk8QxrM9NaUQ9th6N+pfvFtMSCK+F0uzE8YzROHAnT9ClxNTILn2S0BK/TF1v+s+dE0SQ
 0NZTAHR2mpi13G/v7sfQGSELCUn+ak76Dw44F/PCtpl6MLaPgRQ0rJVEHR8fxMhiG6+Tpr7vRa8
 jYyuT+5Ac3APp2Jskz+6BZDk1uJ4n97PlWH9ld7x8w/lK2cWD+1zZEVSbAuisprzO3c3ANQcZe1
 W+b9sqp5PQlCZQKgEwMWzj+0x93Mi11+aAoixoTGWEY6YtEuEgG17XDThQGx7rjGtT4Nd8nU6lu
 8iZYt2Taz2aNXVleDXHnrhto3pNhzE/moQ7i580H/6P0VCLCF+r6oyVfa++GDo6aix71IN/OxNG
 lq2NP/K8QIfMHsRe65Rp4v2T+fZwwI9rzLL9tL278dtNDgfIC49pSfskX2VBXexH/M/TRABpsWb
 4KWEb5MyZbWA6eo4lAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280109

On 8/28/26 9:58 AM, Harendra Gautam wrote:
>>>>>>> +#define QAIF_CDC_DMA_VA_TX8  254
>>>>>>> +#define QAIF_CDC_DMA_VA_TX9  255
>>>>>>> +
>>>>>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause sound
>>>>>> card registration to fail.
>>>>>>
>>>>>> Check sound/soc/qcom/common.c, as the current indices (246-255) are
>>>>>> beyond the supported LPASS port range.
>>>>>>
>>>>>> Best Regards,
>>>>>> Rafi.
>>>>> Thanks for pointing this out. We can either add the range check for
>>>>> min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
>>>>> qcom/common.h to validate the supported DAI IDs across Qualcomm
>>>>> platforms.
>>>>
>>>> You should add these ids to
>>>> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
>>>> conflicts with common code.
>>>>
>>>> --srini
>>> Thanks for the suggestion. qcom,q6dsp-lpass-ports.h is specific to Q6
>>> DSP/AFE virtual port IDs. Since QAIF is a direct MMIO driver with no
>>> Q6 DSP involvement, would adding QAIF IDs there not be misleading?
>>
>> These are IDs that will be reused across both dsp and non-dsp solution.
>> So it makes more sense to keep it in one single place to allow the
>> hardware description (DT) unchanged across different software solutions.
>>
>>
>>> would it be better to update the range check in common.c/common.h to
>>> accommodate both LPASS and QAIF DAI ID ranges instead?
>> No, that does not make sense because these numbering might conflicting
>> with other ports in future.
>>
>> --srini
> Srini, could you please confirm if adding QAIF DAIs to
> qcom,q6dsp-lpass-ports.h is acceptable given that it increases
> LPASS_MAX_PORT by 56 (from 149 to 205), which indirectly grows
> multiple arrays sized by AFE_PORT_MAX and APM_PORT_MAX in other

BTW, the dai ids are already added by Prasad
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h?h=next-20260827#n240


You should use them.

to your question about increase in size, yes, this is know issue, i have
some changes to send which will remove the need of this static array
which should fix the concerns.

But for now all the hardware dai ids for qualcomm SoCs should be in a
single place irrespective of dsp or non dsp solution.


--srini
> drivers eg below
> https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6afe-dai.c#L30
> https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c#L21
> -Harendra

