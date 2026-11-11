Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794392026;
	b=RvG+uzetwOV10XuMgfLSH1uJnDLRI40XDh+4JTdQjYqzs5N3h2NnixJagCzt/CYxEKf2
	 5S27dd/GZo4ekFLC/6Wf6COS4oRbhKmUltUVzCbzmvf3nsi6aGPAWdvYGMn1VIjx3Y52y
	 9/MMw5GQ4ROvCwPz9nqO6Fuv7cjzEwnIbvCPk1IImyk+kmxW7ii3NVHgSXTlTD4zANouE
	 8Ja1EZbQ3R0gXzBTQA4hD85rSDgkz32HhCK1IDf8XyoYekNJbwseMxV0rWjUBthOaCVXC
	 nhvKLvST/0V4GTDb00JPOv52aVphEFGZaFSu4PAznyx9QZdKkcSL89bqYm6jR/rJCTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794392026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5McJnxb83WQY6Kyk4BRcLwQ/t8a2Otwl41DlY+4EO5Q=;
	b=P1tmzs3gL0wJVg7LdO9eQ0lV/Hn//6FTG/IbC/M6yUKNN9QJ6WWWiTr9NFaO0j979Jvi
	 P79d29QQTjXMT9jgV7BhgG/YB+Bti4cuYlTivGDwI/H1SolbHq/1rW4DLtQf+f6I39Tis
	 HJgFIAckXIIcPRzaJiDGxbKK1k5Wj/7knWBjy34rvRscyrXJFFis+KTDGJ+5clLdI8Wcp
	 gkahO1BB3HOOJiBWMyqZpXyu/8hnjFxzVdTxX1d5VBaIDYZzrIPoZeoQ82GZsYLnPmddS
	 pmLPSVDmbfYUpgpFlsLvaZju7VmqT7AroFj5YeKR9egw/ITze6f6gJbELb8rHeAUh0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hx7qaaDr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UOpiTRlG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67851606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 10:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67851606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hx7qaaDr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UOpiTRlG
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KD30863470
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 10:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5McJnxb83WQY6Kyk4BRcLwQ/
	t8a2Otwl41DlY+4EO5Q=; b=Hx7qaaDrgNyaX1pYAxVX9pZF39S6QKy9m7Q6v7yt
	24I+xxtIM5XoHs0dBHptK1Ir+wxRh3oYHIggv9PTq/A9/odrPASt58sspaYYd8RQ
	tlqxxE6rx/EPDv/meyxv5bqJou2dAN3R62caSMqA3Xp48qRWYdko0vd7/LhGqUeq
	9skyEkcpkzHdKMJ9zNuXortCeomCpHxj+e/9bbI7PxTUY8V2yGLS20iOh4cgCHmx
	Q4LOKAS4es4o90jpYemRpDA4rrFFvaMclm3swKwUhJ/0ufbSShXuLxh5KlgkNJRc
	hvtZ5Hi3UR/OJYIvaE3UCnzIzlczMLST59CgeloZYQml2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawhnwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 10:13:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so558908485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 02:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794392024; x=1794996824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5McJnxb83WQY6Kyk4BRcLwQ/t8a2Otwl41DlY+4EO5Q=;
        b=UOpiTRlGeZym+Yl/c1KdTpZpSLEXAyKj/EVyc36g13N9he8c7CltOzE+QlGG8+O3ps
         gDmUWOI4h6D1RSJ4oHC0MdSs2Y4tF7w9f+ZzDc3tYFCHlWYy6L0QD7400ohEOVyUQjbu
         x9ZXbtnfc7Y/KfixdVXUl275vn1ac/qO7ulD8HvawppDw8ff/VbazlzaNwquiZQhBsZP
         NRBloS/CBZbLy2wCch4ZTj8uVcSg3Ez/G+872Eaftj4+ui/x3DEUHIwIAi0SzSHi06zu
         Bn8+oOQBm/GXHrKAJTrWhQaxxAs6Gr2eZwJI66Yx0v+ldKb6XHMZHjiHGcdrAlTs0tPD
         s+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794392024; x=1794996824;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5McJnxb83WQY6Kyk4BRcLwQ/t8a2Otwl41DlY+4EO5Q=;
        b=1/F17izZOlyDw3HhS7DwWxv2t5E468mQ9SdCjs880/H15ZctMgZzjIcSvkwAPYmrD0
         PwTsACio9vTBTrYaK1X5iMjYgNoZCogKcXs7/nomU/Ek4Rd6fvrV5G8y9fe1fNM6S+Pi
         nta0bOlhAgUO+IGl+YwHReU4fdCpN9Gw5hX/kipApdExHzn2imhqDd4cAZCqEHsy9Stz
         DVp9lVq3B7dwGl3h/G+cnqNy0E7YvQNAxaA3pUFw1cN6h0RaUeX/Svf5SFouhdhI8JaU
         URjj1ESPTxTMcn3yHHyyXnr1n9pdYUeNq+sCxclFH+9JQNwjoUr4bJZAFMTRv1fQfpl/
         TAKA==
