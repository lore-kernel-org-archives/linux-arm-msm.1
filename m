Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F92739B94D
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 09:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787994656; cv=pass; b=UtLH0QdUa2Z6CpNyC1KOVfa31G+NVhFiyzw/fz30ooedV5rqHEhbnss9oVYDuihMBfbjyMKWGR87W+ktGT+26HdJUrkHg+1tnBR3MQ7o6b8ebKf3awNJVN7y2SBnPZcaUVXoSCLd8myL50ODPHdaYhpU9GcDdhA6B31S9aiXVt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787994656; c=relaxed/simple;
	bh=v9R0m/OtdoBNGH1Uc/ryAzaHBWvPsUBfW16dR7HZ5cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NkaXYJUdZI88fe+TJRtApl7fpTARno38YRWtODdw8nASqTkS81ekW/bx4e0Wx2dCpdTmp1/CCcmQcAOJ8v6vuNhXFTchqUZkXjEbijyCME+UNsWymqRu6uVFV4/eFOtv8ScHAO0cOn7j+Br+iRLBCCIG/q/OVFEaMle2CyKMKhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h3O2LrFR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NvL3kRzg; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3O2LrFR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NvL3kRzg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67T8095e1325281
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 09:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v9R0m/OtdoBNGH1Uc/ryAzaH
	BWvPsUBfW16dR7HZ5cc=; b=h3O2LrFRLjD+cR2dhW2tTnX8EG9JsdyMcU8Pzq5M
	RDn+8T6fA5lM+8fWIydv02iZ9pLjVIGqaYf5tiONU+ckgnqZKKl6A1LqeX3hcAKi
	daV5EA7nU5LEmirpW6rJmOzy34dHM4zDC2UkhPs861MXGodsn07PPse3IxUe42rh
	J2AujUuvquZJk2Hd+S+tJbDAeBoaIVnG6qjPWVeBrWTVKccJxewSmyMfd4mQO7IY
	CbJtbqJBrbK3YMQzYB9I6EwdFw1zIVDLqoSMP0NDWJFs44xBndqA1VxFsvIn4X8+
	zm+amfWEw2p/Lp5eC8aBLuooeAt+8kg7/LNT8kuk+xcKQA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2gjha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 09:10:54 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836caf085e0so44746297b3.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 02:10:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787994653; cv=none;
        d=google.com; s=arc-20260327;
        b=FCYALrXnyk55vkteHL62XOAN1tc3ApcMM435BBhBO4lWmtptE3aIvEb1Hfd6qX7+RL
         b53iKVftXpeTGDQ5JnTDJTPrZP8ZkhpiRKFYus4IJeT94DVc0y22ylccdeiqsuwW0JwP
         I6CprUPOzWYL4D0c7hr+mHunT3jgY4877LLc9/zKZi9/J3vE+AEwal5sCBGMdhcvuNa6
         Q7dtoiRNWEn8A0lwmpxMmaKKqsbzU0xAmpoH3kJA30ddiGnWZobFT3dz1/8up/s6+DvO
         Tkr06lSWPZ3DsDv+CvkHB3JoAPcUAlBnXdxN3JPWgqyOL8DIHBOZzqtZJAdDeQy/TGfu
         350A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v9R0m/OtdoBNGH1Uc/ryAzaHBWvPsUBfW16dR7HZ5cc=;
        fh=SmQpIEDI3w0eLmk0zI1BhzEhkjEB7clpql9p9uxXGmw=;
        b=Xyxc/vbW84cCrd0p5JWOUjD8kbKzDpHM2Y1/unr/g45S28tS4lByEvizl+IYef6ay7
         z9xg2BBekyS+HEvblFvyUjYzJ6cKgHgZ3F9UwK35HPMadS/eNDfDIaKSy+hA3O8SDHdo
         wITl8GoCNaAoYafolNJdVfk3WH27vJJxY67vUxa3Y2xkyv7mriSju2wKQCXLdKbeCIp3
         4K95twBUbL4q8X8PpNHzlE0QyXZU6oCSnoJmWuWC3LsKQ/DDtnevdZ5jxgelDSefdTog
         AN/Vb5KdUPyPQGHJb1NocN0gtOsTyyKNCp41dJdL9e6FoauhDQa+j86b06fa8q9jTvJ4
         fGwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787994653; x=1788599453; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v9R0m/OtdoBNGH1Uc/ryAzaHBWvPsUBfW16dR7HZ5cc=;
        b=NvL3kRzgxxXwLYohJXFuCJs4BygILwZY/H5kRH0pW0Ba0ICV/dqUgheSCLwDKzWDpY
         DIBnIUTGjuIzQiwpXV0knWhqynkeVDZ5Im6WdB2GIDsm56B/585Ebkl2YoDGwTr6ZwL2
         q/NGxIFjiPumoh9qqAHb6X3HRpVno+hfgEvhBpwFDAVdbAwsJ6hvr3UbTlkFgpz4W+75
         z+dphdx1i6PtwYKBQpkkUlC0OEDdXlJ5SahjFE6TwLbA0yLpD6z5sx458lc2HUe1EW3X
         GGc1EiuX3+Bk05VEAIJajqa7D4ROMi9IbZmn0jpoq19AWSTha9PZaUV8To6xbqfdCa3N
         UWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787994653; x=1788599453;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v9R0m/OtdoBNGH1Uc/ryAzaHBWvPsUBfW16dR7HZ5cc=;
        b=HEZFyl5Ik4yFh5ZNktMrNAeebXEoTh/3qoMSFlm5ZAQmoU/8jIjo9+ncbIF8eYNzq1
         z4MFd87MwYml8piCJ1SBXkpPMS4oyt8IFI5hH137gJdubsKFA2Yysp/SjETlA6lP00Us
         U84tAYly6t9S4ijM06e3bsnk7P4xbypV5GNF66JPnU3zyiv6uMsz/ql3L1jybv1IIYir
         V9Z7qaANhItV8RtWDfnH3ogD8qhC/usI9r2fKGET3JvWWi4Mbua0huBHunxDGFNOl+vV
         sDESaJvv7Y5umgye+rdKOEzV+npDhJ71sH3em1ey6IyHKjj0ghtaydx2DloHhjWGc1Zb
         9KPg==
