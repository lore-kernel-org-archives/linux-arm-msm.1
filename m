Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEE14DD6F5
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647413; cv=none; b=cQ+Bmpl45dbuXEQ5wuP4qYt3SXwn0NuCChQKZbkwa3OrefGJNkTlUJGlqxWD2GCkPWgptjzf020oyh4V5BcpOWr4xKo4WSoOnvSAbqTD+t3YTSBq2rBqKWLWp581eDArbA+8B9KxhkNnEAVdWsd/0XktU51mxNO2NHV2/zlOaB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647413; c=relaxed/simple;
	bh=v90sHJ6tSvZo90Ujotd1C6DTyFO/ubjSh/heL5pqGqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m7xoiGoMg4CaJlFutH6JJeKW9m0e/XRB1TXXxFbcPgfv0W4BGINionqv0nmSAVYAz9GOadhvCicGUDl7HtuwZ4D73xXtBWX+q4i8+AnYvD8GGlZJvkm5JczkVJCOf2KKrL7IasCo/+edtMj59VnzpbD+SitFhyJ83kEV5kMM9yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HFm4TJx+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnLz9F6F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HFm4TJx+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnLz9F6F"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg5hd1805606
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o44HsitTxFl4RRHhM8X0Bo7+DeaSzkF2BvOXpNUOwQI=; b=HFm4TJx+QKjj1CSB
	4ct/yXVRXXthkbIERC85JMEEFdrBD1yy6CVEiEEL6qLdpWx8cgD2TYW/biPORTqc
	fMJnsg+W1Ijxjp5koysP/xXJLirTug496fuu2PU3317snbCsr/3W0Ex8opnY5RHW
	0yd5iv+IiKzE33yF5PN1FnAzdFHdZPa36lrhHNgaQLJ3xnALgqYk4lVckrMVbAbc
	Y9T4U1kGWa6NGt58bMs9s4Ck8A3pF5490jhEc6TH3/GBoaxWcN3VZAATCH4L0Ve7
	pHQ57aDeQ+0/hMhIQbe3gdbJIZ8Pupi5c4Wd3yhwUd65WGYm9GNv9az+nbtlEUvk
	dkyFDg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pa9fc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:23:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc86a9ef97so246609765ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784647410; x=1785252210; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o44HsitTxFl4RRHhM8X0Bo7+DeaSzkF2BvOXpNUOwQI=;
        b=jnLz9F6FGoiqck792dZ53/X/8l8aBajl6oY7PveVl4/rGQ2LHNK1b7gHCRo6qbZY+n
         9GbmMwFuGqFj1Se7WW5s975LJj5QRCz1QcWUpFhKQOr16YbJuzpdEVpeKnkkZCWY/XWD
         YJLt1vTnks/fkdUdEOEQ1Ky4WTq/BpPvZZibFc1y9JukF00mjvMtGx2yeuH8eRAQ2lAw
         w0yrDstain8C4PUyMEX7PKg5efEcU/wmHc9NUHrD1IgQXfQUL4Pi3ENSLyUDASFT7/09
         TrJ0J4jhansIz9/FL2J7EInWtf5+Q0zODmJ+IqVtcLb/WJSkXot8zP7VDdVxd0BEdHl2
         Z/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647410; x=1785252210;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o44HsitTxFl4RRHhM8X0Bo7+DeaSzkF2BvOXpNUOwQI=;
        b=E/WQr7rXHUBkXa7Dg96lgz3bYrutXLPYMDHVYYzZuPty5320YkltqaT+EKYiLH2Fkt
         XjmWfhk3NJvPsNMQX99L6owb0vi7bGRlbKiO/+oTr18p9FYA+7kRDh8sav4zw4ZgV9Lu
         rg214p0ZaivZszUN7u8B26dqu6ftNNZLfAoxmoKy7EUtFhyTamc48zLprQKQ79zmVLQv
         iakpiIOeJ+n6PQ0n/XHbLu9ATjpBIfXCCvLE2nNs4OrA53wjfomQHMGb7a0QkdVffG5G
         Hff27iI4lbQ0ivpGpBolyOW4uPAxhJKuCgD1OpD1i/8ER95wyTYTSixl2z1NcjsUazw1
         cX1g==
X-Forwarded-Encrypted: i=1; AHgh+RpDHVI7glY0T0yHbp6ecmxDkglxh4cYCnqfIPMvV6KaTmZR045250P9axD5v/nh+sjmoDo4D1JTFDki6E8B@vger.kernel.org
X-Gm-Message-State: AOJu0YyUQhfYHe4/j2VGeOWk84UL3NVZurpEZ22l5zirnY0Nu2J4DsN9
	qB04sFF2YZh0Dzlao9m6b/tug3YgXyWWg8L6YywfuItU0RTHxKChW4Wwyou6dVSix20oLFcqVWX
	5m3Q1GKVtF7oHamNMlDIK6t0v4TT6KBrmVn9C32Nzm49F7QfPZmnqTDGVwM3wrUMgrVwivO8VaV
	u0
