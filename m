Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6253DAACE
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165404; cv=none; b=bTTXqnVAu+pXbMhljxpuOc5LoCbPC0v5SP6s37Gk/ZXJx2cD3o19acLHjEUL+atJqW7Gin/Nn5CeZakeYnRUzC6ClubE3FNntLyQGMecleAOTfWOqCaayyfsuKmiNmTviXW0nDkFUSEkQ6uyelJSLEecd6jErJBT4XMmVAOKS5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165404; c=relaxed/simple;
	bh=X1PkckIN8HFBzuUJHXpj0gyUsnyjgXDoDkesNRi0/Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HFgpDaGiNGPiFuGkNrvLHlO5pCAxR9HgkpDbnrjyFxz3HYeBJYbL/KT3fO1k9mGM4Pp227rud7TS6xxaho1PkbPSOIo1qtELkb7ikSfRRxLRhw4AF6J5YQXoE9NHldsQy6SjBeA4Ta3TCMd6d3WgbOLP6POy5Xcuc7q0mc7+DjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZGcdVqd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cGQjy3I2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZGcdVqd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGQjy3I2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xhjG2419562
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5fbuWbLjGe/VWQ+xdqB2iUkT
	CTTMr+XlvxmuKcx6U5M=; b=gZGcdVqdYCsO0VsFhHqCd0VhhrMbdCkRyY8TWLBh
	++VTxnmO3iIyUqjlP+B5/cerum7HIrjv9zP2HnfE5RQcsL8+LrCYHssf0erBBe/6
	yPg59MOQU59CgT4vl0EEiovk/n/fFF+gdJxID8bQsejPRjdSjINxlmAmJxtHLPWW
	/8P4HVTAJ8B63M9yalng1HACNhguQUK0ztg+wLegIVhldcEeqIBawQHPr0PqWDr8
	vdFbq+S7hV0hoBsxlV2fo+/JOCHOjDSKcBJmBZRR90khIBOrxrlFka4Y7Uojcwk1
	KIENC3EhKg/VrR+iw7xbVtkbED6OI87al+tzt8Vp4zgJTQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqt6nfn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 08:36:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494cce712so543857585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 01:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788165390; x=1788770190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5fbuWbLjGe/VWQ+xdqB2iUkTCTTMr+XlvxmuKcx6U5M=;
        b=cGQjy3I29jVjxsiilLkPcd4Rf4y3yq52fNxmHfnQxHgCfa6RIFJNxa7R5yiPAONTEM
         JnsPlolUdsP2ks1MqgKzKY5qUidc6Cwuh1dITv5NbohMnbtQG2h7sxxusZ1VIrJIga7E
         7G1yM5AyQuCr7FyWXsrfBLE4QECt5o3h1gHpNUlKWE32siiKRn9m4hb++clCUtIsUyxF
         ohKIbBT987LvIzmbMVSq+dYNfXIiR0PDvExzq0Nc5PvYMX+gAqbGRUAG69BN36ghfA5F
         DCO5OIQaBIQb8p7jzwUyk0SNbiegZpQsEgFXWLkf96z6RGczT/PRVOz7IgWFjl6Lf9bN
         WZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788165390; x=1788770190;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fbuWbLjGe/VWQ+xdqB2iUkTCTTMr+XlvxmuKcx6U5M=;
        b=SSIp67VYxcnuZFSl47WLMU5Jy7gnmod8vC7zoiGLWlD8hHMBmqlvy13QVs214Imfh+
         RTkZ4BQHWBpwUA8J8gO1M7EWbCwIxtWk4bx1jmvY9IvQp8/G0MesMp16w0nt0K7IasyR
         XO+NHHNTvSC1ui9M1Jr2qAsctCZcaCyYln/2W3wGy/1Hx37eORQH2bi+sMME++Z7yxU8
         uGqmaPdg8WX83GKj1YrEi6ftZIQ4/4i0DAOEsPPo4+W8pckLyXHRQUFEKrtB24JNBjkb
         Ifha/c+voOH7jE/bcwaG5Z42j8WiWMGkBvdIQDFmIN9h1mccP4BJaRn8c4OK2aESWbZ7
         1HXA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7L3m5SjsxKSNmokAU28Qb8egJCPDRoHY/IY0OG4aNBCMjOx5iI9sdhlLodWWI0EnPmef8e3/AU/gw7K22@vger.kernel.org
