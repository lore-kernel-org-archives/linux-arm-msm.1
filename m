Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CAE2D838E
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161451; cv=none; b=k4pzS8RUf/6GVpB2HL6FnzWz1ysP0TtHqE1A5BtxYLx5EsvtqtcqUYiJJyJ09e/tKRjvkOYcr4EAqt7K61R1il6NA6v6B2ioXj/jG97UQxHC3W8SOCc9jxy4c2jk7uptIBXa1bSI7Zh3xG7eZAMVglJ8tJwMD536zwC76gtCEaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161451; c=relaxed/simple;
	bh=sYzfFNiHLOFe7rtHuV62LOf39HE9HO6aDIV2YjmJrn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QiBa/zbi0i8wJFQYOFev+X2S7aQNA/y8PdG6MkZsWdkqE/82MVqv1o985gkGzE+TBSQCZM3v6SNuLbX7hdHcSDDxtWN7Auklc3osGvEbxBMYqZoCRBxmeUo/1QlULYinPOjXQDAPaEAnPxNqt7eu3OH1K7aQVd6SqTEmzdwgx1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNcyjGPL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8SNfd5x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNcyjGPL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8SNfd5x"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52TQU2617681
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bWmFsCOLCfw9uVVhGr/yWEbonpRpgAOqxtw70nMw9ng=; b=CNcyjGPLSL3XwoLV
	LmYBVIT5YYGKzTf1I1o2Q15WSPWJaK76S/z8zPqm++OhVQ5oA+ImLH5SIizWY6wU
	Cw3hjEpiGJHNfhYOUGyrk6V/NFhsPY0TKs/RKXHyuXeHZezyDw9XhxAUtEKTX2EN
	+f/U6wlmoU/Ri+kAIMxRn6Fwq5P1qON4Z8NNTK1+cJAnGTUBmvOcqQnTnnDsh4dB
	4G8FMgczP9OYTIN4wIlwSwbtPAIejIaa68d8MXMU6f6L7Sk11Go6gY6BpiVWtHGU
	sqSZQOax8B68gKWOl5SX+5yf0AZMqurPfBoOZA/qBS3F4D3CdFjhlv0tcOlqWdWf
	AMQbhw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2n6a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 07:30:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fa40fed05so6332491cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 00:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788161448; x=1788766248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWmFsCOLCfw9uVVhGr/yWEbonpRpgAOqxtw70nMw9ng=;
        b=U8SNfd5xMM+waE73YpIJaQOyl4N23Fvk4p20N9JwV8RcEdJ9ZmbiZaddc3z7KKhJE+
         1SQMzRz3jsyTcMUeTAivb+t7V6xgDgkBtfTY4ws+kr98ppsE8SajfuxjzQgo+eMxWIZn
         LfsnoPuyaJGVQzseWL6BqoDUa+sRYL8ovw14jhh+mFnN1bbx7NzwJMi8FOPuGa6Valti
         efEtox1sqeKGrnrxXlUZ/xW28kaqGt1JG6jyAjDJO57OdqQ0j/LK6sEOhL8N1KD/lMq1
         xoyyQSDSqXFo/19vGM7oDgtbv7Fi1YTdlrIx7bodeIWIYlG6m7scnx/6c3bJLfo443cJ
         cVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161448; x=1788766248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bWmFsCOLCfw9uVVhGr/yWEbonpRpgAOqxtw70nMw9ng=;
        b=F0LtPRbJTy+dPR30TyeuReirGTJuaooSSdj7pFcZaFU3dWoDIZSPw6mZ5JTCu0EymV
         eE7PWvjDNljom4WZNWtUmfP8v1HZhieB+frHANe2AB6f3gpKZ8bRDJzoO9KnNgpZ1gqV
         X6jKBB3XIxmn6JS1sYztuuHAHL/oIDh20YmJR5VgICN+s1/upO6S5Dwk7r1uRye4YAYt
         vjN0hLqTw/jQUaA4BtQ4PQ0o7EyG6aDVv9B1ehwwSXN34GOJoZfxS8f7n7wR23Y3OR+3
         nVeDGilb+VSQRtntzYssR/7LjT+A9ztl6e7s8X5fpAAme6NyZPKNXS3lluBd9Y1g4Um7
         TOdg==
X-Gm-Message-State: AFuF++kAjGa8en7VjKQM2iTP1LcK2u9/G0efDgPdnByEWrlqLyAT8psi
	7NA8ZAHgBHUND9M3QTu4WkbvY9nebyui0WRvziZBfJWwcYT2hI/qHDl4RbNe8kGyDbZSief2hhW
	rYwRPG0HoV2dE+mW/lsxlCyHEpRqUCYGC+1wSd8L604vaSyP1ZLVcs+lkR3KRgvn56SR+CY9NZX
	qW
