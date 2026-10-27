Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124535;
	b=QjMqtU698Ioye+TuDJJ9KSokfAGKPsST8c8Gnio1RR182sDo4tHX1j7xin1LAjG3R1yO
	 eSqGNoVVaWxwzIC+6Ku3bb4uOTQQOHPR4br6t+WdtSz7BoICXem4EoXVWD7RAhDuVpMW8
	 CWa39wE+DryuFJiwSgPs/UufTb40nNOOTwCMOYrQlm+Lx6xvzy5ZrdmCgM6NCLbxPWuqE
	 1yF1BC7T9seETSR/ZTxBLDH67CeE73NUENDCgvoEqfMhoectbhi/2PVRuRlURAILyYqm+
	 ei5w6p2sTGnUO0vG405ap2vspS7GuHJIqBgk17pPR2gqJ9zWEaq4cyxosXNU6hQ1fIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cUuWQNgb7NKQJDdnMKORvTwXDPw2ha3MGdzMx7ZjePA=;
	b=Ik1/JOmvvjMVPspLrJ2TLcMDoKCpRoI/SfS3OCTOg36hMGvRF5echrt61193Xifctvfi
	 zhQM1ybT79Ne9wAV+97C8FjLHNeQYN1sEiFje41u22xnNtz1bb7/RPs8ITz8njBEcX4RE
	 BwrUj8RmfTRdNdMPJddMxlbAX9BDqIKySuoKMGllU7Kiyo38KnTi06PGw4MQSyxJEfzYR
	 jJ4gDKQ4dTTr0AeQyVPz5gIQI/hTQUZCGGngdR4dsEY6OMReAbBo2p3jjfLOZmJpe24vO
	 pbK19tE5oLPHYnM1+vCEDildCIbQZgig6s7siWifsgYjApOdemkrLLMWcJ5Qzkg+fUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mkai6JQa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CP/eJwSl";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373FA606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 18:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 373FA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mkai6JQa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CP/eJwSl
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RH02a23309766
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 18:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cUuWQNgb7NKQJDdnMKORvTwXDPw2ha3MGdzMx7ZjePA=; b=Mkai6JQaqO3XSNUa
	7CPrRCbFfNGMwDAbLD/eXeg4FuUwhQ7JPdSNS9RF/8XiP9FePlGIP5kG/O+KaOEB
	oGKzV6QKjZfKJMzalvOlIaR5/q7Kg4PT4kPy3bdI+wPDqWo+s75mhYGBAOTBhlEj
	YOUx4p+gj9EsXLTOdVL4svDlOAD9yRNTQoemaDTe6CxpzR7dLChMppkOGaQLRX1N
	EFCpZWHXkYP1qWrcfgcLTXyKFAicARVOFKbZiWyrgXDxhNDDTbOawp9J4qjGMFoB
	j4acTFAuI3ywQoJtUcbO2MVCF7+vndZ6Kd0BBBiEMiBAny+fB6bz4ymLdMKbgQUw
	qqEfdQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbtbsjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 18:08:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a1e2485fdso254239eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793124532; x=1793729332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cUuWQNgb7NKQJDdnMKORvTwXDPw2ha3MGdzMx7ZjePA=;
        b=CP/eJwSlHQX9kFp8OvyUGPmwa8T6X2FcJsT1WpKXpMvMwK9qd4mblEv5z5qaPV5nW7
         I7fNHiDFWpsff3k1ZLawtTqZ2NrgkhxQzYb0CtsovYyzErbzPy+07AHhBnSlctunkk7O
         Bu0GvT9B3HTA46Ww2UsZypFdoZSrumIPeK1rjtGAq5oFfyyOhEkqk9l4qQHMRTPNATlq
         AutWWLBsBv1Q50iB3RQtvyi07iSY59AThNMRHCrU6YjSj7t6wmn4DACi+xSoKcoXtjyy
         uxL7O4pxRN55m6f6tSmAXTf3EjhkYg3Ap1Ifk4SFGyMbV1ur11wFk61+5JhqqRJZfe/k
         PRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124532; x=1793729332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cUuWQNgb7NKQJDdnMKORvTwXDPw2ha3MGdzMx7ZjePA=;
        b=C18RMCxLm5C8ztlF9u6XgA18pBO491aFUkJn9xm6WAQmwBR8cR3eD4vRmr4Ohgcx/x
         +gHkXa2UrT9HlLgieQfTsHcro+DRPPcNXqJf9PyAvNxh20NaOwt8PX4ameOcD+tjBrhB
         4wfcarVmZVvniMENc9L/raN1BbCq4fK0H9f9mptqk3o4rkOzFJ6IHDL1R2q8O0j3WsEO
         TfupMqHDk2b0v7y+UXTJ7o4KkibTKn761W+4GZWrTI51rMhXD+T0uAXkO3iThTXkFKhE
         wHZwADWlTQz3JMzmk6Q1NL9MrJvsT6azj9LXei2S6u02ihZpAnPXaoAiijNl9LuhMoOD
         as1w==
