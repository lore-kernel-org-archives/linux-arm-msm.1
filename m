Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660536;
	b=rmz2jTr4y79mlvMiYOtxJ29maD4BD0Ujf+oQ9Vy7T57fyu0sBgkVrdmcdLuogP1q/hQV
	 pTjrYyRtue9hwznWoL3peOXn3M8FJwqSpKz7xdkMjNSiKGG8Y4zecBE7/bBCzrZlArsRG
	 mM+YoYDQnYstT19P30+dxaz0QSnLyRTcQylegY3nAG5t/7hlT360XVfD+AeNlalJZlVQp
	 0JpSSR0a/ft352EWoLpqjdDSCpxE0/28N7+lhwUQbsGeZ0NVbAQq3sYtQ9OLv0BgebQUa
	 lLjtxvlXCLrykK3h2SHulkJ7gdriGxOcnWH/G17GgcUcgDq1GhtCK8o70Zcb1UrIxTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iGfmhnUO89/XXIIG4QfdwzlkeyF16djjoRswU6IDmwg=;
	b=gAoFvDWEwRb77zz9GCI4svSiGxmv+IBNAL7duFz2hmMCU5odl/ZsnY6xVsDwHyVwet5P
	 gvSYfaGB6IKbXTwkDoyJhW2X7I2AAJJoR9dLrZzFN/PE6rzJPltdds1RlcxNw21HRRtet
	 4SdFGRHWwlSQgCWHDToYg23t3CE16VaQnGvLzuwcMgoyWen85XCuFck9JwQpz+NZCXNIU
	 1Z2GW0gz6ez5cD4o0MPoBykwlpdFO9yPz6I9L3WtgkugMSdIae/DXZcPk2pzfyogyyxLu
	 j0Y14ejpPv3i5CH9879EAxqB2IoBM7HmWHpWxnNX/KJHXI82fENOaoGD38BpGcysvqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQic+qDc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gyCUDJVG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17007606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17007606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQic+qDc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gyCUDJVG
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8LnEZ3194723
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iGfmhnUO89/XXIIG4QfdwzlkeyF16djjoRswU6IDmwg=; b=SQic+qDcVSYCx/+t
	H4gIKSaUSwd5A9iKu66KtqA7hSgYZfs1XePZDC97brugiYunwOlFmceQ/UBeiFr5
	h1o8sFdbOEt1p04wMJDV+p+UJTSpuB4zHV94+gk8Ypjw5l4GGU3aSG6AX06x+Bha
	59lNHVCmJso+Mv760ima5l3Jrz/K3vkO3tEoy4HNdjxqEZHb9UBYRQol6i89Xc7s
	oQB0d+pz0F6ws962Gw1aJ/VewQO+fOvXg5ufDNEUG5/yadOuqpdcpUOa10PmbgUs
	o3pCAlJfAbVShV8snznUPUdwibtUDFqc3RkjDjxgo920JSpuHA3DPpfDe8uTbBJX
	lvfK9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq08f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:15:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f3960dca5so49056485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660534; x=1793265334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGfmhnUO89/XXIIG4QfdwzlkeyF16djjoRswU6IDmwg=;
        b=gyCUDJVGzTt1DZJsR/OWyvRBaNCp6hV32/AZ+DevdZx7B8yE2A06QaDeoT9kY0mUER
         m+r0qpN80hcpPSZNSdR5N7w71vAuPdrmEh5NiLxwMWTbu9Df3byfpqQIe/i4OlRUsl8o
         sFKBKVIyRjllbsiZXQ4R/Slim1STw1s9O3Xjg/mDGv3cTf0IjgLlnszjJbGuhsTdnGtA
         Pl7g412gZyQA5cMr8cr+IsEeRsFds8wKMbB4emwIsKCOkXomL14quRZenoOAJzewHGg7
         LhN2hLNUgnVQKhRqrrfckQxVqhzGPI+NdEneJJj8j6Gu6QQWRQDJDsV/k+qgVmRG7IGK
         s6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660534; x=1793265334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGfmhnUO89/XXIIG4QfdwzlkeyF16djjoRswU6IDmwg=;
        b=kWZs7WERl/qpMnl9rUNlLAu+D74rFdjiXbYg/VzJz8IbnyVnBF2SaaDTOUqCeZtmUo
         TAF8oATHH2sB8ZZDQjafV4uFs58aYeCQ0qZXSxJ013/+CAo/sCUYg7DbtxX5Wz2eGS+S
         x+9ShvkUY8XbR99DQvAM35LFvZ8QBYvlXBPmjQFWqONc0nb8ZhLbvuhVOEAEJOzYhXXG
         gcyuuL1qe2xxLbHZup2+d3TbOBAMShu+PvL/Ezys0RDYYC/FWmY+dZx+DxJQY3K/peEY
         FZAmPt1TfHb8NCjhzVdv/6dnq2X0xBYt0iB1F/TW7oUQberTJQRvBHGkzJg8pHTxd/Q3
         LqUw==
