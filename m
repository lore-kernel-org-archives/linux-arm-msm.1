Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447203;
	b=HSsCPcPcPZfsFaPlv5GLMCU7EnMCZ38Gh8j8re8qOeRpFTiPuHVuwZq3PnMChgclZ4s2
	 J6lpnqIbYyCQ4Pi3aBg6CHM2RXRyKwfY/0CZjUxqCGV2N+IZrZ1K6e47JmgAkieJ+LHDC
	 1JbkjHh1tvCJRkNjhIIH2ro2nDJOiQBNEEplrPpR+wJCYvytNY1bTyi2hS/l/qLk0pK1t
	 5dtE5E2Ed9uKRA0DdengITXAKL7hM6A+pAloIZHzgrhvnXu/yMQ+juKz0hmDYRnY4rZ5X
	 /L11wwlikPEL7iRFt2jChi3dLLzEhgw8Ywr8T2yHuv7C4U0vKt0AbDv1iPo5GPbqA9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447203;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TD7NnETHvRqTIKcFjw7RViMYq2RFxLOt/Tq/0tVAYoU=;
	b=Ur3OelhKmL2rZvErJBnd7Ye02xw5yGoFz6JBEhjWk+/Ha6hUH6u6dpV2NbBSpolLHIQi
	 Mk/beFA3ndlKBJqHgDR2LOI8rYEJeRfYe1IsL0ZZxykfJg0ngvN44ucRYUA33m9rxpXAN
	 54HreENOHQUdN3FvuK5bGTSMBmR29a4rn11C5Q1XGox/uCmlJCv8/KD4MgVxwCBMw+PqU
	 NtWoO4XWYQkfCOCTyBQwnbPxnnNMMqPYc0uKs6L37lmUgKsjPsAFcYC93S8kOlfJ5j504
	 O1TvUIlkoPTrb2rCnP1cb2HNrOi1IyPdRjjwpBBgzLZYpAHYsd8zgdL3cuuAAtdDs+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gEPJcTQx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fg23ibzu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA500606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA500606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gEPJcTQx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fg23ibzu
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKn1m2621939
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TD7NnETHvRqTIKcFjw7RViMYq2RFxLOt/Tq/0tVAYoU=; b=gEPJcTQxbMM2ttVl
	Jn/AleS1ZSeO5Q716XFm976lbjSqpA/bCQRTSzLvQbNH3q7j8odJkAvHdyotRZ3O
	NXN/NSp2tnYj4oXtVEcmPYYsPq8MAUS3RsHrer1mXvvewYqhfwHW6rKfIGTBo0SK
	+9J1jgAPUJypn5dTywm1nqCYr5lGDJxQVhe68qWZuqpvJu9ZBeDc7iT4rSU77YMN
	yr9wNWmPMXB4PSZJvaQnBrmC4p+3tbk0SoNs2mMc5NE6Zm27X0kUv+gwMHOOVN4c
	oJ3Os9UbOsdUsu3yQjGI8xIwWQZtNaNXxEiC8rfb1NZzjCpnk+aAPs3UT/dVqe8G
	0DILWA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pa1n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:20:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949664eec1fso37700085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447201; x=1796052001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TD7NnETHvRqTIKcFjw7RViMYq2RFxLOt/Tq/0tVAYoU=;
        b=fg23ibzupk7viDUqik5UeFCfKRXZOfTF0r9rZdBSJtmMBCLUfSiSk26MR52tlWgFzL
         N1GZMPLWO5tIyXfPriWpP00V+AXK1QIJ8Onz00oYejDB1yyyPLxT4BoJVP074UcFN2dk
         wJrqu8+4X6CmGyvX12B+PRZeHyKb4fpQDggZH8TE/X2TYTkBx53NuU5S7m8TCjyLxfuT
         dC1zh5wuEAyoQyMJmr6K4Ayo+8HjCo64LuN0+qnYPyFjbo1KRSzGuOzoRvZkQKtZsZc1
         jqoW6d7qz7u5s9KWqUj3Rw11sz/U6aUZTW3rxVcWAJlSbwGCmH9+6hGJyl0M5nZ6xeih
         YmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447201; x=1796052001;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TD7NnETHvRqTIKcFjw7RViMYq2RFxLOt/Tq/0tVAYoU=;
        b=joDKqdnWA9Ia+kdLUHso2zHmj5EJhIb/f4rXmDipfy0MMAkaxq9nDhAIAdSi4IPlfi
         6Gn8oM3iBcPEEvAwd3T3SDlnvLnkFNVR0ScdEi6eaHlxzJW7ygPH4uLLwQjDZE2UevTa
         pgnzrr/lOz09kNQJPBYrlODTOvKTEO8Q5XnDtZ33Q8STbUsNoYiXF+5lTJVp35d69tgE
         Jq0WYwSerKdoLDfHzWcXWSE6DfayibSMQ+6CyFb8jMrXdCFl8r5sAykzEKS2f6dwuVC4
         fiYSp/NF5p2c5Gv4c3jijQFyeFnXBCT4ZLKl/smcQo0yiO8tQ8oKa9wUSbWE+JkFeeXA
         sKGg==
