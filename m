Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459347;
	b=EJPDMmFLZ186+3m23+jzycPyWvv8lwwZdrx/Aq5EaF0QN3RUoQ+oKOEBcEZpKQGVieV6
	 u2Qjg7grWQ4SdmPNgz3N7VimP/emGMrPIVXdHSxINoCmr0/zu91fQc8Xi+oLqRciof0OK
	 5/t5VPr4DpfLfzTpB0t5nyhXS8X8zZHIP7y5offQbowvm/rmXt2FIqAIlEHt1QY7t3/94
	 t1CQZAgvgS3XQZ21OsuN0Zpy3wjQncSpDRLiYTJK68yPI24a+dsdsa9ZqpMaM2N7DoJED
	 Fe1Xt5ayFD+J5RrL4Akx+z9bHpKsrnZ80yVIsVAWeUtgDdeNMatprarx8J/6KzLCLDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L2Y93dKIpsxu8PAQQHZSdaxuk248sFchZIYLxYLCnhI=;
	b=tp2aTzC5hk6Mx6yKbplMMykkYHtoVwzhUWgGckqtoMZiYAxPgAq3zSHT6OGYkjBXr/zA
	 FoX/aMYbYSkXVER8kM3HWYz+2awPqqmowoQsYO7UojodhIrzU1EzsjijVcYIq2WqACf+k
	 GL9uKkj5XXjA8LaG5WUJmvTDA5FU5RmUGvup3c6zOkhDfU3gqlh2d17w3JEsnmCP1az3h
	 WsyVWytlLAQEs0VN/2zxfaTShWSouAIjPWEXbOICcFE6Pk+BaX8eJPwS+Ho/+FKcGzIfC
	 a2vfJJSENw2hfe3lLLcrYTw+GsuFmh863Ofb0oJvfeBUGDiaGX1XlQg9uIbg5ArAHtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QiJ3W1z8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WvzGux6r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDE8606A335
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DDE8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QiJ3W1z8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WvzGux6r
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGl7I3730160
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L2Y93dKIpsxu8PAQQHZSdaxuk248sFchZIYLxYLCnhI=; b=QiJ3W1z8ipaC9yb8
	z+jPkEFJl4FmS5tqfd3vTQH6B3QSy29PgKQRCRHd3WAeHcLDi5MSMBuwO+CvFEOW
	35HUh3WXLHHKz1lKqXVZBGTbHkvhnTFV/R2OV7wSVKegsGThWRRmT1QV8UNF1jxo
	Maq/haq3HHMtwjcUNEJL8aFwe3xEjjueD44rfOmI6gwkP7zOX9PIcn08hLhWixls
	DGPb+Lk2yRu4vrBwnBpCFy8P1FZ4mqZ4uNsZA6aJe9XWwarO7rdpgbuYM1TZyzsq
	JhgMQvm+MCafXx85m8OJT24e0OMD4q+ia2x2PHs1mvfpZcLvxeanC6tAsko85HDj
	2ibgnA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd2yg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:42:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-945e8a244bfso32625685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795459345; x=1796064145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L2Y93dKIpsxu8PAQQHZSdaxuk248sFchZIYLxYLCnhI=;
        b=WvzGux6rVc7dY4TPJG2VbBsKYQYLhR3BksyS/j1G3HiexES29/ZglX3+jAlGWFUGJj
         uvQmcdCsxWMJwj9HB8jPbMTYAMy5q/odrvSwboxMaRlAoMexOTAuFcZnez+hWa2SfGde
         XjgaXmBO2lS9bfeuQEv7Rl/fqHmTR7XAU7Dk44QPtgMhJZtsb74e2aRg8fzcEeRAN61S
         88hVBLHOINVICGA504tbeMjzt62jA9jTtFQ4UE0aWO2mSZoUDFHxtp2djtXiaPq6H55T
         rUwBl6mQVUl85CI2UfWfz4ztNMp1gL70rpPww7+b6fNBYgU6yJhTBwgy1bu/3TZIxNSs
         L6QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459345; x=1796064145;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2Y93dKIpsxu8PAQQHZSdaxuk248sFchZIYLxYLCnhI=;
        b=KYAez4cw/0ifOwR/ATQqhp7tE+Qy3AQnG4P5akPdpDipmD6qwdLI04Ru8PMHi4eiig
         1oGPHC4xdt4uiq8STQyE5CS+JqV3p1rc3Dq5930XXHZ+9YMI+Zq6RJt0x7NJ5tlgqf+c
         4RYmOQ0kEDEAnDU8Exkrpc1tKDQfj96WnrLmHm7wdMq14JiwbXfhHFX36NJYnWD6Kadx
         GXYtoBkp3zvL49SNtq59i08B9yOVAAxLeAD5tdznyjAWAY0MG/jJm3IdJfWovqy1l3WF
         3/Zb6zEhDQk2MRf0K+t/KvxD/weBeJMdD5JCC/P8sJOk9ZAWUXF0lPRl9fkRVLhsI6tO
         bjuA==
X-Forwarded-Encrypted: i=1; AL+hErGm5mElHPbyRrbyrKrUOhoL2JlJzajQn0BfIsoRrodqR4tdV0DJNretv677mXi/Hcf2kfVW2H0CjtkxdGJY@vger.kernel.org
X-Gm-Message-State: APuU4Z+AhPFz54MdGpi/HJcjVc0lqYwsOG+rBBk3mtZiQxfYDA+ekw8Z
	IZQ9TVruDtWyDArK6Wd/PLrezFt+dCP/WK6B6RHO3rMfSLjoIWLYXMOEwpoXtwxJtrwheaWnkyQ
	iEObeUZAXG5wU+XP2ui25dMiA2hlUDB7bUI4LBtrn2igFsUSsQDzLPj5B3VycHy4GLkpS
