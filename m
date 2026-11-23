Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462871;
	b=o5Ckew1K9YVttWEFfHDp8jQmCzKfMYs3XkI5YqD+o7bBkz5EBB3jqtHQP8CHVthKsDIJ
	 ed88SbqVK/a4YNH4d/uyqnvoppJjUpx8EYorULb7p9aOFBldyn36AN1YA6N8ZsaCduRps
	 FZ7v4ZFZuj9gtFi1RYmknW6Yvjs1G34XT7YW/3vMa9Rv9X8/3tqXfZk5UH+bY6+hvfYIE
	 STrHefv/K+0sKJ2nLIy0cyaM6pPF8ZIV0LykW6Z8Meotc9evQxjqLSN9bmfZ60/osIGMQ
	 2+R59SlOsKrDYjK90iGLvIqnpKNhUm9UbHrlkKIrc5UCzB5shYTz4axlo6Vc/Mv53JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462871;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=okCL8kgOe4YWBJzwczqiUxr3lV/zkclx0rToDi20iXA=;
	b=VgZ5Q4jjayeS2iZuGab0fr0rm9rMnkT2y3mBcROmlDRADkcVZjB4XpS74jArVOAHGfdu
	 C8sqPbihXt/r4DfBqS/5SZ/VsRvePQb4/eM9yMZaiihaJ3ia5+/fGnAyLXPvOiCfn9vdj
	 NMB7vaOxBobxTR4GyFbncdxqmGcCdG2X5z67KrtmJmH1J6U8v/gAKOnYocNMnXdFI8q/q
	 EwwMedT0Ukwm1fu3TAYkvzd6ZAztSCwMiP41F7TaXKMao1jt/8bxZYj3i1kJalrAR+x4T
	 pUMXZAwZmtshj2EmA5fC8Wy0x36kiDKsG/yLGqFLIr0VhowMWW+4GUQWgZIXkUp08tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kX/EhceN";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECmZ9v86;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC0B606A32E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AC0B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kX/EhceN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECmZ9v86
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGp0Z2769023
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=okCL8kgOe4YWBJzwczqiUxr3
	lV/zkclx0rToDi20iXA=; b=kX/EhceN6e5M1VQxr5l21L+n06WZzx/2LLMIL5Ld
	XtIA/5riM2Jl8wuizaO0P8XhHrgtUOsA8yaZ3t6/a54JhVHAA/OLh8WiCHIXESWa
	hIGoueXqk0vHyoxCMbcbsgsdWZKyNmjQsBeuz5yVALNFUJKPfWT4rwUWdhZ/CGT2
	dQeCaqxXwj6o7inhvLyl1E+qhL8QzNK2yqtMPBT6744PH3eQy2ERUNGI0zPd/Sei
	F7C5J11ioBiCjGE80iTA5BWhqBXhMooxqJbOYhhL+yVn06Ak4Q/pYF49bARcWBlx
	6Thf8jHIuTWjRsi9e5Nvzsw+p/wSSaEBlFmBSXoac0ChLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pb45v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:41:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960bd17b5so614737485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462869; x=1796067669; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=okCL8kgOe4YWBJzwczqiUxr3lV/zkclx0rToDi20iXA=;
        b=ECmZ9v864Emw8K41zANur7AfoknTvD2anYVVgSItHzvrDe+PX+wVJKdisl9hLSvHIi
         +CAydn1iFRJNiuxvIg8P0diQLLTbErOSgcPG7u0Z8xokidlqezOwlEX3wCtlL3mCpHrO
         RFUEcM3YfxzoSI4tpG/thw605xHv3OBAGQqCIuzkdTEbuanDHSFHu2P+I/tZfueBqe0M
         PPPeTnxNPa5iQkouKfLtjRqvSpieQyoXdIl4RstSjPzHd/NrA/I3bqGd9Wu7qyy8YQBj
         IJIVFIz7h5v1vhBj7O5h19ZhCdsVLJyE09svRPg9ian98LhUZV0wMja2xxg/qcee6v+9
         mogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462869; x=1796067669;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=okCL8kgOe4YWBJzwczqiUxr3lV/zkclx0rToDi20iXA=;
        b=zkGqift18B3jGivoKuiDgpbbjFIJ9TJyyYtF+qEJVksXLMtpZuiN8OT6mFcy2+xATI
         kUK6a0x2a0aEkMRuyqIbqIPyFeqyhi3OaElHhZJ0Pg7NmwrG2yPUyeGnetkK56zQPiYs
         zRH28u6T1QsLbEXCLYxWigobTT3e4ovKqZ2itczrdbdkATGCHXcGeIIITlMNwJ3FVtpW
         zOiCmqzdhVb6i6xe1WYHLD+vUBKbYf8Ha8corjMV1dWfs5r/5Pwbyh7p26BcG5LUHHMV
         CZ11ziKbTrrKXUN4odbyILteC+ix8t54FExFvegnYS1kcsosMAuKKgabPEjBBTR91pBz
         IJcw==
