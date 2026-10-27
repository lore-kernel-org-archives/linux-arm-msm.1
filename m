Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109840;
	b=xJ5AHD95cUS5xl0zdnamVwL4CRXiFOnCFFhMelO8MgfI3zskSZLf1oeh/9iS9D+yrYP5
	 sgA3FJ4LzNsEijZdqkZGYNWZwvIH6TAMHs+Y1DezvRxHqxrBUs2RQvksZT++ELqpm0yHb
	 zfdBRE7f8hzp2qiAzm4W3FIoVXJ1IJd88NACjJgEwNlp+o+vZhHBEwpnwUl36dUsneOUy
	 1GFCA7J50R5O/rMt4Bpo3JUTZ8IDaE6H/rHMWQPYbIxnKXUzTnCG1dkI8CdAQmhHMlwFA
	 LSh1UvCot8nRfuy5fH0tXckLmQtCG1cABTFedUwizA+UgWcfJDh4K06bXEb91Pgr0sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z+zcjRUmFJarKKBVLCxCx+rQ5bd46t8d9JLDCiSJycA=;
	b=0Uu/6VHiV7G5vvQ7RVvb4M8M/N0tBQnBzno89DYXIgAIi4vWlG1lvPq99lx7jagM4TZO
	 uK1z/UV6M/CwH69de0V/4dQZA0xR/eE6Z4nbWlm7msdwFwuGxyJKVQ+FVSWTATUKk0mfM
	 zq/Cr1qqRCBJiLtx9DmiqsIMoveGvF4sET/8oIibiReF06h3L/hoG2VQMia5F0goSxROq
	 XQrSakAdzwdc2Zq16zfMZD0g1aIUQ++eOzELEmOPgb7KdmqSc5ulgha5uFA0I54ziEh1m
	 hzr4w5BNGvjPdug53sn3EAjZwQ27HQ9HJF3KHc9BagDYT21grAlNxBgX5RFSc4KBECA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UYdyAjbn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPRljlt7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1AC606A320
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF1AC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UYdyAjbn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UPRljlt7
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoDn92358404
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z+zcjRUmFJarKKBVLCxCx+rQ5bd46t8d9JLDCiSJycA=; b=UYdyAjbnGesBz71W
	iVQaXe8qeCZ0Rupd2jondt88J1qH9S1pOo/qi3Z4EuXB6lyNRXzynxQMQS4pVt4G
	drLcMBce0anTIO5En/zvLs4tVGWXIY9NjPTFmWHu8yb9glvFqF0YdMZOwnIgjZDH
	DnaTN2t1g6LOMH2FluAsLrZAnoaIHpG9eKxpD4z9ssZZU3FnmrnNXvmep2BSucZz
	6OcrJGb6sN6X1W7IvC1hXQfjjmSU4f+5wjrtlddaZhSN5hBIRFRHqhgdxY868xvu
	L6PsCLS0MF0BP6EyUJ59pD4i0tGfM60Kuc2nenyobOB/cR64DuliVsIpEm8lcVj3
	I5tUTA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavu7nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:03:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eacd065b5eso3740115ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793109837; x=1793714637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+zcjRUmFJarKKBVLCxCx+rQ5bd46t8d9JLDCiSJycA=;
        b=UPRljlt7EyYoa+04TX97q9IZlsTHb6EV/0IkDooKwfJxL3PPxANG2ydSDh+sctpt5t
         TDr6yZevQquyAtbwhkqW/BIqI0snRS2C93/hxopSFKsf325nJ3A37nlww5nviQVxWuNl
         wV4YOkFvz5snBnTIz6JlslWkO2hHyIEzok2C7avVYh53TM6SKhv6Bj8Pj1kTrLSQ0e5f
         pP9diZlTFzXvve2lQpndduUwNv16XcV9Gqh+U7vOspzbOGdFtNZBHhoslTS8C6uDD8gn
         Np+1ZBxcv29Xl2EvUBfhl1sNccvQRc2lYTSz62QEMLFhMqpRA3OmGO+Tr7WXnO+5cxyt
         hlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109837; x=1793714637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+zcjRUmFJarKKBVLCxCx+rQ5bd46t8d9JLDCiSJycA=;
        b=qxFYp0SzQ+NluUinF9usIFR7AcYXyYwwnfZrExKELPHX64iit6K4FXmWni0TYbtg8q
         1nYJ3y4JZ64Mg68Ybr/2ncVIrMRIW/BhwZSTUOTuwMFtal0PUYFS2VEHSfozEfC4QUQF
         j7EsZOV0FH0+jVAZ7H07gy2lALGnYongaqdxwaYdU89KXAfZHQz8D/7u/2R0mYpmtNKz
         m3xEcKEXh8NBrCx1VHoqQyAeivTzngyUsuD+DNd4Bzt5E/CLXXbq7m5EwvtMAKwMLL7F
         1EJvn9pkmeGfG/iXtZNDk2KTrCQGpHPw360OKh9st1/mpO1sGCGnGnBK/w03QZPu5DCC
         U8yQ==
X-Forwarded-Encrypted: i=1; AKwUvBxC81zPFLylRrJ4ik/xW/3W65Dl/cMBSmND1hw1r8aRKzz0IvkiGqZRGfDehlsh3ztSAHYW/M+QdRunX4Ig@vger.kernel.org
X-Gm-Message-State: AFq9FYJRepeWbBQccHV3dhUB9Njt13CYUnl4X8bp1YRYvGEjEKV1VGRw
	CUMD3jDnp2s+d7j8eLNIIqvxG8IDlo8sFh8VHqGhYPr3AE28H8hJ22K8uUasgmN6m3iUFXHX/PT
	ARHmuwNOjyMcZQH63X0YW1uiOfe3hexr+wS6qIrHbHwb4Jbpn88bc5JdapnHbiuuK91RQ
