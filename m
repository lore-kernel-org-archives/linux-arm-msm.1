Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51354A4411
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820270; cv=none; b=NrVatEterNHL652pihS9vv+idt9vJcMuXYpVTTHhIJx3qXixhVXuc+N97K2cvDcRX/PV0HsAtMqjB/rfUnpgk/d1Ud3Nak3djxtDf1nOd5INVTkwKLPX9eibyT3AjkmdP/bw/lkqRw+1gxXyTfyL3ewc3i+z0LJK44fG4hKVLRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820270; c=relaxed/simple;
	bh=s/Mbf0x0sIgUm6VG+i/AMdI84Hw7nY61I9jfRK0CkHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m3iQifXK4X7zLHxSJOOTEvrdyr+710W7stnMMrgfvC1FnnpjSsoUVBk+u7gs4NdP0RdKm5YN25Us1oS3jt6xBTKgj/yfkDR7qTI5GVYjvrQhMdMmFtR1nqBKYJrunstAo2oCepnjkk9y6cP859vnFVay69/2tY/+Wo+3btMZBEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkcLK1F0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8B/KrnB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkcLK1F0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8B/KrnB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFerDb3272293
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=; b=XkcLK1F0i/Myekyd
	nGFhkk8BmO1bbcY80BKEqctlWEV7QfwzKS1a2AnxQK7bgC0Q/0LbSLGy9mgwhZgN
	1OcnssFKD7l/i+9hCrqF5ZXM1/S8u/KiCufxmh+SDFtkUxijGINZSZLDzzq1mmrg
	fBfGSP/t8awp+teyHKZyQ/x0QOnfuzIfPTEevCuZjRVQOCHl0dXgT0OTiO3dZlwc
	bT2x7GzwMAbF8gQApTPqQwwOEGXvC0TrIXouFtyjnHdrXKfbCOpDivYIjJu2bJiU
	hZe6/sukuUGdWFYJEOJ8CyS+ej9a5aqdluDH8/hRsktlXhUFXVb+d70zkB1tiE07
	u3HilA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffhfw4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:51:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53389750985so3895931cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820268; x=1792425068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=d8B/KrnByBVn5yV1zSTqIQ7p8amONCliF9kuGDVDNdAVsO+1+P1xXCGw8Ipr2CYXb9
         SdfQ7U4kK+zOmfkj7bGu2fvlKZFNbJG6DFFnyfBb6q0YnOur1nq6726Q99iiVaMI2/2u
         6cTMLdQiszUVlAFuqWqbWQG7lqh68RQauNbwu2oeAByMuD56GNx7RayzMkb7Rk0UbV2w
         a1lsjp0ldaIcv/Ql6A9AOcXOdHHaD3PeBCoNcvU8jrAp72j3kyaZ2aptjMmw5l9JgKaM
         /gH3JVH9M8Flg15epi6qvL/1nelBHtmz7L36mx1cd9t4WqpsJr/QiAm3CrZEQaoNTVbR
         fVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820268; x=1792425068;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=oycDMnTvL41OEODZZvCrvqNr5JHYVd4rCZIRcCrjBz5Eqmn3Qe9RR0/mH/gZb0PQlF
         Vc0laE3ZtCy5KiI1Pexr2qpYDFtyqYvZjUD8X7+QYVh9dSYhujvqcbn/VbTb1D7jwp0g
         w0AGD9jJzIvXPyCMQbDdza6mMF8fjpYFitse+oZTKOIkO36tJ94Lh+VaLj/1Aeq+s/YR
         jFzF7cpHB1lp6fk+zzfRG3pRJsHYp8jXykKQ60WLivVWYSTitZ7WkXnaestBfmSiwNuG
         dj/xfTuq93bB2adIjYaKisI5uLL0SST7yTbhoMHPj6Ko+XMKE/SYd1xN7ByWOevlA6k9
         kCzA==