X-Gm-Gg: AR+sD11Skfx1Cy67C7zhxhFxVLGnDgeQqoR8wsyl4hAQ7Fph8cCaxqxkWoaMOFd1e4T
	Q18MOmM0qxhr+JPy0h03ygiB2jLd1+/fF8bLp83Dk4FBklcS4pyuQmpCKswwH4XFe6Mhvz7XojJ
	a3KAwMVtnZXvaW6OzBAqbxb8bTMpEKmC4BYjlEYEXoAbArFXFQVvXEQjQH+XbLyUKSAJ+rcIhAM
	wowD0Tiy60LASkoy1KbxtASBRosAL825ryX2eUpBl++38/d2rZr90ta8OGEbfJSrQX6fHHD4JiV
	gZKVfU7HrqC6PTiTQ7+q+HAWJizHQHbAU9GcKivwhuBToKQSgVF1mQ3fqf+QVXMAtu92KM93Gpd
	0oMtBy/Dr0dYn1Jdm9UYwfiZ6ionwahZV
X-Received: by 2002:a17:903:8c8:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2cf34861177mr182590165ad.14.1784647410312;
        Tue, 21 Jul 2026 08:23:30 -0700 (PDT)
X-Received: by 2002:a17:903:8c8:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2cf34861177mr182589805ad.14.1784647409863;
        Tue, 21 Jul 2026 08:23:29 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc6162csm117450eec.7.2026.07.21.08.23.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:23:29 -0700 (PDT)
Message-ID: <79df1c94-bbaf-41a9-8f3c-0f83302cbfeb@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 20:53:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 14/18] media: iris: implement support for the Agatti
 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-14-76af9dd4d1f6@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-14-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dg9y4iFG3UEuofEYq6W2E_CxIpz7OpI-
X-Proofpoint-ORIG-GUID: dg9y4iFG3UEuofEYq6W2E_CxIpz7OpI-
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5f8ef3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2sUm10EWjrca5FkrqogA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfX/SVVhzUp2RSk
 kKvuEMEEVQrMMZqySYw/lzrxYTyV4YPKjB/ih/dj/MFewQEGQxsQFx0Pelwy3700MWiuuQuinKQ
 KV9idlqJVkPgWJgU3qPCLiIU6CvNem3VdoMBxhygJosilKz2RK4m75Pv1OEHW9UI3ELwor4J8Q/
 DVk3IANJ+xKCgs3n9D+8bJaVzlIaRmgWnsGWrgSy4XaiPhMygOJ2ZzPyE8Wdk+/QglzRHZTH/iQ
 vxC/NwG2PylAS2NJLHLhA2xnbS0aHy4Hv0sycZP6hq6lafoOwvtNlzl/2UyZsb8urGtkjSxxqJ/
 eI+qmUpIMeinGNig0WlIbWdMUBZqEipS1yUm/IHXdFIoJHKG4P3bfbSZQY3u80UyyauqhPEp2fQ
 IGpC0Jupam39i/UETSFLR6bEkd/BMYU9Wvrij+CHpZOmQAECANKGNRLNUeyqArbglF1V21yTlrs
 BE2LdNJNkBaLUVMycjg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MyBTYWx0ZWRfX2ocVBS8GKQAv
 9JwPjpORC7cYyHsRmbhNn/LHCmOIxGMhWU5WzdpXi59QF7bWnoLoQN1YLC1qOxffqZLksudQzmc
 sWQK0J34qjvwf1mPDP7qDt4TRwe0ZqA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210163



On 7/9/2026 7:12 PM, Dmitry Baryshkov wrote:
> Port support for the AR50Lt video codec core (present for example on the
> Agatti platform) to the Iris driver. Unlike more recent cores this
> generation doesn't have the PIPE property (as it always has only one
> pipe). Also, unlike newer platforms, buffer sizes are requested from the
> firmware instead of being calculated by the driver.
> 
> Co-developed-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dikshita Agarwal<dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov<dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/Makefile          |   1 +
>   drivers/media/platform/qcom/iris/iris_hfi_gen1.c   | 241 +++++++++++++++++++++
>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |   7 +
>   .../platform/qcom/iris/iris_platform_common.h      |   6 +
>   .../platform/qcom/iris/iris_platform_vpu_ar50lt.c  | 110 ++++++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c |   5 +
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   1 +
>   8 files changed, 375 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
