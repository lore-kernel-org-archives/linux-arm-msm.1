Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498441;
	b=cUEnOvgFSfzZI7nkjhpVA8fkvEorjxfHeBXTLpIee8ZZJiW95wEMj4EVdgb9wSKoRjaR
	 2m54n6klXf72HNnWGG2Jpy/vuXbAA++ptCmiZFeVnrM3IKRFpBwHCzV/OOKC+8wVxxouF
	 n87v9udS1hl5o5PrnXy2SETON31YUuCRoSCgkPitBzddhvBqXy5kD+934l/d7TcsFJqMp
	 sf8flpICBnTQzcpgtkjKVeXKcB62niSQpUDUiajMdTfukiPCcMI48f+T7EN/51NqxvZo6
	 kNumnkkHbg2MIDbJqpBtY0k8ksHT9S5nRmlSu12++6+xbf/KXRw0l06NKYu8JnrY6Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498441;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W2q+lbg8FZt9W6yyGG9psoCNajA3HujtwITzTDuoWFg=;
	b=OyYzXtCf/xhnwj+51oSTpRp1OLbpuqMH0PEqCeZpWo5vyyF4MMyzgkUAVa7DgxwUvmU9
	 Hmnigdv6cJ2bFpGQIqIEupTupl2IEu3yRgHSzDHLPlinJwVsC2nEy8K+KG7oY7ZDYYpfy
	 Xl6BfCyIJ5o0sLjtuy6MSqGCCsnSTKnVEIKNULt+iuzWR+Tp4+E8n6LXWdHSjX4eUN6u/
	 mYR1tEFE4eyCzPmfz9bUk2bAwCWW5zvkhgVsvZZ2T8vagvslNjeMRDLv+FRCsNyPIVNcY
	 St6zY4mrHPGy1PvOmvS8TQOLKdFukM04UeNROQWj8f2RraLXE6upDN7/+xL2RddxeDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="X/QTEL6y";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cl4lF+r6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BCD606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89BCD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X/QTEL6y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cl4lF+r6
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBWSHB1571649
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W2q+lbg8FZt9W6yyGG9psoCN
	ajA3HujtwITzTDuoWFg=; b=X/QTEL6y+4vBfavAGOSbpoRzqkdjB4AMtmucd7TQ
	EHxjN5AZomNfcdGUFEL2814Gnu98WBWmjWOJrUecRUOZttxweWpASb/dH4PlCN65
	wiL2nlyq0jeNzlVobS24UwiXJbxDXgeI3TXrvo5f/DmzNvSRQEv3JpwNjn23JFb7
	G7KrjiyyGjZ1gMq6vHDqPEiHXk9R7SzxC2F1cEqfVJAjAztNgWfhsKX88RmSEzoM
	7T9xy04/sMVWL2GTakYxrpYxa3ynLMRtyQcI/PDiVXGZ2xo9tau3QcObv2DkN5FX
	63ii62l6n71CtRIZ8bDSLchBu3WhlgAUNrd6l4uzUhpUuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h284b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:13:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so581685285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498439; x=1793103239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W2q+lbg8FZt9W6yyGG9psoCNajA3HujtwITzTDuoWFg=;
        b=Cl4lF+r6Zv+3JcyDHBOtFttfJ21n3e4KnH6ZLm7bWFfC0gqCTDb/Fx5HQazHtxncfG
         /w0dcumvIaQ2utxrHXOrG/C3yHCQ+Q4kOvC+QxPbuMJWKBJKEn6nfWchpF1rzbsDQz8t
         0Flp7lJ5AyVhHublKLuVGnOTMw+QHPytXir6T9UPznu6OXwvxWVWvwXS1eBnbIaDFe/w
         SvP6ZyQKbMVxz1igVbOORgBsUgOz11644dSuQOGfOrI7jWi11FohqSYSoeDxHTdBMl+M
         EaIPjtSUd9iWzJw2giRFMbHZfuGpH7/rlOyIy6W3ZmnHgyOMY1BB+ZihQGdZcdoet0Pj
         aHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498439; x=1793103239;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2q+lbg8FZt9W6yyGG9psoCNajA3HujtwITzTDuoWFg=;
        b=Z4BOnZq4TJrEE7copk3J4Fqd4sQr7T89NFgJ3qQQ7coytZK4QFM3b0RipIwvrAk1zD
         kR3RNkQ6vfJKtKumoBQIdflI6h1QeMfbcJuPKKVWAKqQ6qG9JsbJ0SoiRKooz9m5Ae8x
         xuDTSdpIRgiPUDHAbuSTaxlNVCK7KpHo3KNdkmMWYcNIjfVnQHklWPxBidg3Uug0rbVX
         ATfOcLCR1HbG1AF4EBeZhGf33QDR0Yj93G66WExp0ntiskPaxJLpKznRNmD4jtlsQwK5
         psB7moFOvp8Ua/mMk1DcqY3U5vAwEfhjVnnLxJH7NoijOq0IEIYfMRAnQ6YdzvBdj3Dc
         z9oQ==
