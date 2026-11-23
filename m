Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795464126;
	b=Z91Pmrv8Zklii+CttUj+JYkrjdyP5atJTxDWdlwe3+yyV/aKuisqMgb3A84y1QGP9Rv5
	 pGua/rdzN9y2ruZf8ONpfZl/3seBJH1cz/jbtgWO8P54vayvNvpGELIeAKZKdUr1aJhbg
	 93iGoRuwb5lwjbIvfOFYQW1Qja7VVUE0XYYnXV2z7GC5ldJfNHTTQB92hvMrTM3JVRmsv
	 FU5N1Rl9VQy+2bFgm+xHq2tgrfZbbkfkQsdeVM/+i1BttZDmll7faTJUhY4Wa2l94WPmd
	 Ygcve8PcexgeLV6VBKHWIi1t/O9xsNx7ICSA9Ek/KWUfy7zlxRw/mJFzplahoeVjmeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=inPEp8eoSPmBllPRXHFJA9PQnGIe5ryUBe6DPKTKW+M=;
	b=sz2jBXHtIRIsWWuVBVfdq6TYWGqElDPX2oGrNyxpF8UQe/94TQRyWNZeIipz0QDu+Znx
	 8rDdy2mq2U4I0Mc4OA8TL41a79B/fhnMADxjEHeK9jwpbGYqQy8IebcBLd/yDmGVG858O
	 AJeuEYlYmMUri53dPj3LMOi2Ia+ChY/zpluD6uI4UZeuriH0qRWghB695GaHWFH90btH4
	 s7/Nk7/ve9MCJZqhSNPkbIn2kGfx1Hli1a2xLR5qD5gEkgSWh6mDBTfllh9rl87yCuZVV
	 jpgEJF4i+zYAObAwUJahhZy4+QfS8j23VWHPcA98cexZ5wIXp9uZVrTzkQ+K3OcbSSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QPqwhfwr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TZ6hloiN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACD6606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ACD6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QPqwhfwr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TZ6hloiN
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuSvn1332532
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	inPEp8eoSPmBllPRXHFJA9PQnGIe5ryUBe6DPKTKW+M=; b=QPqwhfwridzPvWFn
	bviNXu/PwlCRHBc/tWm3075w4rEGFNhMmAPl2McYHbhw6yzIB0iFR7MHLyt8zjoJ
	R/55xnAPrMHD79kKdoUJyazct8XjicyYmMaHExINHsc281h2ACuikJ6BAQvLxknh
	FN6HwoC9l3H4M2zvmmctYBs8AVKyNDV77gD3y/3ZVv1U//owdhy/pO0AZ27vheMu
	yU5QX2h/uE+TN76IF/DMR3nGx3VFWkdSxTYK8JGiidXybeWZGk9XSR67rum33vAu
	47XbKY+R55DRDvAZoes1hDRAan06DqSWSh4vHGcUI2F2EDdLjbmHZpvXpzC7k7yc
	hcqNlg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7438u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 20:02:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so4117733eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795464123; x=1796068923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=inPEp8eoSPmBllPRXHFJA9PQnGIe5ryUBe6DPKTKW+M=;
        b=TZ6hloiNKFdFqP+iT7/N5npKle6mpX0YDAEEuR58sCJ5WdZKP/x/iwBlmCeu8jYKB0
         zgvnDHAUjY4ULSVgxOqTpPtf5ZH5Qe9Y5FDJsEn4StNqVv3UJNSiK6Vls3cFBaYf6WqN
         m2XMs9pzC6ucpglVMhAS3dqtkbPIF8O0foe8nil5B4FCh0V2BDI5QaVf6ZahB4Tfu2ub
         66+sQkU3xobIYt8MjoICzXppaE566SCulHwK/nfRsFM0TEFYCwBgPWFpv7hVpfz6Y6Lr
         JklWd0cObTBUO6OHoCduOxhdB24Jdegk2DtkWuNo/oeZ1UZ7sf9ar4pNrfxBlh/PgtOi
         chkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795464123; x=1796068923;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=inPEp8eoSPmBllPRXHFJA9PQnGIe5ryUBe6DPKTKW+M=;
        b=YOfbR9Q/1EH/Uk/pHXjM8fUPtVzjkXdMkNp02tRnxLqghcR9m6oYI3PTIBct/I6FJe
         nSBP+awVftnFj49+ki0aqZjA7YySDoLL88FE1ns29ERsZJuUdC5DczwmAakOZMOe8yvr
         0BtCX3I8+SftlqmoCjGsZmuiCDnsHZBHhkvQe5y+REgFcdM0vv9+qw4d8jiSa7AQRcKv
         bhgWr9j/LxojFcImuspQ7hpO9hxDugWBN3CkN0R2brTaPhm8NSW+ipa4UU2DANem/FOI
         UMUtcgm6QeVo7UTns1sX2qT1DJPdXSC/n3SaBW7ZUZ2V6d2m1UYdZHQhenCP2xV0lk9P
         6n9w==
