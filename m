Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F07E49E5DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 07:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718338; cv=none; b=mU6vRvLUno9mwuSVy3UqYXDEXQ3vcKC91PvyLeA5kd3Ms864qLTlyAa7BmKYU969w0tcAhJdYNYee0mqA/mMMAGPKIT312BtnaGdqykNzNBFNhQgn1V5WFM+IDenhAGX8koyGgMno6fgNbnEDVY0Ykd77sluyMYqqEk2TVQ+FmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718338; c=relaxed/simple;
	bh=RGpT3sxjgWbmCMFX2I68gEn4A3TOcCWmHnfsknCtbJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oldVtZmxQzDvhQcglLIp01ADzpu1P5+5EZJYW2c3C/G2hso7YD8QuDeqAt7nYFGHgFn6SS43diosThtvm+0EYtF46VNn24H2n18he06uNHh2cUz+D31lq+V0u9GzHJx2xuCW4LzVJVZYWNeaDGJsiDTR1AmMbXKKtghm8Dispko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBNfBQIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HTc1hQw4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBNfBQIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HTc1hQw4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xtw73423166
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 07:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HM5E/LrBKbwT43HaG1MhZG1G
	QSq2jkFM3/MQ1ct8JKg=; b=bBNfBQIBRpR738A1numkUW9Jxc8hKcBwGuybnwDI
	7HYqUuCAjTcV3LXM9MTDzI5pY//hhcdZVaku5wW/XgGa2U2lkplRzPtv38hJp/Kw
	3PvTmnhNxv402L7VaxO3/uGWW7jcbEBSvvczw2wLrON5kBw64ovU08RtaG2dtL0r
	5k8gEcGM5PWPHkv3K8Czs272hCC6v7NjZD8in9Gq8jAQlf8kH0NxHZ+a5E6Asyvb
	bOWa4uLF8HixGemii6IsFzFnBtf2XHS0EC6b09muTR2yHCcPjMW/sFDNoCJDxC6O
	xbKgcZE3rSAUEHnv4HoOLRzP19BuEwb5p4ZeItuDyBAiAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdt2na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 07:58:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9394ad7f64aso67328085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 00:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789718336; x=1790323136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HM5E/LrBKbwT43HaG1MhZG1GQSq2jkFM3/MQ1ct8JKg=;
        b=HTc1hQw4CVNx/DplTSS8dRESaIXo0HexEqNoTpf+JUOSYFO3UUCFohxELb4UZvzevf
         nrQcsn8Yz27CYfIBQw9FljjcTv+s2xkC0q4eCNZWXFdVyYWicqj5QIZMScLJmrW/Gctj
         oCfYaXUZ7yaeVMuYbTx0QmNK5lihhl17+9s+gD0iittjypMr7S8fnJ6FXSoWvXwdgSu6
         0bf8iMW8jfse/Yc/mUvuhaQRrr+N5YXCak4anw+pN4e3M5Mzpx3ZuqnBvdKZkg43rKyf
         NH7UnlMnbnnvr5xmDNdr5y05e0vo9oXgKTMT2KPgvhYBLw4TDoMswv97nHIUMHHrshnM
         Flhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718336; x=1790323136;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HM5E/LrBKbwT43HaG1MhZG1GQSq2jkFM3/MQ1ct8JKg=;
        b=z8QGmj+xSmZIiFiLQG9fBupcGim3cC5hwCmSaYsVKFqngC2N1jzbv43Y6EXULFedg8
         7yhfMbChvTtHgZzejsNeQYxvJiETxHdAIuiTMe/I7ljn32tALAONkQf1WJUVf14TwrZ0
         kDpLNkbO5+vJANlAwZH/jKDt6eCLAOKeWzcPBQJf7jBOo+AOjQQU9bS/H9fkjN+Q64yy
         ftEEUlIm4LnvyZHp3bEjsV3s0+X7sg3gEoWsQCFqLTKjegpAbkFaqXQHaQqLadfMjGE+
         LnndWDCgaf1aD4uTWwU8aPHEJGKsapDqUku9SkI4iTZ5LAV1RVPNMZ8tuSCA5fFIY54z
         hn9A==
X-Forwarded-Encrypted: i=1; AKwUvBw94AMcC2kpdErbCSy82cN5HFI9gTHRtiukcqneSFROoqsZZpx6W1KLVSSCyKWJ1SalSwLXdoGwdPMXNkGf@vger.kernel.org
X-Gm-Message-State: AFuF++nhjIqIP08Z1AsqpHje81ITPybNlHIinwUBliVfg4h5/OdY2a5P
	zqhCSgJBjheSECf9YwF7pgdeXAxtTm0Qgd4NfLBHPsM73DPW67hRONPZNv2pPmwjAPbdHaZP6zr
	kbM/mbpjtFZVlWV7vDPhSGjYlnfcPqVDxBgc8qfbi/cpe8SAxnfN5YwWqx8fJMdwTplao
