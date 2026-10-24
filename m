Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792849571;
	b=XEXm1q8JCdjXZzrv4xlhbpfHfP4TgYV12v4szNgmTb7H7grLGey9JgFxVJlQVMWbT+rT
	 lWkdgkIIIxwz83LhKFU4UMVrjLxMZL8GpnKRHVlApQ516Z+5vnu2/ifx+VbW2PsyjrtgT
	 XkCvKGBPXvJ9cWpD5tv3a8YUK05IFpWZ2o/JA0Bkc0nRP9JxOAjaqpPCbUCJC9/gjuifq
	 vEXcRXqEDVncdNEBGH9CO9hVTGqmsxKFgy6UMV6pUB660hU9R3XXxLsaPkqI9ExH0It/Q
	 WifQOWArwWgdas/rF4RXi10A4fIP2RSj5VI+yAE8Fmu3h4qKEPYJH8kAlxmDkriAzQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792849571;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fg0PYiPhEEa2RvF2n3hYUMcD35Bigy3qAux6hc+eWp0=;
	b=dtex8NOXz/fbYUrlC06y2wi+YumvM3s7TSV87LI/mfLGerDhdnDpVwvizcocnlr/EJ/u
	 c3ahdd8PMUj/UREGJmKbeceCdBUb2ReQko/Wh/+KbIwgu2nFqN18XVeA7SiKyjdlI1m08
	 87TtT1a6DskdyByVy0qhhq1JLxo6OZrhYcoMdWD3Axtt8II38dTl3sCISwT+PcPcgSEIf
	 idXgtDeoJZEElBTN8xNsJ0gex6s2qpGm9fL9vepyaNndO3kAlw7eYb9JF1WXelAMN41Ys
	 t0gZV7T2PH7pVSEZpfgxe9meXn9GyST07db3VgR8U/yC5vFEvrte0jROfHK5kar2sLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CaYHtWgJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cNE9hJTa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F56606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 13:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2F56606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CaYHtWgJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cNE9hJTa
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8odBP1167159
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 13:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fg0PYiPhEEa2RvF2n3hYUMcD35Bigy3qAux6hc+eWp0=; b=CaYHtWgJNFOJxoy8
	xStFCKPun07V89l0j6nxgP2m4hPgi/CC4mqxiOIhpokVu34ezvxu7MbykzR9cW8A
	/qL9emOQcyy09hMcfYidldlPrnezvh26m1RTWOSGYLq5RfWM9d7yaXXAbHG5YeoG
	WCiqYNWRxpXyfu/k1vd6Tn7zgeOANpcMgJ3Yvfj1SKOde+q8+J+e7m9Yo6iMiEQh
	SEhRLJdupZeuIVUtKJPJswjhTYwyu4MDA93gjFsKg7w6lIAUPTDCKjuZCQAlFjoQ
	2C7QjYqkLXmv1JjI1el+dJqnKejlzOlrY0Ts6dTCAz4R9mGqap6l72ey7WSn73AH
	CJGYIw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3h1ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 13:46:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso3699616eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 06:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792849569; x=1793454369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fg0PYiPhEEa2RvF2n3hYUMcD35Bigy3qAux6hc+eWp0=;
        b=cNE9hJTa8tw4HvhgqO3E+L26PNqrdrMGJAsxQPzjlW692xy8kAY+bExaFTCvZ/0Ok/
         HyEU0fN5SzMcVe3K9ekPLjwZBIxBjz2Zz0KA4W4c6jSFNfjV+iNc3ISpRXWfFb1LgdeM
         ND0jEv77QD+Fia4j7gItyCHDNgJ9tMm136P6swDNzT5VbmuFaUBwjf5mhQ5AU6fKKD7E
         H00FE09sEC9NMZj6ZM/CQiA9o2FObFBh5spVAjhVIuCYNijd+rIpZGgmMZTWDtbCUz2G
         mINtGHbzNgizeR5BOuayytB+rJi57sz1V9G3njViWALpddl2JXWjIqQ8bqfdZCOV7y46
         Tn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792849569; x=1793454369;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fg0PYiPhEEa2RvF2n3hYUMcD35Bigy3qAux6hc+eWp0=;
        b=RDTiVJdGQrhm+ovmrGz6WO8A+glnnQr3gx/zAylzxvBtMmxYElYMRZwLofmOAgHCt7
         hW9dcoTFjmr7Sl3mksUjuDdYECeSqfGvxvYtUac9q8EWj558Yi0kzdMYlykq6VqkStsz
         miLZS8Tvl+cfWMscXguXPOAMphsDK9U3OR+Nnpp461YQZXMbOeK2jixx4PqMMrqKZPYW
         qR2TR3ROr96ejKPNomqVV4/XIC4r9dHk9U5RF7NvwOvf0932dMFsJb7LTPsPSoqks6Am
         sUWxYUSg9EKD+BDD+GTDtwv+e24qOH29eR/hZ0Ugg936+USqq9sEHVo+JMiiJCJKxRN6
         1f/Q==
X-Forwarded-Encrypted: i=1; AKwUvBx8W05bAOCHJHxaWNNkY5k30aLVucxkQayB6TtH0tH/QEB8K0GOnIdBySSe12Uqbh71htICJBVvkIpmRuJm@vger.kernel.org
X-Gm-Message-State: AFq9FYLC3NtNTkK5cCo96+eUjlYUCGsxqqPnV+PWopF2q17jV/qFDevf
	rA5eCR+QJFkm5gjE7m05ullAlIr3ZRRwF1md8Vh7WWh9UDWn4PiUrqlE7ZIyejxcteE+2jXpW43
	c+XGDNkV2svy4Fo/fTdkO9QkRMKzKGKylwSv7uu+nBJ7mdIgxdWZcBuPxYe8t63jqkV15
