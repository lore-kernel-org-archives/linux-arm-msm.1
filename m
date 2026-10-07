Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAD51397
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 00:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791331441; cv=none; b=N0wI8YUvAkORRZ17CyA2xsFb+A7kPGyIFo1whNQYGECWy82sfUj5tAV9zG0fhcMJ3PrdQktOqla5PBqzIeIZR5ozE5v9SLuc+iC4MO6DcT2NcmwzPLeL/npLZVvyMyeHLN3TAY2s36wPMhd4AbTxSovbeQB+37YMCqTUU+4V6eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791331441; c=relaxed/simple;
	bh=ruCjfSGct3MizqSDE0TmtgUXUHy5mBaRnQhxTHqCOrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B/ELncW7DK7KnrUpu5TXxRPgn+N8Rn/W+RrIcxktmkBgvY8ZhR0btH0WuKqFWBm2HAanBFd4Gd1xclCYmU73dlbfs7ZJGYdYtI0n0AIxitNlSGumBCt7zwEde+idlWD3w8oLBe1mmdo1v54OFjV4hBUi4yxd50247ofko0irvdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DODPSc5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gs3TeL8p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DODPSc5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gs3TeL8p"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LemjE2514806
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 00:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mEBVU7YoQnA6oJNQRreS9t217ifY2fL30vwizF+wfYU=; b=DODPSc5en+vzuHMX
	iBSMHbRqul1ViSDbLqtkcEm95A1obvei5t67JLIFPs6+sjiclHmd5FxRgvnLJS/i
	wxP2/q3a1cOkYwWRHaSgkhGkbog/jrszRKceroPxgurwIdIosJVGT9oZvpyewfC/
	A9u6zIXH45mg3s4hRMf5jImfGjSH6ugMcEQ7byo+h2ZVr3P/32Wouidvt2Mp0sX9
	kCJzoJQ/u5u4bM2h+kLD3Sx4hoZHN5Jf2Ns+qnq/SaytMgaINVXedWlVeSLS0wld
	M4NIxKvoR6C8FLOYX63x5gyugRTczckyXb68rasnQ5XihftwqMvBP+3660dUpz97
	8fSwyw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xwwu4au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 00:03:59 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-154e9d2d94fso7189980c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 17:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791331438; x=1791936238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEBVU7YoQnA6oJNQRreS9t217ifY2fL30vwizF+wfYU=;
        b=Gs3TeL8pa4UfUpiK/mT13prL3BP2r2TymBp4kfqbk563CPz26V84h2rJZJiVU6ZBuM
         NEKP0XaKGnrXUreFmeexe6VgK3T/hNfZP3D7472ISy18WESkEeWI+gyrHaRgzzfXIt/0
         4ERv+wyO5nY7kIo5oi/s/dpKnQujgbVjDhN4HlYH+yRww/Qg2FiiVUPHDjmq4dELShD/
         LP74rwG82FeECmHdujgOYtqOIK8J9mq/rxkQuvI0ToKWaYgfZMntiDdDOdo9jKbhIqiB
         RxxTt405GdyvVO4rzAbLCbiTCMsm+wiGQZejgM76MWYbsr/7+mTFTlBhabhdoB2hWJUU
         0ESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791331438; x=1791936238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEBVU7YoQnA6oJNQRreS9t217ifY2fL30vwizF+wfYU=;
        b=elVV7WTohLRHaIrRxbmkwSkQWpjpOc5TvY6ii90GLwRbz4+T1zGsXj7Lnpnumtj6w1
         EYYqaB1sGVrVx6BvCpXGIK9rxQPuFD9RIPQkHf1cRrh4EdpctTFJmnSmX1p3kQaibfVp
         dY1HuZRv+4ILz2V+4IK5mXcMmR+HI7CZzy5g7pLGghFCIozpg7y4poP7sLiIE9ZE4O73
         EsmsaqkiggPVICqFXt3YA0t35uN3nb8VaqOFeuFEsTwk4a0/kf5rhZP+OWIhBhHNMdbY
         K0zy9LubiE0kSAFW8B2q1nW3+wXvoDGz0fH+SXs/rENgShp2ELipCzcFvfR27PmcSm9b
         2gOA==
X-Forwarded-Encrypted: i=1; AKwUvBy10YCIvOrkBXs9cTZ0M6P5hExDDzM25SlZh4lQIfXp6Rv0AK06Uro+rnJVLUa+9q0ghcYvVYdtbHZ1gbCg@vger.kernel.org
X-Gm-Message-State: AFuF++nmerSkDhVL0cLapE2nRr07fsAaoo3GVbUXEM06PFeXI0c9WQaT
	DaSlF7ZguBg392WrJAhdW9E3+WoAlqAbAQ+ftq9HPZ5eeZhq8eqSP6erbi1kIdvCqvSDS8aYyEz
	nRrLFRr/Vb3mLEwcLro33VlFn/M5z55GBJEMrMJTMNzleo908xBacGNr5iPDwDg/A/ytT
