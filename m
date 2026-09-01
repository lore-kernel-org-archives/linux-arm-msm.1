Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2364D471CE0
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250020; cv=pass; b=IBeAXXdi2G6+hmiUZeL1BG3cZhuyk3VOCrQTBzZEE8e3fg3hvrTz9Z2E78nB7vgWXEULnBNLMilPUsBa8lDNh9Jtv1LjZeUb11DaTKUxATin7Z1AxJuszIYCKj7XVq3rH3Bwn3pZorqV8hwryUjBRL84uwmqUv8hPyYt/UVaR74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250020; c=relaxed/simple;
	bh=3mauDt/3krkR1odRMOOidZDtXzlE4qNU9pWDtPfeHE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpR+GhCDmeuq9prZvwGeZRu+Kykh3gCLfYVrQEl+jJKtOriRDcws2QS/CgXMD07XXJd8eQdLtAFw4NdXBBELtfWJ6y/EsOnzQHYenrI821kzqRkV6PyIqy7j8iguxMYEfUboaExgLGn2af2ZkIpXw9u5/LHFc46ECEb4hdksYp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgBzkLz3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsPtCc5U; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgBzkLz3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsPtCc5U"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681795a1705595
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 08:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jDBl9H6dewCwJQNERd8Hsn6H
	z8VwyR9WYLsgYH0ezrA=; b=XgBzkLz3MlJoKyfrHtpS1De9Q4QNV2702ypZzShb
	qfVcVJNJIobk/+aupqNbdMcLvAMN8tZUvWLGHnEhXQonYP/jS4vzv2XEuKIX8Hnp
	cJ2+e1LbfRl94AqjpSAiQwKjt0wG8g8PGcxqJWNweDJpcdCFT6EcrCzVxxdDnaea
	6OevVZgo/OTELdPXyA4SSJ19IoTsj63sUDV10kQ6v/mKVT3/uq8kJTRWSnMnicqW
	FTBRPup5aVE72p6Rx8A10MtY5gl5OtArnFCusfiLWIe/n97WXncebuH3Y+kx99CK
	ee9msLtYQuh2Y9y/BO6NAHZDTt5SRb/1E7TZBpBqrk1MJQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsgp0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:06:58 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-85b946f1c13so80595857b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788250017; cv=none;
        d=google.com; s=arc-20260327;
        b=CzzewcRPu5rWGgNTA89DO7rr6Mg6cJDIIv1I5nzsHubNrbG+JgdBlJSYjrNZPQIf/Y
         gL4kMZe17dQG3UzNj0Wzm1C190s6LY2ibUpkRL9Xrgl9BdareH68KEygAbyAnxqqHQkb
         G70b2CFxxO0s0h0UOH75rNZA4ddDG6rES3kWg/WeTLLYG3j8rZ1CYOT8zB22FeixRZFW
         jOCFUiA4aE8dXxIScVrWD87UNgOT3ohrV0aYbwldxcR7ybhYWmauiUEPgraFvmzn2Mht
         9V2G9cEBqxu4jJXtFMkfTe1j4etNExXeL5XFY8rNNB9O/qkMc0nPGv8azzGOVNTj8jeg
         NfuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jDBl9H6dewCwJQNERd8Hsn6Hz8VwyR9WYLsgYH0ezrA=;
        fh=7RlbpeWkR3rlG3dInUaZ0zO691q7yCjYhXPafVWn06E=;
        b=ZjewdeuhrAFyYJ8BADHvYZ7TBARGd/fEsAJiRNkcH0IIzO6bpoAhl6gkDQWaWy6GxW
         7OJaB0P2OtIBtiyIELltdiFUnoY8GnzUIRrJdETOL5TxPcNEusndzul3IizujuD30goC
         4zrrzQn3eMW53dMgfXsNqfEFc9bG6eojPY5G5rp8E6TVQiwDFR8lBuk7kxPWeaZIblIC
         tg2e1BQFKFiNc4/D2Xe5msFDbuWx1+s09V3/Nxux30MtVGWm39MjmnV9WmNe3YNt97sE
         Msy3hZxQGrERMfNcDhYso00veXkNTYGLrCV7fI4CMf30b+a1HFGoOdI2p50RqY8dVk4I
         9mFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250017; x=1788854817; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDBl9H6dewCwJQNERd8Hsn6Hz8VwyR9WYLsgYH0ezrA=;
        b=gsPtCc5US+5rRMXz0LfNQRdveJTDca3sFNVpaf296wmYAHARj40WxVJSHFgF7T2xab
         MBr5cGsdowbFgzSgrVYgJjCsGsBmpcuYcKsXHZ8/RlLeCOARAIU0fEGrQqD4GxpKgiHj
         oIMJzhHFTz7rH4RYiVpTlyyy2tzy74PVMQPH7QXsxALPKffeFD2vixqv/jmYQ16mokWl
         DZXSWqs1b0EONwxyg+oIUdyRV0p+QOwqDsdEc7fAe1yhmoIp6n+8su56D8gdew7Ln4Ib
         oGN25yykFwX63dvzsaSKhYKaObNPj8AnbB4XVW8w1V5iaQXNgoUs8fCd190K07OjMgpS
         cjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250017; x=1788854817;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jDBl9H6dewCwJQNERd8Hsn6Hz8VwyR9WYLsgYH0ezrA=;
        b=nF8YAPdaO6dpk1wRJQ5mYnKSZWRGa8Y9aDz5TJOcxxFmA75s4BTMPs2hqN26uYwsQY
         aPtV1PaRIJqLpfZo8AOwUALdUVovp1Z9/+yrWJOz3+lp0irVhAVmWWC6jVSUjdzZrPh2
         AHaWLoTYx7MktK+qVU8PxXwpLO7NS7sc0iT8LB39AICRia1Y67yA+0JKF31UounMNH6X
         rIBEXYAXRwdeYEBEGrhmCOfcR6b5KSyDtGQzE0e1Yfn58hR825uxgXXBlARLQbAcyaf8
         Ek7lsGfddax4s815TrUJvRHbwEpFoQCspCnJ1iAZYngXSoOuBBdH0jJSAlhzSdBsENGH
         rObQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBRyNv4TGEMcqT9hXgG+o2Ehg3yshtlZjDYET+MF4u6IKR7GiegGFAuvDpVo65QIEd4s+bUjoE8fea3bw9@vger.kernel.org
