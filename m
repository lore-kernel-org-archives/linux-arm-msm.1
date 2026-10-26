Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018976;
	b=qg4fwoiCsn+R3J0FgRLXnE86QDcdf4rIWOEcYAzbTqqziqInGW1MFygHEd4MHrcBnOwK
	 43NeHF/3F2O6GTxJWXwxawAF9WdmZUysOTSCfxx4bNReyb+RM9eDz+7LGFW0BbihLFC5S
	 ESe2CCDYwMS/kvoe0HBAZNGpexVPu25xTw94E6eIdlzdK79rqR9PxBR2iYsKtsi1AF5vc
	 EbMKddQlo2vapD5cRG8JBBu089XmaOHEF8X08N/l1P/iUeaRR8qBI/7goFxFmXlAPbAtk
	 6mmAMN4blgroE7stXqnDm8UJI0+Xi40drkWHNDfLIxtPtP1BzN3Ah0Hvqd6ulzZr9Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018976;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZCSfsV9uA14WlyzThyN5YsWWLyL8+Zt4OvY2uCY/Z9I=;
	b=GsYESPf5WVYq6jSRDA2KeCZaY30WSntlRHOttZn58qWfEzFpTqDE1t1xITY7AeePxFJE
	 Mo5g10jwQKRaaklM/2IzhrQ1ZqlNAyS+BX6uxR4+zYJuZ+IvnHjOVsycxOOi7IkgPV03K
	 fcAoyqvnFBpyggaL0ZQIdjqS+PYqQZMdF0kpCozGBMdVXAMkkDuPTx2K03xTlxP80RPKV
	 db6H5yu+MN8G9PbAI6ivM33gEg6Y/h75JxEs2CrEETIk3XWHO+7rLcGfMSeoOThFL4tGe
	 vJR4ye6Q7lnZvdDTGanXJJWvC0m7saEnGUh0Rn/Aq6wmqv426vpBEuPRt2hIs1b/9Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JCn+h5Kv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f7TKOKLn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7996606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7996606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JCn+h5Kv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f7TKOKLn
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsmtK2168521
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCSfsV9uA14WlyzThyN5YsWWLyL8+Zt4OvY2uCY/Z9I=; b=JCn+h5KvK+PyV9OG
	HLETjM5Zg1h0vUQQyb09eopw3fy3y9DljnIRrvepywBaNPsn7u7dB6tA93aTKpiM
	TpPRuw1qZHCCUhiAV/gozw2Li0Q6ph5rSWCVTdF98AETR86sHTq7lzMU/C1HQVz7
	WMj/Gjhs1vOXByWmbLHR7G1ZRSfzdv0nKJdNpzWvOi+wweF3wmQNQuLo3TFGSOMr
	zs4G5nQobNkr0HyeszYA42imS7G0Ldq0fyKsJOQdTGwZo8DncKG6po5RYuA4rIi5
	1wUEKiC4BCia9ZlaIjpauA7LqoygVM6G85qEGrMtwqt60nKfacwammR2d3npY95x
	x/EXlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60tva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:49:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2bdebfc5so93304985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793018969; x=1793623769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCSfsV9uA14WlyzThyN5YsWWLyL8+Zt4OvY2uCY/Z9I=;
        b=f7TKOKLnqBXZtFG3MemDn0gQdQp7uwZ8Za4E4x0iixSiofRYczl23jAcJ6V4vpLbv2
         CpxMuYJfyxgNiyZWEJ1e0Mep5lMCvkkCocbohk5f7BUeO3KvdpVNp/Nmx2f/s8XMsHXh
         0zMpWs8WcquURHuBgl0Jp/cZJ9WpgYg8j0vpS76hdQ5BTOsLpX7/r4O900VNdKG76BZC
         5ml9Ries6y5CI4eEJxtuXoe2EOyb5+czfnXBWagQJYc1cQi5Y/AvZHpTAIqGAGk3PUfz
         rFuldrLhXnEqEeEF7j53lnG4xGmGhywpSulbVZgBwmVLvP43AAyg6m4D9zx0Qlj751ql
         t4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018969; x=1793623769;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCSfsV9uA14WlyzThyN5YsWWLyL8+Zt4OvY2uCY/Z9I=;
        b=qPoY2itt+a3oh4Vkm2XaFUZZVDLrJ9tR4uMEGHbcGAtoT5lklQTzYtyMpAcY1SWG8h
         yuR4JEPbbsie1UrwDOieZRi9WFo1JCgS4vOVBD1uiH9VoTw/oWUAoN/rbhcPfqy4BlWj
         rmG8xJMW+X4ocwrECuSHJZFnZNjE0nJSA67Qn+S5KWG/lHnwZFWqK6UkiujuMCMit+6i
         IH/oc1V8zP3ksUgVgZHHIPuDpvz95mteTSmTj5wUZ6gpYDGSUwPKdVfOk34uK2q34N3H
         FOdyHaXHNvZtMF6w3PXibOyZdC6S53lCBForWQNkv/zlOD7qNC5IxrKd9VIkw4izM8hY
         dt3A==