X-Gm-Gg: AYBFou3hb+/yHALm0vh10qsoj3AQt5jN3KuOsWkohBJJqI3VjzXygllrKRBh8QrEm86
	3Nlqme9NsmXa8+wXBz55kqi64T2//56iP7wRTPD8PTi/LoclzAAWexmaj6R1HnHTxtIyz972N5k
	2i3FdyJT5LS9vz9HBeyr/SMjUvp3mbxj4IkMUzM/AnK+xK+qzSZf6+eP9042f6FFmyP2t/XeWB9
	KJ0bU2SCLCV1uO37xU4/iPQWOkvuYjsLat+riS5DC86fsZ/iSrBODkuo9OkNQ1tQ9u7ikXUnpJ8
	zaFpnci9CaxHT68739qJWdf4DYN1xxV9bP03a4A0wFQpVdGYtDLXFmxH1DnasNs8DzeCxdNFpXQ
	1S/2e8AV9wtB8cSPFRqUT3w==
X-Received: by 2002:a17:903:1b23:b0:2df:8909:f719 with SMTP id d9443c01a7336-2ea9c64401bmr146875625ad.3.1793109836883;
        Tue, 27 Oct 2026 07:03:56 -0700 (PDT)
X-Received: by 2002:a17:903:1b23:b0:2df:8909:f719 with SMTP id d9443c01a7336-2ea9c64401bmr146874635ad.3.1793109836298;
        Tue, 27 Oct 2026 07:03:56 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca563ca9sm28627e87.17.2026.10.27.07.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:03:55 -0700 (PDT)
Message-ID: <b5f0ea6f-1048-48ed-8df7-2502e7b452f7@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:03:52 +0100
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
Subject: Re: [PATCH v2 10/11] arm64: dts: qcom: sdm670: add digital audio
 codec
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-11-mailingradian@gmail.com>
 <87839ad6-c489-40b3-bfcc-60c436cd1a6f@oss.qualcomm.com>
 <atYtSXF6QeTkF6pr@rdacayan>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <atYtSXF6QeTkF6pr@rdacayan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8hdwYCiuco3jsS9eaTteX66lzAFDYm17
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfX3OEZCwgawGo2
 krTXtFUga41hDclm8yipIe1Sx+ffRXrmz0JkFUrI7bq55ba/2+6SRGz/brPraEBWZl0CEo26S9J
 Y4o59BJN5BUTW37OmkeydsJZVxLbSlU=
X-Proofpoint-ORIG-GUID: 8hdwYCiuco3jsS9eaTteX66lzAFDYm17
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae0af4d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=Jm0Y9y7N4wH0DHTafQoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfXy3ZsHx7Cwr+i
 e+nepx8NuGLQN7C2LqQ3nJ8Gz7lqqIuolaEysffOndSyYjiOf0gcvNXa3ccepUgSL7vZznA86Wj
 mIVWfdU2TB+2oMQtV+1uHOpZcA1jRqr8A3sWL277Iqwh0UqObrgWTlaCTt3FyP38BhqlbEjjvPe
 cFzmsl+3SdkX2NaE+NABlytM0IpY5QogrrF2b9KQh37orrJaLjx+HPQkHB3kalkG9AX/Kix6TlU
 41S7EYmHIRcjFV9sAjFyjpbyVKFs3+VjK/n9M1Oi9I5ckHikExmcLGCIY643xKalypF+mZscc34
 VTOrQZm4tHTvHALFx3JUWpyVCaeETZ4mGXZmZ1LT5SdNqs2LocyYkskDMvM5zbT6sy0pQh6qaW8
 sGVMBSiE3yo70lVBNE7+CEF4sCGmuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610270055

On 10/19/26 4:46 PM, Richard Acayan wrote:
> On Fri, Oct 16, 2026 at 12:21:10PM +0200, Konrad Dybcio wrote:
>> On 10/3/26 7:56 PM, Richard Acayan wrote:
>>> Add the digital WCD audio codec to the SDM670 device tree.
>>>
>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
>>>  1 file changed, 15 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
>>> index 038ef0f73ea9..91188acd16b1 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
>>> @@ -21,6 +21,7 @@
>>>  #include <dt-bindings/power/qcom-rpmpd.h>
>>>  #include <dt-bindings/soc/qcom,apr.h>
>>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>>>  
>>>  / {
>>>  	interrupt-parent = <&intc>;
>>> @@ -2541,5 +2542,19 @@ data2-pins {
>>>  				};
>>>  			};
>>>  		};
>>> +
>>> +		lpass_codec: audio-codec@62ec0000 {
>>> +			compatible = "qcom,sdm670-wcd-digital-codec",
>>> +				     "qcom,msm8916-wcd-digital-codec";
>>> +			reg = <0 0x62ec0000 0 0x400>;
>>> +
>>> +			clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
>>> +			clock-names = "mclk";
>>
>> This clock configuration is forbidden according to bindings
> 
> It is corrected in patch 11 which is why this isn't caught. I'll move
> the fixed clock to sdm670.dtsi.
> 
>> I'm not expert in audio, but an LLM points me towards
>> LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
> 
> Does the LLM have access to schematics?

That LLM has access to more than just schematics..

But at the end of the day it's just an LLM. I don't know for sure
and that's why I wrote it that way.

Konrad
