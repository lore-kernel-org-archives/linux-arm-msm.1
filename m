Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408CD392803
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 04:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789793216; cv=none; b=rjW+P5impmkgoHhRXP38ZwHP75GpWxA7+6yue6mKE/lDCJ5zxiGfYRNF7Kx2iu9mWIblPaUpK50vxE1uiQ/EyczOtJcXP2/OYHwYXQ9crsvb9HQjtO+GMTWC3k5E9zoK2Lybhetklcd7x9+CREaxo1rKjc/PcHo3VvoHDZbKn0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789793216; c=relaxed/simple;
	bh=e91GCqlvcUlMbFlsj0lGXM4SjotkKNP7xTOL1aANvcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dG09OWzZOLfzmXhg4Lz+sqrkMC8j3UPnHYoIzTdYqbT68u7B/h3bbxqyybC4TmJ2O2SNvtAAZkpQgME4RepEitCBHS8tOyyqaLLb0jOWVo9sx29EIoukqO8Vx0F6jE6SHpmCPNR0M42LV5Oynflvzorxw4SYFgQgeqzGZI8/2Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8ZWVrfW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SPDwvHQo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8ZWVrfW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SPDwvHQo"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68J4C18L2127269
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 04:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0QwybzD7szdii2yuz7xU3HjYAu6yDSNYu0ipmDX6Ltg=; b=H8ZWVrfWRk20RPm+
	nowfsn07nncdCIV1BOgN/tFQbt2O9GiXwJjDBletXPPGBK6eLDaxbFgJqkOfJItI
	osgy6FdFV7MmKbyUV2Mn7nPV39AfQJqaqOm+CcZcFMtCObn1aziz6/1MuMLQuiiG
	0e+uU5UVdqy1k/q56F1ASA+nreMMm82ufEl5rbgL7cFO3xOR9ttKEG4Z6aBzXTTr
	Gd9VtSOeQhEOMON6YzhRqgaqpWtzDm13TjV+Cz0+LPPG3Vscb98MZKueC1cMxKDW
	ztxFOk4yWkuqt6hrVr2fVejnfYxmdDeZc1InTLO8z3qcxBFIUVzuqn6VsnH4P/5W
	kc5gMw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsk5eg2bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Sep 2026 04:46:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc44d708055so2507267a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 21:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789793212; x=1790398012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0QwybzD7szdii2yuz7xU3HjYAu6yDSNYu0ipmDX6Ltg=;
        b=SPDwvHQo+j4M5YyRzWRZBslDIDkmXg3NgDtIzqPqg+NAri7t/D4ZiXLpLoC1wbcA0j
         f7PVPjHquLr9+sc8UpBpp6Ut0luk+R51nabfXtfJFqx2c5HUfKHk9rBsDXAa85lpAp+s
         5glED6QiXzpu6nHj5JT0ggipT8pAiMjj9Nj9WjKCqESn2V/Ct71JIsSp/vADgIS9xSvc
         W589SKeygwalCgfi4opB2kUEY5x3Ci5epPfYOKGEDJuT3C8JdP+rOPae4q+ClVv3ZZ6M
         SKx26J/uI14p8q/C68wqS1A6Mf3vVV0rg/ezXftVQ/8LwnUXBcYkyPhvDBpko57cL6eM
         /L2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789793212; x=1790398012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0QwybzD7szdii2yuz7xU3HjYAu6yDSNYu0ipmDX6Ltg=;
        b=abPaic/iHQya4ONROL9VdbV8QxuYm0gl9VNJUFHq0JC3Ml5HjVRZeCGWyLHF/UBZzE
         hi1tjNCjlu0mxBtU86kfnVp/EtruJt8Iux/BMNRG9rCXkHTonQ4cqCn5d1al/uT4V5XB
         NbAKtHVzVmS1xOUd5BV61KXCBMe+K3VDg92WRAC+W/1KZqMYqk9cTEVqVKvzuWbEK+4H
         Pt5YVhz2Q7SNLohibX8j3J+7Uo70QGErTJ3IayohcMB1su6CNM6L2xDeAQ/n9VsmYGgP
         //KVxUfG5ispEb4ord2Cj0heiOoLFafTO9kAsECv7Zckx2MHb9HSZYoFXyR0BwuBcQp/
         rWXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxktfGJirePNt82luAvZ3Op1aWq1pZ5AIs/HcpFsTwoG9iTPTSQXFa93RO6DEmG/8EZ7m0MR/cG0njgndrL@vger.kernel.org
