Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2793841B8FA
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786016646; cv=none; b=W7y+XiOuFVfN889ixBSBClNMb+shxsXQzfIAVusTuNs2CGhDrvkn/K0wWESCbnrN4sYSEfZ9arAgMoHipq8XBggXe5+y8nprlS/mJncPgWfh7P5R/LHtTSnS47HAKIQSoSHCr1r0ureQK0kB4Lio2kCGGVqgHGSPswjJ6Xf8Rso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786016646; c=relaxed/simple;
	bh=BsfY/RscSrIjGVNJpro8koyU58IFtSj27D+QRreyTuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VX0E1hbyE0+o2f5ctInUkf0bVYbe57oYTAainK6ibLwEzHtVjtr9Ml8WW91SsBuVZDCtxvLpWRp78uMYxh6uO3F8YnXHFe8huQo4m5bNogJja4osnc7ztYFSmJ7bH88c1BEmfszwLMFvn2fy0YlqwLII+6VhWJLGY3F/SS/IMD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8I2/bok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X/UOvKEO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8I2/bok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X/UOvKEO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nkUg1228244
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 11:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zX4QSvPuDKSNtDICym2Q377USad/9lq/ZzOdgxDI8/g=; b=X8I2/bokvg579Grg
	p6iuuu3t9iiXVg7qF/WMUz3MvGU4h7/kgvBGacekChzws2uwQu/EuzQ9VLy6G8UG
	fUvfcT67dtVpfKfM1NP5FvPf2cU4KBZOE/0uEBqluL0z+3gGiKpUz+/28qJBE7dl
	q5iLcsnFS+o1+fUhGvKHhvXveG32kJ0LSvx8GmV0OPK0sg1o9Nfl+ZU2xqdIgc31
	i4+V/tskd1n5JH8aACgNTBEtlY0lCS85c4U228t3G32cavEc/Rxg1RWyxHPE2+j6
	bXsGCFASl49rVwk+4yNxBoDT0Fd2gZqbwstf3h/fk/n51OZVUS5ZjbVe/ojZ9aMU
	/DwfgA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvqdugpwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 11:44:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84f0d3ab2f4so1825219b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 04:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786016644; x=1786621444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zX4QSvPuDKSNtDICym2Q377USad/9lq/ZzOdgxDI8/g=;
        b=X/UOvKEOVUrWpaCcXpJGIRnoDMQwjpmnQaX11XeMeWJN3TVHWSei7p47ECey9FZRf/
         0ZAsnR7nDZ4WEZIuUTNF91GujuRqwrOTBZsEQEBTc4JZHaRJe0+4xNnIvOpKzYr/PHIE
         Eu6+LjcyKTUEmQgcr9HO3nONJ/BdMjva6uoCLdOiDka5JOy7omtHn0iR4vz+FCZyuHBB
         iRFfpEojZgvSWUqOm211QmsgP2o7tttN+pA0WTGTlI/6VvoC+j/ywk0uVYFhS/l6sirJ
         yGkX5iSfDtBfBuxpvKoACPjZ1wkeRi2lEiYzy8O0eTgKKxrWdn7rxiVbeAMVu6MgNXjC
         4u7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786016644; x=1786621444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zX4QSvPuDKSNtDICym2Q377USad/9lq/ZzOdgxDI8/g=;
        b=PnoV6gVr5i0vK+lLGLWOxd2g5LHcNceRAjxtIkJJHFfWYAj1rGOVGBXlenSA2t6pFP
         pCMU8wrBojHYp2FgF6uC9vFZipD1wl1tni6WiOfHSyVdDlSTbgOi6QJ/zMuv13a2dvHK
         ePWk8OxhCdnXpveIeKST6Ar4oDE8R18c5SYoaOgSh+rIhGEIfOjaW22zlXQEH0R2NCIa
         YE7j9/U9ym841nxRzzIOjiw37Z43a4NjJgavBbRW6bGiIkmLGYQA+tRt8fyMsvZMCtw7
         G+R0TbcxWwnPX5KAJ7OYRz61P4EsFWDBajyYzO4Ml3wrQkUPs8rW6ndQNLRmS+VgMdGN
         e1/w==
X-Gm-Message-State: AOJu0Ywsvqs8KCLFsRey2u+4r+euIMd03UZwbXcZ/NCpD6dIX4YUrzSK
	9W/VUjdvCr6ZDgMTAMyLETKEyorhf/VBL+1yb5e5GyieYgt00zFLILCWnFtqwpd6LSnGpTiAqel
	8mhpOWQxnclzj3YXejyhRQNUOG1aij9EqnqiHrQtl6fxsVCh6yDdwLinAv/hIOVBkWJQx
