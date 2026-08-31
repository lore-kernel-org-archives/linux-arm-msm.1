Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84BC49502A
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193679; cv=none; b=tJiR9t+eDSE7fbM9Yql8BxpyZ6v8eag2fuKxTejLN54E6H38d85zUQJcAcJOuIw4zFGfDeYrEVM/Y1BTcTA1plNAjBSVI7NzUyJK2S3nOsVSMjTTbOwPIuQyiGVQUAHq/1/7R3uxBrrsLcNnf+Z4JLzgbHRr5um3fwexoY7UWqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193679; c=relaxed/simple;
	bh=rhAJXL/NKkli+Ix8F7UvkfRU46UJwkacUKhnytEydKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nZZprBdq3cysXoT3UfHkGU275E8vIzZogCgw+/XHuH8L8DS+xPC9Ajgy4vRjut5D0CxjBB49S1kJW8Bd+lta3eqaGE4e68hdGSNJQm2ADOHX6FtZ5D7Qq7Qmssjm6CK0tYE8kwxEDHqFPjOhIMvSU9tmNKZCA0psVWxrEmlcNgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VO4zeFzR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VuZMjrtn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VO4zeFzR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VuZMjrtn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFqwCi3524348
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3WNpN+Vr63EvamqdAdbzpzLee0raToScEoKCwQyIt1U=; b=VO4zeFzRcZaWm1Mn
	R9NqSGNXDFXRw8Bd6dGNjLdzXb11WYFfawFWyWgRiuwsNM+Bfs7FqOI/SGYZgsaY
	jU2610ckV46mPKQNVi1TDFHLc4Ev27KiFDCXso1+Efp2ZJpAAlzZQAcoOTQ8Kse/
	znAkAcoIX6Q7q2XIc6duVKeF11XZH2NbNT9Fug13TGRP2Wr2LvvawWnfLynyeebE
	5cFOvO/eVqhniN5Nq00gJTjtYoXAS7ttBz4LGz+JDxX0fEDQEiMd7XhkWDhCIgtH
	r9vSHveg74VQFbOvYn6m5Ow89K6CizzgMimrctm8yh/9+f+wf5quFH1tx/KrNYH0
	ijqGsQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd556tbf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:27:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso69055685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788193674; x=1788798474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WNpN+Vr63EvamqdAdbzpzLee0raToScEoKCwQyIt1U=;
        b=VuZMjrtnFjMoO/vBlTuCB4PpkeSO+y69RlsXTnsyyIOZrq/QveMmOKqprpZMohMhk1
         0yOgnwD70cbg/qyv2DbQSfz7DMItN5Nbo4n3wxoW7n/SdQ/QulAbqfAh05ms0hXWm+Km
         fNvNqoYOqpF5MCIETxDJ8+3ZQw9a8eKlhhtu4nqWH7ZPrYVrLJBCiVaarvnpUOWrRdkf
         1lnib/qrApfv2Hm/kn2TtqUMY6HE1DiC79PrTTREY1AhrGVyPO6no5igX84nkANoXCNY
         RGQocfwfCtnX+AJPQUJQbquMEEZQZCfIj7X8v37Dc0ImsS5IFZwA8vg1SKQICqi7TRLv
         fySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193674; x=1788798474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WNpN+Vr63EvamqdAdbzpzLee0raToScEoKCwQyIt1U=;
        b=jGQM+vRS7NsCZZftlUZXigGHN94KH8y58FTEnMzunR+mdnpUprMlIA4ve0AQseHffh
         VAKVhi1iVDduPsedMApleIF9oXwmniYC/PlDO7W82kokShNKtcVEvR/F9tzHBb4CBX0c
         gcO/gEhzNyOlZdqbQNsfVye/NR3tqAGup65TwKXuUAz4sDbiTGHN4R+FeyBVt3LCWxmW
         y5DjnXbKnkClom0Z3075rlPjXCZu7ZeKORjHHNFRo1Wt8NLhEey0wceAkM/rgi0bjxVD
         S+Inx7dcSk+vtlg3Vm31kYvvPJUFgYXoG/HFetWeOyLnlrbQS4HGHQtfIrer7dUMBgih
         +TGw==
