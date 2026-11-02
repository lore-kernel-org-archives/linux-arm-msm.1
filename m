Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613180;
	b=Ym3om1gJssRL9tsHSjDo3ciBRUGCsYqTbCCb5DKFniArNZKalO3pLlz+CZSvXIU6OJpR
	 RvsRA3JbSaWfh9U2YOdyhTLMtdd2dbCGSbJqjyIwks41RnhmDRKwU1vVFhYgY+BmwF7DM
	 +c+24H7GUMuw6jvaN4Zt/qp/r2phar0EXRZ4rk8QR/A6eCbTZEiF4x67A+u4mEBw6C4Ye
	 A+BOcD/JcPpMRNpDdggf4ZD7Qekze6HnkR2bmPPfwktkANLFzenm4m1tWcH26cL5JnG4D
	 Sf5mfvBEdgeixRIhMVdacCfVAQ0b7EL0rX2rvF1tStegM/mjR88BDweeQT98leAAnbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613180;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qqXNNfzdWTFLDTehhgM1nsK5dgUJIXqhK2tNP6C3EqU=;
	b=UoOGU36iZGkQgQ8lRyBtc3A61UWUeWAbWNTPoj9EZ+yLHixzofRyaFDLWy8G7a9b3rc8
	 lkT1MwSng3wgXtVv8kLb+xTicQKRBm8YfsRvRzrTu/P3M5riivVLKPUdFW4XuCoM1jyY3
	 9GdJjXJqDtVmdATRLimYfusWp0OBS8pNf+e4dWTm8IorcOANWUmujM6rOixKI7MD9zJVL
	 3NoKjtcpijtYX0UGAR+kKL3jJMUJUpHVEFkMpngeOV0mVBrOrwBp4PGx5Te+Pcs3eOBh7
	 otsZabV0uc0qNzf7bf77hRJihbtWU4GFrcWPrsR4dIGBB78p3A7YkhCemzauM43OshQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A0jxRsf6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aHdrYW5D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B92606A337
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B92606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A0jxRsf6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aHdrYW5D
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AQ7e2361163
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qqXNNfzdWTFLDTehhgM1nsK5dgUJIXqhK2tNP6C3EqU=; b=A0jxRsf6GUjEBSyj
	NvAXNYXryBlm8tFkVuBHt0ZA/6r9VkWTV0G5oSYAf/GxFxVWMgZ9wkX2L4GU/09R
	FgcDx2rijX+Q1e4woKw/gN1AuBGu59l2RHrGzUdAmii27pmHlDg5yIImySEo1eKo
	yIeKqdwlbRKi/7JERV2o7QsJj2OAc58hR80VpuqV4kVxZDIZsqHLbpXxBLAP7E4u
	jAMWET0satj3a5D4U4+jaSGia/RtNpU/0QuTFYQEtxY8aHZN4XxUanzRL4rQPk8j
	K3/Oa2IpiYFHqfp/KZXf4nPXBK8nJQm5BmC0a5XJn/rk9IU67Jurew09TnPA8P2p
	fee9mg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7x8jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:52:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c7fe5576bso20010686d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793613178; x=1794217978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqXNNfzdWTFLDTehhgM1nsK5dgUJIXqhK2tNP6C3EqU=;
        b=aHdrYW5D1PORcOd5lteVvXAsuMA5wKMpCIGPbgtBdTF+GB6MSdunrzvH5kI9czKiVm
         2R2Vdv1l4JnqDIP/xsceF8XfRoN/3daJc54/dxYGRVlfYkMjuYZhVfTzlewUueyJ2jcm
         LJEDMn15hlI0aLIr7XtXkM5musL9vco3StxdlyE1lttkL8dYdLrMr3zihXqmeWi2q+Zt
         jIuNql78skhcXhSyC8h2GMVvBmNivaY7mRvy/AvgSLmNXrBO18A1Jxz5EwSHdBzFj5iU
         lpJLxZ4+ByupT1569/8KGllq2MHp3a7rPIUjfQ6zlMQ4InCZSoyhkUS7ZpbRikt8ezMu
         TuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613178; x=1794217978;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqXNNfzdWTFLDTehhgM1nsK5dgUJIXqhK2tNP6C3EqU=;
        b=fpiOpOPDQWXSAgnWL5gr5kh1uha9WKJ63x4C2AaIjf3wUhcqlmjUVirgDKRnZANHfV
         Mh3RqKIanUxyc31w9tU/IWqRc5N4lRo0+grPjxh7qy3OfnH6U+Nry1WlqeN1zr9qkjul
         11gitQAGFW5UWN/cwfnN4MeQvAvbLzJ2jaBQF2ZDklkSHSB/l8le3Lofe3EHZsMy/Z63
         6qB2AFvceWVErIRUSQ6Qzm+iSp1ZCJ9wg8JGnLGKxBdcI2lKCniF1QlE0Ib3exOX30m9
         hQfSEyI7Po2yodk8DcawFJnBEVo59R8AGJWOgH38nMjXMstKihjUGHtAi0/GSC0kbPC3
         S89g==
