Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788002;
	b=jMi4QC4+nn7qTOKEfgo+oYK71iOMmpm2DBz3GNmBAxKuQPTUBhS9t8wn3OOxS++VgiD+
	 voqbA7lQXSa9epnhLmZcOIsbGjmcX4HOwZvWwQ4ETLFJmhe7EVupHWceTa9Xm7WecMRJR
	 w3P1dIHFGYUz/EkP3DO5Hdel6VeoTOTfjajI8flhsH17vNPgmvIm3F48CRe4IZnqadoSZ
	 yYubyApM7l366mJpd/1OIPNOtqKLsUPngRLgn5AazQNkdHk+q/RdN2LwaeO8nstErNDBC
	 2QvJHOA23kbt5qahJRlf2jW18QpcgqBCQ1RKzi5JUb89NGGzqA4IkZCc39hK2l/YaNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788002;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TVJ7FGwJvzojmK8u57f7Bta3j/u3dqWpXMiIY6IlGEU=;
	b=zCRauzUTMxjMbz8ZdSdTaJc2cZnK5x3UI1+4tMOoQqif4M/U/YX1vHcEz8WcXz2cM3kV
	 2ARKIG4s4J/SmlREs6AKgo4rtxXwqaMBCkxDzO25qZGbjOg6u9cthjv6n17DnLfIWidq4
	 wzI30JY4xvbuS4PKnkdLEn6pVh0R8cbPJPuZzX0no30UwdZJDtxD2IEnGzH635AHYz21x
	 Hzu4tPGh7iPtfay9D22tLDcWgfYEghMHYrQu+4+WxAprzDrQ7IGLZGxuQtYpP+Pea5BQh
	 SYDaYEL8cwsL5u2g344dyHTrMdrrX4hk5SiCL0oH0VTPOY8dqb5peusfLw6VcV2+LwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m17uSs+h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ed7OU8m7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26290606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26290606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m17uSs+h;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ed7OU8m7
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARDtuJ0454437
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TVJ7FGwJvzojmK8u57f7Bta3j/u3dqWpXMiIY6IlGEU=; b=m17uSs+hA0uwBeDk
	n3jh1uZfvCrEpejAAyvlQ63wlxqQ5XKm8xdCHnd3XFmt45enERsJ99BwC/IlJMw2
	pylSEyf1DibOMz5GKQQC+Dkim/U06eg8hyFKM0gswpsYhSQX8yGmXlXrEOjclq2F
	YJ+InFFuUXy00Dv2ky05IsODF1m9ANOuFp/GJ0Y+nbuCzcvB73BWHrmxTj6V2wm2
	eWcxnecgKD/gP2bHYg5VRVBq4zeKgY7uuGGIXLSBuvdPSxWoFDtZzHkjymxnYnHr
	N8hkQxtCGGO76ws/8H30acpnjbHfLNzaFMMK6LT5eim115BRu/gCIkXwDvWBXKXs
	zYTDZg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6sqm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:59:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386ad819860so7634676eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795787999; x=1796392799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TVJ7FGwJvzojmK8u57f7Bta3j/u3dqWpXMiIY6IlGEU=;
        b=Ed7OU8m7Ok1Ap60daYNVpX+Pvgb8EiMGxgN9mEvEBT6vdEsrNIDCNZlqKp3XIA90O9
         n0qAh1HDWwXp0RKIxA5h5VimOg1VKmqJh0uu29uOWvpER/NJaeRcTdQX/oit/ouQ7U+D
         tdBTYRVc61Ut1puD5INnbhWfOs/oL/uLbndPOCrogbNKmLfMz4LtAxm1HJ/l8TcGsKng
         /HvSfc4Wz0B5aBOG+fMko+qH/xZ42+C5Rr2ki/qlmE7Vv3uOVhmpIFuZlpe2SRNRX8PZ
         xd5g8vjenagAQuqYL0hhI8cG6dWOCzsWQH00k4VNnYdcERtMGs4sKMnlo+K+XD2nBvz5
         Rm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787999; x=1796392799;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TVJ7FGwJvzojmK8u57f7Bta3j/u3dqWpXMiIY6IlGEU=;
        b=UmxzH373B8iUq0EQxtd0Fyd6B1MmjqxRD7NLUGsgB7sbkv9IZ6juqJfq+kboRzaMYX
         onBgrrSesiNLx2/K/0O/DfbEEJ+LtWWtuLOssWruRPfohbXswO7rVqbHqQjrJNjvh7CG
         0d3PNpZxuUqevI2shVI4eWjKGT4iHIs/E3paEpr+cvcFKuT7tH9GJY8NmnevWCXZkMiV
         DkO3UUp/+f7Ln4JZOyVKAPrAY66DDYqVBx6lcxi5D7qGYn+B/SuFE24ohbvM67rDqzOD
         jJPsIpubaOszcEIeVuq7eCg5ED+az/v6pFeGYUu9/74zBCN55hqavemkCsaGQo1EdmjQ
         sWAA==
