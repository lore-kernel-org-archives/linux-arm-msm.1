Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027282;
	b=Q33tuSlGmYGYRBLC3IDxnCJXZpOBiT0TFQTOW4FGqlu+b2gjZdxIVhydD1ETrMd7OsRC
	 0olbTw4mYbIFJH9bCNwp6x0kohlSL+xeuxg2Rw/vnJsyy1ThIwKTsI+R0mvDxl1yva/an
	 qhGHTvIfwwKn4PBLaw0/WZ64AZm989B0vqxqJBBu3x4sxpthACZIBCWV57k+2uajaL2PH
	 nSyOX6VgVL6BYqwox+nTpzT+lVJzr3bPZDDp6jCYpQke1dtN4xRl6tqOhJ/cZ6pX7qYvM
	 LESTCjtw5IG4WV0yXvb8QUU1xGd1dNcmK454mddD1DSjklvbC9EoHySTFPLDxOX5Vew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dd7RAO3avlBAcafG0kd8O46r9QB0mFFuCyVtLE7G4lo=;
	b=1EBiYKWJEZuQ9QUTOL3VogzeMGq/3IaKvNkDyg+QRaPRczbC5Cfj7ODX88lyka+bSF1h
	 wvqfLjkvZSPZt+WQWEcswYTevxk/+qlvlhY3SvI7mDZVlEHjlgPYddSuLRYteWMPa1McB
	 B8RCqfbqqjO/UHCYBj6djtd75KY1FI3nmw24SITd43Y1JY1abm4i5YL+kW1PoqS3bfyHt
	 GgKm+DB1iLQWnAk9QncuKga/5eOQx82nLPVTM8e5AC/zN4eYaTg+NaECXSeu+Zw4Zl1SU
	 YraHHmfWKMvhsMox7flsWtlUU+f2p3dlywW/+cuBQWGI7Dg96sFfNq4OxGbR0YDCY0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FIoA4Kox;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KTCFsH9p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AB5606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39AB5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FIoA4Kox;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KTCFsH9p
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvvfM3567422
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dd7RAO3avlBAcafG0kd8O46r9QB0mFFuCyVtLE7G4lo=; b=FIoA4Kox/ttae0+O
	t98EgnygqVSsHm2ONIDoPWq4F6mCBecD5xgWMZxA/Z+aInxiCxDMSFEflyfNO7XO
	xa9phdWO7fvx8TEUjviy4CWZT1aDuOHwlwCzg4wTjwCLLm/iR8/ETzMrG4mRJ45a
	0D3/ZRp9LdnXuAUrPsQ5EPew42p1UNiYx6vPc2o51M/sW+qAdrobTdA24pNRloNI
	ZGGu2jbIXXixL978qmXp7a4wc7ik88U8epAJ8o0x06NgvXGyRjw75b5aSVUpSDQx
	rBzAdziDr9ohbKmGMia0VfpP68oF6SnOQUpH4hOCmWOXoBwrgZ6avHgd+XQ5hDpK
	vajIaA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y10wq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:08:00 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988ba2453abso46934241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027279; x=1793632079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dd7RAO3avlBAcafG0kd8O46r9QB0mFFuCyVtLE7G4lo=;
        b=KTCFsH9pN9RKO2KjBTJuoEO94l+gaoOOo/XBhDB/hPV9Mq6NniDup9JX1jIM5A4wUQ
         ESF42+SzdiGM8vL0LCMbpEJC+wCgfVj2JyfaYEbUijvBQRO67v5oProSNi0rM4bXT6aS
         FAwk+/9wJAIBcYZ+jkH/yL+/uCbO8F3cT0qGeEFChV6Sc0OOpC+U8lPQmq/JgGMSvE+O
         EZMJWu+2ZbNEwvr9mfSotmBl3x6/NiEuJEd1oiBSJvdDK9uWITnt2gLUxWgosxNy/0FM
         YV4Dk1dWQbSI57UCgbCgHlAGZwzcLeAxQrBYPvjOxv0lJyHp1/K8ihA90OHgRZyy74Ff
         CIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027279; x=1793632079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dd7RAO3avlBAcafG0kd8O46r9QB0mFFuCyVtLE7G4lo=;
        b=lFau+j5V6TPgQ75EbTGjyEKWr7QhZcECQRr5fkdHoMrONvFxZoIgDwnWaLmu/l+K8z
         aV47RE4D8nmAWNJ8xzj9gh18qzTh76XflSOtKpTp4dTP09wBPIT0XC6EPdYjDy3zg2NZ
         ri+00dZjSRxrgiQoaavK+hbPk4I+hCXgXDI0uI8yl/9nyIxzDxPziDVytM1Jgx+xtqof
         wQdI9+K4UxuIXtkpnEde4h0ZO9X3NjLRDUhWYSYU6fSolpdV/kWFFCrAR1NaUX1Mb0b+
         SM0ECPjM9BNyjqwJ3WXr0gZ5ZZFplR6+QZ4XScfpwE309u7+Yg2yZaom8JTQivRay9AF
         IfkA==
X-Forwarded-Encrypted: i=1; AKwUvBwlz1tgpI2oDwxMLwkrg3axxv6H7zOowUgsbar43W+CoVs0EwX5wt4HGAMYgOQZo21/pQojKu2zbBIFIXr1@vger.kernel.org
X-Gm-Message-State: AFq9FYIIjIwKSgujPXAs/2kbuyi73avyLAa6SZOI4AMMGP19VeyF4dNF
	vD+c2Al4iNeVumbkM2gdnmV4mF+UrQidXr4VxGwhbEo5p/qjCNfYaEpQ7TiI5SNTgsZnuT/vkzI
	ilQUHY0Llkg0JziiqGezT2LsPhCvoQnM+VEOqPBSCZaU9dVc7SErohzpzYZBKD2IWVO5i
