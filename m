Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364806;
	b=xbTi5tWMkpLLO2paDMWXWKgLGk7eaSoGbvI+iJ3bfab2m2lubD3QBL0MLAl4uTWyVtjG
	 LK0Pwm6h+D/vswyO3sWu4Kuk2B1XDhu+unMkzr+e0NSLSim6n19dAT53+38X7tfYeNrW7
	 PIZQ2NyvLghxBEVF3ljTPDYUVAPq5DHEvofGAIWyhkLrSNq8+1uXGXk1fW4BsZ3La5omo
	 RErDXPwzYfqeSz0dHIo8vhZLP+5u/TQr4aU0sOuI/aFBXLNRCNFXIp8MwniNx8sSU+f+C
	 rzQv88EmtEORjWtMvWfnAyvkIPGoLZPh64/bpZlW1AzaQKwM032WFNMLnsoO2/96eOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364806;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=g+dtRrOqxcIMInZ6Na2UXxrAIiwdWRlYssjy62GnXog=;
	b=Vy5qO6rNxWpheAAR5cX8Mi+ixValH0+aFauCtHYPYtNmc4xOBep7JVdgL7JY5jl68xRu
	 XhJNPgziU2zNpTfhqoanNvqnwWlTjtKBXppXbxi8j40fRA8i1GSIqu5jk9DbzDCZ9XV6G
	 k+E4GJDj4gzJTLJjZM24XDn4/x3ysPk6rudVZUIe4gwy4rsBIac4w9eOzcNNrXqSQe4JM
	 gk5VTyWsi9KEnXIgh6NkoKuyccFBfe2nHRz06ppO6awLQz+h22qGnCiDMYpLpst664N5i
	 n5MK53Q3TJWdajMCPkQhEhCzJ9T85fHTOHxy2hnHyD0zv6BGt7PgdHV11GQN0NbzmUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QHLg8D2R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K3blMq+d;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF69606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EF69606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QHLg8D2R;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K3blMq+d
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGCrv3142215
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+dtRrOqxcIMInZ6Na2UXxrAIiwdWRlYssjy62GnXog=; b=QHLg8D2RjXAaou0v
	R1IjeLGQW/bJr9wx7PDHnJoz6QxHcuu+OSaPeqhnUuwDgqUJhjj838LUGt+xTG3V
	zXJDARApLPB6FiSZL5aVY8guaoypz00b20wpF7AeyirK+iehxUv+BfZc9npuZlGk
	RXN1rraLVUIUbonQfOPBfJGfbS1cC+kUlg/sqzGsR3lgCtjBHz92iJAX+jHQWghg
	6/6jCnqmvXIPNDoDf6TbIEnwlSOCnxnziEImiqXjODaMw4zIAghEjzXEWDqbyzt+
	LzqT989BVDhaDJ4JIBEBcs2ArQklEBOrZDxkR9z30HiZu/FeKWBlou7zMw3ey+iT
	kNU3EA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk2gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 12:53:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944102381acso14982185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 05:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364804; x=1793969604; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+dtRrOqxcIMInZ6Na2UXxrAIiwdWRlYssjy62GnXog=;
        b=K3blMq+d1BLeWDJN+pm0IaVzxw/NLpSXOhROOsj7YNHsC72hR2NbzRcIimwlsisMbY
         Z2ukZjUDp2GI7qzvMz52d77QPJlzmkNJKLWzhu8QpQYEpO00+qTfHiniZmF/Ofl72LWs
         4Me8AOBGSG5oz88WdAFOPYwYkCdF9USKb/g6wmYGXnu19r7t+eojeI1W+XbxjqTA4j3d
         94++/wixPxqZ1hCqMAk58dFv5XMKxi15bVvqSe4ul5byaDRwxYqJ+ZQh1igO/fqkbPA4
         CB0+XcwqrE+qRERJp1veUJPXzbTCVs42RqP0hiy2I2Re7j9StB9rwX0KlkzL17ko6hP0
         BUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364804; x=1793969604;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+dtRrOqxcIMInZ6Na2UXxrAIiwdWRlYssjy62GnXog=;
        b=nD8jnd5K7rIuYsu1gh6GO9/UJJoL3wH/0bjkZN421jDUVxthPHbtMfFXFZ2eKvVpl/
         b7pfLfQjLBLuGjKRFSNPAfS2S0ohl4Unuenohr1ReH+a0mBoftaXQ9ExnMR8SlTdjYzu
         IEQ8TXicw4h23FX/0mHrQ+j6tIWsiOEILwHSvpEp59fCOIEzJeJ9r00DwSoOuiAXAF98
         m47NaeuwJ9WnQWQrBPL1KyuKstrMk485De2MI2kxMc22JsJzHUyA1sS8Vxc9acwPwe/J
         08Dvzo6cw4VsKv2GgVs2y9E+7/FU7Xt67pbJPsG1aKPxXrsdHzya4+nq8eoS+Cp2shxs
         i24w==
