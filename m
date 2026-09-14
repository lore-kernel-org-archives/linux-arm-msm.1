Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C942D415B6A
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375438; cv=none; b=jvOyVXIJ+YI3rIMly5joix9CVGzfVrUa67gWKaTOS4fCu1qvhoFaxjS/9zP2ffF0BjfN3IlS6xuDvqFGRjT2r7T8nvt5Dl5645hdEjU8tMme74GP2gD0IDqh10YE5WN0PLxpNqc/MKW7v+dAV58/k76UhWuES/aXMCOlw2VTIto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375438; c=relaxed/simple;
	bh=eRoM30W2f/mkMP3RZm5HJq5vqvrB/xfVifW1riTwVCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXTw95AOJ4Suy26qqdQmuLh9wHOrsW5NJ6lLxHr+ej9Uz0nZM5L596oB94qDggrGGcIP9FGMG5acggMLHAWRE3Hasmf+LmR6yvbyd+OkiLN/qmzU2aWu9XkaMOVOzk4WQpco7jDgyQpzeSGHWgx+Y49p9v2esX+nZ2sKCX5Y5bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dnCphuks; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCvvh9Ja; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnCphuks";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCvvh9Ja"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jGsn3842609
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vkzl2teuUIOH35vUwMpIpVNqQvjK0O+vz5L6i9wgEog=; b=dnCphuksf+hU9Etz
	AeeO5zYjFlhsxtEY6Y8JtTIE5adm7CDRzCah02uX7qHHDFKdCLG4gTsBucoa9L+y
	9p6lneLInvFbDGRiRn8IfcLK+joiDX2LpAEXNGpoE8IKZdi+3SW/ZrZ+WWF0P//N
	6665MtyN4JdRtE9mjTgYeyMVEB7tLluUa10Zotq457GW6kZ7toO5nnz59K+bq0W7
	YZMEB54DArginHHL6kUNlL+HWfTIzQKRfFQp18a4qaB+Tfi37RExClJLRIhzZggu
	7NOG3d/ZG169gAD0EI3Xya/5wQ/IRfd5dh2Pl6dozW+KCXZkzmN1GMkGVuC7xzfj
	BWZmuQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5spr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:43:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso60478485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 01:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375426; x=1789980226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vkzl2teuUIOH35vUwMpIpVNqQvjK0O+vz5L6i9wgEog=;
        b=DCvvh9JatgyWUdQpeL7NqwhRof16MfRtWdps6zELEWDaTMvDW56zHLtdpNQXJLxvUZ
         oObK2WyXU5w+v2w7xIz4O9QzKa3AqOSfb2UX9bektLjsgwIL6xyqL5KCPwIwgVOGia2e
         g6ngU2z7yNkKUgCInQam/Unf+kUuNhab1tpwAe+ke/47tdMTU1UB6IYlGCpkQdpWUFGP
         wIAr8Ae65jHA7xw+XvfWe9tViYxu8kGMg7loZs31+7cspzQY/BNKbRFUtXE867pzR/t9
         99Ng5TB0XruxyZCtSLTTnAIv0wLzBTKGQMWVlMpw+F3ktwuiOjaGSNjnlGIsCyf1Cw/N
         Nf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375426; x=1789980226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vkzl2teuUIOH35vUwMpIpVNqQvjK0O+vz5L6i9wgEog=;
        b=Mjt9LOWuqzBmvis2kCEyv2weopWdBoh6v1HlUiLGy90ljWDwFPNYljUO/G9y+gDaTL
         Zq4jMestBKbfD2FZF39Xvj7oheeeb0sXrAkwLXtfuoeV9PUs8x3o6+o5xMAPjFfYfM32
         6F0EDi+7L+1+YNzsqojNgU2k8ZNpCP7TumhUagnsbe70t/9HSWZVhaNel+KOVl+RoVfJ
         McXFf/mv+FiClyA6ERobQhgY1EmHVvgTqOj8qrZkQI+MAXaRN7NPKeFq1b7UAk57yba+
         fz53c8DjJQ++ET0Tim0hIzUzzoUWjcJLQRexAWLkUu6jumCvHlEai8SuZOhCv846sdkf
         fzqg==
X-Gm-Message-State: AFuF++kZbsJZPh/LMnkVRoC2LTHY3MMSpHynr1C/E7u8oR1WTc6JCzmB
	CA3iZeA74uu7rMh8VTLvIbSl0qnSo8pKSGqXfyU76ux2w5gxLcUa2b+x3fD79roalo5CUrSw3ys
	m2c50t6yXQn5amo9UsgWlQN9mxW54Uqz19+FxAXHjT65SmFUIiu1iClMHCKyXji8UVixR
