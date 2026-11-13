Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556993;
	b=zUDhkjGqR9e+TItzubCzIwwSLWAs8Q3Bxc5te/g5aaqypZP9W0HjLduMIwAh7RZ74MWt
	 eHV1i7EBiAFztFlM8cuRyK7UpJQDMyozCLo/l0KV2dtICEyOjjXycCPa8Bkj8G6dn6BtS
	 mLkZcAV10iFvUA01UeLw727eg+sJ7cIUXQtKLzKMM0O6oezrdedyYaaEZdKRtFjwysTwF
	 IVB7B0S4uogrt0DzwM4uM1TpygU+AzI6Q+1gSvq/QBPLw8iOBJQdNwxvrtKIexk15qiWW
	 IY3AW2BsEbrpnQXrH+ste/m05KLnyIIRB++G4REZX86g2jjm3eWfgGBz2I6zxiyG//Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556993;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zVzEyTZk+1HeWp1LRvu76rixuMIXyO9jzfzAeGraCds=;
	b=x0XtEJzXetqOKtRhqWsvcUXYfTcq/R/Vrz0kr6aaQAs7/q4fgKNz/oeZ9i1AYgDfM8u4
	 4qS5l0JqIIHUW/F5630k4rkArJlOSkcZK0bBTWttiO561A5eT5eK90Nblbm9PzcKuhRrT
	 4EA7bLFc9S/yMK8tNo5ApZnnTFieDn7CFTlan6/0l3lH/dt0scUgv86R35i/TRGFLCRqN
	 /1s0FNYBqYEzavyZhRPb9GgA4WPoO/EtxtudAaHZKGRVgPCEzGpw60R6yoRmKDn1puh8D
	 beYCIG6oS8rtbUhD9k+b8NTZ8z4bu3zM3slsdsLIkC1NfL+MBjp7NxV1/TUdHUiWx4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oy4vo9zS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EriXx1d4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F88606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F88606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Oy4vo9zS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EriXx1d4
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD5762Z367308
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zVzEyTZk+1HeWp1LRvu76rixuMIXyO9jzfzAeGraCds=; b=Oy4vo9zSfXOnTriV
	FVhy+t9/cBbMbZiP9Mhymkf+ac0TsPPXlAAXr62o2Igb7Ls2H8fJLUvazYafDGjd
	i7o4tG2yusJN/vwcR+jKWVM+KReKmtRbtB8R5/9fD9URbEUSruSXvT50TZUUCK7g
	vXkbyjuslOwYOwscZl97TgTTAm6+0cwyyXGAdMD5tp/AzrwZasMG+OQVGl5zUbV7
	E4JgYY69T200s8axZA11tJwEMKNQcbggyldDwZuzeFyqJEsgCW1HNLMujqDcuHgA
	WwqcO709jr0CH17N/OJi5vEAXOpoiywNdey7lP4Sok9XYsnEMz+05yFN9UKzyg+K
	ef28vQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx3456x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:03:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso16237285a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794556990; x=1795161790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zVzEyTZk+1HeWp1LRvu76rixuMIXyO9jzfzAeGraCds=;
        b=EriXx1d4uN9we6P4Nk/oR7djMWkTEblwJH3AYRtHXrmjlloyAOH23+V72vD20vIR6M
         0vhZJJB2Kqb1fVSeYxiVAYR5B0Wo5vXWw9R30A7hq0P+wIPvzKrmcOoGHa59Z3Co86XG
         nxqKH2POQ535lHIkL1bUEB7tCvh2ZSiDdMmrqP659HX8uLrfm/Oovp3iad/2n2eN8ZIu
         rzPJauERCOE58BcSa9ut8mCmCelmTmL6TV5KMTHd6ivqinF1TUBeyBUCZgmALACOIvMc
         hbFKXsXk9AlkS776qSMmmdxt3SYBRhtT7GgmW1GftGvb326JoGuXqj5XozXRH9YFqE+t
         3RYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556990; x=1795161790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVzEyTZk+1HeWp1LRvu76rixuMIXyO9jzfzAeGraCds=;
        b=f47wSG21gjJRzr65qba/eojq6q/hI1I83jCRyAdUsVKOrQnjEnEn+d10A7StgTPwT2
         nOsxCXohtM/LllnZ7kxADWsEksEA1vwE589k3pPNKZHKQ5CgBBwL8+CMvMUPAw1EkQr8
         Oy9UfC5o1KPNR+KxDTScZAsqjnHJQSBR9OB6apkHY2QJZOaL2DXjE+t/t2Vwk9dgKgz1
         Z4gSIiS2ehaAPQjrEhF8YVGFk1uJ+TW5I6uQFXjuflQQrfyPLdeiuRDda/d2R0NM2bI+
         2cf0AcD8gJYxgABQ7ek2Yntkjy+y1h34O8LlJMrHVZPnhYs4s8U6w0Ej8F9lgAxN08Y+
         92vg==
