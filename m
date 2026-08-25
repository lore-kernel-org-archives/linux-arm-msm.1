Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB52C3F3284
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653290; cv=none; b=M5eW/Y76Bb2V8DrdtGROqu/qmWsafoSEnHOqPeCE/vt7VLBKTyqHmLcVPg6+AiGD58CGXDByRTajKuTsT3y8C5qt1rAz007ZsaowxpV/oDY5nbOv+swlRyXwShafEep3JkL6HO2Nu0iNNFDU7+ogMk+D1fhQnHYQl41QIDH7R6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653290; c=relaxed/simple;
	bh=pplqjho6UUOn4N1okQSjMXoxV7mm88ACjxAWy5oiqfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/sFgJ4aAM4arAO+293V27cWEVz/aYRiM+nVAoCILf2NlvyoUA++1KayhHnLtfEjDHuXukpbcWWi7oKTxsyGlEhtZFtpxqTbd0azgsQq/SDiebgqH920BKC/a9Z5oATB1fNCOV0HQmP3v4+gyztBHpdk4b90r3iCieQuwpD/A+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZgDV3OVt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uz3kDLSz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZgDV3OVt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uz3kDLSz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88LEr2387868
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n40lBCLviXfMM+yTh+Zv/kfEJ+WLyTY/RWX1Efk7bRo=; b=ZgDV3OVtOJpglHog
	hutPrzhzCJRJy3/rI0UnFA+ncIpx+iqnC4nCHnhpcG+0/nqderkTLPaRTVIfR22d
	M31SONjq6d6kZrXymWim56pf45fGrtTiZf70fPLG5Nseas2LhU8VO6vJ6zMUD+L+
	Tc3WHh4FyXEMIO6VC9bny2NLEw+aizN2APPMeHEJWYsUUraY+xaMzuaYqpM2ipXF
	Mjqp8pCqhY8PrpJGz6zrdqM1erPJgVA+WLUy1ugYAGBuiVCOopxd+ijWUQbwW2T1
	SUCppDE7JyYbpMUKcttDD8ThZ50a44+tUVuL4TMcZucFbCqShlvV6mfFpcnF+nnh
	3b09Dw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8swrbh23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:21:28 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97c4f47fa57so46392241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787653287; x=1788258087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n40lBCLviXfMM+yTh+Zv/kfEJ+WLyTY/RWX1Efk7bRo=;
        b=Uz3kDLSzfqylts+tWtsxPaqk22zGE113bOyP7OqMpxZ0rra3d85RK5kgpvHwD9lvnG
         D1tY7qQR7fGR3kazsHxzEFV0F6k8IDXYw6TfevZ5+TMPuzdO6sYjC+4Wgy7LMwhqNY5N
         fzcCLcE01dpsizU8vtKhOccU/+X8KLz1+pwvapS+a8kM9RWxSgOJMeX72T2LP1XpwswE
         bE+eOJQnMuMxdTXEKcwZ5mUpkj+EKncj88rjkcPnSm3UjeabxqcsXxjgClQZIza9QfPJ
         zEuyEm8wc0zvRWUgSuJKR0C4vYeti7iybbhR70s4oCN+3KXRaFagNLZ6V4Rrhs9hdXWJ
         c48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653287; x=1788258087;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n40lBCLviXfMM+yTh+Zv/kfEJ+WLyTY/RWX1Efk7bRo=;
        b=h5jgGXu5fMY8qfBBAvnyrri2o39+hjHkdtGL+ZfIrcAMatIyrHDt3fZYB9YwLSIum4
         I9UHfzDtRqg3aTvYsGTtiZy8Qm6sAkzipNDf/gtsuJq2Ad3TzmNgdToRGwKvZ2o4YzTP
         G099AyriZn8Vl18d9MLqqmyHC/f7hWcXz+VxNuZCcl1VsWzfgoI3Id5sKK37ovevk5AI
         z3xgbkYm2QFVvovPrM6XAhZu8NU0rvzAYgm2+mlmzRcvvZYQl7fG9NfU4Bx/1lEKOQBT
         gN8OfrwXmhejoUcUnX2tIe70JW4Nom8GK4tkWOwmglT22crDstJUKMv7ffK8S8OgZrDp
         OWoA==
X-Gm-Message-State: AFuF++naHUq3BJQYgsFhVak/whMRgDypxpRWnxISBwqzjv0tPBHWmkCe
	2RFmoZrAuw1VWglWKCCSbyGj/SvsGuZiLdXlUcnLvlrsXmz8M5mtJ0V5i5+Fh4i5ycqu+ga/Ckt
	jFlA1hbVKLl/L+cIa4Lvi1490BylnLFAlc9dJUy+T5EjqWh+uIr68niryKQ6h+R2LLsL1
