Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657823;
	b=KYxuhxEcZsKSnoHUsh9Mr3WLCeYriNZ9R+ZE6zDo+ioVUKdQa6Xuvz2R7yQZwDLU0zeg
	 HqphEeVyleypuXfGfQP/bKnmQUMnJ7f/xrBiwwmTjR0rCMhBS5Cyj6eospPi30nM33sWd
	 eEt/V3spTZwARqOrSEwXXoK2A3GCclnzovf/I2rZQJCoEG0oPXii8cXTzbqwvpH8DHL/2
	 o0MoRNnDeXOZoAREYcecT4EFsSiAJPvXeqyJxFQzrQPNU9a2FAu4KNpsqTTHwAvmcbMwe
	 qo7dnydS6g3HctK3GhJeBLmxa8ofcsBBJqampiA/JKrEZTPj+sCSojdjT3dBGEz9ZCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=co+seYNbPFMqlU2tAJ2a+4RiWMQV/xbH4sEjketJ5gI=;
	b=zFl8cNr3aGRuOqkp4JBonMTwNSBidDxyl8hlfcqxxSOK50a30p7Hx+eYS3D5eF8WvMuJ
	 ikyw/dGlvUiPoaXzaO6PQFnrtBBPRF82ySvvHyoCVH2SgXzHTnaW834ahJ5meW2l1A294
	 L30g+Du/cMy2Kv3hDL34FHL5nz1RZC6wvzHDGe/ZDnG2XiilCYzwfBfyIWTGigvX64vwT
	 Cpt9qksrRM7WKH27A4cny2ojtJILoIDXc1sgm+QJP2mwb9zYQ2sH+BA2pvRSw2G0qffgK
	 CIp5papfEtVbPROQmM5HyznUu2gWseP4FoPHNEy82jYu+zSMRrvtZSZDxQf2YEH+Rhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="j2l/npnf";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fBGzltQD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7122606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7122606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j2l/npnf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fBGzltQD
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M702RC2714430
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	co+seYNbPFMqlU2tAJ2a+4RiWMQV/xbH4sEjketJ5gI=; b=j2l/npnfNgUYi5a1
	1f/Q+IRXz7wrjiU22OlhlRJU+fARfKGn/+SzabY1ov0f/Yo4Plz9h+Z4pTQY0xhs
	Gr+yswfrabk49c99BrR6z1eFr993zyOHt8Mh+9x2UlNqb9zR826aCxnoLyjJw8xY
	yNmo3vYIGkPOyO9Bl8HC4VCVpr/Gc2u32qN9e+Urxm9OuKVvZPNCevJ+NYiYVI5J
	VHZPFEwpgo6TlqOHdOFTIiRgL3vvJgmMQaEvtqJcZr8f+WdGSVcBs+ox/K+jvYov
	MZ3c8KpkgXqxdf010b5O1WK2pxfTbgNXQJw1nr6lnxa2qRg03ELbEAmVaMbctoGS
	UD8/zA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsevw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:30:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f1f2ecfso41450285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792657821; x=1793262621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=co+seYNbPFMqlU2tAJ2a+4RiWMQV/xbH4sEjketJ5gI=;
        b=fBGzltQDMDz5Zy/YLZkxH/Pny0U4Yco0mecyqUgamk0pM3VDk+Rswx3G5H+V8LRt83
         y9IGWWITkcJPRnkGSoe2rGQK0Pj4sBmHbk8iSDfI/qIMiuPxMLKCprEnp0c2OYW0Oouw
         Yd2bt55k68mESQkNBcYD295N/UyfwhnRXqrAilX9h6Ac1xVpYNbCW1TOAPsGa6zqZ22s
         tk1G7jv1S9wSg8dHkHB6OPIHzZ45ukqCBUgXjQWW0XBkHbAcUqNPKC0GIp//4BC9WUqG
         cBZm2+DHlygAqfEto09OghVbgA95gZrav/0KERorV6dBxPfz8/SYq7VD+k/VuV4miaPy
         8rsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657821; x=1793262621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=co+seYNbPFMqlU2tAJ2a+4RiWMQV/xbH4sEjketJ5gI=;
        b=cl9BTzob+o2tduGbtzMwplLg0fczhtDh0AK2yFRVA1AIu9OIkYmhhJK40u9kR0MR/g
         IGU6DIj/YKP6baACyKGA2DW9DJ1bNhqzXchZB/ZTcByLxE7EzreTnvc898JVWr7zyuj/
         xcOQ0EW9QKrV2Zk/1qM5knxIS3GgWoiOOZitZQqytdOdrKGmF7pOHRI+2swHWM/9Rt4U
         r4xDhARMhhosi/H07oQvTzRoYXjXSRVwiXYcl186T6+LupbO7e6GiNNUMEIq43lbUIGR
         sEx1AC+Ut0/Za504PXoHb1WeXCPnz2txp+FITq/B25JRModdwOIPUH/ByQ6OwUfWNMOq
         WLvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCBXvTcQWbOo48JzBDr/nJ+DdMCFd9Utxg6ALrCqNETAAOGrZNTL9ETU/ggPxm1JNSlGuIQMfqfiuBBVGj@vger.kernel.org
X-Gm-Message-State: AFq9FYLaCZ/l/HC+vAb+OYkMQB6Yd5cpennZzxMceUYav2X1A2hl072G
	sVZ5vbT/GhtbzUL7LpR4KZH65Rbz8Pnc2JRcFcQWDtimpRhqi6jDNQ2kPUQZhI4ecgFCe60M9mx
	i6LpTcIElsxkyENpx6rQJs0QjX1xWhTuHCFgvfJq2SigvlMnXUvIHk5HTcYWJZnykB5r+hEAFYu
	3g
