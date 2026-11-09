Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214020;
	b=dNQVDqg73wYLBvQJefBEz0a3ahRiglL3pOOWMW/CS9lEddClVa9WysLAcfiDbcZ2mbKv
	 qMWuJjFagn8WJZM0NbahL7HTfpGhpCP7JxQLNIwiCuPdSKQWv2Uf7Vu+54axclNTDGXWo
	 jI7kEtHDGrk4ubmLxSPz16ghi+yHwks60jHBPOg4ezye5n+5C9Jim/10EQn6oAK+ISfeV
	 G39cFyRVw4EnKxMCNetE2VWzcAeG4LBu4/1ZEdZ0nCsGIdz39kJwzoHmb+AcMwk9ufYGz
	 Luoazu64fung6v106AuT2f/xvnE8j9KdjO8x4HkgM2HAI2OyR3W4NYiMmsxkE5TxAKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214020;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v2huvmdc8Y7zILI1SgjJfTFpWXV5Q8d3nrEA5tfFZCQ=;
	b=GGc2x8dxMTTfsYzER+igYm8ssqTZWTQclFDDtcvWSN66qHUlz2sENKfG7SPrhi62sOo4
	 XOJl4X8cPhpcaDL2+Y/wfEvqRoM2ks4P9MwfWNLsmdzsTXoNtHZFIK/C8x/1uOVbpOOjR
	 yY/E0TqHQNG8oKvT+IJz3a3Gs9xL5lhH6eorvvM0sFBjjkaY9qZn22Oke5w/H0C/12z+b
	 I58xk8khEY2t0KQByd8lbsEbAypfWH0astHmfcIXAIJD3IrpQRGXdtKs5Fnp+ZxxPHckK
	 XeGWJ2mFmCXGYazOqIY6K9mqjZ9C1jzMSA8orwML8gRrulKih2ZMTvWWEeBNfTMzzFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LNta3G6+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTTKNEuy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BAE606A321
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 08:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2BAE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LNta3G6+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTTKNEuy
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A9G3056088
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 08:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v2huvmdc8Y7zILI1SgjJfTFp
	WXV5Q8d3nrEA5tfFZCQ=; b=LNta3G6+vNq49vsha5Dm7qofdiX0TFXxieRRNgrf
	awtXi4t5otY4knjAvKlqY1wZ+U26SQGKiS4LXHBzRrcBkZYYBPyM6+9WBouD8qke
	Oe+8QaSHsLCTVfcsng8RsHiZq34HMvPy/wO7sUWZ2M2kFvkLgWmW6Q9wmT6Hb6KZ
	DFGxNFoU/l6n05oAG2+DyIqoQiSFnMNKx84Wc9l677V+7YUrb9e1UguEycIi8M02
	W28a7BUden45rwwCF9se/jZw5EzpEjrzP0KfIQx5HK8WGPmOQr/QrZ1gL4tv6AlS
	QJ4WacI/tiOhc87hycgafowvXhc2vzTFHeNRbbCqkq254w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm2b8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 08:46:58 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2dffa1186so6905137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 00:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214018; x=1794818818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v2huvmdc8Y7zILI1SgjJfTFpWXV5Q8d3nrEA5tfFZCQ=;
        b=MTTKNEuyMBqSdml96P8JXaMu8LhAWxS40XVL6FIJxjmJdXaWTwNEpFXNZyAG5UO4Ir
         dLTHNubgVL0kQ8uZ4hPc4lAF7LNybNxJ3MtRC3fJdNLNp13P03iy3hhgYP4YqUTui+iW
         Z8B4EMDbkurIteXENei9MaRPSYhKl2zA3cHt1VYev5d7NbUDRK9UQbo7jwB8s/+nnH4v
         cfCsa26vke90kGp86/uYuBULrP5UQY5KDpYIN+H4WboKugvw9SUbOerT6mkPjQPAwKcl
         7DLgwvPnqBbCk/ROqB/TLhdmm/c6Ozz67CFOZQsNT46WZabdGS3uZDaaixUXZBm4QeGL
         2e9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214018; x=1794818818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2huvmdc8Y7zILI1SgjJfTFpWXV5Q8d3nrEA5tfFZCQ=;
        b=mW7euZnl6CRgsMl1iu1SPkY3cJLowq7DiO9HeM4/RSB32nDq6XBjbPU9lfotclbLmB
         CxTvAZ5nTg8aY8n9SjGnyWCUis6smmO03Qx9Bxvc7GdXUWHtT9VUcaH1YzKY7A0Wl101
         UEjDb13ku0JtYP8yypBPa6oP2fyr9tXLD/vKWbodttfPpDRtPWmo4HPI8qnd62pfSAHN
         rSATVsqcRE/MUdH56W2Oz5dmW3fFchIl9M5LGjarRpU9Qf0G87xlLZ/3bLnC6oU4nTJp
         iHUIjqXH5rIyC1hqkYFN3dEvE1/XWX9EIfG/jdUK+01IkD088aFhEG+q+sifX/VOzdQl
         K/lQ==
