Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795602651;
	b=mkK1FkK72b9bKZ25vrmPHY0mRnKLy8oIYHxyhZ9k3TnFGGBNkrC75sYv1/khkjsg0n3b
	 eBUNy/kwGIF5341k8GpQtDFuZP7LuVw4rezHX/rxi2JHggasoy1II8mTdfJbyBEswXU9G
	 hxxSblGhn3KaPkpZgnII0vyWBERNQLE16ivDploERS0CiO0OKCVpifu8r2/+KmCMx6ZSY
	 H36TDaNlriNFIHwI9l8VAgyLCtcwxAU0ZjGSfeUbVPK3cIZnCimrabd3Rm4W1QSuLDtE6
	 xd0djQrXX2VLQn5OZf2rymk1hx68ZUOWI1AowMUc2G1fExX/zCAo0nQpTVMg70bJ+5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CgwSM/motJLYHm+Hr+NJTgUPn8ykHSFv0PhOGVANaXc=;
	b=ZbIKmQ/l0H9jWgq9O+sEJsaeM1XaVoGxKn0Hzmz83J8yeebMWRWI/M14Iap25QvQXMdS
	 uKGyvMXGlX+Oy035EPE7X9fkQM8VBmv4I//hT68zV4Bov1VVMinAi7YqTHCbGjErlQIr4
	 8NIGZQmGDACG8HIfnzfWuFym42oUZYr7H+C6atEES9H7u2EFuvnnKBkOf656TI3F4AtgF
	 FGDxsFddeJeUlD822822D8lQNXobiLEVIKwz8Gh4FYB7cAjPxzeJRdx4KApj/nVc9uquB
	 2D8rFj/BuhJLNTq5ABUaXV9yC1qS2Y49nZnRk4RHrlu1XhVD3miFkll5HNlXcGTh8Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hfbd/6p+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CH5H8X/4";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7322606A333
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7322606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hfbd/6p+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CH5H8X/4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mNEb555513
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CgwSM/motJLYHm+Hr+NJTgUPn8ykHSFv0PhOGVANaXc=; b=hfbd/6p+NLV5Xds1
	S80CYesJCHgqcIGqbf7yj2y4Ri0FQ+QUOhYlkOC+1NBMvz//PG6BhZfQor+AcE7J
	uRi9VsKRNw+ust46DIQXj3UTlM3oTxKYSwpq+NuaXyI+7HNIbWGE69VO26PPT9y1
	4H+h5diw9LZeeA2aEbFm9aV6gq6e4cWKgI1WDvjAzOEhZbGhpIeEPNjC4Bb0EO6q
	BWZvVLz0gyiiWaslPlCv/xee+MZJtYAUgxi4SfeF2BgYb0GXuFPOkL9YiyNc7DIK
	FzlhYuYTt4VdgR0m3lsthPeIZ2UYB9CPgfGEaghfif58GPRhTfa8B8v/B4bGSvM/
	POAXbw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnrbbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:30:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55d3ad11f50so7531241cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795602649; x=1796207449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgwSM/motJLYHm+Hr+NJTgUPn8ykHSFv0PhOGVANaXc=;
        b=CH5H8X/4SQqqiJOV0b1l0m6sYWtf4rfL6obgL+UmJWECxweOYJgqQERBl/o64qvDqx
         IZa1VbEP7QPyungArPawYkNRr9Z3+CKBrLDP7CCzUhUgXsqZxwmHKWy+NzrjnXdjGfLt
         GSBx+Va3Qd5xXWp2aHr57foMRHJLeKug+GGVQyjBKeH44QexVsQYHcfibYTer8BnRvW6
         MYnKpS2Y094wUKRUfRDcD6Aq1Op81/NJlkSz8ByX0R1O6zHDqWCpIqyjAIhQ2o69aurA
         zwBRNm3mfZm8IRY4bUXcDKhaMvEaQ/xunrjqMeDY26mXz6r73VUOQfzb1/S2ygSXwQAj
         Yuow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795602649; x=1796207449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgwSM/motJLYHm+Hr+NJTgUPn8ykHSFv0PhOGVANaXc=;
        b=JGKEU9u+AfhMbe4Mlxv4zTLcfWcMYC7AVUpia7JUQIYLDs7ErIA0bDpPfyvCrL4PMW
         xAQD5GHWed0sac2S+pjX9cempyqE2RnkbTm2iueGrcPSW3071hznDqe1xvHifuwEQcH1
         3UmMxbyZMotZN6jU3FMgSRKsBvSVy4dNtC8Rw4DyiO/fGnXTvJbFlhQKovhLPrFWtKCt
         Ew8dSyVBaajb4JR/BVdHgAc2ACYo9eemgcHPFccH4XEcFLGJDZun/jKxy28ylbnZP4xF
         wE6DROOakhSUG83ktKVfXEXtpRbNkZ5AA9HJw3z6TAJHO8lEiZr4veef6PXCUwj4iJAz
         EBEw==
