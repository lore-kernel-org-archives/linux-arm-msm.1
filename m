Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421602;
	b=cgSRI+hrnI+1CSSy1q+g7fC4IQwfiEIdU9dehVYi6qejXiMrYJKzt4RplvI/ZjeD6TCU
	 uzjTfpMY0r+d/3BEGbFbGUOVddJmPNWTe4W4TYgupCBOy2Zcttx/Z+/o8EiG5iymdEJVg
	 pE0Y2+2MNwQsqBCvF9JhFssv2Hntggx0Boi6GQm4MShS43cvDANbvUytCWxX2Sdg2fePK
	 0zzOy4ssnENMeM+32lwC241v5CHccm1ZDioliwAQYxbPhGmqESodqxbOaM0piSJ76IZ4J
	 y0BTBDSrAkf58V/4vD/yvxn22zCtoBeDNC8XNRnGfAHuOk3PZBg2vKogFvbEglNYLKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421602;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=;
	b=cRrhoc1Smcmo/Ou8BTXXAK5Ivv3RGnZA/sE/M+/X7eOCdFSjHIG5/L/uf+1mNBr70xDx
	 d2WlMrKAOypO98DrSpDIHXL7w1TfWnpzud4artoics8W57aTjQLAjjNJrCOXthJt79qkr
	 PoXtM+XHEeaeiFXlMezDJqHjSORQjyhWHeJMOtBvKK+rz9rjIBGUNgEnQBLbxlpLc0a4o
	 iAesmJBuPR2Xo4uCqZ7qEE6f6APYYFs8mUs5koY6yXYiSGniWOJ00gvzWZ4KiOyEQuDOS
	 LtCaiSq0JOYT8sknQfBqaEPNIQoJ8SYPp9hPlHxB4aZaUyEunVQ/Zo32Y4IURDalU4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="cXYZb/nZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=InXncrrH;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51326606AAEA
	for <linux-arm-msm.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cXYZb/nZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=InXncrrH
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9333E1D11
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421602; cv=none; b=YIlgM8s5sYaTu0MxmFX430dicA9QF9fhF/kTE3iQici5R0xGuinLHGbkyw799FUDkEoIB0qGSFsPUWBEffSLmEf2M9F28h/ibancq6bCItvv0ndT32Vw+QYm8Rt3ZpkwYNqCFcXqps1VcgbGWgELe1iVniiM5L3xLoRXKC7UBpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421602; c=relaxed/simple;
	bh=VUJcuiGWrc/VTOU1ddPCEZGdzHccyfbVYcukszE+EZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S9480tZxR66ofjIEMA/H5t2joNyM2e3pAapWQsom2Xi/lxgdOr1gWHP8AxR0XkypqK/SPrtzTsHHg7Fz6kRDWwf4k460q3XRpKSWUiHbWSF+NJRNMZ7b7jKR7NHmvR1DoWmE/X/2W+Bzj/EtOIdHrB6DKnmH9f5yvAwyI0IXB5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cXYZb/nZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=InXncrrH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JDxwa42625966
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=; b=cXYZb/nZKZ0bU1h6
	1XNLExxGiATo/yC39BDOred/ABS9YYZHO1ffkSyZ+l6NBFihi0Iyqpfjrd/o4ukv
	l9NZGKcGfgemARpS0sBG0RSt/fiH93EBBbHgu0i5HTF1k+4zhEIh823EfZvSL98r
	vEHbp3rpO+JIyykJ7xNI94k1tfmDCV6THP9EqkzNR1KWiwN6VBNuc/AiAtjLy4gJ
	2VXpD5PI+f2pD0JcUR3mCHACkmj6y5if5C0AccwZAQjpYUsQ+c75QjP98ex+2059
	ylZoB4Lg214OTqW0gsodXtUQ/dQOBcAYcJ9LaO/8sX5TKMp0bzo7hPRj4wlgqexv
	ZjzYEg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdkmfgjg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:53:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so77840285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421599; x=1793026399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=;
        b=InXncrrHO4WFX2pUhbfYtCLaWwjdy/Irk4U0b5LshT4Jnf6frJBjtVs1N5b2WfOWBd
         8H4L7qn+aK9VViccuhBY4CAe/Rqdf9AThvgj4r/3LidHxYzxOang27NP1jVVsAiJMXOU
         ZDDh4RWASBbI9dPKkrhYRKVwQ39NmA/PUW6u1ISOjR7JSgIfFD19eRnnNlqBqwOreUOc
         1nXR5l3p3AnRN0ksMERplqwQQCpz/073/XFJO0XsfavHfEN+vPjk9sJy7ZbP+JMl55Fi
         JkSQeDHGk5Ii0ghpmzvg3sm/n5p5y28Qc1pw+RR+Dki9AzobJCWQje6iH6GZWX7UAQGg
         Y7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421599; x=1793026399;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hFMMKNRMDSpzNpvy3+kJ1EyZ7wJpKMIzqJUYG/JxNwg=;
        b=ywaHVY9i20grRfBnL6Ld1/eM0JLtbPrZ40kpohAFx/cXvC7kkCz1/Aost11LRoJf0V
         bDCy9lWoCM6B4gJY4XOWiln+SO8hT/Kt6ed7LqibY+HOr0p19R4txB/bb02WUm2ZKAxX
         ejDzcV2pJvZVwkQhuoKgwdrZE94nOKACzLDwoN8B+ZZkM97c3nWGOFnfusJI8XfVLCne
         6NjZyxZA8l+Z5pedJbY94Hq4bfPx3O8pRqmSv9dkL2WP1Ty0vNFHG2t3LB87/Yn/0Aqv
         CfChYm7obgaai5kzRVF9pNDw58IgHRghzPaFYv/uEjHja2BhiJr0HhnUvcka33UspaAE
         Me/g==
