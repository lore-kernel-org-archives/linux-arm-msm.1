Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189061;
	b=2tXv/C3Xi0i+k5xB13jDwK0bdCQBMvLkirf6qUWRAl1nRW598/7ql5mwQ4NQbPl/4g8V
	 5kqVXvr3sxtvdbvj/2iEM2LT4u7qaOBLq9FTL0pTavK+aQHzpo3AO8phnBSpXHkiAY7ZY
	 v3mdANAU1PlIn8fwkOgOmRpo4E5k4muVyfhuQq4HBAG8ijZfHN2fqgAqsRsPBf8G3Kw2G
	 f7ijlxgI9xjit6rP/0PpAHXP9RJs4y2DNbNniCOl/nkyzmQVLd/bMK+GPVY/ZXCMVwkq0
	 FIJm+8PcBtJbyAMqqON0BbG5n9aRHtfiG8zkYr7Ks8d+ioUVJkScG02q/KVQ8fo1vMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ghp50T07BN+pBS1mt66586n1LUvrkgrvsClQgUfUovE=;
	b=4Zh/+rpIRKaJ1nxjxMdFgeNa2LrfZU8mIPCvTbQ4zOSGW3CF9KGzNM/jwdeKFPvBGBbh
	 66GZnk8zBS5H/qMeRBZWafkiPhQ0SgEBzrwpg6Xe/JMc8riwakbQi/DlQERVlZ/0rVgso
	 1Pzxl7DNg9XEIXWxpSSRziJUJq6FPb+RSYvc4Ro46DB27YUJ0h6+gldVhU8Qf44Y4G+GC
	 zrzT2Vs2z+DczlONUWPQSi/oCdmHUFaTzrAFyi+WdkPGUPC+EWFq0rh3Fd4MKzqys/eHS
	 ie5QcCpc33OfddVF5RVcB5f9rcBDZZJsdPMcQqlON4wCkCul9kgOy9Bb/MYwM7nWmGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6snvN9m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H5mJLCG7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B769A606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B769A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6snvN9m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H5mJLCG7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe52M1053342
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghp50T07BN+pBS1mt66586n1LUvrkgrvsClQgUfUovE=; b=A6snvN9mZVyi5Hr3
	iK+WpdiaTKaqYIz/umvVihpeIn6IgxYYRXTNYoKJT2BttvtFDgx8ecfaZyaa6Zue
	BFx1aULCEFAebWHWU5MWzEdhgyEEAax/fldQaIPi6dSEzwAbWfA0h8argoJf1Ywu
	47PsPHFnaiICKAjyrXrFhaggHHfvTL6eRUloYxZ1d2HjBG2XisYZ7QyvzjmRDdfV
	49+hDLPcoLHvqH0bjAbrXEY1+pNrIC9rMHUtVPXL82+SoYI6KDfHwUTLncUsZMy3
	SKe8jms6Rhvipxw5RTYHwkKd8I5t2wekF1V+QxPZsSY38hFxfK+B0ZCMZYfdA3Oi
	0hEzXQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw991g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:04:19 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so62858e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793189059; x=1793793859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghp50T07BN+pBS1mt66586n1LUvrkgrvsClQgUfUovE=;
        b=H5mJLCG7NgK9TgtT2xYPSGhmEEu6TtQWhXoTXS0hHL6lGk13A07MStjbUB3OQzRJgS
         SPcKp1VYBg0rc4Zud4a7HGoBgzJSVoOf3FNc1V/ftd7WRaEUXSbt6TvbjFwq6iBGEApW
         +P+mS3knShJRamEt3DHDPh9c2n7VVA5q6sskO/pEvjztEepyJtF2+uiEY5stWsMi9J3E
         PgcQ/7uFg9elf3As2bURA6Vs3mEy93ljMJydYfOXmXbcw4yNx4mmeiIdcHR6CadsVL/z
         xhKze9ofZLYuuSt7nm6LHJsBEHDEBQijgXtZGn7TZDxrCS/3d8IpfYB4SOgvJE5c+B2D
         b9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793189059; x=1793793859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghp50T07BN+pBS1mt66586n1LUvrkgrvsClQgUfUovE=;
        b=RsDhWWM/l58M1JAr8OeO/WRSu05dM4PqETkk7FojEsg2hdWyrOCo3ajYkFyP4xMVjk
         I1mObUTyuMRKIO9x/aiy45Qq6LeEJkY9+kBuEluxwjDtoqtTE4doRjDCtoKwr4HCfG6M
         Uk+QaojCWA1qDS2poBKNHkPiYVd7y6xP6dW1Z/+2gdsyGtr7NK9ielJ1siCOfO4K9hKm
         a8JzhnU1jWrhgF1EW6tLm+EXLuXRNWtFBGKIDRof4b+Cw5fCErz0sXmySCEb/dCppNDL
         lZhsvqahiJ42uUu043QqQ2PfLc/buAF0Z13B2/MwFDFPIX0G4WXQmiW9sweRN9tBEuch
         JmYA==
X-Forwarded-Encrypted: i=1; AKwUvBx9eWeFOIvkAwJpNyON5WCYyOcNaN9dI0+kw1KcA4wJkdtQjCwlrr7uCi+8Jl9PXF3zgsoi90cpgmHy86Gf@vger.kernel.org
X-Gm-Message-State: AFq9FYJSW5cSuu/chxg4mAztO6qJJb+eOXMnD4neK1RzTIBM68WlEzn/
	uUcz1mwfdughxSKzO3Ngpn6l+vrYhytRSM6EBsU1UiY1fe9sZeHQzIxPvA6p035gJbe/Q6SGBWD
	IfjiET1jGZuhQr9t0wZ0nw68PRCzsGrUgC+I79b9mGBC0lZKtBli6FDCOGhbgzrcTGq+m
