Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497746;
	b=GeoyoVjeA9ecA9eI5I6WooNrCZKcXbtBw1G/QDhRxthROPbwZPcx3TBAFRW+01SaSHom
	 ADIkblSmPJKYnPBnPrZ4gEEqmeIwTMaeHRMyy9h3Ch3rdfd0J4L5N1WgYuW83fj+RVQ6+
	 cNhpnmGIhYGgl4w9v/mfFAgimTnje7k3ubL4ludjs3AmOYYfx4Muxa53juTbn/cwIOWHo
	 YTtvuEKpbcKZN1YGs7InZRhycNYdki5+Eo7MoenSOpBeT/DR+JgeuQRhpO3FD/SWPRNjE
	 /nNhT16Vn6R+Q2ovCIZDlyRah53iqFbO719RK9hFF8iXgibS2BPrSWoUwob2FgsiWZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497746;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mBPvOIph+Y2ejrL12rSsmbSwXyGX0t0FlWsynXnRvDA=;
	b=bzvlwm020gJiyw+TTp2q8eAclsa85EprmWFr3mjn65f0gzaiESPB9+feeh/2e+0KXpzr
	 ru10NlDvzoMFYBHkB+StuhdcY/eLvtWpwFs5J6QZwsqRXPfH5r+Jp590+YoDATdxCHmNi
	 Jh30ch7/WWSaWWB601YGiu5tabw7+PD3XBno43SxO2FVJ9lEOiXG4xBbRIRhpYDqyZwFV
	 vJwYn1qviIuvbF6NaZc+uq2uWNiUPaQjHE3iLhGjZ2iTTQeMwq0UDFcmwP9u5OaPKLWic
	 9PUDjaBX9+xmckK+C8Kirsiny7iI6Hakl68IGRpfpeboLNBAUG4Sp4zAHbMFIdO+0NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hn+OfHiv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drbxjFeT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBA8606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BBA8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hn+OfHiv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drbxjFeT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBWUf81571770
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mBPvOIph+Y2ejrL12rSsmbSwXyGX0t0FlWsynXnRvDA=; b=hn+OfHivo5jDnFft
	FUqBSTX1uatQPnjCOrPgg8MmNrF2SZMquCrWFt4idF1IV4ZdLOVUl6r/UeTnFySz
	mJYmlbjsgevWo5wrb49ql4nWjRFSiUxTBs6fdIwSKMsfyFpR08B6S+7rcWepJffG
	TB4uM4MYJzTJiZYWGWLwXB62mk4u+KunqVWBgxNd+0HzB+rVzahjuvUxXjDPa7vR
	O15RwqEQWVVB8wvcMAXAzqMtXcxh2Z64VKlrGM4w23qHvTf6f2QFaZnHzGlmZ2Pz
	jc9oIGIgyqDZ9VVCNIWwMkpfsDyuNhv5r4RjiFZao04alAWX/zFvyXmOAQLyTsph
	lRdH3A==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h28331-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:02:25 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso71384e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792497745; x=1793102545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBPvOIph+Y2ejrL12rSsmbSwXyGX0t0FlWsynXnRvDA=;
        b=drbxjFeTO6qX2AySQ3kPGYsp6znUPrxHjFyEcibxvB9cy/a90pvo7sePE5J8v4cYTc
         1bEE1lpartphPahpv/gSQ6TQrA1a4aKEDq1dDIGWLZV4OHK0R3Aks25U+5GUUEcELNuU
         hv78iPkJGJM+4piftJ2uYC0V3aC4tcuS5IkZ+a4m73KBtSa5VLUjTpeHVlh8OH1AaI31
         VCiHv+n44v9IQ77csaS1uKgPLAt5txdKeufaOwhxUl/Vj6TncE9PjM1gN9q9BPEaneX5
         k+Dd1zgCPnC4VKF4Z7H7/Y49UvobvT3IMVAkdsZ5x7o2II/iphFCid/7DSEjr/T42gVZ
         j+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497745; x=1793102545;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBPvOIph+Y2ejrL12rSsmbSwXyGX0t0FlWsynXnRvDA=;
        b=dWX+zyOkKg+BrvoJUbnwy2GBlFK/VIAKFQV0zV+L5I4RJpRm9AWWI+KcuYM3aAOmE3
         cFiWPfpU13uHnn1rfoaQ0LWnUWwWd+Dshs2O0JYxtflNbBANFUgYegpGPJBB1WdPH9gv
         VgbnoA9nq9GlsgCREMhlThYKIHMHmt2TCNgvFZZqTyNvDX/mWvSDjutYdXWDu44obSHW
         2KzqT/iJGlkPgzBrH5mbJWzbxgxYRELKaPRfmvq3riExf4kqGFod/B35u+YdALcmurhY
         08Jaba2Nb8JpTrV64pB8uqjZb6Nw6x3FCBWKOm50U2WXPQwLu8DdfJoddpqWYTt8leBn
         btKg==
