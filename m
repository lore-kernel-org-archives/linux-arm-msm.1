Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471740;
	b=khn1QNnDvOUMVi+LEMrD3C6hOw7Mtr2V2kqcWqF2q78ktSYE8Df5L9To/fcLhUdzf0yh
	 IIgRT0WU2FyQXWJyFMqbtkHZWp4fOnp2oh9+cPc1XDtGS/W31ZOEffZu++ku6uQ74SJSM
	 a2SabV+AddJVhVqLYWUsZcmqBj9LQc63ffctrs0bogOvc7W2o7/YKkr/ygS/dZj1LL3fd
	 rLjWLQTrSkkalyYVLBHATbU/HKJmZhf0mOhx9eAQywLmWzpbac52AOu6PNFv4S/gdga7J
	 hSBUPFlvRlqESFbkqSaErORgiiG1tyPPY+ORxtQ7vpb2GMgqmqTpdaUZJFfayeVALZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jO0jfM6XRLgagT8aMcVQmvm0DCRJ2+e7pbdmqZkT1eE=;
	b=Ym7euoA0NZpH7a68eQqyaiZaTAXdm0ortkuCOt4uAGG8urUR6qdZqEEaZgT+zn27TrGc
	 SVK6xtGqhE3xHOZ1inQqFQa+fwX4FHj6OGUHh3EiOVkyowQxtwlarv2k82s5+k9dBK/+3
	 51/T/LfCSJcoEIfObcV+s8PyIiQikQN1cs1MuMYSE9A77K2fXs6LIhZlTWG4K5ezZezKe
	 6+BjjdWcelHr5Ehjhi0i0dFrt9oINB4xc9/nUmRvfhx2iGdlsVDUBmgpOo5DqlmkwA3cu
	 WQ80mI0hREG7zQGfZGWrCCTmgL9BKG2xysH6aXn3ShI5Ac9V3wnbT2sKtHdYKaGsN4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5fen8zl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RBGsNBcN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6564C606A327
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 22:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6564C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S5fen8zl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RBGsNBcN
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuQsP720749
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 22:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jO0jfM6XRLgagT8aMcVQmvm0DCRJ2+e7pbdmqZkT1eE=; b=S5fen8zlThJ6oL5v
	9XBb0bL0KtRCHm2GWxYG65Ef8xgZXSabe55j7G517UjzDE4GwEwHVTg9NuooKp2A
	cCfM+ywFd8syQ+XDtTJnvgMGWfIem3WDxbUWsajAJAvUAuj79copV80rurNKFavT
	YE3/pfA/DzJ40PPzbqGWEBQXRoKcsXKCZLfZYLNE3Y3Ebdkc1iqR+Hh3+rZGpeS6
	fxqlNHkwgUGFgD7/9Aaub8KdNk08GrMxMXj8tchQsnt0LtuJqbGF/yVmeGxCMAMa
	SihGfuybYwqntjlPuXjOrZLb6dVRigcmNMhKlM3keJFWv94c/zBohRAl3dYUyLzn
	ObNeDw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukqgk69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 22:08:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9213c7a506fso11551656d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795471738; x=1796076538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jO0jfM6XRLgagT8aMcVQmvm0DCRJ2+e7pbdmqZkT1eE=;
        b=RBGsNBcN76qmS7r4S1c29hJaGFHmEcIU3PAsxQTcEKZtt4fs2cu02ft2Fkok1yw8cv
         jfxMx9M3IWwgu/vPErLDB81+N/e3fyQYWxDu3Orpl96ZiDJI+WEpfX5EFkMhOCYevYgB
         k10tjdNBXid2/oJeZm+Br4BYUjVMaMI7Adb21rQgM/TPxAaWt7nYSvanSZLgZiYeXpIW
         tOLZt0uBo9J7VgEli6udcckDGHR8M4ncEJRxsSVoRG4uVL2bU+G40Tu6VXscHSsGwLJi
         FgecoYqS5yPp6qFDxuqfj9iN1sQOyl+p9AYrwe9dSC9N25gXnZu42iBbPBvsHaFDTC6e
         8L0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471738; x=1796076538;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jO0jfM6XRLgagT8aMcVQmvm0DCRJ2+e7pbdmqZkT1eE=;
        b=eYl/YQxsSzoS02l7vFIIyWWLmBAYgAP3yPJLmOJwoGVI0Z7gQ1Hovm0kLfRHtKyphn
         e9RYh9JfOjtXbbjhX7kCpB94V8ScJQxrYajCCJjyoEZZREMLLvYa+qZ8QvB+2BoN5Do7
         GUMJnjDey1U+vdqfEHC9rFta9YFCEz2aX+0Upx4DZE/j3VrWt1hKdTNkilY7zSyvqreZ
         l3mcX3jHz3aSn/Jn9N6rS8t3QJzCAe4amePKQci9i7T7fxnyb4PPJeWT+P3nz+w9Wcpa
         AF7Es/g/mrdGbfXbXA2qKiCqpJJCm5QtZvqT3KYl5hd1BD/N4q4wTtwzfvkYUY3l020i
         wb7Q==
