Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DB637105A
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 06:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183469; cv=none; b=hdSQg6QcA14UO30gRT8ga5/FQsVOz1PbXRGjhEClEzLjAtdJp/tt9zoWbRekQsEJANETxcq2QMxFICXVTHWbGp0EhCvTPaQc7sqtZqT1oHCnFNJZ2nxMJ1WaAa4Kf5sz6JSQ90dB3zs04ik7oirJ9dkQ3NS5+zIhAlLeiB/T7OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183469; c=relaxed/simple;
	bh=qbIdZAKoZiKIXm+V7iO8Tpd5L7KU17AoLK6Q9ugcdhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A7hxeFPVwDVSGrLsaxI7cUmXqne/i8tFtGIcPHQt5vQRVTxegwxC9kBNUCjW9Bjkg/kZlO4voAc9rgtaObXvA0fruwrh2wgppnFv3XPUl8K7mcXnJOQQEpzNK9K8EguXo8qrhMe6q25JF/8otEzXtzZ80WPkyabTTJLAbthH1S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xptj5nE1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQfE/Pzu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xptj5nE1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQfE/Pzu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6950xtZC4060133
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 06:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+QESzrKoeisIYlJc8o6G7lAXpcW3BZJjUzWVIuPcsLo=; b=Xptj5nE19lKE7Uao
	lpJEc7rsV6Jk09upWLVCUdx0yv8u4fiGfUlNc1RBT/kux9OLGyOGUgZHbjM6uyPx
	4aOh/z6KTSvtSgAT0i8eIX26vHmz5/LsEtmdBiiW5I66cA6yJ6nFqQzNOxqCSFZT
	u0v8c0kQhaf0dVyPBDbptu9f9yuB/oF+gyx7PZkz0jRUpbh2d6Bj/cO4p0dvC9+P
	62xOIag0K1WKnwvWuZaI4tv3+7Ehj6YijOdFOlwmOokgxXvxwczHEhHv8YFq/p8q
	XYM0UbSfdV03qYyoo/SEPAF/etehdX9z7dUBAi8qpNmfG3QmqSofRsHg2j+p+bpt
	UuQ3VA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h41gn8rj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 06:57:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso1512537a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 23:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791183467; x=1791788267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+QESzrKoeisIYlJc8o6G7lAXpcW3BZJjUzWVIuPcsLo=;
        b=IQfE/PzuyZQoxwEPEGESAUdxsqVB91Jb8Gs+FAPbRw8Lnlzjo/+KC788TEzM18rz31
         bWGAd3iF79S593M0Ep42rZ09XuXU5Xqc97/WYuR6ftIOZO5h+5kVGf9VOyiKlfQ2OTNr
         YPqRfniXrIIkrxN9ct9lLbYf8LJ+ai9I8i+2zSWs5nBkxnEi5eiuYf7JTMrXt8a5CLcK
         UlnQv//+i/laGdMhFjCgQKMDO29VZQ84vuEVWZU/omnVvRW93kIS10K4zJ+1lVHtU+hm
         +bs+OCcwO7bQGaDyvpDsGY5joYBzpcpA2s4ZHzY3hEqum7L4uNq8tt9+R+PBpKUNGAl8
         SGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183467; x=1791788267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QESzrKoeisIYlJc8o6G7lAXpcW3BZJjUzWVIuPcsLo=;
        b=ISIe5Rtzgt0oFhoxV51rXF6H6PF1vhKop0gZ/buUoXqCGvF8krdhu8znQXqNM3FnbO
         a/bJUtljr6CurBE9tWGSJVCm7t6/eCwxaOMGvRpnKdd4JNWBqRmKHid/fcQag7WZXhce
         yNQw5dmF6EGPb1yW7/ZcQHs+BIAPY0tOt63tDvT/9XLoN/Tcre/Zk6JdtVmB6lA9HGHv
         RVmOhO55n+HCDhH8bDcpOj/NBWBxSlQpuK7Kiwy5qH0gk1uelyHayIq6SL9Rncs1qdsT
         gKK216XOV/bbdQUk+VkpHspylfUMhWrSZj4vzFLh4AXBtGU5OU3MB+ExshVnCNyU0z2F
         zBww==
