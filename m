Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612805;
	b=SRpdqskqIZbo83DAftEi5yIujC89Z7H1IFBF4Uh8hz8rjU/yedBJhRu40TRr+guEqjt8
	 Lr/xnoF+DqaVzNKP4Ea30h0crysBwIC/vC1yD87YavEy7EDRhl6UE7CcYtIQDhUl/BOJ0
	 6nbV0hUtyFZ7Gkk+WdZqy6AvXzb7ovxcM5Cr6Dq11a5AjE9WCVHBhIAh3KpwtnKe1IcoF
	 F7KzV1ncoXjBREh/sognwfuEkKMXbPBN+70hUY6gPKa7+1S7cVjhGybdts/ErJ593KEyv
	 Nc7E6eTNMDC9oAQMEhZU6ZZqLCBfxmGR0T2gv0RoGOm9XQOvul9RQRIMpy7pUpg2xSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JX0UDfE2BLYBOQa71ajvS7Kz4Yisvd/Cl2QJBj5sKnk=;
	b=IGmE/mIqz1z7cyE41BRofrGlWmS3whDsvM1tV9YSxS22CCd0UvncXxqZbkmPhzoln/9Z
	 0YW9q/GX/nHoPT08b1Cz3kHGCtFiS5WB/VBS3/ZzE7eByM4IT4sM96CkuX7T8PUNZq3At
	 MT3BfuKMiwOLQTxhIQk+9MXLywoSSSZJ41VS9FI0JpRWQVV/SziWUnm+nkJMVlywLpkb/
	 ML5ZaaFW9VX3zQIf55sgsGaSXsiPFTts/MCLlsVy64qkKhhSZqrizdTnUt6Ce8pWdji2+
	 /4tktAyqGEcNg5Se+kWjOnU/l3CJJLNqF6+gszD3cavMSGbG7GS0KnHg+EKKL+8RYBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XiFHV0BW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b6NvPEuB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83398606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83398606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XiFHV0BW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b6NvPEuB
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29B1Sn4015004
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JX0UDfE2BLYBOQa71ajvS7Kz4Yisvd/Cl2QJBj5sKnk=; b=XiFHV0BWymHOnOSJ
	L5CIiFfEbbxeMZBbp+OurSVw3H4tFAEof8W0HtHYt1nN5zxF34dTDqLRM7aMFmOV
	659auF767JgzjXGYfmiXAwi7lN3VtajsSGb2ImUWD5MBsdZCZaODoaGEjevdw/LP
	BGWG7J+ce3rNewtPacFuxeiM64M7UZRgo5qMKgOCFqCf1/DDJzxrGR6e4oHGZD7g
	7sIMJLyUMJe0n5zHxMLhRdrY+rI+/Y14Sy00686LO6KFWTy0n4s6ckiweooPWR+k
	vFyNt4dALNRT/wg2HxZymuCklN9DJaGdKoL8bVPM/ND4P4P8THW1/OLFiiKLaDfB
	uviAHg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6pd8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:46:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5360b8cf8f5so6593391cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612803; x=1794217603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JX0UDfE2BLYBOQa71ajvS7Kz4Yisvd/Cl2QJBj5sKnk=;
        b=b6NvPEuBrEhLCXkQQRmrtqrPxQ9m8RCN7Nll6AcVhcMNPa3G4OBiKLV5MolXXmsgHx
         VhwNrJh+hA5XFnU2sP/gSNrro1KyCYFZ4BPMX6hDY9a/zZs4R1laykiK+wdhJjHGwMFL
         8reUw8x9CRKYgimz7R45xjvqKSVA6vpK9Xh43PR1ULEsBaN6d45FpHZofdm8QTP8MWHr
         2JGOk0ImoT/80xMiDisKcpoQ9E9D/ukbsMpLYAHMuT8GFhMk5t3zpCwjKjRR06bjzaDP
         74oagh4HKBXFY7RtFZBjQVrAjlAddfiJnQqfOgwIw6u87Dux+gzSeEFY5VjelqgyTOvG
         /OGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612803; x=1794217603;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JX0UDfE2BLYBOQa71ajvS7Kz4Yisvd/Cl2QJBj5sKnk=;
        b=gljGgQJqtvi2j/gMQ2zQfvNiR3C8gVOX7uO8o+T4YK/dgN7RFDBT2uCuIe9t7GsV9l
         //MTK/Lvn7NWvqQ/VlIxn5aZ7AwLRMcWHHYLmQWGbOOpO0L2aaHivBsm4nxvGsuZWJBg
         9M4MvviMYFTmfNmv8rtkiO2w9NC2otIQ6gV6u/ktnT3s2FU7x8L2Wzngj7m1t2TPnJOS
         3mZu5O4HR3gV8Dc7NbNHE/w8Pib10u/JJ8P6T91vF8cMMonnI2AYhEaZ3MV73TBZ9MPp
         XMKa5TFjdDhgEh/T+yJaFFSf83Dc94kiYb515hzFvU2j6jCRkuDDyXaVjqJYguQtr4bP
         qSRg==
