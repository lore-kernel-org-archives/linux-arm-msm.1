Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0A745C6E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141683; cv=none; b=jv+FZ1O8v/kUSsuZV9mIlnFUhxBfQliZ6uyPYeD8Od+8X0ysxQxI+SLL6bvcjMYwQdWcN1IJSh14nfC1DtMF5X9jlDGGrZ9RjGukrLVGhoDSpA0Q/1hvifvzzlOaLZnwGdlwM7F4bjZuWqxE6TltN2NASzPPpRA9p1jNIjPCQys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141683; c=relaxed/simple;
	bh=Gf1Q0sTU/UBy5u52sv5kJvv2O4ZJCxnZRcFqED9rhiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQZxXwxJp7+kX5zU3jVheXozytYHXH67VgdD+MZzdKYJbLX+SajS4g06rybFWBNl1NoZ6pi7G6c07NdNST31oQDK1d+qT5LBOtP7qEgUkPDjKEwBOSwoC8m9gdYf1jayk9+JaytbYheTKsCz/CL3GNjKODD9HGqTAd4CCIu8P7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCpPo+MJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cBIf8h8d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCpPo+MJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cBIf8h8d"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm7lb3251762
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UfwvCJZ18lp93+WPqAxfERzMxNsd00Xm06mrFwnyhZs=; b=NCpPo+MJDgFf29jc
	jKcs3c7NPOXvzixt1cRi/VTasJ3xtoZZbYy/22fn4N0GiRKcaW4/kTtajBvta1fj
	bzGVpSwg+dCjMrhUn19SM14/L83MLfmuDpmVJfw6MkLo8drwuJhVNXJKWhfN69b+
	D9b+AC2fUKo3J6J0mcgSfZL+YUvCoU3gC5WvYzJ0px7mTqh2mm80dxAxLWCFuTte
	+diXadbQUlcpQT3bxwfD/8+eEkbtFzABNB9Cw8b20Uinr+6S7arO+KVENv8659GD
	wRaU8ubXpBt9cFkrKoFKZ4VbhxPW06t254skdkxJy9FEkGUIQ6y20sbN83qFAM18
	ol9atg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uckbem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:48:01 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c8328eb979so43252e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141680; x=1789746480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfwvCJZ18lp93+WPqAxfERzMxNsd00Xm06mrFwnyhZs=;
        b=cBIf8h8dFTycAWsYO3LpCfAChfRgFAR8KoBqSYc5bDInilr48ND/AHtHziQCeihboU
         czGHIW3qT9spUfd70c5p4veNDDjqw8Hq/Zr9IA61tcUMGE6VPkS82IfkBRlQ2WC9zhf2
         scdty1mFsNouD80HNmncSG7S5HngMKpXc0/Q15TMD80QqHhoQYob6VYEEpsdhIrmPWmO
         Xm8iLK0XxZVPS5xJnXmB7SdRjm0NClG147X25MjxA7NLEcL4lfTU/hEIsMOWfgTv/9/u
         K6+DUo8o12eR53rewtErUGloP4LQdo9FpHTdEXxwBr9uOZ+wAs1KiZzY8oecxUxKqYk4
         a5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141680; x=1789746480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UfwvCJZ18lp93+WPqAxfERzMxNsd00Xm06mrFwnyhZs=;
        b=mH/3RK743SQTwgz73dujSp2YfzJDW4+NKLYobIKjtZXDknA2c0R42QyubPOV2RVEpt
         WXmm+FCQhqdOGheknCkfnrydFcMFcJuhnBxCmH/IYl3WhdseVPH4D/73eFfgsRNl322r
         YkHONL47oGTw6UIXRgRDO+6ZYa8+65u0vM7eu48nmJ/V75LQGzIUqwcZvNaPO9hlXHQt
         1FF3pTScCPcEFMQDYS+AE+1y/YlHm1Vj7rZwKgDJqKTCtIIbSX5RLPxokLpl3Wwz+H9B
         vVs9LqYUK4xtJwtcc0j7NDJZcsyIgccZUlNbWKC5NNA+KJ5Ui4/UdcOCZ2kMVx67hCIn
         qwkw==
X-Gm-Message-State: AFuF++mjsvkUANV65mSvfZ2PNY2ESe30e4B1BEcEkHJrDxEu79l3F5iW
	Kb8ohxFCDHVbV0aFdMAcWF0XR/mv1W9cORDQXNB6SXk+8QXk3/zKIMrw8p4HqfyloviGgG2iclu
	bvDhdrdOuGen5OUsIuDnfxrkBDFuklpCuhRmPK0Qf3lxohzm5f2RScBYCKVReDqx1HOfD
