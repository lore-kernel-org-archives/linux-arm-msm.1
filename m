Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089448;
	b=q5lnJkW7BBux6G756ddW9T8SlURhMeNxpZoqxK04IqzYakCByiCQpFM5hsad7F89prm3
	 60uP2jedm0etpiAaAlMWgMalcsGTuSymWTBoj1gr8uCgT5bVYhCQGGnIOdSfc3jdXa6ye
	 LCKziI3DX9LBwiqecoY+VD54qtXTIzjJeyrnF2wFAScmbyNFP77OsE1th0I2UnhGbjbxX
	 SRd6LU7AQ1u9T0Mr7NmoQvUNtYpWr6VSIQ98FK49/iPrORPPv1sVy6I+LHAzGyV798Idh
	 K/9eSevXVDP/5pRejD1jcb9tY2ofrCY47TqovJykm5odgS91CL4VqoRqCgruxzsyWuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089448;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4lqM52UNtIm/PsesfmEGnfz1xjM4BBYrsaKB+SObPis=;
	b=tJkNgXakUNpVbZg86EC/E1Zro7lzTeakYPFW+Zls7qd/2kCJoN+jDIVoTZDfRQmpOi2Z
	 6hUHiZQPYdL6+3xOucdf7xayzqxgCJQhMDEesFtBbbMAVUQQd5xJYDTR0t/rrb3KVZDk4
	 VvOyZ4zTXVaWC7HD6MqxMpOujjZR2nCZgXHMlEzpltF2+1dQvmSH0at+cnohtokwgpE4E
	 buv4in/WYnowe4UN9FyvmtxGtTxUffFbcE0LTHgi/sPz1Yx13efGV8+tOSA4wehzOa10O
	 MAbi0hNd2UzbVd5MPPExeah6PNLRcUHzJifPD4Idpr1Ps2qti9F92Ejz9cwu7BxDxvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LFvJrAdX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K9LabksJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F859606A323
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F859606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LFvJrAdX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K9LabksJ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5Z8IP1779778
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lqM52UNtIm/PsesfmEGnfz1xjM4BBYrsaKB+SObPis=; b=LFvJrAdXip0Ihrgh
	fPip5hp4MFBszTRstrAe0XcUxB33FbPuJKl830JUr4gYDS3EuCaSGe0EFIIDKy1T
	iAikAphw2+NSaW/ObbSvfb9KWD/bM17oU07HGMht1zmNpq1IKcywC+sXJvPveqqY
	P7sBbWJWSyaxSpu9RfkMSN/UevrlQWraYNpEOk0BeHR27BpgNoqhOOtjeKikeWQs
	So2ihwDj48SGLjIGx/UB5dkuASKgzEH7pZQCYcjQ8llBVI8F9nPIb7k5a26qup/u
	XchTRAp7SQSsbyqUUbZtsAm9vj2JP9P2TcHBUqQuOY/WRGtXDDbK1vv8AhGVD9W8
	rAxcUg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbt9a5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:24:07 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad840053c7so3855330a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793089446; x=1793694246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lqM52UNtIm/PsesfmEGnfz1xjM4BBYrsaKB+SObPis=;
        b=K9LabksJ8UWR5G65BHGxNz42MrvYkB7mZuUINkGxiaNhA8ZIM4RUNS+SH6R2U8fiXS
         trg9cgKiyTSQbFPYzl/Z9JyMGtivq63pAXTDW6SfsNBjYb+15UzW5FknH7P8NEeRulqY
         YNp70IFVLVYD8F0kxUFZJKeRmxpM9Wjalaq/OMm31tqYvskLBz0REi9a97MPc1q1chSt
         8E6gQZ7CBxyPCfJQ9vKA3CBImdU32Rt1nILyLyg3V5OPgwC+rAKJNfwkpRt3kxAQwOT7
         gRjP5xM2myyhKRpo+zs2bTFaGyzeQNxEonJAi0EAFMAJgl6ShJSxnbgl50mGmbXHoho8
         alVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089446; x=1793694246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lqM52UNtIm/PsesfmEGnfz1xjM4BBYrsaKB+SObPis=;
        b=SnNqGSpMqah8UalGiKpnk4S6ePpYOPQzlNjlu8xWYzTGKyZY/GjOyJ9x68m9FQXFlY
         7u6XMbu/TjKFMk3b5Ov6JTw02gg8L31Uz90mGNEdVVAYGvrmGVkZTlXac2hCfbnEtDwY
         p7Uajk1DcIW81dxxGhseWA5Wn7sYYR8GLLpBbwo/QYuvHzqMhoCYMh3fONhxOr0ISczk
         5kdvEG59Hv0kf/Wo9TjYMUgXT5cL0NS46q16Bxl9GbfxxHejWOk0/eXA18hF0BF6Jod2
         JtSGzozn5N+fMypbAsda4AGLUYNNPu/7Y3Yfx3VvRsGDusjER0QaoTHu4kYVo0MllDoA
         ODKw==
