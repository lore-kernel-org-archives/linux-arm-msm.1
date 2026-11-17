Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903449;
	b=1kLV9gOl2ts1u0Fas7NA20VrmTSm+LDI1phCSP6Bb+6JjHvxBNV3018HZIkBvV/m4ZW6
	 LyLsYF7+V3WPi59sVLkfMEbztNdFw58+zVNczuOXqUxkx7N9Dh2cRt/w71YcTEPAgBQa2
	 wXAUc3ny2DJCP9oe2LQE1pAIXyJL/X3hB7unAa8VYUZIaqBAKoXCgim7izQuWoy6IJ9GS
	 VZ4JsikWJjJYQc/AuzJfOt38oY31Qm0IIVU4p71HOXbfhv1NcYr21iUvE6l3kQ6TVIU+l
	 vqAShv7UisHgwY6Llslk+JFbIsxE5OvL1ZHM6aLzhQhkE1EBZp+kAegJdfLE1CzPPYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VnUxqPmAnyktQW8ngvTXIcHsZ0VltHWVTOS3IQEC3CA=;
	b=5K0kVC9ypY239qe9n9lMoJ3mc7y55cyi8NC72tVFAiCHF+Ub8fJExsbzIgPv2S2DRt17
	 nNUE5Rkhwhbqz6unVPj6vUU5Skg0DyUHb1TPRVoDGtHRC+2q7ur5Yk9uGD+pptChZVGnR
	 9s2yn1gYjdI6SQHojctVG/dApAuOcQAqPcH2+yNfI/b6+NiYb5RPuRwaag/Oww6qQi2RM
	 FDfXxEkhLW2r7BH46WpLHyTzRxLne777whtM1F1lKCK9YZRr+w/pnOShP85/mKWHEdcQt
	 WIsu1caeksFbXdfBmx9Q4iUC6DX9uJQpyBYYwyQgt9g3RgLIxPX47fjtAQ1MAwFGC5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=loOySJJL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PsYUXt3B;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC58606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CC58606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=loOySJJL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PsYUXt3B
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH88qOv3407493
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VnUxqPmAnyktQW8ngvTXIcHsZ0VltHWVTOS3IQEC3CA=; b=loOySJJLdkkjQ5T1
	Q8tq73YjFGgr1oB2njcFGFzehW3yTonyFFkHLOsTpcbNcVSIC5xeGlBaL+RvsuIW
	fEDWCNXm6ItAA9Ora6R35NVQgpqBcGiCdCbn0bSC3BshceC9nttMm1Mg1aFf2TG8
	+VnpBmzSDilLgn9Yqk0hmo7MCWRVp9TMhUqmGWTPROLd3jik36+oRbYEfxKlJcXU
	MVkFJNgiQTR2PGrbdL2IcJjYreQt7wsyQfDQ5dz8zYZRs5lkElY7yGm45mxNTAMs
	gO/uMz/uwQodnby7CG7HpDYnOGvKrlszkjqUC8B1lAJpVTWgDqEH/5cCP3XJ8Z6T
	1qh2pA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09htj3an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 08:17:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375f0fd31f4so2980469eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 00:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794903448; x=1795508248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VnUxqPmAnyktQW8ngvTXIcHsZ0VltHWVTOS3IQEC3CA=;
        b=PsYUXt3BZH0zqWeZsyamgIJMkRULCPOYJtgZBaUObipB/VuIcTgQ3sFXZR06Z6J16l
         1E4cokHrI0yAEKKmuSuYgbwbO/hz1UIWslwpeI6/XXSNWaZlWCD9uIYNzKmk/WsA4dUZ
         G1jck+jCOGYWhMj2eWoo0rwSjeD+Sk4SiY7NE5HRKaAJj2PRkl3KJlsFjobeTk/gU/HO
         PUEjR+ChQ9lDCao8Wyw4lf4mo8MWeWcp0+dT/NeQqqWYeprANFp5pT7dUliy/jxBtan9
         /RD+SeOYsqHKgr6yNdPG50DYB2kHy0GnkNnuLOdF5TvH+3eAu5s6eUYtimqi/QUptZVl
         aI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903448; x=1795508248;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnUxqPmAnyktQW8ngvTXIcHsZ0VltHWVTOS3IQEC3CA=;
        b=cesOj6fyDQ/D8IskXZZ9S9KaK1MtST3j1pZWQ2QMcbER+kBImmx4SVXxCpIUT9vNvp
         tizNGtcFO8UrkNxAG34g7QZfAAp/R7OIV0BT45K6DfOYhvhe939sst4amozax5e3r+8N
         jfDdH682SAYDZ5i8ofQ62dmEL+TYvhoxfXS700GZLZZ2a1zgknuwJxgjQ6256Ueh54Vl
         rx/6fINF8+rgksRJ7OMsJPDXu46JzP9VlQRoy7CSRJgS00mMqEhQ1GFu2pEkA2FGK3B4
         6eQmUv70wXFjLluriLNRv/6SXoKx+f5xZoAzgPmOC/My8kLagMhXJEYzGxv5MAn5q7rg
         7nZg==
