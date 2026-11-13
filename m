Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548049;
	b=4DFdL8rh+KebSS6n/ec/wx585t/ckWSrU/UHiAc6Y4xPeC2g5VRpOK3kwWcsDgNHVjNF
	 6TKOTNmNd+FKaASvyqbPqDLRekuu1WLrduGeX49uXEzdvhk4hYep60agTuuIVF/wnUjsk
	 hensnbRxP/94nEJmPsHBlkaHDM3Q1hfzkKqwsuvMBZRQU+VjWosSR6XMguHGrBSqrCFuB
	 OhGn1jZQ4OwPGhypnoR8BQLdT3Ls1sA6EY20GHvSS+A7AjSjdRMKonnGp8Zyt4k48L1tM
	 e5jegaD6J5byO73kxhz/o8xPKJuGmndaC5y8RDmChIh4eKgaNNQXLeiN1qlSXi0ts5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548049;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pvvqtH+Tie2c9fqwzK3zcf+slXCVv07dB1ilEfbuVpU=;
	b=V3Np8zTgfu2OklwD82ik4Xpj99ZbQdzp2VqheEe2/wNF1QX9d4Mk8NiErX0J6V7SjJSE
	 1fv35v/TUksFTv4RdVCqs30QHYMpLEmikMH6wIk2l0D57BEkCCCMojQ9C80D/4mLccqXZ
	 NtGvp1ROU1S4XYncXEztWUizBhbKZoA1Qsc+PsjrQafJKMMuuCCJsukLXyGi6gym+QaGB
	 wuDte+Q9V+//OpoTXHZgNowbbmKebZf3Yvm1TfB/2ryyTGp9nr6jLsn+I2zmr/auaxjAj
	 Ef1Sp/MCPq9UPLYo/DBGaYuqsuIwR2bTQMRwdw20XpF9AZAZRmFQTm7IAEITlwfpASw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=btfDw3JW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQ10AOer;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D7560A5BC4
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64D7560A5BC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=btfDw3JW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQ10AOer
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57DkB3283612
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvvqtH+Tie2c9fqwzK3zcf+slXCVv07dB1ilEfbuVpU=; b=btfDw3JW2Ox7IA8Z
	si602r26ZUVvjQPYIU1tKK1w343yNFumbcLZQs++bascEp/ldrfT9/RIV+KQppnZ
	54wGzfq2Lr7xwUMXYMow0toYZdEa4QSUZZcdl8pMXxI7BfgqgfUeG0rjYvF0IQ+l
	RoHZUx5G57q1wGTuggyIchGUw2Vopg4RZ4kD7Xgo7Yb425JamLduxq2W+jjzy7Sh
	xp0UC7xMC/W1qYwIJxZYNSjfMvFge4BRGxW+j0SuLdCbI+f2MPHjPqxoyuFI7CGf
	VLE8EyBlUkX2eaPwrkHf0A1Y9odyGs20yz7B2xEv3C2CrM1Z8/HBIqM5OdyuQZ9f
	/H6/ng==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37g3v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:34:08 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-47cfa971c9eso2032479fac.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 21:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548047; x=1795152847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvvqtH+Tie2c9fqwzK3zcf+slXCVv07dB1ilEfbuVpU=;
        b=IQ10AOerh5tIj0Ep81h7QKiNRTgWKy1v6hIwNKDAixhVSTYEmPrL8HpscEefMP53/U
         nqIW2n78/yKi1ItBzgnoeEX7X4b+xCoiCqHaJmh4KC4XAdEO40pfrz0nwFFMnBt7Gkba
         tvkk9lBmVzEt30Crl3NxBX4AhtWX0q1rOC0R9jeryL3eRMGcbxX1cM/gxqsPOjc+TZHQ
         dGGNos/A0pRti8vqrL0CAtW0xXljmVXJm/UIpX+yMMNIItUV7RVpIuzUiPaQftnDvhnd
         m+sBXGDiZzWcrVtc8MpyfJ26f4sPbulisASgA1yhLetPxdaMdO6JTZUHwbCEJ1HqpKom
         DHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548047; x=1795152847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvvqtH+Tie2c9fqwzK3zcf+slXCVv07dB1ilEfbuVpU=;
        b=M2wgxVA9GdMsaVjl+WhXEvNqcAL63MP3bKnfLd0WbGrQedzUOw2usYByjv8HTR2wt7
         l+ozeioSsEy5N6WCX44k5P2LBojwApSeHZW7QArGCBWgj9daDFge8Zbvhr/tV/9nYsKe
         aZxuroeNzoOd3Zyk5dkPYp7diK+X/eNclGKvse13mTM/QStwDEIuu4KFfQFowkaO6qkF
         AAFPtYVgFAmpMog7gZXY2yZcb/QwVb97sdCyKwVSSdIE8/rSaOsnWWySV44rX6nUzbvu
         Pd+HiQigRcEXZNVFoF0xzQPGv8GqdyPIH9z67xXtmuz5V+mFlPiHyBqtSx3QrrRmVgxb
         biSQ==
