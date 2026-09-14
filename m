Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F5339CCEA
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373168; cv=none; b=j4zhT29rjGfVjLhlDjBvXnXZTTjJBYUa76XE4PEfY6d3/NHRaUrwnsxrM4xRk2I7iEdYnSZxop/z0vq0iHVEiwyznJfLg8WO/l9964x6rOvpkY73CAvqnB83jjEAcZlB91xFwrZPZDFZOcz69cAOjRZw8peEzRP695ZPf2R1SPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373168; c=relaxed/simple;
	bh=b2FqTnEw1/hRFQRqvUOt4/hmdqysDshXRiF5dS67NOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A9Al8QQn0G87KSJoCcHAhv3+wxTVQ/cO0HM9b0l2hc6MB4+EYYqGXubddePzcIcWsfa/xhVSq68sPbufPAmtWVMh/8h8VY3Cio22pV2fqOYK6gDR24Q+ZoIzn3iSshmC6azqfnG/GGSqidjjX7aSD/ULCuKhAmizt1Kg3j7FjLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SAqur3NJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuM4Qm8m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SAqur3NJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuM4Qm8m"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7S2gZ3351621
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W0XjNnKxrhdkJEO1lOyERnjUwOJSfzdDQ+y6uKaxrfQ=; b=SAqur3NJjAHajSPz
	p71yL37AMtj7uRBHbsiM4yYkQgW26WJdrDHYpDLv/j7qZ20ul5WIE3ANCKxg5bl2
	pPSN0Bqdgo8Kyrk8uMEFIhqdPgAIT4uIYBLgnrvmo9cjmjO0fgR68gEj9d6IxRHj
	LH1AkNcOH3X3UygpIymjPAbl1DbsW2GwepQFj5hWY00HOIJCa1d3imAPPt5VnfHC
	c3JDmJE18TwZkMlPeXpmxHE/wZxsfSQzXbR1OMlitglBKBvW3of1qeGqjbHgYWlr
	wLHsPLoEJlUSMtu7AFwX9pYgF/gI78hLk9lpUxGfvDOYZ6BVn4Ig5CKrA6fHmQsa
	liGQEQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg04f2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:06:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53002215979so9981491cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 01:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789373165; x=1789977965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0XjNnKxrhdkJEO1lOyERnjUwOJSfzdDQ+y6uKaxrfQ=;
        b=fuM4Qm8mWoxHmwQ0wK0haSEoT7Bt3T5+RIOCVl095mvcWtCWjExJ6uVH1P8I0HEkxJ
         C2RZ+wHDd1xtD13fSohxBpTArJt3zHRqKkUD25RTEyKskCB9Hqwao9EBvFftU0XB4J5k
         SQxEO07rulxjG4MPPxfE5MjRT4yG5VpuFApu0vnLfRfnBTNOqTwcTjxQLP8Lf1LLZejG
         YOdvrFoCV6+7u6SKkOU5Ex6Wa6R/AelE0C2QJ0NwhwTvlQV9Qrz+39fY6poGtah2kcCz
         cpH89iPQM7o08mrLeYJBOrSiDzRhWWcFlnfQAm84ys6QsKnAP5vcXPHjjpS2cyvbucX+
         I5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373165; x=1789977965;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0XjNnKxrhdkJEO1lOyERnjUwOJSfzdDQ+y6uKaxrfQ=;
        b=ePUnTv2aX3naQLDP8/ef6x6VPdEZ0h+N85xE3uijnA7hm3KuyYWiFZ1uWuVMD7MzTy
         TCtcva0/u/lBjsERvlp/OQv6YQBVnMszjtBuE9JfMwu/wJz5DiJ5GSkfydiz8jrIuBBT
         9eX8iqR7RvgW8cqUlu3qTYo6zbxLd7LYeuhLLbG8it6KY4h9tp2VLCm448Wohb2pfR5p
         FmoXdJSX60RsAL24TflwnJRpm4tJRtjNCd2l1GpZDRtBVWIe57MLjGg5XsWsiyNBReH1
         9YleqvGfRAmnlDlBsxHt1xohYkQH3PflOuWqBJr39xpNQg2E/FL+A5Lki0clAYiZvioH
         VLxA==
X-Gm-Message-State: AFuF++mSTH9VaARwQ9Sun9MgMcwxt0FINvSxeL2lM2dK1tRN4DyQi1gn
	RiApu+1YIy1Dae9YnfcFQtrLPUQ3z8pY7hqA3ns03iqnqXZswfPqAm+TZcnp7d1VtA1Jh9UXF83
	3I0hVJTBk3PgPqhluba7INFB9Rb3ADFjW3fOorhYrBpHKTdfTj1jwOSQph742v9dU+GyT
