Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462699;
	b=11GzxhNpPXmQ6rIXmKqcfhOT7BILMiXyN9B5E6NXT1qy0H9UHrMzzhMcX5juFEetwb9Q
	 1FdOZzH1ij8e1lFt1DUCzGgniyC10JQ3Eb8fiBJ+VxFt07D/pNR6bgB3Cdmw2cKNo25f/
	 ybHqbotyTzaWSvPn55IuIDwxk9Af47mXUf2+Z39A73BlP7tGsnbttNr4q10i+Vw6ZaUe9
	 IhefBdl6AQIXxoriBgobSqOZcW12Ot+RdcR9gd1PG1c/LVk15teqTOaDuIW8CmLwDXGX5
	 MrNQMh6lAqPLKFz/oKO9KXLfZuwW7LA8/YzjEmD8S6LylEe7OUFhyO4XJhQ59cEuu9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462699;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mMQUGbXJMaa86ZgCyPHuQDcNhrKapcPCs2WtP/7YI/A=;
	b=yaTSPqEdD5+Iusgw52MAhmK/ZrtPt1yAwskz84juLeHweCsRfIetd3DACam5LF0vco/k
	 xmvgPO4q9IX9zgbuTfFphTMnrqcQe1C66z7tnpfzx7/OtD4acQPzv4ukoDrmnbGQN4mWE
	 7Et0ILZVoBIvf1MGcSfzmbIK9gpyzEHdJfMqhAwSrlAq8NdS09uNXVx7iTbGuamaQZD7s
	 iov3JgDhc9okc9hkI9rj/UxEyfkdNOn/rOiwNsJzRef936aKeY/aHeaOGlQlfX5xYH4rt
	 TXECl0vHmE1PWQmpyic/ZYB2dvtdul+1T3EXv8N59UDGtLJi+rHWPP+lijI6MtrmAbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZaT6D2F6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SRHHFNwe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F105A606A690
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F105A606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZaT6D2F6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SRHHFNwe
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxuB2340306
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mMQUGbXJMaa86ZgCyPHuQDcN
	hrKapcPCs2WtP/7YI/A=; b=ZaT6D2F61c3tpeFzP1M0/Q0nDKwT+BVfrEyV3B5F
	1j0oxcpR889WG9WT0HCSPPyS2ur7dkrCRaVUW69pD9HmcMBGD7N6dJ6zErYcnVUJ
	t6RI/rXE0bJ9XX3fzGxAUypVTVjnVNVWHtlubj2KpWWdKC0EOGjvKEJtFvQ9YM8s
	6kLRQInrOO+of9zzfr6tsdJktDrmAQ+mAP8JhWPC/gsi/fAegyZ9degluqiU/J5m
	raupWZP6uPhkciD/8WF27njC4+VUfc81VImaGvkLi3ohj3tbVCk/lkne8AH1FQaB
	b0x2P/XA3VHj8hR/wyauyTPno4FwQLlg8XpPo1OFxImB5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3asg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:38:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso670062985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462697; x=1796067497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mMQUGbXJMaa86ZgCyPHuQDcNhrKapcPCs2WtP/7YI/A=;
        b=SRHHFNweXCLyF8TQh2fUKuCQCNArrakg1mSt4XM60F6ZLtAEk9Ci7v1o8QBmP+emuz
         I0QzjM0QezEB+7ytuVEir52u/YI54dBfNWzB595CNliWHJiWXw26/jdkRgz3TODrWXLJ
         uvT46HaFDzToOvqROVtzQiJ5MNbK7euDm2WXSzludoStRsVqyrnjrkpcx9LKbh0qVIyj
         9M4w1bbC9FYLiq2e3wh0GCuXh8NeWplsKBUTHfdnbScKNzykw/N1+TYUmswl6SZ5YW9M
         7taVHHD/lxrjffeirbqK3wK45A2OqlfoQ98BUZezO85i0RVh35Wrnvq6LBGAg/QxqzV5
         H0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462697; x=1796067497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mMQUGbXJMaa86ZgCyPHuQDcNhrKapcPCs2WtP/7YI/A=;
        b=fshfNS2AR8uQ5m81vAKnVt0HV/Z4+2COas5U47JDtJzqBFPu0pSVqE8daVBAaGv+w5
         mW0hUyWGlOXHPNfzM+XIgJXfOFrU+phMpsfRPijl0Hg7U9Vg4U46+859P+mD/X1EhuO5
         2lmR4uQOf89Xrl7muUYt2ezcFlP5Q8oaIbixrfxA2w6j1HabG9dV3POuWtTgZIVldbFG
         Cpe2gHj2E3VVMpQAAWMVSxm9zK+rfTxDeOUZiAmAJ0i2Oayhz0//j8ImBsfxbAc+MkR6
         soP5pmTrqX97AcAt2kYP+XHx5pkPq+KhT4SxGzV4DMDK3NgWew3jps08S1m1jkahH0H/
         pE+g==
