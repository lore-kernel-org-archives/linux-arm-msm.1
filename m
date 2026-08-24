Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073C5438034
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787580586; cv=none; b=nOokHvOj+naLhP2INTYt4AmLe4TS+loc2SkZTSR5GbANOwAARB2mecp7VxYZTNPKbVvY0CaHT7mRgmrIekbhpRcJ1NmcKS1shA2rd2ESY+Dn8cFMNcf03li+bEvMdOJqrtqW/kc8jDn8IxhoZsFm5HYSAHctr9MkHxUONHiqjc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787580586; c=relaxed/simple;
	bh=hnUwIQeTGt7/OqMyir0LwszHAezJI6J7EFXtq7uY7DQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Awazt39wqPVwXP+a1eTP4egJRzArmgJ4JqnOj3Cx4lK7MYWceQhoxbswALrnKJt49JmwPwACaOVdjrKexHCsu3PjaK/RClp/r3nrhNKE/+A6Hn+R2nhC13u2vobcun44anAyVlhpasOEcOEh7/3R8CPVVizlqZjRYlPaS0wWoFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ixlk5aCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JwsFqkI5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ixlk5aCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JwsFqkI5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCv58q2006636
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fzSeA7475RWMSNaesV+ZLrLV4ITpt8WwgOeEK96e7gc=; b=ixlk5aClLy/2C7Ul
	7DDsRNNXRwzyinziMcsqDpypA9acVyuqTsqruyXpZ0FIaQX6bCutsMA+KnaW6EFC
	Lu4C1O9+vq/xoSu6UvJMnb/I6/FnDd+OPSFrk7uj9fC/ZK+ZDH6zHGOyD593y9h8
	59ohiUbO0t0KZNGrqfFqQtzBMfiZprvUz3MEhfg1fpR41zWA5qtEhv/HGLD3FWgI
	TWKAmBQRMRQwdVgY47KXAbjCvbyJEh93a4/uDCcq2EiPLNrwwiX6F5PodmPyLIon
	5f9WgTnKNY7P6WHqZnJxYjiISa+WAHzXSEbByLlBKRGxEuNrEvE/Gi/pbOrowiBk
	TTbT2w==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv78y55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:09:44 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7ec54966bedso5665392a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787580583; x=1788185383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzSeA7475RWMSNaesV+ZLrLV4ITpt8WwgOeEK96e7gc=;
        b=JwsFqkI5Gb2BUj0DQoo/IIFdfN1FzNjE1piYeNMCYPsLC3/YyFwSM6F6xOBM05X2jQ
         MzT3bj43ZQHQmtSaaMEOJR60TJZapXp+LXlkyN0lZy3SRO76KlSu0LryIuGimbsIEGde
         d1Tf2d7PIajan08WB2ZogUcGbdiQcyBRUyqYkX3xY9FGTFpKPgV9NVSErsfrXbIkd14U
         gJie4j1hNf2TzEkQnqp67IWHUsx3Y0prI+Jx1B4lktN7XN8CoWYIF24facb4V580ZUik
         af5JOq30zxlX9DP7SeKksg0GKNhmiop/Mpzu+zawvy7juLLQzSC50lKFgpjEiOgK+lYQ
         h5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787580583; x=1788185383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzSeA7475RWMSNaesV+ZLrLV4ITpt8WwgOeEK96e7gc=;
        b=dXdqx9MqQRG+FP1yYNeKuRT3BAArYPr5yo0uaqB4Dj2AWSxRAyd/kTSoKnGna3rfsn
         +AWpzJxol9C8SW8WGfiXNRQ4Xv0oNcUmmfwTpgPhwKU9xGN8FyjqfAuTkfVIDg1MSm03
         uIl34EhUivP2eU6F/DwSdhjdv6sDdyV9zGBe9ePe4bbQcwQ4bJthJuOdni8YJIAg2D91
         3OHCqfl6jFv7ozjd3tfkCUdQyjPYuYm+kd9K8M7Quw3EnIqI/KRC+FkOBEjlYRqOeSXV
         nT6rX9XllnHNRQKY4bk1uZiSjIl1POM/oyMx96mQdWfP4mRhHvq5r69zZiIfcJ61SYUW
         2tbA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4PLtMXLStaaHLQDz/YYl/dqLYqT19tF9KvnEymvQOGn1JJg80DEK2fF9yJ+qdHD7BK5yTX2AowRO/lHz+@vger.kernel.org
X-Gm-Message-State: AFuF++kpXt2tEXMuqvQLV3k4R0dRfA1P2QOpzJqZpPWpsKrdGgD7nj7j
	cxGJ6/C/uy6i9OdUa+twr6ri+X3m0UWU/578sITETq7T2x0ZUivQA8UWOKPFrDWCfcDBM0LclpA
	BAOQwZ3qfdLdkexCz11iX/Feo6uHwRAVpqrjJ/akzHjcYvliRH4C7vWcccI+IjXftbVfd