X-Forwarded-Encrypted: i=1; AL+hErE99KqHGnRI9JVDeEPEV5eTQd8P8rznpeTwpSEYkHz25i4RyAOC5yGV8CI3lebMQwdk+JVcO2hIk7kp7wUu@vger.kernel.org
X-Gm-Message-State: APuU4Z9h2AYkpWrwWMF8fV5//G43VjiSRzGE/IqUFcStoQi6ocEVQ2Fv
	ifFo5j5a6RMGf9SugPwIk/NbYG98uGe8PJpg3TDOugslwSfVSHm8lZYjtaKxpkARDrnl6Gj62LO
	7AczWbBuwBdKnomPZgyJpWx20U0sJBUS8qP+qQ5LBWG5PODd/c2vFbLYSix4dRcR57RQv
X-Gm-Gg: AZFdTZdEcPBmIZBc3sMtZvVWvyTHrtXj/GnJln78oO2I0X+iDPU9/YqqMfDWia1OxGl
	spqdJzmTIZTSKr+Cm+Zjk4ewhjOUwgr3O6sMa7SaQgt1JsGpe0SO01do32HdGOsdMjdtsg6eG95
	jBm0rICR9FuTFU6UsvrA70JpNDX/DhILHu3XmcKoEQN/mJks0/O6y22pNQIW6q1XzBqsSgK7Sx/
	IqQG9GhpEVT4+iNpOdmM7HnopwzTx4OZlcJNC97NO589mITN4IXCbynNlcUttK2k9HXMoHsE6vU
	nrQVRsehGoO7KQBSVfXBfSym//awfQDqkX8keoGQnrUwPt/beKyzQnHlPXwZyD0yr3crnjmee05
	1u8ba/eQ2fVIOFf+PPT9YW3DEKcmZ7tI6JwIdzp4zWiN6GztO0P2But3ymz3cannWxmIbfKbU4F
	8=
X-Received: by 2002:a05:620a:2585:b0:949:727a:44e8 with SMTP id af79cd13be357-949ba9e6390mr2297187285a.35.1795471738586;
        Mon, 23 Nov 2026 14:08:58 -0800 (PST)
X-Received: by 2002:a05:620a:2585:b0:949:727a:44e8 with SMTP id af79cd13be357-949ba9e6390mr2297181685a.35.1795471738048;
        Mon, 23 Nov 2026 14:08:58 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm561786005e9.13.2026.11.23.14.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 14:08:57 -0800 (PST)
Message-ID: <c8e53787-adee-4fe6-8a8c-66fab28bbedc@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 23:08:55 +0100
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
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
 <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
 <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wu++otfv c=1 sm=1 tr=0 ts=6b04b97b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-8XAt7TJbku-FhjSX4IA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4OCBTYWx0ZWRfX8PHOkxKMuMXa
 ub8XIKwdQV4MZgk5vPfabHHR684Yrp5P8Djl4opzYXoqznDVIJFTHSHXlKJJINO6aXocRgIWiZH
 taamvCvEHgrAuF0B1xpuS2Oh+OyUZII71mQ205GfyfoJ4LZCpWM/V4oJmrXStGXKrwHuo5FX7FJ
 NK4XdvGdPh+D0vq7Zge63mRzWZ/O9Ti9vxOSpiCymTiRW0umXd6ypXIxNdxVCPvW5xBKXJvbgzt
 iedoGLGSnLTxYA9IgLa1ehSFghT8XzfgyBz9GslCpZy1QE3wNTMDNqgDDbbkgEwvBbRD2gJ0x5o
 URM2mGEz4Q5rxsAwl1RSTgToBSXDBIH3Yh1kYhvIrvOF2IR/zNixKu664+v1RWEWLxO3yNmQJy1
 cI2iYUok+dY+MndQSMybLG78GyFEcuXsiJS7SjFEsVwiaIT27W5rv+yqOj6nZmrsAx7rn0YZAma
 osQ1zL13tcKJt2MVAHQ==
X-Proofpoint-GUID: vrNKbiVkheSMYpwflFsFLW374Om7gUE9
X-Proofpoint-ORIG-GUID: vrNKbiVkheSMYpwflFsFLW374Om7gUE9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4OCBTYWx0ZWRfX9AM1Q3Qe4RxI
 Qcl3aW4WEv4aRoDojs7kE3eaC58i4PdpDe5AEtmGwFTgUcnB41ClodBfSUbfoKJ+5NGMZLiBh7a
 VBITmsQ1L4GUNrFWTxxhlB8+Vhj1i+4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230088

On 23/11/2026 20:06, Konrad Dybcio wrote:
> On 11/23/26 4:22 PM, Krzysztof Kozlowski wrote:
>> On 23/11/2026 16:17, Konrad Dybcio wrote:
>>> On 11/22/26 6:46 PM, Krzysztof Kozlowski wrote:
>>>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>>>> currently used only in the socinfo.c driver.  There should no and there
>>>> is no in-tree DTS user of these, so none of these constants are really
>>>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>>>> that part matches the concept behind DT bindings.
>>>>
>>>> Driver have local copy of these defines, thus these can be dropped.
>>>> This has no impact on in-tree ABI, but any outside users would be
>>>> affected.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>> ---
>>>
>>> I think we can move it altogether, to prevent a situation where one has
>>
>> We cannot move all, because some are actual ABI. I could try to leave
>> these ones only, but that's a bit too much work, IMO, that's why I cut
>> everything at ~450 value of ID.
> 
> If you mean ABI as in "used in DTS", I don't think that's quite ABI
> (again, looking at the glymur-ipcc.h case)


True, not ABI in meaning something agreed between DTS and driver, but
the values are used by bootloader, DTS and the driver, so I would just
leave them as is. I rather care about not growing this for newer platforms.


Best regards,
Krzysztof
