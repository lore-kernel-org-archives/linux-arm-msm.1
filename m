Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1C4470EB8
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785328057; cv=none; b=OYNSMu+fhf1KDXfVLtaJBWLVsH8O4JQwMchuZQD/4Hq+gs+FGaK1LmDVZUHcNu0wGRrNt7xK8539V9u7yMm3i4pYyaie15JcD3D53qvVptGzog37I4NSjDhTDW2JKE7VR/Wb3U2dK7uupq/dEICFSNFJ/MYsgOmCtaCgg+yoMdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785328057; c=relaxed/simple;
	bh=11U0eh099CIjz5u00EVDCiljAQ+xRrN0Sycpjzjt+iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aYkPNO/Sur3dUiyxGYsMvhBNcdQZq5FJ5yhrZl5DJ57j9qQRnQUkT9iVcs5X5twLs5fUPXGCoBdmCNfcTGFADpxwM7tlz0xMuCiGFJENh38wXuvrH4tUNJLfC4TiV54MKFH+WHJsN8et2IE28Lsf0Gt66yyO6H4a1nmABxIN1d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhC0ftXt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O8zcBIRv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhC0ftXt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O8zcBIRv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TCIhW51728102
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11U0eh099CIjz5u00EVDCiljAQ+xRrN0Sycpjzjt+iI=; b=HhC0ftXt/2sFAJoh
	f16z6IgOsVoqgQlu9qYFj3//Dr56OhMSfnUAmtw0ipVum/cOFEX9t9bcYPsggQfM
	IdLo3RykRhvB/VZxzNSlJ9cCXe/jwWejmibfIa0klZZdUCf/oUWnvSImZlc8bKTR
	8FLb/p18FmC2UgWPyHZ+gQY7H51qHOjR+9qiluclOv1pksEzztr8ExjL7tdxtF5J
	FYK5Orlel0kF8seh34DvhEFbfboR9kaOqvPj/5VVBhFIpdr54YW67jVUGAILsvSV
	e4hEvEK+T2MepdJOBkjltSZ6LIQ52AcJiseXqAlIHLM3wV4+sQ0Tg1+wr/nA2JOU
	VOISyQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhdp815r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:27:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ca37ce4c3so1919381cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 05:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785328055; x=1785932855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11U0eh099CIjz5u00EVDCiljAQ+xRrN0Sycpjzjt+iI=;
        b=O8zcBIRvjQcvQUBC0OxG5B01z1D8pTTI5wRpTSG17TBFrlVEy+SpDoFRQgfY42fsJo
         6KPJiASgwCa8HmYSIBSxlbIthWWgvmDxVJX54mGX942Xzk+/X49D2lVnEI46gT7J7hMz
         NPp9YQD4rQebUDibjQMQRLvK602jlCy/DW4ktF58bvKaCzQzqEvntDHuXi9d2EFQhKqG
         MFQPG253fs+MIefndCdeeh6WzW2rH40GTaFuetwD97b2gayBwcLAmTeWqSJng/EfhBpE
         xxNk17IHsFmZdtnKwgCqXojqvdorMl7GJSXkZItHsbccG3vemG9EkgsLTYVDVRuBnq+a
         wYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785328055; x=1785932855;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11U0eh099CIjz5u00EVDCiljAQ+xRrN0Sycpjzjt+iI=;
        b=EoVXHPD1Wq01gjzWhFcnJlwsf63+9FIee4mgD4qcLn5CQkoyG0tiuMitQ1ZFj/O7Nq
         glGtIHVCv+KHXE7EexjVKh+q248iMrKO6vD2SF1/G9utsIs6sFIFJwyhe344T6fjbInw
         vuK+k7TdUHiL8S9ZZX8Xcafe1xhOb8LVEsufdRKf9zFlSrpydWTCJVxcERz+p/hmwAH/
         DcZ8ItpiCT1y1Uf/KmzQ5Ozi14n98xJiXUoZdPu/xNoTHetseBxb87ibt/m1iGSRPsk4
         BrsQx7ImP1KRSFnAg8U5B8vHfNgCe4iEtyc+/RvFBHsMpep56Slbkxu6TLipPLCFGH/F
         NUZg==
X-Forwarded-Encrypted: i=1; AHgh+Rp47dafsPaYLtezJp2aMUtkakV1jIquwaqhfxutKLnTkttXKCuPS0to+aKLetnLkiRV19I1sk9Qa4OTv8qT@vger.kernel.org
X-Gm-Message-State: AOJu0YxkOMzeDzFI1kF0UZl+cqcZAXH8YRj3Hhi0Ogi3v9JoGEXimWRg
	L5MUurYoCB0yP+HHuiSWIrP5fbirbYo35/E1s1icr6NsfoI5Ca5JACux5V7r1+4UEpSP+8zqXPW
	OWK/57IrDa/DVthSjoX9uSPCyzMt9+Bw7DXDl47EDbu0tBy9mwBgGFFT+ROjMimZeXi0t
