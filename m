Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793008250;
	b=hzfIFNXpXNoHbZ12nsNDhe6/pHhyB7nYqIsuk0iI6OiC32FJKc4EswLCYJt2VOr3zc5V
	 /k29eI1XMw88JAxkl1BWdbplZWNCDhmXz9dXgE4RVRUuaKArX3WVLt2/JEYkT5T/sDec5
	 Iwa8Foz74wDiEHrFy7W+27m0PmvR5tewgpw6Qbkhkt96Uyc2BeP/aI3Y02GX0vlPtDNcw
	 q4tMZal06gEzPgYuKgQ4PMVOTgWv+DD6CWSZ8GfIY/j1d9NTn+St1ib3y2Fh55di8mOs/
	 TU3zqQP4WJ58jhQo9zZP2TBv86P6xLGb5uXJTwQ7Y+5hf6wameHLYQGn1NeuwbNduBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008250;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OM9NA6+9DRMy/5K7XlTQer+gWEHVhhYXBGhL8vr8CDI=;
	b=XMz1ueXTqtFEgdWrRqVYGYjuRfxEGUJkPJVtkMu7U+IrcbI9wbhkAa1ARw3wCJgkYDfN
	 nRlrCsoaDi0Y5mJh13BEaE22PM3uGp3gWnfNGAYiEZtdfItGXkvEvICGpWTPwZZ4Tmw5E
	 LDJssO1rItgw/a/xvX6jDpz0R5uc+ZOOFtU+P085I8uupxRDz694y9pZlQelTzU0CSNVG
	 TEAMfbd5KNjhd+IXF3ojNHKwSfXeGzBi+lc83pcxgrQ/lNSKQrhVIotgIhq56kfu2b9GI
	 3F4zHLIFjLEJX9X1U4kSzZYzyHoLgdhLajjNCsMHlDZmPr4h80GTHmCccpyMMbN8TGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZzhkrMU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYHdcNSr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3FC606A323
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D3FC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZzhkrMU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYHdcNSr
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q9aRUO2560526
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OM9NA6+9DRMy/5K7XlTQer+g
	WEHVhhYXBGhL8vr8CDI=; b=VZzhkrMUsOLBiooW/QzsjtbJY/FF/BNqFiImpKD0
	fwr2m7fM28MoQIFGdoW7sL2Su8o950QtBmXq1vWRdkcX4sHhDtTRmHy54mMjWleq
	Ga5ShmvhNjivtWu39ZtJUqs+35VJNw5eoluHLVk7LpbHl+4aXeCMNRpzCEThq326
	otYkUxiE0FDo0zFRpGgmpkpZ/OTNrqHDUf801l8feaREka4P1vzSu5Q5Beh6J1xO
	xCph4yUZNhR4byoIUho1Zlj0jcD2PL7KSISsnB5WvS9TPIYQ5bryWSm8RxwuxAGO
	xwgfF7e4X0C8vtOH29M75scnnO5b6n6TLRWGzEw2rqqPsw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp81r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:50:43 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c0f07b4e97so2710735137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793008243; cv=none;
        d=google.com; s=arc-20260327;
        b=nZqDd218KDLz+pH0OHhX3x1ZgjFYGt/C0Ob52xAavXa/bW0J3WgmwVgOuR/19nMlDm
         LBd9DovG1wdRWCwmZfOW6StfLg1fAH7axXoLrGSSh6rvhRUI4CpTfreRClSs4L3+JoPa
         oDGM4V6447yJo+Odp8bggOkdUBn3HZQvIW77eRc/fCR0aeqPNTcWxI9kvV25Kk1xRoeY
         8oVR9ScrujB31gHOzH6GB7pw9Hs4b/y0WKRlhCvalTsxT+PgeaTWVhrBGuMTahO7O96v
         HCZqCLqioRenBG1IpeU8gaW2SYk8Rk44QBPHQtAdnjevdSyQ61E5EcxnCMPJNvJSKZlG
         6nDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OM9NA6+9DRMy/5K7XlTQer+gWEHVhhYXBGhL8vr8CDI=;
        fh=RqSg//05cEVb16SwJaPOpBRE7nFC5COpcfs9prNwWIA=;
        b=VQOqlVkbFcvofwTt2o17gMlFVYbJYWRmhjWGFW4shhu6D/RxDGGxN/sodaQbTROHLg
         HoC+jvP+PsS6ZyedualjMccAohlt3Avb+TlEDXSrbQmdeSjionTIL7a/r749QJWfMMtb
         dxILlj1S1NylYu1fpSFgaJFTafCUKVCUDCpJ4WHFq9GsaTVZfXfzJF0NA9+E3E562wE9
         ZMyy0+7vE8jA7SlbzgDx2hLWFvMYSogV6z2rid2k3RuM45waMS1JNUVN0+mf55/5zssd
         84lFTbynxDq3BOCb1gtwSQKfAnzPH+0KoZURUJYo+yFi5vtEPicBunevTlkNG4DuYVRb
         wQkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008242; x=1793613042; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OM9NA6+9DRMy/5K7XlTQer+gWEHVhhYXBGhL8vr8CDI=;
        b=GYHdcNSr34P5rNbw4vS+cM9nkUtxtGfSIjaRf1D3cG2WvGgCDE5FrNLau3B40MPNc8
         WVNZoSgibs8GMgNdYD/8nlZvfhzGLjD/Dyxy9CVakNbxiD+UtHJLhOe8Xnb5k96E6adS
         SGknZJXr5a8F1KnrmdQ3FjqNzB3GmuohUBIgVe7VIC2Dfx05udguKArKg944XX1UQcgb
         UJfnIvQ9wjCjZGY9jH5i3VddB6n9rWbKhMRFrTHGR/NYTadc7pNT0G8+vN5Ma6nLTHgW
         shBR5a7YTXyEBr2GSqW1o3yFqAXwqbVRguG2IcbTiwFJpueD7N+co5JcxVd2EseJ5kMR
         2IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008243; x=1793613043;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OM9NA6+9DRMy/5K7XlTQer+gWEHVhhYXBGhL8vr8CDI=;
        b=xXByXeNjM+QvgAmJNINbpikccQO97uk77q6ihx/JEthbgWxtzW8X9XkbVqipI4wX5I
         lLQd5q2uOp1/lz9ZkSLNamukF5I9YzECv9N3oR7r4RsVoK/M2OSkBVJQ1qLB6eYt8MVx
         7dhnMeCHsvKgVWfF3sqfpv3ZRxORt0RVV7Hj2BqtnK72EYhbUB+vzXX+YRvtd21lupSM
         ho5+iwel26HeEH9qZJb5t2u/5wPhL2EDU1aLcXGzG0demgEt7moOVbtbocYj4kT4Dr0i
         /SXH86LDB6ygAsZGzTT7o0cWKeuYuukNwkm3P+jF2T5Fsgg4xmJxTgS6zUVNEPDK+uFp
         JxIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvorOmNilT9ooNkr4R4cq7jv69eJFgEQ+tNcw3h/cCMHFHicIljwpjESFKE24fs+xzYjoqtmMcqwjUgOS+@vger.kernel.org