X-Gm-Gg: AR+sD128bsevqLeD348DJ+s9t7tFXQPNpdM5C2pMBVjLBLBZGA/xLUWNFeTnsVjO99s
	UTbbpKzULGXhwwYhyU7+8I+clMPaKzR/lhgmmOnaWETJNFqEz5Klx+GsxwHXE1CimKrBht8GArp
	Yq0ZWY/kbn+coiA+uNoXNHHyI2y9DIVjle9/Fzey/u+HxUzGfEGytBfqqA6cH2ZgeBT5dlTEddE
	IQNTPuX6l2zFHndhhoHGWCR0snayGEjgnKCyYKNA7ofVJMaOZCsSFieNzTixpNfakJfn9TCCuEw
	9mYEMZ4GMhiG9kqNnuImXAwd/jw19k1EZC3wpzRu6vds8KnHxP0V4QNSON9B+lHSjNzyQjv7rBR
	ePdt5JzYrptcqOmbsbw/jzD+b
X-Received: by 2002:a05:6102:8088:b0:781:9922:78fe with SMTP id ada2fe7eead31-7819922afb4mr47234137.0.1787653286835;
        Tue, 25 Aug 2026 03:21:26 -0700 (PDT)
X-Received: by 2002:a05:6102:8088:b0:781:9922:78fe with SMTP id ada2fe7eead31-7819922afb4mr47223137.0.1787653286329;
        Tue, 25 Aug 2026 03:21:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e001095sm13835301a12.6.2026.08.25.03.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:21:25 -0700 (PDT)
Message-ID: <4a6857f2-7456-4bd0-a310-7d4719717f5c@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:21:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] firmware: qcom: scm: Allow the SMC request to freeze
 and kill
To: Albert Esteve <aesteve@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
References: <20260824-port-scm-patches-v1-0-1dfd69374402@redhat.com>
 <20260824-port-scm-patches-v1-2-1dfd69374402@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-port-scm-patches-v1-2-1dfd69374402@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qw2wDTznh7lyhNQiG0A-bfhzNv-0HbPv
X-Proofpoint-GUID: qw2wDTznh7lyhNQiG0A-bfhzNv-0HbPv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfX2PaEgH22jF9p
 0VpM8qZEu4OdJtQG6GUy+qbROyegn0xh0BYtMU52bLWaP5N9PUQlqtsuTB7hRt6ZTSlvjBzqWi2
 0J+lIA0rwUSMMPiUln14hjgTOUk8tIg=
X-Authority-Analysis: v=2.4 cv=TqPWQjXh c=1 sm=1 tr=0 ts=6a8d6ca8 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=s5Se1wUF1pdnip_WRdgA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfXwOBM8AOzPDu6
 lzRnVOFQafzhLeCThSxw0y81fFPA+jXOQJTKHKwEQfCBP5unZnDpf58YVnFV2YLdfk//EgGP5Nh
 tHYmSo3bZ5Eq1+9JjlRFTze+tI3Z8KYGmEbURZhsio/TrRvcz1FA9oHQWrj2VpLPpGceuub8qOF
 hkQVZ9nX+xgFagi2TyeP1SB2CLHNKtOqd3rDZj1cxJASD4BhQICFiHSWGLR1qwdlllBswqhbm1e
 n5FHjFBX3fgfuBiMcVxbEib0qbrNVtRBzn6To+TCko36Xi9RweCoO1zuXgKZTMhemZmDjQRKqFg
 HwTmC9r2bCqPEbNwOnzX5j/EGHXaRQCjJeU8XogYk+g4ITIjIIhvmnwEc92P5FNhvoHLfsK3Kwv
 qnHBpbCxjGP9Mx61YVsWyYPTC5fa8fp1Q9KDcXpagl+f5Rv7E2YKdyXAhyfCVe9KJa8L7dwUgAW
 nZV3NhfyKmFAlyuKoeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250087

On 8/24/26 1:35 PM, Albert Esteve wrote:
> From: Yuvaraj Ranganathan <yrangana@qti.qualcomm.com>
> 
> SMC requests in waitQ are put into IDLE state which is not allowing
> the task to freeze/kill, adding FREEZABLE & KILLABLE flag will allow the
> task to freeze and restore the waitQ state on resume and kill the task
> on shutdown.

That sounds desirable. But presumably there's an actual issue behind
it that is left undescribed and future readers will be left guessing

Konrad
