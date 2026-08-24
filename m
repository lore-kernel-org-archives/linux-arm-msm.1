Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2683ED3B2
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561203; cv=none; b=p0zEdrwJ2hWqqY1tmQdZkNUjvX6gXzO80Lt7iln7m0ECyLZY4hAHJnyhSO0x8zvBmhLX2DDz9cHhi3hOm/MBfnqo+nhCWYGRTmVdctbtYkbgKL4koIUVeLVtll7CSuzGevhIhy/I6NrgGRcRtyn7uVBhDiS0LzSBxS2USfyGfYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561203; c=relaxed/simple;
	bh=6Gxu/Q3MLXMDvfJ5qrWScz+sQ63hWuceqhbpR6SOQwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O/9JdrPD1FMg4CHvh8PtVPhZ8dzkt0+A6YpQ0i52IDclX5W/k+8ft1tXKkVpKT2DUBc5xnsq64TmdRwKFoQoTXhy4/zlI/O/XqUtZKSfZ164i0TSYDb5anZqvK2PPsmPBFw7o76BOJ1LkFaDEEyKU7+PChbXnMuzDXALi/KmoPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HF6fuQC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOYjgO7N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HF6fuQC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XOYjgO7N"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O7BkAB1815938
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lY8DjFZzzT5968A84BYBfpc5TdKTpgJSJdTt0s//IQ=; b=HF6fuQC0r3s+V3lO
	rH4oPnySiVrrfJ8kC0nzVixCKrTuaIKxX5UsjsZduaO4ZB5rK7zEHq2w834kYD5n
	ivIGOaDR0Ws0uVF/gSxGGoytzUyxntawKVOxKUs8+6r8bfPKyLPqrGWxroeMpoj1
	st8jl2/eqoneCQLUKxKF/Rvh07y3NMeSxkQWzV2QAb5dYkqzqhKpSc8uI2gD0pVT
	a+6tbOL2rTOLWjGODGzj3WVhOMCe+V7CQd3mshGaKTt2npuyI8q3OyZdcoFJVe29
	0QjeKoDTFKBhu3Kf7ljFvNzKITaJy5T/mELW4U1IQceLORPjYovnjwyt0PPoK6c7
	DXtQWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbtgbpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:46:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930a312222dso19245285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561188; x=1788165988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lY8DjFZzzT5968A84BYBfpc5TdKTpgJSJdTt0s//IQ=;
        b=XOYjgO7NiNKfrDiAysD9fQYL9ZmRHGnuB4az7uDQEGtszV1XIOm2p9TO7PptXdG4Sv
         F05mFvR8wMt0e06q44bun59uhR5yJ/33OCFKD1Rr5SkSBzYl7jO1LU0rFYfJJppMmDCS
         9/G7FrkP3ZFPgHYAbQPwsmgaHyBAyY8aH/G3qtVO4sz6SUNAQgQyAAlOln5dIRDM3Jfv
         SFbADnxEc+LetfyzsBvjyiReM5LeVZRfESfdUVElSsESzJ4JBepX4GnI5P1+yGxq9ENd
         Rra3sN2smwmQbv0xBC6z4nNH+ltlwLtlQN9iu/1nsM40pCFaYdkoCuhic9RIfufrUdpB
         pAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561188; x=1788165988;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4lY8DjFZzzT5968A84BYBfpc5TdKTpgJSJdTt0s//IQ=;
        b=gNB7s1wzp2IjBnK/VevpWQOM9A8GVFrqHMNn42MqoUmWciLKpfIAaQgkyiIOm8J7fj
         Kg9Gjn7DzT6oTrhg7YR/BDyDzBQq3D2WtlB7HtYxYHQhG4tN/UP9jNQzIfyPt20r1BWR
         QkLm4r4HOju466LYvs2f221WmN53kQfsEYIq9yMDHtmEZ/X8l/jD8xhg+nxvLjBofM40
         YWGEmeU9lkPwT9QvqiVUJMu9oS4lV9+zu9mx1fibUyEHdsX1n37COzUqWdNHXuHebxvF
         EhrOxIVpi7Zs3WiQX8Aw0eWuTER7b4QwqslyeD78YxeWepW8ykcxji9fGd8pMvOfAzPB
         cb7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr894M418pK0r4T4RleZEN1p6ruc0CHtnUDtXt4AwDMWO2qK47HQ2Q66n7L1v18gbcpWuTZvIH93HG/XrKT@vger.kernel.org