X-Forwarded-Encrypted: i=1; AL+hErH628vAhxzjWUFnrZ6ZgB64HSDqzm4EK8fBVjrpSBI2a0vBPUTHMA/x1gl8ubnyn8OYttuqRt1+TvJK272R@vger.kernel.org
X-Gm-Message-State: APuU4Z+GzDprZoj/fUD0aNOwBpxz5bVWix96BZ+IlEw5r6nOwO72UUH2
	5TUxkEQVNZOt9yHXdsD9JY5+c1IGo3GQyjj2v/pSNT/YlCUWN/KqMXYHuLGzB5EngnOU84guv0F
	gpToGtp3YRKsUUCryr7yXUJe/cP/R5NIJqCuhTf1XNpjN099Rcn8btHbIFCViwimz6EuinVk0/9
	yD
X-Gm-Gg: AZFdTZfxCtuIFx7XOfZTS/8teK3+4p//iC8ejGGigFTs5wRpcS1UNgu4HcTyY61P7Yd
	o1uQxqs/oU7Dm83s6yf2r2wvvEkkA8+XLbUVPyoqtfMlr8G3PfrKggsiz1K/GypxZH820PzI1wg
	lRwnytiLacE78wOZiabMY4q9zvbhWBJFaa8KLgZdduw/9RwN6n8QLXQaq79En5x+eZ7tnKQDPDX
	cr8j/9mzOi+2dVz97TU920MKgEvTPNkKRzJ1UElkJFvoxJp0hp7Eg3C5S0gS8GL8ZwQJCLyRiZY
	abjCixKJLFqDxhTd1HkIj9iPh7kZ2QFKV9/LSCUwO4LHjgF30HIhUWRjrwR9KT9Co4Iz1aTGgvA
	W4crhOM7lBnCX0M4ZmDTEFBNTgzgsU8Y18zPM0K1z7UFzyc6dzxvKwnBt3cmHB1mvdU7T4Ks=
X-Received: by 2002:a05:620a:5636:b0:949:436e:45f1 with SMTP id af79cd13be357-949ba6c7b41mr2244317285a.0.1795447200673;
        Mon, 23 Nov 2026 07:20:00 -0800 (PST)
X-Received: by 2002:a05:620a:5636:b0:949:436e:45f1 with SMTP id af79cd13be357-949ba6c7b41mr2244312685a.0.1795447200081;
        Mon, 23 Nov 2026 07:20:00 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afec08asm423197066b.73.2026.11.23.07.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:19:59 -0800 (PST)
Message-ID: <c7d5292a-86eb-4be4-b5bf-974a54fac51c@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:19:57 +0100
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
Subject: Re: [PATCH v2] Input: pm8941-pwrkey - report wakeup events
To: Michael Auer <mick@yoxcu.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261123130336.1316006-1-mick@yoxcu.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123130336.1316006-1-mick@yoxcu.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zlKxEdnWFOsgHaguuzQerJRI3Cw-0_eI
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b0459a1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=MRTsC1I0QnlaK75AdyYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX5UV/pL+qH0Pi
 ZyxEacG4qxkz5B8FOLmJRURyhK/FzTYD/7cMeEOi5IhODnVZr2N3EKqOmN7JoLqRYlhOA5vdJVB
 jL5/zasSa+53x4Y5rZLlj20hC59f2nM=
X-Proofpoint-ORIG-GUID: zlKxEdnWFOsgHaguuzQerJRI3Cw-0_eI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfXxrw3qSXeeoNQ
 CgjI5dzZSvsI6vee6lqGZ0fciKJztuL0EbIRu7IPXEGItB31CI8AVlgLKJoidaWPJrUdiS5VNCb
 iwDmlhVWtaT8+7iYqoaTYsiYnz/Uw6gKz/YLMhH27zpmzGqce7qB132gwaT/EDxQEmiHnPhzWuq
 NGvLlZQcEV/qWlCtvPO4yCrbxLMlZJARuB0329ciKMwcAl2EKxeA8ZdSrw3+rCh2G8kNizLFaJd
 i0tudS+F7r2zbM+JTWeFqLS3JSag7/DljMpkS26mq+tkdkk5Kbsb+9S+0zIpDwSlTsnEc8lRE8d
 RwKBiEj/gmM1cSMWbCnTdKHFeHflWwNZBscv+AsjIZnrmMbE5Es5vYcgELojg2/76BHvntWs/2w
 Dbyb0Nd46mQsRCY1zAuhhC8OS7DGt8JHDtlPB0sE5WELFKzUxdDVL30rUb3zGiJiVpJtiGLESiH
 O2RMNvGH9suFCFpEA2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230060

On 11/23/26 2:03 PM, Michael Auer wrote:
> The power key (and resin, with "wakeup-source") is a wakeup source, but
> the driver never reports a wakeup event. Its wakeup_count in
> /sys/class/wakeup stays 0 even after it woke the system, so user space
> cannot tell a key press from other wakeups. PowerDevil, for example,
> uses the wakeup counts to decide whether to turn the display on after
> resume.
> 
> Report a wakeup event from the interrupt handler, as other power key
> drivers do.
> 
> Signed-off-by: Michael Auer <mick@yoxcu.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
