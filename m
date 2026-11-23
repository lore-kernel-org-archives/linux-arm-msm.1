Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460792;
	b=tkynP5YKcgxuxEyk9T4T7RrByI2q6Jaxtspk70B06sAuzsIIEsvJl1I7xlQKcsnLbv5h
	 U2tGdR1JO8PERR/0ipmhBfDSwKH47NIri3Qclu+w/XtU4dKovRtk7QzA5JgIf5RfADdly
	 QBl9c7SxtvsP+ek9AfmQr4Q5y2tvdgZ+dVXEtHYzJ+VRtCMxPHlHZeCL7xRY2cLNPXL8O
	 zJf1++Euuo18Kb1MPCpMzkl7DYOmclvXLPyf1FBEji5pLpeP545oFe9Yn0iP8rSCZhfk+
	 Xar+jDGxcSZF+jp9OxBOaJwE6NGiGqqOLRFN7qacgPNmEeeg0PNwEq5En0wbeF0PTRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tOiEwd6kmNV7JIBwmJP7LBiUslyemiGc6RTx8IgEqZg=;
	b=BqepPMk2gYTobu15f/S1Q4Nh85FJAvvplJ38URQS/rrxRGN/2T4b6IS6/iyFBbonscIh
	 LyhtKv6C9gpZvTePUgqrz1Az91EVTB2+7rS3il5Nl93fnyaUk/hYgwW8FpbV9QQlXlzWz
	 xTi0TKFNmB+gTPUnx5raqMIKzuHQbKYX5giOfP5V3gRfWO6Qp9stnSAJG3/wRr0M5rbQw
	 uKPjKUZMkCPUWs/AAS0SsOR+Lxal4Jz2hTcZmb1mx805eQYUSwQutLTiS4+wd4XmoV4x5
	 6nYcElsTY1KJZTVg7pWxWWz2v7So4lXOdgkrnneFv9HR6CjjWP5lAARGRKwTpR2HcEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V2Ndm5ps;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlsspv7T;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB01D606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB01D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V2Ndm5ps;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlsspv7T
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGvVA2486567
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tOiEwd6kmNV7JIBwmJP7LBiUslyemiGc6RTx8IgEqZg=; b=V2Ndm5pst2LttLdd
	m2l7dKji3WsB65MiKKrgjJi5XWBNT1IORbR5UcCrn8c8eDP4lw5+ToHAWveqUXy0
	923iq++6EIIRIFA7wcpqYjkGsJCqT7TDW/HLA9qUqCIOrJ49uwZN2FVju96mb+rL
	AIXjyZkyxLZFvWP/kXHZtesVtPfPKmATb0wtix74YW7lemI4ofh9QDVg6wxtSat8
	nop23RGxiP97gPh4l1nT8aO77dXsEFrSgThlUo4HXyulqXZAsjokaPaunJQo6FQj
	53phjBBd2Pz84kVSK+Mic7LBnAE/wrPw6GkxilHkjjnVqTYPjeVzm7aOhoiqBwWP
	npA7YQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy031rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:06:30 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecdc7807f4so135899e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795460790; x=1796065590; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tOiEwd6kmNV7JIBwmJP7LBiUslyemiGc6RTx8IgEqZg=;
        b=jlsspv7T/rnV6gJHWwM2AYbxAGAwKfPeYhFnWXxWXdATDKtm9HUgg6QkLNjMf5s31v
         Tv9HE8Ier3lqfhUSA9LJHyDjRNtHhtADMuAHhntVMEOzplIoLh6lYjVcnEoS4mnKSV5b
         mjQ6Sda403fd86OhqclG406qP3J9WsCkDLtuqs8Wsz4rU6x4Yst7QmVghALlzRapTWn4
         xIzI/zMxMp1P8YnZZFK2A9KZg0VdHrz+U0PqdvXgyjU+luoji0vsz152H91Pi+ba3nrV
         GLSLZlCW5S1VGz3iQLfVItw5q+0TbAeipCOj/rhpiyd0c2kWmubspMgWb558y314RAk+
         nShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460790; x=1796065590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOiEwd6kmNV7JIBwmJP7LBiUslyemiGc6RTx8IgEqZg=;
        b=Kd+JsHtZkboDP1EIIxNaWdo5I9bhyTMikzQo3UyogV78tHKPPq7F3hvY72c6aAXJuQ
         kFQTNNKui2N9O4ZX9U+M7hDUpU6aQ8OP3wJmxHzRxyTGoTuziRfqMAmIBKQG/29e7h5x
         iVht35Psm4KUbhYLPjNVzRAaIhlunfaC1GByLT0kMqLHM/aGDoZeNGOZtdO3dCxnKtcn
         dhet4x8D4y559Edq4eAlldSXTs1OjE7VlUtBOE8B0S4751TGj9KVVauImjebTy8jmrWY
         jPrQOMrAuI9tvlqP5q62p6COAm31Jyilkldsh6VEODyimT4Mv0hoS9cr70G35CkGfI3V
         MyXQ==