X-Forwarded-Encrypted: i=1; AKwUvBx56EPllSHxUv+ykVJj4XzoCFut6xcUUebtt95DxYYIJM2B7x97hmwF4Xq7tg9ea3e9RLcqLT5yTL6wIv25@vger.kernel.org
X-Gm-Message-State: AFq9FYJU8H/5iiOOX5jtJEK8JjgH6FwYxbZamZZwcvXgTTeuQ6pcXoxF
	KU5fFGEYrbdeDsiDqddJ8PusjmwMf0aQNHdnAHF4DTvZr1a+zBImIhLv99qaz/ksEDrs+7adByU
	kTJghUvtGcx0HrVP8bMk9GaImpqNLZgEtJcSRrId0LxCos3HG3L3/NrrOlcCRbnD6Fhlz
X-Gm-Gg: AYBFou1NrpkGl6uJ/85MbCWhr6aJb8o2tlkVhZZrkJ0wPXOXwYAa0OpMuhAgGmTPsDP
	XZSRt7ZyAhRLleGk+jMmN3kieahRpb/Ym9CdgB04ZFJAEwyTb48C0zwNS6C3hy4GygOn8KA+Zdv
	eeZCdmerVPflCEbGzlVPO17jZxu699T0rpppVM6euKfw6CVtxkP9e0//aLggy8uHbAt3c9Ut+jP
	d0+DB6ggkjNALrxyMCkVrtm/qMqsVcvgvanKpe9OFv4ZF6aaLjY077A/mUNI0YjR16LrajX7uoW
	RAci/uuE73Ah5e5wFiujG4QCXWTo6p9fO8mMsAKiM8W1v7tOud0bFcS4EyMjfEVRWvyy0h07NdH
	NxgBHfN9OBrAbVjnF1GmuNg78AAdZsUQmrmEa+X4EG0l/JxWnGI2IeuheU3XW3gVcBoCfaQ4=
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr1483716885a.4.1793613178224;
        Mon, 02 Nov 2026 01:52:58 -0800 (PST)
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr1483714285a.4.1793613177588;
        Mon, 02 Nov 2026 01:52:57 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc18ec5sm364558866b.12.2026.11.02.01.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:52:56 -0800 (PST)
Message-ID: <c8810f27-8a44-4ac0-9c93-274894eced61@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:52:54 +0100
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
Subject: Re: [PATCH 1/3] iommu/qcom: Invalidate the TLB in flush_iotlb_all
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
 <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-1-a2a70580eebd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8_dsNvhn0LjE2uPJ3Tts4_R2e2nShL1g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfX4IWBp/XL35UQ
 NZ14Etx4lEVsE91PH3dXr5ht8Ys2pURPeLRWrPb1mh74VRd2aJm5T5NTNmiCiFLM9PnwzDs8RuB
 QaPI5WPQcbJ3K7xduqm2AGLv3gGLook=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOSBTYWx0ZWRfXwNkXRtsrR4/I
 riWHp0Fk13R0iNlu8Y2Z356vcA1kt1fILtvilFriFzzMUzBo6IHZo2l/rJ5MGEQyKiqhm8b79su
 tCjf2ZhbKl4dSnVlzJ5TlI32j++/ePYZ3zzCoLirpG9hPILAQX0BflbFNvmhIZnacoHzgvquVSt
 380cQR8md5kt4/e+eIP1Tpunp2JlN/vdC9y1zXAgq9KP6liFP5myGSykddAcSM3qe2ZENuXvlL1
 gG3uk8MvHhBVXSR81skdyljqK5WY0IL0aasIx/AU6Pn4Ud/q98sl1riKn+3EV/SJLBHN+WtzSZn
 BJTul21v2kQXWr6NopVt5DpYqdralAFHt/JwWxn74qYh+waOM2CRP6aHUfLe6sHkbR8ilp9JkGG
 96ZCTdFv2jPbY9PS+PI/JZBz599T5RjZW05lGy+zNZ5pVPhcvAIugYdgLVVhOmg0IwP6xxETXjf
 8cVBJDWdEhj5MRnANSA==
X-Proofpoint-GUID: 8_dsNvhn0LjE2uPJ3Tts4_R2e2nShL1g
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae85d7a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=1ACtxsPTqu74CH8WC9UA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020039

On 10/30/26 11:04 PM, Dmitry Baryshkov wrote:
> qcom_iommu_flush_iotlb_all() only waits for a TLB sync and never
> invalidates anything. iommu_unmap() users do not notice, since
> io-pgtable invalidates each page through the gather, but drm/msm unmaps
> with a NULL gather and relies on flush_iotlb_all. On db410c the GPU then
> hangs on stale TLB entries as soon as another process reuses the IOVAs.
> 
> Invalidate the whole context, as arm-smmu does, and keep iotlb_sync a
> plain sync.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
