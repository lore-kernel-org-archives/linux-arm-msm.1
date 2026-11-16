Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829146;
	b=DHOEnb7EM5ftAqmj6R7VPsvuPM69+bwzdABIO1tl2AS+MvWSfbaiaMD47w98m0wIptWJ
	 XQmTCDVJEgFh37chql5wh33TBt0bnYNhVlBPvDT2muvnoJY0zxVBurcA8lLamt1HAmuxB
	 5kF+dchDNvPI0SAXVynJlw56TiDbYU9aqMZ90HDBhOUFEUy5YxVIpz6VSSeRN4d+MldDR
	 jadEX0j2qjIizoVxkUG1KYJwsLuQu2oAKoHoTvOH4BonuAeNHqfjpj+90B0ysOvBW0dX4
	 G+89avadIVyBYGa2nyWx2YoZxNv+cH3lyOrC3MZ14/sLQJSRcUE9ARK5nYp9aaJRPVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829146;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ajrBayh+hf9TzW6sC/OulW/Cwr8R6pJ38qBUt0Xogo4=;
	b=iU75fbDztrbG0reeBIwqZzqSXdxPipyPPOzYCT7w2daX0s/fk78TiNvRMbamiuwEQPwc
	 rieDSQiC9poEM7lngiVjOYnIyzt8qmPsObueQa6ZQJ4o8D+BplxOwZeUfUmKVqkIsK3Zs
	 Ry72/efSd0ylnwQthcbD70GgmxshL7B1s8BM2lUxYk2BerslHfjb4sS238aGfEleLPgeZ
	 N8ktlJ+Ef5fD0HMLgdQ8FYOH67eslDIADy4aPoriXzV/dqy91emHZU+hNbxB/tPboTHBL
	 9sZHjNZOaVnR9qwdGpUKtihjy/VrfCc2bleQrL2SlEhpvMxwXEiV2zDkRqvTeSksDwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mYu6QDao;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="V/sT3GMV";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CA4606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88CA4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mYu6QDao;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V/sT3GMV
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLNKd3684910
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ajrBayh+hf9TzW6sC/OulW/Cwr8R6pJ38qBUt0Xogo4=; b=mYu6QDao5NgEwxmp
	kQ895IHZ4WAirpwoQZRtpAlEV363O3v8ydCIrYrkRvtPejSH85A2wDKYPOE6ulRl
	jYkkrbsddVvpBo2sgKZWD4s6Ppz1tug3BT9GPInX63LcavJI736NmEGw+vDTfTx4
	zbDobSygfNsdcRW5yaYMfugREWxwp0P/GX4HmFqPKHTqljgXn6mNVl1tdtagdCe9
	3OCPikboIAUzdMLio9ZZ7eerFvFNq4P6xJ3aV6LlzSNblvCJabBSFhrBneJz1A5Q
	L/h7B+D9WLSoUMuGHl2O9OK8vnZn7JN2Yk9JOuQB6E4MqxKmX8kVChC0yO7uVlPs
	wTi94g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6ggf5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:39:04 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso3688796a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 03:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794829143; x=1795433943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ajrBayh+hf9TzW6sC/OulW/Cwr8R6pJ38qBUt0Xogo4=;
        b=V/sT3GMVr3QURT3MHZPEeHQHt/LwMDK068LxuSYmDf9+7dzMNtIOdJf+eEZ88U9E9C
         Z8Sgtj28SpTvEtgwXVkhU1WdC75SXfVUlU8ACm0hZSoXB9Tn2D4kg6VgxSwvAJHEovl4
         ESguV6ywuNThGKL++uI6bQo+XfEGMxrt2HChaxANM34/OPXiSqt5VwRIN8AtTOysSFG/
         6F2vVEIsxhh8gpCvsenh5k6uXWq+Rm+cTiiwyoQCP8tcJ2NOFSOHHFAKGL81PCcXuXlw
         74jsdoKyVcs6EolRL4GT0dN6MjGEX9Qd2X4MlkiDZrHqnIUBSskDaQGhCVmGFzXEXJpy
         yoVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829143; x=1795433943;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ajrBayh+hf9TzW6sC/OulW/Cwr8R6pJ38qBUt0Xogo4=;
        b=pVpHb1Af9nTqtPsjFUCYUVz84ZUlg2zXmPnys1BaGC+doMxXNWnGk0yTL9g0asvzU8
         7pL17cH02yhn3m1J5o/WUbUxdYH5VWhqVXItY3/K5PVp96IwbJoSbuBWzfeN9yv6KKtu
         OVmdVqSjhDaJbAMcHvb8KCTVuntqP87q/UHeD4gmyCkiRsj2ig4OJCb0koUnfEMl6FNN
         NXUSa66Gxre+7n+DsG8s/2oUcFQNFB4pgjEZRJclmTCT/g6mXoiP56NK1dY2oPr69mRQ
         1HgxDO+NlhZ5hbxRm5p7vU8gX193Y5bHIO/P5/yPHALmjA7LHnR3qH/XjgekDfhfPECS
         Glyg==