X-Gm-Message-State: AFq9FYLKVoIm8NRb0uCHfUwkBA80SvfvkymgvybfYPwxYGrwgZF949UG
	WDE1qIs9OJmVTCJQxXjENsuEFHfAGsbNzoWK/HgL8r918QNmDyn2f6jvwQgcV77tQPj7eATyW3+
	4WS8X3x0d5vXPcvhCFRmni9gFql3YXAim+vlX6d1eUJE9pIc/SsuH0qz78dtN2NgHBJoy
X-Gm-Gg: AYBFou1/5+5RGpr+JhwLn0iKLkBPN1+wB+iVTSrzIsNFetJfOWNj+fVA5sA/zJIqR/Z
	SmS3XLQjq1QTgMx6eXlt10WRtmYrKiPNgKbFOPi1nnrnevERN13hkLT3v60pq9V5EN5jmX2q9Md
	QYfiGgL6NDTJqRblMKn7K0cgxhWb3WvX9ru+8Q05cPYrfu0TPzP8d7Q78sIaJCQEiFRWGG5OXFq
	ZigEWabIdm66r/UBvBry5GlfXfIqehEF+q1MpATeEKAXz/fSmhTqJztNSr9O14apZC5DXewIZmO
	GeS951p634mMSXW53zXEesvAmSQ8ZmNSDEnWb6Qw77+dDFcSYKgn15qiu9zYXGLc6TW8TpMYzyZ
	PiPh/QWGNuZe2GQyXHA9cag==
X-Received: by 2002:a05:620a:2852:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f57fd982amr988228585a.5.1792660534422;
        Thu, 22 Oct 2026 02:15:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2852:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f57fd982amr988225985a.5.1792660533992;
        Thu, 22 Oct 2026 02:15:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a6182e8sm82796766b.81.2026.10.22.02.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:15:33 -0700 (PDT)
Message-ID: <560a1b2b-d7b5-4c7e-871c-f98d06cf088e@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:15:29 +0200
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
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: eliza: Add CQS SoM UFS variant
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
 <20260928-dts-qcom-eliza-add-ufs-variant-v3-4-9a2fdbf6baf2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-dts-qcom-eliza-add-ufs-variant-v3-4-9a2fdbf6baf2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mDJkPx60EwyVwcmDxqmhmsaXRnignsAF
X-Proofpoint-ORIG-GUID: mDJkPx60EwyVwcmDxqmhmsaXRnignsAF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX3CtY5fPMSY3I
 D/vZznmbT7tJFmK4EyXStcG/91m9E/XRFeBMaC5T2hDnAKU0tjh1z0eOtHrjCBZDOhpsqdtBwMv
 TlG52oorFl4kHGJVurpluMMwv7n5Lbg=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9d437 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=w59uCl-My_tAlYnkv8MA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXw03CVDv4MYM7
 fP9UiT9fg/qobZu6OkiwabTWfS2lsEYHZKobydpOjsFlO0FV0QevT41tA4urwskyUeSXD0/Y6dK
 R/D6Oui2iqgApJHl/brOCfUqyUP/mCtNecQdL7LdWJ4k0jRmBn+uTYxYwxE35cMllaPFlM1N940
 1qPGneFYpe4XVvACyZKeNAbRfrcfzgGKFeQL3Wcv0hZClWt0bkpO46fJYb523UytOGjNxOJeK74
 juM0jV+PQxM0xPMRx7hfKA347lhzvGoh5QWXl8cJQEUBPnPdNhJNJ0Atn65E3YS8eKn4fBX0Rrn
 WeJKhV8fruitylvjiSa91v4iHTWsdZozqdWhO2dm8R3zYbUNfOWSqpZ3jPkJvJ770bNn15uEcK1
 r3eWMUblWWPY9cG5ce4/NXdsqBhu2Moj4O2TJVCFAQRJ+91A3A8qoUxnHGaG3d6Pp7yOPI7Nj2f
 c93tZ/wOFXMhpGNPSTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 9/28/26 6:36 PM, Abel Vesa wrote:
> The UFS-equipped Eliza CQS SoM is not described by the existing eMMC
> variant. Its storage uses the UFS controller and PHY instead of SDHCI,
> and the vreg_l1d supply needs a 1.14-1.26 V constraint instead of 1.8 V.
> These differences are on the SoM; both variants use the same EVK carrier.
> 
> Describe the UFS controller, PHY supplies and reset GPIO in a dedicated
> SoM include, along with the variant-specific vreg_l1d voltage constraint.
> Include eliza-cqs-som.dtsi for the shared hardware so neither storage
> variant duplicates it or inherits the other's storage configuration.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