X-Gm-Message-State: AFuF++muBd7sXAJxuq70Y6mURaSc5CXlBYqrEVw9jZUZAq2gVJiwi7tX
	P/rB9uhdab50M8/93lvQ42c553geo3xfQ/dYVjyUX5GUMjKrvy62Y8pBOOw5CX1zT8u66HnLbkm
	v1tQwgg1kXXlB88YT1QZ2SbkVGsooYhfbejq89PR21+snA2Ntydvv5/GZatyNqmbJtx9M
X-Gm-Gg: AYBFou0nDR5oLai4wA8uM1x6k6rDRDaZ8ShcJHKRif+7hd7vdOJY58GtGKt0w4Dh0H+
	wAjP+f9TQ6TeeV9aEvwSyROdUY+cZ2L9bM9DjfbTIqb0JMQD9T01k9Sknp8VlXi6iYHAetKzSuk
	fe9g/sVkSqQs4ZV7DdqosmafxlnkrsJWQPXNS6rcfbZ4q//oqYXc+JndlkpL7R3OM+uC6ERInel
	iHFIeHnlsbJXyue5+hTvvrjdhFzdKpfIeDN7PZ2FwCWrNXMnZn53sEd+1KZZ54D6raDaUk0I8tD
	sOLkDCgEhDmWtmGOaF08pqJaICHFQI6hlO/yv8pM5jSMgTO8d0g/V/AMyo9Dp8EtN9s8b4C+xPN
	2QfWkwvssEOiUH3rYU1m5VUSVnu0ljYPa
X-Received: by 2002:a05:6a20:a11f:b0:3dd:a197:eded with SMTP id adf61e73a8af0-3dda197f7d0mr2506815637.60.1789793211808;
        Fri, 18 Sep 2026 21:46:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11f:b0:3dd:a197:eded with SMTP id adf61e73a8af0-3dda197f7d0mr2506798637.60.1789793211451;
        Fri, 18 Sep 2026 21:46:51 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55bfec0sm3839771c88.7.2026.09.18.21.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 21:46:51 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 10:14:58 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: nord-rrd: Enable iris video codec
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789793184; l=722;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=e91GCqlvcUlMbFlsj0lGXM4SjotkKNP7xTOL1aANvcA=;
 b=D0ZjnZIo+eVMA1MLgdiKSpQUDOrmVryJMUpspf+xga7RikKcNGirtO9wKIPfOGFKgHaJOUf56
 qYnvLzjH1fXBtsOb1JoTogm0F9rzWujrlTINgCFm37rxz0M48TbRwZD
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: VjNOVh1lzTozXlCmylLnttxlckdzaIii
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfX2ml3JIOw18lS
 cg4yGRD11A5hDkN9hG+1n2y0iwUgBOzI/ABlgiybtGr9vcOH8ECk9HUqWWMuKHq9tPYRF2WkHvv
 CGXmPRUUnhTxvESRXYkahWK9Un5Kq5VkO9hkrORVbuJKtS1Wna17IyRtlyIsmSf05NMTzgAHq6P
 +qSpIvQveuCn+Y9FigeYT48dqN3WKzXQJ/iT/pDKLF/ypyIKtFITDLQhkZ+RftNUwkIl8gdoPv9
 kgleQV7v5tRx4CBaVP0CekcCRmH87lRlYiNMKVlzg5Z04VyRYhCDmz5TVowGVnsh9My0rFqOHvl
 1G9cN4Ni6LB0U4lCDA77pTUDCfOtQzd2+AP9mApIrjTV24qcb39dd5bLoF++Tdsg+es0feoMbLG
 dZambGXUCCUmHg1TWrh5Y48zSyB6CiRn2AZb9khKH9+eptR1RJkkHCYz/ztZZOP/MU9SazmJfui
 iYu/8q+FbLOJlmcrzHg==
X-Authority-Analysis: v=2.4 cv=f8Ddl+yM c=1 sm=1 tr=0 ts=6aae13bc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HtMBSpEu5xi8YlTHYloA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDA2NSBTYWx0ZWRfXwvYZqo+2T8Lz
 e0NLRGHzUJwOSzsS8eX2cIevnyIvNQ0WvUG8+OxPYkSN1Jrg7zs1q8jHiIfnNq2Z0AJZY8Spsi8
 J8gKHuoXscNc5Vqkma198nPkIhOL2To=
X-Proofpoint-ORIG-GUID: VjNOVh1lzTozXlCmylLnttxlckdzaIii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190065

The iris hardware block is described in the nord SoC DTSI, and enabling
it here allows the media iris driver to probe and use the video codec
functionality.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 802987da3cfd..6e0b7a54523f 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -415,6 +415,12 @@ rtc@32 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
+
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.34.1

