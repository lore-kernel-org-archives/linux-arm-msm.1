Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D03445ADA
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 11:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788434101; cv=none; b=tOILlM+R21XI87gdmOmWGWf2igBTu8HU2wtBqX5MckE50x+5r4Hh4c66L2O/EfePy7Yk/V3o8PFx3okeF1jpmBnKIgOdR18Sl5mOb7EW/VVCz0W4Fn+4CAltiYPLsN/uJi9KoQV4zGOZ/S0oIchQFl4zAVaVXf0abdf9uoFH/Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788434101; c=relaxed/simple;
	bh=iPCNerosbo4Jfg+IQoZoErtJ5EEDm9uiWHnZRdO1/hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TqKRu5Ulj3uxC9jrlGxG+JIo7Oswp3n2KZ3Gls8tHUeMqTwleUkAFz/sOjtKCdcnsT6fAB/FK6CGLaF3bRZvCefc3alAp/eseLLr+jxh9eig/ELYfHe1vTDejcyx/azMGmK6g/5Qo2Qzs7KbVccPVSjGjSZlMciBeTVU5H/3ikA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lb9XuRrm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGtOr3ne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lb9XuRrm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGtOr3ne"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHMvI055450
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 11:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lz0OEqSGbW8F7CVDGnfMLcxZ7fyADNJyjt3Y6EUKNBY=; b=lb9XuRrmltfl6Z79
	AA4xBVmMbJ53trlzoA8ZhpUnXj83wUkuEgnL04xypF4ugEBxbdx4jgghjzdJuERT
	B2XBm1SCP7d8A51+SU/RSYhlhXMJNZH3W4O25QA1ZCsS9WRzS+LmKWhtye1xJkH0
	Hl3FeLoKXssQRqYyC2/on1JVFJO6g88E2RH2LPE0eQta3NngYPBgUmCe6rISI1xN
	imcn59H6o2DZJjd0JbrlKLY1g7ca+PzRhGju+V/VaYkTBELa2E6XNGI6iGFjNrOk
	f5hziLodyYWkUNDN6HRSQAcPNpcgN0q8o1B5rpxATeBTGSUlqyL43YxHkKpaYkAu
	FV/u2Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdvmd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:14:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93918756165so549316985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 04:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788434099; x=1789038899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lz0OEqSGbW8F7CVDGnfMLcxZ7fyADNJyjt3Y6EUKNBY=;
        b=YGtOr3nei0tkRGGCJ+dHPSa9jBHvt4mVQMZnKGGHHAghEiLArZxymQTWw79UM2VPFh
         plLqHa37fK3oD1IeyyPhCj55cLbxS5h36OdrOJiwvJYiKsbR67WPNUEzodUVzaZWZiNY
         ShAFtupTIlV/Ar3z+6MzXP3UKYSxEsWJ8wWyNyDKQ+0DfRtmU75yN5BnrOzxhdevhiZS
         DIMy5PFvCmllVxiV9Jih9QjoSueS1whRW6ZmQmnGUa39ueLpTcVgRVt0fCO8fwap18dX
         /hX4XGcZR/7guR8LqrsOcAiP5avkK4yG5JXxMJQYS9Ox9+szE+gYZNu888Yo+G4b/O/g
         mBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434099; x=1789038899;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lz0OEqSGbW8F7CVDGnfMLcxZ7fyADNJyjt3Y6EUKNBY=;
        b=Or99KF1KmEStEyG8LN95XbFu6/x1DH9QetDqqejXvvVbuVALYrVZtJULRrjTRkjWZx
         ZXhrgC3MswNj6l/E7cC9fk1D49RmcX5fcCN9JiZ1AxZ5In3qwBfdbOrsPDXptZYwtm5r
         H8YMZeZ37913Uhdu4N44p8OxQ9wUmVZP5eib1vIqrtHeHu2tHW27meud74PJKxxeKwe5
         xAg+ffKlmy94IbY8M6/zZBQOFkH+vgdg8gCYTgZMtUyHKkpNUpJRpwgOC3K4x43TEsTm
         whHvu6p3gu1hDqj/cx4fLJeUAnXekGhBZNgr7Jk3q/QvYSwuXo6zUAvCQmv2WYMFTHom
         9XmA==
X-Forwarded-Encrypted: i=1; AKwUvBwapw+fc8DOz5gSAwwbtIUQanR/EvMsEqAHaosgBzuEGh79mNOtNXPBnsYa0n2Sy6bZhTvjrlWsNyWzTVhb@vger.kernel.org
X-Gm-Message-State: AFuF++mB/j/VRNBXiUJmhiZChB0DmjeKRz9qpRVg0tELB/mblZYP6CLB
	VtJ2kAU6f8444N7Lhk0YW9OtVGuZ2SrEjoKRpvSFpdMDZaluc1B3FUTYFacyi4qfLBclBzD+npa
	7EqWKm/CdpbK6Hqs1ibo0cJZ+4l2jJSVhrG8EmRwAjnzoeEIMai2tx2372y71nbdfM9ls
