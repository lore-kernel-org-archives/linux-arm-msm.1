Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023895;
	b=fJFQHDe6dDTeMX1ujPyfNhgX5P4+U8J7GwqmWqNbrWF1x3QbKU6viluXPgaaNkhg2KpX
	 fMCaZHXoJTEtpa3QKisksCDllVmQ3fCSRtKj6tY493A/9GmCCBudYWBRTxamGcuT0NI1t
	 jSPezVuT6Wxx90FjhLxhxR3rlTiEQR40t1KDc28TcDtD/bGVIKjyUgBxRqW2P2VUrzW6u
	 +MAHpLJKk4sRxyMhV23FpA8hH2mhBWba+7Ra28k2S91mNP1mHmRxv+6x+WsWug6lChLmj
	 2YxIYcfH6ZWDUaUvxu6Aov6wWjR07NbjsI1EE9OdvJeq3J9gg0Q8qYFcKkKeGS3+1Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x5OUiKwAQQjZIMun5+0lDkR9h9x33L88VUeqAVX2zL4=;
	b=gqhhFdLSNFbP2Vpm8GS3VVcLVeB1OopuXeaHRLzrtBsHPITNAUrSclDCKzs/b+uMfzv2
	 pgtpSCvi2XzryeZat2f3F1TYyt2IsqjaY0L068hj4G5puWOMnriJZsAbDzoislOwurRCa
	 MyPMfFHzXDQ2nnHI+VgswOHzzES6uhNekqD+RBoVFAHCFogHWhcHbxGNUb+xoce5n0eAy
	 acc84pZIsmOytCJKZNIU82ObCPD0wvbsOZWt0Wvug+tw6YBv6Fon2RtVAKrs+PINDGomk
	 gcXyjtcs8LOAnYMcmdtEitkhtdXgBs0zVRgfyaox4VboyC1zVq9UsLTP5muLfDIaPtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Itxi7R94;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Py3R4D+d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D91606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D91606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Itxi7R94;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Py3R4D+d
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAswtE3033788
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x5OUiKwAQQjZIMun5+0lDkR9h9x33L88VUeqAVX2zL4=; b=Itxi7R94HI5KPy9p
	6yhs6OW11FyFFsvCLrXD4HdYWB9laEwHkrZe/1/5kHmb0QwPd1kY84tJl8feyH75
	29GIuwALscI1gsWNbeRVI+PKyF2rLDzmYspt3yxXp5j7eHgVVgJn9nwmf5Dv1Cmm
	uiySiATjiax/X2qTxJNx2RhHrlf1sA+yNYQocY0T5iHITCeCm62u8+9I54Wlldtd
	V4fv2OTFJ52xSaMacmtTaNRXJfrZcVoUY8ATbW/j91KeuVvfOTXMnN74goXj74Yu
	cUOuZwxUVcstzhkH2KAE5/8s+4cDdBFpZHQaxi3gfpO5HI90Zc2oVbiAKl0u6f+t
	16ptsA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y0sj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:11:33 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc081f3066so82814137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793023893; x=1793628693; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x5OUiKwAQQjZIMun5+0lDkR9h9x33L88VUeqAVX2zL4=;
        b=Py3R4D+dyVJRGzNI+8Khd7ce5LjQcoae3W8Qy6qKINb3KiKR5oAY4h49XD7SymTyn/
         AoVgVN+mv+fFBBiJBGQrn/X/Wlhpt6lr6dxRNEWOSjkgOcWRVSpiRV0hpsk8ZebbRs6F
         KjkhgLW4/np17I7NqvlxNb+LCChrVhW+hLBlHG6skZXLeHCpdeY7pA2/tLTiWJbkWZd7
         PG+zH8TC1iNACe/icDRa0o3IBliFPWVN+FKcyqRaHugeuHgYqOmbIvJPxc3zOb5jzkfl
         1FRh/IPUyRg+lh2xNBO2ew8mU2U7SFO3DI81FMQDzYqxxzvNpaXtXwlVD3dsrHZuBSa5
         kvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023893; x=1793628693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5OUiKwAQQjZIMun5+0lDkR9h9x33L88VUeqAVX2zL4=;
        b=wKz3zVx8pX8o7AQgU5QwmSmLZaRqcl4alK27lXZ6B07uIbfChBWwhpGyzayDr8rfMc
         jCNllX0+DadMt7Mztw9FRwYM3QNXeROjFfCznVf14T9LywqplaY4NCgEWSrBzWpAvEat
         +LOvTCd+T08Xd3X8Z9+C8LndHEiYbEi9YMyAvN28pTieDoKXkzFXq9kCTYuKyxpmxuui
         vTq/EjWOhGZjtMMbE4xiNjrcgl/sTmHsL5gAujRMFSOHJQhS6D9mcQG//EKYqA2ZhnbE
         htE/iziGv5pLzHESfCEZR+8rVZOjGo6NboTQI9nCie+JmZPdHvb25KAbCzj1Mk6aK5Kn
         dSDw==
