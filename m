Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671674;
	b=2IJDXpFfNCgFg6DrxEOPqOgzCnEH8Suo1vCNbIQpY2R/C+02dQROihmsSlJgnVcddCPi
	 xdlB0v78SK+2sFwQqILE/cIpdQ/Tv1Uyb7/NYQeu44BrWCKqy0V2O9kedqEEwUNSqmPoz
	 yzW4rrY5bv+t/j4R3IYnoNOvVJh9VYCD9cdYYk/23Ea3A6H4R3ZdOlpmuu+MqTcLkbb3b
	 iHvKkG/P1wJr27qySkxOowBdMgTzyFR04JwnW4kEDUJpQy0cVIZumX35fFDxpvjfcNDXc
	 q6j7Ko6S3Jq4QiwYz8WB9JIU/czA3bQqd1IgEJljhLvPAhSN4WdAkyw+Sg8EIeDpjVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KaIkBumHdEKKdnazl1dkdI7RsBJJnknjh5eFZLYyAK8=;
	b=id+07y7Mugm2kU+R8vAvC8010jL7fmoFdfQfWghzr16yp7ns4/AMtdrJ/AaIHX7h8CCf
	 MdNSOWZXGCQm07G2I14wjWul7GvkIposvoVA9e7MPrIUYqfc+6IE5c9XB99j1wcXl7jNZ
	 xWrREVE+DgJMd1FecvZhMzRicaL59LcB7MeSzc2qBNiEsPkpQBlyYHgA4c51rrzwVDrN5
	 gmNuURcDeOhZsPtYgdlTlriU815ulHUJL7Bx8L119Be9rleLGsdLVOXTQIZhOOZ3zkkko
	 eOUEBSyWioua4hAP6eRYeJ/DkQaAZrVmDfZqeoh6YkdXI19qP0bw3O7xMwrcUT86ULA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHbdAQM2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gYkI/hat";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B263C606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B263C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XHbdAQM2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gYkI/hat
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36CsO2068336
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KaIkBumHdEKKdnazl1dkdI7RsBJJnknjh5eFZLYyAK8=; b=XHbdAQM24AiJSbus
	R9doTO40p6club4sn6vQEj4a9nZB7tEZwXJl7ZBUiVq3KVrTin0EEyYqyLTMBix2
	FUoNg2y48oSp/+ujhKn7jSWN5sqKGucDTXffGKMfVPmYfWg6pLsu024bNiT9QOc2
	aSyNbANF+QMDFSMGO4C1jkUa7CzSFkXefKO5QgLidvf74XOHFitpLl/QUUl9HAJV
	J1LoFcK2AyM1YX6fPvMLkwlYTHVHJpc0Ak0jRlQqPIUAmKrgZejygEi65NObCmrM
	VFm5Ijgon/b8GdyxEhPMXUDPJsv0XgGzFnHR6bzzmrWLcxlMaNDxaIsWy4hoamU6
	MRttcQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662s9kgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:41:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso5916102a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795671672; x=1796276472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KaIkBumHdEKKdnazl1dkdI7RsBJJnknjh5eFZLYyAK8=;
        b=gYkI/hatiBmPXLGsPcbb3jeDbEFgaUC4qtveRJrp2bSNR45Hir5JVjCAVZlx2z7vlt
         7Kv3sW6Qlzh0+cER/Rs1RXj6c33h85FPPGq2MUgTEv7CzdPRlaQ3F/THNgxk09gSMer5
         UEIwNu2vsP+74DApaddlDeM3P++L0bR7C4Nly4h7njB06zeA9R9nIgWB9joEyDAajdHI
         KM4gtxwhHofkTkPJAw5D4YO71ruDmXusDUzwcDaSufiDgWUH0sek1P5b9aKw+RrYRfhr
         iLDY8INI+JvolOItUZr/qXDR9tlqZk4N2pgAZ5Ak/zvCLSjNHerWxF5rn3uP77hcsxXx
         XB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795671672; x=1796276472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaIkBumHdEKKdnazl1dkdI7RsBJJnknjh5eFZLYyAK8=;
        b=ApjsWuNm9zGm/TuwxeNc2PwgKNvtwE6FueqKHUBVo84h8ielAFN6zg8F5A6DgeaVuo
         t8kN5HRkNsK5Q59HkceXKhEm7+dYBknf1uzpR1ptc4e+sfZDvRIx7m50ZwoUi1H1E/EV
         +hbXaLNcRPgYVqsKs6EXSl9clXJ7jlcLwwK7u1hWB8a1gtl44n2ZwEEt+ZhCCYrKZ8vz
         12R831m/s0btgttswgqJhsx5JEaLT6qmM6p1wi/kZw+vMwbArFhYGYmEt9D79/faJ+1R
         i80VnitXy3Wvw/zesxmPwcbLEpQqhONeGI5W90P3pGi6uXEVAVAKCTLNqX7DgPKpsvrJ
         UoIw==