X-Forwarded-Encrypted: i=1; AKwUvBzxT5XdSjrBpuOYUeMb2/n9FzSz5JZhRTsEuvgqHYHLPqu4vhaOJo03RohjsbPQqvX2m5gaJJyDtBcm/51N@vger.kernel.org
X-Gm-Message-State: AFuF++nD8HvRkz68f/jiX8hpY3vkSh3h0qUDuAFg7ruJh2lPjOHh/ikc
	EBvGIe1MqBx2D/K8yY+XiaQXGCG7S4+V1aV6oOvUiCuTkZxAzC3Zwea8hYS4m/lo6/SJA78fi1M
	cK96tKHNJhihHGK1NMC4lNUkcfRsovTEibv3DivDdn84RPaILI1hSpQ1aw2bCSQtXITY8PSBtFA
	uC/VFxIWz7UaTFMXLlt+D/bsNUtM9VM/av0asQbT+gnew=
X-Gm-Gg: AYBFou1j56ciDtNPhB4XOdB17gBllEZTxh1wxLbDCQWhFin43HSlDrnTOi0UdmSjf95
	K4j6mPpws0cu7PDcJ5m96o98YdpuGOU3GuZrSMtLarUVxQrqES8iPzZLq0AryV38n2toNzaOAoV
	7nQyMR9ZfDHbgAe4i7VW0mzzh6Bkh6ePvHtImoVCaiRsDwbbEIlAW309NhWw==
X-Received: by 2002:a05:690e:24cc:b0:66d:23db:5e7 with SMTP id 956f58d0204a3-66e4c43b71bmr3308211d50.13.1787994653278;
        Sat, 29 Aug 2026 02:10:53 -0700 (PDT)
