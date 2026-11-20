Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170013;
	b=OjnZQN+YtBhD6mvQH7A17GqUE4+I9Ij9VvApciEEKtnPp8NgG09sNP8BK0Gp4cC5bK4z
	 qx6+dd7oVBpSb99EeAktmFHGxSIe5ey7fkpt4hZYaQMdQPb/7KKxatRfluWHhnYJjy5rM
	 pf84HDMNhU5BVgB2g+alXKgSMvkt5iAPbZ9bE8ZXA1vHSlAM91aByoKSgdwmljKuFIbQ/
	 QTuNYXQy6StcIBHQQpxsFUeS+E8SnTjPwY09WbPtRRpfGQ9lvO0rY/cgjMzU8HD+/S7KG
	 0M1DB5lWLiunupdDFE6CfqmC+Qbz2BgxnX6TtVN/CZSKAvl4v8urY5cJEj7MncsIP7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170013;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v1AfoyViWtDD/4lI7K4bWRLDy0Fh89oWvLdt+QyBGH4=;
	b=MmA8kCQXfFzKK63/BXsbPEKybxb5xBhJGtrFYJ8iJt1njukkdjOEV7Yx1QLbbWWI5MZR
	 pvvnHyZsSGI7NParoL9nqXd7wcyaHzULIgjgwOpB7Aazu8Rk3Zso1VPMU9uA0AUw4fPxH
	 riQUxAWKITwfHf6ze5sNHFCb77PBUswJH6SUy6X3H9+5bLWn6WJGSkrxWghFIJgI+Uyqb
	 0WXBBRr8jHoDDHvxsd3KAXGm61RfsNRzVxRsEjD830dRi+r4ZrOgTKDL2KzCfNI0ujbWB
	 zX7grUnI1Z+uBotsmRUNxWezcsOYlUsnYKCTJGvG4YI3ENvfpqPjpOJQLLhhhxefHtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqfW3Qxo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T0FuPONZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8297A606A326
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8297A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqfW3Qxo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T0FuPONZ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK9Pbbe883100
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v1AfoyViWtDD/4lI7K4bWRLD
	y0Fh89oWvLdt+QyBGH4=; b=ZqfW3Qxow/MIYLFjJEslozb1q8p2G63CkuN/GhXH
	Gv+PQKzhpZrRadF7sS8OwDEBkEO2xWl3qJ5A3KLoeq3DOPgxRED/xcDFImuk2ZNp
	xE0z8AAsGpoVjqeL8csE3lxl+jAtvSRWeRBwuXraM8VBaSXVFtHIEom47Dmaq7cN
	jHQLSVS9J5GOTPTxn6khc0SBLYmtfha/bQaWP4l6CuJG9s5QB8tVkyM8oG37BfEw
	FouUvGbdbI65ET1wLaRCHt+PBxoy/0iktzL3Ix1AltI4+ljhH9RhDSdpCXmxg+tB
	pnZrDEP9zGEksOVzrhyn44EOGUsTZWjXEYcpM7xBubePVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyk5ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 10:20:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so198886385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 02:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170011; x=1795774811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1AfoyViWtDD/4lI7K4bWRLDy0Fh89oWvLdt+QyBGH4=;
        b=T0FuPONZToqEj5O20Qq/MoJzLpVUdBeuR5+b7XRLxTuzQ4lBFi2KR1gRHOSiN4M+EC
         iZ94N99wdmrDEPgI0b7xXW38cv6Xgk/gmmhLxK+GNlsHK3VgTYSm9VX4+VtetrZqr9VH
         NlZu3ntk9IIIVbbCgehTav3nJnqbafYtUMU+3djXAJfuKFz9OoWqo/n5P6dd7xxFv69O
         CmQKtgwh+oeu7TTttaUdtRMA5z5wz5+1wu31jGrOzmz0EvhCL2nJU0HM5xmtRehK53eu
         AZyPXoLwXPxaT35j7zC8eeNjc3ZXAFahMQyFiYtJVB9hLmNNZRO2OKyHPilQDqHlk5kr
         eFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170011; x=1795774811;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1AfoyViWtDD/4lI7K4bWRLDy0Fh89oWvLdt+QyBGH4=;
        b=t58MFNygowj8OKHRrpwJxzzZEd3svdT0ebJozImIzOs4XjUnaNeAgHfw4oZ8u75Amf
         SXevYlYVMt5sTj7h+ujPj/hhu+khi9UnZ07Nc37qhzs13pL17kMOcN1qQf5sanPu6oSj
         vjr/OiP/bukGghZPxhhLpGqcH1TcM+kqEsbDYn1pnoIuDhyIotSBmFSWKAwd+7B4edAL
         YhKRrHFjlw3+wLtmyuK79PhwN+5BBPetYih0E5DqEN2KRH94ZP0PHXEeajWDkpFXkh6N
         iKpqPCtxsdwpWgZTU5jTscKX7crt/39IOnjVYG1a58pAfvBCnkA+A3x3xN7nOfwecMo1
         abaw==