X-Forwarded-Encrypted: i=1; AKwUvBxuF99ZePaa4UQwhZTZX6mZMNpNZS5yqt4QKzofnt6rD1e+lunAB66nSsVQEO+TFf1MDvD8Fjxsbu4SPkS9@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1E167Jsrg6YR91OB4evlDeSXTtxDKSNZLg1UEBcfggSBGyn2B
	ixxFOJ1l/5Fmq+cFyp0+xuf5rZE2TVLioobvaSglYYTrryyjLW2q6IPNRBuDKyt9V8dCXA12AwR
	DFsgKFaVYc1gdN2rCCN+Fhv9MmjxMRK821NbYWdWlaky0BNvoU1Lpu2VlbJt6vmS7cE2H
X-Gm-Gg: AYBFou28ccLq9O9RrqBof3yumXdIy8XOJGl+k0b51zqwQ0fjU/8JQInQ8CXyJ3ggxW0
	IA+BjeD4Wt6lKQbFFr4G1k1VodZHsfKPmR3RvjJmeXUtdrgfq7/JyyVkwGv4OcGdjt9GW4XGwtJ
	3/i9aEb+IEh3q8ugLNqokULWxfLVzki6olpYEMSGWX46v15qFRgMO1YR48b87caDbqToj12aUwv
	sKfGSRUCWbQjUUWo7TIzjAkCtwCh/MCqM2WQryO7jRhbqUh7hTh3AYpl9a7QOpVCSCidaM6999y
	83U6bncpWy2JC3877a9MJkoxbOOKEOpjGw5nz+R//8an9ehzmLv8aSjybBtyA86426qm1BzvcHI
	l+UTxfiuFi84NuGU5/AxFRw==
X-Received: by 2002:a05:620a:7307:20b0:93e:508b:7800 with SMTP id af79cd13be357-940ef66e196mr986884785a.0.1793018968953;
        Mon, 26 Oct 2026 05:49:28 -0700 (PDT)
X-Received: by 2002:a05:620a:7307:20b0:93e:508b:7800 with SMTP id af79cd13be357-940ef66e196mr986879885a.0.1793018968475;
        Mon, 26 Oct 2026 05:49:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd650890sm329086566b.51.2026.10.26.05.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:49:27 -0700 (PDT)
Message-ID: <2e928aaf-0659-4bc2-b6f7-e2a0a5e8d3f1@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:49:25 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Add SPI3 QUP core
 bandwidth OPP
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261025-qcs6490-spi3-opp-table-v1-1-d0e0be6ed1b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261025-qcs6490-spi3-opp-table-v1-1-d0e0be6ed1b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8tnLcxA7GCxbJNJycpNQNB8t2gH0mwsB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfXwhebZvqqGjDY
 M1yVsJjV8k/EKRqfxvjBD6rwnNxzGsKsxyn1oKNNa8edwvTynFUD+xeuNiYcjIZ9Blcf5c17bHc
 5AhYX7R4t1L/ilcg7SJQhH8GTeijZ2jVvcriPF2nysxlHRJcZ8Ue4mjxnCr3WpC0884ON7UygjN
 AHjXi6P6Ad13blgN9vK++q8Az7T9BzPqnCSUXKcQkCYdDH3sjjTwWXUXjkr7chSdnkoTrk2SO05
 gddMAxj2ENAsBFMxSnheCSVjx57GWYKoL2VEvPXTA/T3YVoNnupgpST+XCvnojpm7qLnFgFxv92
 a24LyjUvIc+Kn+O2k/zJkzpKS2OpxGq6SctHSD1NxEx5BLHXm+9uYEiJNNogREx+I+ktya9qNre
 Zga0M1Kya/MmrDVlPXFhRQNIDBPC4NrBFzDV8Ma+gT7IKy9nBqsff2wCF1ce1HXIpXTdyTMDgpn
 X4fyT/GajI9IqONL8dQ==
X-Proofpoint-ORIG-GUID: 8tnLcxA7GCxbJNJycpNQNB8t2gH0mwsB
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf4c59 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=62u0kLJnlP3cDVRif6QA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX1qgXGumiB7Pd
 k4mhCqCjVuFQQp/ZlFSJyJfasb0Pr80bRoFSWKkJaVByYO+0SFyqgac/9Uvs00Fr+t4rPiJlFkL
 7K5ZwqSmYjz7TtvpCfVRty8pYleqXzM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260050

On 10/25/26 2:43 PM, Viken Dadhaniya wrote:
> Short SPI transfers are sensitive to the bandwidth available on the QUP
> core interconnect path. An insufficient vote delays Serial Engine
> register and FIFO accesses, increasing command-dispatch latency.
> 
> Add a dedicated SPI3 OPP table with the valid 75 MHz and 100 MHz
> source-clock and RPMh power-domain OPPs. Add a 100000 kBps average and
> peak vote for the QUP core interconnect path. This improves MCP2518FD CAN
> payload throughput by approximately 38%.
> 
> Limit the vote to SPI3 on RB3Gen2, where it serves the MCP2518FD CAN
> controller and its frequent short SPI transfers. Other QUP/SPI instances
> do not require this vote, so avoid raising their interconnect bandwidth
> unnecessarily.

You can solve the general problem OR you can do what this and
create more work down the line. What if I connect a MCP2518FD
on SPI4? SPI5? SPI6?

Konrad
