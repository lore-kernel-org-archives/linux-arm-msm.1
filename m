Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781900;
	b=bX8/vnNl34QEv/aFod72AFKwac73eBcooEU58QdkytGlPwPgDvHVtBClsJoNeovazxts
	 laOcrQtQeHnGRg3k81s0LemtQ1SIo6iKhAvWjV+QuKDKfRB70VFv4I6mb0bzh3ZIyBvgB
	 aNDpjh+kDqH4TKkWpFAe/xmNC+i3m/WP/0cQJJBI4xk1cmbmKadT3euJE7GI70P8BS6CF
	 Pgpea/PYbyRhf3A/jTt5mt+lSeVQWbX4aXmzltZmJkijdgoa0kKJBMbatNn5Q6SGrQmYm
	 pdiFlDmub/HTCZreRIo1RHY8WRgNWaxNOv0VVRJL5w/Gi80AJl/wqF5HU4svqZQRLfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781900;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n+TEDrUElWg9uttZzwotv6ehhRQDadzLBsmWXWQ4tek=;
	b=MWvqO8neGYO+f3BkYe8ukLIJ/w6zaWxLCvSJUA0QoYUviNXCv0GhgfW2xL549ibfJbRK
	 QBF0/IyGYQBlvNQEIWxpo0M1jtx8fMthpO5UuR6AQcTqV5atOXEZxqwg5YZ+elhDBX0Dm
	 +yCG80vi5aeOfmDSRCKb7Y41rWJaRE+gZCAXaCWgubsdz0H/7k8qCFoOsLtbZw+cEm6eP
	 1dFIxKSfMqo6ejL8crcUBR7IjzahWXgceX5VvhAbeFo3H9fom2HLI2HtwFnXBGcijjhIe
	 NuS0FTY3eTLC//XWDQyCVTdlEAecFPk6VedLNKHMU1XvQ/czppY9+STLMS3Q4pjIsSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L8tpp8El;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=An8CfSCW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6320606A332
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 08:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6320606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L8tpp8El;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=An8CfSCW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KKtG918403
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 08:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+TEDrUElWg9uttZzwotv6ehhRQDadzLBsmWXWQ4tek=; b=L8tpp8ElNIR+2SCL
	7ABPfhPua3esRfL1aCbBvR9OMxlgtGpIn0i/qMU2pEcNo5Eqx3J0rn2c+0kkfR+I
	U7/8vrjIpKlksjXwfdREkhZVExiSm+DC1oId2M7zdyVNVkECDPnxUmevJscvZvGl
	InIg2N7mSUFHqnfg0xSNZQqINbtu7s5o79YgzZ8+hKj8dbnah7ACvSe04DRsmRiM
	Xwdm5i74GRLViDKzpPTEx32acz5ROpfe3JHkOsB3MsyKe0irSgrfQc347pSSDkhj
	wAnTUQBTyaevg2kGbnx8oyv1WV8X6mwi0e3m+SKJCpji9MroqND5HXNR5fjCX7r5
	MwXiew==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg965m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:44:58 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc01d48a1bso1437795137.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 00:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793781898; x=1794386698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n+TEDrUElWg9uttZzwotv6ehhRQDadzLBsmWXWQ4tek=;
        b=An8CfSCWQwW0diZJlUulskvDtINwQDb2uX3sBnyH4H+oUBkqWKth48+Tokq9/nGKv9
         aX5zX9LRrG68zdr6uPkjvh4W9NScqizMgLHETeYmOU9SS8glbvDeZPVZPlVtLgMw6o9Y
         jfoURFC5Frz8t2D/AZONsYOudkN622j/5ll7ItvEjhL7wuEzXuuzXLAu93izx4PaRxM1
         4GOmO3Czlm00iEJDYwNTVDpWf9QhXGOZ5F/OFeR6U7HCuaTh+frAJOv4UYJk0Czq6jkf
         le8kTXegA/o9/hcNVjEgxnDUkrMiQL9Ah9c9R9z76oXLV+GfXr3tc8vFLjyXHvfdFpQW
         V9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781898; x=1794386698;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+TEDrUElWg9uttZzwotv6ehhRQDadzLBsmWXWQ4tek=;
        b=GXPd0ZalC5qwb3oxpDZbqnlOHaq6gdwOiOLKfsVCvaSpyoatDwTgvcJ7IzZ5yIlh5/
         EUaZ7m5Z8LfwiVxLGhjqXyr+TWHebKCf6Thvtu4X1cGkRdeSSi+SJRoBucRRIRDqnC3Y
         Wb7ttN6EmP7GIaG1RjnKBqXK/8prssxD8oH2SJWrJZvqpofpSBTz0+kF8OmEptXyiN3C
         A0bBcXcZIqPisE4WwZAXpz7xHzPQom2ID2thhAI/ZvLujd7xK8Np9/OT898qvLnKpo2Z
         PfPfDz7sWzpjwzd5NPdjHYJctMIE8tJwMI0+qZhV890UlXRVE6TQeFV+2/G9S/pjx/ev
         wYkw==
