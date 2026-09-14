Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F22C418A34
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376121; cv=none; b=Wrw/dzGroAHXhkk97CuNKxea6rv3lJSnQVGanmqcOKry+h048Vy2wzCjqTSyplR0huweBPDrwt+fXxT3g4Kw8qd9lblS0zoQ4kVaV7KU3Hd9GbAaJTNUt3cxnz73BfZgFaEgdgHC6XMOyW5uCrZNEcqQvpPYyTZpEvy0Jpr52fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376121; c=relaxed/simple;
	bh=mBwpmAlf8UOj7gLdgmuGOkNJK6FZ3SWwkbTLju9999M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMhKU3U/mHo+imkoaXNVU9g6U1NWo6B68XnoDhF9UqaTIobCCI3Vh3HG41rju77hFCvpSZ8p9OrBZYCLK07V4juuBwXfDIKT8wCbkBVvdUIVJuwBuk//1sUC+396rmxyiZOqk9wBDhtVI2t19uLd2baZWzKd/skTHYZfy4+dRSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Su2TlkVn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOpKL87O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Su2TlkVn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOpKL87O"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j0kG3369463
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	epaQStzDoArRXzyD8O/qeY+JFQbJLPFewZCZkmWYy3A=; b=Su2TlkVnunmo+PnW
	f0uDr/AI3EsrQIubw6Ud0xLUJ3BiwHJXAFO/T19rlUCukaNRCPEDNmWs2cvJwKdK
	62QDFHQ2KLTV7NqTY2CWX/meXZp3SPnCIDpAD4sZFewVH5hlvNZol2mJCo1BQhRr
	PeY6pvydp7k6B9lPQivYtZGMeRWmFHf2VOgKvNexgixOWkn+Rc4D4GrR4QGtJ171
	KOH05/6QX9PGtRUZj4wfwZI0Pj+afYjte1YHtYWLSZS3GJjw84x3gmOTzHFCm4Wz
	sByZMKsHhDrgtBcnowzxJigu9nzYPB8rX9UtHtt/cGyKfVztr9bK5gqzZDGHIHMK
	GpYQpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5u5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:55:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939fc317691so49628485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 01:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789376109; x=1789980909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epaQStzDoArRXzyD8O/qeY+JFQbJLPFewZCZkmWYy3A=;
        b=DOpKL87OtoMCIRbPV1XqjJ/zTBM6UQ7ZwK2wOdmdKUCqPkOuGvz3YIkvyQFa4THBVe
         1bA9EWUqX5fkwyA4kSHyYH1Tyv4t9pl8LtP/Hs0euvgA5YzWv5VerkYiQH41zBAI8byw
         +ZQCQECCfP4xloPw9K8tuAarXMhmixQioIMiRyFWaYTivQOKZX35Yh4XuyPcJ8Evt4nr
         oPW75iJXK2+caccCkkKll/Xwqr4nh4xTjqwhd9BaMZvMWXv1SReIZDfHQm1qVho+rBbp
         zDUEZRLeTGLUwL+o1pcLQD2+K9vPS+2q6bPgsvrXw4JnyteWLkmPtp28r22VpxOF57+s
         vWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376109; x=1789980909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epaQStzDoArRXzyD8O/qeY+JFQbJLPFewZCZkmWYy3A=;
        b=UF4abLYbQasJvzWQNbeOXxsJZno2dGbth8UhZhVZYqGbwu/oSCCk4jbmwn08YV6i6p
         Y9Bggkz5ofjN+KOMyd0z/6rrmIVrtyFJvhALwuk4f9yY/CHvCRrFI2O+UWPK5P0wQAiH
         hbQK0t9YPrDU+iUPOU6MDUr30RBSGnS1QbYGsDZe+JAiao/oID/xYmy/fytHBnJQo21K
         02oJcgfu2sqGVaf5Wza8XRarQK5B/IfHeoEpwaw9TGH9BDegTuJsdJId3Ir6pH/EPXqE
         qPsrEgGEnLICP8SammaUFeJWl6rQEkerCrIOjWzHAONlcgDhJ+cMrTS6oMqEvzaXi4eQ
         gdhg==
