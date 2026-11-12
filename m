Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470596;
	b=CFtSHjVf6rE4s8cS4pxrfh6+JItAKOMA686DBFKY9LdwkPi6Ka4ZZVyDkF9QE5FgSgsg
	 /CL/9SyWKiHa3T682UzxnxrTfm7u/tNoeLfvHNmHzgMiXTPvJ/kdpu10uYtdKPhLhFmrz
	 OtJ24A/UhvOF2oRXp8fUuNaYpLrpPTbooRJAeNd/CXYhBFwxsIuGDoI7jDzEOIXDezcoE
	 SQntVoapMQr6j0kiIFl8M+Piu50MmSjnNh9T+wTr2EQ2yuDkDQWGn4m1c6AccrWLXcpW2
	 GT1Lx8fvgLFfSIxnVNK6pCWqbnLwKXuy2Vvgrj1Zy5z1oTH4KcMFlPDyEhqMbu7TPUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470596;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NrcMGnTSkR8PHs++ZQALj/9Q2KCRTDyjUGF1gzNkIKc=;
	b=NQtclhBeTtG145QZXU3ojW1yZ8jlVZvC9WiPJWB2K0Yz2UOAtOSiT/7SxT1higjW2Q0s
	 cKpW6/L59lLDO7R7ww0+te1oUdE2pJmVv5C4fvxMp6mdHzK5+2s2ZVo2swWt4rF0Ovn9i
	 hH37eT0fGgS5t/jQ8UHyqpANaDwDfMTEahTWizCIlQBRNbE2LeO1USleL979c7BtesLkh
	 HNxmUQgTp/DxloFlYJ2i1Ars/YjSjA3sC76xzbDd5OLFO3frEgYEF7IFvLXACm0mvZV6T
	 rky27ZVXuV304RkhGXnROgjPlPV0ntwteAnOEHr0InwGbTQj8/ASoqG9Turdagbmdpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CuusEMxk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HXTQ6VwA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACB3606A332
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ACB3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CuusEMxk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HXTQ6VwA
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7ix9K126150
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NrcMGnTSkR8PHs++ZQALj/9Q2KCRTDyjUGF1gzNkIKc=; b=CuusEMxksXfXgyIn
	WoPG2hxf7/JBQTeFx2ErNE2OXdZDIwHphHilagmUVI6TvF4z+erw1EbBOu2CxRsE
	Q5P1T6Op/69dDhss5SsjBXSMk68N1vXZRfBedF3A6wO9S2tHH5kYMs14cJsTUTGN
	yNNseM7E6jN8RmgsUWvxUfmIJhFKZb8nLe3mGAcyY7wsmmzdV4QMpaT7ZliR5RRw
	zhIRgTAzhFIe4ucbINfEKnlmugh6an8H494YR11uz/8Z7GM7UJtnxfUaKhl0OmFq
	dTxv9rTvILtKBynQpLsNMq5Wx63thd2NzZUJU65Hqlb4RY17faMQ/eBuaM6y0oWp
	LBS1zg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a082hk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:03:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so3759269a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 00:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794470594; x=1795075394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NrcMGnTSkR8PHs++ZQALj/9Q2KCRTDyjUGF1gzNkIKc=;
        b=HXTQ6VwAStXGWEngsBtifzHRE12djrgYbeX4GBCWKRebb+slSAtXJmzRUkSzEQC3bV
         MOq1RsC4KSWcWHCk+6iIq9j1nrcH+rjYHNGzncYs1sGkIjB297APUhwzDjAO2Asahl13
         lJSZOrceAEMx7eKzMoPxFANib64+rxepq7oDq2kBUf7283PPXD/p1faFdP8U7vQXlmqp
         veNwwDOZP4rN234XuzJf6Pq/e/tvmT2+K8B9d66v2ByhU+ttkYYpeykdmqO0qPoTb0i4
         asAJ6MBt1+ewlQQO30gWIyWNg/OT/85yWiCUin/qy604VBaspihNvCCg8Vh8N/9l8lLp
         enhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794470594; x=1795075394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NrcMGnTSkR8PHs++ZQALj/9Q2KCRTDyjUGF1gzNkIKc=;
        b=oFwsXO63qOzlWR3odtqFPrZf0gfjFUzI/fyOPcDC54jm21xzzLLYNthDNzuWGP0+Y6
         ehINdnW+5EFPrul3XQKRDhd8j3y0d4JDtSkP6772qMonWDd6At0yMzZHbJhcrYlUbLJa
         8JwfVZBKZoIQbrPtwnesMGKbN3ZSpqBJsKreC5iKW6pXohTlbz43gvIFYUuTzFBRgf7s
         TPQPslwMG0H6pTV1EHiVOAWc6kYtlP3onwwmOA1rDdb58v/39uY7iaG3NEoOJ5DGdkzT
         thgdHiOnui9coNlYqOOXzgr2FBwbtj+4/wsm0oYUTYnQQrec1djRQdI5OjIjLe0T9v0X
         8SPQ==
