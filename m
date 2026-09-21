Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B8048F003
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789990555; cv=none; b=SAhu4Sj1MIqAlZuiABd5py539phwV1xGUhQWkQb1gJs86c4PyG6H6sc/99MTBLoIFd8VCcFqPp8UoOf4aTU+JqtDrPHmHRsR/MtwbgUp5gF41PmJ0cTOVdhjJjZov2xpsVUSIdRjquGYNBm+jndJuUUXXkMDsxY2ko2+mGQRIvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789990555; c=relaxed/simple;
	bh=HHlA3ZNEuhKfDm4d4c+jXhjuKOBy+d2g6bs8QECFrlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSn/b8oSEQe5q9s/FeWwBC2kNOOAN+G8Mqcj2JFV9x2AjaJLuW4cw9+OY/eWFlD04eQhxYcG2vE4zhNve4GzAspj9IbvGmIqMCWCSZUIr/ni10JHuJFJY68KevfDqkmYhW2TxZ+2JETe7ItLdiVeHmsyPLi+zhIiIoTvuktO/0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bH73n8kb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fX/kVP7A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bH73n8kb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fX/kVP7A"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdxN31413955
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RacektqXu375c4L9KiAsUvB4bKjBE5jyOEGZ/c/EWGQ=; b=bH73n8kbfHIr3Z6h
	aferxfmolebruHmuFDXcgrFX9YFgLBGPJSNHtbJiQe4q/2EINyd9k88N/53yncrL
	9s0a+xfCuAA94pH0n1LZVw6QuJt3zTLcza7ursBiTf6Vt0/rXH3/xiMfpRYhWKFj
	LFczxy9j9GRJW8+0INzHkN1JqTUO/1lvZUSgIaAwP/PJdko/9vRj5kOCvLnEuK0p
	YE9c89g9DaNjaf5HYTKTkWPgjalmB1m8RJdnHHcB2OUAiZpZSQ29ZTjTlok0/uhc
	cZX8VGOS0xhyh8lItPof/2VyU8xWjg9ULbXfJYKVkEMowy6pAp391DwzuxtAlQtK
	REypLg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d10rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 11:35:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938fd633df7so99542085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 04:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789990551; x=1790595351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RacektqXu375c4L9KiAsUvB4bKjBE5jyOEGZ/c/EWGQ=;
        b=fX/kVP7A072DsmbsjP4/o6mKfrJDBecmyLsdhCXfRIuT5BPLyyehbGKe+WYsRvfpMx
         CBmM1z9Tqr9m8P8U6B3WIJ6ut7zvXW5Ng8STcuosAYGGoVVh8j9W4AU3wCNI+V8JHGyA
         IsuBvfegsGE2mb4X9Gc/3qjL/aaDmD6yM8150P3JrxwWqHjhVijoASJb8IIhGYtRmIEa
         RAqK/079nJS3n8YWk9UNCAhsKSxOBPJiV73sJfzexwFGT5oxY/OVzG6/2TOjOSv8KCL6
         du6b5+naRe8xp6IZs+S+akneu564vljp1eoc8yfH1YPCM9t2BvpF4B4u+JijVNN8RuSF
         lMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789990551; x=1790595351;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RacektqXu375c4L9KiAsUvB4bKjBE5jyOEGZ/c/EWGQ=;
        b=gotfUZTv7iIJI8QWyN/Ls1Bch4fREIrIBNAmgdQQlbvg6joL5S78EkSQBnajLm4gYP
         k4B8FflO+eBqseSjisDTz1Hn2xmbLmMBbDQxA0rFyLOcCY6cOLf6Bm/4Ci0noK+lhEc8
         9S3hR9tHn8CNNmSktIKb91H0LY/1LYtLqIvn+arT+OIzkbWLSYG7PXJaV9HWrEox4VHU
         Kl8/sRSgCLb0SLQFNZ7WLXc9AHpEUxF80waukQpXu8bTayJMyZclrr1iKsVOs5ELm6nq
         nkwFurNUnGNmfC3BcWAAy3elY7KBeKpg8FjTihzO0YmHmKMgAUd78hsb0+Ajhwcfmr/t
         2DrA==
X-Gm-Message-State: AFuF++k/b1YYChE5fUaDPoO7ziQ/CHmLF5xpy1u/gotkpswovaqz5wk5
	CH87BcwUb5+0M/kkPGT3dK0rtaeQix8bjYv/bKbb150Gz4QsXbRWch5kC1f+KgNWg3TYc9mZAqB
	NPmkCyemxIIagkyxESySp577HryEg9UEKBlI9MMZNeXhX6Osa0YuLmKBaK+Wv4KVCK6cA