X-Forwarded-Encrypted: i=1; AL+hErHwruXrLWQu9kQxVTYh9KUiGXVErWFhfAm52yOq7R+rB/l5yY+AWZ9vG2u46gfQF9GzblsSUb2+UD527LXG@vger.kernel.org
X-Gm-Message-State: APuU4Z+yD1NyACVwGEqB/67NwIjadfNPWtbbe49GF1U2vrs0NnQRafFk
	DZY300JchQHZvozNjG1MQ0aRFO9cuKNa5GPNFFYUmdyv+ooDiPIZ7b+iE7USzwwRrn10JigvJQe
	RylAiOqR7O97R/fdRyZUcLuqeiWzv3BGgoNAFehhkheSCyCS1Qfb3q9kV9l4MYYcuAjNg
X-Gm-Gg: AZFdTZf6VfvcOVguedwOygM1prxaBWAVRelbY39TsZHLrygPUoVcyUADFwgXwmzK+Xh
	71qMulNwJZE9SKEhz9dli2ci9zYLDXuDYGps5AI6i/qzujiTWKsfKbtmEPQoL1l3hN+1bwTOp0U
	jSVQ9aO5ArXexLHZNsrNSyJkL6oUyd2rUyCRyCQP6DCXQ88SQX/nIrLnA+ZKKLI4N/lY5tpgC14
	ELCh0TyV1hJ0V0owFyr4PPbigVvyBIgKZkTLAV93Kv0bp9GU24RKn3eSStI5i+PUXDBzik07+4L
	d1nm3S5jCLJR1Gd9b7kac4AUIIfhuiINgx0cZk4kfpmlFbL6hi0K1sVGxAj0ABhJyDM74QfjZAZ
	O5ipJ7+TIg6yvWvgosPc3LqKKBzezg4+Parr0lJ0rx0sFhxrIDntk7UD57/5sjkQLi7iSChlb2p
	M=
X-Received: by 2002:a17:90b:3d87:b0:3ab:2737:3395 with SMTP id 98e67ed59e1d1-3b1b0a3a2f9mr9515856a91.42.1794829143175;
        Mon, 16 Nov 2026 03:39:03 -0800 (PST)
X-Received: by 2002:a17:90b:3d87:b0:3ab:2737:3395 with SMTP id 98e67ed59e1d1-3b1b0a3a2f9mr9515833a91.42.1794829142718;
        Mon, 16 Nov 2026 03:39:02 -0800 (PST)
