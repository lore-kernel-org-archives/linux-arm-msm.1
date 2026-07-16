Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FE333BBB1
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 03:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784170807; cv=none; b=MIcxENmxLKXyl/OyUx/b24/772TSSlKjEzyQuYJoZtCXC5nuNydR8fCuaa5tnq3nyC8j6n33OzCh5ZhoA5aEsTkybhZJaYaO1DGyikyy8+MJ0M137WBeEZUZoXGBTIe/B+BxWbfaOMYzUYYyn6c/0qghoJwYuO7m/W9UTF4L+q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784170807; c=relaxed/simple;
	bh=xXS328NenWYdWrVxSjmVOn+66dLmS7vGg6SlIgkpuh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=se8UE6Pha6m6wBOseaalVTJK55mA2ZTU02Yh91iaoZ4mwYlvStJ06BGM+IJsFM2oIZxSv8hLkBrRhNabz5lM+6RprTAPrXbytu9l8PG0G/78XiUEQFiaHo52xnx1mil5iQea3KtFXLHG3b1eAgy3V2tyvgm0Mpw3znP93Jd5vec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+s2EVqL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M0rx0EWQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+s2EVqL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M0rx0EWQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G0XdeB1242832
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 03:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xXS328NenWYdWrVxSjmVOn+66dLmS7vGg6SlIgkpuh4=; b=a+s2EVqLXf9v6Fdn
	9NQE/H5sHVS3yfE5C7hFH5wdv+geYr5SerZ9X8sy2qefOLLsJpezdCkXtdwt7dIy
	oyoj3TWGTcPlBgC6w0sfm1uVz3YhECQFPCVuBDxGq6EEqxWemnuZxAUB438YDMmW
	aoRGQJFqjnhjL3ekE2H6JHioTahXEFBTeG52Dld19of6DZtyE/39uZSKLP5xOmac
	OoSJDcncz6Ur6GzcnyjesZhWBz9xjpAQ2HSdh09aVqIEbpaEMbM/bl8RfdFwo5JY
	vN9OChJjomPWSjL2+4RWsIAfp4O6e/whRhCPV3oxi1L2ttb99foapYmjzUW3nJE0
	JMtuBg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7nmkptc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 03:00:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so9575240a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 20:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784170804; x=1784775604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xXS328NenWYdWrVxSjmVOn+66dLmS7vGg6SlIgkpuh4=;
        b=M0rx0EWQOpTxguDb3LvZjSqfbwSRN+zjeUhwPWdmwTeMvjB0yXFffOmOzpSwV2RBgd
         mnH34xlhvBbX8mHoYb7Z7U93NZbhGEDiogZ0i1Ci/wOvyzM+qJvbg8Hw0EF09Guz1XGy
         bmfsp4kIlAGeZsKCS/e5pz9SFC/uoOa/x232n+LMY5HOT7qrt4TguBBuUqR0XIhBpN7v
         Oqo6d1WhaXKlgFXOKcdpK8YGD5vA5khPjMyObAvVvxjx6DDCrBPOie2+kRIufu5XL0xW
         np1WCv7MltKpuhuBDw437A535hoqo/+5HRCaFO/ROWbQzKr5MJlfycm8w/Ij6gLt57zj
         vMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784170804; x=1784775604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXS328NenWYdWrVxSjmVOn+66dLmS7vGg6SlIgkpuh4=;
        b=rIelgXh/kUUx9pdx+8y7PIZZLKPN9zdjYI/WIBh+ACOD0jBrDPl7tSCs6tSDjyLXmR
         U7XWqgbrSib4BMLvQdsxyrA5Spp0PqNRwp5xzEiCH+7s3890NN21rVTZ5J0mKP3QZUGg
         JnG2i/rcorpu0B6bINX6QXNimiCTuMyv1671urQbJEhW4gNUJCXaEFywnrk1zY1/qweb
         0PMtBew5NrLezTLdG/CrbRc/gwVywahA/vR10+JNF/8hTgJ/fQLkT48w3QE1EaxQ1xi5
         eXn1F2JK3EG+9pTR9+PC8hHiuBV7Uiws8Q8/qJX5cJUmohYZjdjedvLnGr3EjxuXHn8q
         zH4g==
X-Forwarded-Encrypted: i=1; AHgh+RoAp5x+y6f5Rh55vxoxfBE5vA7ciUTgtRdbxQKTDre2BFURZp6yQ9+lJsr79xK5yEIz5cgBUH+IRz+Cwapn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnio7N4GC0jdzXebSiHPSxHqakEoZHa0w4gvGXZy9SPhNouR2G
	RUUy9t0d6zL5xTId0P6a0DTWhcaur56+6epP/A7dW0sCGBi3Okw5yvNQVFb0Nc+vebq6ifRUx1Q
	LaLguHbw9UJrDoBCvlhQtvgWKA1V0TVV5pCG2zlf2KjjxDKVBdKyRWKkfBaes7b0ukU6w
