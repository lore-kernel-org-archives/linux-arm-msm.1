Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009F237B003
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813709; cv=none; b=YnXXedzCph94H1PhPxhBCX3LnCmpvQoq5TEsE1CmyUQusGvUogV9HcfInSAePoHJvJ24MX7OvRrvz59MZ5H4EX4Tiz6eYuYRzpdriXiok5ClbniULGHDz84i9L9G/TqOFBSKEYnT8ojVvS0hLxuw48H68Nj2gIn5Gi/plAU+wTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813709; c=relaxed/simple;
	bh=hBuZaHp8TT2tPy9sHVBO0/9cnj9TiTeTGPgSlxqIMCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+NLAQ8RrXsdehdZHwxd+rxesfLLqIQA3u0NYAoxgST/d8brYrS1hrOaW0KEmjpYJhQ9YjW4uuYcWx7Ec3sJtnxrwoqhiiXQdq8kpK3cf4whcXfG8f9/ZaHh21avjZFifeAN6Dz+vXO15BQ3TuRvUQwS/TZlzGIrWiEqABjx3Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBHn8v96; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSy+atrh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBHn8v96";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSy+atrh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC01TL800982
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xRffrSm/hTCfqJYTTAkUvuKQGsX5x5h5c8d6nqDnnZA=; b=WBHn8v96BmySlV5J
	ZcckDIJSs30babgz5DeWI8UxO4Fbpnv9ogSFdB7qLcAIV3YB3+Ap7BlibnqkLD0g
	SjCknaWTgwahDtDy0tcBE6QI96oSdNq8/npREjQus2oK9wJfsFW7Yk5FQr/R1hyF
	YP2Axpl2uoRMABKagAvmxB7AE4sYl1/1u+L4hVOzwOp8Mh5YPXdrPhhOdvpqCP+f
	v7ck1UfANyawbtUZA77n3LjwRyP95n/qGTkJLsoyQtkLRy4IXCMDlMs10Kr4oR6E
	NnH25tD2zQ3Nkc3Tn/HYc+e/HWOYivMIHz8lU1JchAKhuhvVldh4fpVcNvqmNGqN
	E0wP4w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcs0rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:01:45 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5d873da8093so38128e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791813704; x=1792418504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xRffrSm/hTCfqJYTTAkUvuKQGsX5x5h5c8d6nqDnnZA=;
        b=kSy+atrhOAXTMXf0X4LXQHYu72SY4umpVLmkvBjwVUlmLyPxvI52K7WpmB4yKYa1z3
         3d5r1Pmjl+zILPIZVSY5mZKzVpfPBqraYhimOdfHvsz0Nd+Cfut+hPjtqeeVQ6zlzcxp
         uc+yA49erFnM87oxfyhETcN6vpMi6ePyTpAdwFtdUwU766SHK0kcj5fK/1cy4Q8gNyaL
         54VTtJo7c6EcJNxcwImBv7cYL2bQBSgZFT7EZrGAWpeq9K/dqq88fAncyvS5mtc73YCv
         lag+zcPL+qj60mBryReS9MCLl6dd8etknsBFLZAI66RSUAJjMEUxfOCyebSlAkIYmfEy
         5lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813704; x=1792418504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRffrSm/hTCfqJYTTAkUvuKQGsX5x5h5c8d6nqDnnZA=;
        b=gHZ7kKBBcnDugMDsKlj8EaynhAxHiuT9UefxUmPHoaPUTNwemc8u77o/uQ92/zCk1Z
         nL21cIEgHNTiviiUOSOwJbUvycdSWIfuV1RQh2vA0zVMcAvRtXp1c7AUYAvHfA3+oDJj
         gaEVESwEG2rxaTpXv8gyZwKZSkn+Y3ng8jsGVVFVgSuo9PDqLqI9A0T/us3E0boEzRFc
         4QXOgoAqLS8e6/M3CjYksQk/WlB03U7UlUZ9bJz+KKFOTrALWHFa12SjdQS1TLrTtluf
         Wzl1jzeP7clpgd+KMstkjHSp3r53rm3R6eUiL19iB5TJwCXEgmfWGemZL7wdc14wgq2o
         ViqA==
