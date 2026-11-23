Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462819;
	b=ma1ziYzgjNMOZSPVNdgeVHY7O4VQG+MYRWMEiECatiEF1qBQnGeZHJ2pAOCfYqlPM3ix
	 JEfVf/e13ewFwXUidM2KVX+34aA2Fy5jPRiglZ0/YywuWpukh25rQkM9VCaHhtYKuMZyK
	 mBT5c4/wd6Hc5lEjhZO6HvDhOyc2WeWcisVYQw4SJTlvH74nTEvw8RD8VSOIq6egfcuMD
	 F2XC00OjiL5LF3LR3jwjEnIOVRkJUDf97f0OvhBZHfB3xsuRiWG+rTWvr5pHhIGY248rP
	 zSrDr+Mdjhrl2RcWlVs49FOTX4ocKoK+ud8Nfl8xbyfQAqUukmKvcqGcFDJ+Ijtf5gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gQHF8sxJpg0r9mXjUhBjnOoWS+bWertP7VU7oU3l54M=;
	b=AModVl8iNdo8KtuylmWbs2T6zGsy1G8Sth0zO3fbFopqC/rQZ2Xb0FGNhXNT1X7aeEgv
	 OUqtZvNdlcDnNeuvTbA6OIQwaCK8NRu4kX5D3nnZTVta9Uzow4ug/4CI8iKg3R4+o5qzD
	 jcPQrLtIKavj0TGSv4oJod3EWkQh9m6sFvRXI8OHfvhR1gSGdWwFlDlh/RrwLpsQ6rH+5
	 0gnD7BmmIU7EkJxVbg8JtAaH4xAeC3y7HxFCfahqHuwZU0Zc7ueDo6GP08uPbYvNfhxc8
	 q5io/3iA8kiDwHrqYRF+B6UWcWqtSq1WOoA6hLkBqqCLNE91qYwWMeMFl/+MN35V93Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FMCyqOPk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hf9HanLB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D49606A335
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88D49606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FMCyqOPk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hf9HanLB
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJ1ntT3211957
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gQHF8sxJpg0r9mXjUhBjnOoW
	S+bWertP7VU7oU3l54M=; b=FMCyqOPkDlj6tsqZjM4E0RAqGGWIbRdO/5LunG3P
	9fW+J0svBtb6tGe0T4vZqDc8Pzf9UpWwPb7x7ZpthN2ksxxnHTdMJATjqCbf813P
	IftAagPQoY+mpj0VrfTDPMQnrfJk5H01S7I40JptHJjtiSBK/zmQC5Uy3/3Wjrgr
	mHAaAXspWIXHJ3EXQWB37e20TLmONF1kZweg9rhR1lrTE3xNK1RmNu5eAvHQX0Il
	h5tcCNfDlPLC0uXMq3pLE2ccqCiQ/LNGmcq02aB58MtfabrlKp791lgDI530WMlo
	zh2svND80S96HZZYj3i2iex+6M5ldQSD/XDbeO4hiZpV6w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nr58n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:40:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso670406985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462817; x=1796067617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gQHF8sxJpg0r9mXjUhBjnOoWS+bWertP7VU7oU3l54M=;
        b=hf9HanLBpNKMNAnoweFK/OazddHH3vCjpcERlge2KFfvTId6XM0ksx6HRUUZbX+Cdn
         xW4oqAkHmJVkJXZmz/pB6eeMa94kNybZCRPEEXUxXe/mU7g+YC+sDPUJNtRiYuxnZ0zI
         KnHnTElvETpakEGTWliTeZsifyfk6Sbdwvg4Q+gFyaGYPhtF9MVmhS/JzkFijpVRylry
         5lxI4EqesypYrZ6eViRU3/TC6bIxGY1umPw7vvmgM/1sESvkYclVVHO1abvzD+MOYoRm
         9RvcrwqAIYO8SX7TXArsS7CgIbC+tZg0ihPpf70quomfd2DJp8bXUJ+G/5d71QtaOavY
         +h8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462817; x=1796067617;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQHF8sxJpg0r9mXjUhBjnOoWS+bWertP7VU7oU3l54M=;
        b=MY/F7KsIJrLuj5SeHgHAj4QdBKNRS2Vx7Zz0gCofEx8leI+pcH6MJsiYPjTafqLD4R
         wSp6GCYg0z9YXYkauf9sDYa191P3QYfWGSO/fDeiJVn5MhiQJ/5N4XcIZw5Qeh1ohh8m
         jumBoPRrRk7LSvwk46+ezvao0are1ufjTF4dt4MCz7PFeV4lGcq3e47Bl5hUm0jsi1e9
         pEJx5cvOTcNFgUsccMzdfLrczIMRrP0Y16OjGnFIHzGOpYTDN+NRr6gDpd+xCNLgWeiP
         IPTZAI6EqGp9h+e3n+k44JmYvtJdrT+OkJ3+Hs0M6RKlIX5wdGAw+u2wXfb8S6Jv1jU5
         p9ow==
