Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771273;
	b=DuxJTNkhk0Bk8ky1IaMrJi3aN0cbQ82uRRsKMuMgfYp2fyVVJaE9jPY+/gU81FczfPPq
	 CcqvzpqS/X9+cZSGeh1P96lU7euiz6NtbAp70BbHJm/2vOoHO3z+o6wENRaa0uc+xI7Ek
	 4H+Tq3Lx5kvus4P3LIsgaF5v1EcaSxgIFtcTSdJ3wJ4UJhCo9APfGqe3ZDMNYwgKiW+5C
	 XrQpCHSzE92o0ASzY+xoPeoddXoYOzQy402Jxp3RmldxcTWOTfIxbuJfoJla1Dk30//sB
	 OmautQGCQLIErJ8iZVldWJwi2Y848qrk4iilH/0W82DyKw6M7pbOe7Q9M9DiuIQgfSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eKqYDXY+WNYc6Z0k+s9jGfN3/+HBPwFVzx5u3trZ88Y=;
	b=uLQrNW9vlC8BidxfyahV+cFxJR9MetKt/XAEG79hE1/Hcp9K3HI+DN5b/7Fd96V4Xyjx
	 n5vUxJRkkdHqeSxoxlXuIRuSf13tG1zkivPA3xhpYo7vWzI/M5U51AiYBZtntvvUnNQP6
	 JNhhjIOFpA3kYNKN9gpS9l4gdf46ua/BTEIUAKYFi+xVGTEPkZIs2JjtYARPaDEU4Mmsv
	 RC3iiD37YNuxY/6KlxboePM/58dY6E2Rks6pjZqpNnyi9w3zIxJckEtg34cotX1HiyEXJ
	 W+cEW7DZCHd0/YlUFXQUiz3PvevcgtcDcQ+lGgETJobIhBoB9qOejeeiIMQ5SUjh3gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2eT4WID;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmIeleTM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80773606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80773606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D2eT4WID;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RmIeleTM
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7GQEE1197172
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eKqYDXY+WNYc6Z0k+s9jGfN3/+HBPwFVzx5u3trZ88Y=; b=D2eT4WIDJ1W9AyvF
	iqDjQTZkazX7hjX5tvxXGGUQwOODekepDblkgQKW8sHjN//bLgfVAg3Z97vTS2sA
	LCtaFSK3zELURNRphpjw+L45D7aCVQBNVc3hkdkaF/0nuhcNMzrQ2j6CnXUCso3X
	A1wq7SIr9JXJntAlDUanesYofwhjSrWrqQRvBaZUdF4JPO6E25y/Q22+fM5OLLZg
	Ss7I8bwy5+2ADToMXku4bM7L1CYTszhhnJoqLXOJYLv5BJ9j4hRTIUhHTMEnseLo
	wbUo15deJ5qpVIvaZGpbphIm1xqEmmszpS8r3hWAdJIvjUpLJdBgFbv17XMpjaEc
	2dRLiw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756k8gff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:21:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-921288e18b9so14762426d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795771271; x=1796376071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eKqYDXY+WNYc6Z0k+s9jGfN3/+HBPwFVzx5u3trZ88Y=;
        b=RmIeleTMV22FW6ke2EZjVjsuG+B6c24ZqlvL8uFK+RPDoQIzddBOky3U095Q7nrqwd
         zLtCcdcchYbm5mDfg9Tg+uCbGk0HgC2GW1Hex5XgUOiv5Vbu6mlTINUT6XRR9mEvj54B
         ePJAux0Efvte4iNudklB3ahkt7o0OcdjvI2OVY8hUOiq6vpD7sfh10ayytSwQpMjdkqw
         pHk5I8h4hs2gbyWkBbuqKmU8TT+2LUDr5KmOBIgBINBBfG34kD/ccnOBTbje3l0a8Zu+
         rwidaB6g2N2gvDGNlUWbkkA1fZHVf2PB63hBA0xFtzSsRQAZKnzdhNbIAD74rRHD/CmN
         Mraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771271; x=1796376071;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKqYDXY+WNYc6Z0k+s9jGfN3/+HBPwFVzx5u3trZ88Y=;
        b=l4PfMKisB5p+0758D4DcP6VRv3LprF4G5bcE5OjM/xDQFjIQG83EruHWhuIZTLxBQn
         InNc/hzUSOdlVlK+wZGSqKwSC74VttiVx3B6/1gN7zbW/3H8F4IOnoCOXFqDCpQcXmiW
         wUvJ+yvA9HCdUfOieL2lXSApwYDOXdIl+wzFvSuYWS26pDU7Jr9fAAUKUukHP/+cmdhY
         il4HPYaHh7LqY1e7qwcCZcphigZAqo/U2oBo91+O8L+rTAPTT+XyO65pSSL30o1HdwHR
         VpHbnaT79XnKevx1bFSi7LGLRTm5INiZjJTv4NV9ICiKo2IcmxqhVlPdNbs70P8oBlyP
         Ei9w==
