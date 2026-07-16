Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7516432E95
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222105; cv=none; b=mLtcEOX6AfzDu7YZl5AIXeHVTautGuEmr7YxqMIxCtPmiGpZo697uTNTFbkje0tHO4/hwbfzoPGqaEFXn+8LKW6lim469/jyKy0DT2m+DFfkxaUF38vhKP+fC7cxeK1yCzmZmeXj2+1soEG2NhEhrVxeHwcx9VF+WyPTc8V5V3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222105; c=relaxed/simple;
	bh=IzH9dKAWjL5zhJjN5S+5gYaPgx1jmtqrXKu+U7DRhMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MoMtDkERMxGkxp+AlYedoCMMpxyyJgotxrvdjz0qJPeGb5hQ6izh6ZIkmuagZ4CfCD5dvpHQLfQBDraAWcCz6uzB/t79yjy+L5xqxXvxbVYxEa52KUjpnUwOpwp2u/TfyXcrha1TCidrOKJqNlLHIi69+LVTbXE7BFpMJAhPK7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9E1JaYl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fpbuPEPv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9E1JaYl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fpbuPEPv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSlru3481508
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eCSuOl0qpTiHN7PLLWqEAZSElKaYF63jWpG2kIdrh1w=; b=j9E1JaYlmWhs5V6o
	ekfId9XEmJhHMKFAqmBebUmX4BnT07cXPsXhYmZCCRHO8vhpTRPMlR6ndO9owqpi
	YS/6bJlVFEeqEDsuu5kHYELKcU5FYyEkUZlaXTpZDC7KNIX16uQsxsrhegwjnyE/
	aj/KRTEphYcaRS7G2i3mtUQgd3sKhwtw3mK9JjCR5o6brQV73/SV/6D77+SnXZbD
	3E/vDb+dyUhKbwKQ6ZxCPe7S15cUjMXqt1lLt08Krnx/SQhxFweILEVBXToGIjGy
	EHMrbx+HZ15YNt5sb/j3IXmfALj4elJfffU/UN8K67IbSvk1ufrhDSdcIk1RjhxD
	QO3nqQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf2mw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:15:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe75b7dbso17068781cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784222102; x=1784826902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eCSuOl0qpTiHN7PLLWqEAZSElKaYF63jWpG2kIdrh1w=;
        b=fpbuPEPvIrCQDL0KCh+jSxeMMyrSsJInCApOzPVhvzrsRuSqAa/6i2bOvCi65+pKly
         woQj629aJxtKwTNtHY00fQp0z/WI+VuiAzaYSr5C8drO2RsZrx3A90j5Scicns2qyLXR
         fzUwso4SYqX9q8SqzUxZO8Rf+fYZBser1QScnrkA+4oMllgRfCWc/amYmVykPsXpnu9c
         Wofw5JlP+qydReKqfThsiTxxbRWfgu3feuUFNGM1edVCniFT2dxzZM9dMEkLVOH03shV
         Eplxafvd2PNc1USnWn0iHd8r8QBGVKlAvJpgySCEiKfoyfOFGV79Msi29C2ccoKJ3H+C
         NSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222102; x=1784826902;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCSuOl0qpTiHN7PLLWqEAZSElKaYF63jWpG2kIdrh1w=;
        b=a7x0xH7vo+idEXlXRwVd1PNm6qjn3WlOqsiIzFBdMXdD9sAPmEMZRZer+3XB+TbnIr
         0FF02r+8MhGKFjkdhGDOp57h177uUC9VKAa2wXFTw4xDfOgXq6aPZj9H0cmumiTJrW2c
         josM4JClUu2LcS13kesbcpHVRmcB6cLmv2xA5IFf1ikw6xapqpF2bBCcQDeTiMpv9LmA
         VD650d9KwOsM4wB29hozBjZuRrllVbJMnSYlgFsYGeX2fZWzP4Xms8FNyAkXcPyxYkZC
         p56BxvDBXuNeQ/qxoqXnHwcXKRZ2VUdmj+tCWp2DGkzCZG1KNiKBZyGtLnEhBAIooY44
         c0aw==
X-Forwarded-Encrypted: i=1; AHgh+RqwC3XSPD6RlPyCTN4pTofb0TPdfdDwWqSQ+LP0OXJn/lAosMJzRtFSEVsIixyFy3KQhxbmTyXkO3SUPywN@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ7qeiDXy9RXR30HaHFdbjS2tMRCeMYw6tzIaxZLGIfKF908jP
	iXg2aeLONEuwenZKmp1CNIsnoR3XD8J96QNCUdKS3e1KK3Ubmw4xVwKyBdFNZka/Mz7wQVHn13O
	9yr+3sqAlyLtS+5HokecHfI701pjfJL4+3fPuPH7jVyPGTAHSRf3avq3MtrUteAkDipVC
