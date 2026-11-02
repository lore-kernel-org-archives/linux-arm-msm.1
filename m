Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626806;
	b=4B9vapwY9CUD3WOmdtvQ1vVU4kwHFgsBwCIExsQHLGZRLIh7+fy+e+mPrQh9lYQM8sc+
	 w0VvudVUfwJTfdhB7EBH4pgNfo9vcEIH7I3tDnXkMUYzSgHPvBUf8YcOcqIjXPABDD9yL
	 Q4FGmjKZozzXA21jOpxjQfWBIuP9qZF9qh92CGreknn7NO2KiBEyVOk8ZaROjXI/sliR+
	 AXGjBEncuLm76VIAn/YynOEK6kirG4pptH5kfoNYCpa/d7831TeG2mOhuiJKBVMlekV9f
	 xHy6F0Wzr80CXnsPkL0P1fAV9GwHPnJyPOpW9pwuh3N3OfzZNnWU+egDLvJsew1MANg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KIf4+Hyju7Y41HcbRBU7z2Zakj8G/vHRwpElmPeci6k=;
	b=i9jLDPErHNMd2T1/qXsDFI9z9XMvXEtI5GuyAjj7ZK7NPiV65nO/hF15QjHikdt7q54p
	 QvqV6E5EKWpoQc/9tSmUyRp+IayVsC70Q+VT2zZT8sAjlVgBixgCmV48ZjI/MNdtz3YSn
	 aURzz50II5n0DX5zpvjz4FjrF5t690+Xr9wT7GEiW8DBoRVMhjfJdhW8UFRF8r9cAEQJx
	 7n8x0k01mt2Ws9562kT6JthXpcx7efrCkhWebrNI5ukor5Kp5o1+u77CbOcFdvdsZhVuE
	 ha34oygXMrkOTDlqMmib0hb2GDqRCMJSB0viTHaZjE46xwOyPFMo2jYVzZn+X9z5Hbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jj4Lun64;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViE3HMoE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3F7606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E3F7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jj4Lun64;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViE3HMoE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAMuk3423292
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KIf4+Hyju7Y41HcbRBU7z2Zakj8G/vHRwpElmPeci6k=; b=jj4Lun64U9km35pu
	uaAExj3y1GIIgJvsuM0V/FvV6FPoGuh1MaQN17vZILYbvJYR8gI3e3Vav9C6Ai1K
	IwrRijwwSjY92Yua0V6BsvHJXuYPGnPqz1OoG5dk2VGtYzhu8ty8oc+6qLoxRAX3
	Ne4fwOLujSkNlghItLg+qGbBseq4JLREuV303/9+Ps6WmiH3wq177i0fJmZtUdz4
	AgBcVODEqS9kk+sL/+T6Oe9VnfeO+JBjsfTWb+u6E2gz9KSk0ShtZp9cA4vPFbqO
	B01WadFAeHb/9c8QLnQlXmeyQCtu+DaQDo15xYRxuWcc3yFQEjvytORcaqq583Go
	wI/mvg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrh2cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:40:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so733608385a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626804; x=1794231604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KIf4+Hyju7Y41HcbRBU7z2Zakj8G/vHRwpElmPeci6k=;
        b=ViE3HMoE8Lq+BN46kGfNy6dfvxwSLjmt48ktgwyKWnkTFIaupGVN0WujJjIoRTZufE
         TJPokCaPwL+7z8B1PHIeB/hmS5I27svGbry0zfFD03q+IS+QaCRYPoJb2cpgPdU329Yw
         V4El7k2RyOGqLe3vpjepFQGKb4WKI/Imjxd1rIILM5A6B2NypWHhUbzHPaT5cm/gkcLQ
         JqhH91mFhTXw4ZiML7FGrYxDmavih4EBvgWglia7EWd6ArgwQGpc0+IXJylwoSdaYYHt
         /JMaldB3aAiIagneOwMmEVtqyTTTj2wOQR16CT/Hg3FFoLpuhp+jZq3Uu7UeeGILNyrp
         eJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626804; x=1794231604;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIf4+Hyju7Y41HcbRBU7z2Zakj8G/vHRwpElmPeci6k=;
        b=ceQJu9unTB9/SJOsX0nVnILWRtRIUnVdVeoJrz8pFs7VokAHGx5af2Iam/ZfGJiU6Z
         FfM8NjwfpKuRdgcqPA1S8a4Vow/usRouJtPULAeCIh8P5UHbl8JHpM+x7aemef2qe1JM
         tKabXi365UBPTI3BEbQ0Ht2Q/AwPJy7zVBvGU2hyZ0wUq6EPD1VNNk58hsQ/P0+hOLM2
         fRy4IOOL8eu3QZ0SkuPSvVBptG94ng+X6rIVp6quDCEeKVil8NC0eZub3r3l5WJwBv+p
         7l1s7/HHKS6PqUrbgrlgoY9DqT9f+U2leV2Dju4kPkk1NYbFksyjzDWY5QVViBnv1+mB
         bnBA==
