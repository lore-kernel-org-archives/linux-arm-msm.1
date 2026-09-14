Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9496941166E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375240; cv=none; b=Bh/ngVrhv3QpVmYJbIBA4sCv9FauukXvo8V00T65G4a+QqVtD/1ELX+FFFn4nMPqZzL6rHiuD+22Rx+d4pxjbA3axciR9tVCtENE/D7evhUNgUqHRF/dKMBoIpdKlx6+ZXPqw79fDgU1rhqlIEEaIrUQ1aGVfMCwZ/3FZT/PUxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375240; c=relaxed/simple;
	bh=eDhH6FH5oGmxehyCqvjpvgqGLqBfZ3YAWWKST44eo/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XIB4AjXBwQ6EzYfnzGa3GyjTEPsI5jvuzmBYHOpEyvQPj5fqEMs/i6UZtbmmUUmLE39ojzvA7C8htPGVWbG7fI9/RjwR8Vr1DTiQfzB2NpajlZHgSB+I+WzEf/kQ4tlXs8eX1ungSD8cI6FJfvhVoXEgdPkHfHP5eaujTJpbqOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBlVdxtK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTVkQA4i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBlVdxtK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTVkQA4i"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ikko3901085
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	amin/Mdn8cRh5whVLqS3TSf1DFvxn1XCy/uV4GsQz8s=; b=aBlVdxtKQY/PTF4R
	QLfH8yeHIKLREEPaF8JV1CaECu/8zgawg0m3q01c+2Go65U+7RJmjk2qG7eTlPdx
	EEKVUYAmS2E9Alt1hJOTFgT4VnZwq+fbRF9mCgHkQeWZW7G9SdZBN2/vsHRGmEka
	wX3jkDq5cs3nf+iU/rKkBex+IfQNSWsz80ac2kUaiJFMH+Fon0rgAS6oONcNQlfD
	EZDxD0WlTO/ObOYvABCNmoTWv65gz0n88O0OGAU6swUhxNV8lcwdTwMV1seSODA0
	HKrV3K0d9RQ3YSZsI7KCboz6A8Hh4MqZKLdquCqdKmj1ldyH1UBoT8J+GeN6TjSl
	30EBTw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5rv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:40:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93821883e26so82121685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 01:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789375232; x=1789980032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=amin/Mdn8cRh5whVLqS3TSf1DFvxn1XCy/uV4GsQz8s=;
        b=KTVkQA4iVb04cFGqV3NLBzYZTpkT5IEbpskCqLGpCCiunUIiqF6h+Wyg9peQ/tu6bk
         KHArxkXMLzws6Li5t4UOXxRfsG5FfVCk9t0IaqtcuFvTiSPJSZ6lXMKdjQ4gmQeR9bY0
         hrpcUW3pu7lAabwwPd+5XZUucjmJMyl+ce0+5t1w/IEEvMtjNiWFs4TW3u43JR2ZVW4L
         FhGARQtpblL9yqXHIARKJ1LUV9Wr60NNk1sf3H1Sbej9wZmOrX2gl9xjIGrmxnd8mbJ+
         sSDNUuaMT+hlkBYAA7Z/B56sJK8VkBPDq+T0DU2AlBPfnY6NeBUfWMR1t1y52Y+NqK4L
         9Yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789375232; x=1789980032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amin/Mdn8cRh5whVLqS3TSf1DFvxn1XCy/uV4GsQz8s=;
        b=KWTZypcFtmtPPoQMcHf0ODgh17y+uHcdKHslUtTBt8P+ZSa8Mpb2f2z7VpcuWJJvdG
         sObHRUv/4RSSPBIU1JJYSeN5xczZDEJzej9XgeXlGgikJUEXF2+lTuT9sSnt0MBj7lSi
         NzRCc0vr/icI1RwEtHyRgVbHEnrd4dRqICD27KQjG54FuvepMAgd7gLYv6eatbQBtuQl
         D34Ugg3u6sPqlSqqjhpcjQAzVJ6E2S5U72hQZWT1taS8qLl7T0PmbCX0hjTNr9Xcl2Mv
         pXCp9C5+o6m4L2grH9gna0FsKDrzt7IZQPSSCH+Nb65p0PRG8SVtOzJPjgoDLyRZVs7v
         hkdg==
X-Gm-Message-State: AFuF++m827Q52quSKBLMN9cd1UpS8fcuEhJopKlwTPi6uCv7WRIzqZXp
	7aGzTbupDk21HDr46LG4wBO8FCVl2L/vYW+dkiy8MAB3Yowp7mVzZ98pKA9UtSkCLnqFYhSQtae
	vGYf8JVYNjq0EkpB94CT7KtseJByYcqzvVE6HehyiUkGfIlkRQR2gb7wXmpInyiqWSqfP