X-Gm-Gg: AYBFou2mDbFKOEKddCbXyM6pcurEPDDMXm7XCxvUVN9t3w2HEDkc+LUhLKnnSHAEUHA
	W+9WDCpfAAB6trjfXy1RNco0KJ2xXTEN2cowV7j9vAbt9lDUcUL6ncfAXagxFwIREDtbUcA55Wo
	HB4SIA/cRbIkLDaHj17FZLWbToqh8hGc21+GwD9b8cGxxWkrHooi7Mte62q82qG4ugp0ueLHLsA
	ElzDgEbzceWWmKgf7JGj1kGbkR6BwI4WUKy3JrlyfTofxt6DEu3DaB305AI9StKpIZmNIvbcGS+
	qAmxJiwLlBF+nOkMGv1fdqOsHxUTbjP4RHfLQ+RA3TI41tYbfHdPseqbepNb6KrS33MF5wm+gth
	bRzgvZCJsU+BOOvw=
X-Received: by 2002:a05:620a:46a0:b0:939:ed4a:dd75 with SMTP id af79cd13be357-93bdc727a81mr231692985a.21.1789718335669;
        Fri, 18 Sep 2026 00:58:55 -0700 (PDT)
X-Received: by 2002:a05:620a:46a0:b0:939:ed4a:dd75 with SMTP id af79cd13be357-93bdc727a81mr231690985a.21.1789718335164;
        Fri, 18 Sep 2026 00:58:55 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5645sm1900468f8f.4.2026.09.18.00.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:58:53 -0700 (PDT)
Date: Fri, 18 Sep 2026 10:58:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Amit Nischal <quic_anischal@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: qcom: rcg2: Propagate force-enable status errors
Message-ID: <wqehomyzl6qtc5xsde6x7kpht3lxujtvaftmugspwqhthqhius@jop2a6bbxim7>
References: <20260917-topic-qc_clk_fixes-v1-0-5531cb00514b@oss.qualcomm.com>
 <20260917-topic-qc_clk_fixes-v1-2-5531cb00514b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-topic-qc_clk_fixes-v1-2-5531cb00514b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEwNyBTYWx0ZWRfX/JNruXCQW9xM
 hLFw6tMIZIKeglXOfdz7jdwgZ2VPH2eRoCoBwxHjq8Sy0TgCPrrkU0jLOAp3T2j81a18//VrpUZ
 /LTvcyj9saPS+x9VoUfpQbZ5oxvHcwCvKePxknN8z7Pjb7/HKRlUvwgiVjrFhYgbC3ffy/BTF5z
 Y/019aEYNlTYNxYnFlL9YyvMlwtRrewAOKKid6t3tbXJQPRnFuyO5PYAkNga1AzreoLO/iAe+Zu
 S5Xxc+MyNyATjIKtDx2vNNsG5hL8wTQJaqk5vDVDEaXqhslqwxwi83bd7k0qAt2VyGNwUDwqaFA
 vLTSkYW8BFnw1AORheinHXp7z3xZKR/y+t7vNB2Jq4qTeD3huSNM4bV1PvEkVQKBSPQaNyjSETq
 ulqAjL3G9j0gDEmIw0DMVXNCf7WIX+oIqmvAn1f6f7Zdvp2cbyBpaznfiQvx1JQSaaJfdddGkOu
 Ic49xQkRV9YxyDfB07A==
X-Proofpoint-ORIG-GUID: Y09jdPBktP8d5CPcye7-ewH0-B_CaO5i
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEwNyBTYWx0ZWRfX69TCZz+78jbQ
 h9lMJzW6klhBXKyYTxGdnC1+DQhWxws1QlukEE9wnL6/BiRiSe6puywUJ0HWB8yJG8ddNHC0V5B
 V6+h17cbRsOg8qpYpszp+o86SsBYQyY=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aacef40 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Nbw49Jzf-jmJWK6uOdwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Y09jdPBktP8d5CPcye7-ewH0-B_CaO5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180107

On 26-09-17 11:06:54, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> clk_rcg2_is_enabled() returns either a hardware status or a negative
> regmap error. The force-enable polling loop treats every nonzero return as
> an enabled clock, so a failed status read is incorrectly reported as
> success and clock reconfiguration can continue with unknown hardware
> state.
> 
> Check for negative returns before testing the enabled status and propagate
> the read error to the caller.
> 
> Fixes: 7ef6f11887bd ("clk: qcom: Configure the RCGs to a safe source as needed")
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
