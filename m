Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27BB3FB05A
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645052; cv=none; b=LIPv2ZjKbEJGd4XZkPvq/b7gNlOGW8/6E1+HwUy6LTCugSlV3765hFQvvbvTo8bfqw+LDGchuCouD5j3UAVj0zvgV/wtGUwexLa2fi8weCUx+Z93uzXeia7331snkFXOkRbtgjy4xYiZrMHAM328se3REvDtfi6xfp7DGVCy/xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645052; c=relaxed/simple;
	bh=zN09G9HHNIaRSV0MXtW5wSVQAhRgdo1f/EjlUnrkxZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d1A3OE9xZeQMAgCukQlRDmA76EBynUwSM3MtXzZnolaj96sC6fK2VVWLtaP7cK8BKWyZAgnLgotd42U01O4p5eiKwnyxKO8xVBxs/20t9e3spFTilHiKy9gT6PROM78UCWjbYXPdIFxgf7TGifsMVNCYWqE9mczwBDmwP6Z5tVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bwfxCzy+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CCfev3Ta; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bwfxCzy+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CCfev3Ta"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg3tK1842048
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:44:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jHoHpI3odSPNmkYnU8vki83ae+Xi9rQiUeDlxvIXaPc=; b=bwfxCzy+xGxQGK7g
	iy4/DGzupHblfzbGjXFYGRHHsDSYgrHxmsYhQ8415kKNH7KNgFHRWSPApKPM9ICZ
	aCXgmwCkjeh5RTE4laIVn0zsbz1oFRKc3+8U+G3Kkq/XQcbF/rJ4LM2ZuN0ioSEE
	OKoXK3p6Y5VD1r4Y/00iHdONi3k/9uQ5pgz+HDiE7pGMZXBK/1JtJWKrDjWmIMhQ
	0f3UkyAk3U3XejUa4Doh4ibU2+o5lSg65B/Cnb0vEg6dZWZc2ctm2uEpfGyly1ZZ
	tGlXAAsSealu7yKvkbcSOx8gJIqWnZBNo4FsbB2FxNaX33vifLJpeztYBPWUtwqz
	lqzSmQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se2tbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:44:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a312222dso73852885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784645049; x=1785249849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHoHpI3odSPNmkYnU8vki83ae+Xi9rQiUeDlxvIXaPc=;
        b=CCfev3TaG7DRhFU1XmuHv5chgtosA+iGi3tdBHkZT9Ot03n2WUx25+sOACLvUE8PP5
         sH6oF78H2A0TyC+HCMEm09Oz5eaNKZT/fptxtSRhPp8UlQIumguu1DCPLKUqqCyLbVrz
         BVZnwVo1DnlRmTsbeJRpXBZUmytqeml8mZySlN2dLMQUUl3iZzv6YUCpzdtfxvYJRldh
         CVbiOtF3R5Ou+pR8bQgd5ppbMnuYRl1qt2YFuXYU1pvtmtw3LlU3ARWOEEttJre8xdkB
         XB5J6+Er79bl48tLI+QZHl7QrGnB1bUrw37TBAyacwRVYJCthFGwDsekYsEN0r4Epj0Y
         q7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645049; x=1785249849;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jHoHpI3odSPNmkYnU8vki83ae+Xi9rQiUeDlxvIXaPc=;
        b=sD7S12vk7CRCHX6i44fW8u3kXf3m2iH6oA0K37kSNCta/jsvBqAw3sH6vHRelKxRLW
         mHOLrHDq2FxDEU7yUqLzl6d5JzIy8EYU1rErhAVghUXBfi078DebgaXzC2YYOq8xmNyf
         neLzfGSTfpNSe8LzxFI/5LhjDeIvjyXFY8Zj/c+LxhFfHE/BYlmAsntBoKvFvwc7Hse6
         SgXG6k+k7c6WCyvUH6Ngw/umF3z0tRraNA5F0EbbLC4uxxyZIDDOOk3JyOfYtzXS2Beq
         BmkosxFAaOBqDDLYb0rx08HtdsUUvs7Sq5bi7PKjoCxbGPJI+y5R1cAZqUE3YzSXhfdv
         dBDA==
X-Gm-Message-State: AOJu0YwocTkyiFaa4Ru6J0vnjAERT05PEQOVNLseXoY1ocWzD8YiDBki
	J4BWLmZ2e8rJir4RD0Twkgtn8mDmz8TvlC0vrKk2gCOnln9ML+2hndT8KMP0XmGFyu4KUf6tzjN
	nZJwR6vqNL4LPhdGHRCbbApS51kStp7ZbMzgVfiiNiefZiIDtU8s70d7hB8GSoNUcz/uL
X-Gm-Gg: AfdE7clFEy8VJF08YXg/40C3IFQFOvz+m5DmzONTxf8ljUgXuix24TJnKDaClfIIJNF
	fipn8FWss8a1AivmSTomQyr07ybnP5oP2RFCr2LCF4gTjtJhzOkWM+orXSVVJWHWfheVNRfHa/l
	p37mQwRgx+j9Dfgf33Z3szmFh00z1pmcXLnQXFkxXGQf8GnA6b+ju1jlvHNFHD9z7qK4RAp6Iz8
	sAPNC8pYCAv7Nmi8+vdLT4OVhOC500wI5R9TLzMrwmHkjQXWuSoEtXDO/kSbZvulVV4VP9JD3uq
	u77hKQdYyAI/RJQtAgj7OCSr5FZxNpbNRbZGfu4999EWuDIpGaNjiLkNq+INQQdO9C7wI8q0k3J
	NplF4QOlDUYohLYPOwZw1w9+P
