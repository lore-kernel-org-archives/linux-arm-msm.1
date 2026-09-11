Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D5D432304
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 19:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154387; cv=none; b=rQz3tLiQhBx6GjHtH3nNASpROuu21psOvKanPZNg+DqpeDRqqTG8ClI3OOPODJP3d/I/93XgjUKL1DK/sgYAxNb0mPiJL1wdLJarpmdY22IaNrKyxh7BVfDAqvWCFVedPxB+E1JFNF5sVigc+APtBsp8VtmvfmMRj7V2YZaCBh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154387; c=relaxed/simple;
	bh=82SHgbFXIKNE8cz4W17AtU4jvEU/TKRageBEhE7plQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XgNKdHKutaBwOjdQq5UOOIapGohzoTm7vxYYvoWz8daHUplmCSwMHACkZPnkCXq2D8pDmjxPlFhA+HluT5ASVVKRdgN1ag0uXg9c62O/pHT7FV+LuR3AUu6IYlmINCn5NK95ciKfH9BGfKkqHTyvDG+wEfhb0KrCPiqPuWm4p7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gux0B5Ub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y4trg4ve; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gux0B5Ub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y4trg4ve"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWpov589786
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 19:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+DpU9d9yKH3MESahifjxuxIqp5MAA0YI6mbsse4jUfs=; b=Gux0B5UbIvbrfSbG
	WCX/heFkRvUZQPCsQkJxJs6z9uWTzM8Aej7j1ybGt7NmcHA2OguMmVbD0NgqwuBq
	0N3u0x8yfaqAjas7TWFuxjrA1X0LLYDmzok3TSORTsxkp/dEdOxYWm+9UWyqn13O
	9dZsqi+l6sGyMIZSxbDYUzEOfvi+PyIVR3kpCKDPYBgzaX590uIFSb/7lIqMZDFv
	Uj+/Zx4UcuVYyMESulXadJsHbEq+rIdZN2gdrE/E05MooV35KpIssBgB1vQ5bU7Y
	Hw+iRLcSLrKuLoX+WtvwyZ3rgTu1ukdX2NeAjdLexrMz5/QLQZEsa8i4zur36xHf
	r0sshA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbdrbass-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 19:19:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398d292eac1so2038741a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 12:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789154365; x=1789759165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+DpU9d9yKH3MESahifjxuxIqp5MAA0YI6mbsse4jUfs=;
        b=Y4trg4veBSE7o+VeoiU6gZtZHs75ZUKME+r0q/WXpZCCfstrPIbtpYtoDvtd9/qP/1
         2jrw4lZ2Y3wnfg3tRIniRZwD57fM0IJWIloinnnE5VYntC+4ZI2dKiDi7DHP0wafczle
         Yo/rVCjMtD9EzexodMMuBLT5TaFlze1zSNS90K0blOinU2mLZb5Hi3eWVpVk8GIx9Tn2
         rzr+vWzhdqkDm5S1ZVS9+fUgrKFQkh1zwnicPFgKTbelqYUQNr//eQ71sHp+47cvBDrd
         8oCmnCbrkNK7bJzYMCH4PO/tX4ieuvk+ovb1Hdjnwd+Rh5LH85MX3rQdJvpARBPmi6BV
         R3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154365; x=1789759165;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+DpU9d9yKH3MESahifjxuxIqp5MAA0YI6mbsse4jUfs=;
        b=EBS9gFqNzySCmSYvQjHJc8BnqsZNxCcl+GUR0fmnHbgMn2oedt+4WbL0GDPQt0eSgR
         L/IfleAQyzmqFTSGtz/e9z4V2nTRwGDim9Ybh15pkNXPhnH3364hdUXspz4+U9ONYKI7
         fx+cSOfSfoTn3o+LvE1NFbgMQEi+D1+nQ1C9jAPWMdtFUuugOR8CZmZ45ekcmxokdfqk
         TCMkQOM/7muktlobfH0yfgtxxhoYSNzeidi6WnYz0OVrHSxHxnAM/aVPzr2jNoHUbeun
         Hyt4vE4j4Z07bp96NEqx8e/TCo9HaBwVwXGup+9B3RA+3vNZUvya/1N/+InkEwqU+s7Q
         djkg==