X-Gm-Gg: AYBFou1eYR3gfoobFmaX1iy+Y3VQacNRC/FTgKPs3g2D4OZGYI8m7486BACpzoRan5g
	Td+sLkAPVQGsUQ13sX+bfcdeLKQtxbHS+lvBdMyqFE0tdjW4OBBjL9teGEcRxXQZimJKZLcO+zz
	HstkPF35VuGWxtJfLv8Dc6Zhzcu/SnNRTtWOBT2JGi0IOtBwOQzeVavKMxnnbNkZXmigWhLcxmd
	RsAtfXgfMrMvpaoWfu/YtiYn+7UzPISpGE3jjgOWZNOFAMM9ieZn9KRizL7S5p2D14LRys8pOoK
	NJjEEH4kiZEIzDs4xZ6ZUGnCPFYbwQDKhaX2ZTDcK53o9aZz8T7a0ys4KB9ClrGQb2qqzt4QHYO
	UJa8gLT6vd8HCN2+PHAEKxA==
X-Received: by 2002:a05:620a:ac09:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93a2bc868d2mr134061685a.1.1789375226910;
        Mon, 14 Sep 2026 01:40:26 -0700 (PDT)
X-Received: by 2002:a05:620a:ac09:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93a2bc868d2mr134059785a.1.1789375226498;
        Mon, 14 Sep 2026 01:40:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296613ae93sm384411866b.58.2026.09.14.01.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 01:40:25 -0700 (PDT)
Message-ID: <0f46fed5-57d5-4b54-9740-c7415a03fb78@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:40:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8917-xiaomi-wingtech: enable flash
 LED
To: Martin <hemisputnik@proton.me>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "konradybcio@kernel.org" <konradybcio@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260912134056.3347741-1-hemisputnik@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912134056.3347741-1-hemisputnik@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX/W+TR/wwz2p2
 BLdyoo7hi/OvzlZxo2hcq18DSe5lif8QqxqEFlRiFmWARNHephg39jl8I7I4VauBeZN9hccNxEa
 zVUzsWu2PD6XRkIODJrsPAFWXPGEGl4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMSBTYWx0ZWRfX/6cmG5nqMrnN
 d6Yx4gX2zVn8a282nmHBvpEXH5s68lK9BSTpFhzYLmpqzmmf8Ozi3kL4bYSb7sWOqFq/+PTMfBK
 b0YOGvSG/QqS1DvqU6Xho942/oHB303mjjjOyrSFA44fwpM+6mA6n6CLWjb3V/RV9i9VN7bnhsw
 7KfTlWP1d4MnhE1Wzses8L2+YVL7VhPbs2bl4dYQ8czqpQK25/iqLMYK/1hTqHWKU20PTITKC3G
 f7Szk7BygxJfyvLtMq3ik4XhcJxwREDzMhZUlX+XCYITw0xaGV0LktkTtfQajIZimuX6NI6RWD3
 OVlbclKYH8rTVg3sBqZxVuToLwisMaZUUT+9dHi+WrHYN+j/IKxmWLvJT29ExERiaw22Pn5Ej4w
 MA3sNiIeY2mPVczOr7UdFcYP4YndPZ0hmowNsuQQcVhghwOgIqtUcl8ELzOFyo3wFyGJd8njkiB
 GDjIyWYv1kjpJyW4Vqg==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa7b300 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=4HIykC1xQpmIHoiGnS4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Ki5un2fUvw1Of9vgle3jny82n85ENmxt
X-Proofpoint-GUID: Ki5un2fUvw1Of9vgle3jny82n85ENmxt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140121

On 9/12/26 3:41 PM, Martin wrote:
> From: hemisputnik <hemisputnik@proton.me>
> 
> Add SGM3780 flash LED controller to msm8917-xiaomi-wingtech device tree.

[...]

> +	flash-led-controller {

Please sort this entry alphabetically vs other nodes in the same scope

> +		compatible = "sgmicro,sgm3780", "sgmicro,sgm3140";
> +		enable-gpios = <&tlmm 93 GPIO_ACTIVE_HIGH>;
> +		flash-gpios = <&tlmm 90 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&flash_led_default>;
> +		pinctrl-names = "default";
> +
> +		led {
> +			function = LED_FUNCTION_FLASH;
> +			color = <LED_COLOR_ID_WHITE>;
> +		};
> +	};
> +
>  	chosen {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -306,6 +321,14 @@ tsp_int_rst_default: tsp-int-rst-default-state {
>  		drive-strength = <8>;
>  		bias-pull-up;
>  	};
> +
> +	flash_led_default: flash-led-default-state {
> +		pins = "gpio90", "gpio93";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;

This essentially says "by default, if the OS doesn't do anything
with these pins via drivers, I want the flash to shine", which I
believe is rather undesirable.. let's drop the `output-high` line

Konrad