X-Gm-Gg: AYBFou27cZhtYeTcDZMA6Eg3fOZD54QvEDLCFJjgoXO73lrvBbb9kjy9GoHitvBdNFP
	gqyyX4vgC23sExdQoYZitKCh5x0k3l73U5A/0UgFoYzxbr/Sn35TaEmHqtd1JhRHVlX/r79PSHX
	H+3YUakAm7knFcF3c2e/PoNTyLtq6/BzND+5gvQlyXzmVT1UGH2ALaEqZJujiSo/kXJJQPeSO/T
	Fwoe+gmoBSMROwEkkN83QZFa94w2bb3uf7uIDBbPnpJfwuCvJ4WEDi/wQPhNr90xPHRPEQPoJrY
	LQKEs42jIQrs+L0xQEnwwAGMoTCh9S7zU5kzOs6lhvpmMOBqRY5dkdfv74dPDCRFHsCXORSXalW
	scg4w7Nw2b4oF58JkZTgJ9Q==
X-Received: by 2002:a05:6214:5b04:b0:90f:1a3b:b20b with SMTP id 6a1803df08f44-913fc9f462cmr884686d6.4.1789990551420;
        Mon, 21 Sep 2026 04:35:51 -0700 (PDT)
X-Received: by 2002:a05:6214:5b04:b0:90f:1a3b:b20b with SMTP id 6a1803df08f44-913fc9f462cmr884306d6.4.1789990551084;
        Mon, 21 Sep 2026 04:35:51 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67e18fc5sm4196752a12.24.2026.09.21.04.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:35:50 -0700 (PDT)
Message-ID: <165d1eb4-f5e7-4f54-9f9c-22a210976d71@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 13:35:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the
 embedded controller
To: Oleg Keri <okerixx@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914082950.9393-1-okerixx@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914082950.9393-1-okerixx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qr1guV7wnwa7eksjeToNFB_wbsIwiwdp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE2NyBTYWx0ZWRfX59eUVhx0dw+e
 qhlmvbQIPeVH/9nZgQoUGilPJGl6dGgQG3n+I/uWqHDoiGxtgo8jEJ8x4tGBJQZI2bLgqSo1phg
 ce+CusBuw7w7vFTOnarNypLJiSntgEg=
X-Proofpoint-GUID: qr1guV7wnwa7eksjeToNFB_wbsIwiwdp
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab11698 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=n8V4RSI0IBY5zkqsj_gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE2NyBTYWx0ZWRfX3HZHxgHO1aoZ
 jCqKbmpkabX4iGtn/KI7PHO4a9wRvpmiGbg/Q44pbRdQEM09Ym+pAMZcxGzJgJtzpEIkFMZ8Hww
 7ps91D3vVNg134sRzYXbJjYdtyuL9IRMWtq2l3oYg2rO49MfU/LOvqnCPY2edWjKVOBrgOyHd+b
 3FO8RmF55MkCQ/tlNzZaJw5p7CYL3c6LIOsQARHjjpnebSF9fsN2gK1fOR0ie7P3cxr0BkatLuR
 3sMqXF7uR4OaYqxZGSBPZ4VZZPpdZesaHUG6HLxEvxGgpRnKuI8TVqnOHcmoYGVFpzxgoHkA3lW
 NXQiaX6oDIyktTecu+ZV7Y2trOl/0+Pos8goBfKd1b3bNk0/PLnofi11pYiXJWUD5v8yf3rkkdq
 tHCoKC8ATN6VWijlAMCCkn3exolCu9OLZeIGXXbznSdOuMGodjHba+rZxE+OI2cYnSC6HuxEaSh
 2zRFc4xDRbcYGbs31nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210167

On 9/14/26 10:29 AM, Oleg Keri wrote:
> Describe the Compal embedded controller on I2C at address 0x70. It
> provides the board thermistors, the battery cell voltages and the CPU fan
> speed, and drives the keyboard backlight. Its interrupt line is TLMM
> gpio66, falling edge, for which the file already carries a pin state.
> 
> That state leaves the pin without a bias. gpio66 has no external pull
> and floats when the EC is not driving it, which shows up as a steady
> stream of spurious edges; the vendor ACPI tables describe the same pin
> as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.
> 
> The binding and the driver are under review separately [1]; this node is
> inert until they land.

No, merging a node without dt-bindings would cause DT validation errors
(which you can check via make dtbs_check / make CHECK_DTBS=1 qcom/foo.dtb)

> [1] https://lore.kernel.org/all/20260908183403.2107-1-okerixx@gmail.com/

This link and the paragraph above should be above the --- line, so that
it doesn't become part of git history

Konrad
