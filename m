Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AF131A07F
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788339446; cv=none; b=L42rHIojj0qu7bMgP+xN6bqYXq6ynSiNrW6dRsRAQloKdfrJ9OAZ/PAJzh3EpXPySBT8X3z0WSgfq6FzW870RZQZzaZbIc+IhELIVK0CyLS/9LYbbbVlLbqWP70zIASXO/zV7SJ3phnJjRRL/Jl6gxtEtHcR7+hbrHWWqX7UvNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788339446; c=relaxed/simple;
	bh=y+mJO+b+vyKXbk+mtczFnjdFHd1eTDSIlsF6E1v/WTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NmpJIP2Q9tgOwnRzCgEuuMjbcH5kcnG6tC0AGtuD3uNrEcy4uUDOMWbq6LaoYNQqArF3+A9Gi1B7mQIGZ0jYeEXFUqADhmK/chYYiaXkYca/KTp7yEAl5wbNXOvTNKB+Cr/QHc3BvIHr4X8bxOfkNbP0N5NGRekgU7DPfMuGDeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihdlTz5E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B4UA29Em; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihdlTz5E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B4UA29Em"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VV3f1451360
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 08:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FHWyYrXQm1rt0h9Z2qL9Sj/yXBa8R7nb5ag/IsAZboM=; b=ihdlTz5EjrmSKiCb
	ySKgOO3kepGb3YMjx7/N+Eoh+ebbW+oZQpZc7uLqr4gqgou2tIybTWQnakSpnA5j
	ZH6IcEaGlgt0bpzLcKc42qMzyEEJKb/a4r30a9+Wup24PQERU4UzLqxrCfV4F7Nk
	3ME9C+Fi1lNCYa0OChWF0LE6U14aizRkj9uX/BCaPY8JrH0iJ/X2+6gSXE2onfvT
	uYEx1gTi0hbJN/87Al4Hs5B1O3HIArBO6B6jK3U/vvQWlMi5sr2Jxu0fGJb5UBck
	pgPAVmhw6slgUE1rlRSvHIVZLn2z8nz+ErmVpClK0qKu3o8aFOjffiY9SL7dYzPj
	3VkFeA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gebsx15ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 08:57:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so24807385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788339443; x=1788944243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FHWyYrXQm1rt0h9Z2qL9Sj/yXBa8R7nb5ag/IsAZboM=;
        b=B4UA29EmpC/VUpEYaDY6iw5nNMmxvu/nhN0it8NLJitGrHAGfB+ILw86mDKNl3xZ7r
         z8DDumCTMko4IJdt5Hojbhbzs0YXzni4DiHnitTKIav7hZpikdEKsd8uEamZRjegBhvM
         9ozgeTSmT6mdiIGnE8dd6OUw6nuHX2yTiNtPx4gVMtdJRvOYpVQpnVwJU950g0Dghsi5
         miKOQe1AMTtUu2FtdWgx5wTtY633/vqjil+hqGpKCpGV0d0UXRFCBMzCmBigKG2AsEHW
         eY9GhKQC9Wvcr+pFeImBYhcUniYa2AXQ9JruMRDZAHRgKYfZ72UNCAiAiemZnYlR+vGg
         GVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788339443; x=1788944243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FHWyYrXQm1rt0h9Z2qL9Sj/yXBa8R7nb5ag/IsAZboM=;
        b=mcXBl55eVZ4aoX++6QGAN9wJ+BF5lNHzd+VnUcMnz1BkUkkaaCcGLpWS9ZEdtjRXPk
         rzdfwf/cEwX46DQklf+mOj96dVVoimoWnv4U/M1NZtb9WUYan6PcDznkxQUKtMMU7Jyk
         U8PWYZHmRVQFDvh3cLWZe6cSSxDO02/MRfuyarn4/D+4gTGTDu3W/XixfuapuFaQqSqj
         IqFe1d9ItbJ2biw5r0N7ruK14Zd4B+/DpWzQCafQyPqyzwC0xw+I5/9u4m5ztUI5SWST
         dTUm3J6SZJQSjYcgbEtKdO5gcjupq2/4YDr06ihWY+WSqQvEySql9sIeWKIV9IaKRvgL
         ucNg==
X-Forwarded-Encrypted: i=1; AHgh+RptfvNMOLiHlYpsPic/mdcSCP+J19MZj83QAh93OV4fg3uz6858LNPCHOYao9/1BWD1PEQgsWcasq4HAbRF@vger.kernel.org
X-Gm-Message-State: AFuF++kYym0/+jsXensPMJp5BgyXMqDNi3Lw9Oc9PrtinLNPMfvGCZjz
	0uC50kdBG90RItP1qD5ObcVvgi278SpKgatKnt1k8Y4knsLh/EKEtp0h/ofSRVTD1O2/Wv6rtkR
	T7IVLCs0TZCnX9ImxVVN+xAMuzlFIF6fcytbb9PBVCk4PXezC/N6T2CasaJkHlL+mVfXh