X-Forwarded-Encrypted: i=1; AKwUvBxQHvESRUNZQOkiMUcYUguRQ1iSqphqmygLzBVeHJ/EQNHxwASYVh3HNmkDfsaQw43e9n+EceYTYDvxBmtB@vger.kernel.org
X-Gm-Message-State: AFq9FYKOG5O9hYrww1+0foD0D9MH5S3gyclDZmT0r668MpEB7t+vMtW3
	4gOCiVf0AjOT9kdDPEvYEGxVxk4n0qJdksG8kIc5E3yGIn709RzhngrvmEmYg8U3hlCOEAdGawa
	B1HL/AcRb/J3zk2m8BqLk4RhNlrJTtzr2qDVOdZdUgL8giRbHkBxjAevMVXXkpv9wLYnK
X-Gm-Gg: AYBFou07AZEQrbtT+ZJxkxdXsTgSxsdWYfYXYOx3cugM/YWHKaV/L5HCi9p2Cen28s8
	z4peBvMD+LhGOb/8bIb71RD4HIr5O2oEBB6sfyagLRrNqt6TjM0nfAMOSkXfjodxNP1Ecd1Zkof
	AyhGJ+cEObKMJPgnnMvJzVYxf25G/xgibIKdm93JdaTZsP4B1E9+RJkuVS4LX0ZreuFn9s+5aRD
	Ju5xiHGVgxGei117aLUSOjrp7accImW8XmxLrm3QX/ObBAvb8JUx0pdEb0XrDnd0cv+oQb0ai3s
	RbZhSSNVp8aVugX+lBpbo1JCGDWzZnOxF6ImS68zeEl3j74o9mtIaCvha8bQ9165wzITUz4hK9B
	kjWjS+z51u5ceTzZAUJ+VFw==
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1480042285a.4.1792421598982;
        Mon, 19 Oct 2026 07:53:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1480025385a.4.1792421597304;
        Mon, 19 Oct 2026 07:53:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:16 -0700 (PDT)
Message-ID: <78fcb970-250a-4852-b514-8d3eabe535c0@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:14 +0200
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
Subject: Re: [PATCH v4 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-8-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-8-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Sc86UAEOD2eW1RsaUSgdHpjsD00xtYEL
X-Authority-Analysis: v=2.4 cv=O+isLx9W c=1 sm=1 tr=0 ts=6ad62edf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=X6Y4kDKz15hUnpVYhMEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX2xTlURNYuOEc
 yQBNW3hvoy4ogx9F/uuq9HQ4ThkQlHHE2UJVB3OkrlfY0W3HS/2ykPHicMhMPcU/t5fIJ01oyHe
 gfoOoTEadXuVCUz2u+8ECHi8keDSIAAnGziELePETPuqZRjV8rDC90Yw56y4O+OQxMVZ+HRE+EP
 pZCNuTb6NfLcCY3yJL+aCb6Ee7hMGf8Ckz1uZ526P9P+vDrQf01wu/aNJcX8AyqNod0h9MKbB4Q
 OuBkegxdS+HksmJfVMcZFNpuyz2PvbA9Pfg4KRm+BZtWjGy/YfphX76Nvznts0r1UXAHiC30yKa
 ENZ8sMOefw8wZ1GGx9O+whtCxCGvmfPHBVL9cidC8Gz0qFQSiyTaQYI15sSSceqC8g0JGhsvGGk
 AfZgMqXOL7PgWVrIJrPr/gjn3R4kPlNMP/xPiIq2yttolG5200bzhBpbvIuvOU6wlJ8mK3NW8W/
 3Zg3rSCcLEuoscc7Ulg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX+AptRRFbI8lT
 rNVvvnyGtnVgdyUB/JGU/H0FDxAl9J7UhodQH6QHcfdmOkwFNCQLlMFRuv4lRh8IUa3Bs32Tq7y
 uJZuJRESE0ajtfYO3VhoyJ3n2EsZpX4=
X-Proofpoint-ORIG-GUID: Sc86UAEOD2eW1RsaUSgdHpjsD00xtYEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8550
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
