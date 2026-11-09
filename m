Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228395;
	b=H833qb+3Xs9QuXVqYnvxjDL2ND7WcA+XA/FmebS3k+gJNEJqmeTvQCv30eJgFXpM3mIz
	 lHBNg0nU9Vspbi8qbLf/3hIO7TLr8xVuMcDv9+zhG2W7CPzKQ9/5ekowUDqFXQHKCc3Lf
	 z6sbu3Jt90j/MHDEqsjT5bvR2K4jmS94ns3MuObrMZa7gEzpL6i1kFayNvodoPp/B8W87
	 C52KVVLnLXuCRE2NCMMcts2+iszqrWS3IW7KsjMY4toBkVzCHwawcAJ0EH+0c124B1xyr
	 bOlwdtqL+iPU/nZSj6KsAlnEy+GR4Pkm9WWH+ls33+AiB5bDvr3977u2OgnFP9obJag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y2DrjEQhS2plkSy9Rd6l6RNyJAVrhDy3SRTeWurwWbA=;
	b=KFiV8SuPKQX94cxA+CmsNji5gxcxlTgVap3+7a/S2TkFphGfiIA2HrHN3HqVoQC3nSWs
	 Uli/vYZPgqH4Klq3NxDgv1rnSs6MINo0JHzva5c8pKcgOEh2b5r10ZnKtpydNpusIi89V
	 O6GDqdFgxRryX6qXme+AcaIGrUhTK++DXWmT49nP4PLjbb+RXSMLUVe+HBWjtsgy65J1M
	 dVwhac6z0rT5vdKZoDYB6u58sQqE2v3sSE/PyPv77CPh4FjapPeSYm21hxuY9z6eX7LQk
	 CW+j+6WlYA7OK17UIVPHOK8FEi4ACIXVFa7fzv4kkbvn1Z/KS8DnnYAeqwHsu+ZFTOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RomvDkRx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyCacWf6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA251606A33C
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 12:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA251606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RomvDkRx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyCacWf6
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9Aur4B034524
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 12:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y2DrjEQhS2plkSy9Rd6l6RNy
	JAVrhDy3SRTeWurwWbA=; b=RomvDkRx5seqh3RBtVKxeSElUiTNUWGZRFrSS3EK
	YoOV3nhMHX6VByKAcP3tIYHQanrVkWHqOd6VvTuZIC9ypoApv5IuoZaYDOrOiM5a
	MVcF4O8d26Jx5um7DR5RzHKpdkbZzm8vSB/ocSUajzALuUxmKTtTTxbivPKwFBb/
	R/W5R1YAOMNNbENJuWBmNCums9L4H3IwLTJr7f2VMfWaUv4rHMCIQhTWcbLKgYhS
	FOQ6GJDPv7ZWj7Kv+Cb9JA5hbo6wdwS5aehNeQE2VBg7SVqDDFtoi+Lm23/ojvgG
	Kz+rzV6gMGdDr35CaFXafAPShlWb/I+0oGT9uLoUmVsh5Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rbx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 12:46:34 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2c7a903a1so621244137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 04:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228393; x=1794833193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2DrjEQhS2plkSy9Rd6l6RNyJAVrhDy3SRTeWurwWbA=;
        b=jyCacWf6sPhjmyJzdPBLDaxJZ/q2Ae4rKzLj4KSmyzJKNP9H5ASsmF3VcFONHFb5bx
         EkSBc+4tJ+8zjqCIe8aNeNWRTtVU3yuC0CFOb0kVnmRwbEVtZ7iOTY3Jec2VzLlcAm+H
         UxmkQPqoeMWB5/WhDTWWSECqoe/MzXZp1LdTab+ceaVcnTsMlWSstIpg/ZjK/WPbiLn0
         uag51yU5WKaF7K4pADG7fFOo7i7BeNbiN1J6f4MvDx9WdgKDdQUf/gpNGk9BBsPKLLhW
         VFqEjmLFJjasBLv3ADz4veA3lxueroTrHeRHQwoA4vJhvF6o/i+fGr8dAKIhLN3wYR5p
         midA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228393; x=1794833193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2DrjEQhS2plkSy9Rd6l6RNyJAVrhDy3SRTeWurwWbA=;
        b=IZ9zCsMiFTD/BsqZP5Il5NkG0CeauoOKh5gpl7TIehWx9aIfYCAOSQzH20rr9JjCdT
         azc0j1jhDgbiIUHJsmKdchN9KPASJU6RelR97gLgOLW+25fF2rfMNRbN8fOtVSQ12DLv
         1hnaylLWikG0oxNoYk4DObelWVbyMc5a3oL2p/7aeQdi67eCw47RKjq/rcYmKMOZ1OKp
         c/w0KFBXYMevdg3HpbkLjKf06oDN97Z+MQxGaNrR00MYZlrQMLReTfS96KlkK6z5RfAO
         x3yG8c8IvYv3uBK2EKYycsUzGidrQt8z1xvRqIgkbXVuWmvI2tqNFFPztA61mOskkqo3
         Tj2Q==