X-Forwarded-Encrypted: i=1; AL+hErED5LFjOwwFSd+ejfsFc0yg8XTvHw79PTzj1jg20RVo1mvS1yXxJVTqx47j64JeDS8wNhHzGjk8P1dCGzFf@vger.kernel.org
X-Gm-Message-State: APuU4Z/im9hb2UJJXDAQxS1/OefDwDZJuGPUuDCaEGS4Z/NszVeg3VzS
	ukz+gv+UFZJvs/MIIZgpsY4dL1fq3xI7Tpu1iDE/673SuWYdD+toD7cdsdXEjXC+IcwKe6w384j
	+QFB8ToZjyftj4VCzCWcp2bg8oqKAEWYI56Wl1Iix251PratPLNVeaODNBukAUPuY+ExR/ZsHdX
	CGgAE=
X-Gm-Gg: AYBFou20UETU+pcWNzFnIyWIHSjABEssg7TspgQ3YyJpVRFCYlLsI+2SLbcB5Ox+GGn
	+dzUJec3P4hdZ5VHAjz+ey1Wt9svCw5NX8jjIFHlXUcyLpg4curTphwTjAdiTzKiCYmXUzMGHVi
	X2uDXXEgjmvjqPgOspbZN3ghb6NIBdl+KChdVdAJUa09mHzy7w4P3A8kI9a3a3jbeD5PmlVmZGF
	onZUxzjIQ88TC3W+/bg13JxO+9dwTkvjvEXqxVtcH8Xl6AZfpEd5V5liVt4hFnHJonbjvf24IH1
	EYd0Tnq5IRvRV8efCUNCZIhHMABaJIyeIEJrNIWx5GnVnG1lhNNXR4JSokw0RSwFj7YxDwGqIth
	VEu8Kzg6bhkkrCX3+CLNWlNMDrxncl+1PP2w5dpnfp+kpU8MGq5EqgHRV7g4A4KPk45CD7VmMGN
	89MWy9sy7dlA2OizyXZ6yFrDhaSbDXH0xZEvD1GMIFcK30oplz0wCfep4pSNwz
X-Received: by 2002:a05:6870:88a1:b0:457:f4e1:a1e3 with SMTP id 586e51a60fabf-4ae63f788b7mr2812634fac.7.1794548047520;
        Thu, 12 Nov 2026 21:34:07 -0800 (PST)
X-Received: by 2002:a05:6870:88a1:b0:457:f4e1:a1e3 with SMTP id 586e51a60fabf-4ae63f788b7mr2812615fac.7.1794548047101;
        Thu, 12 Nov 2026 21:34:07 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:06 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:39 -0800
Subject: [PATCH v25 07/15] media: qcom: camss: Add PM clock definitions for
 Kaanapali
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
Message-Id: <20261112-kaanapali-camss-v25-7-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX4UyxxQkNuPRk
 o5qnpLopJXZuHtgb/JEOfzqAuR2k0MyIGMt0daLRtNHyieLjN0bLKA68meIotlBTDPvgRXxwNzL
 2cvUUDU6MMif44ivBqqiRAncPixtlZA=
X-Proofpoint-ORIG-GUID: xk9rknLFWVqhWrk7WJuWpSnUBXYysmn3
X-Proofpoint-GUID: xk9rknLFWVqhWrk7WJuWpSnUBXYysmn3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX5RFU2gmQzXrV
 HFwN/VVZO5JgKUclDZnFHfGkBdGWNduv0BN7/Kj83Od+Fu8Hk0JxIEoScJZaScpF5dg4yl1bGpE
 I+v7XGueTmvDWDviJ5MiUKfiaZQPuXYn5cHfGPYfa6/lNZ8KXJu58LLdthR4Toc1teqm0/0t9ep
 x/WUj9xCEg+//DeoYnGFJ4kck2NvnC42csN3P+8ojUDPG+Div/5gSqv8RCGwO4FBrIkP8OYS5om
 ppaNGyoxF2lqnQSqLyUdrBkv8yVD3zoaCeWdPoj21egK4EtdA1bKUkIQrgFIxay48b9IVKdXZdm
 NIiGbxv3ZZgjc6F2f6MryV/bXj4vu3vQNgqMZi9UGynaaZI/WWz+7/h4CADX3YZ2KWsS9vh/6Xf
 tXalTaplQZ0RZ3DOrxaVGqlUCeHTJlCz1S0NwfJBsZ3ZSgYCC9BaD7I6SYs1jqZlLUk8/QBi7rR
 08XFGId28zhqj2yHXuw==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af6a150 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3_5DbsQPI53TjtTAKikA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130021

The CPAS AHB and AXI clocks are shared by every Kaanapali TFE and IFE
sub-block. Register them as PM clocks so the PM clock framework enables
them once when CAMSS resumes, instead of each sub-block listing them and
taking its own reference.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index cd6adf749c6f..f7b9c71cf263 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5602,6 +5602,7 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.icc_res = icc_res_kaanapali,
 	.tpg_res = tpg_res_8775p,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),

-- 
2.34.1

