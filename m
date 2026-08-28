Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFBE40E8C5
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924506; cv=none; b=DkhVnutm22sJFto7yIl6IoZpvbb1Fzh080qEYzF0QLAD9yohNqqM/s3o/5DTmvUpKOFkv4HnD1urdzt46NOPPVwujLOUvq2lQJC9Y9qTbfdFarEnTsQRmlPEoYD8D6naN0fMx3l8lEoY7vK38McVk/662SaNjoO0YaMWzc4XEFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924506; c=relaxed/simple;
	bh=Tb3pJwHKGH06SZSLA9DSDf2HFo5zXpd3gB1lmiQQeaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3C8P68Bjfn8S8DVbc6A8bUAzromHw/T9OZjRgYAx22PqsVz7jP1GsjeHGl199e8myKGNDD1SonG/q8tzNzopp8x7FsLHSyy0S9tJZK/D8cFSfqnfFmqMxI8Qu5y9RJ1XJb1SMFC9BlZBo1gBVztbvITlPiiQ5uL7yBX6TMwr8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QU5jOah0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DN3ePB1Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QU5jOah0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DN3ePB1Y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDRcre4188207
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Av2GI0kKVGDvUdYvVPRtWjATg8du110aFsEraqsTjQc=; b=QU5jOah0tIbDRAh9
	uKMO7sI2LGk/1nA6KVynwGLUfLa89QdMeivfuF5PAOLNEUU7m2QBcRD+a9vPeKKz
	PIoC3D0Qp2iRBvAk367XPFf2D/YgbkjOtntPv4OuKeMNvO2CSDV+D7Nk94wURLdj
	owAzcgLxB7hrK28/LwFB3U6TndPnrbLOXFCQB47yXPbJxbr8xmKvz8yQ02VKYMVi
	xVtfh4Ww2H1TApkZlTdZsiezi+GV0eBgYFNl2u8JX/J96kB+bp6WNrAs9OIVJxLO
	tmdRm3iQXokwsntg9kfBr82NQQgrHRQwG51jxe6UiyiUvwupzTHxu/R8b0cF8ez7
	qzv+CQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb8afgqx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:41:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93495488976so29328185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 06:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787924503; x=1788529303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Av2GI0kKVGDvUdYvVPRtWjATg8du110aFsEraqsTjQc=;
        b=DN3ePB1YpxitR6G3xIFIG+Wz2R65LXQTQi0gixewKmU/JPGhSqMRjO/F3H0q1/kVTQ
         6lYnUQLTRpf2/FLhuaKDC1jkJBV0w6Gn5u66H3lIMUNvTTVNAsEcxmmw/ajR4yDuTqeg
         TwwQFClkyPlZDX4lMGMZsoZYVc910zB8ST0n0YPQHf4Ss2vmhFLxQZ/Uz0TlYBwQWBNk
         NdH5W6i8hJKkSTJOnaJXXsMK2mBdcY1obM9qp2gPHn8igYxau7G7bYgsC9mIWbYoFPvb
         9MGjqFdOrlY8o28Cr1OTMZIMCHATW7JGYbjhOrfiFstaePdTThWuwrtbHlSJJv1vyieW
         8b1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924503; x=1788529303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Av2GI0kKVGDvUdYvVPRtWjATg8du110aFsEraqsTjQc=;
        b=rkX1VVbcED6BsmGYrKht8J9OpK6RhIC8vp3FHPq+viQ/LI0u4XjjoQ+sy6NdiQ9nPs
         V8MGDQSJiRD2+hMXUs4pkSXUKcfEPEp99U64QsNL75Oxu7Yj4sjrZlOxw/K8/QH/Ae3s
         +gk1jgBS+y1pv7RLcolO42BO/E3P7fYHi3ZJU1uvofbHYaFfVlmVWv1LDPvSDtigXKaO
         7epHR6jgocREMa9YVvouhwjBZI/TrclN/IKFupj04ZJvmZCJInqvkxqwS/JYQj7sptUf
         H0WuHyXe/wYLm1vwYzdUQlBkgLzzY9tIW6VYKMRsav0WNG3tADLrZyKezN+H3164dv+h
         o1Ag==