Received: from [10.218.26.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17042sm16407771a91.6.2026.11.16.03.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 03:39:02 -0800 (PST)
Message-ID: <41eb56c7-b1c4-4077-9778-a31a91002511@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 17:08:56 +0530
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
Subject: Re: [PATCH v2 4/6] tee: optee: Register TEE devices on the platform
 bus
To: Eric Biggers <ebiggers@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        op-tee@lists.trustedfirmware.org,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>
References: <20261111-ice-migrate-tee-svc-v2-0-29d19f6c92ab@oss.qualcomm.com>
 <20261111-ice-migrate-tee-svc-v2-4-29d19f6c92ab@oss.qualcomm.com>
 <20261113215646.GB35210@quark>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <20261113215646.GB35210@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX+G0zMvrV+u7K
 nbbTU8gA++3ElrwkdUjb3s8DE/o368zmOFUr4ai4kEZcDBO+3s6oSLX3gzn0EuqzDJ29amSg3Yr
 v0QiCiaNVgApdKDHrQqNvnBtFdXQRW5YH7WYA8uie2NfwvDmzds2DilbKBZtBHkV8C1ghCDDBDn
 4w9PGR9D3AC/APciFm8lHu5I1SbkQh2IFmJ3JjyKR74e81xvlIwrsMTAowlyPyeEZ/Uvfio1Ww+
 e2MBVR9rhsS7WumEhEU6rgUi3tnb/pbexjW4+6FRwxOm3ZDkcoTSYEH+eiC90bElsfU/Yzzzwlg
 wDceKq4OyG44FBUJIcxWyJj1/2CWI34yM1XdOO6RD5IWE9Hg1mFktE9MYyrKtgopepflsfaxAgO
 4ou0oQatwRKKHw/g6JkvfWiCxaPqsMJZAO/wBNfc5n8xygEGb2yJDOxpEXipodXgnPOp3W1mbbF
 PFg5TGaQJELiFD9Gw2g==
X-Proofpoint-GUID: Fq4HZetRWFpEPx0kkTotVujgfIkV8Y5f
X-Proofpoint-ORIG-GUID: Fq4HZetRWFpEPx0kkTotVujgfIkV8Y5f
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afaeb58 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=yq9iaoSgN4BPWgwdfiYA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfX93kG8D/UyCN5
 nJb3/Q9/VhHkxHLtKBpcFr8tOC7VSk8OvJKEavw+DBR0mi4jCP27VAwCg+m8/Quvys5J1LyYg2g
 7g9bCubYp3kWDSgIxPsi2heEISY4Gno=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160046

Hi Eric,

On 14-11-2026 03:26 am, Eric Biggers wrote:
> On Wed, Nov 11, 2026 at 07:47:04PM +0530, Harshal Dev wrote:
>>  module_tee_client_driver(qcom_ice_tee_driver);
> [...]
>> +module_platform_driver(qcom_ice_plat_driver);
> 
> So is this a tee_client_driver or is it a platform_driver?  It can't be
> both.
> 
> This patch feels like a workaround for issues that could be solved by
> folding this driver's functionality into the existing qcom_ice driver.
> Is there any reason why qcom_ice shouldn't just make the OP-TEE calls
> directly?
>

So this is an attempt at solving the problem I described in the commit
message of patch 4/6. Basically, if the ICE driver is built and probed, it
needs to know that:
1. A TZ is available on the Qualcomm platform. (qcom_scm_is_available)
2. Whether the TZ supports an ICE secure service. (qcom_scm_ice_is_available)

With OP-TEE, there is no way actively check via an API for 1 and 2. Instead
the TEE client driver model probes a driver only if the secure service is
supported by OP-TEE. Which means that you only get notified of the presence of
the secure service, not of its absence.

So currently if you boot with OP-TEE and register a back-end ICE TEE client
driver, and the OP-TEE build doesn't support a secure ICE service, the ICE
driver calling a corresponding qcom_tee_is_available() API on the back-end
driver would forever defer probe.

I suggested another approach for this on a reply on commit 4, where we register
the back-end OPTEE device on the TEE bus once it has registered all its secure
services on the TEE bus, and then the ICE TEE client driver can be probed
when that happens, and subsequently attempt a tee_client_open_session() call
to the ICE secure service, failing which it would have concrete knowledge
that the current OP-TEE build doesn't support the ICE service and so we
can continue storage initialization without inline encryption support.

At the core of it, we have two device-tree probed independent drivers, ICE
and OPTEE that need to talk to each other the way ICE and SCM drivers do.
The right approach here needs debate and alignment.

Regards,
Harshal
 
> - Eric