X-Gm-Gg: AYBFou19GA/vR0u1dnR9N4K6BIKIShb1iLQ1GS0YdXFW5GFood/pCVWnxmcDWoxrY4F
	Hm9x0P08RfXx3oonsLZlku5NKwtet90NgzTQ85RytYnZ9RDYhCChJT27vjeexSSL0tzXsf7/VIF
	ebmLe55l5O1/bj4lR+WABAReNDvoiABFgX4plzgx9BzWaUZNJWhcguZ9EHdrRm+IROVrfpp6Tla
	VJbEfB6DfSfTDT1Fn0oADSLV356v9PVwlwI6aAzcMyvSmkBZCBYqDGymlYsJnB8ywMo70Q8UmVd
	Xz+FchH8uVENrqpaNR7ddjo67FQdxdhHVCUGnysVdlEk9t5F1dyu83VJ4mKzV8lqVrGk8jOO5V9
	3B1vo8jFiod38FoM6WijBww==
X-Received: by 2002:a05:620a:470a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93a294c35f6mr194986485a.0.1789375420670;
        Mon, 14 Sep 2026 01:43:40 -0700 (PDT)
X-Received: by 2002:a05:620a:470a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93a294c35f6mr194984585a.0.1789375420282;
        Mon, 14 Sep 2026 01:43:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660ead51sm389342766b.49.2026.09.14.01.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:43:39 -0700 (PDT)
Message-ID: <9e4e2e86-8699-4fc5-8737-a6bed1e54ce0@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:43:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the
 camera privacy switch
To: Oleg Keri <okerixx@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914081652.5935-1-okerixx@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914081652.5935-1-okerixx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BOe-91hdJD96i_kG4ObAlJy2n7rxgd-K
X-Proofpoint-GUID: BOe-91hdJD96i_kG4ObAlJy2n7rxgd-K
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7b3c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=qN27Oiai8M4bhUiYl7kA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX/vawLqEciwQw
 eXffh2iVrNv2h05wtO4JOikJflobls9rGW5wcV+gQXz4xFiHYTPN2UuVky85rWjLrs127NG+UtZ
 f1fjYl3pLD0s7bTVIXX+QitC1uydIbrtCIDsgk17un+1W9fuDL+WJASjo5KBLQRLGpqCSY9qzni
 K8GyPjiFTBaoe32G5Ga26bLZjY/EL2VtcaH+hBivbH0ZTZqafZuVNQKfNDxOza4P1WqzLsf87JY
 yfdP2JxV0WCZDr1dv2jTk3PtgSkDICSt4g99JruLWDkNkMwSb1WEqCcgPThA4t3/YaOjqDPsmWO
 6K7pejIT+Y6BMfTyaAVZhvx3viPxiioSszAwifUAIGx4gDJqgtSimC8If6trqsrOwpNze2N9PiT
 yw/ePXh4lZzqmmSVuAiy76ornvPRC1sadFTdQcM3u5OvCa3WUE1t66mTYKf3Pk4mjH4uKUhsJMJ
 6m7Dy6o+3moFaSHacmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfXwYbgZpS5lD1D
 bZ7TGP6pirpK/kLMXpIwGUj7DovN91kb8URtj8bdW9exsMB3Y+Teei6sHJSDRdLnDqSNh+8N60W
 VybvRQW8shQ9YBEdcpLz8GsqwHW1tDI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140121

On 9/14/26 10:16 AM, Oleg Keri wrote:
> The laptop has a camera privacy switch on the side of the top case - a
> slider, not a mechanical cover over the lens, and it does nothing to the
> camera itself. TLMM gpio99 follows its position: high with the switch
> open, low with it engaged. Describe it as a gpio-keys switch so userspace
> can act on it.
> 
> SW_CAMERA_LENS_COVER is the only switch code the input layer has for a
> camera privacy state, and it is what the Lenovo WMI camera driver and
> Dell's privacy driver report for the same kind of electronic switch on
> x86 machines, so use it here as well despite the name.
> 
> The embedded controller also raises event 0x29 whenever the switch
> moves, which makes it tempting to report it from the EC driver instead.
> That would be the wrong layer: the pin is a plain level that tracks the
> slider position and needs no EC transaction to read, and the EC event
> carries nothing the pin does not already say.
> 
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts   | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
> index ecc8c34fb983..b5848991dffb 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
> @@ -51,7 +51,7 @@ sleep_clk: sleep-clk {
>  	gpio-keys {
>  		compatible = "gpio-keys";
>  
> -		pinctrl-0 = <&hall_int_n_default>;
> +		pinctrl-0 = <&hall_int_n_default>, <&cam_privacy_default>;
>  		pinctrl-names = "default";
>  
>  		switch-lid {
> @@ -62,6 +62,13 @@ switch-lid {
>  			wakeup-source;
>  			wakeup-event-action = <EV_ACT_DEASSERTED>;
>  		};
> +
> +		switch-camera-privacy {
> +			label = "camera privacy switch";

nit: other DTs normally capitalize this

[...]

> +	cam_privacy_default: cam-privacy-default-state {
> +		pins = "gpio99";
> +		function = "gpio";
> +		bias-pull-up;
> +	};

And the pin entries are normally sorted by their GPIO index

Otherwise, this looks good!

Konrad