X-Gm-Message-State: APuU4Z/YBnagcF0RpVvwHFEytRlxzF3YhImcscsOYRq7ylmtrm2cbTd0
	BhKDCcANh55pxPl59DlBoq8exHqZRKNxHBIciphJNUYb9cphltxdmInzmBPKgm0IhzbC36JjRKp
	XjRHzoVFZaXmD4OXj2iBxe3LRRGmPrrzfq7NUboUvLazjFSBz0nlTOcfFV+KGH8ei0f50
X-Gm-Gg: AZFdTZfKUYlG7QxlOoUhhcj72rAvjmv7Ou2TUsg8Hyczb/j2zmV+OXkj/K5xP+fHNwP
	CQXJXqGvD5jjRpqnBfAdYmXkHb95iyOUDASGIZ562+nM+aNtjpWloUTvSLLdJ5YPiQ141SSiSc7
	Zx5zLOGN0tc89TVSL652nzD4MNWnvcqRhxYE/kxkSKfBXNOuFFprVm25Ezyi243k3hnBuvQT0d9
	hG74Gf4+0Z+GakaxW35x35ir6Gr6klTxMUHASPabVxfuTt8kB9lIGkrROG6bWVCci2uU4Hy+WBt
	AMJmdZLyXtlQLaBA9Xwfi3sXI4VC7LY7gYjC7L+lptTZeYfFhGs/bzC53DeV+0d51KZlniEB/W4
	dbWf8gEyXH4VjrGlMC8nV0xvppkKJ7Ka41vwUftOcnB+IRI/YNDHZxH8p1LJvM6dPT57TFnk=
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr293213891cf.3.1795602648844;
        Wed, 25 Nov 2026 02:30:48 -0800 (PST)
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr293213541cf.3.1795602648401;
        Wed, 25 Nov 2026 02:30:48 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afed607sm611728366b.77.2026.11.25.02.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:30:47 -0800 (PST)
Message-ID: <9ab9503d-1668-401c-8d56-632bac5d82ff@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:30:45 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Mark cti_riscv device as failed
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20261116-disable_riscv_cti_for_shikra-v1-1-d7cc81f901e0@oss.qualcomm.com>
 <30485a94-cc85-4c64-8593-a2218a3aa59d@oss.qualcomm.com>
 <f2cc0d77-3a5d-4d82-a697-456488bee6cf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f2cc0d77-3a5d-4d82-a697-456488bee6cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX5ClsYEbBHR7n
 8UCoAi9FeaDJJ/VaSHOaYPZKUOWueIYRSOuw4p2S432Jenaqi/X2LqQr2ZmBkqLeRejqXUo/MjY
 qCYwKUxjmAZ778MeSAmWfYzZFGFLVKxJW1P0Tz0rCvZwoLhrQ4NNEmuaNHypvg8nbR7V4mlsrC5
 Q/tk+mWCefLnhoVmY+e+LsFJ0U8/IAjA0M5P7kPe9E7pbOO7UzJPkv4MKZE/GYa7RagpgrH4PDu
 idemFWpVwc5I+lilOWdUrOU3zvaRsncctdxwnAL9I10sCmust3QjvASktpW4+m+a09BohqIgbwS
 WT/APdBZqWwF2hhULyLGIRWhZo0l3aerekA5bUdXAqjyAjz4nCI5EnrXRmauWmZHFcEBnCFERFg
 tzQyn8rMfVUsveQIfJdR3Hx7UZpzLzMvgVUqASFJs5bCWmbs91OLbKFtfd8VE+miQZe3BFcDluN
 lZYo/ZA55rgvpFtZI1g==
X-Proofpoint-ORIG-GUID: nYfLMi8421HAkgTvJoVoUfpJmYYj_CU2
X-Proofpoint-GUID: nYfLMi8421HAkgTvJoVoUfpJmYYj_CU2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MSBTYWx0ZWRfX/XHEpybiL1yM
 dMmE+L2OHq3fsaGQw8V9gpfEEEUrynUFOOrNNG8iB1GbYc/JU1CI3AIKduip6L1+0jkNgNhKBey
 hQi9cfnfhgRIvziM39o3TG672931mZM=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06b8d9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=D7e9McI_jBWpmMXics4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250041

On 11/25/26 11:11 AM, Jie Gan wrote:
> 
> 
> On 11/25/2026 5:53 PM, Konrad Dybcio wrote:
>> On 11/16/26 12:03 PM, Jie Gan wrote:
>>> The cti_riscv device is suspected to have a clock vote issue on the
>>> KVM enabled path, which causes the device to crash during bootup. Mark
>>> the node with status = "fail" for now to avoid the crash.
>>>
>>> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>
>> That would mean Gunyah is enabling some clock that the TZ itself isn't,
>> which would be solveable through a clock driver patch. Do we have more
>> details here?
>>
> 
> We are currently debugging this issue. What we have found so far is that the RISC-V core is not powered on when the AMBA bus attempts to read the PID from the device registers, which causes the system to crash.
> 
> Normally, the RISC-V core is powered on by remoteproc much later in the boot sequence. However, we have not observed this issue with either the UEFI or ABL boot stack.
> 
> One possibility is that the RISC-V core is powered on during UEFI or ABL and remains powered on when control is handed over to the kernel.

As a workaround for now:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
