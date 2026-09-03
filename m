Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9E546C85A
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 12:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439492; cv=none; b=IIvpZ9uRzFV8+TmGU+Lc67bjP6/uesHREmHtxMkGJNaI91SmGYnjjMILJWnZ5ewct1LjLTqzC4XF4jASjY4lJCIdz2bqd4zhSL96QGcMnrAy3WJaLrvJpenvNRlOl67FP8SRSoa2IqB92HA4BAc1cf0NClNNEs+6rPS5VVt9K18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439492; c=relaxed/simple;
	bh=DG0xs4gVZ7LGtoAA+TW8zCMbsKoTCS/RvxCmXoYITE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fAjGo9OcP48WkjpB0VCGrW4sTsL1p9SVM1NMeuhqbjaqGKGC/2ybgCT1WIeqHXKVGdodowD+3xkKZ3XqWhbPNVdtOf+3nxX+EvxTigDnzWA1lbsM5fX9r8NizUxIKI6gAzPCNASlWS0TFDIl8ZEP2s1LlIvl2Ywiy5JRLpu+UJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VfW47nC6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ciouBKTR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VfW47nC6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ciouBKTR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AH7PE1328098
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 12:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jbhmEWvdbNRK9oxq0JthpnJ+qpXiTJ/OErPeQixWtJ8=; b=VfW47nC6CptIzz4N
	xCrqkSYCciajwjPt73KFsQ29skhlrNQQLca5IUAJdJH8LFkridW3MDQZK87ys4+s
	uauHADqA9SlzuLIMKFVDypoLS/6Z/ti+k2Epw1Wz2E+Ab0hEkYRvm9p23KiVpfhO
	9c5xKRw83AxbFybKXf+gR98HsaLG4w0CtVsb1heF9A14WMupR6im/IOlL5MuSscA
	tHPeqjYgqBqzcTdr5tMpSnsaMc3bJ565r22wzwaXhLQDOzG2ifD/6GeHJR/h6pol
	cjzez4WW0oOf6iPieaRbOpoZkRE9yeKK6zSRN6Z8IIiedpZzxg/18MeXIdkmJMp9
	Op0Ihw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnn1u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 12:44:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90ce451128fso2575036d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 05:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788439489; x=1789044289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbhmEWvdbNRK9oxq0JthpnJ+qpXiTJ/OErPeQixWtJ8=;
        b=ciouBKTRDuRTGZICMD90Q97rb73VnoTMXaCGMWeOMxxyzZf0k4c8JdgmhGVez9ezrE
         qVJqd/OuZ6jWLLSE7QOztDrGFC7HXj7nT3rS4K97iQpAJNKgdX/Y+ApGMzb3xrc+8KW5
         zvE4UTHBRAgQplC7unp3+D6Lnv7qC6sQvjO3Zj3nHGoQBOFpUctW5VTFmhLExg9N4D/6
         BNu7OXOwyDfWCcyDlS0LCbtcEz9FfUiLmhX6CHIfLgC1sXmYbBI1fNLuB+yGE0lHmuHY
         4go/u2+bC1zkWGEvEXD6jpTSwd0tfNe1eYLLAkoByS6Ygce81mSo+RUUuYrOrxER1eev
         O4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439489; x=1789044289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbhmEWvdbNRK9oxq0JthpnJ+qpXiTJ/OErPeQixWtJ8=;
        b=XXZ9jDm60o/DqpZMoG0h2ZS7Fn1yKGpNEa2Zx6z8YWSLBWRJSjOJEYFK/anSagtuTB
         0/4yfrsaOE8zlYINT4It180+lf8tx8ONV0cl5sWV5uME76v7lRzYpYZUh2IhLie6QlwX
         BrAD+C3TxBbDMALjrzokSRU+z61QdPMmyrovkStmRZXzLZw/1CoA0HYU/wkJTEbbrVmc
         urKqn2kMDXdW+7yaMaoesdIfK8PEkIocT8ywNQDTmd3yWj27SKXx6Cze5qYOoiR1FttS
         UZpLrd7VB3A5rpczLuEkeH1XGbXfEkv4x2tQq/rhXkb49fF6IrfO4cFTedhhw7drVGwE
         xP8A==
X-Gm-Message-State: AFuF++kGD2xLd3Z9ZpPC8eaPJnE7yDYG3D0rKTeYKdj0QNfbctTEpeQN
	jzUECcDIWyQUoKRFYrZ0lai8batIikbi9aPtdY2Lx6pMXrIccjczDX4RP/EZZqW/Tlycq54z7UO
	YwAdLpH9B1aLAJxPYg/tvXddera2rtyMxAKneSEmTYBMJ1yKsFz3Nh5Gqba3Ha3nSQ7Gf
