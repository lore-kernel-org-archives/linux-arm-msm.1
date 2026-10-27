Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793111055;
	b=3J4faR3Htz+O1BHrG45qyP3Z7rdWOyKou8q9lja7h+nTmizE41t2r1++jVrHeUTcpjFL
	 cp30ujUOPV7/5fUBt084oQL1laRhlAusCNnoVJAaH8ZTqyVwhTnh/FBM+yKZzNn1/qBhV
	 tYA/pbr2Oa5QhEjai3TOSPTeEzsLi+ZvvxzdqVyBvh3ZB1XJuZn77oJqyldhvaTMkJkcy
	 oTWAl+2uwhXEviCPBEoT444FbrP7oZdLVrFnBz5nhIUgj3QCmzgnV4jJKUSNBzGgYU7GT
	 iwtDYhzNmDkK0m2mXqB9gdD0ufA7e5Id/npzUTK+rkP/AAe7w9A0vmpYneznJPoh5ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793111055;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LN1Oeyao2kg5V9q6w22O9xhm9h+2v4Y2mED0tEdoGDw=;
	b=Hwa7fB0rJFaS6hgSIkF0i0fkpCcAKVuWbg2ycozFxiqUz+jR2KsEQJaBj2oeA+2knrgQ
	 1o+NQgND7wY1TjkjECMoKvHFObHUlh7gNlPhuqLXUw3Hc2ZMAXXWiQLtm1DutYukWZ5p4
	 yBNAQ/Sar+OOjRwxirILa5NfEou6m8MEpHj57hlWL/oeIxedjRVQ1wJ/hZ5BN1bUAijyH
	 ospGYfeg7cNyBYj/D/N/TdxK3bqNEh0RFn1CZ5ohpzTNoyUaMo5HY3YpqaqJq4vr4Tq9p
	 JqwDyu2AWGUrpLjSo2Zn3U+4hh1FxQGhJHE3sN8zkFai0JNcQ8KbOmL04lt+RCpA6vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HIppQxKc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7339T+s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9855A606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9855A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HIppQxKc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7339T+s
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoYWm1850844
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LN1Oeyao2kg5V9q6w22O9xhm9h+2v4Y2mED0tEdoGDw=; b=HIppQxKcJFJOi7wA
	c2VTSdgE9+YCIX1z5JXXPX7eC+wPYYAInjIz9MJ03SHS6MqBT89JXG4kDEeeY5bH
	nttxdLQzCQuGpUPRMF7prX5DWvmtr7bzH+D88VdvdjRe1StqTNMfj8n0npLcRx4l
	ybhSR8uFcKR2LPMhPC9CaY8JVacJapAAIEZDtn+46404U9cNg5Ro3VOMZpL/SVjZ
	LY2BrXEgWHh68aa/7zA5/0UGc0Kvs4q2hIb7LfRqbVZ/f0NL76BOW7Rt0vrfXdEs
	4b93ZKzQloMF1O/pYiT7S6wkXosBiq2/22jmlfYEeOg8zNglM6fxk1q+0PLIRjg4
	wDJoDQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmc247-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:24:13 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7c0e2566d30so81847137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793111053; x=1793715853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LN1Oeyao2kg5V9q6w22O9xhm9h+2v4Y2mED0tEdoGDw=;
        b=I7339T+sMPrRiC0b38l6LFsdqQv6zmzB/LCJ1OX39Gzilm45nWSefr5VFdkj2xOpCz
         5o0p5UYvjU9jd4eOrVDXSKpsQnCH4QbpsVlk9+MHTDeq60b1qZncvHPk+EtKIR19aYqo
         lK/z6R2gGFmeMfiuPGroRUviWLLRPxju4HKaGzJR5xAU7HEgKJejVbkv2bS95cXaSS1/
         vhAQehsHYQ06crWZmZAXz3dOrw0DdgnZ3exbkXDjT0mt98K0k7NGhMnQ5YbEQXcdLW5n
         j4wg2A2La0KTK4QiwwDbV98Nrof7fkz+DpEoYdzsfv19Dh3q6pmpO5kT343J72n7eVNs
         4oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793111053; x=1793715853;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LN1Oeyao2kg5V9q6w22O9xhm9h+2v4Y2mED0tEdoGDw=;
        b=ss5RxIuzfcll24dmrEldyedIhxYmz2TZHHKjIoDImcW0ISfX2tXC/nQGSZcW2033gZ
         9DcPX0HtKw272AUbiEpAPJJQYPs69jCCjz6C2PjSnDtA5OJp+qIEvB6OpsdTR/QVbEg5
         y0EyD+RnWCOLQ+wmTPdUHonw08sP1w37f9Iqx7sq+rCgGEi1W+OtDs332xQmobYEFTDs
         70IcsrPBHIAhgiDZNTzquookFSpIufglgg1iAF4p/+1/rs94b8RrYuZUdw3yBL1TKmSx
         acm1nJK5tq7w7M95E6VcusAs0d4A2LzVSPWY/TPwz7i/01Z2Fc7VCmeqMRMxllMuoVaC
         L1Hw==