X-Gm-Gg: AYBFou3RrwnttIcfrEbmLkcL6VcfPzTZpChdJ41Zl/7vFT1SHGfguhvWYvkonfrUbsF
	1phtahl3CKEN+p664HCt/GVMPoHe9aZDmoQO/NLj/Sbj9F76FnvMsmuN5BPh+oWm0NIR8EtYl86
	7dwi4QLgxWxFzOdQ0BjcRdmXQq/WRttNb60GeGOzHHx+gOu5kTktKi3LWTjHC216eALAgKAVol9
	IFHuqrPFnLGkgjpduACtHgP44u2Zoqmzj8T2gpmYYXtkg6NZOw1aWfgnGQS9fUJVSHxFEHkkIT2
	3dsBxsUV3OFrbsoLQUgJYZ57faJj9C5tGtHJOMzrLjnuOkyZ/VceO7VgurjaSFBC4JY8mQRJmEk
	if1NKlNbXarOky7MTkGVpQQ==
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr1002697985a.6.1792657820895;
        Thu, 22 Oct 2026 01:30:20 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr1002693585a.6.1792657820408;
        Thu, 22 Oct 2026 01:30:20 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5dd548sm80551066b.65.2026.10.22.01.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:30:19 -0700 (PDT)
Message-ID: <0e5df58a-e97f-474b-bd3b-9b1a24ae0c03@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:30:18 +0200
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
Subject: Re: HP OmniBook X 16 (X2 Elite, Mahua): DT bring-up report and
 questions
To: Jeff Roach <jeff.roach0@gmail.com>, linux-arm-msm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
References: <CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -a5aoBq3NHg17UF9PtaIrwecQKoMqfVS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX4Z7G9FolGi+y
 HKJw3/vLPTCPUojS9rI+5P4fBJT5d+saSOFBfZi4rQrR71KXQSiUE6yHgqzpcU5yv2NQvedwuKS
 15OeADqlAk8nAoDkuxB8u7RxZNd0Fontp4PvSYwT7mjVSwFqDWrAYvWoIQGDbkoY0wdSNLXsG+F
 ReiEwOJ+BkuyIOLHiGJDV6DUWlpCE/TYAGR2P1lSty8fvmbLGJMHdMAaMQnTfsh+Fp0bZ1w5xCs
 fEx0DMoOwiKFtRpVlmA9a8rXMsdkTa+E1bt5uRNDU4JrSiLtGWXq3CDmM26JjsfOJsDXCILzCze
 +8wevSqVYpOHv7OnHCyfoCM4RM3mIc/mmkJOEAbLBwfYB6NOwxPJld7zWeUxDwGDZQJLi8Yp3k3
 GlKe7Nz7Hq0v+sqHPEs4vjNHlb2D2LidGErdo35qf6zODo6RsulEY0Rwz78YdbyB6LzmP0NvMvO
 9p/dSBlKXZb9ypezvWw==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9c99d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=nIxwfDaLn7GDKLuIWW4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX3KH9NUrpSpNj
 leVKQodmebpL972JhIZbcv7qHM1dAWIpLAxZXr471zCdtUJic1o8m+mhGgpm6EE4dINNKymjC7r
 DtTqYV6e6M4LV1F46f4ejDvS8Q6kHgw=
X-Proofpoint-ORIG-GUID: -a5aoBq3NHg17UF9PtaIrwecQKoMqfVS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220033

On 10/22/26 12:34 AM, Jeff Roach wrote:
> Hi all,
> 
> I have a device tree for the HP OmniBook X Laptop 16-cp1xxx (board
> 8F46, Snapdragon X2 Elite 12-core, "qcom,mahua") that boots and runs a
> full desktop. This is a bring-up report, not a patch: the DTS is
> currently based on the Ubuntu linux-qcom-x1e 7.3 tree and still
> carries my verification notes. I'd like to rebase it and send it
> properly, and would welcome advice before I do.

[...]

> 2. CPU frequency. scmi_cpufreq fails: "timed out in resp" and "Failed
>    to query supported version for protocol 0x13", probe -110. The SCMI
>    base protocol answers at boot ("Qualcomm:PDP0"). The perf
>    protocol never does. The clocks stay where UEFI left them (about 3.5
>    and 3.9 GHz). Is perf over SCMI expected to work on Mahua with
>    production firmware, or is something else needed?

For a workaround, adjust your config to CONFIG_QCOM_CPUCP_MBOX=y
from =m

> 3. Suspend. PSCI SYSTEM_SUSPEND (deep) returns -EOPNOTSUPP, so s2idle
>    only. On resume from s2idle, usb_hs (a200000) gets an arm-smmu context
>    fault for SID 0xce0, then "xHCI host not responding ... HC died", and
>    every later suspend fails until reboot. Unbinding dwc3-qcom before
>    suspend and rebinding it after works around it. pcie4 also logs
>    "Timeout waiting for L2 entry! LTSSM 0x11" on suspend, but the link
>    recovers.

+Abel is the fix for that out now?

> 4. Smaller things:
>    - "GICv3: SPI 4115 out of range (use ESPI?)" right after the SPMI
>      arbiter probes. I haven't tracked down which node causes it.
>    - The pm8xxx RTC probe fails with -ENOENT because this machine has no
>      RTCInfo UEFI variable (qcom,uefi-rtc-info).

Remove the property.


>    - The headphone jack is a Qualcomm SoundWire SDCA codec (only in ACPI,
>      \_SB.ADSP.ADCM). I didn't try it.

The drivers are still in flight and should be merged soon.

Konrad
