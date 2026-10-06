Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780F63E7BA4
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 23:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791330821; cv=none; b=NTB0PZhu+xvemDFk2uUsVJuSG7q4LDA4PMeXpBo2cQs3VSwRMQlVsDuOP9+zdqEMBJWrUvbtoJ9WqAYvqNVHmbaWslDHPLWl5jTcF3rPBkT8g/uPCO7XdTHcihGoQhx2v4r25zim39c9kMlH3j9pkgBZ8iimZDcUuA3YzeECQnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791330821; c=relaxed/simple;
	bh=xf167AZzu0nvnTcAX1Xw8R4tyYv+cUzmt2UzRs7bslQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OeCT7az+1L9ivOcLIK8+qh+RIZreHiHj8XzJt33ed8T9XtlVdNIom3J1qk/KDeRuutx64/i2N1wFX6Snge3J3xcl3K3h8pBCTDUX/Zjub5Zzq4HI98licsvSJYWOzU0PCOgxdlXUJ5O28G8FfwLWhahLDcR60UJija3Ul5ohjX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkiWrAzX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+z66KUC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkiWrAzX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+z66KUC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LegeJ2389801
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 23:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IFp8HdaEfTURv3yOkfDgaxZg9EFYUbB/frsyn4UIA0o=; b=KkiWrAzXJ0cWLYsj
	DWrvvW6RLnt3U7oadPNWuvLNs4UbwqMb8BQRas/iqGSO8pxrAF8kzD78d5B/Ltuk
	oL8+9fqfkFcty1hY9Sg3iWS91ESxCx0tej2TAhoUoFuc3sHOIIl8aQ1MheovAUDh
	Ax+ArVACEAlkOwleqh9YCYjDEMAJVoRkh055+d1JSzoE82U6W5dLfau66blM+hDn
	mvaOsS6YbEjCM7ZzId1oG2s4lfaaKPqi2I8pRFwKPcnzGrBTYgNCoa1dj3G5yCow
	XcDAkZGhMgqdjV5tWVaZdkm10tuBqqhsJ6tOMhtTQB1mtx9eIq2a4CBou4P8WPmT
	ErMHKg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xfbk74g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 23:53:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510a481ae9so6564305eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 16:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791330815; x=1791935615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IFp8HdaEfTURv3yOkfDgaxZg9EFYUbB/frsyn4UIA0o=;
        b=P+z66KUCVaVdG46mJGBGEu5X1yP6CIlTB8KEhhLufX14Vq7SkRLBU2EDXVLBwUYMq8
         DT4ZlSb+O0gjvnQuJVTqr4elpS7JLns8f4erz8+90Pt3qshRCZyJLYBRU2bhj+B4lQJ+
         kAZc/fpIDQkNysIfNDXB+pYt0JQs4ucgyzROgdPkkW3S6NHMxQv/rwtmYntJsmtUj5a6
         FmgcIw0sABG9S5SPYl+cmyobYtVz7Pbq5hLlFfDtK9ZsOSTG58/mC5yJxwMNOGrVH+P8
         gFfRH+iLRUOKmVScQAd5L95o8iuYnbK17LE/7JW+krkqqovmURmRWD6ZVrr49YEvuGtz
         Mz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791330815; x=1791935615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFp8HdaEfTURv3yOkfDgaxZg9EFYUbB/frsyn4UIA0o=;
        b=WF0imKgig6eAL25r/Qk8wBM0U1aU2dkTcHx0eJCq5LZR2qqMAicsTUqKmfZZw3Njyx
         tlYV23nWRd9A7gL6i2xT5L59aM8rRqpQhGEMsx3HFKFzeM8xlT4WSwf49u0/EIDqehD5
         D5wxQh0t/gVNUtKW4NXA67xN2XmfHEjhdD9JNO2a3mQIDy+qKV+qOfNrwKfdSrLOC61e
         1oEeeVwnaKQ9k3boL4k1srgH2hhapYgVoSEWjs7t8UWhj4inaWEXm+K7CjigjqGLERDk
         2oSWWU3NwBc52xrV7uOvdHI1OktEDt0d5zy3sysmt0dOiPi4DZPN8xovppK/ZHZxVyDr
         Yzqg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ+avv/qan3756xQ19W0aRWuVw6xiGHYKI7Kbaalp6/hmTeq2qmKOkQiqNYrkOcRg5sgG5B1gYCnRVOTdS@vger.kernel.org
X-Gm-Message-State: AFq9FYIBwp1I9KbKgabnS2bOV1a4bHDOZsbBzliYb+bAFjZOZD/FOk1O
	sdd/ea4D1cNOrQ9Ry7DQMvnLfxvB7BVRfs96bMqXO4o7WUps6kL46dBkjqYzUG3mE/PEaYtyDPj
	c2K96LE9TtSTi1HvAw27vaQ4uggHdMfxnjvkfctJ8v0oQ875jiplN+EngDuETWsLRuFaa