X-Forwarded-Encrypted: i=1; AL+hErHEdrHI70MS+/rXrc3bm6nRFoQS68ajFXQunrQOrbyXY3iK00Yzpkc+D01CbHx5hlk9kIFeRsU6mZHec2po@vger.kernel.org
X-Gm-Message-State: APuU4Z8pS6GQqrEXiuj3apcRs9B6tzMv8v7YGLnxcO6ZU2vqKCg7XiK1
	qK2OYATr6CwGO1oPctuepah8mW3OHBll2hrtcXL9c1avFW8/VCFozHvMdlECYikZnxAWFwniHEp
	PLu/qBiBcBpvh0XUniqGzOIUIv729YmOe9WLKTkFNRQVbh2xvOa1njt03t6dAIS4BSh3O
X-Gm-Gg: AYBFou1BR4PjgX/wrLFKUbZCgAUhxNv9k3uWyh0ZQ5snmAaL60dUPyloHqzmO/VgyVl
	LX1kuKLyIXcvWPWLZaxAZTjxMSIRWW6XxpXVzYsL29DZpBjhkwTZPJ3GAc3s+Fba2ZEASYSatYb
	hYGkNbM5E59Zpc3kOS/KzgrvFpgfhhDCaze7mlJyCOTtC2ZxKtCgTiCeYAs0PIGwfn3M5KOeK+M
	S5GSkGjDg/XV56644BE3v5ImyL10eCr44k+N+DSYT399lmvHNG9Jrg+Mr1lQYhMIVP7MZ0FaShP
	KGomgwERFHZ7Rd2A2FanDeUlvf9lBzePr2OPha/YaRhxkm77u/WVW/XZsamA39LdviMVTBgkdbG
	uT1/Q6Xn9aAXWHHFw0BjOp1ksBDLyywK+6OMGEkaJWqyzh8v+gV1BnvJx1ouH5sIt
X-Received: by 2002:a05:620a:271d:b0:949:67ff:56c8 with SMTP id af79cd13be357-949bab651b2mr325636985a.80.1795170010527;
        Fri, 20 Nov 2026 02:20:10 -0800 (PST)
X-Received: by 2002:a05:620a:271d:b0:949:67ff:56c8 with SMTP id af79cd13be357-949bab651b2mr325631085a.80.1795170009727;
        Fri, 20 Nov 2026 02:20:09 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm4998086f8f.36.2026.11.20.02.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:20:09 -0800 (PST)
Date: Fri, 20 Nov 2026 12:20:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: qcom: common: Register clk_ref clocks from
 qcom_cc_desc
Message-ID: <g7i6j3xieuevlouthjr45gsczzq5nppqvwskap7ngxqq2ch3zj@7cc4i75xz4d5>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
 <20261116-halliday-clk-v2-4-28208928da36@gmail.com>
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
In-Reply-To: <20261116-halliday-clk-v2-4-28208928da36@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX12vbpVb3DejV
 rfnSfXhkjUFKgAigaiUrqKoKgZmGGXqwq2LXfiBcC9Js7cVfgVWcOd7KJwexeD+ZLeWCm/fcO7m
 W8kf0Mt0RcXjqxqvVCuMNsj/8Lfm77A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX+NMf3GlawfyU
 dwA2bkOyZYesXM3VcHEIQCMCRp/sCCpFxx1HDegohXClAFzU1lFxVU/TxdaLxjxlPHI47ZIwjXm
 vOLq8J78cSWp5y/UUDrJPpe3dTfZ4g4dxAiydJhpJQfNQJq4PubDp6NcgNURr3TIz3k7ChQweBV
 q1YGs4XN4lExBk31EEeiPf8HSMFh4p72sme/uT4SxflZkDHdAeZOXEOXeWcWhL79xLnNvT8TXfq
 uKiTQdo5/57g2FQs2ZTgYA+dVadG6TOD+nI5Fc5paagfq58mwSRlCkjHf8IeNJ4akGMVK4RUzNL
 QS2C9bU0UBOENyF6uSICnalTODkoXc57Njb/9KpIPjrWEOwFpDHfKdDxe1vtilSoGsmXWicg1vv
 g8ycROMz2Y5onr0UEgj/B5WlNpQhffPHloshl69aR1viD3n190tuMAOBYeot1A46P973Jf7gv3d
 9OQL+VGGAnHCeIACJEQ==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b001edb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=wqR6ls3WrVHNmmoEC9UA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 9LgeHpAAt_XqrMr-ZyFDF_xjY5G4ZNKc
X-Proofpoint-GUID: 9LgeHpAAt_XqrMr-ZyFDF_xjY5G4ZNKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200040

On 26-11-16 21:24:22, Stanislav Aleksandrov wrote:
> The clk_ref clocks model a clkref_en gate together with the supplies of
> the QREF block that feeds it. So far they can only be registered as a
> standalone clock provider with qcom_clk_ref_probe(), as on the TCSR of
> X1E80100 and Glymur.
> 
> On Halliday the clkref_en registers are part of GCC, and the QREF
> supplies are shared with the UFS PHY: when UFS runtime suspend turns
> them off, the USB HS PHY loses its reference clock. The GCC driver
> needs to provide its clkrefs as clk_ref clocks next to its other
> clocks, so that their users keep the supplies on.
> 
> Let a qcom_cc_desc carry clk_ref descriptions, indexed by clock ID like
> its other clocks. qcom_clk_ref_register() now registers a single clock,
> so qcom_cc_really_probe() allocates and registers only the populated
> entries, and qcom_cc_clk_hw_get() returns them for their indices. As
> with the other clocks, entries listed in protected-clocks are skipped.
> A clock ID used by both a clk_ref and a regmap clock fails the probe.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
