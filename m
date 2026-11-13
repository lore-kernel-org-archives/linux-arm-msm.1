Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596758;
	b=K45526nVsmeIhRG2u67dDYdMQixnzMj8vnPWTgBN5uryqGadoRy2KhMBoNGiw2Mnm16l
	 VlyPDvyMyZ44nr49pYOPTrDqz23PyXdikPja82qIJunoOGKQQqTL73G8Cy+m23yjaC1Np
	 ThoMBOGvEmaO+5QmDZqceBr0sB+1EiraQgJsSVT1FG5Nnw15tJUUfS4a8rulje93oWNhm
	 PLwSU54lG3hQs3N9JIBf1ktA/PtxvpQZt7ApXwSWd/N8oYF2JbDKFbYaMf2SI5d80rOhK
	 ovFXoggnxffxktaH4WutRtRBuUoqGp6kY15S3G+eFVRcbUPRoK4FfUc8vhmItBJ0Ztg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596758;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IRMABT5sMDAiNtPTGVEgBO064GSIu27fmFheEbmfxO0=;
	b=gZSNVeU77z9WdGa5USULDF/+6Ydpg6AG1Jiq3thKhAbgRraIFeC1iGegRX/a6RsLqJCG
	 mKiHzzG+oHXlsrVnBV4Ljl0CYQf+Tk61HWj1mgayMd7jVFI2VMhyfr9bztPyssck7NegY
	 r7voFhPBrUgHuCqtgMTS+5PRE7X1fjQQvHY82an087OqzXQV9S84K+smlJP5eVZY9eMTm
	 tpXxqNqk6SHpj/6ltldoOsQoDHgrto7tuEQjbQs3lcwzqTqIi8o5DcDSgJHvJnOaYggAl
	 L98uvtScZwfsvsgaqRt4CBTRbof1X9ctW0kLSjgt2HWfFvfafRwdmokNAO5wAX5SO2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=naturzKn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D1SmIDf6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66251606A32D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 19:05:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66251606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=naturzKn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D1SmIDf6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADJ1rPJ1085624
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 19:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRMABT5sMDAiNtPTGVEgBO064GSIu27fmFheEbmfxO0=; b=naturzKns/Ro24Ut
	42kO1hKMZb39rcdjc/j+jUi5OossdXeht+2JJb9mkcTOmi9HGwyczRA4363X889O
	LCSCjUOJWqEU3Gie3i8r+lBPGt3oW1xsAo8CXA4Wn3Sq6xzqWWCQ/+tJUHQzX9Tl
	eoiSoopRd8HdnULH127qu9iWTHq9aINfRw3PiFrmyiscHxbrrr/mXpvdTJTPpRAu
	MjMIzXrxEehOQI0KBKCEPnWFhEjuvR+yg+9mcXA4o7AsD1YvsrSNcX1ACyzi5M1C
	U1iqf89Tf9ZMr+zL3DshxqCz096BDZtNrr4KaTAEHp3SJ08ndImHL/JnLJRGq2Y5
	TNdi2A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvjaatxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 19:05:57 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37549877380so1646851eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 11:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596757; x=1795201557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRMABT5sMDAiNtPTGVEgBO064GSIu27fmFheEbmfxO0=;
        b=D1SmIDf6Oma65ySp5zJ3r+77cHhai2Qam6WZ4wV+ae2yiDrGtwH8Df8JDbKid/64r/
         hGfscZ1xdLioYa8LS70b7MwI0JilsZZcQZKreJYHtlKHNPTcDHBQWPoD5MNlHyI0Volb
         0r1JbqikeHvIL8bybnvb+G78V5FBN14W0NGI2JXjTeOedKQuoPPy6rLQ16JMOa0rBY8K
         Nnta1EhovAORwKsEEUWqn6ohxi5MvrfIzxsh029UbZjzvaYPQBwuiwm8wRNCabYx6OXC
         WBULmkpVZLeEEWF1YgtSt+dKO3fPHzIWSFP84ie9tZQyBh6rkRpl79n+Jgeii5mmBBN4
         udHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596757; x=1795201557;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRMABT5sMDAiNtPTGVEgBO064GSIu27fmFheEbmfxO0=;
        b=D+geWLtHj/i3xRcrL99IyVkUdprAIr1XBor+niHvqpVdiOd1MvpwSnl7SJZFfq0/EL
         VJ6NNjsLcfB4np0fxrArf+wcm2P7z2NRS6eMlT1UdcJb+iMNYm10dRdPEQwZMvwqLiBj
         9R+YqO+QbwOJurxgwCcpj26TxS7RRI/YMk78ZBrJkUU2QJbmcFaGqRCCftawpworERUf
         vDnWG+el/D63YCZZfSLDOzLTIVJtGz2hl+KB4mZk9o+8k9+qrzIxyjCn2YESJ8/3j/kI
         p4v+5A20YOB30eChTwnAlGrmd4LeuujHxhTfs3H/7akXvNrh8l/9U08GA9bKC+pac+c+
         bmuQ==