X-Forwarded-Encrypted: i=1; AL+hErHYV9Lv0b4YCA19chy180cpOd8NZ+myEL9hzLVAd7y6FnMK8J/zUluGPGFy/m8LjsIZThTyD1urd5YKUzt0@vger.kernel.org
X-Gm-Message-State: APuU4Z/kun76BAQeRGZcE0Uy4rD/ecC7Y2+Qglx7odgGIVwsZDOJ3bkN
	hLP0XK05Jx8eYR/Yb6/uUjSsvRQEb6HBPW5A2XT8kUgxYbwY391P7G/dj8R4DSMwmKU1fm8stoE
	pTogXa4VSj6tjYjU907NqSL12jGOEi9hPkijD449OMzH8qL/Dz2xBSYtA2FpY5cJh2qm8
X-Gm-Gg: AZFdTZfoo1gsBUIVaND3gAf7gegHTj0/cY1Toi971ePv/pcfg2bcncJ8GlJ+tRZWuNE
	1BN/aAoVSDvhHxHpkQkCcu4BHwGQYonNWLy4l2BooVkwAglMRVASahpDEV1z7tadQWiJCMc2duB
	RKEpa7EkovUgI8LNpR1vi7RMYZPVhBQyHbcZniS/8vio/hBr3nrFI+e1wGBDDux1ydLeWDBHWm/
	Fa5pEmETSJSTnakeQS3e7jhJu42Rg3EQIWAKOCooB52fjlBXDnsyz0QxmZPDAmaY/rcpLKs9nJN
	Do1bHEtLZZS0VdLoCBfMXYsxY2+QmLTG4uMq9MrdhHLv7O9PkbTAnSlRvWjf1iB6OJLN4eSWDsW
	VkqT5Vh6wbYYkH3hEdT0Y/zqTjubOLprD124z7W9CUBFgEzbnvGtMTbxMn7kVF2miUcU1DzMb7q
	V89glC
X-Received: by 2002:a05:693c:4153:10b0:36c:9af3:22eb with SMTP id 5a478bee46e88-379681c99b3mr15052242eec.34.1794903447609;
        Tue, 17 Nov 2026 00:17:27 -0800 (PST)
X-Received: by 2002:a05:693c:4153:10b0:36c:9af3:22eb with SMTP id 5a478bee46e88-379681c99b3mr15052203eec.34.1794903447055;
        Tue, 17 Nov 2026 00:17:27 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm63388577eec.8.2026.11.17.00.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 00:17:26 -0800 (PST)
Message-ID: <b4a641c5-2e22-6216-7cad-ffeb270125a7@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 13:47:20 +0530
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
Subject: Re: [PATCH v2 2/3] media: qcom: iris: Wait for threaded IRQ
 completion during power-off
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Joonhoe Kim <26rote@gmail.com>, Birk Skyum <birk.skyum@pm.me>
References: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
 <20261111-fix-disable-irq-safely-v2-2-8e13f68c2ef9@oss.qualcomm.com>
 <c5444a64-ad14-403e-8453-0bb0a16dcfa8@linaro.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <c5444a64-ad14-403e-8453-0bb0a16dcfa8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX/21wEvIFYJpk
 mQGHjvhjPPZbsB29qGJbDXDkpkcNaqPS/+bYcaTw+Xgf+Ss5RQa4j8aPOY169UnMFsLrXDA4rG2
 wd5xheAbsznl5e41n5wPKFvE0ArGOO8=
X-Proofpoint-ORIG-GUID: m1s2_hi5NMGDDLvuiJH38amTVeL4emi5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfXyoJEsWfI2fzh
 /cdJwN5sTvd565TwaoKA+EKgcpE4opHgiFHRIlsfNLNxmoD/wdHuGa5U+tUTR0DfFSEd3uwY6TZ
 aiz66rDVXMS2ZDjNLZLPheWQnbmghPD6GN6+URE1YXP8CDUgc4uBmr1PqoFqbtWv4es4G0ubP8x
 YKM7N/4Bzv97w3kfFiCMYld2E4TcEB4mFbTmB32r0/rQfXvanf6JtqmGPVfQZ9XTN04xmhklB46
 NEXSZHN52gCdDl60V3Aa4X6s2t/TXav/fr3+PxP8s+UthgPJlmzQb33y7PkhdzmPjZ4uK1mEyqd
 zedIVKPs+l/lOCAnknxsefQb/sebHvOq52hC4klnM+fOtYhMkH1cWAPVVA90pL7NMMGtGgjPXXU
 gmXVC3uEd7u69fy5Cdb3DT7X/z3FP7zu3H+/RpeMCbvrMscF2eQ+3/bTmTuJ5elsO7YQT9OhRDG
 EOKfFh7LWZ/l4df6jTw==
