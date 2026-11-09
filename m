Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196953;
	b=CkEyMxg+ptuXm0fVd+pGvvDqxFGATKKKBvjR1pa3dpsx3CPQCTE8YWv8julER1umNwPp
	 3ndqYmZgTh21w7YWymQPpQ5VzxKFL1KhdCS7nO6vsvU1yGcGOZNwmTltZvrIqO/K/RjxB
	 wGBTGcoTeOjEJxPJz+rRwvucKorqmxVu9QEPg/+AmVNAB1xfcxs0nkGpJfgfIyevoXFkc
	 oskx5CblBul8qQcgVwhJsHZbnGdUEJTkUJ4qqkx4B1Cogq1flmghQV3zEX5IJl0J8vxES
	 bFIlFexueM6kP3e+juX7zBztErttNtK0We1ZduZgw37jbimfsDwZdpo/pEEo8la3yGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196953;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2rnCegKRImApbMspRVuqqVxA57iJ7+ZRMWkhIp4OERQ=;
	b=DkYCES3sIW+5rwTkY8WvafeAU6GrJSw5bUmUsEy610ZMuYXm56mRUMUaxlI/3oiR37vA
	 JunIJROMAlWK9VxvH397slwCd1XKtDM5ggqx8oYfHJsEo3nNL31AzC9GMU/RznNg09AS+
	 4RkqS6aqYenSV46MVcQ1W/OZk4PFgYFA5o7Yu+Y9ZrFUVJI13Tenv63EFeC/HJO7VYx9P
	 2cJ6oz4tLPrMRf16WOoM0gb1H3pxrlNpjHiMHmcv7z7dfpKioi8nlwIi4J8xRAHSxkKDe
	 1vx6PslLPY/m4iXOU20VpNwpi1cvtW3n0iOrQOxVO6QBHKjREuAUYez4gNo0TBPwe6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pDOiTAdm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZwU4uHIJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815BF606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 04:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 815BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pDOiTAdm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZwU4uHIJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A93K2sl2745930
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 04:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2rnCegKRImApbMspRVuqqVxA57iJ7+ZRMWkhIp4OERQ=; b=pDOiTAdmr9cXisFc
	CXuOhoe5qaukEZgNK66jbOkle9aT1U1h4l2Ay2IvDH2NnK3zcdoi3Iv471yhaPAB
	RrqBjafzB0ddn/FVUfMLakALSpAZlbs/HgpZQSTKwpsoU1iLZTBf3AB9ZwnVzQFg
	tryyKmlp9JMx9Zczg2B24TDTK5fSWlq8BzAbElL+Jy33MmP+ImFb8Rwg3LrMzDjV
	gKCBYRBE7Yllg312MdeuzHX2E9+4DFeYB+ipaXZSyFow/a78+3wcP9ZONA15tCyl
	XRlRph99CPXWbMmRv3dzKeigsrPmn6ZB6D1pF0tGZWVgUQ4N3alpZ5u+Y71QRFds
	52pwKA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvrevf1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 04:02:31 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37390b2989bso1616001eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 20:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794196951; x=1794801751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2rnCegKRImApbMspRVuqqVxA57iJ7+ZRMWkhIp4OERQ=;
        b=ZwU4uHIJNiPy+lL5JIKl3QKEjV1BS/cuG9QGrGLUHw5Cs7aSVa/g1Y+CgoAjkTwv/L
         Cv2sDk9reYEAMC60TdTgiksf5cvoHt3zM0sCg0RKEl46OHCHUXtTzJUO+KNngX5LWmKq
         BLRPmWarL14GdOcbYqfVw04eLhumOoiXSPxZPaUCL/i7ALSg66zNrlcDu+y77bxwk8Xv
         Lp53yK36IsNjWmlUyjcasqvjbIIOeUL/cbduPyNMW2J7JgHBBHwZdoD5g1Lz754pR39M
         vC1OF3li/sTsa1pPA9DYzYByhLYA3wHhoQyF/L6Gh+YVHYmcjdkc8Ae1oBhPg2CDdnpx
         ZCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196951; x=1794801751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rnCegKRImApbMspRVuqqVxA57iJ7+ZRMWkhIp4OERQ=;
        b=Dwueclvmm+GK6gLq5HvHCCGD0cly5jKpw5xgQz94Oe/zvhXSaxl76Z4iVAeX3LKMbe
         XqMGVeJIIciZ9fE2uE0mNQjEUGd1JY1MmSQCx+QH2K2TF1ojMuAqsbmEOcNltHiLIdGV
         8VaT2qPhmB9CCj1S+SOfQy2YYpH46Mw5Hsi4n2QDVfXR8ZkJiAfxbAIEYcm4nMiYv1CV
         gZsIfRhbKEoqiqZGgSfERtMZmWp9UUKtjmwp2qruv762xiP5HGsI8Jsiufks1KrPbAQC
         nyhQbA9FS88L32XXVYzAxfX1WicMa1xz/42JWU5ctERhrtqOgBewqo0OoemXDz0H0jwV
         M7ug==
X-Forwarded-Encrypted: i=1; AL+hErHup0S67dzp/Y2HJrp0YyV1nNvkWhmK/u9bLaGVnj/0llWJamIvtYF8KMn87E/MNlt03QDADanGGHJVwIwg@vger.kernel.org
X-Gm-Message-State: APuU4Z9iUjRA9mFn5M1DrFJ1hAzDrWsT7RUaIVstnbCvyM72wZHws7BW
	yrvl3NBgsEJ0lWwNENhpI76CCl2BUtuEfdXDuKb/xKvdF6pG3uskS03VgqhIn5BrsdTBuRGerWU
	zmhlqewBRY0EWhFIi7yuD4yhEI2F3QCMu+kOz+kMSH9W+It/mzr/PjZRzYRunc92SjMFc
