Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483066;
	b=Ol6Uv10er3Kr7SOdcqOMNY2JE0ZYthrJYMGrljV3w7Vuyz9RzOFQo9P8e6/AbjG1Hg/Y
	 kyKw9du7JqnH1ahwg1Rlg3I5LJXi4ykw2Dz/yDTZ+A9Xof1xaf42lIJFgaZytpXjPFuwa
	 Nnw5cSipnFa6/55TxZd+WE/ierQlIyA6pQ4tyBaru1kkOuwaCAYbhzt3yANNjERC/Ow8O
	 ndqm80tLnLqVHdfr62Oj2SFroxsR2/LiEOJ29iLRvxBqB1s6l+4ukWAzAuP0iqrz4MUVr
	 1jxgBgoPJ1GmnTOy4m24yDyZh9InXfAEU3ld/DYcLQdsS+g7G+cbUmetpCOmjIfjJbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483066;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QtaI6ngPGNeT1DD/YyV2Ag57CpUXifqmSKUI2JI3pK4=;
	b=GbhiHbk8sJagKPbU+np1p/zISCez/nKhmvQeLwVRv83EVPZrn32iMTcT+YvNrv/eSUhu
	 HkWIHBXeeLjWwctqnC4AuzPBLdQj4+vtMx6V5IrSXGa98ugIM8TTh1ZoMwCmVuI3W2OBI
	 Vasq2gda1FthlHqA5KO8YcR+a+ujlCxJa1qKXe+ZvV18ugqHzJJK7cqWZSNw+NNBcbNF1
	 5tEONaiurrofCx7dvhg3MvCII4unw6cW3iLAM1Uy4alNclCp0h9BaRdy4hTagj1SYmrFy
	 gxNVXOuNeExEcI1n3D1Wqq4Ztyu3mmpXtgED+/N88E/QeKxOZqJASXCG8sqBrVL3OXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=noy8g8YV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IHaDqmdR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED5A606A8A8
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED5A606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=noy8g8YV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IHaDqmdR
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAmoIw2555635
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QtaI6ngPGNeT1DD/YyV2Ag57CpUXifqmSKUI2JI3pK4=; b=noy8g8YVf9J5rPmJ
	UwPBDCfjMPKR0RmF3O1R4xqqK4215RtxouUI53FnNoC9ggbOyZ5yfKNhSw5DT2vj
	pJ93GKcm5Y9lx/YDIYENjiInMGcgL3vT42v2b06iyMnGxn7bJMzvHKpfRCXCmAZG
	vCvwppkw666OrlXoRusHBZhvx5z6UP9TxyMed4h1lO5cPZWrwWQ4D0iJfhYo9d1x
	Mr9Apx1eNK2WCkcr0PwgIcd9V2J57kweSJIiPXIyezzIyYW6tnFvB0rSgp1PBssm
	xD2VZGHTH/CIpA2JeqyCllSSay5jVvY8YyxeUoEpX5C2CgGb74roTmgdwvZJ8CtA
	+nBKxA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwc1j04cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:31:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a073778890so3526790b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794483064; x=1795087864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QtaI6ngPGNeT1DD/YyV2Ag57CpUXifqmSKUI2JI3pK4=;
        b=IHaDqmdRB6t49l+r1ABPC0H/gRzWI0foqbJXdf3Oi3OOXaWCt2T/zlXktJC4NgHzpB
         WZH9o36gAAP67sG4sjCZKN5Iw9eaEgNuFocH6wKP0uEM3RCyM8W6j4bOhCjIu5kqQla8
         aPMMBnsP1KanCG2p8st8tYxnynQWmMu5vrUTmXf1rUBcHUqQk/dv1jLUB0WyC5Vu0cxq
         +6AycmpDTvbctcQNlp8nc4uYKSzOQuSBtjyiSdEXkm+NF5SkOFwGWbOUtdaLj37Bm1sR
         owPaLn/N8ZTBBLgFJeLPXPd7rY7tDvv8EleuhMyI0l8wqkO9GMg879ope2z8Y3IBg8yE
         nxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483064; x=1795087864;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtaI6ngPGNeT1DD/YyV2Ag57CpUXifqmSKUI2JI3pK4=;
        b=ZZ7zsMXcT6o3s/8bRrWmZ5behoU85YAamaESpkvI+xX/Pt6KxybDZHMjBOR3RKHz5e
         6Kc14ePiPUqv6Ran4bzsZnUbsNFNoy5ODyfRMbLaKzaLnxECvH3A75lw06rmdamHnY0L
         EvMgGiG+dGBS/4AafdwUlil2ZU7Dnz29cvgnlyZuOp1cZXhioOPCPxShpa3jI8fzcl8C
         8vCMdov86rtK41dpppy/ZHDylfuI8rs+RKVEKUKEKHGio9nfqDnmiajvsVvU0FeV/Wnh
         t+r1aOMAg+wwb4sLvLdWGm+HIz7/oP1GnYrHsyGECJfeAddlJgpwEE4b3JOddxHdvhj9
         F9Pw==