X-Gm-Gg: AYBFou3m+Jk8yV3hB7J0YiTtOZ1T9BKBG0ozoQtOwIVpW+hFOIM8UT+fOejbxlAA1NK
	2fFkjL0zSm6M3UuHLj0tnB1Qp+366xcF+YMlK7ZHQKoZkzlcwE35wMuycYAy3WKWjipEByxlInA
	EJic1RqAtTWMb7C+jcUSR76Nsn4zBpk7aNjsUaqzI+JdBziKy3H09P7UhgxmuKulX5xwDX1GcCg
	1U7Ct3ulDHGaMVD0XFJfJrsJgWyGrp9Dyh7cdd5rOSZQ+3AWmE6kBqXse4l4J99Jxf39pFWveb6
	aW8v7eg8SM6+sGuXKR3X7qRCzfPICC/02tFtmDgm2Db/jcJSBY3XI+c7nIScCrxGxbTupw3DIrw
	By6ZLI+E2MkiGPrj9iz0LZNAU2dzMy8ArgI4fNzNMrlfn2aU3G9CT0xkAy0Qn0CI=
X-Received: by 2002:a05:7022:43a5:b0:148:306c:971 with SMTP id a92af1059eb24-16206f0616bmr620053c88.22.1791331437571;
        Tue, 06 Oct 2026 17:03:57 -0700 (PDT)
X-Received: by 2002:a05:7022:43a5:b0:148:306c:971 with SMTP id a92af1059eb24-16206f0616bmr619459c88.22.1791331425354;
        Tue, 06 Oct 2026 17:03:45 -0700 (PDT)
Received: from [10.71.184.34] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm3343825c88.2.2026.10.06.17.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 17:03:44 -0700 (PDT)
Message-ID: <6d16d5fe-3165-4026-a3e1-27be256f5378@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 17:03:44 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <georgi.djakov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org, axboe@kernel.dk,
        rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
 <20261001-dramatic-hasty-pug-68ebfd@quoll>
Content-Language: en-US
From: Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
In-Reply-To: <20261001-dramatic-hasty-pug-68ebfd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5NSBTYWx0ZWRfXwrEyydTcn4fO
 S+RlQICaHiQIP1HNZ3N0VECnFVeQylGOfr+PFbhJNzIybuqcvSx5c6rQhFCbCYdjCAQcsdzo0k4
 WrwxVp8KZmC07Tc1GA5e9MpgAEAAjajvKgIl5CIqDJW0dH6qmijvyXKRTZWMBjVVjKDKNgfqQrJ
 abpXf5+9l3lzkmJIcX1q4GMRrHEOpWWPSZSXLfjUofGLFX2EgQRF4s0X9d1P+d7Kr+q9ENjkY0K
 0puQdtBi1Vgb8pL0iy33D/1A9sP3xfgFckowcerGpG03WDCH6mjOBU7X+1TqYrz0vjNFD/IgX5C
 +0k6vRJq69D6WWgVHHaTvjuKD4Z9YOeC5XR7Ma8HV4UzTbUR9CMYGRqMlaw221ywfzMkNertAxV
 2B/3GS8PbKwr7vnSN/MXk99U1Nv6UNeGBh9B8RO18D9vT0g18MeQhtfLhbU0nEt0bzpHNGiEFQF
 KL85A6pD8a1LpDtL9Sw==
X-Proofpoint-ORIG-GUID: HwEX_jiUDT95dMc4tKRv-k1JD7T5KMb8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5NSBTYWx0ZWRfXyAicZrtGi1Uj
 a1txHvHji1B1cDxoxILr4ik999LS4dCc95DrObWc0029HD/x+3iGNWAJ4Rx/B4o9gMHY63bMWaL
 SNfBjhPfxZBHNtIB1wnettwYL0oEziU=
X-Proofpoint-GUID: HwEX_jiUDT95dMc4tKRv-k1JD7T5KMb8
X-Authority-Analysis: v=2.4 cv=SJXXx+vH c=1 sm=1 tr=0 ts=6ac58c6f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=DSiY3orsq6dgR2GKpvQA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060095

On 10/1/2026 1:51 AM, Krzysztof Kozlowski wrote:
> On Wed, Sep 30, 2026 at 07:52:13AM -0700, Georgi Djakov wrote:
>> Add a zcomp backend for the Qualcomm Page Compression Engine (QPaCE) so
>> zram can expose qpace-lz4 as a selectable compression algorithm when the
>> QPaCE driver is available.
>>
>> Compress and decompress operations are handled via the QPaCE urgent
>> synchronous path: each request DMA-maps the source and destination
>> buffers, issues a blocking hardware command, and returns the result size.
>>
>> Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
>> ---
>>   drivers/block/zram/Kconfig         |  11 +++
>>   drivers/block/zram/Makefile        |   1 +
>>   drivers/block/zram/backend_qpace.c | 134 +++++++++++++++++++++++++++++
> 
> So entire qpace should go here, no? Why did you create this entire layer
> of indirection, singleton management under drivers/soc?
> 

Since the qpace driver is not specific to zram and may be utilized by 
other kernel components, it should remain independent of drivers/zram.
Consolidating everything under drivers/zram would couple the 
implementation to a single use case and reduce its reusability.

The backend_qpace implementation was intended to setup zram as a user of 
qpace and follow the structure of the zcomp frameowork. As per your 
comment in the other patches, we will check if this can be done through 
the crypto framework.

>>   drivers/block/zram/backend_qpace.h |  13 +++
>>   drivers/block/zram/zcomp.c         |  11 ++-
>>   5 files changed, 168 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/block/zram/backend_qpace.c
>>   create mode 100644 drivers/block/zram/backend_qpace.h

Thanks,
Oreoluwa