X-Gm-Message-State: AFq9FYKxBmo0DwNbiliOfsCv1JZztrsmIOkhPxjWQguzUvqOGsTUEGDd
	00qV88hDJ6L0HccMrcHPrmdd5hux34zWLfC0h1R7XNg4ZOiqWsbkvvOgPZDrodPD2b5Eq86zCzU
	ppU2/Qx7JdN937yPWYA8fFikNxk3EPmxPd25ofNvT7Lw+p9cWikX9kIf4BYq6HMG0d7vF8HKypA
	8GuGt/WTv8q+mm2F1yk2decB5sDGDxo5IXCSytagRkrA4=
X-Gm-Gg: AYBFou0kHqaSTJtV32y7R+et30HA6Y9kW5Jqu+zyz7J1ykIes6xV80n2YFjLuvG7G14
	MzERXZ4wsZQ7nbu5559+O7B/Ji95zCUEwTmC+3gZq0X8hGSJ9wc5J0NBV3lP8wpXHtKnbsIP4jL
	whI2pUtaORiA6UxmfcxsNEYvnuyVjH1eEvT+up+6yc8i/Ch9PwzP7WDuTylsjAB+/CVA29pPeH3
	kpxKI6elBm/C/OeKQ==
X-Received: by 2002:a05:6102:2925:b0:7af:fef2:8ecf with SMTP id ada2fe7eead31-7ce5cc37a74mr1922792137.8.1793008242588;
        Mon, 26 Oct 2026 02:50:42 -0700 (PDT)