X-Forwarded-Encrypted: i=1; AL+hErFEjZn68GKgfgBakslRnLlOpvDXcmguQXy3948pANSEVHRab8M/6mcBQG7+HdAVe66hOLkaEsJVjFrCDM0s@vger.kernel.org
X-Gm-Message-State: APuU4Z9J8PVcx9o77aCdajJ/GvISeN2cQ87tLPB+1ZcdFbgw3rUfcEH8
	jKZ37DzImELSmnJWtfeSt5jnhJbjU2uo3P7m8J5RVJGlyOzoxd66moUmocdpLRq5PbAlpNgFH6P
	FiTmAhBqyHD9iwtlmP0XJ54gZkCERxeic3a7sbn5kzaVDCV9DAgLEhFEJyhpKqTgG3jMN
X-Gm-Gg: AYBFou3y9IjSHiNmrnF2pIg+l93wZXi0cKNyYOCeJxNeaIBAss0M9CGndUueF4iY3qP
	l5PZYXR7FKCvewsVWpM3RtHjmTnya1GxUBRccGBGSfOK1x2hc/e+8qfLLdPOivAl5EE5ystnxjj
	LX7tFXprvT0S/lW9MJL2hWfUOou5RGgvcSWgdqlDWaRGFCo78HuKSoHyeyHoMVmHLm7W5v2AZg3
	UuE0goin5RLK9eoifjlCsSvFGf9TD04fvGOyDom1rLyYM8pfyvfZH2QNyGmcI8VVatDh39XaGFQ
	6rmIrn34KMvPolLSxy8a6DZdb4pIoN8RGA8A/EgXPbwvCNlIrDLp+uXPGsAW3qLq1MOcoOhWLRX
	kUBZObPlvkGG0vVzQNP3FG0+h8ZY3g95coe983NV62rXWToe1+jNRUBwxJEP/uUU52mTsFMa/53
	vp/4ySCXWg+tpqZJAMs8COK48=
X-Received: by 2002:a05:693c:26c6:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-379684b548bmr2697352eec.30.1794596756845;
        Fri, 13 Nov 2026 11:05:56 -0800 (PST)
X-Received: by 2002:a05:693c:26c6:b0:36a:1cbc:1093 with SMTP id 5a478bee46e88-379684b548bmr2697326eec.30.1794596756183;
        Fri, 13 Nov 2026 11:05:56 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm8616314eec.4.2026.11.13.11.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:05:55 -0800 (PST)
