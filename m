Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704822;
	b=0SuI2592IK7tjarUdEwcDPDDOKvHRbbbTpVR6HW4H8P9btPJBglP9ByYJhqsAZys1CVk
	 ++TJVqxZur750qrUpJ2k9cicnQwuHUReD99n21ENi3/ifZYA9QEOlhLVCd2v/4r9GK3Gz
	 zcH6euo7ToGuqNOoPYwZo6kDvk/KfiRTEChTRM5hEsPqcX7McXZodlM/L5c7QT0fQHkX4
	 c0WvFEiODJAjf8HHwVFOWb0y+V5h9h60aoZX3x8jMEKRlVL3Z9X9fURgkxewD5/oW4jo8
	 EAFNGN7MLk5XfZRcskPlNfQhQXpzkqMYM2yHYLsElmGW96aKfrB8TzlvusZE3PhfAmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j4n1NUzTrR0kbh0+4tBojJyhHvX90zNprLFQQ4sMfGc=;
	b=Ip4ZC6PjuPwHjNWAgPFbJKKs434UCYQ48ZW8kTFrqN0pSP9uZhtpH+OjqxMUC5rgeKhN
	 UirXR9mb73i3cn5hHKI4HMPbDIvRJOOvjcJ5PJN3feunZRLzmAU5M8Cz+CBpFyaLVGZa+
	 6VgaNh/uhBfAHHvXspKzCjXsbKhF1vx8bK68J4Vu95rlJOJXZaKO7/8fwEwVcgGI8uIZR
	 VVi3ZtzCzWz5ll4se7kbggI9feYaE8eyXWqYsYRb5B9AcS4WKuAHnDsUwPuSVNl/SeX0x
	 oBhsVHXi8QBbpDhLOdRusOaWrDhN1hX5o2Bs5Ounrf0nTjBzR6WL8vAI/iAYtKGu4WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xx8mmWzf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=io4YrVAm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FD9606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80FD9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xx8mmWzf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=io4YrVAm
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV5rC3664853
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j4n1NUzTrR0kbh0+4tBojJyhHvX90zNprLFQQ4sMfGc=; b=Xx8mmWzfbaRK+Fjk
	gtVUnKXeR9o7esS4N1jJupBCvvPxykRHJXr1YXnlAFPHyBQCtoVAmtID8RV0CNCs
	QoPpPT0EuDvyDbzSuwvGCiOYjYP13x7yzXG1QaGPZmPK4pae5LtE2WhODL4iob49
	G2os4P+Q/Ax+zK8NYOL/rpTfffAqXk/tIHzV37MnmImA2noPTrBuU3yI9JY7zjiD
	9055+oErjq7qXfpUHOfKQ1iwb4m41IXgQhFnFTxE7gDD5kfos0FZvsbDDLgLxmUz
	gIVcnOLcKV6OcQL8H9sF+O24KhcDNhPtOy7RTPS3Fd1csDbS40zJC6C8er8Kn92n
	f5v+Gg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g9cks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:53:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac5877bso100238885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704820; x=1796309620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4n1NUzTrR0kbh0+4tBojJyhHvX90zNprLFQQ4sMfGc=;
        b=io4YrVAmElPYsFPhmR31kQJ8WLLKNXJSvkJr17We+WQ6y3SjMz44nqD97P4G1hRdqH
         3cWXWwX64GR7Qn2uaaxWWGcmfqwHskG5o/bcaABDtb5SN+isb3bX9/Lr8rcZXRr0cat6
         Lfc3cpFBpLLSLVU4NXrDOR+WD/tBATzZoTLezqqU1A0qE0uX8p/rC1M/avLlwU6u7kyb
         vmA0Mi2+fUt2jSHDd5B/h+9vUV400Vjcr9ZQUZkmZ6a5WitSbncAHEWi4hSH18NF5HLo
         zVUT/d/8xJnMCm3pQE2ev1J5w2u2GbekAFAdENA43NtMWOklId3ZhPuEwo+7IeHLol12
         c6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704820; x=1796309620;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4n1NUzTrR0kbh0+4tBojJyhHvX90zNprLFQQ4sMfGc=;
        b=zpzBi2/waefx52P1vlcRj2KayECoGuolX3fle9v6KKXYI2Q+Ve/2wWT2Z/tDgt1RRG
         47GEl7wzTButhBIBC3K4Rq1hU73JfDU3su2Ek5U0Aci3EHei1UYkc8K1XY00YAqiAtKL
         IcaTSzfr0Q3fLlMI9yyibWxkQUljajks6wRniFPvrWTt8HRyJjtvGvbIvd5x10hsReZ3
         rvkImbDqfym49dkraYQJRYJOeHMa3pXZpMOG3PD4Rq5HOB+I5lOGTRNe/6HN11UDRu8I
         W2ZSB4IAZE9yzr/X1mkWL4epZD1in8TM7QqMDJ2HKvp9yrx6CrDa8wsig/9mVa5iG6zK
         glpg==
