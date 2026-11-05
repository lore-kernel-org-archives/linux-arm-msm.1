Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866960;
	b=06q0VSnBx9aaEeu06b+VDLzEXeftrgS4/cXVhUQh8FSu0aTVMJyxVcZXf7Ehk3irAK5K
	 eR6+s3xLZFebOVTy3JMDNSlAhLP1BDVwylbHSLOJW10g4iGDST8r1LH4awWI9JXSVegli
	 IXgkuXCVvZOv8Wk59HKRlR4mv2Sg7fOjajOALjxuggu2y7mFDzlO49It9k95AJE5LlXZt
	 4wlKhgis27eTR7H47uxXQLg4AzhTm9fn/OVOm6PI/6A8gJejKXRuePjewByuzThIsewfJ
	 jHt1y244KpOxS4ooxlP/HDVfw4b2YRgXcIhy2cTikjdMWw+RCRj8PcGegaHp3EG67vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866960;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ix1+20DyoRCGmBOgAiA9EOhmvPdqx6nMCYqJ+YFb1H4=;
	b=hh5zlbRYhP7QUxOX7g1r+i68c5cfNrAj7i7GxZcWuXRoXxHhzYvj+1C3I00bfyMr/vGn
	 KPVqtR7nALcwdCNhywZ7DxByea8GRmN3RSuUtbGjfGmcNcmw+axYn8LdS8VYV53KM3/CZ
	 XOuA2mYVJU6/t55VFy83ZZSjVs9fD0DTBS7DzgP7evHzx60qLutxJVYDw4ugv9ao188AK
	 coYSXbXWhH4kIC+ZpmRxwgtJyq5f9qp9NwDsQ62jzR1cKk/SyjgabemCbQLjLdSOIyoh/
	 b34qOlaw9aepsk238o6eYr+RKUtcNusddSHZtTZgez6XPu96VShkN5jydVqqcVNw0jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=memcz5aT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YOJ7WMtd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398D1606A32D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 398D1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=memcz5aT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YOJ7WMtd
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U10O565031
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ix1+20DyoRCGmBOgAiA9EOhmvPdqx6nMCYqJ+YFb1H4=; b=memcz5aTefo4KGOZ
	rgWnJ/uabi3neKbmngooBNvd7gHrIpsZOx1v8gPp01TSx/0fhIHBJqOv+lwgFfCG
	47mYl3Tw62xnSS9XD1oqDXhK5a/cCwCK/aVh3WfzN4HGy183y1iKNnw34xGH7CNM
	4w8Z96I4V1sjRr/VMEsm3PlWdHTFJ0E+2oc1RrYHWy+IF57bJtBK8XPAutXx1Gnr
	5SnOA9FmmYdNboeTIRW1b2MUIOABLurLebyBAgssvIq6xdd4XnkDpyqgfFtQCrlj
	MgZaKBrrCyBTdr6m9HNGLaIGAfiZOPg0BL/B22YQa/XLqzoZV5RttPlEF0V78/Wo
	+SaTBA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq8rqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:22:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91bf35c4c78so2618456d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866958; x=1794471758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ix1+20DyoRCGmBOgAiA9EOhmvPdqx6nMCYqJ+YFb1H4=;
        b=YOJ7WMtdQz0aIapT4F9RwpJ2i+ZE3XgX5li2D8OAA3ZdxMkOyrB23muMp/CaD6usN7
         fJP5JAMRjY0aFPc1hNf8n+yLXnPuEbHWd9meh9NQjFtJFw1wS+bK5ljm2OBd4xKND3zR
         uheh6pWUqEny6VHsU+U1Ye5NgpqgpGKRKgIvy1e0JMzA4cRH83XKidvXwWT4igX6QiRS
         BSwYIozmcmtbIVoaUNi0JIHwfr4NGdoYFYnPsdsNbGEhd8wqecVz5ORdfVCd0es0D0lO
         8HaLGcYOIgZIpuO6X3bxxs8QywZU5YItmgNUEUc7iaLP/JusFA1bdqLTE5/AGO9wfcEn
         /aLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866958; x=1794471758;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ix1+20DyoRCGmBOgAiA9EOhmvPdqx6nMCYqJ+YFb1H4=;
        b=ivVUTKK83YSGwM24xnIYVa00Zfo7YZpI53PvzPB30TQSxeBH5rDRlFWIuVE2IR9fEQ
         OudMfyKQkAme/Cfii14pv5eiGTf58CbHDed6tG2aieQaMDcvwJKVKiQH6AMo2sV/AtEW
         McWgNn68qGRb65JqnMuXg4f1+kYp/GWKPEsnP9XA5fayi6mYtmZNrZOFCMjBg61crc9C
         LHRLQHz/h0TZdPaqmcLV8L7JNBcsMLuPHNLx4h0AjDyvfpqq9ISfxWUw0SFpFrWY1FiS
         FEFf2SKlfSe7YsWCAptpI2MyYGu/pbxme+skB0vSyPfogxzHEk3zJ3RV6GlwAvLSX23p
         q4JQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzXG7offXwlsi59QPnj8OS8W1u7UYA5x8PlU+5k9de4JxQRXT5AdTZYZiVPocoB/mqmaLgQVozo0MTtGF2@vger.kernel.org