X-Forwarded-Encrypted: i=1; AL+hErET/1wu1DSO6sV9IPTPA3bkgdJLsBw0FE4WsN4Wxj4m3AA+w8NnECfF66lV+IXxeUUO8WoqdhgBtHN/zPKr@vger.kernel.org
X-Gm-Message-State: APuU4Z9L3wBCOAmYvOONNYbjE0N2q++ndjhqs+0CIe2cWFOu+PlKepfl
	hKbpbDaYxbtJhF92hozWZoVinpvL40jFubRncuEvbPGmQKOp7XamLtvDAU/HCbI70bmQSIlhlyx
	Hk730BfpjMx2jWR4CScHxRqSIj+s3l0Uf2TS4monrlqh5IdXDjORxho4D3yjoi8KCXTbj
X-Gm-Gg: AZFdTZf/eGVLVimic8ReFkLdRAO14PZZaQokOGLpgAwGHv5mqnka3jqknCdp55Ohp3U
	2EnRSuOHD7y2eRAly7jPuFCOPUIIrZn3VTrs3BVOzkwxqqppJ7wlpTnbasRyyCDbGsGvMHcWdpt
	5UeAT3otpt/ZCeFKjR3jzFgLVeLzYyL1ogjlcrEGAIbKcnlfzh06Ltc2uoFiq3jnL6dghdDTLeg
	q+zLsAtBSekJTa7KjgHBAUQKZWhcpWfN1FxcASBL0GJ0Y9+dmXRJM9ay/2D64jivpQYFnEEeOvz
	+UkZDh6xVEPwulbHIvPaeY3buxpXJuIVfHvGdpyV09hIw2oAY9ws36vCXuBMKZY4hrxPXfmoZzN
	g+rf35ufNV6y+Yx1xcLP7OmZ69nxhAHhWEH2HM47Cb2CqBzZQeHhk1WV5UJvzjeUF
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff8 with SMTP id af79cd13be357-949ba823573mr2256930085a.3.1795462816958;
        Mon, 23 Nov 2026 11:40:16 -0800 (PST)
X-Received: by 2002:a05:620a:480e:b0:949:816f:cff8 with SMTP id af79cd13be357-949ba823573mr2256921985a.3.1795462816158;
        Mon, 23 Nov 2026 11:40:16 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm27856759f8f.21.2026.11.23.11.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:40:15 -0800 (PST)
Date: Mon, 23 Nov 2026 21:40:14 +0200
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
Subject: Re: [PATCH RESEND v4 09/20] arm64: dts: qcom: sm8350: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <gcgah4os654tusrceekh6e62dlgmtqggtlgolua4zewglhrpjk@4rnokaj2tzlf>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-9-be30526391d9@oss.qualcomm.com>
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
In-Reply-To: <20261120-smmu_interconnect_addition-v4-9-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX4+YvYFQSyjHb
 lAdLz/eOT5V4nHEpWRTszZtxf4u6dOTSYO+o3gOiG6i5pBfT6gVzJlvK8aZtz1Om/XOOHN1CbDn
 n4OKlzQK9fzjkPgHt1QL5gKmt9b3/y8duCyHoFEP1BHdN5xOASJVBHdKNzh41HTL/NK8QDH3U1n
 nd2114WnmvmlvNlZZHlIHNUKvV8vNNsv62RNRPMcS4s2kVbX+eE65O5mtu5JriQk0QHBwu7f2hH
 f9pJdCiP44Pk0llfbqXsKYSV1SFZmXYxBJlkZCLTF8j5E54CMJ3XOfZQsxN2Ni/RtMZSKBBAD5H
 nwCAGSN4xcZC7C4JKtF4J2EgWaEhck1wz/rAreoxnKXhkRdhnBwtnugBt/drjMaJG9pkyaJxh8T
 gJBflADOVM90/je9d0Ue4PG3HdIDobZqYJwrwb6jZvPoedJPLOfQxpJ/dVlOHMABHnmRjNuYwnr
 LJxM+Z0hsbaYAI6lGjA==
X-Proofpoint-GUID: KccxsxN02vMv5V1PXurV4HQ9Gl7zN-MZ
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b0496a1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: KccxsxN02vMv5V1PXurV4HQ9Gl7zN-MZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX7F6Hj9e5Swbv
 fX4DSbYF1z0aCotqSADCTi0A3ZY6anMr55Wiw8SHprDPfMsIEBrR2dJIGI6M1HtrZ9GJoLmhw6o
 +v20ou2hComGiRw2AMHuCTX5cPVBGRk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078

On 26-11-20 19:11:40, Bibek Kumar Patro wrote:
> On SM8350 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