X-Gm-Gg: AR+sD11bKMah/VOpXnMvmrx4ne5hqO+7DQXgXeMoeTBnLtzqD7wDcrVup9IJfZtoVzk
	20k5/BFBeOXpg3pfL5c7fASUgUcz4tGsnZAYTsp6XLqlDNhjFTWF8ZB3aeE+p+WIpGzsGHwwvle
	6GAO1GItN+kixYo6AZIjkRnJQEcRJc+RtbGj8JAatDk7w/TeIc4RQf/5N7mVwxDRGbJ45RZr02y
	zGmFJL2pfAZrzPYfdX1qSm53h8x/i2pPLYyCAgEZ/yxCmcJZMHr54QfeSfrqPPqTQG6JyqVFIku
	ZCDurr8PvEYZog7IKfjUslAe4jrOwLBObcqQ8d3F84aGEY5KeKB1ig2yFEs9UFMg9mK1pZewgnO
	TGfU0HuBHrobh0WMO2X97VqBf
X-Received: by 2002:a05:622a:1aa5:b0:51c:2101:f0 with SMTP id d75a77b69052e-529d6f89194mr58332901cf.2.1785328054654;
        Wed, 29 Jul 2026 05:27:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:51c:2101:f0 with SMTP id d75a77b69052e-529d6f89194mr58332371cf.2.1785328054027;
        Wed, 29 Jul 2026 05:27:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83fe70d0sm104914666b.53.2026.07.29.05.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 05:27:33 -0700 (PDT)
Message-ID: <a787149c-bcbc-4cd9-8365-2010b135ce80@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:27:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] media: iris: add support for purwa platform
To: David Sheffield <producer456@gmail.com>, wangao.wang@oss.qualcomm.com
Cc: bryan.odonoghue@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <CAOAE-oNM-AS35-k=ntkLX8H35UF6_6AhMTP_10C=RroA2_AvsQ@mail.gmail.com>
 <be2fb404-061d-4e69-b430-9cecea21f60f@oss.qualcomm.com>
 <CAOAE-oPAqmyjwow_Dethrmy8NsbG4Hi6CqXLzM6=Tjajc9eqaQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAOAE-oPAqmyjwow_Dethrmy8NsbG4Hi6CqXLzM6=Tjajc9eqaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: i9iAE3avjzzS67QBz3hU9nb8QHZX4wf2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMyBTYWx0ZWRfX3YkOZaG71O2s
 WZkV70Mg46u0SoSCcMkcy7OJsALQ8wp8jGImrGoE7CyKG1/fu4dGvl4pWMHlCj+Za+Yc0T+sjst
 XPYE8zblgJRWF9tgT4zUuZ+k0KpYm5I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMyBTYWx0ZWRfXzwbQOWMTZCrE
 WCa8AzZ3DYUtfgCLVUo0kUhNUAC9WXcv8jXjnslVzXTT4LWrB2/aeUWJWKB+Iw1UraLRlelUm18
 yM3kG2TVq9uMcqnr83hg7AMlNoKDmSQJ4DG/NGHEYcx/UW8Pm61JCQUE3Qd5caPO5/uwi1CBdga
 HmL5mkrpe+vwVDopxaiwTP7ke+8KZhvuDe95FetLuPvBQj+A4OVMkIxmqRETqWXaB6prhZ6USdd
 mN1LcnqTP4N3PDAbi0XUyLm2YwHvI5QSccQuJKFfAPCLRX2tunDUSPiovjVLLyP9O5tIt07Cg2s
 KPUZQ+Hkzv2nq0XHM7O5KzNRuggIYbhobn1v9/Br3r1GBxHYadvQqcMU0F4KlbT/uUwyTDcpoOp
 V0TOus3AL6pbUyRt26VJ6J0SI2LIxuGokmZSeXNwDS1rdDr9n4g3p7Gjhk2/lpaEIr92DVC6EoZ
 CMeQgUiVBOo3UYMIaSQ==
X-Proofpoint-ORIG-GUID: i9iAE3avjzzS67QBz3hU9nb8QHZX4wf2
X-Authority-Analysis: v=2.4 cv=TPF1jVla c=1 sm=1 tr=0 ts=6a69f1b7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Mhdb-L9lliOisUUO3ZwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290103

On 7/27/26 11:52 PM, David Sheffield wrote:
> On 7/27/26, Konrad Dybcio wrote:

[...]

> Given Windows runs video decode on this same device with these same
> images, the metadata is evidently one this TZ can accept, which seems to
> leave a purwa-specific policy difference on the Linux boot path. That
> loops back to my original question: has this series been run on
> production-fused purwa hardware, or only on CRD/development devices? I'm
> happy to test patches or add instrumentation on this machine.

FWIW I have no insight into that effort, but to reiterate, if the secure
side rejects the image, that's not related to what's using it (i.e. if
there's anything wrong with the driver support, that's totally a separate
issue that you may only hit after the fw loader is made happy).

There have been recent changes to the fw loading scaffolding (introducing
an alternative backend to scm), so I'm not ruling out something went wrong
there. But that would break loading on *all* devices, not just production
ones. Unless there's some memory corruption somewhere that makes the
checksums not right..

FWIW I'm running linux-next/master + a couple of unrelated-to-fw-loading
patches on another production machine (glymur-based) and the various
firmwares (incl. for Iris) load just fine

Konrad
