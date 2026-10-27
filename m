Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105143;
	b=OXrppPfE6i/Xa6uVbnmtnpE88mcofz2lm0MaAD8+4H6/TDTzf70jHfh9tMsKzHZSayiK
	 uOy+C/BawHbxrCjs0UojNXVVdEtTnmQWPPKJmMUN8ErHc/E8a8+sD/OhKwBwA+B77Rbs4
	 ZvNk2KuRXShDwtGFvIVucwcfQVaDYXmHztCZVcynXpacTejzlz5GDFGyMDcbAo+ZsmQGG
	 ZWFijRkBT1oiEmG4RYiL0/ddJjT+DVrBLJlf7aJ3iQAWyM1XX7H38Z3o4n9vJ3ilWjomA
	 0F26UGaZHiZl1ZBCOAiG14r4UvIgNRkX7s56RGj9qM8u0UihKVCeYFD4skNCHLBTFxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105143;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/gbZxRbYGSjkFvrsGoJVnzu3Cdm/k+jCLhdM8Kg5d+c=;
	b=hFZWqSMe/fKGzSb6KpsICSrurUjz12KL/Uw5MVf6GiysnaPnb5cTBYSpjw4wNzALpDm2
	 4C9FxX0A1g2ffy7d0dIGk/G8uBier22AUUw1hm6zTllvuJgJUziRFRrvgZLAFdTck79+L
	 CkV/zbhQkvZtIzgVjoiBG0fXy2xUcU8e3V4Uum2nQh0hWiBJSdNxh/qj+W3iwfhK8yPNw
	 eldtqb/hJY7PYNkzplCFZCwijssKEqLtP8iBjj7yJcAlQuYGCM4OsW4IJP4BJu0GIyoSV
	 750dK9smHwL5IyA2T5OgMpyR3mQ/9rGarXDKPJc5Vz0fP26xsyjr47+dItG3GzNptnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O2kg5bU5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MiOtIoHq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26774606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26774606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O2kg5bU5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MiOtIoHq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe1Up1921843
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:45:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/gbZxRbYGSjkFvrsGoJVnzu3Cdm/k+jCLhdM8Kg5d+c=; b=O2kg5bU5iEb9LCkW
	yWbOqYhsYxostEVHK5uU53HpvKx5geCBwZK0rQXUbeCxuCqaAQ0ZGbVvnKiIYCjp
	Xi/Q7+9Wn6OisNRPZ9rXOwUW1ifIl65bFNhzOVZCWvSzxRl/oJAtPqKEIuYAC7op
	vz8z5YtmAVFDk6ZPOC9zgwiV63EBd5sDkCr2rVSb5izw5TkmP3GWgYlzB0Mmu4eQ
	q2fsXuOemUnVYKVpZbT8UczSN9j+9RMrVghBuGJiLsUP5aqdn3/V5m5U4Y8y7zla
	6TckiVAu4VQp+CmSL6VBrQQ5I2tBK6FnDEjMwL/AAj0PRnJrAN1ih4SaR+jN6iQ8
	eoiVuA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68w44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:45:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cac495d99so43037185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793105141; x=1793709941; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gbZxRbYGSjkFvrsGoJVnzu3Cdm/k+jCLhdM8Kg5d+c=;
        b=MiOtIoHqGHctYAuA7gpnqSd/jPVCGLkz13x4aODt5UA10qKtyXBvYFWmDXCgTVqI0M
         oD3Z1DLu0qbP/8nU5ibHI/JlhWBJcWhyRjkg8Zd2qhW45y+d0XVngOgFJ1hzgUtOQ0uh
         ibq7uOc1jpvBgilCvxe2dgQo4aZChRREm7eO6YiOS2avDQtdLSnJ1v0GKwHo3ChAwIdw
         KpcgJuPQ3oHAji8SmWKQAxlryWZGq+IP/LUqmEs5zzNkVyaswzofLxcXgjz/ZFi8FBU4
         rYxvJ4EsAlLtHxch2jd9NrpZz9uTZau6XuKcdnCpRYY5xUYSKqB0j4Zo09bQNMKOGgOZ
         0udQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105141; x=1793709941;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/gbZxRbYGSjkFvrsGoJVnzu3Cdm/k+jCLhdM8Kg5d+c=;
        b=WruoRmVZaMJYJgxvFGkYo2Q7RZUPpJA2zdTYNUhh0qhPdgnZs8qUsMGj1Wumi8QR0r
         nUUHr/hn/Jt8C4r73ZS7t3JERMp94OtQHUOknQzoUOgyb28SCt+ahij9qp9U1KgxfMF4
         CvgyQhO2DV1sihwmMjdj5iawUzcDd9EGywySbNehFPn2zurNXvJZEEnQYPvnuRaQvuoG
         ynP/BG+2Yo7n3zPdlWQeVyWdsV8LlpvOEAsYppreb2uUXAr+jHAqlyDbkPwhlOYx/jFM
         QP32bh7BStfRpWHfSpq1LO+NTPhRsaS2mOhVYXg5hznYIEXZM4Yvx5ENHxMfN9SajyL3
         FfCA==
X-Gm-Message-State: AFq9FYIIsgirhZqnaxB6BFP6B0gCdri6Ncej0P8TcUmHi4KRsWy/yRKD
	NXJ5/b1TxaTeCW0HxzMJblYK37XoKvru4Sy/g6fTBKJHHUY9UJUzxWds0HPVFk7LfqtkXV+S7wC
	rc6fnIxbUnHJZKXJVTWumfi+PUjG3dqVzD5jE+4qF4/TYANL7RcvEDvKQlQ/slUPEkpVI