X-Received: by 2002:a05:690e:24cc:b0:66d:23db:5e7 with SMTP id
 956f58d0204a3-66e4c43b71bmr3308134d50.13.1787994647938; Sat, 29 Aug 2026
 02:10:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com> <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org> <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
 <375dfd48-4351-445b-890f-cbf3a835f65a@oss.qualcomm.com> <36b61b1a-1b5a-4946-96d5-576baf707af9@oss.qualcomm.com>
In-Reply-To: <36b61b1a-1b5a-4946-96d5-576baf707af9@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Sat, 29 Aug 2026 14:40:36 +0530
X-Gm-Features: AcwNN1WZTqtwCy398rg4Jah6gCzauP506o5iczp3wsP_In2soqp-bDWVzQ4xo1g
Message-ID: <CAC-tS8BjRPjcFYMjuvyB-9uJkYB=rNkTUtDq9jF6EzgjKfb_qQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
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
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: Cc-SP8CKpl-5MMTDVY1_3HNuYwjCZbqw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA3OCBTYWx0ZWRfXxcYYuRmLHUbM
 TSPDfOJYkY/FLmaaBNWWnxTk/N7Gkn2vlEbYFHpUJgGd39fug8ChDp5HuMKsNCQq3Qx17gcNAmG
 znBGKrTiCt4cRg8xLujwrP0RKF9c/r77BJ/LEaY1pykdNaQMxzer1wwvBE2RuUVHFcZqx6wNK3F
 uOnTvwgUcJ+Jz1exsh8zyFC5JU0tk2Abi24YQU6AyQneXYZZdIXIgrb3o2fImP7pD/040dwF24L
 fGoWe2YANEzasWc1oK0XToI2odLeDrflOeKp+INc6L/LLM8ZRlsMGe4ti1I5Exr3pPX6N5FjL13
 MXAxTMVfaELPRLQRsU+To0LqT2rgZ4XVtkvn2oVdHrRYGfPrJK2h6iJhuzqRWJ6Nh1p3ZJNj+bQ
 xsC+M3Dvg275msAPkbnRv/6po9ynrp/uSJJ68QacRVBZEU5XBqWn+PmVNzktzlWY56XJRUGrUdA
 FRLjydsitY4+rOMKq9A==
X-Proofpoint-GUID: Cc-SP8CKpl-5MMTDVY1_3HNuYwjCZbqw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA3OCBTYWx0ZWRfX8gV53ExtMU4H
 sd+RpQgquhV1MI0KK+lavcMRMpPHO6BNHwTu0BICLcVAfyfMjK3DwBA+5/84i9GMUIqMvrFdnJE
 TIzlH4ADzwSKiM47jp8x3wTNfWGx9mM=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a92a21e cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=SUKUb0CtNzGe3DbvoegA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290078

> >> Srini, could you please confirm if adding QAIF DAIs to
> >> qcom,q6dsp-lpass-ports.h is acceptable given that it increases
> >> LPASS_MAX_PORT by 56 (from 149 to 205), which indirectly grows
> >> multiple arrays sized by AFE_PORT_MAX and APM_PORT_MAX in other
> >
> > BTW, the dai ids are already added by Prasad
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h?h=next-20260827#n240
> >
> >
> > You should use them.
>
> Correction, he only added QAIF clk ids, not the dai ids, Not sure why
> dai ids are missing.
>
> That also raises question on how did Prasad test it without the QAIF dai
> ids.
These IDs appear to have been introduced for QAIF interface clock
support in PRM SPF for DSP solution. Starting with HAWI, QAIF has been
in use.
>
>
> --srini
> >
> > to your question about increase in size, yes, this is know issue, i have
> > some changes to send which will remove the need of this static array
> > which should fix the concerns.
> >
> > But for now all the hardware dai ids for qualcomm SoCs should be in a
> > single place irrespective of dsp or non dsp solution.
> >
Understood. I will add QAIF DAI IDs in qcom,q6dsp-lpass-ports.h in the
next version.
-Harendra