X-Gm-Gg: AYBFou243iqc84L05L7exCFN2TSeB5JY8Ezayr2LQBrLchvPFD8VIzCPkyfKbKbcBqI
	PcG8E2mwirZ3bQ2V3G0yYaNvG9NzPg/HS0WKya5/Qgkjw7ROYDyjlKk4yPsmohE3pGrE/R8tSyW
	fWCDhYlMjGHICIvjnHix4kVn2GwfXzcEnIfpDXYoNzodCgaO/fkV9NOVlS1US5Oq9E+u4iUttAP
	IcSimEwjvYaN4ISUoCs1Lh7izqr6TpjTwKwOaWcfNG+kf7WZJ9QG5u9NUkgxn+kxa+nEJ2NZe7Q
	MGhEPzTwJXgM71f6qXFZS/FJesc+dI4xUBgwvnrP7XNykXp1y3IeSwXFFronkkzDpJrV2+DZm6D
	uI234VW24KUxthtYU2SU3lZnNSSdyu17cT1F+la/o5/Sxv5rMYQfpeWYG1g0l494=
X-Received: by 2002:a05:7300:e5cb:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3515d86f096mr371878eec.3.1791330815319;
        Tue, 06 Oct 2026 16:53:35 -0700 (PDT)
X-Received: by 2002:a05:7300:e5cb:b0:34b:f456:25ce with SMTP id 5a478bee46e88-3515d86f096mr371852eec.3.1791330814702;
        Tue, 06 Oct 2026 16:53:34 -0700 (PDT)
Received: from [10.71.184.34] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afa61e8sm1972503eec.22.2026.10.06.16.53.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 16:53:34 -0700 (PDT)
Message-ID: <4ed3f09f-74fc-4f07-8897-5c773fbde0b2@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 16:53:33 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
        Georgi Djakov <georgi.djakov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, axboe@kernel.dk, rostedt@goodmis.org,
        mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, djakov@kernel.org
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
 <ar3yt8Kl3WUV93lP@google.com>
Content-Language: en-US
From: Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
In-Reply-To: <ar3yt8Kl3WUV93lP@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D8TSufRj c=1 sm=1 tr=0 ts=6ac58a01 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=9kMCAbyDuj7LhItxiaIA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: RwmFMd2ahzaiylnvHA1cNvekUBpT1JUq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5NSBTYWx0ZWRfXwI1f1KAWwa6T
 z2auTGpz7uSLkUuRdEukmkE8+pFRxhwXtulGk7NSQaac5EcqpKYQx3vBlPfEmUGirsotnkalxvg
 s2wno+M/NJIdWJAOS5A7ZNIzR/J0Gt4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5NSBTYWx0ZWRfXwz4KNIoA7SB3
 VZgC6sKCWK6aqnK+pLf/Rh0x8aJE0KjxKBJnsoOBQg8sPdxA0uHnKLv2v8znJnKHpptX6EZX7vl
 3oMMsE1RIfF2EPCFNPXewtEB0ypgGqDGnbJK3lr9jY7ZUj7EJ+vshvXVBDnlqYL4zLtgytJFujp
 ZW6p7f06C5uWDdKrYWwmO6vHHZQ1/y4H+OMugDq9uF2rIGMUepu94pyeCESaIYJpif+kqHV+qYu
 G/OU7twKI54mqxVGO+cJ+yaJTGrt6awHv9mCtvBnpgXCRaeXguNrTz9hlV/73SZc9AEWCkXoDgM
 f0H+cxLKOIU3azdYqzOFwqFkVuM7r7puPIwoBxMgTvwV1GKKlYom3+NGNnGIa3HvWZ+bGqr7S5k
 H0cDZQ2XlCub5pMR5Xwzz+cofTXyZzCLbo6G8MRu+dec5NGnQMj5kP/RFzoZFRir8wb3kXDwuGz
 7yBMKED/gJH7G0i2Qpg==
X-Proofpoint-ORIG-GUID: RwmFMd2ahzaiylnvHA1cNvekUBpT1JUq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060095

On 9/30/2026 10:43 PM, Sergey Senozhatsky wrote:
> On (26/09/30 07:52), Georgi Djakov wrote:
> [..]
>> @@ -80,10 +87,10 @@ static const struct zcomp_ops *lookup_backend_ops(const char *comp)
>>   
>>   	while (backends[i]) {
>>   		if (sysfs_streq(comp, backends[i]->name))
>> -			break;
>> +			return backends[i];
>>   		i++;
>>   	}
>> -	return backends[i];
>> +	return NULL;
>>   }
> 
> This hunk looks unrelated to the patch in question.
ACK. Will remove this.

Thanks,
Oreoluwa