X-Gm-Gg: AYBFou2AgYOhCdWQ3VDBljRIaW5k6cWxoCQjonnT+oLary9T1ePRqo6DcMOAHeNCPJn
	uFfjUwSFTM/Lh4IDbtzdcVw5WfCjE0Q0G9ypvZ3icDHAJyXOVMcLVoz1PwzHgNWyXA/Gpl/28CO
	OkJ6amYduVb1+Wi7zo6yZo0id62fhn62e1BT5nHjX94XrnnLt0C5rbw0MsTMy6GMlrXcWXg03l6
	51CT4x2G//fAsqfut1RCwBLNnzf2xcJmpgtXEvz3V6xqxAuLz7Etd1kL9ZkuLJs9niHvYDWubm/
	1wLPHEiAhzCz+k/LpVuejL225BNSuvmu7rWiBpigQM1DzxM+SxtrESgGC8YC9fYNNVqwKc5oOyF
	lgWknchk3fdkN8CJfI0DFGA==
X-Received: by 2002:a05:6122:4a1b:10b0:5c3:a1f5:7569 with SMTP id 71dfb90a1353d-5c8460814acmr1634005e0c.1.1789141680164;
        Fri, 11 Sep 2026 08:48:00 -0700 (PDT)
X-Received: by 2002:a05:6122:4a1b:10b0:5c3:a1f5:7569 with SMTP id 71dfb90a1353d-5c8460814acmr1633976e0c.1.1789141679590;
        Fri, 11 Sep 2026 08:47:59 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047fd69sm716054e87.83.2026.09.11.08.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:47:58 -0700 (PDT)
Message-ID: <5ab7084b-1bbf-4e1d-a8b6-fa29dd9ba5ea@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:47:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] drm/msm/hdmi_phy: Cleanup after
 msm_hdmi_phy_resource_enable() failure
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
 <20260911-drm-msm-hdmi-fixes-before-eliza-v4-1-87bdb9f1987f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-1-87bdb9f1987f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa422b1 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5N7f0bWkOQp0pCbeU4sA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIyMCBTYWx0ZWRfX23azEn6zm8hl
 wHR6wkEO6gKG4DFYnn+ehj6U7Cm/k5XVFoWrLDCTzL4pEmsQOpy4hBp4+rZyG7kD0vcor9Lu5Bt
 k1oXUTXGFFztnok9X1PjMyIPaoEX/INn5BhmdySstwGCCBe54V8icslyM9sSGfWej/3Yhb3P3zk
 cUU/meAgndlyaMVkXHSwZzRoUqPcbNamFMjOp6AqZeqy0wi3b3uX0u5p9bM8DJRVgno/tDSYf+f
 4xAC17ikE3BqFdO97fUVi2xlecIUMj4HPvUcpLDKXBJdPS4/hX8hRHi4i9VqkM/4a8Dhcw/Ok8g
 EkTPp90ukg7EBZmx/jlawz2JUNK6ZIyFyFqQcHA0UGv2XCdbHBG3CbuN9bB3g2bd/USXhj16N6w
 XtfEW78krm9q96CQHI5rIDSn8hhRl8kpinfgrIrvCh6BKwioH8TEnIjNL2PPPJ+Mq3NaPEM2qPw
 cCDn6mQFfVjEQgd4fjg==
X-Proofpoint-GUID: _xITOfsGs7mggT8G2EArdlxPVM3et9DD
X-Proofpoint-ORIG-GUID: _xITOfsGs7mggT8G2EArdlxPVM3et9DD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIyMCBTYWx0ZWRfX/8Fz4t9vb8SZ
 XkdhqoEeGs+4idiizhuZhEpaAPylnpVtxtiaZjoVswyN+vwY+2xMy3T4PAsk3YH+A6QKxXDsbBE
 Z7cPZIopEVBilv0dT1ZQ0xjzd1Q0JHo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110220

On 9/11/26 12:29 PM, Krzysztof Kozlowski wrote:
> If msm_hdmi_phy_resource_enable() fails, e.g. when enabling regulators,
> it should reverse the state of things already changed.
> msm_hdmi_phy_resource_enable() is used also in probe path, thus such
> failure, which could be simple deferred probe, would leave these
> resources permanently enabled for the rest of the runtime.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 15b4a4523859 ("drm/msm/hdmi: Create a separate HDMI PHY driver")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

[...]

> +err_clk_unprepare:
> +	for (; i > 0; i--)
> +		clk_disable_unprepare(phy->clks[i - 1]);
> +	regulator_bulk_disable(cfg->num_regs, phy->regs);
> +
> +err_pm_put:
> +	pm_runtime_put_sync(dev);

This can apparently fail too.. one more argument for PM_RUNTIME_ACQUIRE_xxx

Konrad
