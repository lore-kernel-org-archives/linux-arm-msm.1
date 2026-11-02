Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619615;
	b=JyuzuQYaWczM46MMjyZokOS4M7WS/GztHZCgIY1qoS0kiYKw03noI5YxwVRZXZpyMgfx
	 dYQIM3jfQK2ifw6A3zA4aiGteKtTsDHFgArBp41bQqxHrzpmyMaBUVsPJAK1pW06gXt4S
	 Hvs4dF3bDPi3ShasmNPl5HByWbrRTeHHz94z/IhxI6KXmPhWhFpvoRst5HTTtJYf7X33y
	 bzLRIR9Vt3HLDSmbtVrx2IG+y+FPQuWopJDcq/B77tHP2MQSwIv7Rsu/zwmjpMYhXfPnO
	 IGOMzA/u8bC1hDaqN32UmqdUnK8vJaxIgy/IL5R54dY0kPCZuL2C3HHM1qTO+BFeAoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619615;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1oVKawRBKDyLjs5yqB2d0aVUIqnYCyMBBMHbK7DDuMg=;
	b=eX6RnNdYcbb/wmenG5C91peERE33qTMxpkmZgiM81Gl7AMJVNN0Vh1XMoLbStjgAo88o
	 XBvZXTSgxLJ8BmcdahMaJc3UW3Z1rzbH2F71/A8UQO+btVu/UE4//UrkN7TfB7Ihhke7h
	 9ca5vB3zcf5RzTzKpLitDFQwCZWQQ/mYJ+Cno1cOcWrLkHf3TTEWjvFWxmM2fsxG/5Qsh
	 FvCQiyd1zhrQonjbV2DLYuyOZJRnVVZ4Ry9vpeT9Bc0Uz72sxYyaIo1z+SeyRCZ7sYNdX
	 l1mIZc+M6n9fkGjcZadtSU6EOebZcmV9rhdkYFB3OoBGqHd3VcCvoNK/IPbiiSz5KOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pouJluLE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bb0aHqh7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF63606A326
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF63606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pouJluLE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bb0aHqh7
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B4W3i2616347
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1oVKawRBKDyLjs5yqB2d0aVUIqnYCyMBBMHbK7DDuMg=; b=pouJluLEhA5IF64z
	V38Wr3FyvWkYW+tYnSbZGssmg3Qhy4mikfe8baepwwGnShZsNe3fBACYOFH0uoB6
	1T+qW1prcu5YG9NCLLfQ+87meKc397kNT0uxbPLPnaNHX27dlKQeYoj249btCK1Z
	6H82ixLQxxyjxxn0f8lTsTpFvB8mH9Ce76/3UmeXE+MW8yIKvm4sWKcsx3OS4ZF0
	afZp5CmkYwANCdfMSc/vvOvNI8K+tkbvfjPLj1jsX6J6BJ3YbDp4rrI4i1tBTkFF
	AXBTSNH188M2F2R+pJ/01vWj6T3FrSqOPiyd9R75tF0yrN5V6+XRx2g81A6FmiAI
	+TBmkA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavg41j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:40:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c83481504so5765336d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793619613; x=1794224413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1oVKawRBKDyLjs5yqB2d0aVUIqnYCyMBBMHbK7DDuMg=;
        b=Bb0aHqh7mu/Th4FHSUfZcMUb9BR5w6fDRlSz3fqcDX3O9YQWT/UEPjhDkLZH+DnliK
         2seoovD4VbZ6mxPnu5Rfkzi4JOuQjweZq37FVx8ACxUOWHtCxg10a0jkpv1zg+gU4xq6
         DjVm9Z3kD75yLrw8d5722BX3oIDbiWE3BXVKIoGIlMXsG/arDMGvVwu1CQorHLT2Ovmm
         50MQt6LPeRCDoRv4920iD/8h9EVx+DBV77kua2nvHvgqB/TBLcrC20NiJV4v3N1qzvYl
         r7BgtSvqunV7ZTJOXTvZdG47AI+I52QOazDK7zsInWQ08nOnlhIXYgEHRVchyXkcgc1R
         Z/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619613; x=1794224413;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oVKawRBKDyLjs5yqB2d0aVUIqnYCyMBBMHbK7DDuMg=;
        b=zY23LSTy+/uft/mJpAK1PVXwZ6pZbAw9DwS9oI9PCGql7vDUSvfgMxtDOevb+al69M
         14nvQI8jRe20wZPNjtqN8m9nrZ1Y1GzsT+46MkenUMD+EU8dLlinpkgxDGb6FApTDyz0
         iw6nWrOpZ6LaTqGP4+tAdl5usexzn66i+olyUBaOBO2ld6Lo6c7OrDeumMPPxDgwE09n
         6SFDQexyx3bohFLoepIyglh605IfAwA3YznEfQTK2Y/5S/5Jd82Fl39Qoj8ti/ssnq7I
         84Ggdmng/WnsjlRmvlsF2aA1hsDJA7danzdybwMJlkVbMMvtdZv109npmKeGI5YOOh/5
         7ASA==