X-Gm-Gg: AR+sD12KdygWK6B/7iCiozQw6WVs2YlrDfJUlLC58xdW16x+UNdlEN1irljXVdVuX/S
	6TqghUa6bQb96393bYSqAF+7QcQxDevRoT1GgAsbXABMYv+hVoIqWJAod4Ro6nsqaN7HdvZQTdu
	Q8mQPJdBfPSih87ZSO9CKQQ7uxvxitzMCXvGzq+qhuXqEJR3vBnRUK2qsD3fcI5ury7VdPcGFc+
	6dn7Mb6MB7layE4nmIosoKRyHEa09y5Q/ZRU/R7boTREjefFXNt/OWx7YQVvYi2PI/xdhwsnNeP
	vF/8ylcK9SUWcarUwglQ4RuRAyQEmtmgWquSiA5FQh8CkGH1HzOgcJOoeY/Y7NbxY4bDhIlmdR7
	CcL6Fsx0gkqLFjxYkijy+0A==
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr200030085a.3.1788339442631;
        Wed, 02 Sep 2026 01:57:22 -0700 (PDT)
X-Received: by 2002:a05:620a:640f:b0:939:17ec:8a81 with SMTP id af79cd13be357-93960f8a9afmr200028185a.3.1788339442200;
        Wed, 02 Sep 2026 01:57:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f8c7a0esm727706a12.13.2026.09.02.01.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:57:21 -0700 (PDT)
Message-ID: <f4234555-212f-4700-ae90-ba895e364667@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:57:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Retain firmware confirmed video_format
 across GOP restarts
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-read_video_format_from_firmware-v1-1-499edea4d200@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-read_video_format_from_firmware-v1-1-499edea4d200@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: T7q8z0HofbFLO5e6O1Q0Quj_mNUNUewW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfX8kHxxVSHzE0n
 y96amjj0atL0FJwcj7jNVRBU+PU9eRj1EpJ7iCR3aGVvLe5+rG9tGpU5dApsfAP/KdVQXqZONig
 PvhCB5NiwDmxI178KIgRvngmwOWOskr0RYHezD9gPp5Lts57x2Ad1Jyv3yNlnvvgxeUUhrv5v2f
 mwSII241tO8J/FGokWe7t55la8HvBbW30CBeutHpWAXr04HW7XZDQxjlqtROMA4bkAD849PcWNN
 8KaPjZl8E291On1SkeyfCqN42GahjXQ75C21e8w1P5P3zq7ONwYWnjIP9PQSCMg5LZ8RvFOGqbE
 RnLfDNCUS/PHw/KreOLhO0H2x0rA44QgvNtkguS9gzqoLyj9L3SLhGPoR29M37aTLnNE2bxwJfn
 qudYI7s2F0C6WlEPUOYiKJiA5wxILx5ck0fazppsvYGO68HtLM0tqYfNgR7CqFyghMsYEGT71Rn
 D/8KAQYwHRNJ+jXRDKA==
X-Proofpoint-GUID: T7q8z0HofbFLO5e6O1Q0Quj_mNUNUewW
X-Authority-Analysis: v=2.4 cv=AufeGu9P c=1 sm=1 tr=0 ts=6a97e4f4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=ICu83Fd2_dlXxx7a8cMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3OCBTYWx0ZWRfXz2Jv/C1rK4M7
 99g/ZQ0ij/drNL3o1mYdi+BB0ifuvFGH7eXI2arfXw+QNNKBG2SfRQfANR+DWFXZpKJW7bDn8ci
 QcPpb3fz2MxcmeqL30BUI3J9Ix8Pnmg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020078

On 9/1/26 3:31 PM, Vishnu Reddy wrote:
> During speed-based rewind, the client restarts the decoder queues once
> per group of pictures (GOP), because playing a GOP-based in reverse

"playing a GOP-based [missing word?] in reverse"

> means decoding each group forward first and then showing its frames in
> reverse order, and every time this happens the driver resends the colour
> info property on the bitstream port, which firmware always treats as a
> sign that the stream's properties may have changed. 

This is a single sentence and it's way too long to parse.

> The real problem was
> that the driver never stored the video_format value that firmware had
> last confirmed, so each time colour info was resent, it used a fixed
> unspecified value instead of the real one, and value firmware received
> kept differing from what it already had. 

[newline]

> On every restart during rewind,
> this looked to firmware like a change on the bitstream port, so firmware
> sent a settings-change notification, the driver treated it as a dynamic
> resolution change and paused the port, 

[full stop]

> and the client removed its buffers

"The client then removed its buffers.."

> and built new ones for a resolution that had not actually changed, causing
> playback to stall once per group of pictures. By storing and sending back

Please use imperative mood for describing the actual action you're taking
(per Documentation/process/submitting-patches.rst)

Konrad