X-Forwarded-Encrypted: i=1; AL+hErH9camVniAU6rsQJr80Yo13cRrwjIzOzN87AOaMA+Vz/TX2SOmlda4i1o+4ZcF7SNRRCd4GwGA7MU7LXvai@vger.kernel.org
X-Gm-Message-State: APuU4Z/kQPiE3ipvGyersiLJBTVkDy1F8SxONbMgP6YP1QmfvJiwT4ux
	+k9bHTSzSE36xfSReTx4Orzv+B7GDk5OlvguQVSZ92SNPXz8MInBlaNqVGucc/HICftDjQh190X
	P7hY2p2Kv0hGmG3CJJaranHNIgwsmBNEIfVcGTWV/LRXpw4NwU4aH6ioyjICrqLaD8t98
X-Gm-Gg: AZFdTZeQsKxCExvukh9j5If02KvUccfBMa418tq40kdMYxv3v2T49yIg7CAHrBTQo69
	nDKVC4Tq9+WdlrQJu7Y5ACsTGC3Go8KP7UdKziPD3WVU4PBi575GVQ4rhuiHr6Lvj/qomQvDAxP
	j8CP+zA50dLkfbmcq1tKbSMorAWItAcTavnAqUbsdYf/6szGuZQMXvGblMn+7wUJ9xU8m6VWEXG
	aFmA7C/Ji3GaQApGFJ6LmlhKva02vtWZUy+TMxSmJ4hHQpCJtvNCFOT8l8MExWgtNfq3dyVe0Cq
	6BwwBw8Iu2QMKG2ReTME2L3TiS+j05nka4hMl3NcRJGhvXz8z9XFXV2NO4HUE4rq/+j7qnOS6w1
	hB38wzMkpUYED9zQQh/kV4wvVqPjJr/0l3yNbZKSFWC+k2a/arqMzb6oRd2JEXDRQI477R9/z1Z
	EcKhp/
X-Received: by 2002:a05:7301:fe91:b0:386:e392:5031 with SMTP id 5a478bee46e88-386e3925531mr4757469eec.14.1795787998824;
        Fri, 27 Nov 2026 05:59:58 -0800 (PST)
X-Received: by 2002:a05:7301:fe91:b0:386:e392:5031 with SMTP id 5a478bee46e88-386e3925531mr4757444eec.14.1795787998322;
        Fri, 27 Nov 2026 05:59:58 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm64939202eec.8.2026.11.27.05.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:59:58 -0800 (PST)
Message-ID: <72ae56fc-41ea-4088-8daf-3d9535de97f9@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:29:49 +0530
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
Subject: Re: [PATCH v3 3/3] media: qcom: iris: Skip register access in IRQ
 handler after power-off
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261120-fix-disable-irq-safely-v3-0-82f9561394cb@oss.qualcomm.com>
 <20261120-fix-disable-irq-safely-v3-3-82f9561394cb@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261120-fix-disable-irq-safely-v3-3-82f9561394cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xp6AMFLaM-11HMfcbjPqpwrhmp7qICGM
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b098cdf cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EUGQh4eoQUa4RnJZeMsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX6UyNE5ho/n61
 xRPdtoFGn5DCkA9yXgOZJPhfwrvJq1tX1nabcWY/RujnuV4UgaICsWnfja9mutvdy4Wzpl+h0iJ
 cTe0t5hGOdkfA9IP6eCBNJQSaaVyjBM=
X-Proofpoint-GUID: xp6AMFLaM-11HMfcbjPqpwrhmp7qICGM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NSBTYWx0ZWRfX8mC610YGJl/N
 C/RZVFDxsdLuMI+jO2VoVXYVOb2kPKsW8rrFZbgjTbWG+UzZ3pP2dTB1y2o9XkaHfRPCMVhY9gL
 Q2nK32StXDn3WehMtE60UTfLTjAVLbkznAO5b0FtC/8BdDpKkDTTYAaP2FFBoMPOayMSKlZjd5V
 R/dfO6u9HJZEz4Au4W8M+yTK6TSjZ0fSkU7x2JslqoMU80wmd5eHnkdG7Kljek/Hsiu6aoyRUWh
 iLu7k0Hi3Z8610TZqtiNeRUNjAdbFAGMsr6V2Adb7j9ySLRoQQnBVHU59q2GZfV8lD8R9izKhDW
 aBKyXsy4Wzl+kuOXLwzvlYYdq41rESOKXYVLaFGsbg5WrtbTsWvUcFQvV7X52iNHIp+AFiGdEaA
 5NfVo2rX8FeZJ9T7hP3WPZhcIuqu0MMkXj1JHA3vRD8gXwlCwWxcGSeAEDuYbdTqMX3geSHSRDT
 i4SnxP2CoQGzLJ2alVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270055


On 11/20/2026 1:12 PM, Vishnu Reddy wrote:
> The threaded IRQ handler reads and clears the interrupt registers
> under core->lock. Power-off disables the IRQ without waiting for a
> queued handler. If the handler is woken and queued around the same
> time power-off is entered, it runs after the VPU is powered down and
> accesses the registers of powered-off hardware.
> 
> disable_irq() cannot be used to wait for the handler. The caller of
> power-off holds core->lock and blocks in disable_irq() waiting for the
> handler, while the handler blocks waiting for core->lock.
> 
> Track the power state in core->powered, which power-on and power-off
> change under core->lock. The handler checks it after taking the lock
> and returns without touching the hardware when the VPU is off.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.h       | 2 ++
>   drivers/media/platform/qcom/iris/iris_hfi_common.c | 6 ++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 ++
>   3 files changed, 10 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