X-Forwarded-Encrypted: i=1; AL+hErGp7kGwPrx93Ej+juLtBjBWqVa06/6XBykJLkP0xutNYJRHfTXqqLWZwPRFoUvm3OHaeNWpXJrkOg4FkK8G@vger.kernel.org
X-Gm-Message-State: APuU4Z8pet27rBQJjb+5XkE1cK/dOH5+v0kDdTHKw57Q0Bsz9NipLdBi
	rTf+l9U0Df31jBhjeYs1rwWE2x6ss6D1No8Mnmyd3UEht1JGLOZ7wXP8fjf0xAE7KG7iqu4lQUK
	I3rJaNFZzHJfdoM2XnVaclBrYaFJWbCho2APE+k5V21ii+SLzK9ulow7Qti9PmdPLbZhe
X-Gm-Gg: AYBFou0B+rT9ILKCrLbakHpuPwRfUaXJvLFWY45HG1Z4KyhT16kX0Nxvt1B/8v7lSk2
	7uwV+iN5S8z90VD/zCV5xpvvDXG++bqlqYHjXJBPqd8WjGyzHYyJQlJG2KnGR8UmLBYg5WEFlNE
	d1c63021lmGXbt9wa3pM+r+4tvvUGSv87NGmcUCR83XOmt6e16t85qzkU9R3nu9QZon0Ln36EcY
	yQbERK4ouf/kSE0YcsWWvZ21ArUlh/UYX3iLs4jxdVNl6tuO1qIZ2WWa3hVyK4AfbNnaoIMgAT3
	owwt2pWRaWptHle3cpnsj1Ef8cduHDa0RX71hcOzZVnpA0DZg3JQ01ade2J6Qlgygc1XMu+2rL+
	fmLwfe77/ZMsncidq9EdoDPvRClr7XNu2hiSb240ycGxTPYfVZp10jGvCv3EgI6Y=
X-Received: by 2002:a05:6102:83d9:b0:7d2:8dd0:2ed with SMTP id ada2fe7eead31-7d2daf1bf52mr1009715137.10.1794228392903;
        Mon, 09 Nov 2026 04:46:32 -0800 (PST)
X-Received: by 2002:a05:6102:83d9:b0:7d2:8dd0:2ed with SMTP id ada2fe7eead31-7d2daf1bf52mr1009708137.10.1794228392284;
        Mon, 09 Nov 2026 04:46:32 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597e0097dsm9855429f8f.57.2026.11.09.04.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:46:31 -0800 (PST)
Date: Mon, 9 Nov 2026 14:46:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: sdm845-samsung-starqltechn:
 Update panel compatible
Message-ID: <lr67aes7lfunacwf64sorfvuqgqshsmsg72kwebwq7ol5rt7q3@b6vmojxbaobs>
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
 <20261108-crosshatch-panel-v3-8-87dd4ec4f7cc@ixit.cz>
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
In-Reply-To: <20261108-crosshatch-panel-v3-8-87dd4ec4f7cc@ixit.cz>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX3PoPdOzoBA8G
 TOfDX7k5Z1wHQ8tE9o4lZ9wr/j7qxbWMIWVhwkcH41RKcJ1A+wig0Kdmr4ttBJbvwYIDMeojqr2
 s1B8OXnBUgzfGjp9yCQQGemwbuDLGNY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX8aKEddxkclwH
 zZ1Dt9z5BbLSACA2WSDKHw/oV8Lj7ji3P2BV8KNIP9DK5R4a/Bg+HVfHeiMtcUKYzxpQ+K+3Baq
 DAt6+jEWFkUqvgMyrORC5fKF//8rPwAkWSIrQH2jqKbBZ1tBfsw1JjWD9/8HrrJA5DaOyPQOs2R
 3S+BYVxjR5Crcmey5PIQ/SjN6lJwh9XCxxIY1/ZTFU9GynscORayo7p7pBOom6dFZATTr8jFb2H
 rJoOIkeRR5/bEMaZT8LRisMp46WJb9rR8eIB1p7l9tkpDYpJ2iyctWVADOgaYbteCgxvNu1/7e6
 XSUSHPVSFawSB6jy8Y6R0wwK0fPJu+acP97hcxAMxyR9kmcn5/Oi1lTAB0/7e1ZHZsuGxV4gk7S
 L9kVfT2gnulUnYMjLxowlZj+pwphEXoBQxvzkOB8REzW9x2Ie4WnMeInrJTnzdFzIEYjOhF6tu0
 FxXmluhlfpwmtBEtaww==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1c0aa cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=aFgLPouUvLL-lAFSJXcA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: EyQIbebmtvj8Vo841JR3p4d0VvvDEdRp
X-Proofpoint-GUID: EyQIbebmtvj8Vo841JR3p4d0VvvDEdRp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090050

On 26-11-08 12:32:29, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Original compatible describing only the DDIC used, but omit describing
> the panel used (Samsung AMB577PX01), which we have no way to detect.
> 
> New compatible allows without breaking ABI fixing the inverted reset.
> 
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