X-Gm-Gg: AYBFou0JkOhUcUnBBa+b8uzpjGn+QlFxaPo804pQ1qJ9AjZ9UOXAwIz0OJ5C9o+2W0S
	Ihe6YKQsUHfcz+XQsbLWe8+SK6umPu5zZY/roUy6Bjo5p+0cudbR2nyCpwprDbAhz5/MZkPEdD2
	kELNGLo5LMBxS3RvRuCrOAvVhgFLNx5qyZzgS6l2hKRYFePke5fLbUWhGSiY/PIXc10TUwbB8qw
	/IIlJBvdW6EtqoIAmwSA/bSLlI4I5xjy74dWJZgLBtxUTmDE5yqHvfHcdtRSS9pI0lc8AxkeVh3
	Kyqk0p7s+wq6TybNSOAwiC47siqrBZGAfi6K4b+EB9j0gsyzQ0m7NWe/bjbZPrEYt6SoeS7z5Qt
	Glhh2ANoE4LyJL5s4x4CGEg==
X-Received: by 2002:a05:6122:e006:10b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec232d4fe2mr2047522e0c.4.1793027279428;
        Mon, 26 Oct 2026 08:07:59 -0700 (PDT)
X-Received: by 2002:a05:6122:e006:10b0:5ea:e196:2742 with SMTP id 71dfb90a1353d-5ec232d4fe2mr2047469e0c.4.1793027278882;
        Mon, 26 Oct 2026 08:07:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd79683csm325953166b.69.2026.10.26.08.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:07:57 -0700 (PDT)
Message-ID: <bd89e242-22ec-4666-988b-9edc473a5851@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:07:53 +0100
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
Subject: Re: [PATCH RFC] drm/msm: move VM_BIND op validation to Rust
To: rob.clark@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
        Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
        Danilo Krummrich <dakr@kernel.org>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Tamir Duberstein <tamird@kernel.org>,
        Alexandre Courbot
 <acourbot@nvidia.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        rust-for-linux@vger.kernel.org
References: <20261026-topic-vm_bind_rs-v1-1-6581465f2428@oss.qualcomm.com>
 <CACSVV01LdgUEAG+xyhWRoWe5Y=N7KztU1p4kQyzeW_KeWWAA1w@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACSVV01LdgUEAG+xyhWRoWe5Y=N7KztU1p4kQyzeW_KeWWAA1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX5Bc3jwag6FSD
 Ye5oFk8o2L9CHYR7NQLCcdGnf1LvPsviOyB/iqOyH3f+LW060wBuRZvvx4MtqjxtIbmQ5Kz5aKh
 J25rZzNAdit99MasEOqtuVsR7hVAekE=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf6cd0 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KBXt8WmB77sV3oe1ItkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MCBTYWx0ZWRfX7uy0b/DLasE5
 9QXA9sbUYm8SXiBJtJB8LpyBCnSgV8ul5BF4WSR/Gp9v4Egzr6e6cSPBaFUR2wz7LawgqCpeEq5
 3ptbIDIugQxauyFuvz3kL5lGHelGNQZrrCyG3+YQOwhEIta1EGO5XM5Lu+zuH0kXEKZ8I6LIHkG
 5vNB5b3vSmPWs4hCWA2XriNz21rg5OM6JGVbhkw+bmG5oOzneiZIwRuu1XVXGR7QrfmDn+Xmg4U
 fVpgk6fG8Po3SVB2dCNYYpKpTnRXhMtnGp3lM5LLR3s916mMRsvvrukTg0/1j/DJbKgNTayjqfn
 aU2o0Fa9qHMOU2f1i6SAR5wRXcReZuuSusRGHn2UZ9/HyNba8wnrsmxwuQTBIhuK9yZGtkLWR+n
 AleTEwySINUv2ewUcFeuB/sTfWcEHFY2cRnv/faXtfzp6SAcDtKW1o71DaLtAs9CEJ26b0a+vRk
 jQiWyvhZKbcOcCnuuHw==
X-Proofpoint-GUID: hzKROMFZ2UFn44xQGYRO1ldhwDQ73bCl
X-Proofpoint-ORIG-GUID: hzKROMFZ2UFn44xQGYRO1ldhwDQ73bCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260060

On 10/26/26 3:39 PM, Rob Clark wrote:
> On Mon, Oct 26, 2026 at 4:40 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Much of the VM handling code is a headache to read and maintain.
>> There's a soup of mixed-signedness/size types which need to be compared
>> and added and getting that wrong in C is very easy.

[...]

>> @@ -1118,11 +1071,10 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
>>                 op->obj = obj;
>>                 cnt++;
>>
>> -               if ((op->range + op->obj_offset) > obj->size) {
>> -                       ret = UERR(EINVAL, dev, "invalid range: %016llx + %016llx > %016zx\n",
>> -                                  op->range, op->obj_offset, obj->size);
>> +               ret = msm_vm_bind_check_bo_range(dev->dev, op->obj_offset, op->range,
>> +                                                obj->size);
>> +               if (ret)
> 
> I think the ioctl surface area is a sensible place to start using
> rust.. but seems like this patch could instead be a 1-ish line patch
> to use check_add_overflow() here?

Yeah I said that under the --- line, my main objective here is to
encourage rs

> Big picture, I'm a bit more interested in the
> goto-error-unwind-spagatti-monstors.  Even there, just using more
> cleanup.h would be an improvement.

Same. I'm done reviewing gotos. LLMs help a lot, but LLMs probably
prefer Rust too.

Konrad