X-Forwarded-Encrypted: i=1; AL+hErF6MMENtl1Lps+cD7rTYe10gRfdfB8+/Dr+ThHyS+5WwZJFA27AFR7DQuYYD9xmWj1qVXu1L+5MRwZJed/I@vger.kernel.org
X-Gm-Message-State: APuU4Z8Bd4JvWobLgA3BLQzmiwrCyIPjuOau7WAZ+qEGU+0lPXOMDGD7
	XPj+MqGsV+LKH+FgXzdJUfXWvy9BDROEm4SE9Ll8im3cj12UMaSIHmvI4x2aHtFSKGp17upuh9K
	9N7tTbvtnaBHTBI/HmMfA+dJ+9ttBnY1YSESElkUR3yDXNd+OAGDag9GfswVnb+nvVRjf8zK07F
	fw
X-Gm-Gg: AZFdTZemlwQvO2c7zS16XbrJR9bJixiF2dxLTPUX0qcLR0J84K8KGO+NtrdKMEsbeCk
	nkz80Xnyzjz9mBc4IFLVfa42hyNpEu8RnP3FwVOvXk/DCkaQhNXoKECZoJdYKRH3gTowSXxxBq6
	qTVxXvuT6mdPwJGItO84UGHwbC2YxLBHWdgegJeCwe2cfhUyytVvsh8TzG68OEYAGscMvNpqsru
	moBmQw6YKqiNInZtrlbNNaMtBX5Ck22EEUDuOu/w/yrDO8ko5XaYIkYQLy4IwsOWX1/kLMXMzGU
	fMpmvY/QRHn5N7pS3FnT4zell6yHTgE1C2FM4waGgisz1R8D9TW0A9xGwRIym2hpwQT2kvH4PS5
	znRRtTZA+axVEOddBbNeLj7F98L8vDMZlw/b0j4ryzD5869HVheFowa3nTaJjLLsG
X-Received: by 2002:a05:620a:700e:b0:949:b8b0:1b11 with SMTP id af79cd13be357-949bab1df30mr2390114885a.44.1795462696984;
        Mon, 23 Nov 2026 11:38:16 -0800 (PST)
X-Received: by 2002:a05:620a:700e:b0:949:b8b0:1b11 with SMTP id af79cd13be357-949bab1df30mr2390107885a.44.1795462696430;
        Mon, 23 Nov 2026 11:38:16 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm27067764f8f.24.2026.11.23.11.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:38:15 -0800 (PST)
Date: Mon, 23 Nov 2026 21:38:14 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH RESEND v4 03/20] arm64: dts: qcom: kodiak: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <ovctaahjwayrio7glzjdtdveo6si6ldiddunokpho6w5ipxrve@ef254zb3n6tx>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-3-be30526391d9@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-3-be30526391d9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04962a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ukIheBjJDxOVZQT4PtwA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: lWtNkpkzbrTLEkahYniDQO0uQzmgJ-UP
X-Proofpoint-GUID: lWtNkpkzbrTLEkahYniDQO0uQzmgJ-UP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX2aPUGL2vQMcm
 Nzs7GP1h6k5VwrsiVXjVaDcvQrixGndxsGfV0AmClE8JZT2DPdNPZSLhEbz0PxvQpc6L7AMQm2Z
 8au+lO/zUdq0sc2steIa5h0sdSukjmo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX2F5kNih7RBOD
 UKM6daK+h6Ec6tzqPlDXWO2meudyZnwSzYQdNtC2l8LDAe76C06fLWhkeQU3B2gHH64RUvoGjW0
 zSZ9rqOtuOoepiBqWwQMBxDiYyJX64uYtoM9V2Ye/hD6dSOI4y9tipNv+5pd9dxsJsNl3MW8+oG
 zI9f/Vb+TpIzsZRxRIOeu1F0rZALWSGIUCQI0SSA5+EI7q0fWVbAc+g2kvqOSDG4QoZSmviUSAq
 SNwqwv/FNvo18La5a9XSYqxSM6f10E1uUNnz8CRTStuJBiUq3EwmX4RsmthsZJABl7Pq40QazTd
 9nx/rm/aeer6+bgIKpOPs3CMuQLeUfjb3ZD7C8z/6N7CGrYB2qWT5HDsWo913VciITNRHSgVAuU
 4tAc/faDjersKs5rQs2ZfdLtNTlDXHMmjqBEfvE5lJqSS/N7ZOMIWmpMHPVQK2Z2Bf7k7RnDdN1
 1dgjQcD4VsoZxhjGk+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:34, Bibek Kumar Patro wrote:
> On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