X-Gm-Gg: AZFdTZfSi66Dtnx36DDH0EHgNh1ldS/IZ9I01QnI84EyU3MYYjAZze9/a8EYmNeHEt7
	BgakoRxKh95jMJtr3WChvYgt0hzWFpuJJBylUeEn3JXitpzRh5nW9N0cRNiGG8DfijKbmPdi1A/
	BLjy/NoAanxhb26ig9y9HyelVC0QbTs26v7ifpb4Pm0HwThDOUTpCEQrUPfXO0z56nf3LJ3ykkx
	/H1vTM8VB1YLyqVl43NbUpWA/LhZqiIIJWXSL7Hj6gxEK97pokcG1d5KnQJ3Aao9rI7WoyrWhYU
	Iu6tSazgDemIBNna9YZw4cH4QOGCX1q8daZc091t2MH1K8G8fGU741DHi+K7TWegoNg52aROv8e
	Vsaew7VExaJFKYe4m4fW7/gh07zZ6iAYRprJAuwzbb0jt4HGJ/iBOWig8lA4ipbBRrrr1LVk=
X-Received: by 2002:a05:620a:a78d:b0:945:c5b3:6356 with SMTP id af79cd13be357-949ba8aecbfmr2043697985a.2.1795459345437;
        Mon, 23 Nov 2026 10:42:25 -0800 (PST)
X-Received: by 2002:a05:620a:a78d:b0:945:c5b3:6356 with SMTP id af79cd13be357-949ba8aecbfmr2043694685a.2.1795459344926;
        Mon, 23 Nov 2026 10:42:24 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm434564566b.80.2026.11.23.10.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:42:24 -0800 (PST)
Message-ID: <b11d2e6b-8802-4450-8eb1-7984034d5c4e@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 19:42:22 +0100
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
Subject: Re: [PATCH v2] interconnect: qcom: bcm-voter: Clear the ALC vote left
 by the bootloader
To: Michael Auer <mick@yoxcu.de>, Georgi Djakov <djakov@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Ard Biesheuvel
 <ardb@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261120122152.198114-1-mick@yoxcu.de>
 <6e30e65c-3fa7-409c-90da-2740f7bf0a24@yoxcu.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6e30e65c-3fa7-409c-90da-2740f7bf0a24@yoxcu.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5KTnsXKxo3TdEkaBVplYcfaLk56lY9-H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfX/zIbWo9zkGj7
 GLR1M3G+9VQqqgGJO3yNL3xGBrbIOKfWxier/XYR5NWmfvQyOrdV0w1GEgRMes8mGwxSieZdBYP
 tiorwPKcxgqJt1S8spA9mUBghuP/PxzBcyMP94xN64sIJZODdOr6KfkRP2ZLYhRRCQ2KHy5qRM7
 X3B+hePiQ8jUX2sPHvFcZl6FEf/l/4HKBxI/L7md7/htnnMFwQanWKFnYgotV5Ob5o0X/4vbC/A
 rVPUBnfA0wRKf759AXDOxZnvOae86UoZ0LQkL3BhFRKPufxXGZTuunw57uNH/qs6PIZZjHgv6vo
 IrCSVH+x0oK5huhsDDo9/e5eYbOrJMkB7uG2Y2Ve6uiEQUdIqYYhWNYbydVbM9LGLvJ6/e1gr4i
 ghIp5ORA0Nx7P63I4qv+jtikQwf04Vw/UlLObmeXwOrpWRJjHd2tq4O7qnKgGUpwqvhmilgkQzJ
 6EC00zv+5bJKrWDAsaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NCBTYWx0ZWRfX4MTk6MLTrMnX
 hvWcltPdUo0K2FCzWBNKqMs53qsUuBkcfjLYx/8ChloGERh6qfosTMAQRNnsm2eBpx5yK9a+Hr8
 Nx8uwQbvgjOnjHGvuBBf24Vle3TGraE=
X-Proofpoint-GUID: 5KTnsXKxo3TdEkaBVplYcfaLk56lY9-H
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b048912 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=BCpp76bnSYiX9KVaSk0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230074

On 11/20/26 10:41 PM, Michael Auer wrote:
> Hi,
> 
> A sashiko review of this patch found that the wake and sleep writes
> never reach the hardware. rpmh only caches them, the (0, 0) wake write
> replaces the (12, 0) wake value from the active-only write, and
> rpmh_flush() skips entries with equal sleep and wake values.
> 
> That matches the OnePlus 6: the rpmh cache has ALC at sleep 0 and
> wake 0, and the APPS DRV vote read back after a night with 139
> suspends is still 0x20030000, so (12, 0). What I tested is the
> active-only (12, 0) vote alone, held through suspend, and with it the
> SoC reaches CX collapse.

I was hoping you would test my suggestion before sending it out..

> Konrad, did you mean ALC to drop to (0, 0) in sleep? Then the wake
> write has to go, so that rpmh_flush() programs both sets. I can test
> that. If the active vote is enough, I would drop the wake and sleep
> writes in v3, so the code does what was tested.

My agent suggests that changing this to use rpmh_write_batch() as
these aren't cached and should achieve the desired outcome, please
explore that

Konrad