X-Gm-Message-State: AFq9FYKjp0/ksqHZn9MY/qsxoI3mOyu67z3il0bad/D3AJPXYHIfdNm5
	ExGlxMVnYAYcrtvwxM6UVTEWERJgKLk80RWvAxO8ek/G9k5gkX2ReaiIP8hyM/rG4VmQA/gMmsV
	uY6mKdJGBFqe1NtUzJJxerH6nuf2PQ2hl7luEJIo6XAKcu9vjZ1NxxqTpMsBSD/8+AV2C
X-Gm-Gg: AYBFou0Ne9uqSWuh6NGdDhZCFh7XcFZOsJb7Ig6i4OP41g/chGapo8aLgT1mTLHuNWW
	M5y9K+ZBuIkgr1gyt5sS9nBApZdeNZ0uLhI5m7GUuqydkGggVjW5ZeiMSOiupjxf8UmybBhYPdi
	gsH7bUwNhBxA/wIpHJj4g9wPg/hiD0yZ5aRBj2QGfKcQz0YyifnZnQ70o7BewtaXBA2eniMklbh
	OjUhBYqpGZNMhFGn0korvrhzFNxEir2ZZ7UO4NV8iu0Eyo3FnWpTgG3BU8Ja+myn3oc5gmDxXaD
	xw75mTk5qkqgHlv9ihAzR4eZlH0jOeclgp5+WbHAaYtvec5A0y/ECqPArPqqHGCHKmdOROeTj4V
	9rm556NNQXIchw2WcjiVg+Q==
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr1786232e0c.1.1791813703910;
        Mon, 12 Oct 2026 07:01:43 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr1786149e0c.1.1791813703157;
        Mon, 12 Oct 2026 07:01:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c338d5b170fsm237486266b.75.2026.10.12.07.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 07:01:42 -0700 (PDT)
Message-ID: <04672b02-cdf6-4719-a17c-4f7ce95a98b2@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:01:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] drm/msm/dp: Add support for DP controllers on
 Nord
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7Y20PCXrTTNFp_USIXRGiVIDz1-Msz9n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX37uJ9M5xiHfl
 p2c6MvV0salBmxrxspKu+PLstD16y7jI1rbehhGFKOoQr4kmUhRXdADg4AwDvXakV1oJSbSGNZj
 a0DUxXxapU5+IorvtKdqG8BBtH29MPc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX402ij2xtT5w5
 /ixpDE1HLBf+Cts0NNGEUwk6Itf0i8uk13pKdUYcbJrdK3N7FElTLrd3m6kJu2GG282ML7nY6Tz
 ZuAfaHcegjoq7LI9Do6tT2FZNCaqGsz8W1NwDWRbNEFS9B+SNifn5c9ZqTiLvIjVHuF7ge7I8Z8
 E4me5M+Ahhnp32zkYGJLyQ25ADAc+uO+ZAV/WJQjIsOMn5dKZxQNUpgpuTS8gir4MH2i38JsAqP
 +r84z05M2QHq3RMddkzLEOXDd+loK5yYcPNpIPapQaM1MOE2tZSlmA7Ob81wKwWiPM3ija3u09p
 mR59UeAJinL/JUwek0GP0Qq6ARDCNG+he2Jdin+kW4wudqqpZI4kRdI2WqqPjYr21cLx4tL92gK
 ITy8pZ3Ogx3+uOvhABkgOZllHCqknA==
X-Proofpoint-ORIG-GUID: 7Y20PCXrTTNFp_USIXRGiVIDz1-Msz9n
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acce849 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rMXm0_BZOgqvqhzNPSsA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120055

On 10/12/26 3:32 PM, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the Nord DP desc and compatible. Nord is supporting the
> four DP cotnrollers, two per MDSS instance.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
