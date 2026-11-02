Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626898;
	b=nRu/Gzpm4x70Om4rrUuI2tcicclBLnJbY3064sY13VaVqAomaxr0aQcUhnk7j8m9ZmCL
	 ZzOvBOFvKQrGSeZa1mdfudG7bdeZhFC+k6Y9qqg960F1P8+6OKP5pOW1dr8mXCC9dv7nE
	 g+FOAu1mcnHbAjOnMabpBXhkbTFmV4dMqH25PAlVXtXBHWeG6YTHVr6mhMLu4DBix5sde
	 sC6WFY3JkGvrbmwz/uMeGNNr6pCaV6ioTODBuzIiKQGMHG7HpEBrIX13CBirB6nTHr1+5
	 EB/aB6gmC0sNm60RQgSJ/OYcmJ/4YZ5T5MCCJ9WCTQfYSVPZUG/YyCpVbgZjSSCEAoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626898;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u2CDzv4RDHZ8hPwlE+nBKssRwCunfdow4oBThFsTd0w=;
	b=GhiTzcoH36nxTjuayST+iUv5dTkxSOhF3DBB6E+Z555aDDQt8uC0K/QnhlPQkmxfJzro
	 4glxYCubp463OVH06y2wSm5hG0UOR4lXIei0S+g4ow4FtwQEpqE0RdkObkHDpTsH89Lmo
	 xRnjWTwWBBbAQ87vCgFLPFgpEnj6m32WHUeLeUx+F/LpdFUD/IW/qVcokUwHWliPFcGGQ
	 +p+YOGOUhmkDJ+bXl/uMPEP99gBIbsYllybfzLhn+lHIwTveCOeKpC2l9w8rYqv1UpS1V
	 DqY66tKzPNj9Em/vU9Zcp0MeVd3fpfQ7QD4GEuuYEtcX68qe/g4EJ5JuxW6mSSiBABw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Nu9kW/BD";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YhhZ7tu7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A869606A32E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A869606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nu9kW/BD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YhhZ7tu7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAOkw804756
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:41:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u2CDzv4RDHZ8hPwlE+nBKssRwCunfdow4oBThFsTd0w=; b=Nu9kW/BDx7zBAKFG
	f12o7NKAt8AkTWlmTjT1ZCCfWrQIzowQc1H5FACyz0MlwdfeDm4LgQMYR2gvpbmj
	HbueCW1cV1awmTe5Z9WQVTZ+T1Kjrp9TweXelnFHlGgotbi2ARwvhfLm6cUz8rw9
	OVg7WTkQmKPhKLrNy/jEIVunAYNxbRBYd0b2C/ySsBgxPrY6MQYXmlBV4YIpOoVI
	poSsLjUkQZux90kC/+azzqzBbQKP38dV1JkNlMzuYM5hm9FY3kI3AWQ+ymGKLsSa
	oShV0FoMFWwZm56demoKcXCcIeyXcRokNqgxFIncsqgSFpDCWGxoq9kTsBnQSTch
	GHAgZg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvs1bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:41:36 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-451d80641efso3443727fac.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626895; x=1794231695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u2CDzv4RDHZ8hPwlE+nBKssRwCunfdow4oBThFsTd0w=;
        b=YhhZ7tu7wOYvx8H0L8MqbuWVptq80HHG3cmaUFn2n7UcsZuVQJNsoOjapi2mhUV6a/
         Lql+1PF8j/yLsrPvUMPD8e9iEH041MbCkeBcajXP4/Sq1X8y7O/K/ll9rFLEnt7qVrYz
         ZbjQEgKqB0iYWrl/oec8a8W0WX2mBgwJAnFFUZxCPAGtocFi0zxSa9RZWKFfJFz5qOh6
         tH3zU0D5tCGPhvS7b7M+5AHG2IvBIXll9z499r1X8nWHSTuggh2MVyq4MCpELRzTO6Pi
         XQM8fF7DoRzKw+qD/YlqLfjhPFNoWJjH04QTQiUCxFoA+3tdbbQ7n+qBkBRcp1kN6Zgy
         PgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626895; x=1794231695;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u2CDzv4RDHZ8hPwlE+nBKssRwCunfdow4oBThFsTd0w=;
        b=p06x8JHm2UOYYXOLmfjcy+eVHbg+EfI4v1cfGyCN6OeSSW+Isf/zsGOar29Nl0P6gs
         x7RRDBMMbXgj5hUXQNR4lJ1CWVs+chuQhotSZSs7g5iopxlkMNSbvQ62vfu9JFcUtLMI
         0GxFqWvs6MVQOugw32Kt7TVE3yFH506U23A6vuYO5d+Hpk7B7iIMNBVbQeoH8v/8NTDn
         m5gq1/D5KVBizgshIXXKrtDyLXNh5AK+2mQeWVylSindp3jRrq2ncNyhv3Kt5AbeF+E2
         4QYHg3rimvkbgKw2XYftDcWiVeFeIEWPAmSygmYt20QgaTvnJQdM3OFfz2D7AQksfdRM
         wQwQ==