X-Gm-Message-State: APuU4Z+ybQXX5dvK71Szrskb9Eajnn3KAVW9EGuPq9pYn+Gzogcqh4+s
	rA/VCYyfG07xndziPK090XYyjIQBYs9TgEsEE9LO7kyL8SHtIg6KYMvXSrH8HCZjToog8pfw2Vf
	bJaqsHJdXiB7uN9st5KlS6uWJ1+dYVIDLPMIaBPIqnLdXGqC/uNwLbqaOI1tZdG/r/Rst
X-Gm-Gg: AYBFou2Y+NGD9GPPMfAo3hcRp88rLxUI1/tShdm4a6UrXn4bpXQF723VybbRiYk11sx
	BbB2etKWPs2gTS70zA81W/E0DbnOKX8eRN6Yg7dgrT6eElRKfTJzSmVZ0d+et10LyDYXVBVqH3p
	3i2a+sJAaq2HJMp5ut0yQoLItgbUDEt7IfFvhOn15Bvrjk0rYe3TRrHebgxfyOIIL1UGr4uD6Jy
	5lGsn5vtX9jDMcp/f+IXYUsnA8/EyiKb2C22A3tw/FKyolqRqUfWQHv/sCk3SiLNCvZ+FR8wjFv
	CDjuKEyrff1duKdDgxF1yFmIc7yX0WxYy9N+0lRAzf/HisjQpxJzBqjBdlEOp4p9c5BHSi7rP08
	4KgMcAjfu/eVU5GjEeuS314c25+NN7coE8kFrs7tjbUncFX6Q383reMmrUAjIzhc1Xu/HNI4UzL
	r66s/L8YI6
X-Received: by 2002:a17:90b:1fcc:b0:3b0:a7da:d244 with SMTP id 98e67ed59e1d1-3b182eec07amr4432272a91.30.1794470594104;
        Thu, 12 Nov 2026 00:03:14 -0800 (PST)
X-Received: by 2002:a17:90b:1fcc:b0:3b0:a7da:d244 with SMTP id 98e67ed59e1d1-3b182eec07amr4432241a91.30.1794470593636;
        Thu, 12 Nov 2026 00:03:13 -0800 (PST)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182e3a74asm3722251a91.4.2026.11.12.00.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:03:13 -0800 (PST)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 13:32:52 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: nord: Add SoCCP on Ride-Embedded
 board
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
Message-Id: <20261112-nord-soccp-dt-v4-3-af6e44e9f397@oss.qualcomm.com>
References: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
In-Reply-To: <20261112-nord-soccp-dt-v4-0-af6e44e9f397@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: HkoOK1Ep7r5zGdwi1Icz5KccqHYeZRxY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfXxTDPsyU74hLq
 W/UAtZ2R1ledtZvxFZnqB6XNtvPQJfMQVrg2FIR3rPSi8ZNitMTQKALVqfpQPX5e8L53tmNpWce
 RrI0sj93PGOsUIhqm54XGOhcF8XEq4SpWr3vo9ik7Bi2SbJzrYgdn6zcuSEDWwmAqWZSBAxwr0s
 dl/RGpGMiRrjE6e/wmPo1KHp/ltboPA5ToQAdjXPAMpy0gKRz89Q0T8j2LQ71bb1IVCqhsE+Y3y
 jiqPNl9lXWwKPpgPP/tCyzesl/St3YY321J9165bSGYdTGAg9khHdbX6/rlmQtHQPJMOAiVNuca
 7Z4/AYOTWlY6ikrRdyTSK07iOTPdvMSdZ9BRI5r6lYwr8qkeRXcU/O8wLjQj5Q+W0z01PtNPo6V
 RSfqqDKFlp302165hs0fYIunKc6MoQRrjyVNYAhv4eeY45gmd+R6ZCLj0ZtHeqFODocYu86QXX2
 5W/N6OTbFni4LLynxnw==
X-Proofpoint-ORIG-GUID: HkoOK1Ep7r5zGdwi1Icz5KccqHYeZRxY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMSBTYWx0ZWRfX7rDcEfDfkZTW
 jh93DDNxhoxf1xqx3pL8bckWQTlyZxmjffLwmutVU/IK6JfKXEkNFX1JlFZvulfFd4A+/zJTBNs
 qHfbxwM2x9j4s6RCllcDYd8U7T8LUAY=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af572c3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=XGSE3OjeN7eXtsT-Ms4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120031

Add the SoCCP remoteproc node with its firmware path on the Nord
Ride Embedded board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..1aa3ed4c1e45 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -419,6 +419,10 @@ &remoteproc_cdsp3 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &uart15 {
 	status = "okay";
 };

-- 
2.43.0