X-Gm-Message-State: AFq9FYLPW8q/A5NNLKI/SBu38eNpcp9LfKQPZEbqBMJDoBC1IwVbErFl
	nil6USKOeaapYhRktkFOB7AtNbnOmSXlt4YaG9No4jM/ETrNX3V2+QxeAIcAbqRhVdqbI6iGd7P
	fYQsTWpduSZ33hwP2TrMjLg9CEGaPv/d/EvKLS0XaSPfsyMDpqgZyabQ/9R3wD6SueskjWOWbG7
	Uc
X-Gm-Gg: AYBFou2zRlrBAj47HEVD5F6LV3WYG7Vd77BH41mL9aVK12sj1n0/rb52f/LpvCTm2x/
	e8nzDN2Ztev1xwzTldSQAvyqnAVvlDiIAKWCwRJYR6HbJNaKV/Le+FIjdCKVfm5QbRP4eSgKGcx
	bCQ8YJW+lnyf2CnrBPGCJg2hbi14KnWIOgWXr8Oy/URFkdn8IvCUMpYcoGiwoQyfHQwel6zFYG2
	Pj0LvAfjhADLs0ig14aAQ22U86Cd46avlf3s4Kyt+Q11PNYjJLinXxN2bGqDsRIQLD87+KRQlX+
	9PaChkvIGml89ZAggbmqF2prH+IbyZUqOWGbpnX/IO2aM+imJ+zsB43dIkwVv47Rf7BaTFMNnPc
	zD8BX7jJBEsCenO5UXUVU2PqTLWcHO9uEvRs=
X-Received: by 2002:a17:90b:528a:b0:3ac:a11a:7c79 with SMTP id 98e67ed59e1d1-3adeae6db13mr6803700a91.16.1793089445981;
        Tue, 27 Oct 2026 01:24:05 -0700 (PDT)
X-Received: by 2002:a17:90b:528a:b0:3ac:a11a:7c79 with SMTP id 98e67ed59e1d1-3adeae6db13mr6803684a91.16.1793089445527;
        Tue, 27 Oct 2026 01:24:05 -0700 (PDT)
Received: from [10.217.241.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebae7f3csm8147056a91.3.2026.10.27.01.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:24:05 -0700 (PDT)
Message-ID: <254c26ce-ef3a-4296-9981-34863db9fa73@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:53:59 +0530
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: lemans: Add Draco EVK board
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>
References: <20261019-lemans-draco-final-changes-bringup-v1-0-dcabe94f1074@oss.qualcomm.com>
 <20261019-lemans-draco-final-changes-bringup-v1-3-dcabe94f1074@oss.qualcomm.com>
 <e675b54f-9eae-46f0-a207-02580fd0b974@oss.qualcomm.com>
Content-Language: en-US
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
In-Reply-To: <e675b54f-9eae-46f0-a207-02580fd0b974@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX0ULitpEgry4F
 M3hbhjTsI8kY7YqcDsqv9blLyCG6NJQmlHu2fvQJTQDVvUh6LwCJD8TGGpaFaFHYQRdtinUKkni
 CEYw5AcOFw4qN3RY+Le7RgvtRpYCHVA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfXxsC1t1y3fEG5
 wcHYZ6LMbN2juDH/OBchFf/uzUFIhxXvSl9fjQdHyc93L+odaZx6MfFfYaPpmHwzrCUpt0PVaMs
 H15HlWqBHLPppOeI5yu8aepVGOFk0t4sLzNxAJyX8TIn9mDtFIbcEqe9ivFP81DzHnP0HGFUOOm
 LHluYJTE+DtZOu9x/Sv+RsJmZkoFNYbYB3KEWUDuDt65W5v6ZoVPigY4tfAbg5hywKPjzcntQOr
 xCE/V3NbpXqk8PO+xcg2lO+Di1Cbobw/vYDRxo638mP4C6c8EXc12B73uCw24j/IaRZ7w4UA+mw
 IsW31ZJANLV93vW5Ud2sjYB5fJrQwSWW+AzwOPOqhLVfR8rGvbB+8KX3rb1A0yFAhwFxnPRIF2n
 Yp9yjDJ7d3kAH+jY6l+ZAcp2cwqLi6wVUnYAc1pwBrwVBXdqT5Y8jU4EMWyvnsw4ddVWLagig56
 TUjRwPbazrLy7/P9ATA==
X-Proofpoint-ORIG-GUID: VgLuPN7RqZiOASPtioEa8gjT4JiDdwe3
X-Proofpoint-GUID: VgLuPN7RqZiOASPtioEa8gjT4JiDdwe3
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae05fa7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=3SUrRiYI98BmUlIlBn4A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270033



On 10/19/2026 6:01 PM, Konrad Dybcio wrote:
> On 10/19/26 12:27 PM, Gopikishan Thawre wrote:
>> Add the device tree for the LeMans Draco EVK platform which combines
>> the LeMans Draco EVK SoM and Draco carrier board.
>>
>> This device tree adds board-specific peripheral configuration on top
>> of the SoM, including:
>>
> 
> [...]
> 
>> +	ethernet0_default: ethernet0-default-state {
>> +		ethernet0_mdc: ethernet0-mdc-pins {
> 
> Please drop unused labels
> 

Thanks for the review. The unused labels ethernet0_mdc, ethernet0_mdio, 
ethernet1_mdc and ethernet1_mdio will be dropped in v2.

Best regards,
Gopikishan
