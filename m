Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0212746D09B
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 07:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249437; cv=pass; b=K447vg/eINb6CwT87r7aNuN0CWh1uneCoWMHxlx2ITpH6VE42ev2AQuW97eNcofzrKi4w3P2repZdkAsyc8njOo9633couh616nU3Z3nzwhx71/Xra5T8f0EH9CBiNBtizOQoO8ZLZeovuvUSCULtQY+zmeedGpndNGYvM9EEgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249437; c=relaxed/simple;
	bh=MT95TXLpS8p3pbuJaaLjnBJ6LWQyjI3YRFCLnSR0/wE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lnEXYEBR5Zcm23dVbNNVes/naG4FH2hqZsTG5yO8dTJ8SgrqKpmfik14v8rDJFYGfAvRNPfwd1+A6Qk3T6pYaT10Xfn5O6Gu2uOBkgRy1XIoXh7/I7HaOua1OiiwSSfYGOEeNUUlyMi/fmNV6spAv+O4TcT78FOMQd8AFdSrxYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/CG5LUp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZdSLXFb; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/CG5LUp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZdSLXFb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Ceb2061551
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 07:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MT95TXLpS8p3pbuJaaLjnBJ6
	LWQyjI3YRFCLnSR0/wE=; b=U/CG5LUpyU0Id0Nz9vRevwpMevriHtEySFK1ORO3
	sx1h1N76x4h10pA5D5hXi03IXLlyi3qinBsusTM3sYkwAEFUXKpae/ONh3zCqByD
	Sigc/ZtOKmdIsr9CPj84TduPSi3LFIjTUIDD5SgAe7i8gjj90IAXT2UzQ5riHHgo
	ZUYpaTJk+IQEe5+OHinLsFlyzS3q+AHacYjfFMahzYF9O0lb+w7SNiaGIm9DrMTs
	NUHFhs1PU8aeivtjpi60tFokifv7DgPAHmVWn/Awy7ViKzza5++rffdy1TzFK7WS
	LL+j7O/8mrw+ljJDTF1MhoohgdOrwuoBbf9UwQIsMDKnvA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh0v9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:57:14 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8577f8ec68fso73991007b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 00:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788249434; cv=none;
        d=google.com; s=arc-20260327;
        b=hXATA8yujh5y62SktLnS1vkpi43pAQeEavNAEdqly8o6gJmAs1H3uU76eyI7i2n7gD
         CeUyLczFSUpLtJa40CDOT7eReaabYYi/jaO8usdQOI2qcl5WFaWr016pNHCxBWYvISJd
         j55BNA3294Z3maocjp+wJiItB94AsVIn4S9ZhWN58dutt9wH0Nc4VzpxUCdsOdmvZqBZ
         i1u5AkzHSOOj1L3Ect13XOPVct9Y+5cgcvjszCVa1RomIC71iJuiaufisljNsDm7aZhK
         da0tbAnqfyo6VZZPAQ8A6+ex7/Hmnpc3aWmUGlBgE7J4IQuJYy9qsw2bMV6BBs/kBGAs
         aeow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MT95TXLpS8p3pbuJaaLjnBJ6LWQyjI3YRFCLnSR0/wE=;
        fh=9t346lAZrza68h5RlhTYr84cmAZJlOGa0LbLeOkBZC0=;
        b=V9KiKpJF0pup9a8D1sjdizNmKDFDF1vW6Jb/p6TXzE/ReqRwUBWpt8wtdaHj5fLSuS
         SDWmz+0BuLMaC3C0nWHazwevew6RnLdmem2OqQKxLPPj+mn9Zapsi037ukWE5Kd//RGa
         xgldJ4Xm9sNyvyRW9RfOS5PfafK9NKSgTmyMnWxO/vI3i0wgoHTA4YQJ3rIt4Qv8vaSd
         mSgYM2dCrJwCJ9OPVJWyJ9g/rY45IiMxuLm0O/OXyb10FUMeJye5xq3ADj6I7gNz1hbi
         75z2e6VOnAsB5kc1LSeBKPlit6lxVW3+p0xKxOor3p7n2nnciVFTPpYgdfzemz3MdfU3
         NcaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788249434; x=1788854234; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MT95TXLpS8p3pbuJaaLjnBJ6LWQyjI3YRFCLnSR0/wE=;
        b=FZdSLXFb/2APXS386Urmt0wQNBMp1BEGbJLT0ZVmmpMcJ6a0RLUZh9k+xJYh2KGGB1
         o5TaKxMdcxeJuUwtQDQ5dkVV4diBKlpyz3/uUAg8uuS3JLlNOsJpK4EuZ6nfEQUvIwV4
         Cng5a1S+3+paNOv2HDcYFQMekV7/EOSeP3XQyxewEWGiDyFVsH56sDT4H4fhht1FZErC
         CUodnbCQntmkfD9QcpVOjiSN8FC75kWoQPOqOa0w0G589xElwNv3u2xOOX/kVw9Ni7Im
         D/gDjTBWGq6hUX/7lIVgKPRyrQoqy4rJxsELm6Orc5n134mwjYr0+HV9vQwgMp0HXUxg
         19aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249434; x=1788854234;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MT95TXLpS8p3pbuJaaLjnBJ6LWQyjI3YRFCLnSR0/wE=;
        b=PyIRIASbDVO8dsQ91KPl35YIMSCc4Vr107O1OyWWdzf+W/UDzYOBdXbjSsEOhRSCfW
         oFLctOzQYojryR3XsuNEJbRrgL3JgevWLBG9vGMfrs8A1E+rbNqlFW4zXcgjad5iKw41
         YMX4BMQrjcv11XV+xXqsnU9XUdoPoBet0akmlmmyeJCy/StC+k42kvsZ0KqyCFpWGcXq
         Bfr8/sCHToXPR+x3qzZphwpNug7GtyHl7gm6n559I7G7fCRtn6dtTvuRFG9hHpixFKoL
         Y0ZbSqGapE2FIhBMfNIll5982jm0WeUfeJdr7pRdqfe7K4AENuptP9idpsCcw47Y66GR
         x6RQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/OkN+l0uMyYY+Z9+ac5BedcJ1jHz79RW20RoHuXXrCUgJypdwKnINJLJQP3g0zJ6D1/pCmTo0f/REUBVd@vger.kernel.org
