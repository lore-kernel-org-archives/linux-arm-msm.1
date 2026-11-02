Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610697;
	b=sN3RUE9MmWdgAEApanY3YWcAoO0BSuyuQozFeQEpXlWE16tCj2QCBySnKZGp1st3gwys
	 ayFT2RIzuRjNyT/rs/ACowW+Fnjn8Ek2vK3jf4j9FA2FgRn4aG20IINOWo5n7jOZzDqy1
	 6G3Mo93Ty9qkm0DOH0zLdKyVhwMPCMKnDtS1G3ZJBddZyyUZz5R9Mk6jpYQ8gnHA2ugtN
	 LTOXbuQ+FurSNMTzJHLj3IKCtPdJilpoOZ8Z+SFll4mWh03soh02PXR9DsHH6hJ2KTZEf
	 3O1PbmyneC4mRalZ9jvyIMN/HC7YMi9imOCUA6k8N+25IAkQQ//2xSvlAth4VvBYthw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610697;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uh0srCBGufPNZ7cwNZU1GCOOPE61Pwx0Cml7uyDZJic=;
	b=s7g0YzVkj5pg4AESiLs/32+gwpETfbFxS6TS2vZootHVINm0KTEa+U8TNTZ3D2RhhMjI
	 vnwNL0ILb+/g8BejFa9ec2iHNe9Y7/3AkQsnf178CCqYzpd/bUh+SnmdbN+Qlj+GuEZ+9
	 mlyU8FetD/gRbfnQtKM8HPWhIJJIVSRWluGCb0QAEQCJ0+vWOR4A6RBatg2T2n3ALj7c1
	 2MErFRKgHmiObFdIUqWfFM28FKOtotNAgcKV3BM5f0JXYA8krxw5PS33gbL8vQuKXMtSq
	 FBglB3eVCEGNjX6Xytt6tuHPnV4xqUZ8zeTceKVJVhm29tq+WbIK7/BvRXWhR78zcew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QUWnkuiC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c7UBzL2x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3F2606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E3F2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QUWnkuiC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c7UBzL2x
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ANxD1821268
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uh0srCBGufPNZ7cwNZU1GCOOPE61Pwx0Cml7uyDZJic=; b=QUWnkuiC9xEXxw81
	CXmHwdRTUEXk21Gqf98cesdGE6yjk4JrLYRuxMyFjTc5gk31J8r3SlDW2sBz/AFj
	D76XGf2mYKajqd+mGUNqClPL+dtiJUjbxAdmmjfPCXA9KynPCiAKnec34fkEUE+e
	d/oVF5KK0EmBTkvjjVM9IpMH30UGG0f5WnEUm0G2frqNR0KNonYJ57HJG+zgCBRM
	mkTONZwP3yQlpJd9MAwABHLQKiytzPAHOppuhgQ3c6mt09HBj7SfKMXz+2x6OWsY
	+68ms6CnFWMULK2uWfcSDglIZE8DDxwGMiDYFzNhUpTJORhPDvi/F5cOGsv+YA78
	EDDaMg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4gw7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:11:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea381ce04fso35122645ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610695; x=1794215495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uh0srCBGufPNZ7cwNZU1GCOOPE61Pwx0Cml7uyDZJic=;
        b=c7UBzL2xTWZ+Gks77LrZxV6ufkxco71Ebg1q7EhcC9qDgdh4UWYblZMMzDOHUACyms
         xI91GRvWwnrD+2L2EsMnbN7atwKtSQnf9T0j+PAd+S9ORwFM7E27BcJ73ahtutbUaxIB
         0/qGEMB876F0OHfCH/HXija+kywki4SvPo54txiEqBynWMX0aNiQGCTDJ3QFqIWzsEqg
         VxYrcrl9UY21rRyT7A28j+1pF3wiaEowK5xR+0WXmEgvzeqm4tuLwct+E9e2xrBuuHFq
         dW6SiAgcEpGQj0GHlDAJysGOBm8wUVBJU/Ii/E2Ca4cDEBgQ9fqzZcgJTP5Dg2p370CV
         Cd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610695; x=1794215495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uh0srCBGufPNZ7cwNZU1GCOOPE61Pwx0Cml7uyDZJic=;
        b=pHL3/zE9vuYsV2YC3wqwn782/NshC7H3IV8HKuizmFeytb9RMsRlQOvq4Dn+/9b3w9
         GgmTZ3okLbwvSGCTWKRZqP5v8tsKTTsskZoc/zXCSqAAFwwfEKwYxoqaa16I3qeQOzCX
         VPIKf/RXPbmePgj5f73xWZdTmoKH9N8xzipgX5QZAlzvio4jYta+Gmwk0kha6jQUM3GV
         Fl3uVG+blMmM2mnyI+634guR2BTuS2l71eXuE0jrY3je5X6AqS3+FR0mW7T85/QrBsOi
         f/byey+Jkq9V3kj/VP/z6RxVIrbpp+ijKhLJ9Dos7COaB/g+zG5rx5bqztlLDgs9UndE
         EK5Q==
X-Forwarded-Encrypted: i=1; AKwUvByU3UT8HC0g7kli1NDQdRtiwPPWaJr0RjvWYIkxP2oxnZaKdxBQVSavgQGtQOVuX53/y9NF/JH6NEf7oq1n@vger.kernel.org
X-Gm-Message-State: APuU4Z8ejyZBYqpKTbOifjnbeYacb1Oax4dF+0R10SC7IPPpLYTaxtH3
	qQswTFP8sSpLAIW7vW3i7FontqcqRWjajT1tRKSafCZ8T7Hi+MocFaN7nWatOQ2fYWs3DwZ7bxd
	HgFlNs8SoA4gQCQalEIh4BLvuu1IR40NAu6qkFU4gjY/evSKWqt8ZSYOjQFEjxjNHDdvc