X-Gm-Message-State: AFuF++l7mdKcURkg10wFgHvFJuWkK6UCQsxDHWUd7af42qrKuzYdOuAP
	mTZlmEbAjNogA8/+q6oPsdlAHh1ITevHgHr0jiY9qOyEReL8HT331NPlaZqjZvkTRHawS0EBHJc
	wT/ezKrlBwSlIpecAIibAJzyzxutc9rcxuVM6UASGOA6Y/wViAuJX9YLYdRRBZ4rgU+Ff
X-Gm-Gg: AR+sD12QPY53K9Z3txB5TReoUTPRRAAXIoR/eOZAUb13vFKCrlW9N/Jbd6WQt9+cPBc
	lMCY/sTkmtg8gDdIQQCYnAcwCC3SUiyajQoEq9TE4Ya6Y2B7vHVQdCyjl+COzjOAkX0d90UvFon
	10CTYBaFiYr8xPZI2a72QooXS3Mg+2QLeL1zeEcDSe65XRutE/Vp0f6K0hV3vMo8i8DlqtGoGmr
	SrleQFb2cB5pWsjjDMGufxq4/zhZ8HuywLCnaK9fClCPadMIk6E2F0SdoQKQajk5a56YFKbB2wN
	SHga7Qu8IwKvyQm4v1IfYMBBmgPFt/hxVTS/0d7KAZTsc0KQy4iYxvyOUqZxy1ZAf604UJ62I16
	PPLhXAGeclHMRJA==
X-Received: by 2002:a05:620a:8385:b0:939:197f:345e with SMTP id af79cd13be357-939197f3754mr2690955485a.22.1788165389838;
        Mon, 31 Aug 2026 01:36:29 -0700 (PDT)
X-Received: by 2002:a05:620a:8385:b0:939:197f:345e with SMTP id af79cd13be357-939197f3754mr2690951585a.22.1788165389248;
        Mon, 31 Aug 2026 01:36:29 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843adf1377sm6448270f8f.18.2026.08.31.01.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:36:28 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:36:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, KancyJoe <kancy2333@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add
 display nodes
Message-ID: <xtjpv3a5cy6nvr7gw5ln4vuwdsctz5k4f7lcmfetpre5lwia27@omde323ra5mf>
References: <20260831-topic-sm8650-ayaneo-pocket-s2-display-dt-v6-1-1e3b67711eac@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-topic-sm8650-ayaneo-pocket-s2-display-dt-v6-1-1e3b67711eac@linaro.org>
X-Proofpoint-ORIG-GUID: Q-Mru56ccKaSGYhN4gVONf41hbPKrRp6
X-Proofpoint-GUID: Q-Mru56ccKaSGYhN4gVONf41hbPKrRp6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MyBTYWx0ZWRfX0jYT0yC0BB7L
 glqjBikGDvvb3lQMxWyk23A8bb8EtaHe5ubU3vP9nh9MhZFeEuu3htJ4FncMhRDGw5jYAGtzSzp
 rBPO00ADkm9zcMcsOQ/gOLDqV2fUroPfZMVbHYUR2ZST8DGP3dU89hEuwKHPx2oFxDltSXymm+y
 OnwyQ/tVaTqdlwBEQB24+kDMkBAwU/sZ9xZ5/JZG7zS6UtX/JKi09XYOrb1LsKyqRJ7xtBdM/Xz
 8K/NzT4+UAE2+MuiI1o0a3VZnTONFs0Qvi9zntVvZoIiNg97kQM0448pu3YId79vCUcGQm+XSZ7
 +JgQpAQ3Bt3kin2WBlP/7une6xxcpvZ2F74NWmeUvbz/p0vQuhipxAMnrdWreSZXkv9gdahcyxn
 JthRA4TkBBt/vfAAQlXlC4QbUALXPP0eG3frLH5V2dqxDoTpaI1PpAFR2WopetZdDYWBYVeQf96
 TmtbmRRDSBzAiD9obTw==
X-Authority-Analysis: v=2.4 cv=S8/pBosP c=1 sm=1 tr=0 ts=6a953d0e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Twdo5_02SbyOhDGnJGIA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MyBTYWx0ZWRfX0/vVbrigRTf5
 c7+00igoQAcCY2jSij6V7ufHEYU0d9qHlMrZBMoyOw7nRafT5oiQudyVFUagRkjNdJe8FY8Vjcq
 Yre5ACwjj2r5cHo4mJP5beQu77WideI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310073

On 26-08-31 10:20:52, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add nodes for the dual DSI panel, the SGM3804 regulator, the
> SY7758 backlight controller, the touch controller, and enable
> the GPU to enable full display support.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