X-Gm-Gg: AYBFou09wv5K9XzIjMEx7y7DkE1Q2cga1kxBqGUjgMAdw0y6sO1ExcMebzfvKrSHdIw
	HAde7BzaHiJ1k/sY9fV+1XmZrI2UmfmOZYKhfCO2mdqmMysialeMQG1AsV3EmNqXGAEJ8ui/Ll4
	SCdbkcK/YUCxpS0/TgfDvC6BoSxVEyEUikAh2wHBcx7Qwtm/QLoJM2yyNGgnFxGH3wO3Jyhj2u+
	B15QTjKZZ2e/Y9LQdFDwvwI01sDzyJqAtvlGzeZp2xKQhrMRVHYoP+TB6CP/XLwK8AMCJKw8sgU
	rkp3oAfGTrcl9fI+3Y79QxkQ1kUqY07jrNSQvtVYYmS7GJ6YYFuTTWPn7MAOxbQCri4eS7Q2/GC
	KhlvVpeL9lRxv8CX5gcyAHmzyEpr8hw==
X-Received: by 2002:a05:7022:51e:b0:14e:d0ba:75af with SMTP id a92af1059eb24-1994d8b728amr3780702c88.6.1792849569365;
        Sat, 24 Oct 2026 06:46:09 -0700 (PDT)
X-Received: by 2002:a05:7022:51e:b0:14e:d0ba:75af with SMTP id a92af1059eb24-1994d8b728amr3780649c88.6.1792849568780;
        Sat, 24 Oct 2026 06:46:08 -0700 (PDT)
Received: from [192.168.29.10] ([49.37.153.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm7294224c88.9.2026.10.24.06.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 06:46:08 -0700 (PDT)
Message-ID: <c4fc0651-e9f4-49dc-a43a-6223e1ca9997@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 19:16:00 +0530
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
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <6b539621-20a4-42a4-bf1f-1fd58f803581@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JIBhwdsbs8YsglwbQpYcPf8SxUrTLTid
X-Proofpoint-ORIG-GUID: JIBhwdsbs8YsglwbQpYcPf8SxUrTLTid
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA1NCBTYWx0ZWRfXwGSSXUNAdDMd
 0meLUwoPAzz4GlPYBANoZZZMaCtceUXWUaJqz6dQG0bbUFWEblmJ1BKvnhztUkA61SLPZmOf8DZ
 RH3Crojfyy8mRg4I+hbkbQNRM6wogK0=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adcb6a2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=hZ1hWxSZf3UX9FuxeSnJ0A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vk6uEdKFTZbF_VcgUCgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA1NCBTYWx0ZWRfX3D4mw8u4e2Ys
 acvCDhDVDmnbI4Ywbfn2MdYjY4WxWAWe01Lf+4Zof8zc5KdtVwRvaQCOsDeKF7T+N93Oq4xpA9U
 3u8PwvkCMhXkXckbNue1hOWZ2mn4Q0sJc/CFbNJn/H+FfudDan4majmhG7ZlUhIUQsnAMGUxIt9
 Xnuyv4yoqlgnZGXpBtkRyAmUZzxcc/vPhL+HunRLaqza2pERJM5LFZv72bQzgZCA1kveEIAGeMH
 Oqhb9X+crSSiZUaxyG/9jO61rD1t5z+89AjjnYYanvgsWHaDQ/+jEouNZLoH4td29Wke4/XPbp+
 vKlN9oxbXZlAUJCghvACu0MDZpZr2oKC4J1X1OhdaeOHyDpOL+gI+HI/V4sJ1TQXO+tNN5L5i0z
 ZPJ26OYYrfi0kIiaN39hcgfXcKCTJuzp70oRdSamCM4957C4zJMskGAm4pFmFWvvLzNob4xJncY
 hN7/MKnA8qSIcAin6uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240054

Hi Konrad,

On 22-10-2026 01:15 pm, Konrad Dybcio wrote:
> On 10/21/26 5:43 PM, Harshal Dev wrote:
>> Qualcomm platforms such as the IQ-9075 EVK now boot with both QTEE and
>> OPTEE. However, the Qualcomm Inline Crypto Engine (ICE) driver
>> currently only makes SCM calls into QTEE. With the arrival of ICE
>> support on OPTEE for Qualcomm platforms, there is a need for a generic
>> layer which re-directs the call to the correct TEE at runtime.
>>
>> Add a generic ICE service which acts as a common layer with different
>> TEE backends plugged in whether it's an SCM implementation or a proper
>> TEE bus based implementation (such as for OPTEE).
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +bool qcom_ice_svc_ops_registered(void)
>> +{
>> +	/*
>> +	 * The barrier for ops_ptr is intended to synchronize the data stores
>> +	 * for the ops data structure when client drivers are in parallel
>> +	 * checking for ICE service availability.
>> +	 */
>> +	return !!smp_load_acquire(&ops_ptr);
>> +}
>> +EXPORT_SYMBOL_GPL(qcom_ice_svc_ops_registered);
>> +
>> +bool qcom_ice_svc_available(void)
>> +{
>> +	if (!ops_ptr)
> 
> Should this also be a barrier read?
>

It does not need to be. The client (ICE driver in this case) should always
call qcom_ice_svc_ops_registered() first before calling any other function
exported by this ICE service. That's the contract. If that is followed then
ops_ptr always contains its actual value (either NULL, or pointing to the
TEE or SCM driver back-end).

We could use a barrier here, but then we should use a barrier in every other
exported function here as well, which feels like an overkill.

Let me know if any concerns.

Regards,
Harshal
 
> Konrad