X-Gm-Gg: AfdE7cl0tjRVC3omh9voBb/59y637BuuZj2PLWprVUT2Ud+DUPNslIURCwwGwfZhhhg
	8OtZo3K/aTAUOI8JNaqUcvookEmwrIbECHY+9QNd2Dh2O7v8JaHuVOxhOWvirqBf+/fD6zQ2suE
	iOB83d4RjdRmueLcBbpEDlOR8XBigsuZhCy9TTXo8IJaYL3jAEE5+bbdNStYm8rShNr7arCd8uS
	3IAotfNZTxh1JzhONZVKSna6cUUud4OFN+s2xtZ8S3JNQNG7vLNnMOwRESdgnPzlC0IYy+2D+r3
	sjSBf5Cv8uwSns0z98cRr35kNeudM0e13o906jbMbLeudKqleThEn222MwkBIsmTYqR5UKy/YzX
	i4MbRme+GztW7LetjCoY67iw30qD/HdgP
X-Received: by 2002:a05:6a20:6a09:b0:3c0:9c19:65a4 with SMTP id adf61e73a8af0-3c36c465036mr5496349637.76.1784170803878;
        Wed, 15 Jul 2026 20:00:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a09:b0:3c0:9c19:65a4 with SMTP id adf61e73a8af0-3c36c465036mr5496321637.76.1784170803467;
        Wed, 15 Jul 2026 20:00:03 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd4359166sm5611519c88.14.2026.07.15.19.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 20:00:02 -0700 (PDT)
Message-ID: <205236d6-6d0f-b88d-99fd-b03decba6fa6@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 08:29:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 11/14] media: iris: Add hooks for pixel and non-pixel
 context banks
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Daniel J Blueman <daniel@quora.org>
References: <20260715-glymur-v9-0-8cf2cbe12a07@oss.qualcomm.com>
 <5bXXsqVEXaFsaBMxPP6AkG6XZFXCBP5B8YfjHjhTXuqrGd-XmP2eWPhNhH3LWxKQ_PWHTbdgIRh9AvROtnEHog==@protonmail.internalid>
 <20260715-glymur-v9-11-8cf2cbe12a07@oss.qualcomm.com>
 <65e09849-a27c-4d6c-9afe-934f08f802ed@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <65e09849-a27c-4d6c-9afe-934f08f802ed@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAyOCBTYWx0ZWRfX/5dhEjEeg/fH
 hOYIZkus6onAUKkYPkqXuWN6+cMquKDRFts4qAd8Ilgo99GkA6TT+veaYdwbtWm3f0z6dQNDPtV
 45SVB84iRwlaQvsj54qMJNH6o2bZICw=
X-Authority-Analysis: v=2.4 cv=cuGrVV4i c=1 sm=1 tr=0 ts=6a584934 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=wOmbOZ9kRXkywvreR9UA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 4m2fyjX3UEBKzbg89Yjce8MuKxOQTizV
X-Proofpoint-GUID: 4m2fyjX3UEBKzbg89Yjce8MuKxOQTizV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAyOCBTYWx0ZWRfX177tm+Kv5B+K
 vvpTdGf7f+Lg+Xp8WB2QUbPzPdOQfPUgFlkg+2vC66c0kv3QdHu/BCJK9iUIFpuF93VexWuTTPl
 qkLz8Zl4suE924AOnpFV3e0kp6oL+Ghw8nVQRtglYYzdB/v9FbKdHuhjRWeSlzxStgrerbcNK/y
 3scECJDQ4lQGYBPgKdZhxlc9yv5YUgY8rN0cMHat2G/OpWqsEyxgYb/SrHQM48OrWbGvZbyPkPD
 xgWkTFgnSbI1f/tyO0bdPpzhQibIyRxglsqHGyN/8Rx/AsHqhBrb/J9HGBnEOii2XEWLbquz3xM
 GY1j0XmGFzZR6gr4nuJ5MS2ddUea4JPQiJffCZm5lUrwqZAJNq5CTSDA2T58hdt8u8s17Y/nXMy
 vmm2njvdp8mTVKVyfOY94qwNqXw/3L+70WlQ5FdcWuop57dB+q3JfKHUtNwFl0Tm3jypvrNvHSj
 XVuHXD1CAqRPfAUfOGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160028


On 7/15/2026 8:57 PM, Bryan O'Donoghue wrote:
> On 15/07/2026 15:10, Vishnu Reddy wrote:
>> Add platform hooks to create and destroy those
>> subdevices, and wire them up for the affected platforms.
>
> All platforms are affected no ?
>

Agreed, it's applicable to all platforms. Will update commit description.

Thanks,
Vishnu Reddy.

> ---
> bod
