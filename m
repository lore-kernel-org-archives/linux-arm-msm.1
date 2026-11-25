Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599878;
	b=vQG4fh9ND7p6dSpcgsaQ3EwcaWer43ZMHLSS2iSp3rtOs+qyaA699YZkH42Opu3z0tJ0
	 s5mvxR+xXEnacfq181GybDFbf+8guD8Oo/ABztRSw5Ytlhmj5Eu43g1NAWdeZRbfEdeJZ
	 xAnMitdRYtKImF9LieGo4SyhWKPX95R8PQxVDE6jAGfFgsDevQ0B8lGXiTNAZrxN/3Pwt
	 dteqNMzdCheSeDH0giZqH0ROZg3oB7k/7OpXxqzIPi7xSEeo5pvpLwloMqhjbArCeYkcr
	 OWCFcUW7AfJHUAIeWsfl2wSxlXWaGXJaI2uHfJx/42LVPc8R3ZueL2Z+ihq1/uFF2bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UQZzaGWubSgesvq7cIDLQi22HHt72hmnRe+MD1c85vk=;
	b=XRT6MC/RHuXM4CYFv/7fl13nYzLWpGICHGBl2fdbQc8M2+xM5WThD4x4+a8h7elTr80O
	 Ek9LvDoJOEJckVnFxHIQpCJe5WmOAVMofoPfvplV34JgnsIs5P6eima8NtYsnpLDhI6uK
	 R9m+RFtbgtcUiyr9HbYQ/pgP1JuYepE+aqStQwusY12y91xEVPHXDK2V3wSfdFG1fH9OJ
	 dxNrkFF3ZUOSi1DHRXiuKGY6MUSv2pNf724VwF5Qzl1N99ykfkdkGa5HMf5bDNqJz+J8E
	 JzD5BRsewIJWkdYAAelaaTjsHJycuh4l3fL5+ccBt5IL+hm1yifiYJ1b/esTBUbPerQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PXqE6E4g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HaErge1k;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ED0606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6ED0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PXqE6E4g;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HaErge1k
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69wja1006408
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQZzaGWubSgesvq7cIDLQi22HHt72hmnRe+MD1c85vk=; b=PXqE6E4gJOEQa53p
	QdVVWNgKbTdBI5rp8j5cXrl28agabwFVxBDjOkkRuVBAGvYtXcJ/t7WCT6f7y8oq
	63FEnqEe2/Q0AcB0KdPEhlpuuthwKJRv4eoAoC89hvBzAXpBxiLCpcn0U6HKGYXu
	AUao4fFsmRvnnDwvguuhcGTxsi78hFNwVHBA70ORje0JA6dXK9P72APCHxWg94pH
	ybzxmnYXLmkQLrz9sPgCTyXQJ6VEtGfB7KmshZyM8YCxVXe8nuU83FEQ2v0VYtmg
	f1uFID+BjjvEf1Ftrg/9SAsDvGugMmSeoAKmA91ycpe1fNswKEoT9u2gPZyNd/oy
	UO6qjg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa29jte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:44:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d2d54356fso16799071cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 01:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795599876; x=1796204676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQZzaGWubSgesvq7cIDLQi22HHt72hmnRe+MD1c85vk=;
        b=HaErge1k3+8mY5mz7X0xKhNMXAbL1Es6ljsr2Q4g9eRb5ujVRySZYWSCUWqshG3ZuE
         KFGU7NlV0GAlOaQsTTpIzH2r0djD5jzbxqSbqkgjnvt/1CV25tCCY66SJ8907KLtotE2
         N7BkAkfBvlLywDKpGr6g5a1zDfPcXGPsTh798ymT+eZ2WOAe6yeoZ2E+6CE5+qZErhS5
         eV3bhQBAy8SYyH2VfMlVzJ9bvfy7SxsnQyr12H4KTR3fXrH/pkfqK9Xe631XgmxKFqQz
         sbOS3XYc/fq9th9AbYj9U4cp+yQ7ifl0oVH4zYizbNGVp2iW/0+rIO+u4/vjBSogOt/A
         bdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599876; x=1796204676;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQZzaGWubSgesvq7cIDLQi22HHt72hmnRe+MD1c85vk=;
        b=mb5LT5yN1wfBN+d4TvmtPylLq98kPssAy6KQp3q62bKpByxayfv3ZYAZWyS4aS1FwG
         A3+fppwY9wgw8GoLs02sm86n86opjVsyCT6BHZywTCOnRJd8dSRbh6ofisnU+i58d3yZ
         Kfp0nWwMn0CmFcU29EZEGrg5c2GCse9PBMkecJn6wfBq3BU/vu6WoF3CzkH5vFYseYqy
         eR1eDXlaemxyL2wMyVbXm+Ng7glhNBFNRsIi+YLUeoRJPaAktFUHFWAGH1ask8MLR9je
         6c+Gl9e9Nguy7YR5vI87BTPhC7LYprQC1cbthMYOSvQ1ZMHAtSeil7cdG2lTHTWjqIDw
         Su8A==
X-Forwarded-Encrypted: i=1; AL+hErFGTWDEXOONz0In6NhZhLlv0zn5afZ1maYKMZJpbPAPQvWI7ognQ3fBVCL29twFxVBISHe268uA459Gvw8R@vger.kernel.org
X-Gm-Message-State: APuU4Z+FZCtXv3SGQL4+WHvbiFBrw1CnVcaBQ2dzGjtHUm659yXtpZPz
	SKp6JOsQ5EXIamoNzlCYqA9sq86bFE5HrN4c3NWxjUFVZ62MsUUKjGarCfzvWninK5xRfH8slg2
	bAPom6spJlIYwmfC5+nkjWYQr5LeSJxVwNNNJxMECR1w+31u1L3VgVbxjq9lYNCbB5l0g
