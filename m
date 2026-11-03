Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723608;
	b=zYqsyws6UBgPod3W0kuT1LoXi7uOVrsZDEA2L8rSVR3Fmt5DMp22/BcAl3dQgjWJcf7S
	 9636CIGKud29iIrn+CuIZvgmiLdQW1mhihNavQFe7LZr1DbmjWspq3vLvD1Y/KqxPD7MC
	 B3YH+gjvnniZP10YhG7Ky6KLXoxuHUo9YsVYlgO9VOkXvVQ9yE8wyUlxAnTMT5Zp5Ur0u
	 raUh072ECNCMt8m6QN710EXttuUZxxCV3o3/gjo6MZp46MprVHrRkHcNT6DeQglxsKqRg
	 GNPMKGP3R2tZRGm6d4xuYIdxdfPdyHmpU1X2S60AcdXmiZufG64hSXcc+nuv4k8IXKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723608;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KNX4j1BmI6v/586ULUJdkOuJ92tPPScGDdWzbmLn3Po=;
	b=NgycvCIbHjawjgbv624yz3c135V6yG/WmHd3T1ou0KT3SLr/eEIfyK3jAhork/XIW+eE
	 wxVdwn/Gk92rcUkfRN6r9nAc3MTcr7KgiDC95bFpq44fSwPfmBuv0oLJVc5aD9Ivwf/FQ
	 Fw9LdV0a61UmvVBklCpkQO25pnmSObyssHeuChYuvsiBTGLxjqb/XsINVRSsusqEvx1/6
	 fRlVJDRy5wT+yhVop1rFAPlBHpONS3c5vLdzBX5fvYoyW18TjtOEfLrzh5bwXRaC9OofL
	 NnKEvqHdP/bMmN2zbqlSKZomax2XgQMji8XQ9RmZKftO4Fh0iA3NNV8SSNByRhYviFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mjwuQ6tS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gcZJ30C0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEA1606A327
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 16:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CEA1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mjwuQ6tS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gcZJ30C0
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9tU42119615
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 16:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNX4j1BmI6v/586ULUJdkOuJ92tPPScGDdWzbmLn3Po=; b=mjwuQ6tS/VigZEq3
	ogxeCgwHxzhqzyfJV4CTYOXLH8FY8s1MqudfValPEMNThuzrnds/+rtXHbSiYJ3x
	Y1uIfLy+4LM7PhoodDOI3wPU8NgBQEenCPvUZWTazR9+FBt9xyZPLedZ+XQ5+fLW
	CTY9qaiJu9SvfXB+MmHKMj9JHj2fBmPKE38GdLGIjZd0z0LbX/5bnNzYGRRN79H0
	wRQj1c+gRehu5a2RnjhzjX2XEDiqelUyaH6tH+B6YgGvTSQBiZOC/697CGzjPJWO
	5QGvoF8uEyNSjvha2TLgLPjUOBhC161Ti7dv6aTXwu1tY91TUyQyIX07qVEGo04A
	ntxq4A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2brndv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 16:33:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f13c143c8so787515285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 08:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793723601; x=1794328401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNX4j1BmI6v/586ULUJdkOuJ92tPPScGDdWzbmLn3Po=;
        b=gcZJ30C0/lvQ0so9zvM0d+CAht9HORPywW0r1gbKKqn7iYPJmoCAp6O61Tudf+fh5G
         eln9rl4F36s8Nr4B3dX3k6TWrOSvtMnTrCq5jA8E8uPpHJ9ic62g7ORLcEgHhOgCJ/fF
         XmruU8JXWeMnJYn6zHAz9qCGDuY63EFQafwTRfItWiXuqri1WHDOQy4B4XUwuDJFP6zJ
         QHY5irie1ANacniLm0FgMGbYHho90KXfBG0wXNKvW856i8DkpKVywTQB+PP2QpjY5wwu
         JSm9fke3AvZdcWNyBj6wsdv9GNoPMnJGWT2yKFenpiTc4BBhibnP7Jkf659hpVYDKWVi
         ZMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723601; x=1794328401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNX4j1BmI6v/586ULUJdkOuJ92tPPScGDdWzbmLn3Po=;
        b=SIsQVKYeOSMBXe3BETklTEwiDavesiyHzvK9RExGIRhIcjBQC8wgPBdQiWyB4fsFCy
         zhXdElsPog6LP3WEAMSbFvNVoy/leZCnzo/SL6Kq7DoygSJKaue3BqFN6lLWb/HaZsG5
         DDaLHjPo8awnh81ahV0OD0iu5iZAGPwiKCD288tdhg0h9HMBvUERcCHPhdaSlL/UUneD
         65KYUM/kl99Y5Fp+RgBnIXQVjE3jYcuVMNTc6BK/296PDb/3EEVSyBr9+sIuN2OQtTCi
         ai90TcXWosvUpBYbaGimF63oHHSI82CfNFEB1DzpmruV0Jo/3NZDEetpTB15tWa3Lih4
         aMww==