X-Forwarded-Encrypted: i=1; AKwUvBz/m9DwS6QWyyvs4zuav+YEK1WXYE60JaTZRSm4gBs9PtlT7sRCF21sa292s0r6IrhDxLj1enjcZLKcFrtv@vger.kernel.org
X-Gm-Message-State: AFuF++kWBoFdh7FrdiaUpZkYrCeziTn3L0MJpoGrCf8wFgJVm0YA10GP
	flNl7D/4m7/ToDAbpKv2sd9FSTChv4eWLO/sSZho4V/W1F5DirVaotPaFlR+MZrxpUs7iYSo1B1
	wJnrSCg4ppFidkJqUV3ql9HNZlCg1PJF8Ylu3Gw8iaKjZJSAHsV6ykKA4tE51w8PN3z8u
X-Gm-Gg: AYBFou2W10njbKi/lCVB6gq8f9+p7qSbeEeflSEAQ2q5siko3Kfyzfm/tffvku0+NLM
	mk8IiluaQj3KD3xEZBXZ6ycaWn7JRBDPV7PyviNX8GPqL4SpiVLKZYB6cHNOZaKovGMU/jxdjMs
	ylKq3eL0wPHeUXG6IL2rGRJ+g0c9K3YEWZRbAxtXbj5qBq9SJweuY6VinttixBw6IxSBTkaKYX/
	lO6+qvfR9LYlGzGV3Pf7v8fmBJ7G8jGNCmpZnytQvSVfUVU8PSTAman4ySdw0F/qWRIdrMlnV91
	oFIrGqymOZeWhg1Y+jiUwoIeR7HPUQ7YsANO+jgrQucALFGjOZdOc6IRN4S4nPxVqOkPWZ73tD0
	9o0cl3XfxWMLKQsDtagkoIsZ/tjofNjdFgPjTE7IeNspuBIbuU9I6N1J1XljV
X-Received: by 2002:a17:90a:d64e:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39d9c1db130mr11183557a91.13.1789154364736;
        Fri, 11 Sep 2026 12:19:24 -0700 (PDT)
X-Received: by 2002:a17:90a:d64e:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39d9c1db130mr11183505a91.13.1789154364261;
        Fri, 11 Sep 2026 12:19:24 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a59b18sm8253073c88.2.2026.09.11.12.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 12:19:23 -0700 (PDT)
Message-ID: <ee32feeb-e626-43ba-926d-5786aaf1d960@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:22 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] ath1{1,2}k: support multiple PCI devices in one
 system
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Mihai Moldovan <ionic@ionic.de>, linux-wireless@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260908093145.2492666-1-juha-matti.tilli@iki.fi>
 <2cf63e00-95aa-41ba-ae8e-8abbfbc486e7@app.fastmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2cf63e00-95aa-41ba-ae8e-8abbfbc486e7@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: V5-ikHt7TEGsmGL1J8pGFwZzCVafWf6G