X-Gm-Message-State: APuU4Z9XhPfgAureDDby9RgXrHXMOU1sTc/4UJvTcjC2MzSpLHbnqCNS
	Acmk6dy5OgnUY+hdwIdJ8pj6x+fQ7u+EcjlY06VRk9r7+94JP6555CMKnWniQI77LUa/Do7g1Ld
	zJlUYpCjBgDnCKXaBlkXe9PfeEILNtBUJyIgL+V9OS0qVmGmrVqEZDSBOvXQVCMS+YLxA
X-Gm-Gg: AYBFou0L65yFVysXHcmkKZpxvklt5Y1X9/3DndYgBcMxnugktB43kwv2xJbmnPVxBGu
	0MXYn8npfzkptGtNbIXb3WRtVmrlufw3fZKaOhhsBjB/ABoQcoAwEqMa8XnYc0UwQTE25/6l6Sn
	T9CUScUZ2fQYsJ5dlZ3fIfH9B0W3qKhHN+YYHnuxr4ifAZDk8d+WmFzhF+AhNOet9rfeGjOUfoD
	OIauDady2ag3reOmQamm0HUyur19KyRS97u3H0iFeKYpN9mimWkmrI8xfgtFfeMia2eYexmB030
	51Fx0W/5PznLTT84p4hh9Jc4PU6S/hFQglv5jNOWsD+fHJDpZgDOaUITy1RXE/WMkZaIgsNIYnr
	uF4rKGTnAifg2rnBCgTALDymWGgGT0gmqyqG6jvbkXixPCEk3X5hiH/BLCamWTFak7XBr8Ar0TQ
	==
X-Received: by 2002:a05:6102:3f9f:b0:7cc:14d:52e4 with SMTP id ada2fe7eead31-7d054182fa2mr5047781137.8.1793781897728;
        Wed, 04 Nov 2026 00:44:57 -0800 (PST)
X-Received: by 2002:a05:6102:3f9f:b0:7cc:14d:52e4 with SMTP id ada2fe7eead31-7d054182fa2mr5047765137.8.1793781897282;
        Wed, 04 Nov 2026 00:44:57 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d7f7sm2658699f8f.38.2026.11.04.00.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:44:56 -0800 (PST)
Message-ID: <6964d550-2ddd-463a-a142-9e8f72588803@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:44:54 +0100
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
Subject: Re: [PATCH RESEND v7 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC
 haptics
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20261103-qcom-spmi-haptics-v7-0-418de67ef84a@oss.qualcomm.com>
 <20261103-qcom-spmi-haptics-v7-1-418de67ef84a@oss.qualcomm.com>
 <20261104-myrtle-kelpie-of-chemistry-de43cf@quoll>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104-myrtle-kelpie-of-chemistry-de43cf@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeaf08a cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=kU8dVnbwxP-e-aHbJ4YA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: GskdetWLkQio2uaOLuR71lE_3WsZlZSs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX4WXSqFyrvTj4
 1BoMoLf5hci7PX8XOKKTMQoD68rqpwkbXVugByhq6n0s4BcZQ93ofra54z3y/AxezgNRChhcWel
 6r9QHTw+uHegYv5zponntDpxaqXme2bDlzujzUSTh6pLgwbaPXjZm6S9FrKgI2hQOuNbzgIRf/Y
 R+MSv3UaLOlWFknMDt5HMXek2G3I/w95Tsny0N72CllLcz0uXV6P93lURPAntKQ1CG/HpXhcYaj
 qwR7VpekG+Zwb+Fa35ExAwNi8qldAFafUoS1MUWyyK1OGiRY5cVjftziaNN4iodW1aRx0mhmcb/
 uOUrJrfQlJm438erLCkaVcR5MQWT2l3SKcbfU8qIuequ8pwDJFhzBcGvLkJbf0h8JmaKVdRubqU
 6qraJ0g0JEwIiD8lcoZtRoVNmkMKelrO2TmmS4I50op9BZJ9wvvhpc0ReLzLgipy9VqSaFXm53Z
 nuV3cZUoijmkSEIYIyQ==
X-Proofpoint-GUID: GskdetWLkQio2uaOLuR71lE_3WsZlZSs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX42hxMI7vSmDD
 q6lb14PnUJt6Q6JFeYxzxcA9fjHOiH5OiIA1CDKr0zSwiS0TBbjku1yEDqCheUPgT8ug9xvgoqc
 y+5skNhymDdTBIEw2kDd9JiT8StuY0s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040034

On 04/11/2026 09:29, Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 08:51:17PM -0800, Fenglin Wu wrote:
>> Add binding document for the haptics module inside Qualcomm PMIC
>> PMIH0108.
>>
> 
> Why are you ending this? On what sort of ancient, downstream fork are

s/ending/sending/

> you working?
> 
> 
> NAK
Best regards,
Krzysztof