X-Forwarded-Encrypted: i=1; AKwUvBz+FbuFARtEHBSqdLosRf++IFMBYJT8nEpUFnjNBdnD3d8HScAa9XE/BL86LohWXhcBAK8/IbeD+r1QM0u2@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3F7VW3DYeWIVPu37S9Sl6EmM+CrWdI5O+op8B/tNQNNxPsnos
	QgZtEKpW/MKpmfT+DA3dY832COyrskM2VlvmU7WlQAn2YGWDJVWr5FD5C4fkxLz7f6tFFf9fiY4
	++iAcUR6qU5zBy+XY7ix7nbBBFpcON/ILkqIfx9QAM74UsMImuFFUbbpMr282XrF6efHq
X-Gm-Gg: AYBFou3qZ1iTQUiNoi6v0P6v1KXFAu6DHiYMOh2Tm2jSfnQ0DfRd+N6zPXcTLk+J48v
	+ZDh1RoO28piVYoesXUYEdiwx6RJyEcR2kuG0rU08+jHKne9j9cikWA1zWCcMYNgN4nd0e6Y6mj
	XJHmw6UTT7LUxXBnk0+Pjsp4gzCDw7kc+Ty/1QQcswlcMGBoaL8z1OXOLG/jX2s0ORp427+0rOF
	7vEs3BBNCV8sKtqlDhBA2MVSwxTF16yPEAf6ZL+c6XqRBWyAzU8lQDUHBB+pNupweKfFU6jSbeC
	X4zc9zuBC7UU5KZeQrvC552LteezmWNeyES7gNGT+QgJ5sLKA3CQraMKNiZiJ4I3PiO/eThVDfo
	VhVipCe4qkv1ymT672lSLtA==
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr1901852585a.5.1791820268041;
        Mon, 12 Oct 2026 08:51:08 -0700 (PDT)
X-Received: by 2002:a05:620a:3725:b0:939:94c4:b799 with SMTP id af79cd13be357-93ebd25945cmr1901846685a.5.1791820267608;
        Mon, 12 Oct 2026 08:51:07 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1b3387932sm2043906a12.12.2026.10.12.08.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:51:06 -0700 (PDT)
Message-ID: <5f30e6bd-3547-44d9-96d4-80acd65d5e7d@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:51:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/38] arm: dts: qcom: msm8974: Align multiple property
 data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <ecfee840a4884f277a73924d9da6831b85269e26.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ecfee840a4884f277a73924d9da6831b85269e26.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX+PWbDab/3LQE
 lU3mJCWOiVVeCsCSHgRzlIcQ9Qvydvg8GzgRFNjEKuxc4MpU3lYil9JurcKWFPQCV/5BqjCnylL
 f4j7iJHQJRaDeH58WlfC9pRoCtrNY4y0aCA0EqPMZsVN2+JBfXn6EOsj+IP740XgUq9j9hJyBiw
 Gb2HaE41Z4fwUbGARdLduMGFyDrsuCxFVbJLZeSaTN7iPByEOxlIhE9yUJ4GbY2hpc7cqufJ4Km
 Gv9W0ilvc1KNMtJ54bB47YlL8pLLZ2u1r4VUMxPM3t0mdI5J8OLbFVZDW8yEvlUoHCEzzvpl5L/
 838k6GrOFnNXkhz4eMW2FGNVwb1c/rpKn8uGzzkYRMGIg/quXmRnnOEBBTxV8GeoNYWmFrQcPbU
 /YgKO3EHLeu6yLOTN4ronNCLzVfzPi9n0qv981rQDv7ZRcbiOaKxKzCi9JxQFAerkfBA3AVkzqG
 P6gIXJr4pcowZJWN/pg==
X-Proofpoint-GUID: BvVrwfF-fV59CQOGyIjwhQY6UOO4dXPl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfXzsWI4KMR1547
 TXjFV8vk1EpSziJjDnzh5Z8VXu9Vdvbdj+MZ7lwo0W1pllL6aTGWg1fMog9r0ugI0xq9tKBViTH
 pOlbu5Wlzs3dBM4dSF9cRmyG5FfMYYM=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6acd01ec cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Bz_mBq91WImKixDMOFkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: BvVrwfF-fV59CQOGyIjwhQY6UOO4dXPl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first
> one. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