X-Gm-Message-State: AFuF++mhu40n7RnyYC6ILJEwwPpTO6CJPO1SOGI1QbLrndaQ0gtxKNlE
	R5ejqC6M8+8ssfTPpaQaugCy5r/ri8vZzhVnychHv3II81bvwCy4fQB3INZtIGaKlDHOTc1/2kY
	EhcXYdkVZ7jSxZ3SLVlESbIRVcC1S6/Mseq0Mr0kFEHIgi2gY2U7FWOghpZyl0o/oaRive0RF2h
	weOL43Hz/VRL+nMvCDNDmONh+fq4yMzgPmbgPzYwxt7z8=
X-Gm-Gg: AYBFou2+ehQeNT3gPHKpjWl3r5dXcJ9LKwaBJFw5MFmWQi02xMxHSHqExmYxIksxBsh
	Y5NPJdimtDQDwgye2/UDWReQzBVcD4fSyR5/UULUiWBIfl9YsIM9cBXyqIk48DI+mRUqpIhfOJH
	z1Hk+/yAO11XsJdYLTE+XQlX0IX5WEUC6T/ELmMVcSzeGopqaHdJ7NejLPzw==
X-Received: by 2002:a05:690e:b41:b0:66c:c1d7:4c5b with SMTP id 956f58d0204a3-66f87439adbmr2317475d50.16.1788250012400;
        Tue, 01 Sep 2026 01:06:52 -0700 (PDT)
X-Received: by 2002:a05:690e:b41:b0:66c:c1d7:4c5b with SMTP id
 956f58d0204a3-66f87439adbmr2317463d50.16.1788250011999; Tue, 01 Sep 2026
 01:06:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com> <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com>
In-Reply-To: <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:36:40 +0530
X-Gm-Features: AcwNN1Vrra9J9RcWBYUJJ7qw5Bpw3Tp2UKjVq7_wLN77WCaIz4OfWXHftpcjZXg
Message-ID: <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX4U7YSGgpt8mA
 xnY+hKiYB0/JJFn2ehUCcdGos/irei0j1DnRowcwJdWyfHINVwf1bsii0sU18vJRzms5Ir3nJAU
 /w4CKaOBbHXiHDtJjHEXrh01PMzoXTc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX4kQHKWvXiEo5
 S9GZMX76h1c3gWqXanINTWMfGsxsFNY9h5paLoGvdApGMEYWnFtFc68l6fUIuTkWZ/2o4VrnQpC
 xfW+6mUnGvYIpOb82Ljc6bXzDtV7tHjXsGsfMRUIkt56ygQA5RYkyACKHs/B2Zl5YCRFbfQMsXa
 NNSe1s2z6pqp6SXGi7KVaIU3D7lwcymIdtDYtyXoejkp5HMnsEhN5A7Pm0Ng5JS8fkD1uEc1d5C
 VDSJnukgKg64AklnxxCpdKbzv1K0cP2jcLg2zYI8ylR9f0FrkvIDtW64/+h5GK7mObNjxFRX50O
 RgII47DWFKr9Kj+zHTq441RKgFbwLv9uGicfo9IPDVpdREBiZ8m4oBGP4gLggZteImchR20Nfv3
 duAHOZ7T83jDI+v+zfXuKO1ctfsH7cKodjSN533s3BKrCuraLnGaZexAXozUfHZ4gbUsCVuZ8o4
 CbdzOBantHRAO0SK1zg==
X-Proofpoint-GUID: 1mzj_vG196_eBu_X1f1JV8shaIPg5cMj
X-Proofpoint-ORIG-GUID: 1mzj_vG196_eBu_X1f1JV8shaIPg5cMj
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a9687a2 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qe6_PsajVfZEHvrFN0gA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010071

> > +        qaif_cpu: audio-controller@a000000 {
> > +            compatible = "qcom,shikra-qaif-cpu";
>
> The DT binding filename and compatible string do not match (qcom,qaif-cpu.yaml vs qcom,shikra-qaif-cpu).
> Usually DT binding filenames are aligned with the compatible string for clarity.
> Is there a reason for the naming mismatch?
The filename reflects the controller; the compatible is
variant-specific. This follows the same convention as
qcom,lpass-cpu.yaml.
>
> > +            reg = <0x0 0x0a000000 0x0 0x20000>;
> > +            interrupts = <0 331 4>;
>
> Could we use the standard GIC and IRQ type macros instead of raw values here for readability?
> Ex: interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
Will update the example to use GIC_SPI and IRQ_TYPE_LEVEL_HIGH.
-Harendra
