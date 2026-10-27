Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099469;
	b=XRmtvTXpRJrwhrvoqy7SzHp0R8uron/eV2qqEWKfnoLrwmzuuaH4c4QNIntm2xqdAVQH
	 KYu5BuJ3edf30entlFa6b6dV7mTzN3KHsNJZg4oditel0vg0qlB3Th+zfECp9YcIkfHoG
	 YR0n04NImvjxoGkyhskuF21X5WOnigGvrrbomsEhFyXUtl9U4FVjeisfRBwimSFHfydGM
	 w7LE5oRpqK38j8yc6rCecEHpFgAjjBSwiD3BswnDeQDg5yayhh+98mtVuz6UQtzNjPx6w
	 EN2QTpA1qX2OSeEB3sgR3z9jY/OWZQiflGttecUzADXdulF61V8O+ARG8V/ebgCYPlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099469;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UAHroLX2yjQ1id1FQtf/by5pAgKIpOkaQ4VOiN0W9B4=;
	b=LHlr5Pw+Fqx9FWDw4s14wAvluy4KzxlDZI1IQQsf6HosD1SVKEg0rKsAEiqFXftC+g1A
	 2HkAe78ZGcwBBSnMriS1MjOmknqd8XDcicct4yoi1/WzH+1EbKcUCLGWMCKZrJIra3kWX
	 gtsRRxa5vz24vREtuhkizy+JlL0AzH6sD7jF4HYVHoQS0qKhj0eQTnbfbvUWEuRu81jAP
	 xkngQzGjJSAFuhPH10tf29gMWbBd2u/UWCkYmLppidYQm3IqnvvQPdj7WN4RCFvLrKF9+
	 8S+3MrlgM2Pimzy8Z1GEZRWLaDF13owpqQTh9cVkk7MHfvX7VFEQx9fWHMcQiWTPyGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNYmRbsw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c4C0WncY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309A1606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 309A1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oNYmRbsw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c4C0WncY
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe1Em1921843
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:11:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UAHroLX2yjQ1id1FQtf/by5p
	AgKIpOkaQ4VOiN0W9B4=; b=oNYmRbswuQ/oPnTmO/h0wYB0cK8Lyh0MfwqC0R5Y
	i76tzGsZDHYhJAmY1IyzHl/a0pPY601ciDq6v79CdKT7aaT4LAG2p3BU+yn1mTQK
	NkLA3DPx7b3FL+fmG2dVlyost7/s3pjAVGkfTUJpTB96tzDEsmKikqx5dlSV3nBV
	ZAAZTbYMe87IktsYqzZzwPLISji8HExde6UnHgVg5nAEycSDXqiR0Hw+U71s5J1g
	t7r1yf1t9xIhspG5CBm7019WQb4vkdf2UXDza7uxFxvtfyqd/EWqTuQW67LnDQ0X
	cpkIUUfrnqK/FG7u/MdNe/0GvMH4pFXVX6gatG5p8Ywg/g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68jd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:11:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so788477185a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099467; x=1793704267; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UAHroLX2yjQ1id1FQtf/by5pAgKIpOkaQ4VOiN0W9B4=;
        b=c4C0WncYf8AZ16ktifTbzuJShN2yWX4ZAjChpdKDBs7lnVUuZKO0g3lCIhptxUYdhg
         PDOTeSPZXMbzw8B6Y8YvcUioeJwKC7ZEB6mTrMl1BSTWXA4TdxbQszOySAm3O65VCSpY
         Cy87XJP3AobiENRAVLwA8cQFs64/sxUvxwPvIyw0vBet29iLP4MLYgNEqhqpjVrJUFGW
         LyIXrDjjTzDJWeP2hbT8rVyH4gX1JP3BzdtNd63pXmAGevyVeOMOMWhBVnGf+bLPCFe7
         sjfgixGNOPp4X+nlxQKFegndNUTej/2vW6frBTvifxjPEflU1HB4wd7XgVPkPo22KNF6
         inbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099467; x=1793704267;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UAHroLX2yjQ1id1FQtf/by5pAgKIpOkaQ4VOiN0W9B4=;
        b=UUibwGXpspd/uAEW3ELK9T0zpH5fxaIR1lCUzkqYAsj0VCa/mT0pqqON88uT3RkbqK
         zvzKYLJSXkO9hB4rsgIceqAnHbGSq3bZbWXCZ5D67liV9R8nd/re8cfFnEQzaTb7sELf
         34goovw9smlKpZ3mP/xxYC4rzT6aOOqkhLHcbda0hRwwraXPRewUU4uq3xcGIGeOCiMJ
         6STDpp86ZALvcgLDpUxsOFonPcHEAnxgSjX0TX8DOHzYBjZB3SnNuQuu514WQPUCJWtM
         FqJFewoLKUxzjxcg3isf1jW0BJbt/mQFgzegYDw6DZWq6YwkQgJoud9pvy30YuCPZodN
         nmUg==
