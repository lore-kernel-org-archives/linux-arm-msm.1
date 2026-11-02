Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606320;
	b=t8m05wTdy+1FKMsD04jZ3ttRECWR8ZE5DueHhcsxoBTiwVMDlXCeYSngvScFZbGtwMo5
	 goU1DUBfC7Vm3uqaWgtQDIC0qlelCQDdL4P/eBaMyJ+mNLIB+OKqhFF2KKK8ThyMy4lev
	 D2cuxQElhcdrnKMOvCHAIC3mVIcSM8tx5LejIZSuHVNkc+N/A4KZta40cDWa0RYgvda8j
	 5v9nqJNS226Fwb2mzsZ97nw3lToi8kfbm/Ut4osSb3/kFQGZ3buLkdDrZKVEDUEuUr0wU
	 o4T9roZ0kIICCBgssNtwEdxDuQCkLrx7bCj2qwR4iBNWGfLWsaHNHXU+DKCdz9mOiAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ke6cgZpZBf+UCTrm1HAli9+h7m1fVngc1M0Sn68Rq0k=;
	b=qsfLHV1Y3sPtGMsAG0k6G3xpKLqRQ6oWuCKukianf8N17WY9V3m8+FDs3pwrXjU7ZK3J
	 qzTdNrIkoE+howuXkWBvud7U+rPMMdqWEgRxS/e6aUnuQfJNR+m4vK5dzaD/bss8qHFkV
	 9yCng7XGm+9o6vINuONxcCaFkpkwE6k4Hvgkr3NAqFtIOA6Vk++k5ZmohvACquYday2Io
	 7IMVoxjtvdu8dAaMWdjnl5K1+RX4wDLXkJfXWEP1idBsojac92hl85c12aMDG1037aGbY
	 KRYSbmb0UN2ORPlj2MoTNCTr/UZBQ6FLNX+dhoud3h2o/Tj73Ywmh0W3nYcdgpkpCZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpLDqk12;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YtZlP7bP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D00D606A331
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 07:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D00D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MpLDqk12;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YtZlP7bP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A25W3Yq3924352
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 07:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ke6cgZpZBf+UCTrm1HAli9+h7m1fVngc1M0Sn68Rq0k=; b=MpLDqk12NgMkn1Lr
	JR/8RZRsJ5JkxjwIKXje8Fb+BhztJbp//r+MsCHnKPDTotO/jqlVQAeegxOgUbCM
	c0qklXSHDVwZDFVRTC5FAYo1a0Fq/ugRsjTGUs1FOFfiTTsqTh0N5gQpyfWI5baz
	wdpq/ziAFm2SzE6UUaiZpvRSCTk0ZHG4Su0DBysaoU644BnrFUm94kXEWP/rKD1D
	GKU6Z5LkYkmmtmibXyTiI24MqYXM03BZ6NLu/9jJFBF++oYZU7jlQhk2wdlrhzph
	AG5awQXIJlXAK7wncQvhxp6qHlLCBESLh8+eRXFsiELvSkBcK9XnYJKwaiVuvJhL
	ZXlz7A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1rg70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:58:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e93f266d20so45742115ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 23:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793606318; x=1794211118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ke6cgZpZBf+UCTrm1HAli9+h7m1fVngc1M0Sn68Rq0k=;
        b=YtZlP7bPY66PjG+Fp+ZqFV49ErJVVTsDc1hZv9GbbU7L/vF+X0+1SOH0Ad7iTiPl5n
         /4tCYej9FhqZnhxVgwohj2TITFiJ+O4zPrua9fnR65VjSfDreibew2FhCp/tj5QRiBD9
         vJig3sMTUjTuQXuTDvFhqK6G07ZE7psSVhukCMnhFcOHhDpvW0MBc5t2oaYjAFZON4/9
         HZQd7tiVaYGc21AVIk/j/cKPXuaNnu0dy/bfFWIbXJjMVm5oeCSAwGvGm/otEr3kcC5n
         LIH7NxuBDi4A4J9/nT0uY6QEmNh+9yQ2VbLl4+hMy5wa7OY6DLxXqHd6pHpZ+qjJ9Dji
         8M6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606318; x=1794211118;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ke6cgZpZBf+UCTrm1HAli9+h7m1fVngc1M0Sn68Rq0k=;
        b=CZHeYMyfue+mpRfSWV/j6qS0yKZjKPcr5fo7VRusVXYts+56njTC/Qb7IqTjSH0FcD
         T7KqD1Sk/34q4+NUX+7Ohn3dD+CFrYM6ATkncZhTGUpfMTqd1BG3d1rsEQVhaG+kB3EI
         sbF/6y44Kda8gJFC0+/fhAEjwxcT0qTvP8V9sTkNX8O5sODVQAu3+ow2ApC3raFJA7A/
         QtsP86Rbm2LRaw3MfhZSEaueKwOcBFaZmxxbuTX2Js565yqsmHiN5+pzXOcrUw0K+WcE
         A0ygj+b2ZxdrvNYx6HhKRgp2wvaiBMJFc5390qIyfDh5um+vlFbEcI+j3NvMS8gMsAFM
         BOBg==