X-Gm-Message-State: APuU4Z+JAnm8PlD6xcP09GV148HO5mQI0njpivd3BboDU+BgOxgz4eXj
	JbMkms+rHODTj7F20IMqaWVmOEATsXWEBxsgn9O20LVAepFZ70bSTNJpFtn7obiqlNbgBgLP7WA
	d89UPjKulatWDgTZPmqn0ZJ/3VNPY3eU0pc2DcAiHaW3FKfvDF0aKMDu1RPSVBHdJJJ9V
X-Gm-Gg: AZFdTZfo9eX3TGILZVHsRij+GPGfR0+jBXMbA+nkRLo/CuTFaSeevbDN89Y8kHb15t7
	OarVu3EKiH9CAjoGpa7q3mRbAsGAGqlWjZLfEldiOtzj+ir2uYFCaNgVXZSG1DK31ARN9ZNqK6+
	DeC4D9n+TYpueWg+6v3uaIcZJqBtYjRY0FLd37kQvp1bJiPWCr0KUzPQPO8QvxeOS9s9q8rZZMh
	rNmzKrR3W2vj1NhERidfYHyL3GyTaYpc25YD3KZPLn7I7qeYPHJ40kVYm+WkomL4Uvd3IEhdt/H
	olm4xvkcfCZcJPKDkEoUKhH9pEP5mX5ZFMuBmHpbaiY+3ZKdIZ5C6SGEAznigfL8qEYosdsXD8y
	9sGe5V4TXF5WCg3Jp9XJ1SaicBBVjxQboDO+NkJSIuGpmcw7Ttl2NQOcEiWqBeeQVYgUty+U=
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr15532166eec.6.1795464123032;
        Mon, 23 Nov 2026 12:02:03 -0800 (PST)
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr15532139eec.6.1795464122304;
        Mon, 23 Nov 2026 12:02:02 -0800 (PST)
Received: from [192.168.1.9] ([106.222.230.69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm66658717eec.3.2026.11.23.12.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 12:02:01 -0800 (PST)
Message-ID: <e4ecc291-026d-4ae1-a391-5f3856df8ce1@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:31:55 +0530
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
Subject: Re: [PATCH v2] drm/msm/a8xx: Add missing preempt_record_size
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261123181306.420017-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261123181306.420017-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1n9nErtdjhed-4BX0WG4imi3NHQDdICT
X-Proofpoint-ORIG-GUID: 1n9nErtdjhed-4BX0WG4imi3NHQDdICT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXw+cmT8xmEGqD
 hEqGGdFtH8ZrGrSAENdGjfJnK+oZUMSO5L8mkWg5R5Xp10IsV3ZZN93QsMIGwK7jGxn+y2xJzD1
 Z7Bczy6SzfStuaxLuB704M9R8ylbfv8=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b049bbc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=6/OokicQZQM7IRI9QMJePA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=C2-uWAezvlBjfc1kpfMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX14WiP2qc3jmo
 42UiQJVK8TpVxmYCFkaUzstFRZUK0p0/beo5T0XKqotrlv5n71FyDv+HM/oZnvmbMFngRJ+kjYV
 +ECBRcc91qn6di1l5O585Q8MhlkTAsnOlMBEkZxPIqHx4opzVh4F+D7nUmjF5Z86YNtcPZx4q7H
 1hlXOfUmFEs1JM/4IncqZ64eT5asujsFfiN7AbTRWFjE22nzeeNWUbzQkTUXNsEAAT2xY7Msr79
 xmzvBcd4csHN0uJfy4g0E7AV/aRmFkT2BaJ3qB1FOG8aKRflOcmxnL5eld7vtWTVf/Ru2deeE8l
 kolEbGw3CKKyni+01dJKBlhCugKKEfzLzWlfhPXiK1jPmiircCvvILtqhNf5a3p6aNhT8qlbOwG
 2qcskfuHJtHnDkQbmkTx4vBZ113vh31x5DkqcjuJHrAkZEJQ9mUwBn/oN3QODC20NsZFL6faHYM
 2nrxXAVKDZFypaOfS+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079



On 11/23/2026 11:43 PM, Rob Clark wrote:
> Somehow this got overlooked, and Glymur/Mahua were falling back to the
> default 4MB.  Which is way too small for the amount of GMEM on these
> devices, causing faults in cases where preemption needs to save GMEM
> contents.
> 
> Reported-by: Connor Abbott <cwabbott0@gmail.com>
> Fixes: 7fad33097e67 ("drm/msm/a6xx: Enable Preemption on X2-85")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

I think it is a good idea to add a WARN_ONCE when the default size is used.

-Akhil.

> ---
> v2: Fix typo in commit msg
> 
>  drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> index 0c6dde3cbea9..20fe93b83c0b 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> @@ -1337,6 +1337,7 @@ static const struct adreno_info a8xx_gpus[] = {
>  				{ /* sentinel */ },
>  			},
>  		},
> +		.preempt_record_size = 23088 * SZ_1K,
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0,   0 },
>  			{ 388, 1 },
> @@ -1469,6 +1470,7 @@ static const struct adreno_info a8xx_gpus[] = {
>  				{ /* sentinel */ },
>  			},
>  		},
> +		.preempt_record_size = 17712 * SZ_1K,
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0,   0 },
>  			{ 388, 1 },

