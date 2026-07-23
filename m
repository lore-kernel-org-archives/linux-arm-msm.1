Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E7D331EC0
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801850; cv=none; b=OpMSI9ex1XIXrm5rjbQMWVCbwq7FtKPn+8OowjpCi0qDrKegQNZssW/awLWjPzZmOQvGu71/HMgcd0Rzl8QPvmapKclwn3y+CC4zDiqs5jx7pQpP5aGRBfODP5vhV3qjFq74vSGj1dp/zlNpGdtjr5g+71xFpRLsHCVlNoVlCvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801850; c=relaxed/simple;
	bh=mDyxfx/NZz9oNnZFCPreKorg39pfBefeKdll9onCsN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MhUlFASzQXzAtk+72HS9O0RzRfVwQHmM805sgcxEdLHJqS3QEXzH8p/lM3tjymZFR91BqTvhFjweAqvly1iRKDzhTFIxs22B+TX48lQyRgEKB9g6TGYTBapb9mkRgmdQW+9O1yYdZWlafLaeDh3rW5kXi7gPdNF68Aex7aRqYhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UdSRW8kq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MNzYJELU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UdSRW8kq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MNzYJELU"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qX2H467201
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IzqDP9svjE918lug8DfM2SuGbpL5ftEU4aAYCmv2ZJY=; b=UdSRW8kqefYachFF
	IV9dIp0qf3FYQToOala+OeCf+onFCRSUlJ5m/XLXYV5ewf7tJSnhJfq/y67tJXOF
	wa8YYhjuvkXW/xnvyVvSUrGA25N9s+RZXAjoQ8AVC1DQtI3I3PufosAMj/SXKlga
	p5cWJ8WTFYWjBTYlyWz1gcuhwYgtZnSmogzMy+h/RJS7U2V6fFWWicBHqKgaWBCc
	7S99MKBEB2/7vIUif2yqSTF2gKdBO3Sw7JIkocPzkKqqU1EBihIXwOpgsApXZ6I1
	g3rZx8/esa5F7bi/pfWiFcnoOJoamcfwyy7qYVQVbN91Nd4Gz1gIYBcvJpJK+lN2
	OIpq5Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xuhrs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:17:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf6acd760cso8006375ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784801836; x=1785406636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IzqDP9svjE918lug8DfM2SuGbpL5ftEU4aAYCmv2ZJY=;
        b=MNzYJELUZwVpTKje6CyyjK2TuQpT9fLyN7jgF4WuvxZG1ucSFbwqmQFdpaGazjXuaM
         A8wsj9zZMTtyP/gj2F88FmD2mabzhbSmC43AlI5+rZ5yUuPDyy5+VChYKkShoC8XLm/w
         Gr6ezY9KbUeoU09UKtvStMzRandlE9/2VbHFcmqyQ0jISj2eXlAO6ckzC9vYx9/rJUom
         rLsYSyvbX8lB3N5qP/bvLZaiBYHM0lwVKx0ZlGkstp+fxDGQq5iGYqx+VjN1MWyzRpyb
         i/7pkql+VYO5P0J012mh20UlEi2OfoRu1JlILwX8CbzL8vwzsY11MWT0kPBN4nXBRLd8
         kZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801836; x=1785406636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IzqDP9svjE918lug8DfM2SuGbpL5ftEU4aAYCmv2ZJY=;
        b=tEpL2QanFyM6rRizyPNZ8XXcqZz8PiWmCHWVGQgvFrOykQhJfobzFMUHidwHgAOUBZ
         ewxL1xXE9Eloz30BfZyzh6L0SrUEeHVAOtdVDKHcvNror48sngjumu5E8Goc+SabFTYj
         rU1YptlARGkzg1rLB/jrcmtXIra0f8kvDrZCrOale05W9rNXFzr7kmC5geVfNaAMqo3S
         g1F40epvxNrslakpeUGBzyUuIuUJO3q2TnP5yxDWI3FcZ+dKWA6HYec8yqjkiV9PUErQ
         QKbPJ3vWzTLu++asOc6+IPVRjVyxPvL/uwY7H+65rqIwM92K/pQSuubmQHplAtjLE0Hv
         PvTA==
