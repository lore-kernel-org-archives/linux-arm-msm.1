Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098023;
	b=QPD1pJ7FD1/GyNpkX0zpRfaPuTe3ZXBSfWKl/HCZm8kFt4cUyBkamf8pcfHsf8hsVCng
	 gTZ+v0MX8eLJ/yFxxO+JAm3mg74/t3zrf/KJ2MsE24+Ntu8Zl0Wbg4gTLhEs9UAGi1vCc
	 6LcJ8kkg1h6k15giKV89iZRFhnt59JeXoEGIM3st4ozbaWdLJw6KmPptQ+KICGo5LrGww
	 Gdi+VE4ocHnaoh6uXAB9XX15WQQnRZUMcKGJCuFMH1AqqWKDSWh2khGTGTphOa5RvG57G
	 x+GVIrsbeOVaM3CeHMGV9dQ6LwB8cov5dTNxamONB4KtE1O92IRds1lMx0aArVbGKVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IxH/wTKz60XBJsUzmqABeAlfFRVAsNaqXRe4BJeY61A=;
	b=UGRW1QCmgdQJC9PljV75Bxm+v9xw/0l3m/bcG+q8JHNVkd//SW8VgtsM/TpG5E/4Juzk
	 V/jzr01d7G7Hj0JAJpPExekDtrTbcms00U2qUmsobtpqH7d7wcQgqDVUHBHxxGl0JLYeU
	 fs/W0RZCwLEiNlERbPwh87zWMzBT/khlqXVIOIBm5hFzehP5Yw7T4JItU9Pawg3RCvptx
	 o64HTzs0FnwS8absuMYTK7rJFHNESz50WLzZYGzNFtZdTLPSRs2ZrU9dUP5vEUVPtYr7X
	 Sf/Zbz9ZQvi0XAGBqQXNSD8jkoqF4glwm7ogdWUH//IjkzuhHAOffurRLilDg9CP78Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a08wf+Sq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hl+AVOWC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9D8606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F9D8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a08wf+Sq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hl+AVOWC
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe0Uq2458167
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxH/wTKz60XBJsUzmqABeAlfFRVAsNaqXRe4BJeY61A=; b=a08wf+SqybYfPFpj
	CytNS6e4xDsBCkAlLEx1QU4PEo3mSYKh8DvmOmD25zWSYiDLe5VxrfoksTWKId9h
	Sz90DiVgekaD6JdCoOAPLu9JpWoHFvVcqyLgXzwIEoWd8yVVy0oDC/teYrclqvNd
	qCeYoorf5tiEqCsc0L9loQGJ4sBCQXA6EDmlYRKMztilJImASV9wzhnVrn1Zwt5W
	3EmhDT91onmQ+9MPym84c22NJGUET488USoXhXZiLwgk1AiBYqEH4+ve6/KPQSjJ
	4aIvH5WymHGAZQ4HcR95r59UQFhTWVdjW+eTOQevO2KTPG9n4vKDBQA72Os6tl+d
	Ak2Jfg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbt9v0w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 10:47:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5356c6d98cbso13774891cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 03:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098020; x=1793702820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IxH/wTKz60XBJsUzmqABeAlfFRVAsNaqXRe4BJeY61A=;
        b=Hl+AVOWCU4ZrcfwUxKJkxKivhj+CjijexNngoCePy/1nLR6+tX4s1XPIfCaOuUThPg
         AeyX1QIWNpA2OlyHse450PiZ7cCmgKVEQoohGvdBi4VwKL3cRa6gkk+WpzJw5lCHUva2
         a3Ob7+jbXXfeWEvnbOhVgwK3Xh7ie5yuLkSr8kkNXedp3jzAq8Yr8RIb4Ce1UhgX4zgD
         SsfUB34qduiwBnfZE5BsworOoBMewd7vGghjj2wJesW/bkLnIKHHMN4+nppiH1Ye/bAJ
         58N82lJkvYiG9S1TUdFZi1qUrC0zBpJDR82Gp0+XlxhqasxskA9TwzWFh3vNzl+Mi5ch
         NntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098020; x=1793702820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IxH/wTKz60XBJsUzmqABeAlfFRVAsNaqXRe4BJeY61A=;
        b=zqFbZR+8w5k6gHICBMHDCG6LSHyALdTo9/BY0ZwLK/2tTGe33+eQSqAHl4gMhknspK
         TXHEULW6OuGzBy/fhCHsPYoGmR4Cr0kRRU+MjPBDfz54lfXkSekioXdD79B9GuHgse9z
         0zUGeIPyrzc03ujdmu5+Vw+keTXkctgA9FYhdn7djUkhkXdKv44PrbTlTihDaHc2RsdF
         IMSHYwq9G6hv6J1qVpPnH5ZQsSrGFgx3j5Q3oSb4oPaA9agjplltezj6qT5lJLUtGjyH
         2VH65ytW25NvTDO0l2GSofxzynzUj84jpfZCcw4UZ4J1bsFlg1WkLIzzdpd46jFQ+UfS
         fINQ==