X-Gm-Message-State: AFq9FYLGNX8LbVlsBpPLUk1bpqQJrQGPVA90Q/DZLtkR8O/MDg8yMJjQ
	QblwnKABpohhLU5fEdPez5A84iXknrrlPin2f9M2WTcJb6GiQWQLQ28LNhrGdiPeNQQM5nc9zDA
	0bS8FxHTWHFWWCYcu0xsbvrNKIHCVVotzwez2gsrbh5mTPgz401iSXIoOiV53KYAgzptt
X-Gm-Gg: AYBFou2Iu88YRJH3q6Be7Qc42aiZ5/MrM9UGlUMSYEU7J8ZEXHNKjWShGD2zkyahn5h
	OSRlg2OQuGUrYY62IfpfS8hQZgquNXTvnhay2a7JN/V0IyTvpCAdBDCSdamVFOUC9cP36IduUOH
	mUmZrioKdKZp084kq8WvIIJm9Uj5xlWvuAQ21MCER+hKdH9gwuHiEy224qpRe9Ud121Y/8tJTYB
	JQPsYr5Duf+WWygyRezwKzBhcvOo83/Dq1Q7lOeRs1uBqK8fRd/+4ZHFzWq4zKPPS9D4mCivAtc
	ZRucProOMLX4GpwgT/yt4ejn9RTzVN+MoRbC/dqWnNxmFGT8Xs7/PT8OSyKgc7cQ3W2/Z78MwCf
	e+l2QobshstNPtmpZUYA05Q==
X-Received: by 2002:a05:6102:8698:20b0:7cc:1137:9d98 with SMTP id ada2fe7eead31-7ce5c6ac82cmr3604884137.0.1793111052709;
        Tue, 27 Oct 2026 07:24:12 -0700 (PDT)
X-Received: by 2002:a05:6102:8698:20b0:7cc:1137:9d98 with SMTP id ada2fe7eead31-7ce5c6ac82cmr3604839137.0.1793111052163;
        Tue, 27 Oct 2026 07:24:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49602346esm180294a12.7.2026.10.27.07.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:24:11 -0700 (PDT)
Message-ID: <2dc67d8c-f406-44e9-bf54-12704a8792de@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:24:08 +0100
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
Subject: Re: [PATCH v2] drm/msm/gem: Add some cleanup.h
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Bart Van Assche <bvanassche@acm.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        open list <linux-kernel@vger.kernel.org>
References: <20261027141430.20258-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027141430.20258-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NyBTYWx0ZWRfXygGOgO8foLpt
 jzcHa6PHeu6MfmQe5eLmd9fbJaYWSqNXps5cTCiC04WrPUUC8V6FAC8IaDj0NHZbyYL6zpjyxzN
 MiOOXH9me8POvdBnRTisQhIB0cg1FOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NyBTYWx0ZWRfX4cZFlmXY1teL
 aGce/OZcHyYr+MQ5qmkQDunEtWxwaVZMF5UzVfSW1dKkjwkLO1JpxAV38mIA8e5pEGUHz3BTXCs
 Tbr7FpS7HLM50Pd/jPgDnHkb5UnlT2xPY6CDjkny5l6FZERVfeOlR7INGBxwGJEyFSQpAUw8a22
 XZMwRDynmDRJsC8hv4UosRmNS1Z6jeU3hF72BF+oIWL4vOOKSTRlFRjBIHz5/3RNgq+xkjlhbaO
 I81Udpkpx4GpNL0klNfui6sQ2uQW+OHTpJOvwqbljt6EuDs3xcLoLf/rBVx0aEq0/xBB9SZhanq
 f3txpo3kXvnPH3zpA0xdfZRT109b2o7rzaRt48v4r0mnlmVl0yEcxhGHWBWXr4WgrASyslvQ62R
 xbly1eGBbSWNK+RzA1+NyKEQEv06Hdnw0wmG9be/pwOUeZB4zu7cwmEmmaGcghSaIODZshLppAu
 5eW/sHn6pZa4hlQMGkA==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae0b40d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=OIDORtarOpwJ7gKWPgsA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: pPpMltIjFzqewecPFxzR7_9LgAPSPimo
X-Proofpoint-GUID: pPpMltIjFzqewecPFxzR7_9LgAPSPimo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270057

On 10/27/26 3:14 PM, Rob Clark wrote:
> Convert (most of) the msm_gem_lock() and friends over to scope based
> cleanup.
> 
> Other than fixing a lock leak in msm_ioctl_gem_info_set_metadata() there
> should be no functional change.

[...]


> @@ -608,26 +600,20 @@ static int msm_ioctl_gem_info_get_metadata(struct drm_gem_object *obj,
>  		return 0;
>  	}
>  
> -	ret = msm_gem_lock_interruptible(obj);
> -	if (ret)
> -		return ret;

LLM is a bit grumpy since this no longer returns all of the return
codes that it can but I think it doesn't matter

There's a couple of single-line-scopes we could shave off but any
which way

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
