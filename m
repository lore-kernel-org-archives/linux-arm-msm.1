Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318214302E0
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787579295; cv=none; b=Zi2RxaAxMqq7R58ZRbsm78loi9xv0Rswf2PXt8KJXcKEjArqQmoSm0MxpIGUm2Rk3P78C3647/7C0YZw640qYrF0za6amSwkisl47cVz1CrKcfmdA8e1w9Zhe+jMWee43NxEelm6WuUef9i6PFhHQ5ZvmoZReWuHcnQzZwqhiuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787579295; c=relaxed/simple;
	bh=jPTF8P88E8mHV7RO8dC+Aii8EkwMv2ZEjXFtqjGARho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JxA47TATue+RbspjGigYkopdaZUbksk4U563gKiaOffh/aKElqwRNOxJQH+zROTgUVkGPA+o56+86V23U79Mg3daOaqtGXQzXvI3evD9u8XvYPPvbsCSmZMOfymAhEJ7mm2EAgjeUyRmHDrIL8fblPinbdvTcfQylhRxunUwl3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EbIm6a/s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TARNO0qM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EbIm6a/s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TARNO0qM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCv3pn2854939
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b15DvA52PT9M26T4P/yCzlhrD5TH9G8ioAlZEP03aGk=; b=EbIm6a/s+CT8FLha
	s+1ubSks62x9IldB/DhPKDrI8XUbO6/aqHt8GVhqEQwTAcEl1s9/kgFHLY9JMt0A
	lz80jGR+/2TeuNdoJRRhmjnlf/luIM6xCqH2XMrckbObj/jo0opB25+HZZrPedsA
	zjo7u/MQr60+SVEybQ0dt763reEFz2AVNnvxZj71x41fd5Vrij6zRLBeJ0aL8AhV
	ALKn8nvRXkwn8hJBMblz/skIyV7lraEWbgvUfOb0KgQqBabw7wYkgZsi9PQnrRM7
	+P8KPAsvw9ZhNgSL4ZV0ssrsfNNbxguB5BsnkBDODVQEyJdpuutTLb+aGr/UT9DK
	wnxHjA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn9sre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 13:48:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9e97b626so6184951cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 06:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787579291; x=1788184091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b15DvA52PT9M26T4P/yCzlhrD5TH9G8ioAlZEP03aGk=;
        b=TARNO0qMI+qtwcMeMSmp3hYjUG01qp1FRCkNRuqNJHOtHFXPh7hcUQj+BNBe6WXE52
         9rg3/KvleVM1PN00wIiPqyZfVGkgu0OidTLt7ye+w6AjXqI1wgwF05hsHq1uDIl0ZuM6
         GzHEHVY/1AiD7PlADSlJjyQ+1E/EsNM9T0rIhhhzwi3eYORRB3Qo1PM0TJcPO/u7FztW
         zb2hZn387i3/ksbm23WsQ1ani91t6+B4+QqRBhReeCS3PPV1T3A2ezz7E3xdQFWm3w8C
         HuwHTlXfX5CYXM+2LGImymbIqBheCetmN8NqNb0E316gr7yrcUgxEvHKFI39KCzqlJ39
         xZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787579291; x=1788184091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b15DvA52PT9M26T4P/yCzlhrD5TH9G8ioAlZEP03aGk=;
        b=ELrC0JJEWnaRakQhaMl5U4d53OeH6cCzQ4SNhorxMsIVj8R4lx9Tjea6jvEB8ew66v
         0yOO4CsAiKQ/xzKtNtqCEeUa9+A3uRIMkT6MqupVTUdZ2cm2k0lq6bw34HqjC4AtZT2v
         3PyDOZgFmtMLKhpnyhUq9j4SEdGEmiGWzJCBFjmZnHz+HpQTVo+5nRQdvnESgzkr58r/
         IZREwjMcHM+nGBHDJRwxaLtwoC6D3A2qhyiK9fn4gXgYLO892NuPNYjp+Eo1cNnZoTr9
         UJ5ka8zhRXYCIWNLHmQDeA9KQFmA5kFRhNgNJMequHgzTmecXGgCE5ASXvPaO7Ww5zkc
         VJtQ==
X-Gm-Message-State: AFuF++nujsZuSvyadRsr1HIDY2qjalXXmoFVaNblRIiUHxiyPg1VkdAD
	FIZTy8GZM6YLmlZ6Tv/jEDwzgRNIp75xDxb+UUhcC327W1ZT7I7DZu5VIXPJdJg24uAC7D3qlwC
	l5Q9F/QcjBF6VUXWf8WPke3eGqsSISU4NQzX3BanEDi4MjNbUY8Vz0Pu7OUiWK7t/tw8/