X-Forwarded-Encrypted: i=1; AHgh+Rpo+IWtyFj+8PAJ7Av/6ZhWLXBWWO9O4i6Wccy6YE0yNcjIvQpMppBkluDQ/Xgi/Z528c44jI8b6/dGgTGp@vger.kernel.org
X-Gm-Message-State: AOJu0YyPocLmdEeCIuOl27OzIi1+e0ChWdnE5+D6fP3/w/3QzRBG8B+P
	5Ee/140BSSvMIWuAwD9BqpfHXMrC+EBjOs2pFMANi+O7DBskg1BHfMd1x5QRgF6AljhgK11D2fC
	004XX8VbIS22C++FffxIazmKqsDZikU2g4+xCJOJH80Bwbqgs0CS0kuAs1lXrVIM5h5cC
X-Gm-Gg: AR+sD11yR+CdXe1ZRlITxgkJbXMY0y8frLjTGrudkUOP2k6w2fO432kqJEkpRMbT6hL
	dwNARZKnVOIFjEom90xYtBROEy+oTdYJkHvLSs3m2vP5bjW9yjVpApj4fGq+GQpWqrjxs8gWHc2
	apMvDizmR6xROzy8m5pGcT/Uml8x5LedDFmoRTwyZpCdSQkqrsAU8eAAsE6bZz58+pIwbq/Scye
	5Eg35Jj/rri1poknAyJTbtWTgo31hlQch5RqI4gqlLxiX2KXtbDr/gAucyHV8mcP9brXJKznKfy
	enuPZTYxe0bH/yUh3PmVM/Ykm3+jaoEFPiQ1+86pfkuoIX+J32XBRHsYsNNJOZR/xpPmqiXfDMW
	4jQN4OtfO0lUhU6PswrR4ObcDdTVLCzsaJC0=
X-Received: by 2002:a17:903:46c6:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2cfa6a51b56mr29011855ad.2.1784801835682;
        Thu, 23 Jul 2026 03:17:15 -0700 (PDT)
X-Received: by 2002:a17:903:46c6:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2cfa6a51b56mr29011245ad.2.1784801835131;
        Thu, 23 Jul 2026 03:17:15 -0700 (PDT)
Received: from [10.217.219.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f3b7c9dsm30151915ad.83.2026.07.23.03.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 03:17:14 -0700 (PDT)
Message-ID: <933d864d-f0c2-4727-a01d-f564eb854d23@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 15:47:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] i2c: qcom-geni: Handle runtime PM disabled state
 during early resume
To: Praveen Talari <praveen.talari@oss.qualcomm.com>, Frank.Li@kernel.org,
        viken.dadhaniya@oss.qualcomm.com, andi.shyti@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, zhengxingda@iscas.ac.cn,
        kees@kernel.org, quic_jseerapu@quicinc.com,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        Aniket Randive <aniketrandive@oss.qualcomm.com>
References: <20260709134623.1724212-1-mukesh.savaliya@oss.qualcomm.com>
 <20260709134623.1724212-2-mukesh.savaliya@oss.qualcomm.com>
 <9cf5b5ab-c418-4b0d-8b2f-b888a64db0f0@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <9cf5b5ab-c418-4b0d-8b2f-b888a64db0f0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: L7oMmtakys6McPiH1hu2V3WrjW1x0G-d
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMSBTYWx0ZWRfXzSqibzm5lGnT
 5kKlWeqiHbQCYmAFPiaugIjuRhBkgGZ2f4N6RBglQ2hLthCXP3GQNImJ0ZocE88tFlq8rfsn3dX
 zT2lD9tmuwmNLVu6qQk5xSELWxeS4sI=
