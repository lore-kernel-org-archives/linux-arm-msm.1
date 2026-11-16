Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835455;
	b=ciXDznGpe+ba1ptxBsArF6wLTp22oBMIv2tlR+Qm0VnJo8vzjO1j8Um5JZ9DUbCpUe2r
	 fCwm5AGmz4c3xhX5/RPL+YMzQ47HLBPohqckVSJ664S7UZW0MRYpsljz1Kx7xBWS34aE1
	 Xlyr3MbGtjMSERitt/ZKq3StjP4XyeC/3M5Ob2jIQIgWq6b5mxShS4JykrR862bBSAJMn
	 SVuiOKFtVDGgRhbnE98mWf4C4IEcz9BVNUba1ew41vZKqt516Qybx2u8Z6jJ55IiX8FDN
	 OMyRZRjF9W9thK+O1wmeNXIsIaVT/wfIUApyAGqz5wIeBtVBrpWlcf+5PAR5LJSPBnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6GT+ctwQTYDljqzVdZFgORZTpXEykaknfRW43itVU2g=;
	b=xHmuVnNVk/I2sAnXX7lj1mE/8bgXu98HLLaj5e3O5J1JUioNZGvG2fjjh2Iy3R3gENmt
	 G4n30MuwCYRbmo+mv7OWXsrkLrU2U4Lrk52Iz8v/l0GYZGgaWODNnIxvNN127bTzWXLYi
	 Z7jUFqvbkMUNhWuU3eT+mpXwlpqw/PCEExaaU1nhXQZLZhG0fo0PepyVfVzUYgwyMDnSl
	 kUcpP6Gw9YWL4p9DjiNS3AjC8zmqpbVFxU7BVpoQ6u3EGwMTu+RLCHpiVUJAjXmjhFqSc
	 jSbWMUS90q8EFR6AEapfjgpq/XHztsvQ3XN4xu2qYyQBNBgqjtnNsl9slp9Krdt36+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mUmLm6w0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFdBtd+7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79F4606A323
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A79F4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mUmLm6w0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hFdBtd+7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGCC93e1713213
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6GT+ctwQTYDljqzVdZFgORZTpXEykaknfRW43itVU2g=; b=mUmLm6w0uxqesYPS
	Ycl28Zbno1cCOzo8OGx4VA4nr5um2NcJiafzvsEP3xlK7/YjonvbDzhOo9OyM0eX
	4KyKj98LuzTNgkadTttSMN8laKVHt15hb2coRwewEluUR+nyAsiekLT9bdaVZGkC
	K5972To9wkAUEynnRlGBguxMNDBWsY9l2ceSt22+9Y5CbLtViVxibGMNHC/nS9Ru
	yjowr4U6qkXQE2bTOUeTf8MmLeHTWHjFHA8qasMqevDJ17WsD7pAgYT37K7yad8W
	XoqO21cVjsoscDSx9VPP52ONW1JsmirPbG4pdXw5bHKAZvcOr8qdqPgSb6J6zamY
	yuK9Og==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc2aky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:24:13 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8615687aa4eso4007853a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835453; x=1795440253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GT+ctwQTYDljqzVdZFgORZTpXEykaknfRW43itVU2g=;
        b=hFdBtd+7kwjToKw0YZdJCP+sQULKvCtS9lqPoKCD15cKtWsymynBbCl2v+/ZtEvyVf
         qNaKKXCh64Xqm9YtCeKR/q9dsrJlbUUJ+K/apcnJppXF7LpL+O0SuspRc3GaiPOUj2Iz
         HdXOg0tIWqmroFQWKtIT3uoN3XAWHT/PDx8Y3/MhJtVwTN4lH6FX+aIHg6NPfPgEjLqL
         qX6fEkEl2QdI2zyNJbvlXJ0++qNdGSoVZqegje1XD9MDtWV2Ao89R4rnUJUUe2a8St8X
         saYV3YMRZ6Ozrb1H2ly/CT8wgedNOs2caMjtKgqJOSc+H14izLMny0lhyKYSfzxuo9dW
         qsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835453; x=1795440253;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6GT+ctwQTYDljqzVdZFgORZTpXEykaknfRW43itVU2g=;
        b=FhhBX0sFisM9ZdidXVV6k2qCaLF+/UAvmQGs9d3pBCzY6zANxkH1S65Kz38Z/mFAMm
         l4crSl1/qcYmSVlW3VncC8hvMKWpicgnmk1gVbzjGBc/+rIZ2yUbQBNO+5sAVqm836tg
         pPRRDqxcjMxAkNq6Q1LgWGwIzS4y60xGd4MuiCTsnR7mwSBpuJWN6eBz/mNBXNvixKgr
         xgq1fguRCCao6QmwjsolHVL3O0+mfuwDL3OwQbNh0GTWQkba7aN5349O/HR/ZSgBoQO+
         rBXdDhfqVLJF5A20dGiaDMNgIruzDF8qJhVyMTsKnbTr8+aUIT6910LhhRFcubMz0Vlq
         3cAg==