X-Forwarded-Encrypted: i=1; AKwUvBznaqCsaE2ggUE6Ds4RJZ83eMPcK3ENBE0R+3y1pqOqpLMzmXU2WdGIzqW1Kzo6TJ3whPtRErdPODRtscXc@vger.kernel.org
X-Gm-Message-State: APuU4Z/E9Gf4v1eHgd/wA7mTaRWrbrRoP9pPBUjsxFaMNJVpFl+xzrlv
	/M2L1pDXQR08VozPGJ8JsV64F4Ilrpa4qSmfkdkJzrQPIlG0ErjxKmD2LltKaN8aOLQ3M0az5vl
	yWW0JTATJ8m8oc265vBuYd98uHNWur0yguBqRebF0d+RJQdpi1Rg0DetLqKFmha3MXWO2O236U3
	AR
X-Gm-Gg: AYBFou3MmLLAgIWzQJg/ipUK0aGmyGyl3MPhi13S+gsxtxkYRFLaF3seQVZwIv47tKP
	UkiAojXEaX1Ty3on/zCl7xh5nhovOWE8FjuBbU+72IdVcjxxb1SLeOqPTM6PL/PeZgHb/i2ujTd
	oWPL+MWBCllB7egtp6Rpw+ctCP40HX32kB5PIxVA1G9dt8NCoFI0N6BszEp1m/KS/P9i6dYyNtP
	tNk/FA+Ix6kAc4mjxBI/R0gaW1TaxWeUhyLIQIdaZ55FMNJajkh7xaSUQkPqxb27YoQWFfXHUwA
	Rm2aqni/00M9wdjchGWEFbNUyj7Df+ky5rPCy+fMIp3VwyarOWn19HmrmC5wuN1vonBnML52BxD
	Ym2ge/5yE68IIa02GUl1DnXRIAvtg4Jouvam2OekYvWUAB6LIS13YI9jB5YjMB1yQkLJ0pY647N
	hlW0sO6GfgMKbgmEdxxvWNHdxN/JWlm4R9KMbc5nLQ
X-Received: by 2002:a17:902:f548:b0:2e9:572a:7da7 with SMTP id d9443c01a7336-2eb364f1979mr89202305ad.49.1793606317779;
        Sun, 01 Nov 2026 23:58:37 -0800 (PST)
X-Received: by 2002:a17:902:f548:b0:2e9:572a:7da7 with SMTP id d9443c01a7336-2eb364f1979mr89202065ad.49.1793606317202;
        Sun, 01 Nov 2026 23:58:37 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39298329sm23694945ad.61.2026.11.01.23.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 23:58:36 -0800 (PST)