X-Forwarded-Encrypted: i=1; AKwUvBx7jTsVL24pRueA/qyv1Uy+Q4guhRmxvQ8mTf0pPXGt6Akh29HgmnI+BHm5cHuDR9C3KHRJmneb8vSuBTwz@vger.kernel.org
X-Gm-Message-State: AFq9FYIkYtKN32HOiAS9oNjrj4kkK8Ch8nu0s0Ikg2yqk3KWHvZZ6m2l
	XVP5OAEEBWJMT9fmYDbrZHoB7f10jS7aEYxn2eYxXqgtCDvyE38obCyG5IyAKCJHNqeVIaSFeq5
	OPbnHt1zq0SQD/5YTt1bY8zjjW01eSHZQsB62itpE1/w+8AA7T561eh4Bdtlcvww8OJ/u
X-Gm-Gg: AYBFou2Fw9MR6Hlt7+SUuBSq5U1pk/zWGyuVST3hxgnjFD/sF7fu79J942iKvZEzonU
	YaMY8Uwggiamzpw7hDzQdVfwxEVQq91R6tgWjdmyacgjU+Z4r5WO8DH/a4BlI2WXziNYFWTnaOv
	K9J5G1fm4iy3WELxdyLLkwfxCjdKj+Ewas84md0YXClbaX/s396jD207Bpn/wkcCmirMO6adEbN
	7+MZsdP599YTYwLOhxKU1fqwM6Nnl7mUEoFdoB0WeT+xNcGb2JURQ+9vWrNY33sOFBXpv+o2S2l
	zKswwyzjsLvpiIYfi+HI9de4Ppnqk9E0CLVAGyqrosw7+9FmWOvO4SJMprZUdy/P1jvZMzesuHS
	4Qn1tbqmggSnQZl/1NZBLnC5S7XTKNQ==
X-Received: by 2002:a17:90b:3b83:b0:39e:6c69:34d5 with SMTP id 98e67ed59e1d1-3a6ce95dedamr8429188a91.57.1791183466760;
        Sun, 04 Oct 2026 23:57:46 -0700 (PDT)
X-Received: by 2002:a17:90b:3b83:b0:39e:6c69:34d5 with SMTP id 98e67ed59e1d1-3a6ce95dedamr8429177a91.57.1791183466189;
        Sun, 04 Oct 2026 23:57:46 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a5150sm9834853a91.1.2026.10.04.23.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Oct 2026 23:57:45 -0700 (PDT)
Message-ID: <0c6d29ce-920a-4566-9a4f-a0687b0e5ddc@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 12:27:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add TPM support via Qualcomm TEE TPM TA
To: zeroknots <zeroknots@protonmail.com>
Cc: amirreza.zarrabi@oss.qualcomm.com, jarkko@kernel.org, jenswi@kernel.org,
        jgg@ziepe.ca, linux-arm-msm@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, peterhuewe@gmx.de,
        sumit.garg@kernel.org
References: <20261001055029.1960743-1-zeroknots@protonmail.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261001055029.1960743-1-zeroknots@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Hr09BAHxP8bIbCQwGpJxb9ShyPRmxJwu
X-Proofpoint-GUID: Hr09BAHxP8bIbCQwGpJxb9ShyPRmxJwu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX55dWoc+XHVXo
 enaA3slmg1yNF3DvAvOnJaPrdOMkP0S97+rP7EPFT/7rg7+5FDUba/oScI1bjOdapLAOV9AJbe5
 3zOOnMcGQoZKS+y5KKo5F62Np8P5+mSGKbnX9z25ytJhizigSm2mONStS4zYRlbKS0+/Pwt7zSS
 pM9C2KZkwWQYrO9hgPYn/tkesKmDl0Do088K2foOdmsREpQPELZPkEb83aRfMtkZq/nDREG3SZ7
 l2jSgcLQw16Tot0MHBVs/pzovbzcq/pTcAS5Suj2Vnp06hwkbqPeAqhurSm7Fu/6pvqtHMJ5lq2
 Q5qUTk1nQVdiOAFW442ULu7+wdrIN5P6AxT1pFwUhneqHPgCRAED+SlU5Rb/Ue33KU2zdbIv/yX
 j3c3D9zIeaRo4s4QXF9RwgQJqX3fUo1zgGRcOuoxKmrp3KzmDN+yYQ+pZ0X9N3W+nRj12fBnssV
 RPmprjuGrVzl1BaNVOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX1LjnkbL1nw9g
 A8ySvxRTwQrk72xY5fNGAeoy+pnJbAhAkYfVR8ndGI2nYqq5awTn6j3irTo9/ULJGf9UB0NUTRi
 GP5kUyKanV/QVZiD/myTyEHUV1vYwHc=