X-Gm-Message-State: APuU4Z/3WTfDhQyb5Y0evuLce7unAegVdoOPBUDcL+xn6alNwOt2zdnc
	UBJ8NSljuiX35zJMTKgjDKqGtQonTnN10vZyZ8BtQk+9h9djepZMe7TxhMCFSA+WKZQe3IVYpK8
	iyVYL8CQOyT+GqXUyCdxMvUkm95TLMuhY1Anyyan64lKr8Ub9Pbgl9NppPbHwpdKJVRMr
X-Gm-Gg: AZFdTZerMpg5U0/pUlASH828bgPgw+L3aQJMLYFYkCUoBnM6HU/xzByjTFHcmQLV+zK
	4JRwCPwGiSlQ1xaID+Vg5wE018Nr6UHpQCZNJP4g8Tsk3Yub5VBFObgNA/q/mJXRdf4Ox2KvK4O
	jPCWtH6G8Lt5vs2VyW+BsCa/StM0f56P5upEjTQGh1U/6+bFRBkrDmxbjuxBHxtup5LWuaMScws
	0tuKy2PHDou09pCQyT6Sz4n+UbL8CpEFIoN/l6gA1QDZRkjroo+e3VkWGNUVuHIHTzB5KhC1FGt
	eKzuFFXqSRwaGcMoeY88NQMrcV7QVkD/jcYWHgQNXQ9ifW7jqlCAX9bf+6VNN9GfqvGVpNHkBCZ
	P5+DgMT1VwaEgG2aZoB7xYgIVqJlswIUs9QEEg79a/F6J1n5uayrBeS+vFJSC0rwfGf8C8ek=
X-Received: by 2002:a05:620a:8f0e:b0:949:95d6:4038 with SMTP id af79cd13be357-949bab34d21mr3663492585a.5.1795771270756;
        Fri, 27 Nov 2026 01:21:10 -0800 (PST)
X-Received: by 2002:a05:620a:8f0e:b0:949:95d6:4038 with SMTP id af79cd13be357-949bab34d21mr3663489085a.5.1795771270296;
        Fri, 27 Nov 2026 01:21:10 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b01e242sm820746966b.82.2026.11.27.01.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:21:09 -0800 (PST)
Message-ID: <59c63049-8996-4b07-b3b9-928c810f928c@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 10:21:06 +0100
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
Subject: Re: [PATCH v3 4/4] clk: qcom: rpmh: Add Netrani clock resources
To: SignKirigami <prcups@krgm.moe>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261125-netrani-clock-v3-v3-0-9b19d320f422@krgm.moe>
 <20261125-netrani-clock-v3-v3-4-9b19d320f422@krgm.moe>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-netrani-clock-v3-v3-4-9b19d320f422@krgm.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX+ilJFzdRLxha
 4MboILkYcGL9egqRXQ+F98KM/8OaOZNv/KLe8g7xiZSXIq+MCO5l2/FwXnhqrzQAtRscSsCaqFf
 6LrinkJRgUyIzEGmwe1wybJ014rzATm3Wdq5bURUbPyO0Jfs6H/b0gIJmr7lcMxpewC8brcUFB+
 tnErSbWp/F3FHbYR7tFmbCVz6saM6uyGHgxhtaEwFPd0V7ogDE6IQEjrfqlLhAMRsBBREl6JNTu
 dVB/vtfZrMK0nQzv3k+1yBO3ODSluInZPukLVH6ymakNUy51UgjtdAF/e02yyq/7DLjloW2ImxI
 bdCXTuBfkmGdTHUlG9aGsTNy0FAjGGIetgiTmBFCBAH7rNxLaqUlsANQ3JZdVscAP0bs44nwCuD
 f3hn3LkH8U+DAlvKCle3GTt3QH8R5eD9j2hKRUN1iA1UELM3+NAN+LIVPytU5ePsvvRTCM5Ur8N
 oWZ9VuzfOhejkTw1r3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX7wSwx0nskMVt
 wQVLyJsaom2mV7QZTaABb1wseWcO9nb0kCVkOXOkfiyQ1a8oiqCP06i1Xx1xRpgDq/iLvqmggAC
 2IF6DD0QfGtILWmkE6sSKffnVK6WmDw=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b094b87 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4CYXjMiqXY9n0OJUL2UA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 8642AHlD_EimLdIQCz-3BMV5g3yuoID7
X-Proofpoint-ORIG-GUID: 8642AHlD_EimLdIQCz-3BMV5g3yuoID7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270037

On 11/25/26 1:59 PM, SignKirigami wrote:
> Describe the Netrani XO, line/broadband, RF and IPA resource clocks.
> 
> Signed-off-by: SignKirigami <prcups@krgm.moe>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
