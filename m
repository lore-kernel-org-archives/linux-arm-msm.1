Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF40486416
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 13:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790256238; cv=none; b=ZbHvz43YOit8vVFGALdZi9upBZHXCvKnrDqCr3WvYdci3tJTm59mcCM9Ks0lGaiLUJpwsGcZciIGMhYlTAO1PYLb/kAJvuJm5AsBJgTzB83rowBNlfB1uHIPLN9e8Trxbuyp2QzlWes8QJuGEq4N3hhvHv9uaVV+hPYK8QoyYrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790256238; c=relaxed/simple;
	bh=QQy5B36lU1X5v9eQWk5be9ZcLvThEHoip2L8mmPKWys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XfvZ56bDssIxJazFRHBPT+qLEbQjWavTjEYIU+ra0FZMqBJk0LgOjig7MaO7469deFQ/nOGwDde5xb03ASrdy6JAnPQmPUOwOZrX1gjSqyrBW/8lEKfgwnOlkb/HAzNYGMOXQj9NZ0b9Ha8rdeDuPsC0aRNDSwyd77kqFfRhP6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SRK8wSwG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jmX6MPlB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SRK8wSwG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jmX6MPlB"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4lJA2385827
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 13:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iTfiqMKgpe/SdIDwUiMICvSbmpu0rp/xu4YDBLENRUQ=; b=SRK8wSwGlqXbZqtB
	KPcdW2oYhDIhiV5ufq/o9bWhM1eJbYN9uBD7oeHWEBN6nRCHYrjxmwTmuf4CwoPO
	U19jMxUwAiTVw8454KzQU24L8h6gkCRwuv2UcyrawCTSossOCL/UprHO1MuuWSrE
	ceSQVCBYYj4Zoo9/KXKBD1u5iydXCOwW389af3Kr4BvHT+sTmNNUbcTtHtTLR77R
	vPcBemKAmZibb37N21800aPUglLfEPns2YIgiK26robp4H7FtTWmsxKEVVF8aMco
	sE3xrEtrKeHj/y1bQx7LYRjTZO+qPCkxj0re5yWSNkHY2Drq7forz90wCFnQbiLk
	2OZN1Q==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgtp10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 13:23:44 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7a9378b844dso623238137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 06:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790256219; x=1790861019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTfiqMKgpe/SdIDwUiMICvSbmpu0rp/xu4YDBLENRUQ=;
        b=jmX6MPlBYFbgSnslMFj29MJw7idbuC72k1uWXTOuFOEpqXCWREwYxQBoabnHbPJ/p3
         5fVqvsxkw0E61Seo0HsbwCEH+XMc8/kvlpDoN4xWIq0ImorGYCykdJovXIv++RLoAkjF
         vt56BlSRzx36C/t4UU5T6XG1LKdPrvzVJZZaGfs5j0hB6bXRE043HFTgOnnZZz9EGyct
         Qu+C2cAOw3QRzPJcLCKsMDUiQatSWbodjHSfYaIcNeIz07Xx35anobL2NgJsagoiofdh
         pmKyqikLu73DNm4BlJSwTK7bK+jtTxUDbU+9YHCyduHSAa+ovsldT3KNFEBLvcfYYoQR
         UE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790256219; x=1790861019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTfiqMKgpe/SdIDwUiMICvSbmpu0rp/xu4YDBLENRUQ=;
        b=xXZwGuSxt4RYBQVVKKNHtLBJjxxP/Nt0f50EM0/OK1vQ+JxB30/vCq7RLui3QnS0tB
         +0nvJHLqaJrAFvQV/gZXv1/vfW5Br2SKmepIvtHxKmUIkTcMIjqYDxDfMIEynfQXOwCd
         JlGv5HBBACysS10KRv7vtNJ2WFJoPvxlRlwnYjXT3tsMbrQ8vVW2EgsSb1jn6IxYiHTh
         5EQ8KlBR0tfZ6n+Fie3Z2rNNBr5fK/iyLPjm/x0PXvMc6nj2JFNCMVvkEsjQ8BLQmByC
         eOLVbh9ma116rgHjzqMBtvYTfIIYomEQKf9jscND092P/CeWo95OnQo35VahZ1ZIn9Ns
         GjlA==