X-Gm-Message-State: AFuF++n3rfxpaz75oMmJFJXzUSCWmIfRDdEjctW5dqOzLsxxYD9VXaR9
	2xoRdbEbwkVcrLygwgNV/T2f2w9EB8oe3FEd61evbMXdveBUdGki7u3BlGvMq+WD99UzaOsrDr/
	2iNfmE5txVW/yRIUxJkmjg3kzkOP6Kdo4Mf5Esk9HWsZ8BnCsyHnN51n+4+xh9ZVC6ZIaFTna13
	XJmp1HCw1D3CkUXL+7AYSQPXLzUxtkU5gjM3mVKehGRPI=
X-Gm-Gg: AYBFou2qSCpYr9GywaIvATNl0SxjLbjJ1iZZ+EhlaVbrF19MQzY8Ob1h3RNQL3tRx4S
	q6VSV1SlkGwIAbsCHMqPVhwtbgV8+FO9n5+b8TFSuzHn7DY17JNp2oPF83woWq8RfakVqu4sAh3
	kmCkxEB/AbMZut2SDsJTqSnd09Ll0tsrY7pI6+V7se4jj5pqW8xUUNWKPHFA==
X-Received: by 2002:a53:d081:0:b0:66c:d803:b45 with SMTP id 956f58d0204a3-66e4c728865mr7583298d50.25.1788249434556;
        Tue, 01 Sep 2026 00:57:14 -0700 (PDT)
X-Received: by 2002:a53:d081:0:b0:66c:d803:b45 with SMTP id
 956f58d0204a3-66e4c728865mr7583284d50.25.1788249434062; Tue, 01 Sep 2026
 00:57:14 -0700 (PDT)
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
 <19a8ee86-81eb-48f7-afdf-7bf5eecb8629@oss.qualcomm.com>
In-Reply-To: <19a8ee86-81eb-48f7-afdf-7bf5eecb8629@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:27:02 +0530
X-Gm-Features: AcwNN1XYMRVqJMDI8M2Ek-7j5XHLY831M1TAKp2IsZzjDOzQlIlkiRN0nFaiwDY
Message-ID: <CAC-tS8AHW=jobjaDnyw3BCo5SXZ3nSzuC1L8vV4aq-zkHuzDyw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MCBTYWx0ZWRfX86q481TrK/hx
 wgcbo69cNrIuqBB3VmgNomW8F4c6FKzC1lHyF9dHzZzeXr42dtn7Y+j8scIVfk6ok77UnCoOWg1
 0jq+DICVgazxtqTE/Hf0XFN5Hov8+TA=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96855a cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=nUbHkpXoBt4ruc41abQA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: kH9Nfzj70lh3FMMsY-0agVFjrKcehRUw
X-Proofpoint-ORIG-GUID: kH9Nfzj70lh3FMMsY-0agVFjrKcehRUw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MCBTYWx0ZWRfX1Wbe3eyXcduT
 pjeIHB5mhDhlRH6HRr7ApRZBP5uRcOWU6bw718wKQXg7LMMG0yaHqATM8qcoD2MkZghrUMXAaVt
 mDphtQNmbjixEq6qJeTrJM7NQviJwjHvEn8IHm8OXx5L9qK+xfqg2l6WSWn3VMlOdwgDgbStDuo
 o1FFkvvGsL5kaGO0uso/Y2v+slNqU4WCXlbZCQCMuVcHAmnydIlW4gAfUs9VS0feXn7t5s16SuN
 sBgUJh4icptf7tyrO3c6A0Sfnzwv648eY/f3GIpiDcu5K5zpM0HMzzCVvVRmyZd17p/RzodIOiT
 S2YqddwVExwrb3YizY5dlFlEQFD0lebhYIeOGdgQWETm0ZAygidx5DHTUnk/Q6lCmpCCvm1L3di
 eGZPFKPkGQ5J0UGSDkr+2plHNZw+/n4zPhTeUcfmjo9/EPRWryRqV+99VlYyUr3PfgQB0dGYgt4
 H8LGlHuCmqdvlaR1mVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010070

>
> @Harendra
> As I understand it, the hardware interface mapping is almost similar between the DSP and CPU solutions,
> May be the no.of interface count be different. Would reusing the existing DAI IDs therefore be sufficient for CPU solution as well?
Existing DAI ID names are tied to LPASS hardware topology and do not
align with QAIF port indexes. New QAIF-specific IDs are needed for
clarity.
-Harendra