X-Proofpoint-GUID: L7oMmtakys6McPiH1hu2V3WrjW1x0G-d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMSBTYWx0ZWRfXyCSYE6ivBYsf
 r6zwBHie3LhtbgTOwRLQVvwdKN96e0VxDU5T8U/HMH6vrYzhNPTrMSjkQAApiNTy8yv4Dz9HtaH
 UzKI4h5SXxfAbNgndUfCBO994gOSGVdAywXrFsO+3YIJ3SwOj0/Lcrt+qsjK/zKtwdYnj0yoHSf
 XCKgoq39txudvHRwm4RvmEufmiul8mK3hVk6XEsKwdooK1ijlvWodBmiJ1uieoePnzL9m34Vuj2
 qvQj9w8e+7BNgFpJjzjDVhntLIqqwMgFFWhboP8weG61fTw5Z4SiyjVUi64b6hQ4Fo8fTprgL+q
 X44gyAjU5e2yumrjc06qrXumPKpTLB7QtdahJSJDEcsXOMXGXxyq/YKkBSOgrJfg9osSsXW4j0g
 TswoWUb2yIx0JcEiDwHAfXzozEO6C8Fmt/jjmH7TvbefE5xh31kAalHsVEyfOocDFV0iXIsZSrL
 lQqp9XYftC2I9m4vZBw==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a61ea38 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7hCvE-jUh320BGmwNlAA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230101

Hi Praveen,

On 7/23/2026 3:32 PM, Praveen Talari wrote:
> Hi Mukesh
> 
[...]

>> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
>> index 96dbf04138be..4bc00922cd97 100644
>> --- a/drivers/i2c/busses/i2c-qcom-geni.c
>> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
>> @@ -917,6 +917,10 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>>   	gi2c->err = 0;
>>   	reinit_completion(&gi2c->done);
>>   	ret = pm_runtime_get_sync(gi2c->se.dev);
>> +	if (ret == -EACCES) {
>> +		dev_warn(gi2c->se.dev, "Runtime PM is disabled:%d\n", ret);
>> +		ret = 0;
> 
> Here it is clear that pm_runtime_get_sync() is returning -EACCES from 
> the runtime PM framework,
> 
> which indicates that the request was rejected before the runtime resume 
> path could enable any resources.
> 
>  From the rpm_resume() implementation:
> 
> static int rpm_resume(struct device *dev, int rpmflags) __releases(&dev- 
>  >power.lock) __acquires(&dev->power.lock) { [...] repeat: if (dev- 
>  >power.runtime_error) { retval = -EINVAL; } else if (dev- 
>  >power.disable_depth > 0) { [...] else retval = -EACCES; } if (retval) 
> goto out; [...] out: if (parent && !dev->power.irq_safe) 
> { spin_unlock_irq(&dev->power.lock); pm_runtime_put(parent); 
> spin_lock_irq(&dev->power.lock); } trace_rpm_return_int(dev, _THIS_IP_, 
> retval); return retval; }
> 
> The -EACCES error is returned when runtime PM is disabled (disable_depth 
>  > 0),
> 
> causing the function to exit without invoking the device's runtime 
> resume callback.
> 
> As a result, no resource enablement is performed by the PM framework.
> 
> 
> In your change, the error is effectively converted to ret = 0 and 
> execution continues.
> 
> How can we guarantee that the required resources have been enabled in 
> this scenario?
> 
> More importantly, where are those resources expected to be enabled if 
> the runtime PM resume path was never executed?
> 

This was answered in V6 already on 7/3 exactly at same place.
Pasting below.

==
 > Why we are checking specific error code here? Why can't we use the 
below error check directly?
 > if get sync itself is failed with pm runtime disabled then why we are 
going ahead by making ret = 0 here? How you will make sure resources are 
enabled?

This reason is also mentioned in the commit log. we surely get -EACCESS 
as runtime PM is disabled during no_irq resume phase. We still need to 
serve the transfer, hence we need to override it.

Review geni_i2c_resume_noirq() to know what all we do to enable 
resources. That's guaranteed and tested with system suspend/resume test 
back to back and PCIe could do i2c transfer successfully.
==
> 
> Thanks,
> 
> Praveen Talari
> 
Do not keep this thanks/regards here. only leave the comments.

>> +	}
[...]