X-Forwarded-Encrypted: i=1; AL+hErFtppnqO+DYZKoTYslMDpuACs73QR7Jg9HizBSRJlGkTnzteVRpeQKXYCQ3oIvR2TsbxOvtJtkFY+g5Bz6r@vger.kernel.org
X-Gm-Message-State: APuU4Z+g6vZKUJzbBOt9j7YwchP+6lXHnXVY8v97fb/FUG6KqdS/WVbe
	ZxOz/g6cO7DqkbVzInjWoyombkcey2yfzJhWkTWTgn9/HEwPOKMHXFVUQnzLZa9eq0hJQ5wLZrO
	dcLWGwbTh/fmHw9kVZPtjjphvibBtPc1GgfeKHPG/VXFyCPAcPEPCx0oHyfHbozC96YHy
X-Gm-Gg: AYBFou1YbX2FtsH7uRm2pP1I9vhYexL70MGI1UFsK2jlat88mhRHLIBUfj8C7Lc5ZiW
	J9TIxlBvGgFVls+NjSqhhW8Uej4kLgJUc0aeqBLCtsglr+zbXR9sEpOrxEqLU5d3IcnPY1s9uqG
	//HE9RNuIyBYveAZtsD7DiXjDu8PN9+0SY4PqsSDqV4g5tTUDzemSIFqITb3i0DotGzGbXtBF9i
	9c4EVhvdEGHy41+2ltOnh9JNa3C/ZfxG3ZDO/6yP5aWv9Ix/yAtHR9+RYpu1Uqy5nvq1wMLOP/G
	W+quK/pDvGloqpvKmyZibhnGJzpjuxrp4j31IcP26xFKYIYAEiAXgUxgYktddCIgDX5zYy/ICev
	4GRQtPbnkFjRnfY6vfKQQeb/oyrNVhyGF2SKfDlvGBH4Z9zPk+83ZJ1T/UFZbyth050u9sDk+ml
	1z7lhVbw==
X-Received: by 2002:a05:6830:4ac2:b0:839:c62a:1661 with SMTP id 46e09a7af769-861526771ecmr12512624a34.7.1794835453164;
        Mon, 16 Nov 2026 05:24:13 -0800 (PST)
X-Received: by 2002:a05:6830:4ac2:b0:839:c62a:1661 with SMTP id 46e09a7af769-861526771ecmr12512599a34.7.1794835452702;
        Mon, 16 Nov 2026 05:24:12 -0800 (PST)
Received: from [10.219.50.182] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c67db8basm3095156a34.13.2026.11.16.05.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 05:24:12 -0800 (PST)
Message-ID: <52890e46-95e8-4bc4-b2f2-03aa059b59a2@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:54:06 +0530
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
Subject: Re: [PATCH v1] arm64: dts: qcom: glymur-crd: add DisplayPort audio
 DAI link
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105104657.621104-1-rohith.chiluka@oss.qualcomm.com>
 <e24d7d8c-ee7a-4a83-8daa-4805a7920f44@oss.qualcomm.com>
Content-Language: en-US
From: Rohith Chiluka <rohith.chiluka@oss.qualcomm.com>
In-Reply-To: <e24d7d8c-ee7a-4a83-8daa-4805a7920f44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MyBTYWx0ZWRfX0Ogcw4XVylmk
 wI2TmmkknGkfo0iNK/i+/+RrG7pCdTBN1I3/f0A+C0Acv5r7y/SNMACDZ6gjSjTLSCDguKAKEHQ
 dqjjtMIhLlfnBngnNQCA545D4r0c5ts=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afb03fe cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=QTr3mE0PPTBUZRDae74A:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: D_60EbkYuV1xcntrgqC1WJS2U6jFwMWq
X-Proofpoint-GUID: D_60EbkYuV1xcntrgqC1WJS2U6jFwMWq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MyBTYWx0ZWRfX3PM9MREiSzAa
 uZbfEMXyL1WwAmn4GMKOlNpSZmECCqzpstSC6GpRcwzRDX9KO/J9M1zde0rCEuIh+e7gcg789BU
 dQwc5EeQPBpA0CFnWx1P90C1bK9uyLwGAyz1hLEiC2IaltkFAMpMpvc0ilyr7kBpDV+/n8ZJLXr
 pkuVZiR3PK9AqMVEJG7wxFI0Re/YoxBeRnrkj/WZzIEK9qtxsZ3dK05wgoH62iwS8fL7DEV38V+
 vrjF3cWlHbLuvWuSlpObJPh+10LFAfs/z1JiQRYVqT+JExiRi1je+TY5Lxa79AhaqEFnQi9pHwI
 NDjPuycZ+UZi71MElWEqTZQo20EV0FTMy2noiY57flXqJULoqgWkqEvNuurmOCI2k7mrG6u47XI
 LwOqSnkQVvQbm+s96FV+2Z8wVBcdPQvXj0QtSxIg0e7iMUSDp2I4oE31XhGslbWkyWqBNXU69hm
 kOYn4WEzqU/F7BxlqpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160053


On 11/5/2026 5:37 PM, Konrad Dybcio wrote:
>> Add a DAI link for the DisplayPort RX path so that audio can be
>> routed over DisplayPort on glymur-crd. The link wires up the
>> DISPLAY_PORT_RX_1 backend of the q6apm ADSP to the mdss_dp1
>> controller, with q6apm providing the platform (DMA) component.
> Why do you think we should only have audio on dp1?

This patch series targets |mdss_dp1| exclusively, so |DISPLAY_PORT_RX_1| 
is used here. Support for |mdss_dp0| (and consequently 
|DISPLAY_PORT_RX_0|) is planned as a separate patch series to keep the 
changes scoped and easier to review.

Regards
Rohith Chiluka