X-Gm-Gg: AR+sD13DtZ0BTodX2Smh9LbZi4xdNjhtPJ9/3nR5OR4C0PiFSuuuTuqto6zuUufyqfr
	xJOOjTd7TCSN7pPqgDXI4axNb3ZRnFA60ViaoTB+4upBFkI0SetkoLtVWlvXnC2jvDeMYWP6dx2
	rsF0nYjBt8sFHTT8pnN/z6s9+b2a5o7+AkB/jUFBeK6m8kdFpzjVlgGeDHC6mu8ACvyUtE80ueg
	pzFt8BazNvBGieH6bmv9wfk12rFKh5ZIL7H+8e5mRn/IQSfP4UoGt83SH9BiWQhGabJJgIB/x/C
	trLi3R7/oz9Gkwwt7E32ygwnUDAGaLPrYHCEa33o6GPa66CI21fFAToOVzcNJaPmk1zEyATme45
	a2WE3eq5pKcpfC2Y4xFtO7Ld2gqZAcQ==
X-Received: by 2002:a05:6830:82aa:b0:7f3:9729:a9e3 with SMTP id 46e09a7af769-7f462bce15amr25970125a34.7.1787580583514;
        Mon, 24 Aug 2026 07:09:43 -0700 (PDT)
X-Received: by 2002:a05:6830:82aa:b0:7f3:9729:a9e3 with SMTP id 46e09a7af769-7f462bce15amr25970068a34.7.1787580583002;
        Mon, 24 Aug 2026 07:09:43 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.106.1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f48fb1db63sm4886236a34.12.2026.08.24.07.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:09:42 -0700 (PDT)
Message-ID: <5d4e4e0b-3180-4ad9-90ad-2cb0482fc87b@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 19:39:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: qcom-geni: Drop unsafe rx_buf realloc from
 setup_fifos()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: konrad.dybcio@oss.qualcomm.com, Jiri Slaby <jirislaby@kernel.org>,
        chandana.chiluveru@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Praveen Talari <ptalari@qualcomm.com>
References: <20260824-drop-unsafe-rx-buf-realloc-from-setup-fifos-v1-1-52d231c840e1@oss.qualcomm.com>
 <2026082458-lung-knelt-e760@gregkh>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <2026082458-lung-knelt-e760@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c50a8 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=3DKySdf3VQHjbkfL60kt6A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bwh0WvZscbM7pm4pYAQA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExOCBTYWx0ZWRfXzTZzAxgd+/K9
 +MEU8G6PdzRiWExIJBa+OcnKPRtT6xXF11RgAVr+MraBxxAu+tiYf4+c9g+ZXuv7KcMeBt1MBAx
 n7BD+551Y77CO60mfXaVUbwgAww3igs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExOCBTYWx0ZWRfX1AmDFWP1S3/+
 Tyscho2xI8uBSkbv6l52KM7CqD2g28RY6Pll3pwXbApVLx5BRQMCiw0dQqTrlRayzU0It0ROOoi
 jbydgv/ewTljFtW8+eZMgqjemLOQItf0Wyld1GGDrTWjeckYSXQKtT4XBh3sOqHjgHsGrKV0xWZ
 FnfnNi+QVgN3AGZ43OaJtm2oM847HTKgw6qDp3T3CzIS4c6wGMDE3hy0fIG7EBY5hV0mQ1kQiiK
 WSKU+WbxSOeWsofkKzAykEM4QUobmSD6b8OH9CrRqOL4CGnTkpLxf7pSYCliUwxRRTPQ1lFiFjr
 kyXJ5yeWgKWpEvmLYx1u7aK1J6jSaIPczxp98yRx1ooHCsttAwMogixgQPKC7VT9H5Gx1lvsJSr
 dZW85aB7+McaKOldPDxz9ba94KmnEK+SEOL5cH3ytL2XQ/49rtho+qBf7s/VbGKFCrIENIGcxNx
 rvTC/XoJym1+mQr8aHg==
X-Proofpoint-ORIG-GUID: BGgwmOtd2hncZVG5YmRnfHt_nmN7CAfs
X-Proofpoint-GUID: BGgwmOtd2hncZVG5YmRnfHt_nmN7CAfs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240118

Hi

On 24-08-2026 18:26, Greg Kroah-Hartman wrote:
> On Mon, Aug 24, 2026 at 04:15:14PM +0530, Praveen Talari wrote:
>> The RX buffer is allocated once during probe using a fixed DMA_RX_BUF_SIZE
>> and is DMA-mapped for the lifetime of the port. However, setup_fifos()
>> attempts to reallocate rx_buf whenever the reported RX FIFO depth changes.
>> Since the DMA mapping is not re-established after reallocation, the buffer
>> pointer may change while the DMA engine continues using the stale DMA
>> address. This can result in RX DMA targeting memory that no longer
>> corresponds to the active buffer, leading to invalid DMA accesses and
>> potential memory corruption.
>>
>> The RX FIFO depth is unrelated to the size of rx_buf. The buffer is
>> allocated independently using DMA_RX_BUF_SIZE and all RX DMA paths consume
>> it at that fixed size. As such, resizing the buffer based on FIFO depth
>> changes provides no functional benefit.
>>
>> Signed-off-by: Praveen Talari <ptalari@qualcomm.com>
>> ---
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> Why is this signed-off-by twice, with different email addresses?

Apologies, that was a mistake while updating the commit message. Only 
praveen.talari@oss.qualcomm.com should be present for upstream 
submissions. I'll fix it in the next revision

Thanks,

Praveen Talari

>
> confused,
>
> greg k-h
