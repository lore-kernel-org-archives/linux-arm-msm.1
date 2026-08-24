Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337EF2DA759
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787555834; cv=none; b=eDs6wjbAgZSyhddu7hdQ4mwF6StiAHzAms9QQtLlYLkgWZ4gXGeG2P3InDtoJmVesbzW7JjTN7mPfet4N32by+RqA04l9DQDEpzb8thwQuEOd57N4v7MaLY4iN1bxHzdWfN6hZQH3ZkjGqkLIYARag0OSQHZUNWf/5zjVVB1Nu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787555834; c=relaxed/simple;
	bh=lRsbKtQy4OaooWbFzjXKy6qpYMCGnDZWG/AtEq8DrGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XY/6HQ/tDuRXMIT9L2MtOH+vr9M2PbuMYaS7404sLBC1VkryAAFkOL922731njH2VuI5QLE6uxYfUKtSyOTJHtkLbQNDXHLaytJFbjMImWGEtse+MAHa2z9+Ik2YCq3hJbD1OIfr2VN+KmG5sANQ87VR8zkRszLo/HthfHFZ7fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kxnvz9KM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDvDPK1X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kxnvz9KM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDvDPK1X"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RP2V866958
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lRsbKtQy4OaooWbFzjXKy6qpYMCGnDZWG/AtEq8DrGc=; b=Kxnvz9KMgW103gdI
	1W0RNdhH91IXiL+xWmkKkoxkhZ60rVO+qCFBfPTpY0y49g9Dewoht6nrVP2OOukj
	9EZd8mnbQGyjAsbS6cNPN+tIz23DFWX6Wnr7Z7g4syXsnU8kIqwPfD9c0IFGw/zQ
	etBNGhPt9JDg/5T0yAViLYoZTtaggmeWkS0VYudLZBUtS1o/Cktj1bAVHCezZ0gw
	FL9Jago/eEj3meYEt6VLl/yhfSWCnVlCCe80CWhoGZuoIsKeChH9DiLcj9OYFDv8
	mCik36J3fuMZOMzPeC4AD2/7ux5MWKKPTgrI9AnYz3Kl7yELcD4mYuIX1YjsYLhl
	L1zdKg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qwv83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:17:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484b9fb055so2312383b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 00:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787555831; x=1788160631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRsbKtQy4OaooWbFzjXKy6qpYMCGnDZWG/AtEq8DrGc=;
        b=BDvDPK1XKL7CQnbYFa+IQOJ2iRVIDSP3glZa0UqcSHA8qFbzekt9rNmHIy+hpTJp/s
         yfHhyDlrbzgn2I+9LSGiUHanFj/XQVPsVZVftMFZJtpgTcmXcTZ6CCrhmmrVAly1Xn36
         TxpFyAOBwWFy8oLPjrl+t4vLlj11JUYyzF1en22gqtG76Wmg8eJVlJxH+JRZ7+rD/deF
         qvzFlzx6hj0yASOZIe6GccJoFf3nqpIy/D83cNoF5m8tP6P/4em85kT1R9iCd0FHcQM+
         En4TLyD2HyNZcRCZsbr9HPcTYwpEuHMuW7dDYVyTDFcjA6VA/kEjbnDfh8lHEH2ycc6E
         nnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787555831; x=1788160631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRsbKtQy4OaooWbFzjXKy6qpYMCGnDZWG/AtEq8DrGc=;
        b=H6mMN9EOgJf/JAV/gAoq1zkw6qLkjnB2IIzCsQmyBoGTnw3IF4KJ0q78V1p+aaZTWt
         UvXq9IyNimv0sq7VpWUap7m+W+y2KFZXM6mGk5cagWUwygbm1bgSkzegcusxfD2OFeEk
         LgBuGD6osB5ElmHPBa7iU9nLXXRdEz7b/LMaudGymxrgmdxshcWvetYVK8STv50cZngt
         mf2son4QFuNYknAOGMPiQ5bAeH/1sjVQPYbZfRQ4SUj9VxcaLFsx5WCOITJ5vKtrwLvv
         76/SEeU9cADmkMgmtCdHu7OEb7xA2cvT6GcmuYuiucDfpzx09bCR81QCR1TQXDHngieg
         j/1Q==
X-Forwarded-Encrypted: i=1; AHgh+RrL4crncLCF68UItuLdSesoyJhdAFwhUImAjYqf/Hb4PAcm/YIj0lx2ZrRnYSKRYFO68tplV/DrOBOs9yrW@vger.kernel.org
X-Gm-Message-State: AFuF++n3BKjnxO2Gv9sJmUqSOGbP3FsA1jmqC9EqGd27q3RTQq1EDist
	1NUaOcexSs0j8tUEZvJCIs9RXjCifUJYoiGMNHtuQ0aKOUcucONsBHVsoT7soMNbXoezTG8WT+5
	59sJ0KiiPlpfntT7QwiB02biXHPZTF1jQkKCkro+gqPwoedkm77NgUtsedHc5r0yOiOyc
