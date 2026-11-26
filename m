Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688777;
	b=GqEsJXoLQPZW166slE/Nlzg0lPfk94LWG/bUT97A0DmHofTw5TSSOwvClSV+22HVTxsc
	 dbRj4WXrFPbJv2LwDEFdmVOe0OzD/xgbDSy0Qy4gtQeMiwj6qRQTtRHnMQEyX4JFLvjrV
	 PUaBQ93h5WntEkyPLOlDWN125u6tA/Zzyg6ALsbEJ+jKZMpltJxAujj7rde9Q0BNBIza0
	 6vI8anBaho/ZyrkV72rpBj6EkZYwgwsD1lQCZ9ugxW31yd/uEFkzUPxDPxLXzZysG2n9g
	 KwmssQAnoIGKglvvuIJa43xD/jPFNYVrwsk/rG+X3Q0+y/vS2d/8z1CbYlLIEWpyRZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688777;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XhxMGmx3cJqWJXPqYIFBE/9itvYC5Soa02DOwUt5Ksk=;
	b=RmfuAmLHg5Pq9jcWLM9OVw8iEwbCZ9CGkqCoRsLtO6Hzg/JeS4YktMHCzMaBFlRQbo6r
	 6oNCV7iNvQBsejPOpyGbf/ls4VtXYxjDINaxOoKYS/19NkyOIkb9VVPcsaAbFrViSiPhF
	 T737sVLhjxNR3cNEOdgs0WhPXW4QH9/k2lXMBWV8UHefVrbUiTlisw2IJBvOmFqJe4Vat
	 BRl487F37N5Kf99/Is1nGswdSTndtWan5IheNHamgzqy3ONfrgYAb36JVZl2Bnpz3xUN6
	 RtbpB5hyOEO4xxfAL8Vr4rURkVYtTjVsWpxVsD4gL08zWRfEyMw+Nni3eBaNAPAZ5AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i5lJGnF4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YwghNais;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63940606A326
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63940606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i5lJGnF4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YwghNais
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8oh0l3537771
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhxMGmx3cJqWJXPqYIFBE/9itvYC5Soa02DOwUt5Ksk=; b=i5lJGnF4//4uynHl
	2fu/QwxJDg4YM8WIVlJR5yzhCv3egiSmybo0IzbE/1WSyCh6bZowCeOSenWLdMNr
	Yfwaj+B705by2Z27lCCV1LieK+R2LwXKAgnrnwiSDujnoVZdCldukk9kxHzknhOp
	MmpFqiEzkvqT/brCf30FwKkA8S+BByC9q0/sgruwRfNkfBGhqyxnhodYsM0kwN1o
	/5m9XxaZCbx0JWkSlQ6Qhi4RI2VEQHxUg/f9vidoDMxYtK3XTjMD5DcTeRka0tEe
	r4beDKGBvjyVTClG4RloaiaDQgJGnuKm9JobpwJhz9cbVa22bCw+QS2rAgfkT7Hg
	AxvP1w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm80cke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 10:26:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55c4997063aso19313621cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 02:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688775; x=1796293575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XhxMGmx3cJqWJXPqYIFBE/9itvYC5Soa02DOwUt5Ksk=;
        b=YwghNaisJhCZY4pk0FJpS77OPA5YWKJKlW62D8cXe1w+G/9b3AqLGVO0gowS5IeXAh
         rQkxdRGFlmp7PS5s/TU1nohkHAv9OvWMCQCsVAm+aqDBK6h19cEK0WQwmnlqgiTddAWz
         lgTjILqt+vdmalBWQ4ybG5dvCX21HHkQoOfCWArloIAIvd6C3udPIGldfM1kR0AtVfx4
         mlcrbRFKhBlPOG0Sc15bF+vTyZmkufqcpRYBp4M2BhfcyH02UfsqtIaTsInBbnnsJ7Cs
         E96GufdJrvZmhqWiyTBowTQ291PKCzqp3RoTIOk7HnuBppPdRPPEe1SorjfH1pQBm2Vv
         gKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688775; x=1796293575;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XhxMGmx3cJqWJXPqYIFBE/9itvYC5Soa02DOwUt5Ksk=;
        b=NObS8Qjk6AFLbFdkajP6JFK5q02fFJITHx2oFyIxK7wqxvgjCLiWyYmgkwgMQefuSU
         ZvxN38pKLR/iur3k74ce02jUjRmOLZRv+RO5lSJfm/G8ZzHTAfmGLJYJa7/nUwJr63B0
         sfyGlKOFJn5/RSNZPz2WgJzJ8AokMvqme6Kcgq0KemmDKF7X0d/s49BNy5TOgalsrPK/
         4QfkVrY4WRR0t+dlAejhCd0soujL33KfuDu8ywBFoG3XjWcKT20xlYhgdzhB7EIgw6hj
         3xdXc4GuQ8BNTcBd8JEq/fhF+Clr1eVJeFzARr+fIhteGi2M1HMDKerxcozIOX2AXOL6
         NNKg==