X-Gm-Message-State: AFuF++mReW2k3quQoClHopYFnoKmG+HG7ynOfsEdg+L2uHkMgthQXhwt
	8FRFYUAb1DbuaipaJPsKgltPNRl3dRxDKsUkYysfWzw6oIkR44Jc3zKRPIZETD5uxSypxHKkqYT
	SBQh1XRhAtMktkIf4SsUAbVj9c6V0nlHrhEo6kVY/ZjPg68KSYCSI9vQ5Kad1bbSTgzGv
X-Gm-Gg: AR+sD11PdlgKr4K+H+z8701jiR4oWNFWvG7x+DfV9O2DOb5D7tpifF/rMQ49owAghI8
	s1wurrn0wHgPGQFrawriPFmwowKRB/FAjtZeMeCYSw16VTsQskYODiBbb9CXYPcVWZ/3XLJ7ybl
	qfVgNPYou1Yv0n+4GDGCJpVxI6cKAmF+XP/g+t/94sy4S2WsKkCcGPn3KS+aZSgLczwhDzyAnQP
	pJHKk4I211jMFG2jP7664IlX/l5oSwt8cDYyjC7pOl3/BVdPSv/8SSjDRjioyDDV7Nt+ri6rQbl
	KmAqwggroZWLi7Zl05Np+dcgtfwwsb8YbvXg8VEDNh6WIGED6Ly+3BPHcGIVV1EshtjTmiPNtWC
	oKZwl+vXYE/Rhdx4qItymTH4O
X-Received: by 2002:a05:620a:4728:b0:934:95d9:85fe with SMTP id af79cd13be357-9373957a356mr1686968785a.3.1787561187775;
        Mon, 24 Aug 2026 01:46:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4728:b0:934:95d9:85fe with SMTP id af79cd13be357-9373957a356mr1686966685a.3.1787561187347;
        Mon, 24 Aug 2026 01:46:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b59fsm1296097266b.12.2026.08.24.01.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:46:26 -0700 (PDT)
Message-ID: <b73224d4-91b3-4040-b67b-b107c2eae607@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:46:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/13] clk: qcom: rpmh: Add SM7250 rpmh clocks
To: Sreeshankar K <sreeshankar0910@gmail.com>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org,
        ulfh@kernel.org
Cc: bmasney@redhat.com, radu@rendec.net, abel.vesa@oss.qualcomm.com,
        lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260821154030.2514-1-sreeshankar0910@gmail.com>
 <20260821154030.2514-7-sreeshankar0910@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821154030.2514-7-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfXyMpPeyczbxiu
 NhRlTvCqETgjzZbjTPW4gqdEyNOE7WaZu8ePeBJ5Jfo0GiskRPVLax5KiUxkgDWuYS01g/2mCbe
 Shk33xuprgdPgWr1wlYQukRV/kK50fdOrTTo7IhNleLrN5od6eG89/8yAiLSCjTb3U4Z5GEgRtx
 fZV/KXUASaPYLcjNLnGWQCYW3KXOnvjNuSx1d9vque1GO4PDo9bhaltJDOQsVwdHmyz4A5sTqi3
 jF1DcUAuSQYCqwoa6cI/vfBxSYwWQb5opjO4PDGFjvXG9bYrCC6KbuU1kJZBU2ny9/8NJdleJkL
 /DOudTisPRba8+trWOe+gzLnOObCDSNuK+gF1B7cfQcpcfmyVnvJjnrtt+Rba1Wfy7qkXvb921V
 /kNMHx2MGdBcShafRMCfsUj0dIcVfwxbFXEp3/exp1vr9wBIpUJGC9XhtMvOF4EJ63CJwEOs97h
 hkdyh/V8VoQPXWXIC4g==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8c04e9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Y6nKStmhB18y6u4H4U0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfX7vw9Qn4PD6Jp
 zlmpseXJE3RlMtW4w7oyh6S7P6qQ2uC2ujREe7CAaHEq5qq/rjBVHtoLebHYs4LPiy8ZuIag29u
 xOIk23J/sECwCsZy0tzNrDowvnO2YXg=
X-Proofpoint-GUID: w8Tqn8jrstVJbTQVCCYLfc8zA2NLrFIU
X-Proofpoint-ORIG-GUID: w8Tqn8jrstVJbTQVCCYLfc8zA2NLrFIU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240077

On 8/21/26 5:40 PM, Sreeshankar K wrote:
> Add the RPMH clocks present in SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