X-Forwarded-Encrypted: i=1; AKwUvBwJkTWi0I4OSVQZOvxWB5i5LPRtRJ4ysud9DED7/Rrm6bLkNEbDPzIegHrWYazLUhgV1dtC3d9wTnjBQPOj@vger.kernel.org
X-Gm-Message-State: AFq9FYLqT8aqRsYoFMCMZ28Tm1l019OZlxNj0rdd70GiCauZyXcd9pOd
	hdm+ebU6PQVi7RR3xEjhhkrsbMd9EMfLf7ciXvmIC9Mjt9/fPsrcRTK5wrMhgkc4QUPcYjCm/Av
	a0v7QQ9W9pGNup8GEZdg0uCzfPgRtXfaJD3hmEKayYo/X0CBTmC4JyHGfIL0KSxOdTK9y
X-Gm-Gg: AYBFou23iU7GXenUZaTmpnp0YSE4A0dYKjvYsZvJDaioaK1K0OQx/zK0tVOPMuuHb6A
	MBM/3SuvjfuQ8WWIEDi5ALNuKsS/qdvnMm49Hl8O07BdRAJySWJuWsVE2FgDd2DFkU+ovBi8ePg
	mYoid5A4muhIUVZwwS4wWHfxKreqMpqkNOMETHOUtvlHO4+qlqAg9TObdWdCa8yT3vytm57fHjT
	WNnHgg3ilD9pqT+gAL836SqfIVRpEWn9iGaYX4YjEF9gY5+Zb3cdPVOxGKuKPx/fCaqYldBLVmq
	892esCrc88ySokC2CLZS6MkvfLjrPS4OuS0eVYgqo7kzOWlK1GhssZY2QKOQXOFWEkMXK0qUmOE
	pST8hLQn/I19o2f1+Yb/uww==
X-Received: by 2002:a05:6102:14cd:10b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ce5c6d2e04mr1945033137.0.1793023892860;
        Mon, 26 Oct 2026 07:11:32 -0700 (PDT)
X-Received: by 2002:a05:6102:14cd:10b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ce5c6d2e04mr1944964137.0.1793023892290;
        Mon, 26 Oct 2026 07:11:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459713f9sm3771801a12.16.2026.10.26.07.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:11:30 -0700 (PDT)
