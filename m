Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA90241E6CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230403; cv=none; b=ReGjDwEwnsvJNFdF07rQpbH4phLCynLhr8sfpgcltOUr6LhN+lAuqaJsSDQNlZefRNdBzntcohO+lFOsDSHNZI1SU8VC03mJx+0YC4YG0snKmRS3lF5eJWYlTW9+0LdEuL7s3jw2Ehh5SfI895Kdfh1WvsTr75kHhyE8COwNJEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230403; c=relaxed/simple;
	bh=YeAz3ZiVICsPGo9HW945ctSIDY2E/S3Xka08U3kOzks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/pOG4u2NogKxK9hut81GsXZ4DC51q5EGX62+GL0Is6YmvORkWxeW117Beub49VxRJJHXf++pqx6Go/X/rzY8jzbB0R+l+NTqNnxUQgOz2lzx1Qw2n8p1CE0Am0KJ/NvJOYrYsI0+cOvU+8abPu6x+bep37Cp+WQISjjLL5lXC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8tyKFmA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dYNv46FB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8tyKFmA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dYNv46FB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S825Q02071472
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VEi+hgqnlSwLcW8Ov2RLcJR0aePKOCpokuohN+ezecY=; b=Y8tyKFmA69KeOo0i
	nyr/7QZBR195o9tkJq9836onogJpj9y/aTuOqyML6JdJteb0oUcOPGnD4dI/AT3g
	8a7WOsCudM/w6jeDDlJ8bpXntgRAEKzUUamSI4eglpa6OfmMobVgjC1vj0rm4xvc
	izmUedJ1LK4CrUUnHHQgpt6EnMLJWSnohUmp9ZUq5o9S+X1zGGzMK7V14jQBxgQZ
	SKGbRewBZZH5GRaGJWSNmZJRQ/gvTHwlhyf0BdpeLY0qcYyJ1EgVDh27aU6kweEA
	o2to/zi52QJH+DWjsOcAYbEuMAGGc85kOpO4Hw1he3J5Wd+IAL4C9IEXbbiL/lq+
	lWd2LA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpqxjgffj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:20:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51e9d892f0dso11853221cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785230400; x=1785835200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VEi+hgqnlSwLcW8Ov2RLcJR0aePKOCpokuohN+ezecY=;
        b=dYNv46FB9ZSJR3itCDs2UMZKDmI9v/O2mccMFC0bTRRSX38fpAd4y2a0wfi13U0xjh
         m0K+rdl5LKQWchd0cYZfv2Sf9ecYm1qE69400oRQqL9ZWo4NkSSdYPmWOC5N5E13jgYC
         dtmHeRTpwr4jaZjzKjT37onB77Vf/YMZBl9LMh3Xm6sJhJe4uC5+0CU2ZIdQWfGog4cN
         gs9Panodxs8uz5s7CHZ57fc5Fjac3dOEhejKtXc1MA5IrmJGVMiLMvGRHBajrUc0DR6a
         E6nHmRB35icoBgVvxDQoVUctrPo9vJ50fYhMJrSlp2nnEEKJDxCojXNUSzVJnJ0ppyD+
         t3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230400; x=1785835200;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VEi+hgqnlSwLcW8Ov2RLcJR0aePKOCpokuohN+ezecY=;
        b=ZjagAdssAwuk4kuhEMhFWny8jL31iDUkLwWbgpVVvgf6540v5NBHmd7xsq6Kj3XYcz
         zXRJYCzpnDCmgDEnSr4BcvsRuHeDgtfJdww/XK5KRcWwsTi5MEHwsu4hih96hmKjidnQ
         dnY7CXMdFBhSREqMTVS/xGfmzWkjh+coJHiGZCBbK3TTA//jC7kXjpdheSPg25tUgFBo
         oqKkZfSpdyiRO54DTn7PlU8Mt+DU1guGKr7fIZuWgo6BbdBYzR/ku6t1b3v1Gba9yP8g
         Oe+dTGiAF8uPRgQzkXC3ua3TZwaxjGTFScDfxfR/dbpO/T69NxVm9N0gMrLj6hs9TnLv
         /HjQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/92QJYdddDkmOxL2E3IXCIoB88eIxVUOP+VgTsRmbiQlMQQLL0T/gfQeoqezG5yNt0SmCJ/I8bdJvZl5B@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf52/fHrvrueHzVn93QdmHPMTsZqbjmkex/VgyhQ2SFBYRtm3e
	tJOgwE+lnl2bWFD4yG+NWv4nfm+32lgNs3x++XdeHi6SB44gCLY6o66qU2aWwCuqjjbHFOqz03W
	x6Snj/MaxwsX9M6jOaBMrtmC2zDsxT+70Lg5VXx9Euwr05z64nZdPmEmDg1UVSmHGcZ2F