X-Forwarded-Encrypted: i=1; AKwUvBwjhdWViRstasdV2RzLqhxsDivMCaFPyFOX3yeabhCzoj5MdwcV4Tt03V0Jxkm0sg+KVQZPMRP/d4mUbG7r@vger.kernel.org
X-Gm-Message-State: AFq9FYKzWZODDRLRqQL6WQCVrHiZIUPallkMKD+HB2lqUDXJFFXVT0ff
	vSJGlFPW4ZPtpTzPmDeVmY/MN2FoeO7OhTHkrHQdThT006oHDTAiOIP9UG17kkEBLWtYWgJu6y+
	hi5aR5HIS4bGwxwN/vsd3IGkgDibFeB5vZuiVWY0XnZMbmx7qRVxOvJ8xgbB+svfsMRe/
X-Gm-Gg: AYBFou2mDjuZuLOaEz4YR3o0rJaSo+hDU9PxsN5Vtyt+fXeMOrtlmpnh9ZklSrMxa0j
	pmuD94JK9PoKSULfVn9+Wp+ObcCV2AFOQ5VuvWrGC2Pn40WLuENMdiva6O7nURWgf5gSgr/Bp08
	fWlZWf1XKUX90a0CZzWSWqW3w824SIFI/ULE28y6FFpBD/ksLyPpj+apfQv8kxkgXBL8FmHN0JU
	/Etxp6PTi9qTy0FycCPD/ZNkzzLZo59VMT7ffFN8OF1UQe0MH4Q8QdqCTuKfoMKKomM8tJvPyzV
	kFuR8jnW0t9WMVSfuEOR4Cb0ypa/65BKvj9N2Ur+yeq/KCdZJLiiB2Temn+Bw9w8/Ew+lZoO6q+
	wVdGG5P7po3h3/L64DX5ZKw==
X-Received: by 2002:a05:6102:dd1:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc36973b47mr1904235137.3.1792497744836;
        Tue, 20 Oct 2026 05:02:24 -0700 (PDT)
X-Received: by 2002:a05:6102:dd1:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc36973b47mr1904196137.3.1792497744278;
        Tue, 20 Oct 2026 05:02:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c80desm5009277a12.20.2026.10.20.05.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:02:23 -0700 (PDT)
Message-ID: <2c58e865-27bd-48a6-903c-a4fa5c0d92b5@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:02:21 +0200
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
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: lemans: Move pinctrl states into
 lemans-embedded.dtsi
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wGUuihFe8bZ-yYcUcBeWEvyQ1G7rK0RJ
X-Proofpoint-ORIG-GUID: wGUuihFe8bZ-yYcUcBeWEvyQ1G7rK0RJ
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad75851 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1Mba6klkf1WT3IQPbzUA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfXwbfse6ffZQuE
 pz67aGVircH6Asdbihea4Rh7SpCw7cBtaaOsi9Ll73D5VY8CazKThphIk4uuXhGxYh+xy1It0AG
 FQtR6OYOV6V6uVPqtP+yA6HLMunQLUk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX5eaHMm6eS4KN
 dpWLi9exCGatgJfZhps4AVMczQVIS99QPRFY90VTZgAFEbjk/cA6bo4Sd7yk+vE9P9WRQtpRViZ
 +ekDXC64ey76YJvUaOBxnl0C+SOHdyJna4LOzXwqluhzkA2LRGiTZRdjXcg8eUSbZvUpqpfY3xA
 iB4dT2Rtq55NwYK9wCiWic0C/BnYoK0vAqVpRKKDIHr8RkpHuz1U+I8RHIfmTk6mcN/FjOKER/U
 2muK2OpKGMxFWeUMPooKqs4Atynbu+8swziOVaUP5nEd4Ng0eED/7ryeszPeuOfC6jq3A9NDNiu
 cTcwlhi3FbUi+CjrIqbC8q9XUXjs+wlzfm7LFEtt+OXMxI8yNvoFkeviDoowtWRhYaGQnk/UsNb
 4816FCa4swaV6NP4c2oaTT7grxQWDeGc4c5DwWWFRb7okHsGilXGQ0h5K8uugHiPg3qZILYQyN8
 25If50P8LWfxYYggRZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200047

On 10/15/26 4:37 AM, Shawn Guo wrote:
> The lemans.dtsi will become a base devicetree shared by all Lemans
> series SoCs. Move those pinctrl states into lemans-embedded.dtsi as
> they are used by Embedded variant (IQ9/SA8775P) only.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