X-Forwarded-Encrypted: i=1; AL+hErECgvsCP/hw0makxEz/2tlNOoWB+6NeHugTinjxtE49gadenJ0PUR6QhdCk934f1QLNEE3u7ugoiijccdBH@vger.kernel.org
X-Gm-Message-State: APuU4Z9ayEbcRpqMN7hNTehQjeY1GnaJlbkZpIn0/Ojbzaohipj1T8cI
	V83dceOXYYm08vSwCdoWY1Dy5/TvKLFuVulB0Sg7oZsH/YkoQZu/5vNBY6DokRiVgH7h2aLowqW
	DA2u8nMH78bsrtZGiMM1kWKptJeXVGHod3nclg5jYM2IQARbE/Cczf5KkUC5NApCJcbsE
X-Gm-Gg: AZFdTZfWlq0bBDSv2xmgjQyu9feqZU9tnWEbzzKXZvw1WXta0lcRC1ODjujStU7RHcf
	A7g/LMM5leUTlmLF2squvPbJTHCTo0yJfGnyC+/VI++N4wZnLMiwKVHBh3iX/RO7zlKM7rT+yaR
	TVGMp3ombiTDYq9371ZT+BBVmVh1PUtq9dOkSS4XlOpLzFVd1D6be6wNBsFVazQrDrJ55zLCAPR
	V1ZgcaF2VOU/JGcAilCx3ne/EX5xYQ6ile53sgwdlGWUmlKXZdgbcOi9MnAq4coy2AoUx9OqVyd
	elWQbZFuaiL0BWAMoUBdnewRRciJ6mu0MGgLw2BUYHx45CrOOrvwHOimPU/Omd9UdHkV4ZRh+SR
	/+4/j0cxJl8DD3owaUAWwN3dSwzrulVaObBs5TK3Klf7KWfr96HfHmVUl9GMA85ie
X-Received: by 2002:a05:620a:8812:b0:949:78c0:e186 with SMTP id af79cd13be357-949ba95de77mr2032516085a.25.1795462868646;
        Mon, 23 Nov 2026 11:41:08 -0800 (PST)
X-Received: by 2002:a05:620a:8812:b0:949:78c0:e186 with SMTP id af79cd13be357-949ba95de77mr2032508985a.25.1795462867959;
        Mon, 23 Nov 2026 11:41:07 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm490807405e9.0.2026.11.23.11.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:07 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:05 +0200
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
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 12/20] arm64: dts: qcom: sm8450: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <lljflqhizl3wlw5pusaslpxwmfe4taxadw2prfogsxr77voe4v@ggolvdeja6op>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-12-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-12-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX9jERRnDkj81Z
 LaoUA/HsqJsaLX8xaU2RGkcH0Xwiiw29xxUIctoDLR5q3DndKLbQP25C+1P0v9y6x0KL47p+xiC
 sPZrTjKbUEJQQo4lWz03rXbztprHdM4CEWNpCMWJNV37JwXizL1fG7ECrgFxzvkCNQIXgkaeRij
 9F5wwZzxvIRFpscbVIseIpSrXO5XfX1FkO4oi4oeyjrffxFgNro5LgOIiO4ItQpvcx4Y5knYKvo
 WPydA7WMCV6oBEznIJ9GYrG9wMetCDTfLKNwwN0dOb/LeHbNEwBLDlGqLFX2Ea8kALucU9gzJ7H
 6iUeOrL/g/PC5UhfUgMMCku87aRlNGPLLNV0o6ejr7psjuGx1cYM26FWr+g3oKH9l50MrFEqTkJ
 KogjVFRELkgHXKJCan6va7jjvsQakti653N8ScUI9RTowxDVwPlpQizPbjlkH/oHb1KFYLuBFYB
 X+79VX6nQtpmfEpX/2g==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b0496d5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 9MHk60DEm0Fss5h0C_Za7Fl7BwecjIuF
X-Proofpoint-ORIG-GUID: 9MHk60DEm0Fss5h0C_Za7Fl7BwecjIuF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXw9htvFa82fnc
 0M+BbtWbTDMmTwhwK/Yhvp8sCHJBtsaSohBnE9t0UXJXVORWrhE6GZapkGxATl6sh5WH2VsAhVt
 Xg4SmuhwIDMMOkeTPrG2ddpARLhEbJY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230078

On 26-11-20 19:11:43, Bibek Kumar Patro wrote:
> On SM8450 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