X-Forwarded-Encrypted: i=1; AKwUvByZ/JWz560z6ITyj4wiUg9PpImiKjGbvzqV8qIXv9kykUazXlL2rjir659x2bn7CbsWIzI4Ktr/lzixnCrq@vger.kernel.org
X-Gm-Message-State: AFq9FYI4ppSTUbgPqcNuQmirUrrB6g7o1L5Xocz4c/gid8N1l15Y+EBV
	GWlNuorLCFtw1Y9oTParN8PU2mFeWuR0cS4EUuzZG/wzbGyklPqwF0Rq7lGX9e4X+tKX8u1C04k
	iDAAQS6oDt8q68u3oSElUgnzWgUvrkMzU2AnYIh51irBRy4DyoTpKuwnIgK6A+hLkZ1Hx
X-Gm-Gg: AYBFou3M+TRyteW1bEY5OMjokKeWxy1XIMH10yMSqb3MutqNeLX+c3T5LTntnSrdsxt
	Slpc9zzJxZrjgEY0paOGxHKFxSoMm0sb6gGPD8Ak3V8fF12x1v7z27OAjmzugUPEB59MyHBqaja
	+8b2FEB9zYCs0CitiH+cHfgYeYSL/G8PhItoO7uy/G54BLoGgCHlZKgnAvKj0FkawqVNWgHEJ9v
	BRFOq0WTjfIvyUjgQSM0QeEnS+nDn1c3iMgm87h6Ivq6N8EzJj30/pU7X0f46abhc36v99GWxaW
	O8MOMyrOWIASaXftsezBkayenlu0lvJPZUrcJRK8pGTnPjsf0ab50jusZcFPW2yWvzBREx2WcQ/
	LtQ7zU6s4WIkWKT6vuEbr5oH3I8CKLBVtpYEg7Rg/1lc7Q3XxyWsMC34ckcdMzUWBS7j5kxv2cA
	==
X-Received: by 2002:a05:620a:2614:b0:93f:baf:279e with SMTP id af79cd13be357-94421588032mr1733671185a.8.1793626804240;
        Mon, 02 Nov 2026 05:40:04 -0800 (PST)
X-Received: by 2002:a05:620a:2614:b0:93f:baf:279e with SMTP id af79cd13be357-94421588032mr1733667385a.8.1793626803802;
        Mon, 02 Nov 2026 05:40:03 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aab10sm266325425e9.9.2026.11.02.05.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:40:02 -0800 (PST)
Message-ID: <03698f9f-2e70-4e64-8290-84315e54a5e3@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:40:00 +0100
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
Subject: Re: [PATCH v2 3/3] soc: qcom: smp2p: Fix possible out-of-bounds read
 with too many inbound entries
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Chris Lew <chris.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261102133531.173434-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20261102133531.173434-6-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261102133531.173434-6-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae892b5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UsLgiRDap3Yzww6lrMkA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 3YsN-yDV2j5yDe3BLoyDE3759FmoNrRu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX/FrPbDbpJ8X8
 0cXCX5FogPWbz1loricL/OnNvbaOM1Bg1oC1vFLYuYxEzYX6FlZqhaQgK/+QGNPoLdam9VLYhXh
 QYW/rtk9HICKBB03oEzQn+rUhcgB1J8=
X-Proofpoint-ORIG-GUID: 3YsN-yDV2j5yDe3BLoyDE3759FmoNrRu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfXynAEPofu4M8j
 1B0Ls0+LFeFutrMfiTtx7vNPtatCku9PsQl7Hm1sJlE6oshFL2nZW82e2mEh78qvzs40b05dPIj
 eLUA7U33pudFS0+VGCzfUtgVB84Rpfq8Jv0siK3fyN/gpu3/f8QaCO9F5ZAwvCtZadDHPtw01b1
 flb32wJGa4C7F3ntYcrCWW2Vhky1FDQhm/Dv5dcd9UZ5Natvky5A3m7BFF6TMqzbh32ciZrPt6A
 iGnOQJ0WiGpYvSTqx4WzvzE0Ev5JgevCuFEIpyrVCzGXqwcpArUAGBhJ/Dpoi4LU+9myZ2l4tkr
 hzJOA+AvKxdGCXoSVgWb5mALt8DW61ghChX2v4L7C3OnSCI6z12CF6YS4OVx+YhvjyBClocGSz5
 T1niMiKh7k/44dTbGb86OzxiZ9Voz+ihI4We/+26ErnrUl3JRqR8JPQkwNOR74sm7t0Zb3RYJpl
 1PyC6JZqKYdAlIuSeAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020054

On 02/11/2026 14:35, Krzysztof Kozlowski wrote:
> The inbound SMEM item is populated by the remote processor, so its
> contents, including number of entries, should be validated by the
> kernel.  Number of inbound entries is directly used when iterating over
> inbound data structure, so if it is higher than actual count of elements
> in the data, kernel would read memory out-of-bounds.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-b79427c9-5d22-4b48-8ee7-1d7808101e52
> Fixes: 8a9a7b9d14c2 ("soc: qcom: smp2p: Add irqchip state support")
> Fixes: 50e99641413e ("soc: qcom: smp2p: Qualcomm Shared Memory Point to Point")
> Cc: stable@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

I forgot:
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Best regards,
Krzysztof