X-Gm-Message-State: AFq9FYKaEo1YkroZ0iJ4UF80iotyR7pAAWD5vEQD0IcfnoNdYJXQ0wA1
	blj6l6bmmqoZLc4lZ3EYxn0Sozzqj+s31DTdJX6AmP7V4XBqinsv+L0ySs7ppDnem7YAafL71in
	QW1vezTYtJbXSxb6/J4lmIjW8wexQzC5F+a5o5uLt8XxIcRt7PNrA8YjnTugOZhIjCGeP7PPmy+
	xf
X-Gm-Gg: AYBFou00tcTuUTTX4SmOG0v02BvwkSiB+pfjOqJ+CT8+aCHwx9DBN5MiWl6jySHZDlL
	11o67O9WzAhNYEH9T3C6fG7EGv7O/dbpvOo0EHg6aJhOClaWlT8VyDpuECaggmG6edHwuYbIKXo
	qjQZaslCVkXubfRfylmUR4UgV6Mv+zsq+L8CX3/xFQTyLRIQ/dwdEW5UDmbCUdMjHJITmNJZh8W
	HGTyFVraDkuRBhehtNCQcqU3cv5wUIW4PO2QcJ2YIiyY4eA9uIaIOUKE9Pifaifs7+QuZ2yool2
	NnlkKU0B6OLV5PJCRNSsVK8kssBiblJkHBoUvzh8O8k096Pc6CRuUJWioq71e39ZtnVEy8IEIed
	A7a9igfMGprFLsHJCnf/19A==
X-Received: by 2002:a05:620a:4918:b0:93f:1fc5:f07b with SMTP id af79cd13be357-940ef7e9992mr1516912085a.2.1793098020492;
        Tue, 27 Oct 2026 03:47:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4918:b0:93f:1fc5:f07b with SMTP id af79cd13be357-940ef7e9992mr1516908285a.2.1793098019913;
        Tue, 27 Oct 2026 03:46:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b47b29dfc3sm1138884a12.32.2026.10.27.03.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:46:58 -0700 (PDT)
Message-ID: <2a77fa74-6016-48ee-a1b4-1df45b1652d0@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:46:55 +0100
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
Subject: Re: [PATCH] remoteproc: qcom: pas: Print auth error code
To: effeffe99@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261026-pas-auth-error-v1-1-1569e83358e5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026-pas-auth-error-v1-1-1569e83358e5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MiBTYWx0ZWRfX7J4o7o5giHT/
 UBNqvTKRTL2BDgDnzcqn+0xVM55TSYb0XDoRWV9J04lmVIvc17T+sIoo+2VkBvKKT+auGP8NkOq
 w2dHLOzwNu7x6oss+OGJJkPVx9Q8+us=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MiBTYWx0ZWRfX9Pw+qNEhD0zK
 UnM55UD1GGGmTFqvUuDYHW0p7k67famoPDJHeA/HK98ZH4zZO7dYN4mfKFWacJJvn0Ga3mlCpVo
 BUMrtHU3SYDT4FtiLF88IEz0vju+nQdE+FmVn8gD2Pfady18QIqbJ0cGnaonoIxFsRE8GKsBzab
 AIbWknX3ngL1G4L1rrYoxkADr9zczAT7lHz9v4nVLZwc+iJccBbKgSvjijM5lrlZ0F3QrSa2tPo
 z9FmS5JuaXrPo+bno+faBRAo5BSK8lJXHpKdzSzlcJ7casMyN5mV1L2bO5wsGgvoV6G2v+s3w4+
 IH/X3JU5Ri980SLYJu3/nII0ghSW4zHGxAbY2tUeJKn2AIFbVqRyksd8feVDUzJdn2Z6B+VdoVl
 gViEK4BCfwZ0ymOBzdhNZPjUep2T+fTq+w5D/qsFRoiu+BSS0BlN6/m48e+TDtecHYPuLQf+Sh8
 RA4Ix9Vis5ZzXr3GOXA==
X-Proofpoint-ORIG-GUID: b9UfbvZhdmzrERtG9mb7DMRZAOw-h2yJ
X-Proofpoint-GUID: b9UfbvZhdmzrERtG9mb7DMRZAOw-h2yJ
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae08125 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xm1_ZTsVmEa9A2bUQEYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270042

On 10/26/26 7:19 PM, Filippo Falezza via B4 Relay wrote:
> From: Filippo Falezza <effeffe99@gmail.com>
> 
> When a subsystem fails to start, qcom_pas_start() logs "failed to
> authenticate image and release reset", but drops the error returned by
> qcom_pas_prepare_and_auth_reset(). That code tells the failures apart:
> a negative errno is either a clock, interconnect or SHM bridge failure
> on the Linux side or the SCM call's own status, remapped by
> qcom_scm_call(); a positive value is the status the PIL service
> returned for the request. Without it, finding out which one happened
> means adding a print and rebuilding the kernel.
> 
> Print the error code, for the DTB image as well as the main one.
> 
> Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