X-Forwarded-Encrypted: i=1; AKwUvByqC1ctUxTNiAASbsQvs52kHrFWXcmdRHKPEDUcLJB4kjm99ed7BQhd4/DgOSi7H4syKDCTb++0Z6dzv+9U@vger.kernel.org
X-Gm-Message-State: APuU4Z9UfjDEsmp7xgGZiOOgAmIPKaxmJlPmnDGgfXsV34Rgy0pbCBAn
	itrMtH9XsxVXiFuaA7oGJNKtSjI3yC0Ua2VAQ+B/LvSRiIXzQQPSD0N2ZfPiROTwUcrOOwDWIEX
	zvkL4Zl4UOLIbVg+mi9iKP8YLHVYZMKtOGJ/vTH5XwmIHvKmSS9ULJEJBRfyzyd2mj5wH
X-Gm-Gg: AYBFou2k5eL2zFcgWv1POh7sSipFEJyXaHecd0wzQo5U71dIXQeEhG3wRv++oWuYXE3
	xjH8iEzvI2vZhUg8xNpNhIMCYPKETeeqbeUJ4e7jVFbxGQkJ4NuuI+K7YEfTVqrKgC/rcRQvV9x
	UOcfaTj/66h0du/1La3rpLpRxZnvCJWvPT6iE4pN/iLL8vFdawisOt2sAeKBK7pFiVlWZzqmku3
	ugfB+ore6a2UW6Gtpe0zTBuDdbx7Isqi8iqrTdT8keC6GjIZ0RRm0zqESNo0ExzlM3LOJiELmgO
	5s8ifXtCzVgh2n1P1hNWXpeChtCaLd5SaiLpnjhlA7lvAyYqH+BqktNutc0Gk0EVJANjbFk4HgW
	SYJmUhURC3d5razyWCEFgi/z1Q/zQjfJTlo93Rs967ruN7MSPnhVdM0HdCfeIAfckRoPIWidU/v
	bsXEPwZc1emNu9Z9VrfAENq2nK2hBPQDY909dGJdYMZIILgXs9+Fe+FsC4B8NrnspBtLgvV5w66
	tdsV0Qq5wlzbNs=
X-Received: by 2002:a05:620a:a502:b0:945:ad43:1d59 with SMTP id af79cd13be357-945ad431d8dmr1008661185a.75.1793723601195;
        Tue, 03 Nov 2026 08:33:21 -0800 (PST)
X-Received: by 2002:a05:620a:a502:b0:945:ad43:1d59 with SMTP id af79cd13be357-945ad431d8dmr1008657185a.75.1793723600734;
        Tue, 03 Nov 2026 08:33:20 -0800 (PST)