X-Forwarded-Encrypted: i=1; AKwUvBx+NFmTXsLsQs75aNIZfMv7+NKV/ldiXOOYQTXfegxbtaCROz948H9wl3kRYnFJSwoLscFzYn35qruWhWi7@vger.kernel.org
X-Gm-Message-State: AFuF++lOOQAhs5aCpFsFZqorexJIJvUtHTwV8udQj2l9KtjHv9FgJFd7
	m+ISTK1NK/o9zU9N84CKJRAkWFdIjnhWFutoo/o16gKwfAkpAeQGyKq8c7m0OnMT+XqCx9uJg98
	C2N9sN3nBbcXpB1sQz6J6W1PkhSJdZCcD54ZViEBhT3l66JzmypUq+7xaohGCb+3Pu6XT
X-Gm-Gg: AYBFou1LURv1XSLXCgz9zT190uDFc+ZyhH3WapP9sfLbtbqeIiB0yxk99hJuCB7uc7j
	Ylsv2ZEoluxXTXCOM56AR6T8niMeGOr8NEEx7rgPMQAG2YYvYrRrQCPW99oRIKsCikTXmhSyOq8
	CH5aUWy6BjSZOL07ry3sXR0YVcqSqD7b+JCb1JtBQkVLN/GEkfzP2mzG/a5cilAy3V+o/Vu2o+f
	HsJdNIGHNRYypdDy5sibJ3KKe/WFlejH+lKtkja+Q1Nv51oLGpnShLcCMmV83rG6RDVqtxDFjjt
	ZVwToM90dhd9KIdHFQTtbB0j61B4oH8B8KcmYICY1DhZnSUdXtuot0CQlndm8gFH3627ZqkM/1f
	idSJaXMDBXQ7xWDePxInw+w==
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr168691085a.4.1789376109046;
        Mon, 14 Sep 2026 01:55:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:931:23a:83ca with SMTP id af79cd13be357-93a29a3892fmr168689685a.4.1789376108674;
        Mon, 14 Sep 2026 01:55:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5914700sm3691780a12.12.2026.09.14.01.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:55:07 -0700 (PDT)
Message-ID: <b97e6ed3-a5bd-4934-b2e1-4838a65c798d@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:55:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: nord-ride-embedded: Enable USB
 ports
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
 <20260911142040.100263-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911142040.100263-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7b66e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VOFYJ2K-I5rkPCBY1ycA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyNiBTYWx0ZWRfX4j30rSc4wSR9
 YsRlW+iWPGwZP8SXoxjZfbEVuT4PwPt+uPon+t6F4kLGULti/DLjX9VTjIrhhxdYpq9pp13xqb4
 7pqQvrZY1b3dZoFvKMG+cEIBPlNNZWMNPGjgb7AwY6uClo+pG40XPBYRdfkV24b57WCWSxXGPRi
 67yg8M5i3/0YOZUdwsrEVs8pJAHDEhsntusg9gBWCwZUx5VRJ/8wPnQbDnMSghbuNnOyQsiKn7x
 w3oE3iSqHoDtvOqfBxgUs+b9ESOGLvzqlDkVfmdBHBeB+90S9U+YXANAL2bSHxNDys6iaGWT/r8
 DrZ8pzlAh3k609j/MQSAtaOKeEwFfxqoGoxT1bKM2vBC0B5naAKecihAnUnzMx2t1b+SSWULNs3
 fzyhNy0xa3J+aQyIGD3bWXJqNvTaansOr6+LdFevmO28guJqN39mwehuU7MhAsVZ/e3fQ7AYcT+
 O3qZ2SFv73Y6iYbVbVg==
X-Proofpoint-ORIG-GUID: KBcdfXQF2AcU8Vj-v3-GYJU25xGpSVKW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyNiBTYWx0ZWRfXzx00y2zIoxnC
 AJCgkIHPnQT8wUliAm0/RBNl9Kmw3/wyij2mkr0RFB2JrNnH8lvBKRk5yRej5OFxUs9Ch6NCyhl
 nu/E4oBqw148aga0U6vizt3710b1BW8=
X-Proofpoint-GUID: KBcdfXQF2AcU8Vj-v3-GYJU25xGpSVKW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140126

On 9/11/26 4:20 PM, Shawn Guo wrote:
> Wire up the board specific pieces for USB ports. Enable i2c9 and add the
> three NXP PTN3222 eUSB2 repeaters (one per USB port) with their 1.8 V
> supply and reset GPIOs on the PMIC GPIO expanders.

[...]

> +	vreg_per_3p3: regulator-per-3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_per_3p3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};

Can this one be non-always-on?

> +
> +	regulator-usb2-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb2_vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&pmau0102_h_gpios 3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};

Could this be wired up to a (presumably) usb-a-connector?

Konrad