X-Forwarded-Encrypted: i=1; AKwUvBznK6Dx7J2gFAPyN5LS042dt3J/BaQhLYtryETk9YklW3znopTeAc4AuyPVndd5Y9YshAPrXwlWlzpeX0T4@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5D54CNzWwI8Mt3Y1Jf+8skKVH0nLHeEBI3sgKhraCxk8YVjV8
	ozBoJElaCrs22qMft5FEgn6T2thvdBoUsvZjkqiUb6G6a7fulh89A4p1SHy5a0BpLJN+V0tReal
	KA1JNR1eqHPjsdfpim0PINffI5ZgHv6EhXuaYfI6l6qYS3GY9SgGG3W0zMR9neZKN5ho7
X-Gm-Gg: AYBFou0LfbJKmzVzqoIsO8nIeZFPKgq7G1nhkejJJlItSlcLXXKsqgY8+CbV/gaY+PM
	MCqC27lGvMQMIGbrz3Awh5PQaxcIBqQBtgX0DBSViHgbJYHlDLbTn58J+K5Sv3uRifT/GP+F6lO
	RPeqF/V8bH0Oq67aHRXWw6t4fyLLuUB4gpOvotMeDdKb+/pwK3NSizdr0ZMrba0+3Ww4lLlZVKk
	IuMRsVkY0Sz6aDjn16A+fpLj6q4UzYBc7fPrMgROsr7wCr0opv8XZWK51y/UjSLiYbmF1WhxN+f
	fZES27yNv8wDsNDGUbaAh7PogxTLidU124j9rt3x9Ru5biWUrmTv73hQdoYcv9cpgOTLqHWnvgq
	IQpK9lzzG/vcBhbry
X-Received: by 2002:a05:620a:444d:b0:93e:c12c:4412 with SMTP id af79cd13be357-93f29dc9d10mr1630169985a.78.1792498438294;
        Tue, 20 Oct 2026 05:13:58 -0700 (PDT)
X-Received: by 2002:a05:620a:444d:b0:93e:c12c:4412 with SMTP id af79cd13be357-93f29dc9d10mr1630164785a.78.1792498437609;
        Tue, 20 Oct 2026 05:13:57 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82456asm6351362f8f.42.2026.10.20.05.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:13:56 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:13:55 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: lemans: Move pinctrl states
 into lemans-embedded.dtsi
Message-ID: <mwi6zi6imuay5dkfrddevix2qorvkqxvvptdywv5irlez2yd44@wmorlob4ygjd>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-3-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261015023711.721837-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: wTQasA1dmQXd_2VZpT8pm4bY1Qdh0Qnn
X-Proofpoint-ORIG-GUID: wTQasA1dmQXd_2VZpT8pm4bY1Qdh0Qnn
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad75b07 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1Mba6klkf1WT3IQPbzUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX0Y2AthzjaJWG
 uMxv5BsJe+CNr3RMol+QwCml2TpeEECGZxtLWxViMFUp99fayJLYusWjlsoUayecLBrR0VTUYul
 lt8QuBsljvp6JPFlCwL2XFJ3r/4N6Ig=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfXwueP56y31FHs
 AYiIQPWcMPDD1sd7RFFy1y/yQH7hrIF9ctQOavFga7OWHlW1vgnhXABq7M17YQIbGQmIylAUsHj
 gG+TxxG4f2DSBFZIb6J+gAxDAQ56LDoaFY0P0kM/n/OfqnKU4U8+0lbs7gV81aNqxtP2dncz000
 AWCnB6bpQvBz57LbhWgCPBIYER3aAXR1XzxFZo/yXg1jaoENfDScBvsq+ruZ31/ncAAzlO/LIXT
 z+hPPSb0glbGRYedkmqXV8GFwA7n8I0x10S1W6iJHXHX8RaA9ildTuoa8aH9cJ63wCuISay65ep
 FNViGYlUmxsHZvAsclkMEI2pgUXByekR8dtj9DWV8irjejZqP9Ge9TPjIO+e+Xd2UVb/BcrepMU
 49fk/hgylUQNVP6hgIxYHIUiRZ8y0aPG8RY3/IuWtLHH7Lein62t0McKDZquo/Klw6su8+pCB2U
 DsXUsTUxDjesgNFL1eQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200048

On 26-10-15 10:37:06, Shawn Guo wrote:
> The lemans.dtsi will become a base devicetree shared by all Lemans
> series SoCs. Move those pinctrl states into lemans-embedded.dtsi as
> they are used by Embedded variant (IQ9/SA8775P) only.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
