Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EE7374756
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194635; cv=none; b=fILkQNXk+fKSY2jDqJCRa1ficZ7BIJOBDtBq1L7ob8sbPRNOQ6D8Hy0dyGlQTjqLCQdwDYkAVVe/XPnSK4T5hSdb2P7qJdlZyz9XC9h3eR7y5+5cr5j9R3YOcpanwRK5c1faallytKwZz46CBsMIfvE2EXKppHmwXK+s0/FGeYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194635; c=relaxed/simple;
	bh=NDHKMcrotrpW63l0I/1FWliwQz5j8JzXrdP6dzyb4x8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BOu5AsUhTuPV+uZWW9N0nIQ4FAQ2H9nVPcaHlQwa9fMpr7FvSuQ8j/NFub+Y4VHhYhmVhpDTXX3dBA1UNEg4FEA54hSaXF0knJwPolSykaO2+G64KR6qz0oR+XdE2YnW9cyRvsiCeJk1gh0BO/Cdd8BwdZ9vbaCUojnmaDyxKzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=er3aqxC8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MjOVOs22; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="er3aqxC8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MjOVOs22"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFpZI5037016
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cVfCCX/QbLHdAwzzCna+Dt34SELB9Z4yDIidd7xilm4=; b=er3aqxC8PVHtCYzV
	L4jlvAHk+obCR5qbz7Y0Ad2XJSb+WD+CHraBf5cnTLZsrtYLwExozv2sslWJgNoX
	DWuKWlJBMFLG80/GsnBAL/ESRCF9MafyALmedoTfs2rSnAzmnbGLgyXBmeoH3rM5
	yEiwdVTq4ACOJUUqooef9R7YtHdYRpEVj9sXQXEdTFMlvKHeM7vKqAONyEFoRS5/
	gTB6rrTkKFtu+0mK+XpGDQ54vztxgA34oJryU4ygCmlTSgPJtIRU7uRCGM8M8yA+
	KI1v9JouAhTUYwR3Op32gcurGiJ8+qYVOx310B6g7HB+FgrFnlRzogMFuuK4Swht
	m3naMw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jgj0ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 16:43:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e661ce1dcso96926185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788194632; x=1788799432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVfCCX/QbLHdAwzzCna+Dt34SELB9Z4yDIidd7xilm4=;
        b=MjOVOs22i/0Hv+2ey1owZcNuWyFEAk5p42U3LVV72v4uL2axzkLoFQLmCBIWrxvdCi
         /p5kxxOb+5UY0k3Xx9AtE6Ga26dKZDYsbKVMAfuqIGTLnyR3rf8DhvUEbEEW2cTWI7+P
         W2yfbWiNEwZ0UMXBpBViFE48c7C30fCr1tx6QuUTjJ5L0KvwOg/S8jYjxVs4C917cHr6
         P1X0Z0aW701fCsL5ISWzMZTMswTdpUHaDdqyh9ANQehDiinXoHVt0V8N3a2qf8AOlq65
         2y4rsq51hgSpHHFTKq67l1aAqo0Ny9SUdNBwCMFj/JQlQBl5+Wfoc6sPI3OpaPQycU0q
         TnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788194632; x=1788799432;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVfCCX/QbLHdAwzzCna+Dt34SELB9Z4yDIidd7xilm4=;
        b=bwifG5rnrs4TazQMPOhVibCTdgzKcRySfVo4gttEJFee1C5RYoiUnMuIuzWJ4V4KhP
         akE2+aDgAo5hId0j6I5MSEgZENVcgRa9oIpw55/TEcO9JIl5qlpVBgWEWpLxAfdou/BK
         esB2zEN7+2lrRAaaBrkHDCcSTlyIVz15Ubv041pBn9o4liop67rob7Ga/s5sQ0FQ1X2f
         Jx5eoOUvLN9ndN0FqGgOMK9ZVbFON0Vf7tGYIMKRIrDsm2DajJZtTg3YwGB0DLB4JmCo
         50PUlvPhJ4yv1FbUwslv2qC/Zb+gBMBx7bmwq9D7Upx54yGvktAUXLcWj/j6yf5nJ2gv
         OFxw==
X-Gm-Message-State: AFuF++mExIKvdNq6a3u+px3KyyDbdYCX+zvA3Sk8IG3eA6zi0IePLoEP
	wVEbz2wNFDerkGitCGxzpegG5xHBPD+6bvFISlqYbxfCJDlpoUC1C8oAcWT7yFDUFZsAB7JF6KU
	ZkvNzqPpQLQatkhQ4ikaKL5SPq9flJS4LQh9ns2bOCzkCQdOKKEElhBSy5v83kTOjdhgK