X-Forwarded-Encrypted: i=1; AL+hErGyGYKj/pIrNeijKp3d85Ps0hcRXShyy6qkv/IJ9uEroE3KD5yVkGLM9goOuzzAR6rr3rabBpDbM5YfAdPR@vger.kernel.org
X-Gm-Message-State: APuU4Z+sUkfvJIrTuIYr7SOFYsW7snvwpPpbcwgx1oNkZl1qtewmwcw5
	URJFG5SATBCBoVD0Nf/xMXleeee1TvxNOdEWrI7zLUdDD8wodwwjsltbUWfwe1fQzMLe6sb9q2d
	hWF3yKjwZZK3IHbbvfhFllvcJPRN/HC3ciMGwdeJuU9bRNZkp3GQThQn8hPXB6VANKswW
X-Gm-Gg: AYBFou3tFXhgM+ICr0Ocbk3beOEpPmECeFF0G7grQrAqRdcDAcpY+3GW1TvOTBf7I1W
	fxAZE77gwn8sIrVaCIUFPSnX4MWq7Wbc8j44xE2vM4ouZLBUByqGrty7Erf24ZENtJYFV3VA0Wn
	brk3E3nqksg7GgxfTgD7SY9tSdUaidzoRq46JtBzN3yTW4jzRrQJMJLL75QeGDcvNQL4VNlFN5Z
	1GypzPwb9ERpkosSK5oXBUKA5zASs2pPgJIDtZU4bak1pB6Zz/uJWqR9u5olL1Yjmt2kWuE/rmb
	0TOETcaFZnqmfDGr20ixAOC7AtB4JUNv/FwRjimod5N1g2GMXD2AhnrTbFo6zoHO0sjh/N5d2Qz
	Ep6hWu7ZHPZFtJEix2ARbAfNy9wsuQxjc45ejmSmabqvvAmxAv3u3CXP4U8z/hQTK
X-Received: by 2002:a05:620a:6c11:b0:93f:19fe:e6ca with SMTP id af79cd13be357-947aff8efecmr302492285a.43.1794392024330;
        Wed, 11 Nov 2026 02:13:44 -0800 (PST)
X-Received: by 2002:a05:620a:6c11:b0:93f:19fe:e6ca with SMTP id af79cd13be357-947aff8efecmr302489085a.43.1794392023805;
        Wed, 11 Nov 2026 02:13:43 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bd6esm10339577f8f.28.2026.11.11.02.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:13:43 -0800 (PST)
Date: Wed, 11 Nov 2026 12:13:41 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Demeter Barna <me@fromdisposition.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8350: Add the inline crypto
 engine
Message-ID: <m54copzsq6jovs7miluvkwwczxiquq67n5vgddy34vd4otycxw@ezowb2pkeesp>
References: <20261109-b4-sm8350-ice-v2-0-fd5e84985e90@fromdisposition.org>
 <20261109-b4-sm8350-ice-v2-2-fd5e84985e90@fromdisposition.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-b4-sm8350-ice-v2-2-fd5e84985e90@fromdisposition.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MCBTYWx0ZWRfX7dNdQ/sjWtWw
 W7R49KZALuvDS5MSo5vH/HhjnSexa8VywnGElxtl/LIQbu9zq9biAjCxg+qD7SNegTFQq5zi0Aq
 J3A8ldE0KkW2YWf1dwcfyWVwby0qQyQ=
X-Proofpoint-ORIG-GUID: VjZBJNx5coThpQ8YK4UrCdV52iaR8NAB
X-Proofpoint-GUID: VjZBJNx5coThpQ8YK4UrCdV52iaR8NAB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MCBTYWx0ZWRfX5DHk4l5Jk2dC
 2bmhXyVeum7rgwKmP+teZjqvqi6aPyMfqlmt7T33lcFZIFyby6UgK3ODcBJVzHkJbJWOMAeOysZ
 Cs+gARDhL2iY5fTF27PWwhvcKlh2P1B2TR1/x+n8Nv2Na7NY4SjijhR4oWMELSS7ITPiKnWsN0g
 Y47UFxjEumjOkRqUn6FR6G209IfgDNLwkVSIe9/DdumMBQWqrDY7VOZi5mBvVxDs1GtHR/ZCdgT
 5IDnJsRav3KS6mlblhPm0s4secE+eGENfDSzpfC1WS9/dAjCyeRN4vpjDTcMQr2g4CLXBXHEgap
 Lrd0scvCmQdyVB0iSniL95ebTi2cHbMWWoM/z9pTfFvhy1Moeakleikvaz4T1HV5wG5qT5A/FDY
 7GK7QEsUDSlXf1m1wtFCTXXko8hmbcuk7RUPuFEpjt7T96vsjNxDGPsh3pNhUyMKAsqHSeU+0uM
 PLlQ0w5e9ZfoboV4rZw==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af43fd9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=z9-AyCJIoEr-Zpo9GLwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110040

On 26-11-09 13:55:30, Demeter Barna wrote:
> Describe the UFS inline crypto engine at 0x1d88000 and hand it to the
> UFS host controller with qcom,ice. The region covers the engine and its
> hardware key manager (0x8000 + 0x9000), as in Qualcomm's SM8350 device
> tree; it is clocked by the UFS ICE core and AHB clocks and powered by
> the UFS PHY GDSC, as on SM8450. Without it the UFS driver logs
> "Disabling inline encryption support" and fscrypt has no hardware path.
> 
> Signed-off-by: Demeter Barna <me@fromdisposition.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