X-Gm-Gg: AfdE7cn1GnyD7k2fhciUqgGNRj8wmxmH7+Gh0MuszbFGqfzgMMRsEABJifkox5fKuUb
	pZCsdEsiSwFqyMuwv/asaEDmPPcZImRsQn8Pftznpr/TLYr8F9SCkWWuRv03yXCY7enBvpRQ91u
	AN349ZG92qfIztS47EEmuN3B3U+sftjM3VMWVeoBVtTQATRaWpl2Ft6f5cH3pOcjbr7vot9zWqB
	/7s78XcYYfyf6pl2pG4ndBdPrTh7dZfs1pwHAUR6uEFaD95YLkXDBYEpAFA+WgdQTC+MSB+v+vF
	TAGr997kWQWpO7rQ8ZGHqQunHttoN5xtwdG5SooynSpd9PpoDx12e/QvOb2cUwi3fz4o+eW3eGI
	N3FeJW1qthabqC09J0/Bkayrq
X-Received: by 2002:ac8:5889:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-51cbf0e84aemr183175391cf.3.1784222102104;
        Thu, 16 Jul 2026 10:15:02 -0700 (PDT)
X-Received: by 2002:ac8:5889:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-51cbf0e84aemr183175181cf.3.1784222101716;
        Thu, 16 Jul 2026 10:15:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16aaee2aa9sm26832166b.39.2026.07.16.10.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:14:59 -0700 (PDT)
Message-ID: <90769e77-c311-4a4f-be37-09065e217f55@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:14:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: Add device tree for Nord Ride
 board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716142605.2398433-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cjyXGiMrUwJDQSzpUHVSuIwflzZNrJln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE3NiBTYWx0ZWRfX45zWTtkkyR+T
 mZ1q4GsyS1kxXbx0VveQXyGU/hIZwW5ZP91U7xB2KAJ9lqNuon3jxHfPSZ720I8FIvm94f7UYIC
 h8e9VcQX/nMDFoyFGXd6TQaDEUmUYxb24u359wbB2dQWf3c0iV9Dq2ZhoC0j5vSs9Leg5fn8sX8
 u4tGHt5scAntvdDs+lia06cnQBup2DPcesQd+Yx4GgPKsJulGilm6YcH3BMsz3oF2Ej1qdiq6uK
 LfahrYNpiVal3CHEN1LDhrErAa2y1z0+j00YKpd5qvI5Dri/a+No+uV6HwVATjaAzMY1vBEbwPW
 yLOwksmWblPZJaBlMqwvpTNxZi/cCn1OqIssiqOxuBfcN1WsgQte6LOWSBJVKdPz/yVg4VKMbRI
 2P7WdBQhcaOim3b2i+8Q7ZbRRkYjSrjXG+FeiGqqCl+D/9+UFKbHZwBQLIg+CVEhxikdRpHeJxW
 oG1oHcCpiPn8M5dt3LA==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a591197 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZCp_6w5NnSzxskP9NWEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: cjyXGiMrUwJDQSzpUHVSuIwflzZNrJln
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE3NiBTYWx0ZWRfX0P7691pc9mDu
 /GHCM9RnS3ixmWDpWUCsITKwB42WbzJTsKjuTDU11mIhHPOTN9Y1udPuNniiOVq2mwXQi7B8LIG
 VD1kOk8YpO+wDz0HartSWxYPKPaHteo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160176

On 7/16/26 4:26 PM, Shawn Guo wrote:
> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> 
> Add initial device tree for the Qualcomm SA8797P Ride reference board,
> which is built on Nord GearVM variant.
> 
>  - Configure UART15 as the primary console and UART4 as the secondary
>    serial port
>  - Enable UFS storage support
>  - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
>    all sourced from SCMI sensor protocol on channel 23
> 
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +&scmi3 {
> +	status = "okay";
> +};
> +
> +&scmi11 {
> +	status = "okay";
> +};
> +
> +&scmi15 {
> +	status = "okay";
> +};
> +
> +&scmi23 {
> +	status = "okay";
> +};

Why only these ones? Can all of the SCMI servers be enabled?

Konrad