X-Gm-Gg: AYBFou3ff/q1C10wiumOfE7raa/KFh2cTdUl9JPw9OGcK7s43D+qs9ukydfos5VNobo
	xmrx/FniB4EtonMM5ot6km11m94qeTAQS6SF4ILx5kQSoafV+tr2LLqoEtqI/G0BPrUDnkjyp0T
	SVfeWCldkoWc7PK5amYj9NObzt3OzqD3iDhvRVAR/4+dHJ5tbSOm3pCbY8rsKKmSK3S4K1+qzeE
	P7YBwieuV0gAI988/qhXOlGySIdGsWDY463gayQcJRyZ6+xWJhhG9TSDjCubRCnWKEKxn+LFT27
	/zIbKhJG4nlOuMMWzM97CAD0ocy8ujxUzPvaD6HvUQxLKtYyQWoWHWeoe3anrw5sRsLqighAxbR
	D5v5TNYYVvxxNZyJfGGDMNz3hsUKX8jPruVZWY6j9vBEIXEWTbGoZJlIjovj6KIR/dAXpdVXLuc
	7Lcew=
X-Received: by 2002:a05:693c:62cc:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3725e829ec5mr5087174eec.30.1794196950968;
        Sun, 08 Nov 2026 20:02:30 -0800 (PST)
X-Received: by 2002:a05:693c:62cc:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3725e829ec5mr5087127eec.30.1794196950284;
        Sun, 08 Nov 2026 20:02:30 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265ff3415sm8823911eec.18.2026.11.08.20.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 20:02:29 -0800 (PST)
Message-ID: <d7940676-abee-89d6-5e2f-3e2a2c5b70c5@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:32:23 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] media: qcom: iris: Wait for threaded IRQ completion
 during power-off
To: Joonhoe Kim <26rote@gmail.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Birk Skyum
 <birk.skyum@pm.me>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20261007-fix-disable-irq-safely-v1-0-45746f9a92de@oss.qualcomm.com>
 <20261007-fix-disable-irq-safely-v1-2-45746f9a92de@oss.qualcomm.com>
 <20261102220526.1755-1-26rote@gmail.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20261102220526.1755-1-26rote@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAxNSBTYWx0ZWRfXxJroOEEv60Qz
 uPEQWAzjH0COKnxaBGXgkHvP4qBmdww6cW+bNYYxSpcROm/T3kNHtpX9k3YKR4tP6kBkx6V0ulV
 8v+IkhHaapphhGCS1h+yjuX4w2dISIw=
X-Proofpoint-GUID: iTvIidA4FvIUeFQ6A8rla-9hvDa582Jh
X-Authority-Analysis: v=2.4 cv=FrKQbGrq c=1 sm=1 tr=0 ts=6af145d7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=btcJMxBC3-se3phSy3gA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: iTvIidA4FvIUeFQ6A8rla-9hvDa582Jh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAxNSBTYWx0ZWRfX1Djqg7AH/n0C
 /ctK/au73vPNDpW5rJTgHk+ieRbm8SvIBUbu6nI00Dw5kmOmupPJnIVTFYgEuNq4uvWo8h/VhHg
 l9dJ2x3XHFXR2FCusF5spQz37axzCuD29Kx6XPkpNegO5SozE2l1jqKRI63RJ9MOP5nRXTQgF1H
 UqrWDqYg5nZ6m4iegZkBperGS9ok1TnsgZDkz1KcYZ3jITi2ySFJHdUhfltkDEAO2Xq2uNVRvOg
 8w7U5EKEI6aR52oavThejTuiTUiUSPpXodYqa35Ydmg6QYgMrGvEd3H9KYNmd4Q5mgbuOsoFprW
 TZSJCKH5ZgjzqBK8OsbZPpSsOa6Af2AUt3hoHTmVIqkOBrsaNW190VeLEj9cq0xcQIfST6RXasI
 KHePSW5HZWWoHlpk5MHSJe5/FuJDGocbH/HVIhm0fmnhDAPr+K0vkQs6qtIGkf4Nz7XLZJoVtyl
 /Z7vXbo63hnGrUeR1Tg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090015


On 11/3/2026 3:35 AM, Joonhoe Kim wrote:
> Hi Vishnu,
>
> Without the series, I hit the same deadlock on a Lenovo Y700 Gen 5
> (TB323FU, Kaanapali, v7.3-rc). It happened when removing the module
> right after a decode session. rmmod waited in __synchronize_irq(),
> and the iris IRQ thread in iris_hfi_isr_handler() waited for
> core->lock. A loop of decode, rmmod and modprobe reproduced it in
> round 4 of 20.
>
> With both patches on v7.3 and out-of-tree Kaanapali support, the same
> loop passed 60 of 60 rounds. 2/2 needed context changes only. H.264,
> HEVC and VP9 decodes still matched software decoding.
>
> Tested-by: Joonhoe Kim <26rote@gmail.com> # Kaanapali
>
> One question. While core->lock is dropped around disable_irq(), some
> callers take core->lock directly rather than through
> iris_acquire_core_lock(): iris_hfi_queue_cmd_write(),
> iris_set_clocks() and iris_set_interconnects(). These are not held off
> by irq_disabling. Also, in iris_core_deinit() the firmware is already
> unloaded at that point, while core->state is still IRIS_CORE_INIT. Is
> that window meant to be safe?

Thank you for testing this on Kaanapali.

core->lock is dropped around disable_irq(), and all power-down steps run after
it is retaken, so the hardware is still powered on and queue memory stays valid
throughout. A command queued after the firmware unload in iris_core_deinit() is
dropped. I didn't see any problem there.

>
> Thanks,
> Joonhoe Kim