X-Gm-Message-State: AFuF++lTPAUEJ9chH+1dx7ztrxsZzAm8SNZbf6h6pBAdHEQWD8/2zMD/
	ABPUiO5i60+x8GYD1/LPvaKTHdIZ5weU7LioTOuws/zGky0xrjCAmeV1hTvS/yM1bYAfbUs9TDg
	EYQQfMuE1Zdil+d27XUoTVfkiOTAWTlCCdqOp+ob0PcXoT7QDbrz7lM4NoGTzAjOKVb6T
X-Gm-Gg: AR+sD12oPSwOaK+Y4gTm8Umv2DHxFC7Vi5xDwJ0UeZnQTZ4bQib6lJ90U0fGgH/3S5q
	4R+SCtIOHYp9fQwZ7cKZRe4BhMDlkX6rAuQFL+gxXd8b5bUvbeNZkKBwEsLPb8ZZGvZmCq/5T5z
	giK32Aos9fBuwgk/pm3A9h/+N2bxIkSRDDCRelfXxDeaa8yyAuZb+rAowazCSlX+SUnJZsVv0wN
	zVXY+Fk/gq+Ox32hBNTfqcsCBm8g9bV2viAvWyHWp1n7/I3flRB1Dau7dvfGzsTCxMn4KiHPcNl
	2CQyw32TRUu1seVbvvsjXvfNC+S77+wbMu0VV/P77WgwetMtHjmjZWCKRXDfyrQdTpDSq7MgHr9
	vTVUNWa4w4YQxYH3U2ORNXw==
X-Received: by 2002:a05:620a:450c:b0:939:8bc:8826 with SMTP id af79cd13be357-9393fcf48f6mr349884085a.2.1788193668966;
        Mon, 31 Aug 2026 09:27:48 -0700 (PDT)
X-Received: by 2002:a05:620a:450c:b0:939:8bc:8826 with SMTP id af79cd13be357-9393fcf48f6mr349878085a.2.1788193668312;
        Mon, 31 Aug 2026 09:27:48 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255eacf6bbsm450982866b.0.2026.08.31.09.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 09:27:47 -0700 (PDT)
Message-ID: <d4c8a4ee-2a6e-4644-84b3-bb5600836d8b@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:27:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 01/12] drm/msm/hdmi_bridge: Drop
 redundant initialization in msm_hdmi_bridge_init()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-phy@lists.infradead.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-1-67843277de17@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-1-67843277de17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0MiBTYWx0ZWRfX/GM2A/msfyup
 VmAhThnRXAarqZ7A0P+1EeFChoErG1sLXtXk+T8jhSPb7+fOTtwbcKIirLywtYBAj41lru3xxqY
 l/4pt6y4xCXMiZJI8Y2yNesbW/K9f98=
X-Authority-Analysis: v=2.4 cv=O7sJeh9W c=1 sm=1 tr=0 ts=6a95ab8c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=P84uMFOcKlMy4IiKK0cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: XP0noXBH1RRqqHqzHQEu7DTGLyb5RxjC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0MiBTYWx0ZWRfX3yYP5LgOKxTm
 KcTYu4gNmN4mlikF8sJbSW1K9avo0nIUVtXMfKkd3XpIGao+YI5+zvJ5GZkmyd6Z6G96IQMN0eW
 Un8sTy84t/XV8OYZPLQS7QnTzR2K9uBAdlQcRNmsaK4ky6KAfyl89vLCiYQLtQXZ50ymUNNlhLg
 9XaV6ZESEFXj0wYwJUVqcHIKCTybn+KDBT55nh31XpDkMMOOr7dOzjIq+/DwzKpDrFHIDTAmgOI
 9HV4TSEG9CVjobfaU1LkqKTeVeET5zgyCVRr40GunIjXZhYQISk4UY3BzTYN+VbPjWbu8SGt5gJ
 NC/HFz1riSZ9KbmB25294M3PHCoB0EVXWtXl7kvmARjngDBg5hkQP6vkfMR4bM+SJjJhY7o0iAr
 PGzlPysBc28pYj4QkDc9853WWld+rFEQnXui70S2mYts84eCGZLaI9Es6waN1gj1OMrdv7EmWdV
 aqw8EZVPxwb+p5u/1Tg==
X-Proofpoint-GUID: XP0noXBH1RRqqHqzHQEu7DTGLyb5RxjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310142

On 8/28/26 4:04 PM, Krzysztof Kozlowski wrote:
> Local 'struct drm_bridge *bridge' variable is assigned in ~13th line of
> the function, before any first use, thus explicit NULL initialization is
> not necessary.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