X-Forwarded-Encrypted: i=1; AKwUvBynb4cEmPBZWw5ijkPu38lJIEScoqIVznvgRa0RVzXNLNH6ApmMAn7I4ELr8CDWq6UnsA73+99d3qtcKE5D@vger.kernel.org
X-Gm-Message-State: AFuF++n1u5Kf8zaYZBjl6OegicfNux5hKXU7TyFNpcSvpL0FedDgQjw3
	8GF5PglluWA7fOunr7U6qZm0u1TSRIsEhMDhaO0pLNQs3F08hgq7QkF5Bslmj0ysk4GpEpAfSBj
	FCMLlEMmZLy858gdrJsZVmwZykGXiyff0IJ80rwvwko3jqhcJwIIW1TuW5gQh9G0vtXphH5glVh
	zc
X-Gm-Gg: AYBFou0Br3BFp+knWctSlrwEY4u2MQgRI2afCxbtQrkjng1itg8+kNFTuQPHnLXWdDo
	4q7rJoA87oIG1XUlypYHDo7Nxgq9SA/9kvg+YeWc19izDEXxe5RfHgPzorAmsCo7GaDDO+kMDQz
	PK5AhLZLt3NhYI/rJfEcgN22u2bRlxaxtar6Y5q8OP6qe1r7bx7hAzq+aszn9RQgbsAHA7HqDF3
	nD/fhzHxO+JfjTZVDQprA+i9ZLfnR/XbroC2lTPrQfQ9t1yqzE1DXnXOCx7fZzEnrbxQxXwiQ6R
	830i1QSnAvyLnf3bxyvSfe5tKQDcH/8nEqs3L7F8CMiC2/54u9zwSqOv2SPRlYHr3oZytrM0ir1
	2pNZfY7fA0X7OKqGYc1XP3aCN37/0OxOFNWpkbFgUsTMKqiOTxp+dm8/h
X-Received: by 2002:a05:6102:3913:b0:7a1:f980:e932 with SMTP id ada2fe7eead31-7af1cba300fmr1048823137.14.1790256219151;
        Thu, 24 Sep 2026 06:23:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3913:b0:7a1:f980:e932 with SMTP id ada2fe7eead31-7af1cba300fmr1048810137.14.1790256218594;
        Thu, 24 Sep 2026 06:23:38 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:31:4ba7:4aae:40b2? ([2a05:6e02:1041:c10:31:4ba7:4aae:40b2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4c8dsm88794545e9.3.2026.09.24.06.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:23:37 -0700 (PDT)
Message-ID: <3b4b7e2d-8f0e-49bf-a456-d14d8a0f7b76@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:23:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm SPMI PMIC Thermal
 Monitor ADC5 Gen
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260924130659.8841-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260924130659.8841-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab52460 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=j3MtvZii-MdXzgGxfbUA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: lBE6G6KpC9VWzG75KkEypSkqziQbIyPl
X-Proofpoint-GUID: lBE6G6KpC9VWzG75KkEypSkqziQbIyPl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1NSBTYWx0ZWRfXx8DSrJGNHikM
 MaQJbhSIRs599BEm3aGYmjqTGhsHnt6+FezC4LtJvjW32nXoXsGyVfYKfteB3pxFw3alyZoBmH+
 EGSe4EYavV6m4K19YAGYfVRvfGupO5M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1NSBTYWx0ZWRfX1i3o9Vi3/nIX
 yUXnHapFxzmdO8drMDjUniXd2C36eQgUS1/63/LKyhQ4jwYvnuu6EeeclUaqufB2Ulj3nHdIMP8
 5yJGaynrpDp2dn+uDKab3BdYPo9voLzTCvOS+6l36Gv64vPImCqAMZxK5d1HWgsINYI8Q6rJgG6
 pvL/uafaxqCFSanaBymDgpE1Ri7DtjiTfISQ/Zfwq078yqA1V5HJwJfa/JZMS/MaVWMjGUapL4Z
 FdN0u+SD9Wf5w7EA5+gMt9M6crpyldHgZgHarW+PxQT51RIW18lDi6ulAs24RQlPITP7c+PgJvt
 8smyWlPeb7HhkBV2wd2FMHB9EGi2AY0iUeprC9KMC+l/AIfGNE8AK9i9tqVbI/9ZXBFRl1zdTy4
 U3IQoHD+tSlRdXqi+s0AczhzCDClgiG5dmhaUe64ZkrhoM3pY0MBWHW9PIsPgCpaN5GzQACLsOW
 i0HzKlxKqr3gHeS9iNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240055

On 9/24/26 15:06, Hans de Goede wrote:
> Enable Qualcomm SPMI PMIC Thermal Monitor ADC5 Gen driver, this is
> necessary for thermal management on Hamoa laptops.
> 
> Suggested-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
Thanks for sending the change

Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