X-Received: by 2002:a05:6102:2925:b0:7af:fef2:8ecf with SMTP id
 ada2fe7eead31-7ce5cc37a74mr1922772137.8.1793008242146; Mon, 26 Oct 2026
 02:50:42 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <DiH264mdSk9atz9YjnNUImra2MISyqRZQN8lEO6HpzVBiYU4i_cNONZzyW0DfvCXJ5aGIrBbDYFXRbTBYLyjBg==@protonmail.internalid>
 <20261024-kaanapali-camss-v22-8-7da3ea49c8a1@oss.qualcomm.com> <5e1cc716-22d2-4d1e-b68c-0c1608890043@kernel.org>
In-Reply-To: <5e1cc716-22d2-4d1e-b68c-0c1608890043@kernel.org>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:50:30 +0800
X-Gm-Features: AclHuK9VMGCfWrLZ5or5WCH1QYYnG4gicCOANcYBpkmCFj6xw3eUiA1tUH_i_Q4
Message-ID: <CACbMrhqvfhyejKqsbCXRs8p9Kizeh8pS6qBygKDwpghPqrGzeQ@mail.gmail.com>
Subject: Re: [PATCH v22 08/14] media: qcom: camss: csid: Add support for CSID 1080
To: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX2qT4yOzBAAg9
 0lM4j2XTM3ADTue7sd/FnMDOA03p+KHfbOgFKIpeL2Vm2QgFVLsPATcDiwxTwXrQxTMlhfTIm8L
 cGrU5I7NR8LjjIG/lPACIkI4lfkWmn2t3KFSW4/zvtWuB52Cu+poPD6UPgXk8Sw5nOczKgyEwdM
 AfsXhhoGUTj1xtOtkGDu0GVcesFVyzkDj+CHhA8xAt67JWCozsAs2sGea/fVMiFOo0JGtGQHBUg
 UWRCC5HxF9YS1RMbQ568+Y6OZQU3+F23+JfqzBykbgjlpNGU09SG+mPklWt6ZwrR3yJxjlM3CWL
 B+AYQAgWTf2eV2YLVTkxdR0/xIiVNKR+7TzcE4iVXoiDoKBxwtYl2gnFiSM8/YefdjSRnLNGYMp
 fZ/Pz2WDn8J2I7plMEkXjlRJWy1qczvbHm1PIE1HFySNOzt/fV0rj66vRxhrzZMSfYRmQMIP3Ew
 1PkHj3sCh/2iLLaTuRg==
X-Proofpoint-GUID: VyeSAz9R9bcDKRLvYY7OjYx_JGXUNPc-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfXyjuPDJlHZ8cV
 WKXH7NvcvIfM+uSo50cdDPoVlgyjD2vSv78fqe0AoG3oqrDaDjA1w7ndqoC+C6TnJZJ60BYoWvi
 DhO3osyxMLXxLxQw6GesEBM8gbAMgvU=
X-Proofpoint-ORIG-GUID: VyeSAz9R9bcDKRLvYY7OjYx_JGXUNPc-
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf2273 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=XVB2PD5oAi8qZ-TPs3wA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260039

On 10/25/2026 7:15 PM, Bryan O'Donoghue wrote:
> On 25/10/2026 03:17, Hangxiang Ma wrote:
>> +#define        INFO_INPUT_SOF                BIT(12)
>> +#define        INFO_INPUT_EOF                BIT(9)
>
> Excellent thank you I forgot to ask for INPUT_EOF too, which we
> obviously need too.
>
> ---
> bod

Thanks!

BTW, I'm not sure whether the current addr_update design fully meets
your and Loic's requirements. Since we're still in the merge window, an
early review would be greatly appreciated, especially if you have any
concerns about the design.


---
Best Regards,
Hangxiang
