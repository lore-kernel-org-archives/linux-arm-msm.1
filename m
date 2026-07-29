Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235EE44331D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785313853; cv=none; b=mDssdkTD91lQ60qck+B6ZeMW6VYaHUm1LwRA1R57MnpWnXRtvesrXVyNyZpOV9Fir13rZKyjk0oWXcQdiGLFcgPykD1ct7ro9uYuU5hKnRjMr3xmau+uEyPaTX8UOg1SmlYC0F1ciC3C65wbZ5si+tNA3ytc+e9lDj9O3Ha99uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785313853; c=relaxed/simple;
	bh=idS56dZxFrCrC/0KTOhaUmII5hR1qScA8Hw7c63mzUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vc2HSqTXLPnkExn9JKjqpDiCQ5uuNUCDEtWOEQ/JvJ40aR6tLh57Y7oKnj2i39PoNrkTNJ5aVTRGKb9WqSu6i47RCYLK5dt2iww+kgLI8G4HoNnuBZv1p9GgEnkIjCihwTlrkvt6zU83YzF+nKaWgfm1UU3s+Q7gx2XKsQeL7lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XAjw0fuL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQTbQPBU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XAjw0fuL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQTbQPBU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fFou1372488
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:30:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	taUkXjqd56QZtUnPVegV2/U17mWYpbYvfF4/cskROPg=; b=XAjw0fuLNy/jVuRs
	bw1+42NxWqrrIwWQKMk8y9pXIGurnt9jZnSDbvL9uMA3LsCalRgaukAhAedITlzr
	FNYgr2IbQgNXpCrHYpN3NyazMUH+XiJYlPoufuDGj0NJ82bsIOqQ/9HKESaiqkoF
	ZXeoSWF4QS17ycOtLdSDMuFAk6i6KIl8rwqIhK5wy9Ge/tupyWZBUeFHiqD9UXRA
	lmLz829THJpUtSntKnTtYpgHN/2p9cTh24VPI0PP9N4zZAwGnOA5yaUqvQkPaoAN
	Trn5Ma0HE1n+rGUIk9LnPBwr2Y8qLFt0bYQIxX3ViLV7i1HJZkUI5apQUcSbDB29
	ewkCcw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmm8mw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:30:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930bd2bfc45so11907185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785313831; x=1785918631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=taUkXjqd56QZtUnPVegV2/U17mWYpbYvfF4/cskROPg=;
        b=gQTbQPBUjTO1uRK8Hak9MgNuIG/QWp/K9V1c0vkrO8CBb105QkBee3uGJBxt1qKpxq
         z+LUWdDQkDrBjOF0zFMTpuuNdaXFqJcbD4a4N4cpGQEWXBAN0S4A30gqUiIjiGxgGdcN
         eUFBE8hUmJ3nmdXx9Jto+hBDJCWMiWvw0lqE53uzGj9o7cZd5ofdhEPsVtAl0PZDXXJv
         rpEKRXkeO8NDEUbLoWjmLU/nhQpZMUg7/al6SSnvlOXxxCNVxhelg7aMOaMa0JE9d+q7
         Ou7tAZTQMkt6SN24nNygIWChl5qBk1fGtUrKqHOlcUkk9VZwf/oCJ3Cyf6up8WxjdjEb
         8ehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785313831; x=1785918631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=taUkXjqd56QZtUnPVegV2/U17mWYpbYvfF4/cskROPg=;
        b=SgC+kEEFHoDDJbrRDzBWFv4JUaGToDXi1JyDoz8zdIA/6DFxZ0Q95XyCqxV5h97VGo
         wv3dcTUChtgV1sHPa7FDIDFlJAuawwPCiC7NrAt7/0CNZ3HqbcdKdttpDQDE9w2bTWGU
         +HN6GBBxqhIbb7APtZapxdCQFR1kJdZOh/soonhbcM1Hfll5oTsai68rk7uWQHKd0eK5
         sRqd4NNmdvLMBMYHn9DAlvZHqIqYiUjeU0tW7y1MkPCrmgH+gM29jFrEocDJhDwp6aHb
         foVBKYfp8Rzqrpm9s7Sedh6J9n22E77rltnvUoDOmrayBKdBS1MaziuCBHNK77oi9Y95
         xEuw==
X-Forwarded-Encrypted: i=1; AHgh+RquMgsGvJXbBr5qsSsb8BNKyWbwJR+VVXSuUPnA8ucDVVO2cIpiyEl/7QGNFpTngoYuO2Dj4qIioBeKKkib@vger.kernel.org
X-Gm-Message-State: AOJu0YzTZ8U2XWXsSWDBhtVigwABGOJxwTiGuEsX/hgJekz3m9l3b5yG
	T12JznmiJ8gTm7GZ23jShhX0NqNKk14ca+UH+K38zJRKjhfYYLN+fr9BbKwFUliRJEMA/iTPPUc
	CzE4wzyQg+eGGLM7vxUV+xhD0onpikMuzJbuZP+8rDHqAb8bccBjcRp3elu5WZNG2Z8HV