Message-ID: <90194df3-c05a-4e82-9f12-11f33b0374c0@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:28:32 +0530
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
Subject: Re: [PATCH v2] usb: dwc3: qcom: Defer VBUS override update during
 system suspend
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>
Cc: Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022224220.480-1-tvlad744@gmail.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261022224220.480-1-tvlad744@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -QbvUVz9SmCvd86wkxwKUJZRoioqxUUc
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae842ae cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=QJlEbJcQkAJ0Kpe_DjEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMSBTYWx0ZWRfX/g+j8QCAW4Ug
 8szfjOzBwuDpp6NisdM22GdIJYqIvZoEujvK9tTwB7+a1uhkf9xYM2qdpcDZ74TuICzFIwrGG39
 LWiOWsv9heoefV4+Nihd00Gfqqxz6rLlUWhyO/k/Awpb9GquC2xTJNsc3epK99YQj9HY4xtbqHe
 lEHT8XAEOij4hdCP/jlkIFr27mBVePiJbPeEGcLknzMK3l0/28q6Tz7z9HFe7hFnnsO1D0pOrhN
 0UqZlHWtqUX7v/sDgD89CE0exevqz91RD1D4CGRphh+mXGi8kokrSwnhYhXJpzsSTSQ14nFjOmo
 tF0Lbq6giITXZliDqJXo33tJ+jnP7nb4sr6bBlL5/W6ThdeQkbMSEyRlV8XoMuO7Wgt8G4fbfwX
 OrNyfb2U+GK6NIAzWOwkAe8ZshGOsTu6BfH5Vhfy1My0HvHIBhEEimR48Rva0CHoZqz6ilGGbda
 kONk9N46l8fe5J9f7QA==
X-Proofpoint-GUID: -QbvUVz9SmCvd86wkxwKUJZRoioqxUUc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMSBTYWx0ZWRfX0y+Y+LKdKRtL
 v9am5X7IZ9rTV+XCQPA6bm1H3Jb/p1E+VAtCBs2CA1gq2GuGOiu5WdEFOzJ7OfoNGRvGQVQKXDS
 SGtoh7AWx0H0FSRAN5lBsS7QMKYNVJU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020031



On 10/23/2026 4:12 AM, Vladyslav Tymoshchuk wrote:
> dwc3_qcom_set_role_notifier() updates the VBUS override in QSCRATCH
> synchronously, from the context of the usb_role_switch_set_role()
> caller. The glue assumes that role switches only happen from a
> freezable workqueue, but that holds for the dwc3 core's mode switch,
> not for this notifier: the UCSI connector work, for one, runs on the
> non-freezable system workqueue.
> 
> On SM8750, when the USB cable is unplugged while the system is in
> s2idle, the UCSI connector work for the change runs before the devices
> have resumed. It switches the role to USB_ROLE_NONE, and the notifier
> accesses QSCRATCH while the glue clocks are still off, before
> dwc3_qcom_pm_resume() turns them back on. The access does not complete
> and the SoC resets. pm_runtime_resume_and_get() does not prevent this:
> runtime PM is disabled at that point and the device is still marked
> active, so it returns success without resuming anything.
> 
> While the glue is suspended for system sleep, only record the VBUS
> override update and apply it from dwc3_qcom_pm_resume() once the
> clocks are on. Apply it after the core has resumed, since resuming the
> gadget enables the override and the role switch is the more recent
> event. Serialize the notifier against the system suspend and resume
> callbacks with a mutex, so that a role switch can't run while the
> core or the glue is being suspended or resumed.
> 
> Fixes: 21188e8d6d75 ("usb: dwc3: qcom: Implement glue callbacks to facilitate runtime suspend")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>