X-Forwarded-Encrypted: i=1; AKwUvBy6vykWE7TDLPVUGE73/ECgOeJ2+C5J/mPjcUlt3kCqg+ZrT5j2uogpeLYCZf2kZMDInZE7znqQQ9sN5135@vger.kernel.org
X-Gm-Message-State: AFq9FYKMGuz0wxHeEU32MLeqjEbqCjWqzJNysafqsblCLn+txAjX33WO
	P4nIKaZbALgw8BgOTHOw7iPosOxYzpf65v0ZXP2jf0++RD15XWZpFKC/1ul8EebxPmqet7jf9Fj
	vZdmyjd71dtjfeGkNtWoZN4FM2U2TW1ln3j3Tg0au7me1xexEewyz+eXVMVtdNFpiLKMq
X-Gm-Gg: AYBFou280dh16Ddc1zwKKkanJSLP/LPS2qVPD8YPZbmrv4HkRqjgsjVOFoy6pOkHDxe
	NIC5jVfinG6lAVNt/nvdDcQgzVKmZubFDOiM5kD/YhBqaDC9qHKeMfIh2DFP8810rk691VnO73N
	V68zA+vbdnnSZ4K/9BrxwLJhTfXTx0brtlKeMpwMFrjRjJ2beQ42ZPAL7fwgS8+p6fipfaLfPeH
	No/PWiDINiAsK5P4hIlshBp2NVaFLdBUqMBTanNpwLY3RgMAWWQ/jUJSe3wmQ7K0CB9Pa99DMbc
	glLPGg6RGflfGx3LCb7MEFO1gdwbleKU1t1Py5ZaadNhKxM+c3/Ie+Wkaw3sOF918d8x4MuTPIp
	yUHpOVyyimv3G91fW
X-Received: by 2002:a05:620a:4542:b0:93b:d7a3:45cc with SMTP id af79cd13be357-940ef96b7eemr1294808585a.53.1793099467348;
        Tue, 27 Oct 2026 04:11:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93b:d7a3:45cc with SMTP id af79cd13be357-940ef96b7eemr1294802485a.53.1793099466727;
        Tue, 27 Oct 2026 04:11:06 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb851sm19109379f8f.26.2026.10.27.04.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:11:05 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:11:03 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: sm8450: Add CSI2 PHY device
 tree nodes
Message-ID: <mwaqzdht3xlouezqwgr4wqmknxn53vjqt52tozdbrxbdjhasbu@yegyvn3f4nyk>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-6-vz@kernel.org>
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
In-Reply-To: <20261026224957.1115370-6-vz@kernel.org>
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae086cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UwdZcGpLVFY4tAqoLasA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: k3v3Nva6Lh2_2dygiNvinh7m2oNgDYsh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX3GrTldw4ffXt
 1zqikHuXYqoQLnCce22p7FtmNF0mahcP34Zf8LzqPqAPZh6W1OcCvcRMldUchUQpGsOl0sX97ss
 fgMljfPm7vZ6FJGU4DZmQBn1Vr+5+PU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX6/MBoZJOzlYh
 +slEwdScRVn5cw6xpysPvi6K9/f2MOp1tiznkCvUHqf7iwkcFDs1NShywh5nyEBsRJQkFKaqN7R
 R6WlDowgrJnvWTVotnAFghXp6RuC/wHf5v7op2N8r0ieBxoPs0R9QgQ5K8EhGpnVUHo0KEfvhTp
 xvtLfzRDzviZOSM7JEmoexPWuM4tJ/oGhpSUmtr+gYQh/jEJyK/U0pd8Cy/LPuQ/wqhuD3bvJmd
 N6LVi6qZZzY0W9LfLv9pdfyEAwxrOg4oIdIkysfjzVe4KAzZ/HBt3FkuBltmo4W8sid/qW1PYPK
 mxExvrLIBzMRm1imQVzULCc/MkutMBnKCUdVdg4PyJ5WzkT3DPmgIYiHTJxA0BxTU9DE6CFysZV
 1U1kaZm/UagkjK4Q/d1f3qPLxXtZuESUVXE2qpbDVvFN5uTu8cewuBbUscRahNkideTkVCfVacM
 3v2pzf0q7McQGPW9Muw==
X-Proofpoint-ORIG-GUID: k3v3Nva6Lh2_2dygiNvinh7m2oNgDYsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270044

On 26-10-27 00:49:55, Vladimir Zapolskiy wrote:
> Add device tree nodes of six CAMSS CSIPHYs found on Qualcomm SM8450 SoC,
> and a shared CSIPHY OPP table for them.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