X-Gm-Gg: AR+sD13H9Mns0CZC0/cxBFlSC5WHwZb4WDlMORKFsj/MTvsFjcJ/MPdg6V5ah2BNlN3
	qyTEdK+IQKUsJsK/Di9r2YeTIrCj2K5KYMLcNswMUsnZWQ7FJB5lmXgduowqRJAiO3AWWByba/2
	rDZSBMbJx8oYMFJK1WZFv/jKGM4UBbPfu4bN/IuotCA3kwNSYbMfeO3r7guHznE5YjBfyEyLveh
	tVT4nB+3XaMjNz8CrwFRL1cyATGZp2xJFYxEGMS1L/CJdYYx8jWqfvdnMJudJbTguZjrOD8weNc
	VDMhkWhuFJZYAGEdoYUv066SOcXivHN2xce7d6ARPUH/jsazZzP8o/7T+Dq062s73v7TI9p2sI/
	UpmJRhpis5Yq2hG0FsZpwLQ==
X-Received: by 2002:a05:620a:1722:b0:930:a08c:cf9c with SMTP id af79cd13be357-9392873f3c9mr1005153185a.2.1788194631592;
        Mon, 31 Aug 2026 09:43:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1722:b0:930:a08c:cf9c with SMTP id af79cd13be357-9392873f3c9mr1005147085a.2.1788194631028;
        Mon, 31 Aug 2026 09:43:51 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee27b19sm455018966b.19.2026.08.31.09.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 09:43:50 -0700 (PDT)
Message-ID: <294b2d4c-31d7-42fa-a55a-b57fc7d0ef6f@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 18:43:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 08/12] drm/msm/hdmi: Add support for PM
 OPP table
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
 <20260828-drm-msm-hdmi-eliza-v1-8-67843277de17@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-8-67843277de17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xJN3bPjcVNJwiwv2dozLsLHUP9VnT0IL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE0NCBTYWx0ZWRfX7qRQV9e0m5e9
 Y8Sqz+kYey0lLfvPnbkRnLkScPkchkXMF1wsSJejRpVefPvv+KKHn28ZkYkUeIpmZn5qSWJV1UC
 WZ/JZZI4WK13DLr+zo9no+obRnA93bw=
X-Proofpoint-ORIG-GUID: xJN3bPjcVNJwiwv2dozLsLHUP9VnT0IL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE0NCBTYWx0ZWRfXyIqqkUN4foFV
 NSCjjSy1t/qRiyGgUYzha14qURdl0nMc+r9meLEph5e8y2h+u0X/A8SXwBIQlU9m2cUJru3QqJ5
 xmDdWz+lUWIs4oZuKYJJfnDgyEDY5NEgEr/NHmebZlwekjuK/jKQoJUs4cR2cEKtUDvBPW59SYz
 NIdcMgy6OJhCRZyc+9J62EZGpZjeV0bDUALSxQuVJV5Qy0tydFFEiT3YDE7VUUPXjnWia01wX0z
 nZC+LUizmQSfi+AooscjBGJcmajgk6dOzgEiBe47HGvtg4nahuYYr+JsW8v1YtoffRNO/tDDXGl
 CuQZeaAmXP7Nwe7L53L0umhoqJGiBwDkYwnMyiG8Uc2Nw43+DeQnbynKNqmqI6CZTj6AEUk/vM+
 3jy/JBCRdMTB23jlV6s7t+vPjc/gKyw16ELz8M/GhNoz1uLxRmsMsOUAOmuMmXMUQhh3Ne1XtHL
 AP0LiWX8f3TmLGNSgCw==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a95af48 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZguCmW5wH7aHc4LmIQA:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310144

On 8/28/26 4:05 PM, Krzysztof Kozlowski wrote:
> Allow scaling the domain rails with PM OPP, which uses the pixclock
> ("extp").  This allows proper votes depending on requested HDMI pixel
> rate.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

> -	if (hdmi->extp_clk)
> +	if (hdmi->extp_clk) {
>  		clk_disable_unprepare(hdmi->extp_clk);
> +		dev_pm_opp_set_rate(&hdmi->pdev->dev, 0);

FWIW rescinding the vote will happen automatically as the device runtime
suspends. If you think this is necessary, let's do

dev_pm_opp_set_opp(dev, NULL);

instead, since dev_pm_opp_set_rate(0) is a ""dark pattern"" that is
usually misused, see e.g.:

https://lore.kernel.org/linux-arm-msm/20260728-topic-dpu_power-v1-0-e7783b859a70@oss.qualcomm.com/

Konrad