X-Forwarded-Encrypted: i=1; AKwUvBxweENQjvVPZvTFIhhbfAfLvFnCNLkhopfFKqU/weApGiw9yKuSIFRfHin/2xVW1lYhWijxqXkt03hAFoT2@vger.kernel.org
X-Gm-Message-State: AFq9FYKV2xbzf+G66jOAaadoUfR199crBZqsgeLnA+grwfvYyRCWtHVn
	a46FWbZ1rh1dt8PzviGsBIsRp8+o9jLLZuPhwRFNeya13SwiEuz5jVkdFuLEvjEEdcT6/lr0Lui
	Rc1RP54WAGno/4csrARQ+2UV7ccuw2koI+AnheCMuEhNzBZphG9Hcfp1zpPTfAAWusa6U
X-Gm-Gg: AYBFou1pYKuP54Ayvb8YCjiBI5ngq5sosp7UZE5rS4A+tbbQnUW6945ruN+leDFfa58
	Q6I5BrxNczr1lAKjYH1/WM4BKkkTwBj6G75u6CvJ2Ay6bJ2WbQOmFKBNLA1BM4EhRM6pcGd9b72
	BiCj6HwmW3N4gc1Pq1jxvkOZDsIw5kfaUskaGQUqxhRio3cHYghIOSpTIg+Z9pzJGC8bZiNWj71
	iww9DmNS1VaQDlupjt+Uh/ePGt+4dwyMh4gh0zxmwwlwXgihajZJaTooN3eHse3M9xrEWEt/pL8
	jXNIOBdp+T/ZPm6a+EPAxOYlsRgjtSceK8CVRaKMQwvWWHNi77mucTeMdhPnbguJ1P8NYK7wS/f
	tCqJmETKLBoec3vvqFIW3AvDMCilkOVW+zgVA/oUFoikH9meyt5zoZDSAJqSQl2cSFi6FdWXhXg
	==
X-Received: by 2002:a05:701b:2908:b0:169:bef5:f445 with SMTP id a92af1059eb24-1a6c85d145cmr41489c88.4.1793124531751;
        Tue, 27 Oct 2026 11:08:51 -0700 (PDT)
X-Received: by 2002:a05:701b:2908:b0:169:bef5:f445 with SMTP id a92af1059eb24-1a6c85d145cmr41445c88.4.1793124531116;
        Tue, 27 Oct 2026 11:08:51 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0d98660sm39144463c88.9.2026.10.27.11.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:08:50 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 23:38:27 +0530
Subject: [PATCH v3 2/4] clk: qcom: clk-alpha-pll: support a 28-bit
 ALPHA_VAL width
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-nords_dprx-v3-2-5d98b2c6c263@oss.qualcomm.com>
References: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
In-Reply-To: <20261027-nords_dprx-v3-0-5d98b2c6c263@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX8Nmafq3ZsKZ1
 6cYTjPJdHJHkRGSo1+TyMkp9TVif3ZCZfcNaXJBdVlk5Kciii+L0gqfeIQpdoAOu+/h7HBFCGmp
 ccBh4auXlwfQr+8Ffs5V/W89hYt40lI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MiBTYWx0ZWRfX1irUJlxk0+bF
 CJ3OFoTxNZQF9+Tt0JFatwDZW1bQNUkJEliATqrlxB2ac2GAokqBxPIELhFRNOzGeMJmVKljuHN
 NjZ9xPIJUAh/TavNpe/FPRGxAxJbixZmDdCBB4KCGjdKA1YO2Hb8T0ioYGe8P6ktT8wiwzrNBdG
 PjhmpAVIGJnp1wt6KqAAhwnqev6GvNF2wgjZyfmX+/MAlD2Sl0bE3zSRXBZZ2NafJiWTshIXtIB
 DwYzLagqycaeCnaY2llzquDglbIMmJim1qdVPrrIPnDtAT9Q6a6V4zObgYcPkR34sexg9jpQ1/7
 GMeVpZIeygkR4dopJda1VLXExUhGyQhO51UojKw99Ku2CJnUL9ViMxrx1fpio9ByfvF+YrK9YIy
 AZb25UMVrhaO/PaQ4f4ScnW/BRyUsmBhQCvgEBDN07FTl42dUKGLTvfXk10IZn6YRmDuo54pWSJ
 /S+T2ENS//m9vRDbClA==
