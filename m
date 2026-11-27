Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783288;
	b=HCuBLMdIebjHznvegxlbfHT/hIJN6BlEfyu4C5tm85+qcy1v26Dq6NsukStNUWgq7gls
	 s/t/6OeAV8ChfQx2VijEeZC2ZApV/XHvEPAmgAbCF+bKkwlTsprS8xooEQXrV669+PGQg
	 1T0dioDSYJ7FprJcXjgl88tj8HzupCoX9PPF8eNvuXiLur7gutEaVCWJkxt8DUKzOKi61
	 cqUtIFAyl8DUhNZtEZq7ceRzbN8xYbtXje3p6RnPj/7KcXscd2IpbTBuiTnj16hdKpPF2
	 HxJ24ObxYvpl04WVmUlBmPA7VyNWZZlAEVArjOlVghd5dZTOmS+N8wh2R7RbccShvyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783288;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=21wwXPUWNXnpO7MEvgC88mCJTsCmkOMu2Rh/aIjZfeA=;
	b=vxWe0zDGbQ8/f+lvB47Sh5w/0faW+pYXKPjZdmKlC9yGztAb/amQN7VYmywx4rwKksEo
	 1izzb2Qbfg/IL75wIcbBEebj8uBiuNdPxwEkNjnUnqMZQxbQ3KRRtCAEnr4xcH2WzwvD6
	 bzv/igrWQ0yTKT8ifElgD9biJiMXWDd+V3rYJ8RN09HssRz0jFjaXYJg9Hu5FMaIyg1Vx
	 VhO6oAtvHNxydcbepGiT6KfymIUV6otWrOosgEBZh7LCrCkDST4I2Ep4uhK2Bt+ZHQEGa
	 oeQQhNn3PQjcMKH7N3R5VYIkAnH0PCA66HoD5YhJMsy7I5g7OMkO7/n/YGNKXDnlVuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UwtlwXbU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViQDMJoh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DEB606A6B5
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39DEB606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UwtlwXbU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ViQDMJoh
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApdDJ2058280
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	21wwXPUWNXnpO7MEvgC88mCJTsCmkOMu2Rh/aIjZfeA=; b=UwtlwXbUzcwW4iI6
	hSK5ad+HFd/+LYW/fiw1EDNV8nDTBBJmMejo3/qPeWqAnAfb/gBvTp020QIvbkWJ
	2VATnaKNOoa8+APXE/rXKdilHmVdEmCCERYpBFi2Btvw5U/G27VHDc3Xcgj9VUP7
	fbI1uj5gyWF0hF2tzOBXTJPCjXyjIcs1PUaNE0R3YJ+hEf1Hg1gzEiFP2prZ/cNx
	xbdDguTT0krxp26OPzDuEeNf4NkOFhjXDf4iGLtrDhv0+jB8j+VoT72k1JLWeSJD
	A+afRBX8eRb0k5++huxb/J9hnFPnrzshqHJnQWVXUdV9u8/OD7Wu3hB3WIkpQKan
	migdWQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gasfab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:41:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a0f79047so8677203eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795783279; x=1796388079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=21wwXPUWNXnpO7MEvgC88mCJTsCmkOMu2Rh/aIjZfeA=;
        b=ViQDMJohWOkii98SgMb8tVx4fQ0FB0evAogm5qHkrPol8mKaK/GnYE+eEwxXqLpj/1
         c4PFdBjaVIqHPLxD/6xSTY5ZfLhaPkAhP90B2mlvZXH8liz2m3eMs98nKqRpJpmibv5n
         IZfZaRuDkD+a6rZ0hR0rBCKNR9JYlOdRiVMq+DCfEsryAvQSMBqS9kmbFxNtperSMufq
         S6JTT/V16JQ3FZWS7wZnHN0Ew+2ifCNcLWQ5ZIwg/+CPsl8NgwLZVpVMno0RWSd19meJ
         AEzaXY4cjsE3y5AvdCNqtdtO6E6Gb9azAijwkAmwAPgmhYV20LCxN5kymjmOfcOgeW5X
         wm7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795783279; x=1796388079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21wwXPUWNXnpO7MEvgC88mCJTsCmkOMu2Rh/aIjZfeA=;
        b=v2p9I3p4l/zCBC/KaYivAavEwnmkeaC9o7T76YPaUkVNsU3kM87c2THoV1HjF4Sh0R
         xSXJYbNebf+XltZRBxuvkDFfvWvIMABRmP1cWgnl4apQcFetO/1YZAZqW49KqlgotDS5
         Tj/HDNQX6/JJk3yEnp0FfIYPq16/Jre0yrFJCqxQN2S7l5J/rHv9NQ1WzPrXBAfx2dNw
         tkBaNrnr/wM/Ho1OoxFpo2lOxSdJ7TELXYMSMYUh3FkeizetL12IsAi6gymJruLgMxoX
         hbx9PEMk1mF1DBeXWV3EYJIZHxSsRphh8vT8gtCwpYZk1YIaJTWgmZBQIcLPCE4vmvaW
         O0vw==