X-Gm-Gg: AYBFou3M11Tc2vha0CGzXurO+6Rezo6V4vfi2/+J02lZBLMfHno7V+DT7vWEHGPwTAI
	//goMtUbF1BeGcqukCG5APwWY7CJ/uuigEsg5/RAAaSjdsfXy9gfq5BCxNk6kV2cBy3NFlAFlRz
	QVMVTdEWX1zovP+gy05doNaV6iM35AAjaMWcCsMBi8yS4loY7voz2WKrubs9o3/BdSfdVIAN0Po
	u7WS+QyqZIRLJmrYQ9YFIlsR9ZLD3GOpsquU1nDiDyys9hlbF+Si4Z76j29yTLHKbKXf9cDW0bK
	IkMk5Ex2PeNbgE/eJI7Vboz+NmPFg3+oFWzRngOSbYGwuJURv9AAgAh27KYiAwfSoG7QuRlGJSm
	cKc2vgNr/me53ZcdtkfqT/A==
X-Received: by 2002:ac8:5942:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-53036d8e031mr93074521cf.5.1788439488738;
        Thu, 03 Sep 2026 05:44:48 -0700 (PDT)
X-Received: by 2002:ac8:5942:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-53036d8e031mr93074021cf.5.1788439488091;
        Thu, 03 Sep 2026 05:44:48 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f9423f5sm2205112a12.22.2026.09.03.05.44.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:44:46 -0700 (PDT)
Message-ID: <a3c60bf1-ef2d-4a6e-b237-1a51bee2dcea@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 14:44:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dsi: round the byte clock rate after reparenting
 to the PHY PLL
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kavan Smith <kavansmith82@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260903-fix-eliza-dsi-v1-1-3474a6c9f2e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260903-fix-eliza-dsi-v1-1-3474a6c9f2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AC6qL92zEOvVcdryWJeMFdi72lKYou6J
X-Proofpoint-ORIG-GUID: AC6qL92zEOvVcdryWJeMFdi72lKYou6J
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a996bc1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=df3BZnECoes8ZJFSp-YA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMCBTYWx0ZWRfX3w0OAlC/Mx8V
 HoHOcI/hlgTgYx5gDcLncmjYoSEoM4yolqfA1DqTNwO3OdnrkDiansueZOj4bwBt5BDbO2XKKfh
 opGX7F2G8nlrYwMd34f9fsYF0wBeCMDJBVijuZWzAzbtMNqbJRGcbZ5bBoFnfWa6sZsGP6kbyMR
 LaQgFHj0K/Uxt+iBjUwa5aNzX14d2Xhdu72/xtogy/MuqxcdogHRALNHvGpg706LURnYagfiwon
 V50qYoDl1LzuNVmS/x5ihM+uXNjUrSvKdJPXz2Q1vcCUYaSY+6h1JF4XseM/2quQDz/TPD4+dlF
 va6NQaLkm2DFjWN0bFwwh7FDfg1UNCdHPvOHS7qNUFkQdo96VJX+63ZxEXisBULn+BbVDEkuC+M
 09dI1YeC5mAxHygc7gisRXjbX1NAEKbrZf4fi/Ll/ELP62xsOrhiK8rSSOedpI1HBags36cyKiR
 /WM7GhLc8CH4Uwkl5RQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMCBTYWx0ZWRfX1o4kHl2HZgU1
 NOk0MdlcTG7LedmSkHYeHG+bHCnGMv4qxqKUA0PdJdTvrl11CBmAIiSlj3byg0IUxVZ6caaTi49
 1xqmjVmX8Snt7yEqjrF+IkuijfAhSiY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030110

On 9/3/26 2:19 PM, Dmitry Baryshkov wrote:
> DSI 6G v2.9 hosts (SM8650, SM8750, Kaanapali, etc.) reparent the byte and
> pixel RCGs to the DSI PHY PLL at runtime from
> dsi_link_clk_set_rate_6g_v2_9(), after the PHY has been enabled. However
> dsi_calc_clk_rate_6g() runs earlier, in order to compute the bit clock
> request for the PHY. At that point the byte RCG still has its reset
> parent (XO), so clk_round_rate() returns a bogus rate, which then ends up
> in the PHY bit clock request and the PLL gets programmed to a wrong
> frequency, breaking the panel.
> 
> Move the rounding to dsi_link_clk_set_rate_6g(), which is called after
> the RCGs have been reparented to the PLL. Storing the rounded rate at
> this point still makes later link_clk_set_rate() calls no-ops in the
> CCF. Derive the byte interface clock rate from the rounded byte clock
> rate, otherwise it would keep requesting the idealized rate and
> retrigger the PLL on every transfer.
> 
> Reported-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Fixes: 6cd33b6f4155 ("drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I don't have HW to test it on hand, but it looks good to the eye:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