Message-ID: <d2073055-22c8-46f7-ae57-16988dacaf60@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:11:26 +0100
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
Subject: Re: [PATCH 1/5] firmware: qcom: Add a generic ICE service
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261021-ice-migrate-tee-svc-v1-1-b035be7aab0a@oss.qualcomm.com>
 <6b539621-20a4-42a4-bf1f-1fd58f803581@oss.qualcomm.com>
 <c4fc0651-e9f4-49dc-a43a-6223e1ca9997@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c4fc0651-e9f4-49dc-a43a-6223e1ca9997@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX6ldi3yAxhLGS
 6MVLeniDEjcLA5hLpvHyq/GEGlGM1la88ehvB96tBsZECooYg4S3DpVPCzjEBOxPeSL0euC0EF8
 AZZYXlvK7ixc6L46CF+S9+dHLz9cmiY=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf5f95 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zMFzIM3uWIHz1-PbWX4A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX45a8/CW9xXbS
 E8od8znIeNGELdNAXVuzRNAjGdusWA2Ig0qa0GZmYOsBQ+aTXDpE+hKzufDCL6ulMKFDzNnn1Ev
 J8wnL+OpR1ZKtLzdaH6RNrgJrJ32eFoQCMe407octEbA8X4skr16hYAo+HHnxORHE7dq5hAWzn/
 aS4xpDkBO/lKNEhiAby/2Mga4bpYwhuSZ53xkimj1/DqHqIcIPSOZUS7J2Q4dZ/+O2HLfwUdXCI
 UlpUrzqS1oSQ7zCyULrBX2sAOSBV9eTDcY596gNa+vSyiIWTCyL99YF8fmexhMXnYv9E974ozF3
 pfLT9VwclEgfDEchi2vlOrCC3RhdOPlf6yz+1fG2V1asSeib0FRiRbp8g0HoIGHR4qZupl856aX
 F4sVX3uznUubzUBYZwlp+cu0tEScNC4WVxZEsA27Cf6lnV9WdwSq0qfpYCHN8AyHv/yIORY7/AB
 grOErMygjhZf6iPztCw==
X-Proofpoint-GUID: gpHMfxwxedgJ87FV6ptXh2-rlb7QMLE_
X-Proofpoint-ORIG-GUID: gpHMfxwxedgJ87FV6ptXh2-rlb7QMLE_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260056

On 10/24/26 3:46 PM, Harshal Dev wrote:
> Hi Konrad,
> 
> On 22-10-2026 01:15 pm, Konrad Dybcio wrote:
>> On 10/21/26 5:43 PM, Harshal Dev wrote:
>>> Qualcomm platforms such as the IQ-9075 EVK now boot with both QTEE and
>>> OPTEE. However, the Qualcomm Inline Crypto Engine (ICE) driver
>>> currently only makes SCM calls into QTEE. With the arrival of ICE
>>> support on OPTEE for Qualcomm platforms, there is a need for a generic
>>> layer which re-directs the call to the correct TEE at runtime.
>>>
>>> Add a generic ICE service which acts as a common layer with different
>>> TEE backends plugged in whether it's an SCM implementation or a proper
>>> TEE bus based implementation (such as for OPTEE).
>>>
>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +bool qcom_ice_svc_ops_registered(void)
>>> +{
>>> +	/*
>>> +	 * The barrier for ops_ptr is intended to synchronize the data stores
>>> +	 * for the ops data structure when client drivers are in parallel
>>> +	 * checking for ICE service availability.
>>> +	 */
>>> +	return !!smp_load_acquire(&ops_ptr);
>>> +}
>>> +EXPORT_SYMBOL_GPL(qcom_ice_svc_ops_registered);
>>> +
>>> +bool qcom_ice_svc_available(void)
>>> +{
>>> +	if (!ops_ptr)
>>
>> Should this also be a barrier read?
>>
> 
> It does not need to be. The client (ICE driver in this case) should always
> call qcom_ice_svc_ops_registered() first before calling any other function
> exported by this ICE service. That's the contract. If that is followed then
> ops_ptr always contains its actual value (either NULL, or pointing to the
> TEE or SCM driver back-end).
> 
> We could use a barrier here, but then we should use a barrier in every other
> exported function here as well, which feels like an overkill.
> 
> Let me know if any concerns.

I think you're right

Konrad