X-Proofpoint-ORIG-GUID: ZHIPiXPsUgWwkbFbVV9kjJDHMbXAYS0S
X-Proofpoint-GUID: ZHIPiXPsUgWwkbFbVV9kjJDHMbXAYS0S
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0e8b5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=i6vi37AUFhTFFivpSMsA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270072

On some PLLs the PLL_ALPHA_VAL register has been increased to 28 bits to
carry the fractional word at a finer resolution, for example the
ZONDA_OLE instances on the Qualcomm Nord DPRX. The alpha-PLL core,
however, derives the ALPHA_VAL width solely from the register-map layout
and can only express 16 or 40 bits, so it programs and reads back the
28-bit configuration at the wrong scale on both the set_rate/slew and
recalc_rate paths, making the PLL lock to and report the wrong rate.

Add a way to identify the wider register: an optional alpha_width field
in struct clk_alpha_pll that, when non-zero, supersedes the
register-derived width. This feeds pll_alpha_width(), so the recalc_rate
and round_rate math scale the fractional word correctly, and the Zonda
set_rate L-adjust MSB check is derived from the active width instead of
a hardcoded BIT(15). PLLs that leave the field zero retain the previous
behaviour.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 8 ++++----
 drivers/clk/qcom/clk-alpha-pll.h | 3 +++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 9782fb062a58a26daf3e911ad23c5e1d805b0c38..9726e6ea7f5f80a6355aa58c345657aad8c157c0 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -41,7 +41,6 @@
 #define PLL_USER_CTL(p)		((p)->offset + (p)->regs[PLL_OFF_USER_CTL])
 # define PLL_POST_DIV_SHIFT	8
 # define PLL_POST_DIV_MASK(p)	GENMASK((p)->width ? (p)->width - 1 : 3, 0)
-# define PLL_ALPHA_MSB		BIT(15)
 # define PLL_ALPHA_EN		BIT(24)
 # define PLL_ALPHA_MODE		BIT(25)
 # define PLL_VCO_SHIFT		20
@@ -382,8 +381,9 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 #define ZONDA_PLL_FREQ_LOCK_DET	BIT(29)
 
 #define pll_alpha_width(p)					\
-		((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
-				 ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH)
+		((p)->alpha_width ? (p)->alpha_width :		\
+		 ((PLL_ALPHA_VAL_U(p) - PLL_ALPHA_VAL(p) == 4) ?	\
+		  ALPHA_REG_BITWIDTH : ALPHA_REG_16BIT_WIDTH))
 
 #define pll_has_64bit_config(p)	((PLL_CONFIG_CTL_U(p) - PLL_CONFIG_CTL(p)) == 4)
 
@@ -2290,7 +2290,7 @@ static int clk_zonda_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (ret < 0)
 		return ret;
 
-	if (a & PLL_ALPHA_MSB)
+	if (a & BIT(alpha_width - 1))
 		zonda_pll_adjust_l_val(rate, prate, &l);
 
 	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 3a2157bebc52cd15f55381a068953f21be18f6bb..ab3b4f4fc7501df0fa3f59d741d64646383e4cfd 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -86,6 +86,8 @@ struct pll_vco {
  * struct clk_alpha_pll - phase locked loop (PLL)
  * @offset: base address of registers
  * @regs: alpha pll register map (see @clk_alpha_pll_regs)
+ * @alpha_width: optional override of the ALPHA_VAL width in bits;
+ *		 0 means derive the width from @regs
  * @config: array of pll settings
  * @vco_table: array of VCO settings
  * @num_vco: number of VCO settings in @vco_table
@@ -95,6 +97,7 @@ struct pll_vco {
 struct clk_alpha_pll {
 	u32 offset;
 	const u8 *regs;
+	u32 alpha_width;
 
 	const struct alpha_pll_config *config;
 	const struct pll_vco *vco_table;

-- 
2.34.1