X-Received: by 2002:a05:620a:2704:b0:916:1a60:ee05 with SMTP id af79cd13be357-930e6decc1fmr256814585a.0.1784645049019;
        Tue, 21 Jul 2026 07:44:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:916:1a60:ee05 with SMTP id af79cd13be357-930e6decc1fmr256811885a.0.1784645048458;
        Tue, 21 Jul 2026 07:44:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009ae00asm595403966b.7.2026.07.21.07.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:44:07 -0700 (PDT)
Message-ID: <4cb7cc6c-4363-46a0-99d5-ad352d365662@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:44:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: qrb2210: fix PM4125 regulator
 supply parent mappings
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        jishnu.prakash@oss.qualcomm.com
References: <20260720-pm2250-fix-supply-parent-v2-0-60ca47031b50@oss.qualcomm.com>
 <20260720-pm2250-fix-supply-parent-v2-2-60ca47031b50@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260720-pm2250-fix-supply-parent-v2-2-60ca47031b50@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hB65O1hZEIZoKbxvABn82yTUrXwKgAE4
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f85b9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Ar_5JxPjAAAA:8 a=EUspDBNiAAAA:8 a=O5Nzd4jY1Dkw4bQrKBkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfXw2i6dhm0xzPZ
 tEYbrsq5phFX6i60dPacTrs+6NEIZPqPBAQuOCpDQvvv696Yl5H4gvR1V9Mmz6q5BvFHBEEzZTP
 NR+3HTtigKC36IZQZkDKTHYGjSlV7mw=
X-Proofpoint-GUID: hB65O1hZEIZoKbxvABn82yTUrXwKgAE4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1NSBTYWx0ZWRfX4eZz3iUa6DuY
 HZY3BB+VquLdgPdEJTPx0pgmtAXeHM6gBo9VObbgvkSuvB2apugs5HsSzD8ZktRiBUwmBHmvk0d
 uFgfDjzuN5NJiwSCqcyryZCHV4AiE5sEVzE6Kx0Z6pzgqkTf3rAmX8expRI5O1lpeL1K+icFiR3
 V/eEyhtRLWC5Isa/1cg/mj2GuEiIwwkuawkYGYQduZ8DH9sNBWk3uO8evgAy0lKfSyPPmArI7IO
 bAOPcfAWniyhzQhExlJlIUtgNTi/Em933R+HHiVsXUg28SHqPXSHAxdr7v+QUGeJxhJan9WGqSs
 VX0N09DOh6PwA20E8yYEH1wV0tnX47rMuEcsa4eoyvlmlQc6gJWxLQfBTk9PfEXPtrtHGe3livT
 qjrgJdgjoRFzqKYD9Kf1/n26xOypSEhw+5Q7MyEwExRONQrOdb9hz4PSOzQlos9vENRTnWUMh1f
 qa+0Cpao8moqIT4bpnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210155

On 7/20/26 12:55 PM, Rakesh Kota wrote:
> The qrb2210-arduino-imola and qrb2210-rb1 DTS files used coarsely
> grouped supply parent names that do not reflect the actual physical
> pin connections on the PM4125 PMIC. Since supply rail connections
> to PMIC pins are fixed in hardware, these grouped names were
> inaccurate descriptions of the hardware topology.
> 
> Replace them with the correct per-group supply properties matching
> the actual PM4125 pin connections, and align with the companion
> driver change that sets supply names to NULL in the qcom_smd-regulator
> descriptor so that the correct supply topology is captured in DT.
> 
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 13 ++++++++++---
>  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           | 13 ++++++++++---
>  2 files changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> index c472e13fceca..90e6eb284a66 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> @@ -262,9 +262,16 @@ regulators {
>  		compatible = "qcom,rpm-pm2250-regulators";
>  		vdd_s3-supply = <&vph_pwr>;
>  		vdd_s4-supply = <&vph_pwr>;
> -		vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12-supply = <&pm4125_s3>;
> -		vdd_l4_l17_l18_l19_l20_l21_l22-supply = <&vph_pwr>;
> -		vdd_l13_l14_l15_l16-supply = <&pm4125_s4>;
> +		vdd_l1-supply =  <&pm4125_s3>;
> +		vdd_l2_l3-supply =  <&pm4125_s3>;
> +		vdd_l5_l6_l7_l11_l12-supply =  <&pm4125_s3>;
> +		vdd_l8_l9-supply =  <&pm4125_s3>;
> +		vdd_l10-supply =  <&pm4125_s3>;
> +		vdd_l13_l14-supply =  <&pm4125_s4>;
> +		vdd_l15_l16-supply =  <&pm4125_s4>;
> +		vdd_l17_l22-supply = <&vph_pwr>;
> +		vdd_l18_l19-supply = <&vph_pwr>;
> +		vdd_l4_l20_l21-supply = <&vph_pwr>;

This matches Uno Q schematics:

https://docs.arduino.cc/resources/schematics/ABX00162-schematics.pdf

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