X-Forwarded-Encrypted: i=1; AKwUvByaeROvMj1XykS8jHa6/ZS50a+fokWLJg6lweZkrYkJArYACLY7F8+zae+nggxK85q3QVbioNP+YBLDPbHc@vger.kernel.org
X-Gm-Message-State: AFq9FYK/6U45C6xm2l/NiFFXYrrRFxBMeYGPYQrcWEnxiSk+1DrzKekS
	8Qfi1Vp9KYFvwtc4LPOSUPGiJTOWJotDNsGB9tSDHZLBzEdYpL62cWYbQEG/3woMqwxPQbKOXvq
	opWntWvFcTVX5rrA20Cr8uLq9YpemsTOYPGrGf7deCpmwrBrQBFvjchxAS+xvmXAgJaJh
X-Gm-Gg: AYBFou32Qe8tOQo91qXUIdYxwqqnPf8isRfXL269SKmYtpi7UMbhLDrrYEuG7HENnrj
	RbIZ6qeREkSehRGCjk8+e3X6Bg2jdMPQ980pXFWb0waJJla7zk5oKU3uReJ8ZVS0rfwAIjEbjyR
	V4DRSc6CMaizQC5ozSULE3+SMyFsvtkPwl5HGPsnOlXM0uMgvTdTe3fTOfzGoPZtKBo7VDz9SYU
	aahKS2DUEbb7satHqSg/oY4uzhlNpfNfagjo7gZsNZQgezSfwd3ctDCD5b9fgrB5Jsb/rBTA1O6
	Qav4YDARXKat+dcsu4vJAu18B6W0mcO9sMGN/WP6Ls8DTJdKBL6QrNmss1g7j9rShdGTqA4vAwO
	kyEnEKQMV4ETT2mwVDQwLlR4ArNSA/XEfkA2jS6JObCu/C+P7u/uIKeUhUAIN4I0mr8q77WeO3w
	==
X-Received: by 2002:a05:6871:1cd:b0:4a7:424b:934 with SMTP id 586e51a60fabf-4a9076455ffmr6067094fac.12.1793626895325;
        Mon, 02 Nov 2026 05:41:35 -0800 (PST)
X-Received: by 2002:a05:6871:1cd:b0:4a7:424b:934 with SMTP id 586e51a60fabf-4a9076455ffmr6067072fac.12.1793626894848;
        Mon, 02 Nov 2026 05:41:34 -0800 (PST)
Received: from [10.92.207.38] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921a53b59sm6647163fac.14.2026.11.02.05.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:41:34 -0800 (PST)
Message-ID: <e618a9f3-6a33-4dbc-a15f-217542ef28f9@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 19:11:27 +0530
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
Subject: Re: [PATCH v5 3/7] tee: qcomtee: Allow object invokes from kernel
 clients
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-3-1460691b35d3@oss.qualcomm.com>
 <952816ce-3e37-4628-8308-4208b4359549@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <952816ce-3e37-4628-8308-4208b4359549@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae89310 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JrbDfxSjzSyu3ErrWlQA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: ryCSbM-wCp-rtJVhTB70OW2vCzBbZqNN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX40IjFq1qJHyB
 sq0IhOMFEiTIuov+3WzQO46d4XWyPa9dxP4PMZcl1PTfI/DjOflPAcABFs1OIqoUmy2jGTDsvgo
 /CYlhhHPwvGO58RebFHAn/rameKQpHc=
X-Proofpoint-ORIG-GUID: ryCSbM-wCp-rtJVhTB70OW2vCzBbZqNN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX996ThGt3FIsh
 pNtJuUOOUmwIpCBxdLZwYZ8yeWO682yBZNLAcAT5LxTcBXin1Hl5/dZnpuYb409WGuuGHKUGvsI
 8a8fqAWbLnpDHWiOA2evDfJSgtxoL8/K7zwWODGOILEIQLMa4nRMQ/u3XS5kMjdT1wsbUHaSKV5
 VK1N44yjC1SjgqePAbpCS1D2G/ewNXOJQp5IS4YnbRvU8ijKAcqmVreLWuV4NqimaC0x4CrxUpQ
 CA14ervsZKLs67M30mV+QNp7/bUnZ4CW4RPcGFEqKPYmNF6AM14rpznLZ5lMjZrQvn8Cxn3cg7F
 9X0ROy+GosHye87AP502qt/YAdEvMfbszTMHJ3GeN3nGm1DECaNp/yHqMSIRbbQOyBQwMi9lME9
 7Yf7zj7wBjMDzYJ9N8KbaRnpcfrTFAuvh7GblKGJx/6gof8VI29KGCkXP2MG3SIbQtkywLtuzAc
 cLqqZuIk5ky5XFN6B9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020054

Hi Amir,

On 26-10-2026 08:45 am, Amirreza Zarrabi wrote:
> Hi Harshal,
> 
> On 10/15/2026 10:39 PM, Harshal Dev wrote:
>> From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>
>> QCOMTEE currently treats UBUF parameters as userspace addresses and
>> applies userspace restrictions when invoking the root object. This is
>> not suitable for object invocation requests issued by kernel clients.
>>
>> Use the kernel_ctx flag to distinguish kernel client requests from
>> userspace requests. For kernel contexts, do not mark UBUF parameters as
>> user addresses, and allow permitted root-object operations to proceed
>> without applying the userspace-only checks.
>>
>> This allows in-kernel users of tee_client_object_invoke_func() to issue
>> object invocation requests through the qcomtee backend.
>>
>> Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> Acked-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> Same here.
>

Ack.

Regards,
Harshal
 
> - Amir