Tested-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
> Changes in v2:
> - Hold role_lock across the whole of dwc3_qcom_pm_suspend() and
>    dwc3_qcom_pm_resume(). In v1 a role switch could still run during
>    dwc3_pm_suspend() or dwc3_pm_resume() and bypass the deferral, as
>    the Sashiko review pointed out [4].
> - Link to v1: https://lore.kernel.org/all/20261018143126.3978-1-tvlad744@gmail.com/
> 
> The review also asked about the direct_complete path, which skips
> these callbacks. It is not taken for this driver: every
> qcom,snps-dwc3 node in the tree has a power domain, and
> genpd_prepare() never returns 1. Where it is taken, the role switch
> is dropped as it is without this patch, and the hardware is not
> touched.
> 
> Tested on SM8750 (OnePlus Pad 3; the board DT is not upstream yet),
> v7.3-rc5 plus board patches, with the UCSI connector work still on
> system_wq and without the pmic_glink RFC [5]. The test kernel also has
> local ucsi_glink and qcom_battmgr changes that make a cable plug or
> unplug wake the system from s2idle, similar to Jishnu Prakash's
> ucsi_glink patch [3]:
> - cable unplugged during s2idle: resumed in 2 of 2 runs; without this
>    patch the SoC reset in all 6 earlier runs. The switch to
>    USB_ROLE_NONE came 15 ms after the start of the resume, during the
>    noirq phase, and was only recorded; dwc3_qcom_pm_resume() cleared
>    the override about a second later.
> - cable plugged in during s2idle, s2idle with the cable connected,
>    and unplug/replug while awake: no change in behaviour.
> - with a test-only msleep() under role_lock, so that a role switch
>    comes in while the lock is held:
>    - 3 s in dwc3_qcom_pm_resume() after dwc3_pm_resume(): the switch
>      from a cable plug during s2idle waited for the lock and then set
>      the override directly;
>    - 20 s in dwc3_qcom_pm_suspend() before dwc3_pm_suspend(): the
>      switch from an unplug waited for the lock and was deferred. The
>      unplug aborted the suspend, and dwc3_qcom_pm_resume() applied the
>      update. No reset.
> 
> I have not tested this patch without the wakeup changes.
> 
> The UCSI side is discussed in Abel Vesa's RFC to queue the connector
> work on system_freezable_wq [1]. Since v1, I have also sent an RFC
> that holds back the PMIC GLINK notifications over system sleep [5].
> With it, an unplug during s2idle on SM8750 no longer reaches this
> notifier. This patch is needed either way: the RFC does not hold back
> a role switch that is already in flight when the system suspend
> starts, and callers of usb_role_switch_set_role() outside pmic_glink,
> TCPM's kthread worker for one, are not frozen.
> 
> Faisal Hassan's SA8255P series [2] also changes dwc3_qcom_pm_suspend()
> and dwc3_qcom_pm_resume() (the wakeup argument becomes a pm_message_t);
> whichever goes in second needs a small rebase.
> 
> I used an AI assistant (Claude) for the analysis and to draft this
> patch and its description; I reviewed the result and ran the tests on
> my device.
> 
> [1] https://lore.kernel.org/all/20250205-ucsi-schedule-conn-worker-on-freezable-wq-v1-1-107d1356b77b@linaro.org/
> [2] https://lore.kernel.org/all/20261010053246.2991984-3-faisal.hassan@oss.qualcomm.com/
> [3] https://lore.kernel.org/all/20260722-ucsi_glink_wakeup-v2-1-b43dee56df24@oss.qualcomm.com/
> [4] https://lore.kernel.org/all/sashiko-outbox-176222@kernel.org/
> [5] https://lore.kernel.org/all/20261022164151.592-1-tvlad744@gmail.com/
> 
>   drivers/usb/dwc3/dwc3-qcom.c | 61 +++++++++++++++++++++++++++++-------
>   1 file changed, 50 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56..b22a72e3c1b9 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -10,6 +10,7 @@
>   #include <linux/irq.h>
>   #include <linux/of_clk.h>
>   #include <linux/module.h>
> +#include <linux/mutex.h>
>   #include <linux/kernel.h>
>   #include <linux/interconnect.h>
>   #include <linux/platform_device.h>
> @@ -85,6 +86,11 @@ struct dwc3_qcom {
>   	struct icc_path		*icc_path_apps;
>   
>   	enum usb_role		current_role;
> +
> +	/* Serializes the role notifier against system suspend and resume */
> +	struct mutex		role_lock;
> +	bool			vbus_override_pending;
> +	bool			vbus_override;
>   };
>   
>   #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
> @@ -561,27 +567,40 @@ static int dwc3_qcom_setup_irq(struct dwc3_qcom *qcom, struct platform_device *p
>   static void dwc3_qcom_set_role_notifier(struct dwc3 *dwc, enum usb_role next_role)
>   {
>   	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> +	bool enable;
> +
> +	guard(mutex)(&qcom->role_lock);
>   
>   	if (qcom->current_role == next_role)
>   		return;
>   
> +	enable = qcom->current_role != USB_ROLE_DEVICE;
> +
> +	/*
> +	 * Not every caller of usb_role_switch_set_role() is frozen during
> +	 * system sleep, e.g. the UCSI connector work can run in the noirq
> +	 * resume phase. The glue clocks are off then and runtime PM can't
> +	 * turn them on, so leave QSCRATCH alone and let
> +	 * dwc3_qcom_pm_resume() apply the update.
> +	 */
> +	if (qcom->pm_suspended) {
> +		qcom->vbus_override_pending = true;
> +		qcom->vbus_override = enable;
> +		qcom->current_role = next_role;
> +		return;
> +	}
> +
>   	if (pm_runtime_resume_and_get(qcom->dev)) {
>   		dev_dbg(qcom->dev, "Failed to resume device\n");
>   		return;
>   	}
>   
> -	if (qcom->current_role == USB_ROLE_DEVICE)
> -		dwc3_qcom_vbus_override_enable(qcom, false);
> -	else if (qcom->current_role != USB_ROLE_DEVICE)
> -		dwc3_qcom_vbus_override_enable(qcom, true);
> +	qcom->vbus_override_pending = false;
> +	dwc3_qcom_vbus_override_enable(qcom, enable);
>   
>   	pm_runtime_mark_last_busy(qcom->dev);
>   	pm_runtime_put_sync(qcom->dev);
>   
> -	/*
> -	 * Current role changes via usb_role_switch_set_role callback protected
> -	 * internally by mutex lock.
> -	 */
>   	qcom->current_role = next_role;
>   }
>   
> @@ -624,6 +643,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>   
>   	qcom->dev = &pdev->dev;
>   
> +	ret = devm_mutex_init(dev, &qcom->role_lock);
> +	if (ret)
> +		return ret;
> +
>   	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
>   	if (IS_ERR(qcom->resets)) {
>   		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
> @@ -752,6 +775,12 @@ static int dwc3_qcom_pm_suspend(struct device *dev)
>   	bool wakeup = device_may_wakeup(dev);
>   	int ret;
>   
> +	/*
> +	 * A role switch that comes in now waits until the glue is suspended
> +	 * and is then deferred, see dwc3_qcom_set_role_notifier().
> +	 */
> +	guard(mutex)(&qcom->role_lock);
> +
>   	ret = dwc3_pm_suspend(&qcom->dwc);
>   	if (ret)
>   		return ret;
> @@ -772,6 +801,8 @@ static int dwc3_qcom_pm_resume(struct device *dev)
>   	bool wakeup = device_may_wakeup(dev);
>   	int ret;
>   
> +	guard(mutex)(&qcom->role_lock);
> +
>   	ret = dwc3_qcom_resume(qcom, wakeup);
>   	if (ret)
>   		return ret;
> @@ -779,10 +810,18 @@ static int dwc3_qcom_pm_resume(struct device *dev)
>   	qcom->pm_suspended = false;
>   
>   	ret = dwc3_pm_resume(&qcom->dwc);
> -	if (ret)
> -		return ret;
>   
> -	return 0;
> +	/*
> +	 * Apply a VBUS override update from a role switch that came in while
> +	 * suspended. Do it after the core has resumed, as resuming the gadget
> +	 * enables the override and the role switch is the more recent event.
> +	 */
> +	if (qcom->vbus_override_pending) {
> +		dwc3_qcom_vbus_override_enable(qcom, qcom->vbus_override);
> +		qcom->vbus_override_pending = false;
> +	}
> +
> +	return ret;
>   }
>   
>   static void dwc3_qcom_complete(struct device *dev)
> 
> base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a