X-Gm-Gg: AR+sD12G58TAXWT79K3t+FOFKXtOvQUpwzpR9E2QEzgPQXjJxiVfMvZ3SQMdYgoJz+w
	uUgVm4DYnDgfU3gv6gNY/U7PV10ZfzKFORVdU53SYlwMJnKH0uDBw/VdP2STZROFq3diSrjPDQb
	tNMXrF4tNWJDyoxWAUrHwzsT8kF8Sh3G/amx+isGK++04XL+Cg24XjIC9s6VM7cqvM7F29YlcdU
	QS8Xenz0FN06cnt1WWsE/gST7tLvYi4Ig8tA3Sl7H29jzogLPh+cVIrdnQJN48NyowmXJECO6C2
	7oDWgABSTtufUG80f+GOteovoP+vqJ3ao+zHGwSDj6ZKTsqhq7cADMr5/JZys5iAmA/1nAXOFu4
	iMDOl40F4HUnKgLZqajBeazld
X-Received: by 2002:a05:620a:4726:b0:92e:6485:f640 with SMTP id af79cd13be357-93302671e18mr523006585a.4.1785313831403;
        Wed, 29 Jul 2026 01:30:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4726:b0:92e:6485:f640 with SMTP id af79cd13be357-93302671e18mr523002885a.4.1785313830916;
        Wed, 29 Jul 2026 01:30:30 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f8f981705sm28440166b.9.2026.07.29.01.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 01:30:29 -0700 (PDT)
Message-ID: <2091d5bf-8c76-479b-98fd-fc75b3adf644@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 10:30:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm64: dts: qcom: glymur-crd: Add PHY supplies for
 pcie3_phy
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-4-65c8469c6b65@oss.qualcomm.com>
 <74907d0a-cf14-43b6-bcfb-8c283926a820@oss.qualcomm.com>
 <ammhm1mnHhn2okgJ@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ammhm1mnHhn2okgJ@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA2OCBTYWx0ZWRfX0k+GdVfuge8k
 IIDB1a4IDiZrkGin9WwQGRx42ewHJ56Zfy/nQBkS7znCIgRviaL7deOtSUmNo5MGs/JPyK8n2Fr
 EP2ijk0q6dEUQFp1C8KIS9XejsqsGRo=
X-Authority-Analysis: v=2.4 cv=L7ktheT8 c=1 sm=1 tr=0 ts=6a69ba28 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UQj4KVIS10MEeeuzceMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: hBnErN4ZRV1eDk9NYdQWkNSu-IP-Th8V
X-Proofpoint-ORIG-GUID: hBnErN4ZRV1eDk9NYdQWkNSu-IP-Th8V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA2OCBTYWx0ZWRfXzndcCTLzwJe0
 BUYR1wh5iKMxiqHuka7pUfWiBDjy4/YoI80C9a41+TToJXwWFMJ/3hqpyJBTf5x3H0nKtmk/UgG
 SxDTgju+t9DN/nQij6bSBmVdmGa6kgdYIkpcEl7seiPEC9jl7HquqDa7hgH87EWpt4VkgsGOw8G
 K2DiQcC1oFG1CSxXgWyA5VIq2M8vlo5YFS2i9NcKIMBupOmTsl8bcKExrhuMZyrMXhur3hXM1Ff
 DeTB9WK9VPKM1YL3bPnIF5adeH4b8r6YMlRrdL4jQLzLUl81X2gXu9dnmB8ti7/dbgOhfrQQIhQ
 JAZVpDmmASl6ZNwNLmghGft6Dn4laqo+urfGJUErniXR3HLOgObggZDpp5bX3SYAPfgLSC6eoCC
 qUlGMi+kykehdFkYwDaWQyBu1A6jEHkSJOWzogtKRmpDwMd2Qj0IjE5vUfVWGS42wRusSKBWOWi
 Bq8HmD8oPDK1PkMQeSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290068

On 7/29/26 8:45 AM, Qiang Yu wrote:
> On Mon, Jul 27, 2026 at 04:47:15PM +0200, Konrad Dybcio wrote:
>> On 7/24/26 12:01 PM, Qiang Yu wrote:
>>> CRD wires the shared Gen5x8 PCIe PHY's regulator supplies through
>>> board-specific PMIC rails. Add the vdda-phy, vdda-pll, and
>>> vdda-refgen0p9/1p2 supplies for &pcie3_phy.
>>>
>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> index 6125617de82a..0aae613a33ad 100644
>>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
>>> @@ -28,3 +28,11 @@ &mdss_dp1 {
>>>  &mdss_dp1_out {
>>>  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>>>  };
>>> +
>>> +&pcie3_phy {
>>> +	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
>>> +	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
>>> +
>>> +	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
>>> +	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
>>
>> I'm guessing you also meant to enable it here
> 
> No, we need to keep it as disabled because pcie3b is not enabled by
> default on glymur crd.
> 
> See the fake pcie3b_phy be dropped, it is disabled
> https://lore.kernel.org/all/20260420133616.88740-2-krzysztof.kozlowski@oss.qualcomm.com/

I think there are SKUs with dual-NVMe that use it

Konrad