X-Gm-Message-State: APuU4Z8qSVskOLntsQf4cbS4YPe+PmrJsulEcgYAa6GiwCfNx6JQs/ks
	Xx7Xicymy79jnN4+qjXVVjw7qDA6pcAGkuB23c7Z0YuLCkawrogon76l4BHOK8SZLrfebnWZLLt
	deU+XgKK3LWATukMeUehlxOEf2mtfa5ekLa42GMijK/j2jfjMCHYTU/4rvxXBXQbjI/vo
X-Gm-Gg: AYBFou1E6EduaMLutNE1mRjNklHE8nYQVcWoVYSQxqMhRvwdeu8R3RISh6OcyZeO9b/
	WNk/SSUIWZNJXS5NbsLeHABUAq+Eo+NKIyHerGrzSDG7asrtKiqPInosYV/PXgNChr7WjUGhI3y
	+YyJpW/cqeQBA0HEVuVaOuGJGdFbJc24NIx+6Oj4Njg2pMV3UncprYcNFolh3GxmKYuvHVQxCPD
	QNXaNRNqGeiNNjQ1yP0ugKvy8E7/5om+7H5FAKG+NQN8RLQzm2rHO0VruiVL/y9ZoT0HTjUL6hY
	aw7xgm6SXRTLPwgG3cikVpNfp6mCdhMsqFYKjVSeFVELaP2TTrPfLtax3uMHjhZH9H+oreja0KE
	VVsV4UYwNNbi6QjGu/qB04EPAfEhgpx7XIhAUAiRZc3hGsX5L3Qc5HYEG9QOh9g/vWKTH
X-Received: by 2002:a05:6214:5284:b0:914:521e:7da5 with SMTP id 6a1803df08f44-91ca49e1e07mr371652906d6.1.1793866957738;
        Thu, 05 Nov 2026 00:22:37 -0800 (PST)
X-Received: by 2002:a05:6214:5284:b0:914:521e:7da5 with SMTP id 6a1803df08f44-91ca49e1e07mr371652436d6.1.1793866957143;
        Thu, 05 Nov 2026 00:22:37 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b57e26b0ffsm438510a12.32.2026.11.05.00.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:22:35 -0800 (PST)
Message-ID: <2711cffc-81b0-4078-b3a4-decad4969e33@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:22:32 +0100
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
Subject: Re: [PATCH 6/6] backlight: qcom-wled: Avoid AB-BA deadlock in
 wled_module_enable()
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20261104183935.1214630-1-lee@kernel.org>
 <20261104183935.1214630-7-lee@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104183935.1214630-7-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xxkoTAW5tlZJBXWxUWYmFqq4JJ2nDIgK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfX2pjqdp8Rf9ra
 7snmVu/osrhDGIfidoSTWk7BviU9ygHm8yk4fPq15OpeCSqnYS+Fi0a5X0ZGi8J2Yy5xb8O8kqe
 8bOyJ0kjgadUM1omN2UiIsFnlP2HwMg=
X-Proofpoint-ORIG-GUID: xxkoTAW5tlZJBXWxUWYmFqq4JJ2nDIgK
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec3cce cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cyDCuRFuYf_2H7WJZrMA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfX07J9Vsx/FFKB
 +AdEDEeGZt9zRhXKNxtRWLzARqJw9c44XnNHnWsoI0oGwcA5BAFIpXq7yYrrrBH0kxqK2OLx+If
 J1MVzPwdjKKP9EVvLevGmbaE/5lQGsBABYcDeJhUqiF6jv9iGG9KviufbljrOohOFlkhjjUUbcw
 jCruvPbMNAw21ahug25dP3ycTntZ/dsOx5iel8C+2BxFmRErBa4i/qvciHShaOGvtMNuNUSc0P+
 3wSHqbmvu9gA/86hbXU2tTlpCwnvmYbVTJ5D1S7/azGKJ0J1a8fqrRO+VAlXnotNMaS1Xay7Qff
 NO0dt8dw/daIF48vDSpLsazcDNCCYGXm+9mcQGyR2k1hQdvIUmDyIGUAf+XI/ZvSiM1zoe6JMHL
 whjiOC2KRgMhgk+xv/F3aUHFV4f7rW3Tl0FHCxjHAP92yqW3OCSzLMA1aUCBg44M31RDmq2ZoyI
 D8cK/RMp8BLla13l+xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050033

On 11/4/26 7:39 PM, Lee Jones wrote:
> When disabling the WLED module (for example from wled_update_status() or
> wled_short_irq_handler()), the caller holds wled->lock and invokes
> wled_module_enable(wled, false), which calls disable_irq(wled->ovp_irq)
> and blocks waiting for any executing OVP threaded interrupt handler to
> complete.
> 
> If wled_ovp_irq_handler() is concurrently executing, it attempts to
> acquire wled->lock before running wled_auto_string_detection(),
> resulting in an AB-BA deadlock between wled->lock and IRQ completion.
> 
> Use disable_irq_nosync() instead of disable_irq() in
> wled_module_enable() so that the OVP interrupt is masked without
> synchronously waiting for the threaded handler while holding wled->lock.
> Because wled_ovp_irq_handler() may already be waiting on wled->lock when
> the module is disabled, verify under wled->lock that the module is still
> enabled and not disabled by a short before running
> wled_auto_string_detection().
> 
> Fixes: 8663c188beea ("backlight: qcom-wled: Add auto string detection logic")
> Closes: https://sashiko.dev/#/bug/linux-3afa151c-7b8f-432c-8f85-8c43a83b964a
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