X-Forwarded-Encrypted: i=1; AL+hErG/tOQf/C7th00i6bzFL5OY60hLzHRRIKD7Esca99t/Vy4ugUUlscJ+w9CRLDzvyjZ8T6lCmGhGIHBYdoCF@vger.kernel.org
X-Gm-Message-State: APuU4Z+QDV9Ow++L/hJgPoJCe9YK9n+R3EBiHo3YfuOPY0Egsu+XyAlu
	YUkl/TeHXlvXh3I8RSbQmHzwQUYo14f+X+N2fZ0FjpGxBtVVGVi764vd+dWmF479jxaOLKgEhZf
	glABtLzdnVxPTg2h0gBvnKirhTD8ynyZGu2MlIbexjECnL/br4KW2xwbKREw1NqUgnedz
X-Gm-Gg: AZFdTZf7vUS77WiWoX1QUwPGkKX4pUzoa49qGmlDZ9SasLg6sRU1lTJb8pFDe8BcCDl
	RA/ah02Vhi7f1cOH77jHo4SoECe5C2inNIVkzcHtREH5GTgau5yEssK0LXq6QK/b2RlvPEQuMI3
	FBYYMgYWi8bv1D7EfsmMd3ebC6MrCVEMttQLzo7tpbbCZWF+1zxpacT9GnZE89U9N/phTHcuAER
	meIA5+1wWBmhomHp5yHbfE5693G7iggK1L68eVMocRyghjWP+NNsM1iRcUE5xmILWPCa1TOXuNO
	FOK8NqXPv2B/WaDJUM5fNd7z+6k3lemH+60Iec0sSvMm1D8+mmzs6uSyPP9GL6DxUPW/a0WqZgT
	1AwilhYTunnWzJLhNBLUBEC9xRfQRa8YZwbyTtQFCSS64THMbdXDIfL9J5nC9VtQf0vcI+iquAx
	Kmjc4/sw==
X-Received: by 2002:a05:7301:160c:b0:382:c1cf:163b with SMTP id 5a478bee46e88-38571419d38mr22800255eec.32.1795783278671;
        Fri, 27 Nov 2026 04:41:18 -0800 (PST)
X-Received: by 2002:a05:7301:160c:b0:382:c1cf:163b with SMTP id 5a478bee46e88-38571419d38mr22800239eec.32.1795783278184;
        Fri, 27 Nov 2026 04:41:18 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm82044382eec.26.2026.11.27.04.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:41:17 -0800 (PST)
Message-ID: <fdc9fdd9-1b76-440f-94d6-c6c982884878@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 18:11:09 +0530
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
Subject: Re: [PATCH 1/4] media: venus: use dma_iova_size() to check the
 reserved IOVA size
To: Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Leon Romanovsky <leon@kernel.org>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Sibi Sankar
 <sibi.sankar@oss.qualcomm.com>,
        Honglei Huang <honghuan@amd.com>, prakash.gupta@oss.qualcomm.com,
        Alex Williamson <alex@shazbot.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>, stable@vger.kernel.org
References: <20261127115849.2780625-1-m.szyprowski@samsung.com>
 <CGME20261127115859eucas1p1ae20b01eec39080daf19dbd71aba10e9@eucas1p1.samsung.com>
 <20261127115849.2780625-2-m.szyprowski@samsung.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261127115849.2780625-2-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w2pOggZejiH1x1f8AqJYbDGCt0uh3glq
X-Proofpoint-GUID: w2pOggZejiH1x1f8AqJYbDGCt0uh3glq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfX6t5kNDFwv4Ke
 HFu2Ngv9+R7ANh7dO86mZMqdCdI+brvq7tUx2qdbjlY/XC3fEcmJR1Pcvs0vVkpcOokSNjiJMN0
 6SjPp5tWmanN13Qxc6NHdJIXdZqnWKQsVwdAMma3Gqe/jQTfAFre4UazfKOC5DG4cH/luYbmESy
 /G8xz2EByBDVH7Zj7gx0NAg2ShmCEhjhdYXnE2P+TG2x6Xx/TvWCNqqFsTjHvGR0JoFKGxeGesN
 G0jhKqzITCTS6gGv1Fb/1NBBxtLQ+dObjoDh4bEJ2b7OpN7AovWAnNHCXLDzaNyXgyD/F07Vbv/
 lyNNbhn32lYXbIUt9YFuIy3VSQYJM0gZD54g2d7ZuMx7HppqRFDe/wiIvQMACmlU1BlgkPHDnr9
 zANKIbEw54ms8h2OilqLu2ZvG3oYqXQgATiTWVrEVfwNaAtP3FipCcaRXDbojcM5CyKRuLfLGac
 k//0sHKp+seZMPV63WQ==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b097a6f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=umoC_DmSGuEwgYlhGCYA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MCBTYWx0ZWRfX8OCHIUXVhZ9Y
 fcN0REbCbzMoSEFjMeD0aXvr+jL207C25wQdDDtX1D0EPHxhSBzR4a2ynTWg98yIJZqyr18JSJs
 LZ1SBOZB0jIZ5RxSgw7Z006A9FJ4mCw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270050


On 11/27/2026 5:28 PM, Marek Szyprowski wrote:
> The IOVA reservation code compares dma_iova_state::__size directly with
> the requested chunk size. __size is internal to the DMA IOVA API and may
> carry flags in its upper bits, so use the dma_iova_size() accessor
> instead.
> 
> Fixes: 953439251b59 ("media: venus: Fix iova allocation from restrict region")
> Cc:stable@vger.kernel.org # v7.4+
> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
> ---
>   drivers/media/platform/qcom/venus/core.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