X-Gm-Message-State: AFuF++lmBE7XynYRIePtV+R1b068qgZYzy3xAYQ3hlUV40vjlmnzKnm7
	mJ9z5lViEqep1bIrlrrym4mJvH4v2VzbDsOK3BpYTlORaIlvzsoXmTd1IbDcd8r4IAD4NQdGOgS
	mV65U53etGUViz/sGLLkyP5JeWyIzNvIZzjUZmkfucZouGyQ8QWeBk/7vwqaD5bdSGZe1
X-Gm-Gg: AR+sD12BhlV8n35MPsOBhzQwFAUU1n5ZED2vRfc2yOj1B4UMWdR6mwPnQZ3OGZ4nZyv
	tpeFmZkr8fnpxIA8Lq3MGHUScbh5MtLQnoDnCwBs4Y6YM9UCSSJ+1HDV/07mzpU7dhW4CMJFS96
	PfISPHqqJO1WEtotEdICatGTW5dpXg2tO7qG8h6j8Rh5dN4UXqN451DlvvNVoE8xKT9ySdmNkZ2
	Ou/Y12wcTdfI1OvpYd+V4dnvG1EHzSn8NY6f14lDvgekOjo1Vgn4NNI5PqKpMsHTYjqITzLsnml
	i0DibcTD9mNA/TCpaUzrSUZJ1fmSgBXSYPRxwPciojtx5iad7MvqUMBar77mNanEuVlvY3ifLrX
	6+tuLw/WbejUCniR6SMZ/q88=
X-Received: by 2002:a05:620a:2950:b0:92e:601b:8d43 with SMTP id af79cd13be357-939137aa4f3mr480003185a.1.1787924502644;
        Fri, 28 Aug 2026 06:41:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2950:b0:92e:601b:8d43 with SMTP id af79cd13be357-939137aa4f3mr479992085a.1.1787924501825;
        Fri, 28 Aug 2026 06:41:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fa3ddsm81168766b.45.2026.08.28.06.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:41:41 -0700 (PDT)
Message-ID: <c27beaef-05aa-4963-bf6e-ff6df08c6110@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:41:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bEH6XEsaTZ7Ug1SKKBRdcNOvfEvJ-2rP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfX82t/eR3onJFv
 qAwkLJLoOUjaVMb6yqElBFyzCfyZ5n5DZVv1QFhJ6P7IBu7yRh2xoVkjwF+kcXP9czus4iak9B8
 7yNA6NfKCfiuGaS4W64aLD95b7jMRxU=
X-Authority-Analysis: v=2.4 cv=IPoyzAvG c=1 sm=1 tr=0 ts=6a919017 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfX14u9Ke0ezCsF
 YG4WyX5S8V6dvAcjX5jXqwdctIVev89A9AYmmEpqXPs1VIS9mGJwKp7Np8SRSmKF79L6E/GrRN9
 t4grEjMiSemvc6ZFWOCarHbKMiZjvhdp7x9K4mt1eVKbQLsM+JDelGahpRDcqQimokFGskxyLJx
 CRRNuNMHcHgv7ezNIYMRM0nxml4SReEayyLD1QkypZX40nVIR216o6lpH1DBG0CyvvsDEtKBv81
 eiJc0wwI4AsZHJg2ym3do0gNDVvwuFQLTd6nTYk7FxhN5XyaXqy6qDidn/8k6u0Z7VddWRuPpyR
 r7WkWkM5vbvZJebrQOI1XI0enSbRdu/GBFceYVQBqpEXx+Lt2b8tKqYSNGSs6D291kTcP4pfMOn
 bY0++bxQw0lXIGBIIaDbHr0ucWkpfjgpfBRHIQNUzdbe2rGHy/ATikkpho1QTdIWqlfUGY//a8z
 RrMp0rsnSc06DndAe2g==
X-Proofpoint-ORIG-GUID: bEH6XEsaTZ7Ug1SKKBRdcNOvfEvJ-2rP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280118

On 8/9/26 2:29 PM, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in monaco.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 115°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Reviewed-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