X-Gm-Gg: AR+sD13qgPY+bYQCsXVm/X9EOAActjM57pR43tEMfszTHS/XCOn0y1A6GV9umV+WnE1
	7sT+ecAYFT4nw/Ot6mCg+KhYIN1j2+J822CfW9O68fGkvzS3vhDz4iitP31RmWP7E1L+I5u0kkD
	tBreSQohvrYIMdrZjXX6hUYQuH2B9VY/9kaL4zl8cG2P5JHsUIl256lDI0knqHN6OPMV4A7oWLb
	fCSu72e1tjzW5Jih0ujB42J3ADnMRk/zLCw/w6N0omFIJuvMEvH0VinXfSs9YFPy79yF/gkf57q
	OOsbnABNN+mqR8mbVHkSBTfNWEupCTbFtBX9Tpf2m74qd4UWBJIOAXKqOLvTMEY4cbZfzcqRWD5
	/J7+xTQN8END55z4AtiC8g/P/
X-Received: by 2002:a05:622a:58cc:b0:51a:d45e:638d with SMTP id d75a77b69052e-529d72160f5mr9344781cf.8.1785230400068;
        Tue, 28 Jul 2026 02:20:00 -0700 (PDT)
X-Received: by 2002:a05:622a:58cc:b0:51a:d45e:638d with SMTP id d75a77b69052e-529d72160f5mr9344611cf.8.1785230399590;
        Tue, 28 Jul 2026 02:19:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebcc4dsm751829166b.49.2026.07.28.02.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:19:58 -0700 (PDT)
Message-ID: <2a66d7a8-91e6-4aa0-a650-b951fb5fafba@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:19:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP
 support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
 <20260728084012.685036-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728084012.685036-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iJ_vDDhpEQFGbAUQYYTYoZpsYBpPYGNP
X-Authority-Analysis: v=2.4 cv=MORQXsZl c=1 sm=1 tr=0 ts=6a687441 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3a8ZAtU5bMRv0GgPHFoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MCBTYWx0ZWRfX0e6lrz8WnJ1A
 Jl7bSb5YgBv1k5YAt1ZsCoFzWMFtrc6JmGYvKLSy1XuR253ep2agiGld3oTOAkVygEYcHhGDVy2
 wTqMq5SJ8AzH1K/JZYmLsE+aPZ9F51U=
X-Proofpoint-ORIG-GUID: iJ_vDDhpEQFGbAUQYYTYoZpsYBpPYGNP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MCBTYWx0ZWRfXw4kJSUxlPSU5
 RCBWuDvLWgCgeag4wtLpB2kS3tyZoY9D3t5FR1F98BCm/KNVqX/PvT8QiqCyMQrrylNVMAbIbUP
 oR4v50htC+nvKA1PqDewdCzH0THJDlU0CvoUhkvzBaDEjEs0V/Ulj55qqI21wQv7dJN8F1NO4BW
 J4K9DwYmp3eidpNsKt9eCmmRfqiXfiJkdr5LL2U5+/3F89bdfzzke6NOfjYqwOZtQlSdB0AkEXi
 4D54O3ig3QXx5/pPUSVmDozS/ScdCm8dmE56Qta7bmNns7rwqxrC5oeRZmFYmp9kRjRNFWagHa5
 wxJyuGq2YcSzgo3TtEha/snm9T63jNo0ZBgLwj1V5bG0p52bGSm64TIr9cXwnT6kTJKEVBFCR0L
 z156gxbhEn8SerF311dZa7Go8LB/YV7GkbqbI/Y9S8uMYx5gR3+s7a/FBtViMz8R5rw2c2G4XBJ
 ITuQ1hhbQTG9jX9DQsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280080

On 7/28/26 10:40 AM, Shawn Guo wrote:
> Add support for ADSP (HPASS DSP) and 4 CDSPs found on Nord SoC. The ADSP
> is pre-booted by XBL before Linux starts, so set early_boot flag for
> attach path rather than a cold boot sequence.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

> +static const struct qcom_pas_data nord_adsp_resource = {
> +	.crash_reason_smem = 423,
> +	.firmware_name = "adsp.mdt",

Please use .mbn everywhere

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
