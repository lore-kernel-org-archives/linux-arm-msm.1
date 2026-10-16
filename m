Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A8A46D2A9
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 13:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156960; cv=none; b=uOWujCuv8bjn8ysftrlGT1hIkSfmvr7lFqyCPFfTXPcGoOLsjR0uAbDjyRKTWMtzmEfy70R4ff8NxZ3s2djxevbFTJ59p5zIRzcPQksL139ZL8lerIFgpuv8KkDo0etsA1R4v385bh3lRSaWZXcFaS0O4WXt1iX06tRLAv9H5+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156960; c=relaxed/simple;
	bh=u3NCbjlF65MzYbR+oR2Tct4Ob6r1UTi0DYYNdD9tCKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YONtYCszhGPKucmHbX6awqwcFVI38f0GGujDq+rp40BoGjoMRfJh1SdpWjqiF050K5QDkuF006Muhqm8D3LA+QaS5t2HqeDZDVmIk5m4SSyhUL6l7UHW/5DnQcvjZkWglzidelWVwhkD6MGjG/1bARKUMZfeBuhFbDznt6MxiHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m8xAVPq2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SKfkc0v7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m8xAVPq2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SKfkc0v7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GBU2P51277619
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 13:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFnblkCZk590L97ihVInQZtbtIXSB+YbRNIrJk5YPFQ=; b=m8xAVPq28s85+rGt
	66bkL94GxtJPu2AO1TQCIUNqtScwBLYGQHBI1z1cekyAjnhrLvGUVYUOBwQ1vmbr
	wVaB3zwHUN0OvxpSaYUY/MLzYVkFK1qnHjrvKvTpTmA8HRS1THBKHxWdvhLZyC3P
	z02XANusJN5Rg/Q5UpgC4yPDl2mzXU7qwLfyn1YGN2BgLjP4KRINTH1BFWsoRuUj
	4OYipnacOdXJRW7XWMla6xyMoJHRX+CZz5e2nAt/0fXHxxfwe15ai195rj4c3Wv3
	TCcdjYP/QJbMsSpwEHwmThg7HcqO0BHBPqHVJm8XxSguQoWZAuEhYrJZWDj7qMYw
	9vWoxA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v0bwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 13:22:38 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e9b3b44aaeso93983e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 06:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792156958; x=1792761758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFnblkCZk590L97ihVInQZtbtIXSB+YbRNIrJk5YPFQ=;
        b=SKfkc0v7C/tWWaeZrBS56URZHsekNavjAvYRF/ktJwOh6Yw2Lkvo2LmmFAUXGMWhnM
         7HBJHJnDA2h13dnU3exDX1xgjIJcH7EeG+8TdjxSY6y4l2QWi82WpQYKkCRwEkYB0t7l
         ewPenky37Y4ZCSpquxtGUOLS3qs/cBpUIDgc8hOAVLJl63uPGgx3oL2WE65sq6c1t7g5
         qBcqLepKIcOPoSqCH5TWtt/zWeQeBN6zTGz/k+rosO/5WuPM4yNHC8yu45McAivW6UwS
         y+bSKvAPF5xvsZIdw/EENFk0js7bTxKiJgUS+roluH6Ka0wEaaaq/215ZfqoMAENI6en
         smOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156958; x=1792761758;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFnblkCZk590L97ihVInQZtbtIXSB+YbRNIrJk5YPFQ=;
        b=C9McvsD8W+heVut6LDTUP2MwVf2oGtcdFXOIbwVdFw4AStkgRfBofL02FXc9BT7ifK
         5ju9NXE3UDG1aODMTqUSDP/e+uRMLBx7IQ0x7mzFDlh6Y4WnC1OQ0dKvO+s8d0jZAhzP
         i5lC16JZpA9Rj1h6BBAhwBdHKkru1pIAltBKCn11ToQtjNXAsvE7YKsFF3o2GJsSNLi0
         lms2uHRUy0OIPv9At8rPUIl/jubhlYXYsbwhQrNIGl3C1hJgz3w5p+cF+YoIKqse3918
         A9XqK+usBht0CB6unfDr2VDzZLFXp3pd/JMbmFCD9yQXnqZ1dFnphNcw/E6XyOe7GRoH
         FpmA==
X-Forwarded-Encrypted: i=1; AKwUvBwGMRQuU7LwKJxUc/c289Rsmq8gLkv691kZ1CsXQTIP9HaJEWRwhu+EtSYIvjlhjx2EZWTlcJPTAJhtN/Gl@vger.kernel.org
X-Gm-Message-State: AFq9FYIwk8ln5kcUGGVV52ZwKQVFQYsBuUHZPENn3MZ/EImPnMIxmAe9
	dGXoXBZXsYyB3schS5fCtlRGHcC+9pWD3bhUqlEuw5YYD+j6R3+7ItUi67aRiWcvyl23FPj9FCM
	gn9P3NQEsuwuLgBQpTlILMlfnYONvPYu40X8Gw6pZGeN8DNwXtXLo17aDuq/eR4glrrTh