X-Forwarded-Encrypted: i=1; AL+hErE8wA2ANv1UUWq8/Pa5GyYRrZw+MeFxAZJDA+IsHY0knC+UvwVz5J6qr0/eQtSE0tXAk7WDB4AKtQ3hYUhh@vger.kernel.org
X-Gm-Message-State: APuU4Z9M2wqYEJjXQsecxGT1OgXe+0Ltb9SWyCPmZvdrp6HucHjDA/nm
	JCIzt0cktSZ15Qcz9Wj9KlWbIICU+nweqPYM1ZIfm3WTTTJcrQoxUjmNxQXHDGjbEYJCAn2HQc/
	PGShstYWYqyE3a+QHQbwA3uBIjcmKiBPpC9H93TiJwgzN9iN2+YL0CKURCfU2cUr+ID1p
X-Gm-Gg: AYBFou370bnBRi2XGxPm+XYA9XmyyIrflN+GoPJjd0oW5vk7oAXRkVKyIcXiQhdI5YH
	QNtOaiydF8aBBO0V+g45jfj048cnkwq/WjKjHVuIyS7EaGcCUjracp3wiNznUXy9Bc9u/cPUx9q
	63LMEn86Al+HtOOUOAiXsAT0ioALsbeCyxHzHR0P68wqw6CY1+K8LbGfN+gfivPXHmndgyx9Ov7
	jthSUx6wOJebuiXC325Flxv7Z0w/AyGxQc0J4Hp4JtawJEfvSYIcorQiIPrFDSn2KqU/1rs8L/t
	oxE1KabhSLp9cTRKNo29+seBgpwB5bDaX52oHnStJJwsuJlgtBYC22WdhPcJ5p4jBsmIJxL50OO
	TOy9B5HjG2LNxuAisqL+MtGK737kqpdL2S5IwGLYMV9qq07SpcRYACP4vI/9zdELo01G8gJo=
X-Received: by 2002:a05:620a:a790:10b0:93e:6d87:4f69 with SMTP id af79cd13be357-9494bbc8d7dmr268106785a.3.1794556990206;
        Fri, 13 Nov 2026 00:03:10 -0800 (PST)
X-Received: by 2002:a05:620a:a790:10b0:93e:6d87:4f69 with SMTP id af79cd13be357-9494bbc8d7dmr268098985a.3.1794556989293;
        Fri, 13 Nov 2026 00:03:09 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7e5cfsm63171966b.76.2026.11.13.00.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:03:08 -0800 (PST)
Message-ID: <ff19f124-ccb1-4f17-b047-da01d839bd36@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:03:07 +0100
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
Subject: Re: [PATCH] clk: qcom: hawi: Constify known static data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261112154357.271072-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112154357.271072-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af6c43f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=yez1amU5zvzsZwMJzWkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX2P0+i6Vx6iVW
 +xQjbltRhb3O952PxQ1xyGzhrPjjtX2A0Tst0duYoUwXf9IdgvglGEZgOAzAotiF5Q38vFixCQZ
 y+85Zk4H8ySMnzUvKPd4ogUfdQH6MbwkaWtNBe3S28nFJ6UKgQu9tcl1j/Mq8lpZkPNCux0H/5Y
 z5E+mDus63qdJn4dbmrLYWprlzo5C5RXBmBhaYDdwNRLIfdatX8gtpfyFRk/ty3dk0QvEpNFLhE
 iWBxx0VynZCmKEVWTwgtdYcYhxTO+r93kXPCdYrySOQVivSRNW2IED/tXrPkjwSEETUTbXoaBfN
 eI52xRyt9csmytdCIkkjfDMHiVEhwxAYQ0x8TQeKndAvGkd+dG2C2zsA7NHI1oYa8kJQdRIdNQE
 Utep770bcAgcRVDNTC9D+g0EjdkWIqzbzZVa46aczbFAQOyrfajtfFARlas4gAQKZnKXRYlcb/W
 f5p8NBna6Z2kIwUd/TQ==
X-Proofpoint-ORIG-GUID: cFcIrdpTQAxWAvC36YknXmaWgIbfjqV5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX0O8HV/PMAA8p
 n6RlMZMI8e/P71hXBx73GXNz5H/ZGhCh6aFttjt/axrMjBKtlg0JidaFz4TSVEBMHPuqlqmie/2
 KzqLiMFbxd6qfZc8q/sS8fueb3sDI6w=
X-Proofpoint-GUID: cFcIrdpTQAxWAvC36YknXmaWgIbfjqV5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130031

On 11/12/26 4:43 PM, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' and array 'xxx_critical_cbcrs'
> are already treated by common.c code as pointers to const, so constify
> few remaining pieces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