X-Gm-Message-State: AFq9FYJi3vMf/NmQOHYOyJFjrFSMViopu6dj9grzXlLK+edE4a1uWSn+
	8VvWMf774Xn5Szt+/iXSILJErmd9b3Nn3MOBfB7sPwSR/73Wdg+VVOcLKlsUv1oTEuMVPPKo9ma
	TcK4tK/s3a1ZjYv2PFjkrxSPRa5WQplzV77Aftfty/s3eXEcRQeqQOcJZFlj1jRw7ryQ9
X-Gm-Gg: AYBFou1/YfTlPuEm7K1CYSR3BEX5srPqFCq/NJ7Xi+Cw/RIDrBlqoxtlIA+XcDEC5Hb
	3TwTL8qsGYSOZ+KBoUvuziTmmCjULHW0Oh30d3IvTsOy5Ba+aEfIi2hwcrrQyZ530UuWEMTFeoi
	f3RQAJ4gP5+KOYayeL4fSh6ZHHsWwph58OzLUoocizCx2aWa3H1CNvb3E9dnNEbEbCF0NnkdemM
	mXXvQVTtHascgZsWJ5QFiYVJZuwQOq7BPgXoHO7WWG4SQ5fZPzAFQVKdwmlvu3Xl5jK+XMQ40M4
	si7yuaoF7Wog2Quw9rI3zJft6bEaiH3TaqWxxDX/KgrgOteQbeh/cWICf0MZUfZw0ENB7aZWDes
	xLVanZdhkw9vr41n9+KM929ZHdfXFL2wZBMJLUYMs94fl/AGOJ+BkwrPexxby3dcJ90l1WzI=
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr372318385a.1.1793364804298;
        Fri, 30 Oct 2026 05:53:24 -0700 (PDT)
X-Received: by 2002:a05:620a:a8d5:10b0:93a:14c:329c with SMTP id af79cd13be357-944214d09d9mr372314285a.1.1793364803770;
        Fri, 30 Oct 2026 05:53:23 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd249sm63470066b.20.2026.10.30.05.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:53:22 -0700 (PDT)
Message-ID: <cbb0c355-7401-4edb-b67c-00976e1a3763@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:53:20 +0100
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
Subject: Re: [PATCH 2/5] arm64: dts: qcom: milos-nothing-asteroids: Enable
 Bluetooth
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-2-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-2-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: X4NbIgHzVm4gX0IEJlc7QQbGdmANBZne
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX+xaDs9dU4hZG
 ZBQ+ByIDM6g30objSYUjyCMEvKZImM7TACLlJV1CBuCbO2RYL15wQM2vYmA290HQYuuHv7Kltry
 uHo7j38Mqh4C1iCDmFKFD7309srk72w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX9F+F8fDb2MVC
 WnbjejUAUrP+qMIVc0mNgw2CqMhlFjm9+SXILsgMb/L+vuB6Qg1+usxVg2gefPscU1asu6hpyvw
 k2Ew3k+qPUOdmV9DYMk1hyn/SVhXLWgtKOt+KJSJgepmHd7UleWpbYGy64KXMgc4ZTa6MVFJ0GT
 l1BWi8btMIfnrXlNT4zHHQhhee7wQirwqN5BCksiR5DU8j6X2mKFFOCp+F082UagvobYcDLF9ck
 KYqk6ZSZIwFIfgqFkoPxqIR9CzKmtgbjkIIuiDDt7t8JdP/E9UziWxLjjlOXozRbOuQgX9KeYlh
 y04rf8mmQBb8Gv41deu6w3tCS+wCEWwf7p7Goeah3CjEuYiQsuyVXDu8zZqfGxtpNe6G9PvhO/y
 bcuJpCYm2BLHitWzXn/752PHEOI5ov0vWutZEI/pncKdhAM8UXjYLKuXHDpVCYkzVuW65NyC0IW
 23khGY2PI1hwUPbnYyg==
X-Proofpoint-ORIG-GUID: X4NbIgHzVm4gX0IEJlc7QQbGdmANBZne
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae49345 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Q61tBkWn-twudPVU9zMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/29/26 11:33 PM, Alexander Koskovich wrote:
> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
> parts.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

[...]

> +&pmr735b_gpios {
> +	s1j_enable_default: s1j-enable-default-state {
> +		pins = "gpio1";
> +		function = PMIC_GPIO_FUNC_NORMAL;
> +		power-source = <0>;
> +		bias-disable;
> +		output-low;

The consuming driver takes care of the output state

[...]

> +	bluetooth_enable_default: bluetooth-enable-default-state {
> +		pins = "gpio53";
> +		function = "gpio";
> +		output-low;
> +		bias-disable;

Similarly here

> +	};
> +
>  	assist_default: assist-default-state {
>  		pins = "gpio71";
>  		function = "gpio";
> @@ -905,6 +1079,32 @@ &uart5 {
>  	status = "okay";
>  };
>  
> +&uart11 {
> +	/delete-property/ interrupts;
> +	interrupts-extended = <&intc GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>,
> +			      <&tlmm 51 IRQ_TYPE_EDGE_FALLING>;
> +
> +	pinctrl-1 = <&qup_uart11_sleep_cts>,
> +		     <&qup_uart11_sleep_rts>,
> +		     <&qup_uart11_sleep_tx>,
> +		     <&qup_uart11_sleep_rx>;

Please align the '<'s

Konrad