X-Gm-Gg: AYBFou3ntau6/ok1ms3vbSyLfKp0Kfl/i+QpegrLL44+tHLMXZdIa1jtdms4XIrDAKO
	2N9j/OPx9kfG1MzY6G1Wu5GUEYmzWJ6FRPADD8ks0ZypL6TL1YI3WPsl26RgAGvGgmwz9ZmsWCh
	2BoyLZhsdoz5OcIfJQQay6lFzCCvazQV+cdEwJw1kQ3CuhcuEtEK4yjIudGO34m6WqBA9cH4t2X
	eRenerzzDoPYeDOAteN1WbaDli1SuyV2x5w14JaLDWdLhgBPM6CY8ho0jt3Z7GtggLzi/+tnbbn
	M3MDKi6oXCA01XPnXV0885eVe3t8CrytVp+qDkSPEJ+EVU7JJCXVB04XtB8H4OefkVIabzbcKRE
	dff0Pk9LZJmhD/Db8/+c06g==
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr3414851e0c.4.1792156957609;
        Fri, 16 Oct 2026 06:22:37 -0700 (PDT)
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr3414831e0c.4.1792156957176;
        Fri, 16 Oct 2026 06:22:37 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb256csm71413666b.78.2026.10.16.06.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:22:36 -0700 (PDT)
Message-ID: <95d6c0a0-b0ef-4e4b-a8b1-772ac27e9d07@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:22:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: qrtr: ns: retry service announcements on -EAGAIN
To: Joonhoe Kim <26rote@gmail.com>
Cc: mani@kernel.org, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
        pabeni@redhat.com, horms@kernel.org, christopher.lew@oss.qualcomm.com,
        deepak.singh@oss.qualcomm.com, pranav.phansalkar@oss.qualcomm.com,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev, stable@vger.kernel.org
References: <20261016124600.31-1-26rote@gmail.com>
 <bbdaabf7-ffdb-433d-91fb-f6ca03b0747c@oss.qualcomm.com>
 <20261016132034.711-1-26rote@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016132034.711-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GEu1gx8eRpRe5YlSVSheu7T9s5MzoACQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MyBTYWx0ZWRfX8tMvOvB1tHUc
 cljTHuPKr93+nm44UyDQ6R7FB2WCxSUzk8hGSmapxv9gQsruc5Gx0vZSkzEgvDyOLORTg1y9Mys
 u5O6Kvnw1a4VIKKApKmfM2ecdeEY7LQ=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad2251e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=BNqwQ8rykVb9Ldng7p0A:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MyBTYWx0ZWRfX41JB2teAGcHr
 jU2SZIkB+yINOpod3yl0rTWeJL06aJuTTIy70KLJv63MoeZRTx0qRVALiX1M41qMwzjIXu9Mnak
 nPaRz8QEI8De9gUjioNU+eRqi2C0BvzfXEXBg4/xsw49qpNumBt4o4zTAoEDX7A745VwrNvX7cj
 sczHk17K9qYBZbD1DbFzFclqlS6qtdHmK/2lTHEvgb2XsIL/XUxbMy1y9nerjcznC7yNsPfOhfa
 F8aXcDalDtUikPfri3t+2GkwujMBuqk2OOD31bkp+pNiHsOXMG88B7fpoN74UiX4Nr6KLtGfUMd
 jfcjQlyLnn9iZiqdhDSMnWaRN17HpvKh8MkXqx9ZWpyW31+1KrrkAoKLAp7wf1HIPZ8/M/mETso
 gOmze5i6Bm/M0i/jDPqbQ6c7sFU7505gXlb+67Bh/5MnquN7H4nbxPHRWzZ4SIKC9fq1noeWPDm
 57nO01wFJBmOj/oHOKA==
X-Proofpoint-ORIG-GUID: GEu1gx8eRpRe5YlSVSheu7T9s5MzoACQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160053

On 10/16/26 3:20 PM, Joonhoe Kim wrote:
> On 10/16/26 3:14 PM, Konrad Dybcio wrote:
>> Please remember about Assisted-by tags if they apply in your case
> 
> It does apply: I used an LLM for the analysis and for writing the
> patch. I left the tag off after "docs: remove Assisted-by references"
> was queued in docs-next, but I can add it back in v2 or note it below
> the "---", whichever you prefer.

OK so we went through with removing that, didn't notice. No worries then!

Konrad