X-Gm-Gg: AYBFou0yTVbZ5N5xhnP7W0o66l7QqINGbG8ZSMPbxED1KVdaDu5GFTkxJERgwvyrYwv
	XKBU6rmerlrsZyvVND4Fptpjsl3hJG83MvtVGRFOn6BwIY3YvCUOuZYZy0XWXeAgDw+1qXhurR+
	HvMiHMR2XvGnnOsNbQ2gi8AhSTzS9JKBt+VVGHZNiJur5IO+BRJvAbz0eZzapS830y1gIdcYO9X
	oTwT+Y7WhIb2gE58iAy4gUbreZNancbEX0QsS1gBfPMFAm1BdGVYL6GmDzWqe0cyuhxFNe1lh9/
	dcAkL9e1JxelUvVRwwjv5Rt5D5g/lJxlpfBGKmhyLIJ1gogUHebQRXRNirzDmA+pTL300YDg1/z
	V0iet7Vgt7KJ5EfMvqsaS9RfMgFli
X-Received: by 2002:a05:620a:2682:b0:939:1459:efb2 with SMTP id af79cd13be357-93960ef3c8amr1369312685a.24.1788434098794;
        Thu, 03 Sep 2026 04:14:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2682:b0:939:1459:efb2 with SMTP id af79cd13be357-93960ef3c8amr1369305585a.24.1788434098304;
        Thu, 03 Sep 2026 04:14:58 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dadddsm73748635e9.9.2026.09.03.04.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:14:57 -0700 (PDT)
Message-ID: <34a028aa-d17a-4a59-bd1e-26ea784a8401@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:14:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dsi: Fix setting completely bogus rate for byte
 clock
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kavan Smith <kavansmith82@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260903104732.145353-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260903104732.145353-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a9956b3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rFN8pUq9rjxbytSTOF8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: uCNtHl4hrM6lG3ORdBKMm6-qiDoG3FbD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NyBTYWx0ZWRfX/HIDqGdMnnOV
 U9toaXqpwHa5QpsiukTO9WHRc3pKK0L9gBrraWmjWg3XKkZTKy2g66dV4AkKq9bNfRLg+xOp9MK
 ae8qlcCuIhotNEfskEI7LyYYZr84ofLeQ3Mr0pY3A+GtTXVg+gziT6ZS/WBgqyxlmcWiS4X4jL3
 ZSy3awinwC06eUiywpzc+P2yCYT7Ff7h3rfuKU6OqpSWGPigwVHPSWRostpwZoUuS1r0eaDAdHh
 Re62tAPy1geso6azHxVoc7zxxUUofe4pmqVmv+ltAu0QD7K50oKX0JoOypfnasqqC5olXRjN6Ns
 1KLRkd0oHiN9FuQ+KgZcUMFCXJjAcYKjXeUl05aV4uB2IcrtmF7OWyesw2ggUM9j/2ZKeec2uv5
 acrMxhPSwKEm+Y/ULFpwXZZd5dt+P2eA7iCK4VHWnBJDc1yzRqUYSzWVWzqggtmHl7ItTWOtx1N
 uU6sLCdI4X6Kj1aojeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NyBTYWx0ZWRfX5TCwRYQ69sNg
 8iB5JLKuQmkvH5xyIjSR2i8FznolU+r0OiShdV8WxwLoW0ax3E84pCYfpjEEK0tYLaPXQ3eMfuA
 px5UqDi09lNzREoID3V1dpEeaBSWjqM=
X-Proofpoint-ORIG-GUID: uCNtHl4hrM6lG3ORdBKMm6-qiDoG3FbD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030097

On 03/09/2026 12:47, Krzysztof Kozlowski wrote:
> Revert commit 6cd33b6f4155 ("drm/msm/dsi: round 6G byte clock rate to
> the PLL-achievable value") because it is absolutely untested on newer
> hardware and obviously wrong: it rounds the byte clock when the byte
> clock is not parented properly, so the rounded rate (used later to
> actually set byte clock rate) is 19.2 MHz.
> 
> This broke DSI display on Eliza and probably SM8750, Kaanapali and many
> other new devices:
> 
> [    3.164727] dsi_link_clk_set_rate_6g: Failed to set rate pixel clk, -22
> [    3.164729] msm_dsi_host_power_on: failed to enable link clocks. ret=-22
> [    3.164733] dsi_mgr_bridge_power_on: power on host 0 failed, -22
> [    3.164760] msm_dsi ae94000.dsi: Power on failed: -22
> 
> Fixes: 6cd33b6f4155 ("drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value")
> Cc: stable@vger.kernel.org

Actually this was pointed out to me, so:

Reported-by: Abel Vesa <abel.vesa@oss.qualcomm.com>


Best regards,
Krzysztof
