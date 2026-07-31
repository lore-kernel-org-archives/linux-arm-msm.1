Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC2836215F
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478197; cv=none; b=cVjRfnFYTrnXvVKtpmRkN9FJCZLoEO/TiZ+aznDmaz4U7toZKkxBxxNm1UCH+4zDwM2HFWYbfPw79MDNURXXsPCUqMdJRipVQ6FAIHWElJoZ3OTZONnf2Q8ojoIwxhG1EntL9K25gMPItjG2s0EABMVqfXgIJC42YxnH7g2QO4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478197; c=relaxed/simple;
	bh=tvrYn5wX1UnORDJ7FWyP+7p9fMUkHJi6cXF4SbQKZ38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gClMwm45Q1RWet5Px3f51qltXhxLK8s1CAZSklmDD+tgVovcmlFxXvAP0Hu4qvkUny7b3Xi7ldjEZ8DTkghNdPLqZLcvfkTHapEuxlhkMeDS8wfqX30uCskZ5IPJRDixW/Dr0Fr1y2qgphKqtaXp0uw7+LNrJ2JheUK02r5Zy4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dIkislgW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eSha3qkk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dIkislgW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eSha3qkk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V636gE3290772
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F4w8brG0L6gKtlFJJHYc8QCc452g7vG2q2FYJlGrt7U=; b=dIkislgW/YQBtUpm
	I2LX60GScJ9+66xqDJymVWCRKf4itp5fVPp1iFfsz9PMG10TNnkUTh0f2cL9koLa
	TPCqn1dqWpfiQmBP/DpaRotvDGyuykaN3FCarjR09jUdjBPDQVAlKBWqT71DC26M
	VrUW0HY6nkaOciatISZsQI8Cwt1Esk/ND1p3yv54S9TzxRZUyzhz5cncaebZw79u
	/1HvHQZxQwLQ0cFnx2Lb8rRFcj1CAsK9AR+M1GDStpVzy5ndcYfziSYG0TpBrOAf
	gxC7a7q7mmLTWxk2yvrQvUNnEGSbCcVIv/9lcWk78kcxHrGDPHR9aoeZi/8qsAZ7
	/+yr/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp3cr0tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:09:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1457934a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785478153; x=1786082953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F4w8brG0L6gKtlFJJHYc8QCc452g7vG2q2FYJlGrt7U=;
        b=eSha3qkkkg/WvXhl692HbClQVGEsjDz18QToVqg1Ej4GNegg4NO7OvYTHTwo1bj9yR
         a36/51GXtbVcGbOVw/Az6uNHWB3NZH1OFLzw7EJDwglFafbJ2Qq1Ui8dFlHMUK+AzBOz
         TjiMRDWaIY30DsPz+4vQ6VaGVOUIRWiV28fPLcJPKJGVQ3U/6h60j2hRpuN/UaAB+nE+
         CT2Uj9w3+vjyywdFuKQQYgPMVp2H/Y1pkv5sk4Ek1pX//yKA/i4Sa63cTC9hTKHSf+Al
         2zlvVllTlkWYbXlaXY8gR6vNQpsPLNIYoLVitpkwwxhzBpXI0LkYSL7VHztQocbEL6MK
         WkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785478153; x=1786082953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F4w8brG0L6gKtlFJJHYc8QCc452g7vG2q2FYJlGrt7U=;
        b=FkdSkUmqkgAP37z+mWOr1inqAkDJVw6wFTwygo0H4vZZUcT7OCUD/g/MtSchu1lrZB
         7HwSXWR5dpbQ9kNHMvPGt8kU78BNCm0we3hcGE7aONM4vlARYupxTjeoS0PVPtRv/QTf
         EKDTzHahM6QEETKwkqsnACiMheeD0yVPz42qPjPg55NPhbOrOlq/tdLbovejGx8UlVd3
         vARinOKaCw0DYW9JU2WSf4yF/aLtzK5bKp0ZwFcRywYVfyRFce9GiP51clsUbxlxzw6k
         x9ddeguvzNeVnbcWb2D7j2+608EgfoRtK2Yp6HoE4n3i4FXxnW/V5F/dqqFOxLxFF1Sl
         Hjog==
X-Gm-Message-State: AOJu0Ywiv/jaFJfW3i/VnAI9OXboCSn6yHHDfLa9tUH10COK3waYwnFp
	kS9P1tYcymICif4p4XnAEC1x87Ob6lrpOmB+n7zPRZA53mo58ZmxkqticF0NxnqEpOQtmeRFKmh
	ESr5js11lDN4LLuXKIUDhvL5AHQZ8HmZi7cfSJt3vmTSS+zTVL9bJagJbh/Ayd61HGlPi