X-Gm-Gg: AR+sD116FgViofccCzlpd9Q8FAC+6g5rsrg5DGIk9F7eanVvtGtsFH2V58LuH6QeyYp
	l37y0fmE7N1lcUIlGy9ha6juAtTTNL3D47ZPzcxUJf805kRkm19DSwr3Bnc3Sv+40cm3WPAYXun
	lPiSJMfWkEAAxy4hCCliNEj7hrRlSQfXWJ6x2hLk7hYxD3GMc8TM+K1wPFqf7SexHdIUjmlUKLw
	nMH1Hw/3M3kXBDscFqZV874oFwWPed+uNVFGzY1uGHpLXHUXtkh8eNYuXgsBfT+SLqg5q9mkkDv
	YfQ2UVKURkofpo6015f5jbfgWuarazEddLAqc3vUHzoSCB+RdAknTPzSIQthGuEnwzaMxARcgXO
	vectlo3rfsVfi4cg17o6o0w==
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189545551cf.0.1788161447745;
        Mon, 31 Aug 2026 00:30:47 -0700 (PDT)
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189545001cf.0.1788161447226;
        Mon, 31 Aug 2026 00:30:47 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c4a7sm3209414a12.3.2026.08.31.00.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:30:46 -0700 (PDT)
Message-ID: <c751ed46-03ee-49c1-ac73-06bf32963b0d@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:30:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos: Add RPi Touch Display 2 5-inch
 overlay
To: Abhishek Thomas Varghese <tessolveupstream@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260827-talos-rpi-touch-display-v1-1-911705fe6d6d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-talos-rpi-touch-display-v1-1-911705fe6d6d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qVmmTtNF_8PpxV1dzGDnw7Aw0IPL2VBU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfX0NgU7I89HzBz
 Z1H4GkUvqqazZ2lXAJdgkukP69oE8I/I4585di6EULo4JydnpJvioc2O7Io5ewWtygG+z9wb2bu
 smlu/RYb4phITL8yW4700NIC+sKSlMxgP/xAvQ8nsQo048gWrKF2i39PUKqsEw6IkqTSi9+f2mN
 Y5UY/E9BTXMMuPodRwMxY4AhrhZYPWY/nbF+DXZQLNcWwiXntluy+t3lVAIkIq72f+ClXoDDPtJ
 1a/fgymoKn9yhWov3scey6YtlCpmkyO3xPof1Tv8KPnaBeuQ+2camU+IN9hmgZCY4rVuItzHaD8
 A/xw9XGsGqP+70P5i++S/hOnRHr1Fzqvcq92vYwgltbZf+hePN2UQgwl1Cav6qWmAVm+Y4TsfQO
 F61URCOLiI3iytA9fRPPInGQENg3RVJesXnoTot94AXzT3WwWhyfXEG9cjC+W4zCKk1FOArAIBd
 otvnHVONsNCMC7T7MBg==
X-Proofpoint-GUID: qVmmTtNF_8PpxV1dzGDnw7Aw0IPL2VBU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MyBTYWx0ZWRfX5YyvabZqUM/n
 0cvukwUAOawBseMxjLmP22ESBBrzgtaRoacAlnCeH30MJsFL0vUm9SsffkZJjV416LdWCXIVjLH
 vrKsn0nJEQra0hQSHjRWLPCfcWBgnM0=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a952da8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=7_uUrrCgaLEmoTQF1WEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310063

On 8/27/26 10:58 AM, Abhishek Thomas Varghese wrote:
> Add a DT overlay to connect the Raspberry Pi Touch Display 2 5-inch
> panel to DSI0 on the Qualcomm IQ615/QCS615 EVK.
> 
> The overlay describes the display controller, panel, touch
> controller, power supplies, and backlight. Disable the ADV7511
> bridge to avoid a conflicting device on DSI virtual channel 0.
> 
> Display output, touch input, backlight control, and concurrent
> DisplayPort operation have been tested.
> 
> Signed-off-by: Abhishek Thomas Varghese <tessolveupstream@gmail.com>
> ---
> This single-patch series adds support for the Raspberry Pi Touch
> Display 2 5-inch panel on the Qualcomm IQ615/QCS615 Talos EVK.
> 
> The overlay describes the ILI9881C-based panel, Goodix GT911
> touchscreen, display controller, power supplies, and backlight.
> It also disables the ADV7511 bridge to avoid a conflicting device
> on DSI virtual channel 0.

Copy-pasting the commit message yet again doesn't add value to the
email

[...]

> +&i2c1 {
> +	clock-frequency = <400000>;
> +	status = "okay";

Let's uniformly keep an \n before 'status', file-wide> +
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	hdmi_bridge: bridge@3d {
> +		reg = <0x3d>;
> +		status = "disabled";
> +	};

And let's not define new nodes with hopes that it will resolve to an existing
one. Let's just do:

&hdmi_bridge {
	status = "disabled";
};

Konrad