X-Gm-Gg: AYBFou3OfVfkZRjIiy91MYymnwEhens9qIY89S1xIs76QLogTUSRZ/HUlgwWvz8Edor
	kbpw4k2120il6gQgtcIRd1BcmblBJ8unn5xvkQSsMozCb/XnfBPjXnRrI66lw9LVabUb68a2k/d
	eBBmIY0f/K4aeyApCLVdVIWQ2opkS1Ia+BG2mh8dooQrPlETMsjmNO5w8LuoN7tNMy86DLpoWBk
	78OX69n9DEUo7CHIndoJMEZCoSsrt9rKWoj6GBH5Ql3Y33yVV4e1/czeZyvaLe0i68YavU6ifsx
	xH8he/pp+/2rwPRfEKfYT9ZbT5erHgLN4YrSlIAGRLXgBxHlUl0ZtYFXkxALZJz7B5DqtRAfRBI
	wlc53CMhTrtjQiaOFroKL4ZBLt+o++gxZn/7AUIB7ADjrvYP3d+yUC32zcyqpxBNVfk98GLc=
X-Received: by 2002:a05:620a:4002:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-940ef8f7c30mr2101124785a.4.1793105141181;
        Tue, 27 Oct 2026 05:45:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-940ef8f7c30mr2101117885a.4.1793105140612;
        Tue, 27 Oct 2026 05:45:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a4e208d1sm130366066b.85.2026.10.27.05.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:45:31 -0700 (PDT)
Message-ID: <abf21903-16ee-4d3c-8bd4-84ac2c4623f8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:45:26 +0100
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
Subject: Re: [PATCH v4 2/4] soc: qcom: smem: validate private entry list walks
To: Albert Esteve <aesteve@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sarannya S <sarannya.s@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
References: <20261022-port-smem-v4-0-b0baf39c6e01@redhat.com>
 <20261022-port-smem-v4-2-b0baf39c6e01@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-port-smem-v4-2-b0baf39c6e01@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae09cf5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=3VCCngPR7RMLY200nj0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: AZ53NpZTTz4BbGlzvsLoo4G9zShUP0Md
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX0pkUbLyHS2ty
 DFw08XkWQWpa+OAVXwR6THw7mIW4jNuPe+nMhgpSranpCHQ5SkR2eHSvtesZ30uu1Hc9MUgZenI
 yCWU4nNs4patcd1S4VJOlpVqOCYHFBM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX/4XRXaCP80lv
 Dt3jld7enPk0dNIUFhapSwwmXJSt/48Z9QGcA9adtd20xaZMgSSgKPUIKF12GIeO3/EHZBhrXr9
 349+G55hHeaHFWckFhU3ye4/VbKVXEv3/En+UvtYFkWPLGQXKzQbCmfMGAIKLGUgIBe6jG/svU4
 9ONpxZdlxed8D0xcyGSPO6e+141u+KjLLZr7DOx3wDKMimnin+fWEJvrhDZcWNqlgsbKqIt6AP5
 hObbgivtKKgDEie1Bmff8odKTOlfaz6op3yMPHyNV9/toilkwQSq8tHhZkbuDCtsAFNdGAr4KMD
 jHcx6FvjQvAz6ps1jkl0KfcunXSQYPIly+a0s+a+RyF0H+MFZ1H95Ymo5N5Vefefyev2gOV+zDZ
 PhHrDpISGuWqk/UanLl+C95MyC+nOXrdvSN77VuOnM81zBvN5JuxCjBv1gsh9sFveicXoTQrdX2
 hzJFzf2Yr51ht2bQ0XA==
X-Proofpoint-ORIG-GUID: AZ53NpZTTz4BbGlzvsLoo4G9zShUP0Md
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270050

On 10/22/26 11:47 AM, Albert Esteve wrote:
> From: Sarannya S <sarannya.s@oss.qualcomm.com>
> 
> When walking private entries, use the uncached/cached free offsets as
> the list bounds, require room for a header before dereferencing, and
> reject a next pointer that does not advance.
> 
> Skip the cached list when the cached free offset is at the partition
> end.
> 
> Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/soc/qcom/smem.c | 52 ++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 38 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index 36a4a10f3aec..a6732832e2c5 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -422,6 +422,7 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
>  				   size_t size)
>  {
>  	struct smem_private_entry *hdr, *end;
> +	struct smem_private_entry *next_hdr;
>  	struct smem_partition_header *phdr;
>  	size_t alloc_size;
>  	void *cached;
> @@ -434,19 +435,25 @@ static int qcom_smem_alloc_private(struct qcom_smem *smem,
>  	end = phdr_to_last_uncached_entry(phdr);
>  	cached = phdr_to_last_cached_entry(phdr);
>  
> -	if (WARN_ON((void *)end > p_end || cached > p_end))
> +	if (WARN_ON(!IN_PARTITION_RANGE(end, 0, phdr, cached) ||
> +			cached > p_end))

nit: i wouldn't break this line, and otherwise the next line should
start below where the first condition starts

[...]

> -	if (WARN_ON((void *)hdr > p_end))
> +	if (WARN_ON((void *)hdr > (void *)end))

LLM noticed that before this patch, we risk overrunning end, but with
this patch, we now risk a corrupted/malicious partition ending before
'end'. A valid walk always lands exactly on `end`, so the fix is:

if (WARN_ON(hdr != end))
    return -EINVAL;


Otherwise my clanker is reasonably happy and I see nothing wrong

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