Received: from [172.16.20.169] (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf3dcc9sm101883766b.53.2026.11.03.08.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:33:19 -0800 (PST)
Message-ID: <2f6f80eb-57a4-406d-a041-8602805c7647@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 17:33:18 +0100
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
Subject: Re: [PATCH v4 0/3] Add TPM support via Qualcomm TEE TPM TA
To: Jarkko Sakkinen <jarkko@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
        Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org
References: <20261019-tpm_qcom_driver-v4-0-6889b9804ba7@oss.qualcomm.com>
 <atYZXRLf3YPZhiNB@kernel.org>
 <8896d867-dfba-4d63-a0f0-5686c572b262@oss.qualcomm.com>
 <athuhfkfGPZp_YXT@kernel.org>
Content-Language: en-US
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
In-Reply-To: <athuhfkfGPZp_YXT@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2NSBTYWx0ZWRfX9UifUl8cCqoX
 pF2HerwpWnhCVYGgVbhCIKLUtE4/EG9RbwCEghasg0TjT7nWibQsHJ57cwK3nWLcSSyjIWytw2K
 rULx/HSvbpu420Cd42T77oQhtOt4gh8=
X-Authority-Analysis: v=2.4 cv=AKV9GsJK c=1 sm=1 tr=0 ts=6aea0cd2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dMv3lA6PLLkT9/uWe4YCGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ma1MJH4ChwW9rezZrwsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: xST53gTDut7H-57h_DWuICCq-_XxYomK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2NSBTYWx0ZWRfX2/2USRUDZIYj
 xVmEJ5eDc5dWyNhEnu504/SOCMYtsNjmaX3pI79ozVBJp+38VPrRnBu1az0AckCfwR7gU1t6Gfe
 qYYYDg2NgJdENRKlLpyAZCTcCUW47mDnwxs+LZbHKQjHUpehdFOk5T1W/FwGrt+hv3W7zRfWX+p
 4wxMWxYpm7fliTELKal7yPQQ84J2T+BPGa8OSvQEIJHmLXGleXWM7dYKhI7rD8Jny3YXBLg9dX/
 VS1ydlM5uPITTDrLL6+6JkQiU8dG9DOODgyT8rMhDDTL/YDgQu/lQMwnJmouKXVaGGCsNT5nwUq
 +kiBZxgaxfaSiYYELOJ1gf8zqZLAJWCSeY1OQ8ZV7MjjP1FB/jDdvJqT2yPE8zLEDnZ6+uvJwfO
 MejeHScb46xHRNGpJ5Nov1um4co6LedMWeGw2VyNn+Q8TzftowTbtAScAiW1RFKWYiEgqZVgDcu
 4z/l5wz0HT4l5qNH7hA==
X-Proofpoint-GUID: xST53gTDut7H-57h_DWuICCq-_XxYomK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030065

Hi,

On 21/10/2026 09.49, Jarkko Sakkinen wrote:
> On Wed, Oct 21, 2026 at 11:21:33AM +0530, Kuldeep Singh wrote:
>>> Applying this pulls tons of TEE patches:
>>>
>>> Applying: tee: qcomtee: Track the object invocation context
>>> Applying: tee: Add kernel client object invoke helper
>>> Applying: tee: qcomtee: Allow object invokes from kernel clients
>>> Applying: tee: Export uuidv5 generation for TEE backends
>>> Applying: tee: qcomtee: Add support for registering QTEE services on TEE bus
>>> Applying: firmware: qcom: Add support for TEE based EFI-var client driver
>>> Applying: arm64: defconfig: Enable UefiSecApp TEE client driver for Qualcomm SoCs
>>> Applying: tee: qcomtee: Register qcom.tz.tpm service for discovery
>>> Applying: tpm: Introduce Qualcomm TPM driver
>>> Applying: MAINTAINERS: Add Qualcomm TPM driver entry
>>
>> Yes, first 5 are tee patches prerequisite for tpm series as mentioned in
>> cover letter too and this series can only be merged once Jens can pick
>> dependent series[1] in linux-next.
>>
>> Since, v7.4 merge window going to start soon so i doubt Jens can pick
>> for v7.4.
>>
>> Jens, Any plan/timeline you are aiming to pick series[1]?
>> I see it's mostly reviewed with no other relevant feedback to be addressed.

I'm sorry for the delay, I lost control over my inbox for a while. 
Looking at [1] it appears some more is needed before it's ready.

> 
> Maybe it is better to pick also TPM patches through your tree when
> you choose to so that this will go in-sync.

Yes, that makes sense.

> 
>>
>> [1]
>> https://lore.kernel.org/lkml/20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com/
>>
>> -- 
>> Regards
>> Kuldeep
> 
> Br, Jarkko


Cheers,
Jens