Message-ID: <6b3fbc60-34ec-4b7e-bbc7-84a0ec5d496e@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 12:05:55 -0700
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
Subject: Re: [PATCH 1/2] bus: mhi: host: Add debug port personality switching
To: Hongxing Xu <xing1989093@163.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261113122302.2174-1-xing1989093@163.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261113122302.2174-1-xing1989093@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vFocD7-54X0p5JJ9CD8jJnXdv8hDEw1h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NiBTYWx0ZWRfXyqg/7D2PvQ5q
 G32h4P4FN+lcNIQ2RH9V0YG8NNqaDOag1WzrxZYnjmg82BOU1ZLWN0pQNtHhylsCNz/LnP6iQ/s
 fwUPFUqbl3jrv1zvJX1c1j+K9hih6iA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NiBTYWx0ZWRfXwnugTcCq+41l
 /hl6GJBmRtE5urvi53OptdnGi0un0JHEYv9me0HIkcRHDk0v91El0Xf4E9JFcdjO+NzrXnFzji8
 ijzhdZMD86O9q+2OiMZRebiJmJ7QPi2M7p6ELFzjPfxuvY6H7ZZFn4QCSBOnahSYcgKkn+qL1kT
 BoHw9WTyDH04Egt5nG9mJrxX49lTWVLB16yf8vRI4NcnKf+uy3w7+mefxjVe8XnsshVlRX6ti/m
 +ePwPqlBG4mqMrkPCX0jAabgfzA8VeQm/s8kmbAqLQ1NX42GLjqmBd6VNJQ5jkUvwnlMOr0jw/f
 bCTbaR0Uhf0fq/80wE0XbNIDhKwVj0nwM4K/IpauIjllwrjBnItLmtEjhsR7olz/bmi5J/1GIRU
 G9I8akXvS2szCSKoe4VMdHx1ekcPo3anB33HEef+jB0fp44HvDlc2ZS8wj5M8YSHjIi8JBGoCHR
 iq37c39tcFG3x3MaPCg==
X-Proofpoint-ORIG-GUID: vFocD7-54X0p5JJ9CD8jJnXdv8hDEw1h
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af75f95 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gG0Lje7BzgQcJ5p3n2kA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130076

On 11/13/2026 5:23 AM, Hongxing Xu wrote:
> diff --git a/Documentation/ABI/stable/sysfs-bus-mhi b/Documentation/ABI/stable/sysfs-bus-mhi
> index 8b9698f..1fe8510 100644
> --- a/Documentation/ABI/stable/sysfs-bus-mhi
> +++ b/Documentation/ABI/stable/sysfs-bus-mhi
> @@ -30,6 +30,20 @@ Description:	Initiates a SoC reset on the MHI controller.  A SoC reset is
>                   non-responsive, or as a means of loading new firmware as a
>                   system administration task.
>   
> +What:           /sys/bus/mhi/devices/.../debug_ports
> +Date:           November 2026
> +KernelVersion:  7.5
> +Contact:        mhi@lists.linux.dev
> +Description:    Controls which set of ports the MHI controller enumerates.
> +                Writing 0 selects the commercial personality, in which the
> +                channels that are only useful for debugging are not
> +                enumerated. Writing 1 selects the debug personality and
> +                additionally enumerates those channels, so that the extra
> +                WWAN ports appear, e.g. one for the diagnostic interface.
> +                Reading returns the currently active personality.
> +                Controllers that do not describe any debug-only channel are
> +                unaffected by this attribute.
> +

Why sysfs and not debugfs?

>   /**
> @@ -381,6 +384,16 @@ struct mhi_controller_config {
>    * @no_m3: Device doesn't support M3 state
>    * @irq_flags: irq flags passed to request_irq (optional)
>    * @mru: the default MRU for the MHI device
> + * @debug_ports: Whether the debug port personality is active, i.e. whether the
> + *		 channels marked with debug_only are enumerated. Controlled
> + *		 from userspace through the debug_ports sysfs attribute and
> + *		 applied by debug_ports_work. Zero-initialised, so a
> + *		 controller starts in the commercial personality.
> + * @debug_ports_pending: Latest personality requested from userspace, applied
> + *		 by debug_ports_work
> + * @debug_ports_work: Applies @debug_ports_pending from the ordered high
> + *		      priority workqueue, so the device creation it performs
> + *		      cannot race with a state transition

Are these optional?