X-Gm-Gg: AR+sD13YaP+V6CMj7ioUoJY1+TcgWxaq0IobwKzp0q1QQ/Ze0xrc9qq1OKJzAchp7WI
	/RxXV0FBYXQfYSOvkihszS/CMdEUiFwD0C7EKVjnnAYnNzl/Lp4h/XAMZCx0MxO6h4zKD2AQd//
	O2FDJwvgfYVwBPSFYwOt15Ige/V7sTPenByNSgGlNwPittFmWZ8YArs4tHIEw0xWArmmDEjuKkC
	qpmfU8vXesiCBd+Pp04z2RAnRUlCeJ65f0+nogfUSuOgb31xki1RD52OOzbetN5cyIPY2pwYVDF
	5Gcrrw3AOFTz2DUfU+wb+zL+KELRU+LSXawgkrJQyxNGL5SqVthjuQxz59mC0xY0ffPVVBPsHgc
	ZQlU/qKy9SDJ8TFceui6I2leT
X-Received: by 2002:a05:622a:607:b0:52d:9a83:419d with SMTP id d75a77b69052e-52df54d7275mr186253181cf.0.1787579291198;
        Mon, 24 Aug 2026 06:48:11 -0700 (PDT)
X-Received: by 2002:a05:622a:607:b0:52d:9a83:419d with SMTP id d75a77b69052e-52df54d7275mr186252191cf.0.1787579290378;
        Mon, 24 Aug 2026 06:48:10 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496295627sm1224564966b.15.2026.08.24.06.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 06:48:09 -0700 (PDT)
Message-ID: <906db71e-8f2d-4ab8-856d-915ff9dfef77@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 15:48:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/9] arm64: dts: qcom: kodiak: Describe EUD UTMI path
 using child node
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen
 <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
 <20260811213610.2956147-9-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260811213610.2956147-9-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfXwLLy+9dLNdsX
 87rTB1nAbiEw0sCFBkhggcRnnY7SW7fq9mrpxqwnCuiEfKPsxsIcVRcJ49DIB+lb2+8WRu1eepN
 oy8pbmXB16Xm7PTgSJlof5DlpESPjtU=
X-Proofpoint-GUID: Llrt3B1pfhgV_tA95cIFiFX-eC2qmeHo
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c4b9b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=wmH-f_HW3IgFKAUD-FUA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDExNiBTYWx0ZWRfXxVVuYwDmwnwJ
 MM89amCiDWcHxDdlVucUlSIVDJczC6j0YyyPTkIqP+b9hVwP3PhmhJ2//NXBXB+ntldaZ5pm7oB
 K7x63VTJFobJjVD4TsIBpgCAJqlN2zHK2tDXSqVdtKf0Caok+a/jO1frCYWnfMZt7/2mWm9BXO8
 GfRv/NLEnYQN9cujCS54wXdl/g1DXHG0EkgPFdDWx/f86jlHVGkgEspRT7j6P5U9SvJL1PcUTNF
 YmKtjMpt+ZSmgMr01SoGAecp4RhYsL82MsIg1HT1WgahCrO4FNzrjC2bldEc4Ds58wH5CeEFCc7
 yGucx62MGMgStMHjXpiY/LRmPNnXlzq8CMN7xMQBSMlaEZhdvnLTP7h9hmMuHxOvPx5sosFlXXK
 3ov7jMib0QHDp91H1qhzZ6sGJWqI4lLoJb6aWpbf6FzcRKH8k/A3wSTOUptOXi0eXx++/2BiwdV
 U2JajR7GGJF8Qr+vmqg==
X-Proofpoint-ORIG-GUID: Llrt3B1pfhgV_tA95cIFiFX-eC2qmeHo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240116

On 8/11/26 11:36 PM, Elson Serrao wrote:
> The existing EUD description uses a legacy single-path representation
> that assumes uniform UTMI routing. This was sufficient for minimal
> configurations where the USB port operated only in device mode and role
> switching was not considered.

[...]

> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						eud_usb: endpoint {
> +							remote-endpoint = <&usb_1_dwc3_hs>;

This change alone will trip "connection is not bi-directional" warnings,
as board DTs override that endpoint already


> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +						eud_con: endpoint {

Let's keep an \n between the last property and the following subnodes
(like you did in the below hunk)

Konrad

> +						};
>  					};
>  				};
>  			};
> @@ -4989,6 +4995,7 @@ port@0 {
>  					reg = <0>;
>  
>  					usb_1_dwc3_hs: endpoint {
> +						remote-endpoint = <&eud_usb>;
>  					};
>  				};
>  