X-Authority-Analysis: v=2.4 cv=K963jCWI c=1 sm=1 tr=0 ts=6afc0d98 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=M5-Xm-TX60NQkl0miT8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: m1s2_hi5NMGDDLvuiJH38amTVeL4emi5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170032


On 11/13/2026 6:25 AM, Bryan O'Donoghue wrote:
> On 11/11/2026 09:05, Vishnu Reddy wrote:
>> +void iris_acquire_core_lock(struct iris_core *core)
>> +{
>> +    mutex_lock(&core->lock);
>> +
>> +    while (READ_ONCE(core->irq_disabling)) {
>> +        mutex_unlock(&core->lock);
>> +        wait_event(core->irq_disable_waitqueue,
>> !READ_ONCE(core->irq_disabling));
>> +        mutex_lock(&core->lock);
>> +    }
>> +}
>> +
>
>> +static void iris_vpu_disable_irq(struct iris_core *core)
>> +{
>> +    WRITE_ONCE(core->irq_disabling, true);
>> +    mutex_unlock(&core->lock);
>> +    disable_irq(core->irq);
>> +    mutex_lock(&core->lock);
>> +    WRITE_ONCE(core->irq_disabling, false);
>> +    wake_up_all(&core->irq_disable_waitqueue);
>> +}
>> +
>
> Ouch, this is some mad amount of jumping through hoops.
>
> As General Pierre François Joseph Bosquet said of the Charge of the Light
> Brigade in the Crimean war "C’est magnifique, mais ce n’est pas la guerre" -
> It is magnificent, but it is not war.
>
> Why do we have to hold core->lock over iris_vpu_power_off() at all ?
>
> - What is the data-structure or
> - Logical state (the state variable I suspect)
> - Or guarantee of atomicity
>
> We are providing holding that lock ?
>
> These are pretty much rhetorical questions - the above locking scheme can't be
> right. It implies we are doing something wrong and not really fixing that
> wrong thing.
>
> Holding the lock across power_off() seems to be that wrong thing.
>
> disable_irq_nosync() seems to be a correct fix - so if our locking is so
> muddled we have to go to the above - there better be a fully reasoned and
> unavoidable reason why.
>
> Perhaps I'm being overly reductive here but - why not "just" refactor the code
> so that the power-off comes after the piece held in the lock ?
>
> i.e. push that into a worker and then do a synchronous wait on the worker ?
>
> The chatbot told me I was wrong about the worker because "it would deadlock"
> and I can't be bothered burning the tokens to tell it "I didn't mean hold the
> lock in the worker"
>
> It did make the point that it thinks the only thing being protected by the
> lock is
>
> intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
> ...
> writel(CLEAR_XTENSA2HOST_INTR, core->reg_base + CPU_CS_A2HSOFTINTCLR);
>
> Which venus does like this:
>
> static irqreturn_t venus_isr(struct venus_core *core)       /* hfi_venus.c */
> {
>     status = readl(wrapper_base + WRAPPER_INTR_STATUS);
>     ...
>     writel(1, cpu_cs_base + CPU_CS_A2HSOFTINTCLR);
>     return IRQ_WAKE_THREAD;
> }
>
> i.e. power off in the IRQ.
>
> Perhaps even simpler - just do the power-off directly outside of the locked
> section... once the IRQ is quiescent ?
>
> Either way I don't think we have a good reason to hold this lock and can
> certainly find a way not to hold it - assuming the only thing we care about is
> kicking that register - do it in the IRQ why not else do a worker with a
> rendezvous or even more straight forward.
>
> void iris_core_deinit(struct iris_core *core)
> {
>     bool power_off = false;
>     int ret;
>
>     ret = pm_runtime_resume_and_get(core->dev);
>
>     mutex_lock(&core->lock);
>     if (core->state != IRIS_CORE_DEINIT) {
>         iris_fw_unload(core);
>         power_off = !ret;
>         iris_hfi_queues_deinit(core);
>         core->state = IRIS_CORE_DEINIT;
>     }
>     mutex_unlock(&core->lock);
>
>     if (power_off)
>         iris_vpu_power_off(core); <- this ?
>
>     if (!ret)
>         pm_runtime_put_sync(core->dev);
> }
>

Thanks for your review.

Moving iris_vpu_power_off() out of the core->lock section can lead to other
issues:
- A queued threaded IRQ handler can still access the registers while the VPU
is being powered down, as disable_irq_nosync() does not wait for it.
- A concurrent iris_core_init() can run while the VPU is still powered, and
the delayed power-off then shuts down the freshly initialized core.

I will rework this in the next revision, using your IRQF_ONESHOT suggestion
as well.

> ---
> bod