X-Authority-Analysis: v=2.4 cv=PLmaavqC c=1 sm=1 tr=0 ts=6aa4543e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=b6wZdvJBkCi_B7orZsMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: V5-ikHt7TEGsmGL1J8pGFwZzCVafWf6G
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI3MSBTYWx0ZWRfX+o2YTWV0j9LM
 F+s27rCCzlmGcfUgNqwH0sWStA5uNjsjeQVdhUzAkxV6vNJg3gxsxwWSEWjEP63rXuA43/eEX86
 3E2baIm/CC4bVDRGEM/g1tsPy9u8s9c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI3MSBTYWx0ZWRfXxaqUf+PbvPRv
 TB5xiKof/aMvTyEYg7APjRHrlk7SDXm3/gIzNiykGV5OFjeYTB+S27d41PZWVCNIGzphN60lHHJ
 GmCmnRMKO5YSiX4am1ZjkfkTdHs43xPzBfNHLrsi7L/ABjB6PRxD8GqM+VCM1XpaaHYMht7WoHh
 +RNHQ8jdjRZNXiiQwEBGppSNOT7rrkKsMfsK7y3qom3J9b6o51KBm9m3KvV3XAMyUItBJ7kmgz8
 uChNvqKyjQzLJRdsbVk0n+rdQ9xqpBre/okWwJyxvTH+m0DXk4+XG5RLfeeW7q9OoFXrpTDa+7e
 l90IgslG9rQOobSZ1YQBIizxKTodfbXT0R5q4vgrhLgmpEOuT6eeifTAC6bpUw8xnJD8246Tq+m
 wSFBwQ3E7L7dqwqSbMG6dROYE4sNQTFfK+pcSz35NQYZmos/HVSfwtRR1bNBP/hwMYps5PD6Klc
 VXiVMpPt1FHsuzC8DxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110271

On 9/8/2026 2:44 AM, Juha-Matti Tilli wrote:
> On Tue, Sep 8, 2026, at 12:31, Juha-Matti Tilli wrote:
>> As you may well know, multiple identical ath11k and ath12k devices are
>> not supported in a single Linux host because they use conflicting QRTR
>> node IDs. Fortunately, Denis Kenzior created a patchset to support
>> multiple QRTR endpoints with identical node IDs, and Mihai Moldovan
>> refined it, after which I took over the patchset and refined it more.
> 
> Hello,
> 
> I am incredibly sorry by messing up the threading. git-send-email said:
> 
> 4.7.1 Error: too many recipients from 83.150.90.33
> 
> ...and failed at the patch id 8/12.
> 
> So I thought retrying from where it failed would be safe. But that
> broke the threading.
> 
> The next time, I'll increase the waiting time between subsequent mails.
> 
> Links to mails missed from the thread:
> 
> https://lore.kernel.org/all/20260908093437.2493698-1-juha-matti.tilli@iki.fi/
> https://lore.kernel.org/all/20260908093437.2493698-2-juha-matti.tilli@iki.fi/
> https://lore.kernel.org/all/20260908093437.2493698-3-juha-matti.tilli@iki.fi/
> https://lore.kernel.org/all/20260908093437.2493698-4-juha-matti.tilli@iki.fi/
> https://lore.kernel.org/all/20260908093437.2493698-5-juha-matti.tilli@iki.fi/
> 
> BR, Juha-Matti

Unfortunately this prevents many automations from processing your series,
including mine which utilizes 'b4'

* b4 am -3 -S 20260908093145.2492666-1-juha-matti.tilli@iki.fi
Grabbing thread from
lore.kernel.org/all/20260908093145.2492666-1-juha-matti.tilli@iki.fi/t.mbox.gz
Analyzing 10 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 44 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH v3 1/12] net: qrtr: support getting new endpoint ids externally
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 2/12] bus: mhi: allow mhi to know about its qrtr endpoint id and
free it
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 3/12] net: qrtr: mhi: register new qrtr endpoint id for mhi
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 4/12] soc: qcom: qmi_helpers: add QRTR endpoint ID to qmi_handle
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 5/12] soc: qcom: qmi_helpers: optionally bind to QRTR endpoint
ID in qmi_sock_create
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 6/12] wifi: ath11k: add QRTR endpoint ID hif feature
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 7/12] wifi: ath11k: stub QRTR endpoint ID fetching
    ✓ Signed: DKIM/iki.fi
  ERROR: missing [8/12]!
  ERROR: missing [9/12]!
  ERROR: missing [10/12]!
  ERROR: missing [11/12]!
  ERROR: missing [12/12]!
---
Total patches: 7
WARNING: cannot prepare 3-way (series incomplete)
---
WARNING: Thread incomplete!

So I cannot evaluate your series.

/jeff