X-Forwarded-Encrypted: i=1; AL+hErGT8VJp+195ypjJTZ14yBDDfc9V6Ixo69mmWXu+UMb1f6SG7rZpetZNgzB1l2Qud5aoKRt4ZJ61BsURGfCS@vger.kernel.org
X-Gm-Message-State: APuU4Z8zwRHh93+bhtsHX8dLQRhKe+JpR3EzvMPXnQs4Azl0w0XTDebi
	athA7fuC/MqYa5qqL4rN6sd34n0Aqws6cdCLZGpwHPc3odkNB/pb2fBPmnLdF6t18BZVTJNoZWg
	VzhK19eMgCRt5F+WbyLbCEyxptSzXKf9CK9gckESUK/tPEcdcko/X/SKtvVJUtcS7A/6Y
X-Gm-Gg: AZFdTZf7L1Werdob2B5voasknwQqaC4jVTQ3Xmao9GRL6AEmeajEhA52oWFaE5ddy0k
	sJ8ORYHGIbkr2XYXrUuuW99pVpot9clyn16or9n7cj1eCzypOc8UpqH6UtF1GKR/kHZpT3pM9fM
	fM55KvdEqZN2A7kx78oiQFzom/zNv6tXpzJuYbrKffG3FfRQ0XVTQuCEUV1zCFuWpifYwFdBGkI
	ZThUHfF1bfXUrwdcHCAJLHFdxUEgh6ELjlpH0c0HzOTzQCvDeMWkUcBgWxIo01Pmpvqt2wBK38R
	fvkhzoADJegiXiHi6uQvQ6FWLuOzrT2WulvjyocPWk0JMQN9WrYlPGW+yV0XKecPHmltLNSzj5C
	40r4lbRIixHMZbc8IEzUbUxUk6ySOFwA9XqJh02bwlw8d4JG4peNUwoMTjPBPAwCfxOU4YjTBhr
	UC
X-Received: by 2002:a17:90b:4490:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b41c7bbef0mr12554564a91.1.1795671672136;
        Wed, 25 Nov 2026 21:41:12 -0800 (PST)
X-Received: by 2002:a17:90b:4490:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b41c7bbef0mr12554548a91.1.1795671671671;
        Wed, 25 Nov 2026 21:41:11 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm33365160a91.14.2026.11.25.21.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 21:41:11 -0800 (PST)
Message-ID: <238a552a-ca4b-4997-aecb-fdaa278ca1c4@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:11:04 +0530
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
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
To: bod@kernel.org, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260925-glymur_camss-v4-0-d7c2983d6d7b@oss.qualcomm.com>
 <20260925-glymur_camss-v4-1-d7c2983d6d7b@oss.qualcomm.com>
 <179561294019.462348.12092000419789488599.b4-reply@b4>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <179561294019.462348.12092000419789488599.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b07c678 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=CZpgSDYph55k4HqUXiUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mZ5cz5U4B47D9lYb0Bej5X2Q4NKHKgSu
X-Proofpoint-ORIG-GUID: mZ5cz5U4B47D9lYb0Bej5X2Q4NKHKgSu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfX2Km9lHLhcXWH
 DPs84GGWbw1VPBZAbXbxLsb+smQCtpUzT2XeJekaLrXICY3kTwC7qxr8Db1JfbD5kZu32Dq8PVK
 cN3052A+JW6Rrdgm5IOEjYU43zheyfPg+OTWB6vNM4YtN1MYjWUP7bZmarFl/GyiEtAWi/dEX8g
 NHp4coINmo8uVLEky5in1iGZkKz7JmwetJXXTg42hPdovxv5Fdh7Cef0H8fReNOJgeffCZkytTl
 bH8LA6JEwfkiqnVXLM9hSmrfz0U4fYkFhiiDUVIiT7U/uTP6UP+0uFhWoHdpc5NbJ7+00/TgIMz
 477NhJxz6sktcLm2f4XQO7CqW3dvvqvUnMyH0JBTWEzkxfgVa88X15TxtkGtuLPW2KsUsvJ/IZl
 WCP77ey8nXVymeH2yoZUX1WQThyQtzfCHl8tkoCI26XaWlSwPXPLZmkrztLxxMj6xszlH+klX+J
 YaBsKXxhBx0KXO73mpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyMSBTYWx0ZWRfXyEdM4gGAuMqA
 dzZXQNssVz2vKN36ir2nVhHfKvYaIupbOXSMZlB6ggll2pFkSYjfqnHeiBfQ3Fu9COE1Xp9Riw3
 FO/8cbFK/cEInqbpSaRmdanzYg6+L2Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260021

Hi Bryan, Vladimir,

On 25-11-2026 18:52, bod@kernel.org wrote:
>> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> @@ -16,7 +16,11 @@ description:
>>  
>>  properties:
>>    compatible:
>> -    const: qcom,x1e80100-csi2-phy
>> +    oneOf:
>> +      - const: qcom,x1e80100-csi2-phy
>> +      - items:
>> +          - const: qcom,glymur-csi2-phy
>> +          - const: qcom,x1e80100-csi2-phy
>>  
>>    reg:
>>      maxItems: 1
>>
>> -- 
>> 2.34.1
>>
>>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

This series is already present in the mainline tree:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml

I am not sure why it appeared in your review queue again.
Can you please review the follow-up changes instead?

https://lore.kernel.org/all/20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com/
-- 
Regards,
Nihal Kumar Gupta