X-Forwarded-Encrypted: i=1; AL+hErEghfys5rVLzmih/dA15fwiQWZL3Q++4FiCdKdnQmdWlaAWV2ClPNWfE2msN1csDCJQJDk4Lpy5NtagHKpX@vger.kernel.org
X-Gm-Message-State: APuU4Z/zsYHAuyWJQRt3GUh+RSudqHiNHZ++hbngL3UxJlbu6CvRQrRP
	FgkfwBwWl3uF1MFI5aV7bJgkSQJC64dkiJHCkxU23UgU3C0xgOtYpMfk+YwvAI0qtiqNgadguw3
	ZH29AgXgfJzVBPvxj4eBg9zFuwINV6phcWKohoXzkSM2/C/06bhPVfPD5uhLlfp4bVl3d+Ngifp
	JA
X-Gm-Gg: AYBFou0ldcIqE/QJj+jtkgqDu7g+PPl44HrJeRy4SN6Qk0XhJUxuXxgjr2Gq+yg30Uh
	tWEmzITV1Gt5m57b/Nqtnqa/PX0n7UOAPonlw5dopujRV0bRtmkgCHDbbxkydn2FwirFA0/x/MT
	aV6ytUf+CYqKXnLpfMtGcIcFCsnEnzQ0R5ZLr+0ve4Ix2vcz2ncKYKfuDpLY1Y2RYfmEsRIEnet
	k9Wi6OaFug6r3CY05Szv9xZHDwTP6jltAj+9Gaqj2uN2AZx9tFVKd2GrHaWPFAvPSJthZgnWtp+
	lwBCQrvPMxH8G+ut1gIOFeXtwe/TdaDVVKY3ykUYCanG1++0FiW3LevlVn+EPqQkBqjyGt1wPIA
	JzVarnd/akioIVYBjH5hz8Lk0UYtQ1NwzfJtGvTKBPRQL+mEVx/cXYy2YAnPQ0hk=
X-Received: by 2002:a05:6102:3911:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d2db20f640mr824632137.34.1794214017903;
        Mon, 09 Nov 2026 00:46:57 -0800 (PST)
X-Received: by 2002:a05:6102:3911:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d2db20f640mr824622137.34.1794214017296;
        Mon, 09 Nov 2026 00:46:57 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597b1f969sm8482016f8f.50.2026.11.09.00.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:46:56 -0800 (PST)
Date: Mon, 9 Nov 2026 10:46:55 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: Add Glymur SiP CRD
Message-ID: <aeeobsllptndjaljsblmdgayckiehg5md4wlowigtvnjjj5cqe@w2bzdxofvtr3>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
 <20261106-topic-sip_cob-v3-8-52cd3826ab49@oss.qualcomm.com>
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
In-Reply-To: <20261106-topic-sip_cob-v3-8-52cd3826ab49@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX8QkLwT+AcZuR
 TKndjcQdqupCC2jlVrQi4Ffu+QdiY419fiUtU7yYD7LDkKCrzeDQoCSevMZ3AMv25TqE2VWZ+s5
 8sdjlRuWm+e2zpMGnvaqrGn92naKhDs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX6tUozmJiLN6T
 yypQ1ptCMHFbgKGhcpN0bc6c298OP1icNw5CP7He/lIl9QH63vYkz6hf2qoIC/F+vkIiRgMIsCA
 7jsCaTv5GM+xZwimEES70mp0tl11mJGgFJDnMe8doAyVYtINjBol/tog4lZWlFdmOlPqa14IfGE
 BKba/zmfAXNajO7m3Gv93ojdYLGlZl7FJLkcJ1W2HInATMZI/UZTRMaCKeozQWmGYZnFex7VF+7
 frX21C97a4J4zk+kFqiSuHISXkM4QXgkvLkeFv4mJXeUY0RzTzP/MIBeTmwuhdThlQHBsTwZSg7
 7+HaAuFiCnxl+r4giCvrcSzS/oCaaPIY3QrRa9USPpOsLmREnjik9BVQhymwoWnkzKFDMNuzW6/
 4LIEnFeuSRSpCBzA5TtKIlg9QhNqWShrpKH0m1dj7EaEyJ3QsTqva40gofrK8xR0hnjGVu3JIGT
 hLNhmuxm66zJr2bv94g==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af18882 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ocqbc99-3qkDWcjWXscA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: DojmXbl9wKoxRTaHbfq_oAPhP_eqBs5h
X-Proofpoint-ORIG-GUID: DojmXbl9wKoxRTaHbfq_oAPhP_eqBs5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On 26-11-06 10:29:09, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Glymur family of chips comes in two flavors: CoB (Chip-on-Board),
> where the SoC is soldered down to the PCB and SiP (System-in-Package),
> where an entire module is soldered down instead.
> 
> The SiP flavor is used for the couple highest-power SKUs and brings
> with itself a different power grid. Add support for that.
> 
> Build it on top of glymur-sip.dtsi for the power grid and reuse
> glymur-crd.dtsi for the rest of the board description.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