X-Gm-Gg: AYBFou3b24NrCC4rafZdipJUkwUO/gZCdnJB3Q5f1jQhrm9IBgavW1AI2PkDYE8attl
	7SOlO91LLizFhkVeJPCIdHG0/rJU6Wqju/KjCihf70VkKoL5q9CWCXbYAndKVjQCDWPZt5nsdOy
	1PTlw5nGBtCGqU8vBjKE8fLcxY3fCS9S8Aj60hJ+xIZpy+AbE0dX8Xia53tXRzgWZ3kV0P7Hb16
	TmAqYdCzUUv+yL+lccoe6JM/kIgKQHmukIwueNFZDf23Th7dMPce2j7Z/dmuCsLavTheMvWUxWd
	5RyF1lSj18t1H8OaTCatBOaO+UHKTV35BEuSUaAbtfRlRfb9NSOwoUl7g7u8psW7vML9uRj0b0h
	7lO5yvzPvkWG5+xn0A9UuSrtMnufGopQswodNQVnaxMU/FGu1id2FsXsjLjEnoO2wzKUa5R0=
X-Received: by 2002:a05:6102:8482:10b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7d03a556ca3mr577572137.3.1793189058790;
        Wed, 28 Oct 2026 05:04:18 -0700 (PDT)
X-Received: by 2002:a05:6102:8482:10b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7d03a556ca3mr577514137.3.1793189058217;
        Wed, 28 Oct 2026 05:04:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49640f1b9sm1348803a12.19.2026.10.28.05.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:04:17 -0700 (PDT)
Message-ID: <96405224-72e6-4786-b13e-d73134b58ca2@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:04:14 +0100
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7325-motorola-dubai: Add vibrator
 support
To: Krzysztof Kozlowski <krzk@kernel.org>, Gergo Koteles <soyer@irl.hu>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Enrico Cic <enrico@privacyrequired.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <cover.1793135056.git.soyer@irl.hu>
 <8717c3739be282747cbef611d242acfc5a40656b.1793135056.git.soyer@irl.hu>
 <20261028-thick-gainful-pegasus-e1b430@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-thick-gainful-pegasus-e1b430@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: em0iBOjjDXZusvqh60NPLUAJH2Aq0zl4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfX6m49jcjLfGeN
 NDehmKa9xTBynmZ1FX0HpF8ukI/YBgrGuVf0WwnJJg9kkRmR3AbXXKi6y4esje8xFG6eM9D0GIR
 g/fCtwcg9xDNxCjonUmQna32dtBnOXw=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1e4c3 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=SrNx-AKsgThqvEfA3AIA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: em0iBOjjDXZusvqh60NPLUAJH2Aq0zl4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfX46TZud//YQCA
 uNrT1LNq9Kgnr6DYRAXyrxc+WgFojz6vFTJeEwyW3O+dVtkeBtY7apUjxuI3wvVmUoi2JSKTo5H
 nuHw9JuWCo8BvOmn4h49eyDm/OJbRc5g9BKN7AbteovpklPnQheG140m9Ph0559huVHqx12QDeb
 knRDgRw+DaOtupdQX6LHRL969tVvauVKdfuuMqbdExZtM7BwT5d2wMOmkSBZIZpLVr1xivF0lM1
 o3iaM1Yxv3SRyE72t09Zdr6YdAqMOstSxK/6iYET+Gak2oO9tYs5CVSPealS2ymQuhhpprVdmbV
 /9ux3wWSlPlQMSYCgSJsGsWgwUFUi1waJxwktxXT8AxhdKILnfIYhxEwbfplaPf6JIZgCWNug9e
 iMIFxEWHZmzirp6ArCc8Mzv9Qk84na7G/364aIRwi4w5pshoUDk3U9utNlqSmNPI/WRikkLQVay
 xvqlq8X9MeSN19Tv2Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280047

On 10/28/26 12:08 PM, Krzysztof Kozlowski wrote:
> On Tue, Oct 27, 2026 at 11:01:25PM +0100, Gergo Koteles wrote:
>> Add the required node for haptic playback (Awinic AW86224).
>>
>> Signed-off-by: Gergo Koteles <soyer@irl.hu>
>> ---
>>  .../boot/dts/qcom/sm7325-motorola-dubai-common.dtsi   | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
>> index ef91986a1fb9..434846be51d9 100644
>> --- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
>> @@ -924,6 +924,17 @@ &i2c4 {
>>  
>>  	status = "okay";
>>  
>> +	vibrator@58 {
>> +		compatible = "awinic,aw86224";
>> +		reg = <0x58>;
>> +
>> +		interrupts-extended = <&tlmm 47 IRQ_TYPE_EDGE_FALLING>;
>> +		reset-gpios = <&tlmm 46 GPIO_ACTIVE_LOW>;
>> +
>> +		pinctrl-0 = <&aw86224_int_default>;
>> +		pinctrl-names = "default";
>> +	};
>> +
>>  	wl2864c@29 {
> 
> There is no such code.
> 
> Please work on mainline, not some fork.

+ please keep the entries sorted

Konrad