X-Gm-Gg: AR+sD13vqu1EKA2dtlA8q8PACNUtNYZwoBwhJTp/msauED4Wq/y5bCOvho4VDl78Iax
	cTbcPfCK3IxPbJIb2W5cBGJcNej6iuWqdKBNULKWLD0BYMEuDsNciH6T5IlUVSbKSr3AqQFus9s
	Xr5IQgJ4HX+FfcGcXGLKla5XeXRmSgsxE1GbABUp92RynfGw2r77RAy//zhUyvPmJS34tsU9cP+
	KK1bB0RRMjXLdTVGg+6K/RsPFp48/OAylfmvWJ593UvFX01UCcXVJrqLqo4V7u2vSGb/z6Q32at
	nHU44ER55zs+PJ05MobFdP4x8kGKpM9xy1IZSWQwyUITdE258TWyUAzqeON54EgkBZTXEL/Xepo
	cINRBrpW70USqWjgHJJlgosh+cK8S+kNU
X-Received: by 2002:a05:6a00:a225:b0:847:8b11:5966 with SMTP id d2e1a72fcca58-851f9a8e890mr31621461b3a.1.1787555831043;
        Mon, 24 Aug 2026 00:17:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:a225:b0:847:8b11:5966 with SMTP id d2e1a72fcca58-851f9a8e890mr31621407b3a.1.1787555830650;
        Mon, 24 Aug 2026 00:17:10 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e4b1e1sm719767a12.21.2026.08.24.00.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:17:10 -0700 (PDT)
Message-ID: <f6d14be8-3463-41ed-92f3-f8ea51e798be@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 12:47:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Add register dump support for PCIe Link Down
 events
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260811-regdump-v1-1-f22db3fb37c2@oss.qualcomm.com>
 <f4f25633-668f-4217-8e64-d77a38e4770d@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <f4f25633-668f-4217-8e64-d77a38e4770d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HKYsKhViductV2HzuIrAOgz-48QAUTEp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2MyBTYWx0ZWRfX98LYKjxApnmM
 g6AaZmoQDleh5tjhPEJd0do3k4jjJgjbEizF/1XO793h62fW278X615uuHOrKDTgzjnmmr2zBJA
 aihcNbX+tSXLYIcERiksKSCM6T4Tn1gbyvo2ZZ2JQC1kge0/KFWFPAnCtAGFFJ3Cm+e5dwlWexA
 7fcn85mSQ1KYGiUb1h2Ku/s9GWrOPr1f5m2J2f8zxLzrR9QS7eKLRE1djZBNLjYTWdAeFZ4yRKC
 irpDidJEet/ftGXuam0PWg3P3UB/CopvfHfV1gQfW3XhC8FnLc/r5bC/Jnjv8Aw4kdMLBW3Vvps
 x1Slg6fI/Z2uN2ZeSGTpEWtAuRjrh71z0/KEIt9ngvhXZHMzwBRmyY1fjFMCWttvxcbyCy14GYG
 UdMYm2HpaGPa21F4Rll9AzU5wo5Q8oPw1SfmzZLPFLM/ag8ynQaXmwiqxzZtzfbDQ5vk1sFkBs8
 mkha4WztbfV+7+gTzhQ==
X-Proofpoint-GUID: HKYsKhViductV2HzuIrAOgz-48QAUTEp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2MyBTYWx0ZWRfX3PBhSPPFDQr7
 ZrQEV4DXHhdEgFk0cans/KiZqgCZhRHWE1ZvzZ9qx3PeVGduTfBAzPZJ0mkpVPNkixogUybP3h8
 hOhb4pUvQ7ozAh9L3L/k7nXGirFAApU=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a8beff8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=vLIU9tNIHzR1clMQrv8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240063



On 8/19/2026 4:15 PM, Konrad Dybcio wrote:
> On 8/11/26 6:12 PM, Krishna Chaitanya Chundru wrote:
>> When the PCIe link goes down unexpectedly, being able to inspect the
>> state of key controller registers at the time of failure is valuable
>> for root-causing the issue.
> In this current form, does this patch not cause the splats to appear
> for non-fatal linkdowns (e.g. hot-unplug)?
I agree, but there is no way to differentiate, like link down is from the hot
unplug
or actual link down. For actual link down we can use it for debugging.
>> If a storage endpoint is present downstream, the dump is printed
>> directly via dev_err() so it is visible in dmesg immediately, since a
>> devcoredump read from userspace could otherwise race with a storage
>> failure. Otherwise, the buffer is handed to the devcoredump framework
>> so it can be collected from /sys/class/devcoredump/ for offline
>> analysis.
> I think this is a bit too much, a single implementation is enough.
we had a discussion with mani, mani doesn't want to dump these registers
in dmesg, that is why we are using devcoredump. And in case of NVMe or
storage devices and if the rootfs is in that storage, devcoredump may not
work,  that is why we are dumping the regs in dmesg in case of storage
devices.

- Krishna Chaitanya.
>
> Konrad