X-Gm-Gg: AYBFou2VSyXZUlPK0hqAfGb0B1YJ6b+8zXIMiizrWlss84cXupHoFqyy63YntQZ18Fp
	xp3I8vBa0SkXv61BtvsxpXDdf9y3ViIdvmhkjQ8svy9wjmFPRtKX7ZBQ3yG/3vygTZsL80xce0u
	RC3NlAMK6fydUYPNQyVBNvu/a889T2aVjbPeAbDLD8qjpxyp4NzJzQqDEvLegyQP+IWEv+5BZzV
	5vdCKWBOelcJEDQyvKjvgKLCWN29Yj8C6hSS30Yfg91LvtxY/bWJHuvjqL1dZEK1+zvADIb/dmk
	jGcnj8u9lqbAwREXk6DctHBqn0k+WhWRUuYMM7Xx3C1W95Ji2UVAIo2g/hWhlexrvp2M1Dvmz92
	qLtY55Cht38/tEQLpL8gIIQ==
X-Received: by 2002:a05:6214:4307:b0:912:1333:e04f with SMTP id 6a1803df08f44-9122e149532mr19325916d6.0.1789373165587;
        Mon, 14 Sep 2026 01:06:05 -0700 (PDT)
X-Received: by 2002:a05:6214:4307:b0:912:1333:e04f with SMTP id 6a1803df08f44-9122e149532mr19325476d6.0.1789373165021;
        Mon, 14 Sep 2026 01:06:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5831187sm3844483a12.1.2026.09.14.01.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:06:04 -0700 (PDT)
Message-ID: <126833f7-236a-4338-ba24-e4c56155c71d@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:06:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] drm/msm/dpu: Add support for DPU 12.1 on Nord
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
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-4-e25c073cf1b6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-4-e25c073cf1b6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa7aaee cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tJERSlHITJMJguJ_9RQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: pWfPTu-ZxTRa_4DYu8p8IeS22ehSUxAg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExNCBTYWx0ZWRfX3UQCXl/7qjiL
 BkHh2mv2MCcdAS8C1QlW2YfxwojTRH/TwMwsMav9UermEExyspQqcAeMnyuuU3ZDzpaDj6shhNL
 oCddAXChX505xxeHsOXU/EUmLK2EC+Q=
X-Proofpoint-GUID: pWfPTu-ZxTRa_4DYu8p8IeS22ehSUxAg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExNCBTYWx0ZWRfX8CKnNPDk/gjE
 RyhabzZgLIBxEKsQatl+8navGCSQG0wzJFN9e7n5biM03xF6u/A8LT+dB4NWfWcoR06wyIDfnP4
 BoNAciL+vGcNOJiDURiFW6Dad6d087XO1E/UZz5epBc4xdEqJdcIRebZuCaFK2Q0jSPbhhPAv6K
 wmbWalokVCmHSRwcyHM5L1v5Gx5KiO/ftBiA833dUHsMehKlczfCgve8KRz6qSY6y3QiKMjJnii
 Giksd4OgpIjgjKYhZ4CIjEGJv1PsIFN/l9TORGxJCpnGff25qborx6om/15yWMKaKujFhHfHu1Z
 Zr1vSSGcIRvipgHzUufU4aEDM2EWTrQcX9WS/r/5/ZTjZmz3vr2LCGLaxGp6pWF+njzlYllptbd
 LsFPz4oNw/x2vdxEEbPizS/+McF4S7BYrB5/oeA/EUGGPT1vAMUNAdsPwpwy7OFqCRkT3/9XO5v
 lvzrm0+nfPYnCy1cdag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140114

On 9/11/26 5:36 PM, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the DPU catalog entry for the Qualcomm Nord SoC (MDSS 12.1, DPU
> 1499A). Nord is DP-only with no DSI, and provides 8 DSPP blocks, 2
> writeback blocks, 8 interfaces and 2 DP controllers.
> 
> Extend enum dpu_intf with INTF_9 and INTF_10, which Nord is the first
> platform to use.
> 
> Note: register addresses and xin_id values in the catalog are borrowed
> from sm8750 and precedent platforms and are marked with FIXME(REG_ADDR)
> and FIXME(XIU_MAP); they need verification against a real Nord register
> map before production use.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

Please remember to mark AI-assisted contributions as such, if
that was the case..

Documentation/process/coding-assistants.rst
Documentation/process/submitting-patches.rst

Konrad