X-Gm-Gg: AR+sD10lsJyx0YhBXkuQ0cT7xBfrKm2PNk4ouLSuAJRpMdRtj7N8yFVWCBiLfe/QBZ0
	Phgq3OnwASinV18xf5w+3hguA4ShbTnXwGPO2tEaQO0SAN2xXnNwdF8zlc/y/Ubn4D3vYRk5ceZ
	kuI8jmZXue0DM8P5gFJqoe3k6LmMK9LTMkdCBMwzOpCh8csO4wue+d/W16p4dgQFaL3y+cF7Sud
	LZS6mdybz/pvP8pwqixumWnPkimcoGNfeTgjg7KkOulxh+yVzyxDq4hGSz8y+lEejwqnLQESPzf
	m7LIlYwnI2uelTtOBCRK6dtYc5Y0UiYD0+gGNSRm7HPAOIh3qWEHasgQmhTOzxvZPe73hqnRSju
	FLGNmFmFNgaduDH1Nm/kC31T6h976JdM=
X-Received: by 2002:a05:6a00:a1f:b0:847:83bd:6671 with SMTP id d2e1a72fcca58-84f2e04a630mr15131077b3a.19.1786016643855;
        Thu, 06 Aug 2026 04:44:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:a1f:b0:847:83bd:6671 with SMTP id d2e1a72fcca58-84f2e04a630mr15130998b3a.19.1786016643390;
        Thu, 06 Aug 2026 04:44:03 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b75dcsm1234756b3a.34.2026.08.06.04.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 04:44:03 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 17:13:28 +0530
Subject: [PATCH v7 3/5] arm64: dts: qcom: shikra: Add pin configuration for
 mclks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-shikra-camss-review-v7-3-c7360fd6a5ac@oss.qualcomm.com>
References: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
In-Reply-To: <20260806-shikra-camss-review-v7-0-c7360fd6a5ac@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786016613; l=1547;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=BsfY/RscSrIjGVNJpro8koyU58IFtSj27D+QRreyTuE=;
 b=5iO8ro9F0y5HaNuqHqy2tlRv6TBHqL2SHdP2suiPVV+hF8RhV/0nGXdaOKPtwXGRmfsPDDos9
 UzjC301rQpYBgNf/2I7PodACkZnHELG4/yUPGlSJmdb+3CNA3S897gg
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: giBLtmyuVOsIWDgpHkKm5DPZ64btHXL3
X-Proofpoint-ORIG-GUID: giBLtmyuVOsIWDgpHkKm5DPZ64btHXL3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfXwaHSB4zfGths
 LeQ7AFTtyh3RRPQAciGVAhhGZeYlZaHfJ2WFAWZNxQ29euq4Jk7J7JdbfiZIPxHOZevfkRG+Bhg
 hHnmyaAb/0aw0MLXmnNxDAKWa4VfPBf7G3n09mOU+DYg7L20f/39rMi3jaKURwBSXKMiRGY+/0G
 H42m4DjvIMk1mqKmGOAUiF+pjHTJVsSuVm+7YkE/jgGx3fyfkXT+4WTn740mZkZB4j7FG87mFue
 SBZ+ikrhM2INrQmn0aWtTkgI+G/a4D0Br0yVfFOPNvtLQi8Qd2TWKo3xTBjYcq+osn4f7UjujMc
 GcJRKFfRY0yK4qj0A5hwYEEebsVjJz4Y9ejNcHKilgGxyTkPL3kOoU+DA/JaFJN/1TAlK4mnxxw
 kStGIg6GBlQ16T+8zL0VZqtvNXKbBfhhIYZljlTGBoPcemzng5X0OSeYxjh64QuU7AckLS2gKUK
 OjMF57Rc8RRkt97GiFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA5MiBTYWx0ZWRfX7oFma5YiTPTp
 acZSS3HYzMupHlMo3iafYMeJviPtdhBVnB4Bc/FrrztjpK50SeG/JbXlqLI6ienJZW8va658W2M
 3z3yu75zpoVYYp7Ei/e8tfp/OvkGFJo=
X-Authority-Analysis: v=2.4 cv=bdtbluPB c=1 sm=1 tr=0 ts=6a747384 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PMLJDkNcKfHmOO-cHakA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060092

Add pinctrl configuration for the four available camera master clocks.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index ce5887b9b1d4a186fe967779b9615ab4e4727ff8..661eca4ba85eb83f776278a6750cb969a409c974 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -827,6 +827,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
 				bias-pull-down;
 			};
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio34";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio35";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio98";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc1_state_on: sdc1-on-state {
 				clk-pins {
 					pins = "sdc1_clk";

-- 
2.34.1