X-Gm-Message-State: APuU4Z9tJTjRv6s/KcmGz7XgnT8UAlZEahVThqWzCir6e6PtqVtkupck
	maEmBlXDmdqRiKkM6ANvqxQ0+CqDr78IfLBokdVbJddB1koN0Iyl9ts4jg9x0QntmAE38f8kWa8
	fyeDPpqWSPlpEWzPxSWh+j9s3PMRnyzqssSRubaCR4OAQlL+80xQtmcGMWI3QGzVmc7YQ
X-Gm-Gg: AZFdTZcqCkAJBE5EWlFAhTulH0FfrqvQMr+0FXyhR9snfDXgvgCvQ4YkHX6bjVz8uYH
	qLuejph9TaVWpyhqJc9gbBGyGU3HkM/YWQC4khWkuzuCQQ6jiFA6ut1oRTfyqZ1lymxfa2Fzt/L
	U4cd4I+eoa/qv+tgrcohtqa/aAsJY8q1HX1vAHq4oe9G73keBFnTugaxr3JV+9u6z3ZXy/SvCi8
	MOI/EubKknXmVBCd6I4PBPlKZjQmlPxzD59WoW5oMSHd1ucyrtFg+Eeg0RZEY+Ljhd4cyRn5lE/
	DSwlVCqfkFqRKeOmDahhcgpk2n5MtfGryy7sGLepJOz3hRD5dPSRcs1qlwUGYPuF+8zzmgWFV5a
	YWBcB9wrtEZQ2dXJkPZhQtP6Lyn5zfnl9gDn1a88D2RL+bfn0WdyUDfyjbPgqPk70j//Yjvc=
X-Received: by 2002:a05:620a:a801:b0:949:a385:d30e with SMTP id af79cd13be357-949baa12795mr3838087685a.4.1795704819934;
        Thu, 26 Nov 2026 06:53:39 -0800 (PST)
X-Received: by 2002:a05:620a:a801:b0:949:a385:d30e with SMTP id af79cd13be357-949baa12795mr3838084685a.4.1795704819513;
        Thu, 26 Nov 2026 06:53:39 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1d03f9e5sm2794700a12.24.2026.11.26.06.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:53:38 -0800 (PST)
Message-ID: <130d0531-a131-43d9-87ff-5c6f069efd80@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:53:36 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8550-samsung-gts9wifi: Add
 battery fuel gauge
To: nacht@dxdmail.cc, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261119-b4-gts9wifi-followups-v1-0-2e2388589a62@dxdmail.cc>
 <20261119-b4-gts9wifi-followups-v1-6-2e2388589a62@dxdmail.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261119-b4-gts9wifi-followups-v1-6-2e2388589a62@dxdmail.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: G7N6mIH6Z0-Qwtm-isqWvmqPT2anuXKA
X-Proofpoint-GUID: G7N6mIH6Z0-Qwtm-isqWvmqPT2anuXKA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX6rUor+x0ox2v
 k1mdL1EFyCb0FGCPE4h0V0sWq/iMQxCjAcQgli9Jhk6Z1K2lArfxakJ/rnLrQHIeWlBZ2egJ/G4
 g+IdY9SmsIA53c+KP3rmlkwQnuM+bUQBrzTHhi51AZLYH09dQuxbVO2UVtFEIN7Iannoh+XL21c
 JVz7XdbpRmmXiPHGm72GQZjvh629pWT/qDErMyUIgO809BajoPbleInr7ijtApvEhCGY/lC3qpA
 1J1fAktY1ndGbpH5Mob3TjHIf4LfvIrOD8o9JjRlIAXLnNDlkswTMfS3djLlvKoZSkK7CaGzS6j
 f7dncxN8GDzLJT68ED4VhroQd4kkzURaeo0JgGde4IKRx8S64pB1jY0b7cizrKjeZcfuQp7x4Rh
 sTtofOTqI9BX9CFtjUZS6AWUwh3v7VKwWBt/94NA3Sq32Pvj+urQE4soi6DWowm7C3tSgfARNqG
 z7s71m7yWlmQ+jJRjmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX5nEOskO1dCQd
 uV2pYMOsICUFTMHCQdMN7gk2ocbpfIhPxBxNsHkrh0SBcjNarBon5PgUEPzBcHgrpTJMiU7r1/q
 HBO94+mW5mdJBpYqI7/Rxh1YjxNfc6I=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b0847f4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Qe4jBd7IcWueaIHj7iYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058

On 11/19/26 11:40 PM, Nizat Mikayilli via B4 Relay wrote:
> From: Nizat Mikayilli <nacht@dxdmail.cc>
> 
> Describe the Silicon Mitus SM5714 fuel gauge on I2C hub 8 and the
> built-in 8400 mAh battery it monitors.
> 
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
> index 8323eb837710..511bdd05d49b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-gts9wifi.dts
> @@ -31,6 +31,12 @@ aliases {
>  		serial1 = &uart14;
>  	};
>  
> +	battery: battery {
> +		compatible = "simple-battery";
> +		device-chemistry = "lithium-ion";
> +		charge-full-design-microamp-hours = <8400000>;

This binding:

Documentation/devicetree/bindings/power/supply/battery.yaml

accepts a million properties. Does your downstream tree give you
data for any of them?

Konrad