X-Authority-Analysis: v=2.4 cv=P9WvFSAu c=1 sm=1 tr=0 ts=6ac34a6b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=MGVvYQGpb7276ASQA-MA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050027

On 01-10-2026 11:20, zeroknots wrote:
> Hi Kuldeep,
> 
> A data point from retail hardware, in case it is useful for this
> series: on an ASUS Zenbook A14 UX3407NA (Glymur, X2E-88-100, BIOS
> UX3407NA.315) the TPM TA is not reachable as QTEE service 81, but it
> is present as the QSEECOM application "qcom.tz.tpm".

Thanks for reaching out, Kindly check below.

> With the qcomtee driver on a 7.3-rc3 based kernel, QTEE reports
> version 5.2.0, and service discovery finds neither 81 (TPM) nor 413
> (UEFI secure app). On the same boot, qseecom (version 0x1402000) works
> and backs efivars through "qcom.tz.uefisecapp" (app id 7). An app-id
> lookup for "qcom.tz.tpm" returns app id 1; a made-up name returns
> -ENOENT.
> 
> The Windows driver for this machine agrees: QcTrEE8480.inf configures
> the TPM service with AppName="qcom.tz.tpm", SecureApp=1, LoadApp=0
> (preloaded by firmware). The EFI configuration table carries the
> TPMEventLog and TPMFinalLog entries, so the firmware TPM is active.
> 
> Through that app, using a QSEECOM transport (based on Xilin Wu's
> out-of-tree SC8280XP driver: QUERY_INFO_2 / SEND_COMMAND with a
> CRB-style control area, here at 0x81d10000), /dev/tpm0 works: TPM 2.0,
> manufacturer QCOM, vendor string "xCG fTPM", firmware 0x40000, real
> PCR 0-7 values, GetRandom, ECC and RSA-2048 primaries, sign and
> verify, and a sealed object that persists across reboots.
> 
> So, as far as I can tell, retail Glymur laptops may ship firmware on
> which this driver finds no TPM, while the same TA is available over
> QSEECOM.
> 
> The same applies to the prerequisite series that moves uefisecapp to
> QCOMTEE [1]: on this firmware service 413 is absent and EFI variables
> work only through the QSEECOM uefisecapp. If the QSEECOM path were
> dropped for Glymur, efivars would stop working on this machine, so it
> would be good to keep it as a fallback when the QTEE service is not
> found.
> 
> Two questions:
> 
>  - Is service 81 expected to appear on retail firmware through an
>    update, or is it specific to the CRD firmware?

Yes, there's spinor update(bootfw2.mbn) needed which is in progress to
publish as QTEE side changes were already merged long back.
Roughly it takes ~1month(ideal scenario) to get firmware changes
available but somehow it's taking more this time.

I think i should have captured this dependency info in my series cover
letter to avoid any confusion.

With the changes, service uid 81 will be available and won't see qcomtee
driver issue log there.

>  - Would you consider a QSEECOM-based path for such firmware? I am
>    happy to test this series, or any other service UID you would like
>    checked, on this machine, and to share the transport code.
> 

Qseecom-based firmware path is not recommend approach as it's not
generic and less scalable leaving less room for expanding featuresets.
qcomtee uses mink-ipc based model which does all interaction with TA
with just 2 scm calls and is very much scalable compared to qseecom.

So, we are planning to use mink-ipc based qcomtee path only and I'll
drop an update once QTEE firmware changes are available in meta builds.
I'd be happy you to try it out and give any suggestions!

-- 
Regards
Kuldeep