X-Forwarded-Encrypted: i=1; AL+hErH35Eg2Gwz8rWwYiUJXHu3TxmT7g89ybmBxsr8+SaQc8F3r4svCvSvdn3+1hlvZX1zzGkFO9Csd8VChTs1d@vger.kernel.org
X-Gm-Message-State: APuU4Z/Tdt8wxrbaF8Hwy92hFaNsm9VkT7A3dfxSidDvoD1snDYM2jSh
	9VqF+LjYSTdSMGV4oMBvny/LtGC2UhMInKJVRsKeBerFlsvX1nTjv+zFQ1sDyeDUBSg2Aaa1lKU
	joVt+8cgmKWD3XI2iwB36pKrZj6HXEcNd28ZgLJ1cXK/RCM07/3WBheiD1qsAp60e7GQQ
X-Gm-Gg: AZFdTZffEXBXGFGV1TeGH1G6q2MbDdyN0m5ta/8oR0v9eOOLgGfLubF+XLIf6IBz+iZ
	H7Eqt0MKKgTeNCq1M3lt1YH/DTj60jea/lm5ukRJ+PFlCC4wgN3hvV8kXpxchbNcjuxWy4frumd
	OiGg+ePUdfWCh2huhk3UYjIIpHnoVHlBK+D6JqHSjv4Fnt2iDIn3dN/VmUG954lwonqGSGBfCsN
	0a6xz8qZbIUHOi+1I827UeUIn6XtZkN9gkzSR5lROx8BF5lHqCNp7cUjsLETXjAYd0Ay/i0S4bx
	MpmzoIWDOgKzlhmQgYWc5FAxJ2Z66Rny9QIX8YaO9/KAgaslFzU8WNNuHjIAds3Q4YV1PmxoL4w
	Or2K/qkE4XqXih55IdWaKgIxBINW/AuxachYMwR00cgOaAv1BOMPxZ66dypWK3W1Z5lrzldQ=
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr7041955e0c.3.1795460790170;
        Mon, 23 Nov 2026 11:06:30 -0800 (PST)
X-Received: by 2002:a05:6122:4805:b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5ee8af179f3mr7041913e0c.3.1795460789779;
        Mon, 23 Nov 2026 11:06:29 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba854bed08sm3651400a12.30.2026.11.23.11.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 11:06:29 -0800 (PST)
Message-ID: <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 20:06:26 +0100
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
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX61L1IwMPdz27
 otLauerxo5tEft5hkUpzd/vbE+lu7X7PIkuUXE7uhCPb4Kg27J0OUx7SmftdgPfkigL2SKQ0cx3
 4Vcg1wMtr5umzidya20KB6tYK4LZSom5ffbIc4mL5b8z5w+reFKlQyi6bmQRX6rFvVfty7YZchl
 eHQIzhP0/CCfogCZp8HZcIvbiYvV9DlfOe1o+/JAoc5/W5vwrBGoDEepQZdzW4T8k0LWXKzOqdq
 V+1nj63WkeYl0qVRGv2eca7X6EDfhPYq8CdABd+mEhC7Lys82vP3yEMbvd9wrATcVTanySzbMgm
 RkRbjqk9RMZuTZl6xmRIp+tBAmYVKhTdxiD6Weiop7DzSN3VlI8iWLivK71fA24FE2+Hi1NjMGb
 kvxKMajXuH3wSXIAS6fFHPVBY5HzeiJbieGGPEYo9fsY01lXo8Zqj5chOOqfWbstFxzpWlh9KUE
 jvfMPA0Sj1wVpfpSYwA==
X-Proofpoint-ORIG-GUID: Vxo2xzwarZkGSO7-rh1z2Qb8lKAQnIdn
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b048eb6 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=09P9ZdklQj12kDAbNyMA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: Vxo2xzwarZkGSO7-rh1z2Qb8lKAQnIdn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfXwondB6KOTc8L
 fskRUSKpOPmJgWXpBdkEoMIHvEv3yFJZTUP4qYTWYXC+198qse4YRifSbGKI3fJpXakk0RiJkZS
 x/EZ7wdd163EFUMkhKUo+iPpQL/ASz0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230076

On 11/23/26 4:22 PM, Krzysztof Kozlowski wrote:
> On 23/11/2026 16:17, Konrad Dybcio wrote:
>> On 11/22/26 6:46 PM, Krzysztof Kozlowski wrote:
>>> The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
>>> currently used only in the socinfo.c driver.  There should no and there
>>> is no in-tree DTS user of these, so none of these constants are really
>>> proper Devicetree ABI.  IDs of older SoCs were being used in DTS, thus
>>> that part matches the concept behind DT bindings.
>>>
>>> Driver have local copy of these defines, thus these can be dropped.
>>> This has no impact on in-tree ABI, but any outside users would be
>>> affected.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> ---
>>
>> I think we can move it altogether, to prevent a situation where one has
> 
> We cannot move all, because some are actual ABI. I could try to leave
> these ones only, but that's a bit too much work, IMO, that's why I cut
> everything at ~450 value of ID.

If you mean ABI as in "used in DTS", I don't think that's quite ABI
(again, looking at the glymur-ipcc.h case)

Konrad