X-Gm-Gg: AZFdTZdOkFo2tNQEzZIEF023lsTIwn/hH4eih07/byrlIe8YhAQPHvDm39gd3B6bQRs
	O7gzkJZZP1mq9xp86c9h4qJP/20rAPjdo1WAFCyOT9zdcAyRAm76mQ4xaxRiK7eJsUK4MmXQPM8
	pzmWoA307ZqB7XGEG7Uffm8feo6+E/JjbM2SyYwPyt6f5ynbowEKVK4FTDobUBHmBxF7dpxwF1j
	Rz3AwRwKc8MJT7TDhoMXhIU4McPgZQjfWHT/bHHQ10KCobfzrcUdGo9d1u32Y9rIs5P14A+5uc1
	bR2wse10mEl5fMEVOENieIDenuc+k/y8AJLa2Ye1rLbgPoUC8kvoYg2AfZvKKZG0lCyroDLnJAP
	HEPALFks13verAshOz373ZEWIcj2JLnFSo0KEGnnliwjZ1PWpfWWwt8yxr/C+RWPX487l6mo=
X-Received: by 2002:ac8:409a:0:b0:55d:bbaa:fd0b with SMTP id d75a77b69052e-55dbbaaff03mr14564271cf.1.1795599875840;
        Wed, 25 Nov 2026 01:44:35 -0800 (PST)
X-Received: by 2002:ac8:409a:0:b0:55d:bbaa:fd0b with SMTP id d75a77b69052e-55dbbaaff03mr14563931cf.1.1795599875414;
        Wed, 25 Nov 2026 01:44:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afecbb5sm612982466b.71.2026.11.25.01.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:44:34 -0800 (PST)
Message-ID: <3f3978ad-b6a7-4aeb-8992-687264633515@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 10:44:33 +0100
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
Subject: Re: [PATCH] rpmsg: glink: hold idr_lock while completing open_ack
To: Changyul Lee <lcy8047@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261117030509.1708983-1-lcy8047@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261117030509.1708983-1-lcy8047@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 42evCo2_3UPSo2SRlbw3wZsqMv2BAyvC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX882ZCFjs1Ba6
 B/UwhFFY6d/Jppj9B0uTaY619PfXbQx6TEGlaBcUggqo3jxWOywb/98Hj6mNvgClNiriJrbDCre
 HyQJvT01mfuxOtPY/RYqfLOXnZYFldw=
X-Proofpoint-GUID: 42evCo2_3UPSo2SRlbw3wZsqMv2BAyvC
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b06ae04 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=fTV-UkdgZ7qUFQ4n9AEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzOCBTYWx0ZWRfX1h+x7m0wzt7n
 tzRaWXuaHXeboesE0vfQu+2xQxu26fyR38YKeZPkWkXKMKuLO5Llwy/bkASOlXF7/8UKcFiFlCu
 aAI/4hIyxXj2/9FXHhbYLoZ9H2+/90bsu9HpxmnZibL07z8fj3xLuUiwSWL/f3UQbiQcsmJntup
 PMBJa/3qzhOkTyFfmE0zMEYZo7PzZROb2Wq4kgB6xKIjZKQ40iOt/ODef1w7+RoC20N73CyHFir
 A55DnXDlCyHPvygrXmEM5OBhtANKy1VWQAzoTA+/sjaYbbd3JF21wsbhGnu6M6GMuEAKDoxowjN
 7GCWfIficTbUPSTtLHBDI6ORzR/o/Lo9k0FXzuhtgolFSM/NuzC+g+f6n0s15G8KCH3GRO+jcOk
 YM6BHWrRrHL2PJF9SHAhaRnbY5obbwqjx0lxxjRG4HRIFvVENyydX4d/5vw3ZEycecIOeIOdIDG
 1K9cMuz96DcRqKW8A/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250038

On 11/17/26 4:05 AM, Changyul Lee wrote:
> qcom_glink_rx_open_ack() looks up the channel in lcids under idr_lock,
> drops the lock and then completes channel->open_ack.
> qcom_glink_create_local() waits for that completion for five seconds.
> If the wait times out at the same moment, it removes the lcid under
> idr_lock and drops the last two references, which frees the channel.
> The OPEN_ACK handler then reads channel->name for the trace event and
> calls complete_all() on freed memory.
> 
> Keep idr_lock held until complete_all() returns. The timeout path
> removes the lcid under the same lock before dropping its references,
> so the channel cannot be freed while the lock is held. Taking a
> channel reference instead would not work here, because the handler
> runs in interrupt context and the final put may call
> cancel_work_sync() from qcom_glink_channel_release().
> 
> Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> ---
> Found with a static analysis tool we are developing.
> 
> Compile-tested only, with x86_64_defconfig plus MAILBOX, RPMSG_QCOM_GLINK_RPM
> and W=1.
> 
>  drivers/rpmsg/qcom_glink_native.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index f848ab46161d..862565bf965d 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1101,16 +1101,17 @@ static int qcom_glink_rx_open_ack(struct qcom_glink *glink, unsigned int lcid)
>  
>  	spin_lock(&glink->idr_lock);

This can become guard(spinlock)(&glink->idr_lock) and you can then
drop the manual unlocks

Konrad