X-Forwarded-Encrypted: i=1; AKwUvBzKscwG2RM4RoYFEVO6GSsxlYz8mRF1rqryFkB9V+t/tUIZ1FvqqdhPS4XCG5xlUhDUZilT606DDutBagw9@vger.kernel.org
X-Gm-Message-State: AFq9FYL3eRtvAgEOOHq9YGP3s/V6eH05QLkG9bjBUQbdEWlAmD8NtYPe
	IYM6Xy9UdCA/D8ZwqemcHTA40uKDGgeGGtUD+6hGmESo6wZdPIB2EjvdM4M8SsKCwJv5zY/nU4P
	peZcjp7iTnCg8xZ+HenHDeaYFGjtohmkp/Fc2z7XIsq0KMdPvntu8Txw3fEt6IP2YDsuK
X-Gm-Gg: AYBFou1MjgLJavmICrYH4iZkEgBSKRHWsnaCohVNR0VMbLXLqnfD163bBnrMUI5WizM
	flseAM5APbb2G2gJ5uP51idOd7a7vFBHRnsahcDjStnI7aqYSS3sHSOZEJohNMFDx9MQjFR9KHr
	gBaAm9OvansK/NSZjd6BJ217Totp048GKxLr5mw7Jrfg2xc/vtZKlpJZgAFI/VKnA6AoPkjQW3G
	qLl59mB95BSB50Qwq+MldMrO/1LcTlB7/of4wbaIAju0U3SHj71CNtx0J+r9tBPGmAOqIPq3mF6
	xgYz5zO5zFJTvFT7jxq5wWyZZOLWVb5Oj99O8cVcvFws3sQX45+6xNjFvkEs7cEPP2DNoXQXJ1l
	AyYeNSwVwIDSCSqFF/BqOsYyLTKxIxw/vn5U3CsBdnhzvOHcXXpRa5Bcw0p9/Ttj8LC9b0VA=
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1707618785a.0.1793612803032;
        Mon, 02 Nov 2026 01:46:43 -0800 (PST)
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1707613985a.0.1793612802474;
        Mon, 02 Nov 2026 01:46:42 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe5006dsm362069166b.64.2026.11.02.01.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:46:41 -0800 (PST)
Message-ID: <798f1e79-1771-49b8-9d4d-705b013255e4@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:46:39 +0100
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
Subject: Re: [PATCH 2/3] iommu/qcom: Use identity default domains for the MSM
 GPU and display
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
 <20261031-msm-smmu-identity-v1-2-a2a70580eebd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-2-a2a70580eebd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xcSMqy3tSHPIVTaZEcEhv9G9jwc37_9Q
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae85c03 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=d7qithtI8vA-lzetqicA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: xcSMqy3tSHPIVTaZEcEhv9G9jwc37_9Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXzW6Mb/WvrVmO
 UEylzog3RaYHLz0mA36mGigkGhviMxUyvo8SKTSDIpYTcZNm5BI34lYTwbjnA5MZPAhGc4wpIeV
 R8lujE9Bs+Z+KqqbwOYj2uzcyhoKYzg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXxfUkhTRU7o6l
 dgSvWUDYIUYKrbeHbf9JzZCj+YeKz/BxjQnKO7vEcN077lpsNyjx/tjbq4oU1WRHKo2ZRscQmea
 38KmvC7AgWUvbCsWNlE/zIwkMZEjMynQyRZLrs5EZLrWxwRlXcXJJcabcUzvN/wwjqmkqabKzrd
 NaJgeCCgyf55/OfRc1d3mhfqtJ/73DH3UZoAS6AKylmBRjy4amCILdkU0+9JE7xp9vwo2sVlP8O
 yeerRPkXS4NBjUGUBYatm0E20z/Z2UvhCuTUhBdhB/eh7uYJevhG2DpcAzXXjvLV7ZeobFBmWqB
 4q3q69UW8zqWcGL/b8XLIR5u47vEO20xZ13rMipvp9XtvrDpWLjHq3qdW2KGPDHM9svCtJtmFHA
 EFtdWiBAixLMVcsoxwQEm3NDLoQ6eJMF31Vj5Ds4tNiGwy/cudB8HSSQV9x7FM6T+CmnUD/4qK7
 3U8hSqUQwHR8O9wgdgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038

On 10/30/26 11:04 PM, Dmitry Baryshkov wrote:
> drm/msm writes the addresses dma_map_sgtable() returns for the DRM
> device into its own page tables, so they have to be physical addresses,
> i.e. the device must not use iommu-dma. qcom_iommu has no
> def_domain_type, so the MDP5 and Adreno devices do get iommu-dma, the
> buffers end up mapped at IOVAs of the unused default domain and the
> db410c GPU fails to start.
> 
> Use identity default domains for these devices, as arm-smmu-qcom does.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