X-Gm-Message-State: AFq9FYLMwO4hLs21JukNawmjouiR8FW9AxJLqpKr7Ce1Sm0Q7JWcpwsw
	3htkZ6XBFMTXzq7Vam31+Fztd4Y4+eO2Fe8uMM7ZN8VoL6ATIG2qTUAyKxjgeEdY0ziAaiARdJY
	z/X8JZO5vo0VSFDopOci8vztLOlYjgK4zNz4lzhB1TptPIKC0E1XO+Smop1sE8gfyn/8z
X-Gm-Gg: AYBFou2/E1JSvKQgk5/WzZxVNAyaJ08e23V+TjHzFxR9NTjih7g+K3I74uBbOdUaLtn
	12fgn2jWL5nwPGDZ9Z9noXIxMpK4xR1cnXki9IuxIO1AXjOyyy0D5PUOzTjVKqDcu2GOk6pXWiP
	URbDalVASRXxqbdK2CjHYMMRuIo/YOQ7dOlBoVmsyUfqFOI9+HIuvFXJ4pV0h/mUat9AFhQEUhd
	kNhRzoJ3ipuYXnfI8m68niJ08VfYYs8hHVZ4cp4kAK44QwySCl1VZuqwVTA2sdscfUfa4n8KSrn
	OHA+UJ5VVqQZAmuxNqvSZ1kyQ8+UIwPlbpq8eJR6z+xELAIi4c+jXH7jXY7DBu7aRu0ojAA09Ru
	0jdRuh6T22LjW/OtwgdqMvrA+UlDQNqCUov7N4B4qvqVyqFIemPa9Mhd32enEN3qPC4aFQSY=
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1792075485a.3.1793619613368;
        Mon, 02 Nov 2026 03:40:13 -0800 (PST)
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1792071985a.3.1793619612874;
        Mon, 02 Nov 2026 03:40:12 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe93db0sm367342266b.66.2026.11.02.03.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:40:11 -0800 (PST)
Message-ID: <8c1571be-65aa-45c5-b244-d59e1b4729a0@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:40:08 +0100
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
Subject: Re: [PATCH v2 4/8] drm/msm/adreno: Simplify adreno_probe()
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akisaira <akisaira@outlook.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>,
        Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
 <20261030-gmu-sync-state-fix-v2-4-89d3082d97af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-gmu-sync-state-fix-v2-4-89d3082d97af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX7scQIT3mVjVl
 KN5KLc6tQVjD+9cxRuMJVF315fN7eAWK1XYlhRpGiUAVjyqLrooflMxJ1qgYW2/KDRJzCU95of4
 awa3rY27nQjcEBxLerQylRDXYm2yNGOz5aQcd5jbIKgV4CYOA1XFOLOqx0O2NrWGCs2d4AlbOJr
 V8eJpr4AocvK236KmBnWY2+h1QkxQLUJHa+kbq4OUzMwJTMrq8YUJRD5EM/vlHk8krzrTbr9br/
 roZamQvtwA8QlsAZSryaGdTgbC4YWlSiHe6KEbH+jZQ83yiYVbUIhwHgQl75aUEblOhNQXabi/e
 ZAHDlqLD2YCjfg+H7wfXI/xIAKXaCq9s0xtQcUVpm8emxGNGiyZBwprAx3cxjZtBJ5KuxSepHiO
 q/kJgVKM6V5XL0ulvR/9f9TYql2NZAfPlVPXWypDqLwIYLW5vJOHKL3bWVAFwgGYJSbcCbor1eB
 5se1rFZnr8svQ9HDFEg==
X-Proofpoint-GUID: OTQdnL36ursAGHRCdy24DGRcGdITfm1d
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae8769e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=siqUYBh-qFVWGbOa984A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX9mDxAs6BZqUY
 ZG2xEtD5emDTcoNUC1k0+PNpxLjp1q+g7s4VQJ4j78Uz7ZlQT6AVmpFytpHZtXIbjCK86BIkxZV
 Ywjb3jo7xMXXVZXrvbD1pDE0qa819xg=
X-Proofpoint-ORIG-GUID: OTQdnL36ursAGHRCdy24DGRcGdITfm1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046

On 10/30/26 6:09 PM, Akhil P Oommen wrote:
> Now that it is possible to auto detect and create separate drm device
> for a "GPU + no display" case, drop the special check for "amd,imageon"
> compatible string in adreno_probe().
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

The remove path alteration should be included in this patch too,
otherwise we get an intermittent regression

Konrad