X-Forwarded-Encrypted: i=1; AL+hErGKYg3Wepl+e6bQJabv4eHTzcAzfaPYbQzCT2SDpE9wgIQ4FDjHgelg/aodLExiePRAeNpuMZwdEZekjO3P@vger.kernel.org
X-Gm-Message-State: APuU4Z+oW09xrgw91pap3i6ugKtyj0oHiGE/0gUuY6DsKLKWO1NGxSkP
	JXUec/j5CEqky5RRWTBeVr9LEMREM1oos6JvS50JAaVDg50uI9SYkoclx11XVyWEEtDSzkdraOo
	XckVvvjoUyIZ9rqIPVzZwFWbbs+FtSo7DBN0z6xlU/bubmJEwIuG5qWoCNe+YzpTR7WfE
X-Gm-Gg: AYBFou1+WCxZekjBU6gyqLWWw8x9VZKRkeNTciKY98DR71CawZ9p9n2TfszWjnpNJf9
	TF3g5i327f8Uk3aPSrFnZMu6wvOQ3E3eT/NKFrb9A9dB9fBwbf5Wlhd8s+4HATRWddCsGJ9tbPq
	KotbpGibQDtHnmNAxD8d6p/4vUJwyO/ThMSD4MmVsLIDdsKhbuIsDMmLs+WUhwjoLQ2dbPkE2SP
	BJgSxe7QBj87Lt6UhJpYePLK3F671qOawju8DwXtu1yFkPRS+Z+G65n0IevxBL/nhDehoPsV5Lg
	unpz5Aum1qUuv/rGxM9eeg12KP+X6+PqeiD5rhJomFJwR1CzVdNekJ6DiCX50jleQrUPzx6xY09
	sJ2MglVediFAKPQL5EapvCVzyypvVmxKoOc9Ftw5phkv6EZQUy2mMNX4V6bFlsE0DOurBoEZlWA
	BT/y8=
X-Received: by 2002:aa7:930c:0:b0:88d:4b30:1c11 with SMTP id d2e1a72fcca58-8bc19dcf4eamr4997933b3a.6.1794483063961;
        Thu, 12 Nov 2026 03:31:03 -0800 (PST)
X-Received: by 2002:aa7:930c:0:b0:88d:4b30:1c11 with SMTP id d2e1a72fcca58-8bc19dcf4eamr4997900b3a.6.1794483063458;
        Thu, 12 Nov 2026 03:31:03 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaae3e110sm3264720b3a.36.2026.11.12.03.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:31:02 -0800 (PST)
Message-ID: <172229a8-a4c5-4103-a38b-e4cce3f18718@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:00:56 +0530
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
Subject: Re: [PATCH 1/3] mmc: sdhci-msm: Enable ICE before enabling crypto
 support
To: Eric Biggers <ebiggers@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
 <20261022-qcom_ice_pm_enable-v1-1-f7a84086c651@oss.qualcomm.com>
 <20261024182904.GD2553@quark>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261024182904.GD2553@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX/AF2CzXaf6NA
 6ooEOaIMissEYwo7HFB71G4s1JQJYpdGdsCl6Fckk/R505JNz6utjIS3eK6w2Wh6fH4kR2aN354
 ZkrvJqxleiBSwqtljO6anKpK2pqtE5o=
X-Proofpoint-ORIG-GUID: BWOR-04LUM1nsCTKOXf0w76nado9UDLq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXxxsBT6U8ss6U
 j1N89ebbV2r+sFCR3axoww5PBhWUy1FljiU0En1M6IPPe/AE1znZ59hJTksQhueN71a+rewjnxv
 Kp8Ypm0Ln/JhSvzh/mIHztFk8hMEwy4XSuEgJkX35EBTDvSBVjh7pioz4iW7Eg7HVvis8zLftmk
 BFfyrsI92MPiyxdtWAzesDJNr5AohvYY9eXuDzEcHTPSA8dMIuk5cA3CAV6/8eondqkuIUrdT59
 N+b7PjsHG0hW4U7jW19AIvHNZtaz6pQd9EqGbo6a/gmHusPUMUP95nKxhINZ7PJuIJAWbJeh/2o
 ggWg2I01OCMhK9800aksRtmZeIhR2Gr4zRuYdmKcU6X+WCdap19cFPHvfG6XRaJ4iAFiczmutWj
 knnsU4ivdG5Z4qg2bG0WH4n35VUy2oTRwfuwJfdUjf4ZMFibeJrwtopX4p5HVppVDrqwV6/UaNN
 c7A+IePGVrpnqYXewww==
X-Proofpoint-GUID: BWOR-04LUM1nsCTKOXf0w76nado9UDLq
X-Authority-Analysis: v=2.4 cv=Vqe2kO2n c=1 sm=1 tr=0 ts=6af5a378 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=fvpZdPw5ZEdYVRYleWAA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045

On 24-10-2026 23:59, Eric Biggers wrote:
> On Thu, Oct 22, 2026 at 03:21:50PM +0530, Kuldeep Singh wrote:
>> Remove ICE enable call from CQE path, since ICE is now enabled
>> during SDHCI crypto initialization only.

Sorry for delayed response as I was away on vacation for more than
2weeks and hence couldn't catchup on the thread!!

> 
> This change makes the low-power and "optimization" settings in
> QCOM_ICE_REG_ADVANCED_CONTROL be set only once, during probe.  Is that
> correct?  Those settings never get lost at runtime?

Yes, the low-power and optimization settings are set once and are
retained over suspend/resume cycle.

-- 
Regards
Kuldeep