X-Gm-Gg: AYBFou3VtYWrXrS6hZ9a1pjylFxXuHcTQKkvzqn2m+E5wXAFDkCHDAZL0UoLl3uwXnb
	2QF0rXhcnplqLJf4+OAAEJBjXh3AQomvy5aM+hqt9PiH6p/Z/OkC7Fl6+/GeXaYj6A1xZ+D6hvD
	brRDlVkWvg7rIWkjdJdVmJGtwml5WnPydM8gm2GXhbw6OMlncY5v3ir4/9b9yvPdHdiVlCNM7/c
	X7TnC0S+s6v3mgx5YCalWVdDIZPznKH7W0TGuEf2QmASgnq7VMRYnPQykoLckQnCNmCEvtWAU1C
	ZTf4FxQ4FMw3gUqmv6Q7eAIO+xHdmUfUp59O9CHmT6bhkMxo4Zx6TGEBq9kocK36W1OUkBA7dg2
	LnVExgpOWp0zlUL901B2qWoRD45rt//maPcUALQ47POmbzmScobEM6V4XTwrC3NsK2I0uP8/0t1
	w+x0qoynPmRH0g6rV83+ocn+Wbwnp/QZfU
X-Received: by 2002:a17:902:f607:b0:2e9:3dd2:a8f6 with SMTP id d9443c01a7336-2eb364941d8mr67629435ad.9.1793610694931;
        Mon, 02 Nov 2026 01:11:34 -0800 (PST)
X-Received: by 2002:a17:902:f607:b0:2e9:3dd2:a8f6 with SMTP id d9443c01a7336-2eb364941d8mr67629165ad.9.1793610694447;
        Mon, 02 Nov 2026 01:11:34 -0800 (PST)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39248909sm25062335ad.33.2026.11.02.01.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:11:34 -0800 (PST)
Message-ID: <757f0875-8940-496d-a35b-5f482887739a@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 17:11:27 +0800
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
Subject: Re: [PATCH v23 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-1-95f250b18612@oss.qualcomm.com>
 <c10dbcfd-b9d7-4ac0-be30-6b78594bfdab@linaro.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <c10dbcfd-b9d7-4ac0-be30-6b78594bfdab@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vP8wBpmdRWkMaK2wjsxYcAopPmViz8JW
X-Proofpoint-GUID: vP8wBpmdRWkMaK2wjsxYcAopPmViz8JW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX2Uw1OmL1w86Z
 WA7DrUWGQfYxzLPzdrBK6dOlm6mYYi7Wc0ZESs2e2O+HhaxaPNJck3lfMIa7b9iQKW2kgkgLm3Q
 nvVVDfbPpVHPFW1c++ZFinfngKHPkI4=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae853c7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=dRQ5KtDc-XJZQSWJ7xIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX+0AFusi2CpL1
 guIhZeTni7LYf6w/yMxqmO+84KnDOqEmt8aFNzuLt8o+cKKkE4y99Y2lP4UvYO4ujhu1XsooRjr
 Hz7krHxjes27hWD4aJX0l2zBBcWyGyQesV/A6TMdTeV7VivUnxkypLcWu/lxFc0VpShg9zw/Qa1
 WRIommQs7MO9DYGMyKj63xQFWVH5Wel5HP/Hc0ILGhfInnZI+NIaDimyZNPmX+7y7LAoVmAEauQ
 ulUIDZxDCEzPBmDaZiCUXW2q1HaU6Z0qcPGCKBGQgBfW8llL4hDucHTg34YMyXw30imVS97t6O9
 6AADsK0dvcFw5Gdcn31sB7IXMgxd4b/TckscTZekMjNTt2XvgvIYthU/2oUQCak7BQw9VetxGbI
 y6XF0TwgeMM8tbLZrEOxaHd9L8fsvGb4XmPP/Utzqiv/Zkne3l/sfxKePzMX9/pF6UrGRa8df7x
 96i3JVOdTH/el97dtRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036

On 10/31/2026 7:42 PM, Vladimir Zapolskiy wrote:
> On 10/28/26 17:20, Hangxiang Ma wrote:
>> The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
>> C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.
> 
> Wrong, it is NOT compatible.
> 
> Due to the functional difference in the register offset, which is
> described in the patch 0002, it is NOT possible to fallback to
> "qcom,x1e80100-csi2-phy" compatible device driver, and there shall
> be a new stand-alone compatible variable "qcom,kaanapali-csi2-phy".
> 
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 
>> 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2- 
>> phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2- 
>> phy.yaml
>> index 1f1e2a4993b2..6e9eb8e265df 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> @@ -17,7 +17,9 @@ description:
>>   properties:
>>     compatible:
>>       oneOf:
>> -      - const: qcom,x1e80100-csi2-phy
>> +      - enum:
>> +          - qcom,kaanapali-csi2-phy
>> +          - qcom,x1e80100-csi2-phy
>>         - items:
>>             - const: qcom,glymur-csi2-phy
>>             - const: qcom,x1e80100-csi2-phy
>>
> 

Agree. Thanks. This line of description is stale. The commit description 
doesn't reflect the content precisely. Actually, KNP uses its own 
configuration. We notice that register offset difference so that the 
adapter macro is introduced to handle that.

<https://lore.kernel.org/all/20261028-kaanapali-camss-v23-2-95f250b18612@oss.qualcomm.com/>

---
Best Regards,
Hangxiang