X-Gm-Gg: AR+sD11nEpGh3mJOMgrf00Rh0cII8lIVn5MiLHFtEVrA7JUZk4WbOdiKOheIzzh40Tj
	zTQHgKsYTUvaVxoCByYMbndqJjcko009duIXFs/V6KAHziDsMK1BVG7/YwPMfm8oMGQR3mGJ+0H
	rBOgFJpeKLDtt6RkqlMpBf3JPgtyKJCMX9qT3lvApcMbviroLVKrivgXzzHJwbjRaG2X7+v1m1n
	xS06GAUHYnYgKRmv1nmvv7EVRp//KKcu0WkizFtpUlFKD9WNvWtujy+MY7VtNWtQRH1ikxBrS42
	vx3CfqxAX7h0HeibmOlOkYxyMf9mSd4v9J5tw+Xw4NKy47yFr0CPck9+3jygcQGkpUY7MToH7o7
	jFqwxWeVNmbTLW0UaQcBTj/ujEH8hKGmqCp7DC+OrHOTtjzJP5LnjRqI/H/cPNXbT86q7gA==
X-Received: by 2002:a17:90b:2d87:b0:38e:7f22:f674 with SMTP id 98e67ed59e1d1-38fb2b7a1demr458752a91.11.1785478153022;
        Thu, 30 Jul 2026 23:09:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2d87:b0:38e:7f22:f674 with SMTP id 98e67ed59e1d1-38fb2b7a1demr458713a91.11.1785478152449;
        Thu, 30 Jul 2026 23:09:12 -0700 (PDT)
Received: from [10.133.33.15] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb29ca1f7sm225091a91.6.2026.07.30.23.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:09:12 -0700 (PDT)
Message-ID: <714d2d25-a37b-4529-8a21-74669af62b18@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 14:09:07 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] dt-bindings: mmc: sdhci-msm: Document the Maili
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>, krzk+dt@kernel.org,
        robh@kernel.org, ulfh@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20260720215645.1464901-1-nitin.rawat@oss.qualcomm.com>
 <92179b39-a6fb-4210-b41b-424f128c1b05@kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <92179b39-a6fb-4210-b41b-424f128c1b05@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzOSBTYWx0ZWRfX+m66gkDCdTJt
 GMUgJzMWrdhMiW/xXwLFARP3XPjWYmymym9dRBTOcsdA9jMiK7GbR8W2tKb8M+6kU3pPEM5HZ4R
 Qknmk0X6SrP4zE5t8RCYvOxobkZZRWs=
X-Authority-Analysis: v=2.4 cv=a8MAM0SF c=1 sm=1 tr=0 ts=6a6c3c25 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wqKslviXCvpl4bgw-KgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ZK1GlAStUEOtvzDtpW5K986cD7g1USvU
X-Proofpoint-ORIG-GUID: ZK1GlAStUEOtvzDtpW5K986cD7g1USvU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzOSBTYWx0ZWRfX4Qo5Nb5vVdF2
 jjRBZ+bHZzRmCbeEHxyZLRJ5XkdJdwWJDhx/lk9QYidYpj4Wh1IWfPFRC+jDErx8pk/NFPBJ/Fm
 clKpTIK22FKKAIJsYBcLg7eOS30eeUgHY9bTm3rgXPhaIXXiFaNU7KZJV9pVWp27U+nwwPbAabM
 0tMvvAZsHkXe3im0AnuYm05PtGL5Pu0namRVL2p8LjajMN6PS4TIw34NFwaODOFUvBttj8VraBy
 Y1y7bx3FQ1S+lHiRJvMBFmLiPl+26OgOqS6jX7Mmy47p9TLlJLOviqqqvP39yIhl8hPblahAZoM
 nOS2/NJN81TrEswk/xDxtxNyD+7fQUwb0qYKiZ7RmLaggfkWO7BgXhH3c5ROjcUPpj1bbJaKG/6
 WRGu4WfWQRXA5ay5mURUq8J4KdM1AXSLf6sY7R0rILv5PQCuGZTXMTYJckv3YoF6nYs9lc/LczM
 tYFr10Sj7sQOn4qbS4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310039



On 7/21/2026 4:39 PM, Krzysztof Kozlowski wrote:
> On 20/07/2026 23:56, Nitin Rawat wrote:
>> Document the compatible for SDHCI on Qualcomm Maili SoC.
>>
>> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
>> ---
> 
> 
> Please postpone posting anything from Maili, because there is no DTS
> available and previous Kaanapali, Glymur, Maili and Hawi postings
> without DTS came with easy to spot issues if DTS was available.
> Contributor did not spot them even though they had DTS internally. I
> cannot spot them, because DTS is not available to me easily.
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof，

This patch has passed the dtb check on the Maili device tree.

Thanks,
Jingyi