X-Gm-Message-State: APuU4Z+qywavX9xEB/rjuThK1yvslKIFD02wvz4XyaPeuc3hTQ74RXoY
	NIvEsOGkvvj0FvGe0OSdXwIFC5KQWeo5hxAwiqVG6gABmnUBC3ab+f0OrwwmfLoJEPeEncpQRYA
	DwoXhngx8HlpHCIHaKUnFORfybpreZ9grq+E7alZle5/jUjP+zzdlLwdDRbo3faGkv9Ul
X-Gm-Gg: AZFdTZe3QHYqiBRF20T8XGhISdfrnuWHE+i/3F7o/nciNMBRzvUiAgLiAmi0BqS/0gR
	QWyafi4QogWfmAvxWSNKWmA+71vuNGtsvezNnw7uOdFjNXUc5XLg4LJrHa2d14//UwJ+R0fvcgJ
	ESl6ZgVAuVn5yquqD5tDXh6GblPOh2UW8iV+9U8klcA8PVWi7N5gDXb04HdAL6RIJ8fqzZ6rYjI
	+OGJjLOkfctfq+F25mjMwNHXYd8cLf+XjrqMMgbXVnjjhRPN9ujN0QCO+t3bQKj4KaRFxGECyFZ
	NEc/YyhweYu+OPps/srAWZO74Kv0Z9QkB8/ykxbzcfNP7+UeQ1IH+kFQgQJQOTJ1Li9pzNVp7AE
	PjMzgfnvJvDeYGNROHM8Jz0Ab8L5RUXerlbDXlRMKozeApEzFap+fbmenFxOyXAyrs3t6m9o=
X-Received: by 2002:a05:620a:a8cc:10b0:939:8148:1e3d with SMTP id af79cd13be357-949ba891b7emr3307659485a.2.1795688774772;
        Thu, 26 Nov 2026 02:26:14 -0800 (PST)
X-Received: by 2002:a05:620a:a8cc:10b0:939:8148:1e3d with SMTP id af79cd13be357-949ba891b7emr3307656785a.2.1795688774355;
        Thu, 26 Nov 2026 02:26:14 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm732536466b.51.2026.11.26.02.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 02:26:13 -0800 (PST)
Message-ID: <4f19aecf-acd2-485f-983e-d10e82eb91b3@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:26:10 +0100
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
Subject: Re: [PATCH v5 3/7] regulator: pm8008: Add mode voting support for
 PM8010
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
 <20261116-pm8010_i2c_support-v5-3-5626ba17c0fb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-3-5626ba17c0fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Wrxa5NeOpGDDXEYXE_l6Hr_4IqQieU35
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX0CYtkC2cXFG2
 3+qmXAJgnrpZobrtlfG3wVibSOF4FLd2K6MwiFAmmCtdA/jkgzlKDE4ZI+pmUoSXmgYDW0pGoUN
 8f11UWj5JJvY2BtsvKRAasZZr780vHM=
X-Proofpoint-GUID: Wrxa5NeOpGDDXEYXE_l6Hr_4IqQieU35
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfXz+n7Ero3ATt8
 EJ+BTDcqZq/c59ulKC8UZfki8hBlVeBdRek/j36Ykqxpu97JLHp200j9JE3D9cAoh0oToS+RAxF
 KD/w97fMfTy2nSuBJgjtoydxP1WAH66xLvGS+M3qj2iOkol6x5PrPSZrNG+EEjxIV3LaLBTSsPB
 in+izdIcKWbE9hyaLygj+eMft3vA3f1/CG7K6Xmz5a5LXMUW34biMPZK4Dsh234X3KX4Xk0knhj
 mMnvzHAEf0Am1/JBqxU6iclWGh6BzM9MwaGrQ4Wr1b4kSmCBRiqx1oKwAzp2JjmdbdHiVhE66tO
 xfdGHwFsFZO/ltj9Yv7p2uyptwCB7fvhcms3xo6fboL9g557ToU3MoZsI/arp7KWCOHOvmKsDyE
 tQTtgeEufdZ0s+ACkUTqrquVn1T65CC5QQI7j316BsbS1JM/YEK/oc7HK1LOkp1jx2pmZIEUrrK
 11MsOjEHwPlRLCUdElQ==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b080947 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_U4GOqps37RzzdhOo_IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

On 11/16/26 7:13 AM, Jishnu Prakash wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> Implement set_mode/get_mode/get_optimum_mode support for PM8010 LDOs
> using the mode control and status registers to allow clients to vote
> for LDO modes. Mode voting is supported for L1 and L2 alone of PM8010
> LDOs and not supported for any of the PM8008 LDOs.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
