Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F5B471D00
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 19:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093682; cv=none; b=CS/sR0GRhACLPewK0HdyjKZrkuqrNOob9PN/qtKM0lTh2fwWNeS4TSr3T9WyVgf+toq/vhqLmVDQ0zYIUIK0O30SstqOMCUgUyvvFMndT4XHJcj2k3ilCCaxhO8j/mfVQxQiiHTqRNaO6Ev3DotcXRjNmB409PUbQYsjsEta3uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093682; c=relaxed/simple;
	bh=fxO/xiDqt4Q9HLM13EvoQz7orD8NRiJ09tcY0V8xLf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TlKdQ3DkEpN457bvosLhMoTucFi9EhyAbOkCQ1ehIVQ9s2gT53/j6CE28HMpPmrCIdwLINmCIStXRXYRE4n3LZBVIuqoxZtXPg1j3L8k8LBZ4SidSOfXHmFkf3NDzp7qU4U/dV5+d2w1wcT5SG3mw0uCCL18jXb4/RxnACdH9UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVY+fpfF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJlFAe/3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVY+fpfF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJlFAe/3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FGmZxu4100189
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 19:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lxDEUtukBkR
	5ztkVa7yWIfITvS3aKC+Wcb91E5VOVqc=; b=pVY+fpfFxNPju1a19PG5oQq4HKD
	DVf066FS/yL40RmZYbNfYoZja6EJzutvBJkZ2h1DJCtbKw5Byx86Tj4s1p/ukxzs
	ZoeT1y71mVqqQ0Grdgns/XOBw9DgnTQ9yZFe+P5KMW+WFxZMm/lOhEzG5hx6M/K6
	EUO27XOE00aUqS1PCdGiVDbL2LK2lbYDi4GCLD20gcdhSBBE5HY2Qg6dzEUAPjZv
	MrU0PsF3PKtdx5nBNbtcCjTiPzrnWG8hb4VUiKu2sccQMUZKY9pIWpPzLZT0Ov+Q
	Rx4qT/IL44RJqhK51fLGi1IgTOQ9DSCK9XS2tPz/MJdx8gEz3VcWbB3FxWQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2ra7c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 19:48:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179a556c43so116960406d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 12:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792093679; x=1792698479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxDEUtukBkR5ztkVa7yWIfITvS3aKC+Wcb91E5VOVqc=;
        b=CJlFAe/3yCON3NbytEEeWuQ/4jAyf8ivNhiR2c7fApWNvrcA+AFezkDpE/awbIDXe5
         ettaGqxpT1H9c7PQxyqC86VDt6TdzZSCeAw0HHiQX7GIDzJg/UUgAxLkRXQMlN16qbKs
         +PfCqKTbk5GhxuHeHRWylKfexgml9CKa3ATzZklZcYBmtMeSf/FoUhFsQgfeChrDwq58
         SkYXVdBgVB5UVwaBp3bzgKLoRkmEinpgDbuXtWemOJHPAxWVZpRzGJgwSTL+AECvH6+L
         S4az7Sd3OnJTl+NQzxhjnEb6JO+3QUWubG3kHTHP4Nldpl1u36MsR7+cmulwdywBrQwE
         /mvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093679; x=1792698479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lxDEUtukBkR5ztkVa7yWIfITvS3aKC+Wcb91E5VOVqc=;
        b=c6l6fNbjeIjhuowiKGy1LKn8H5dI4oel0w3xkPiT+uvj2Av7Cs3bmGYinc8onMq6Ib
         IL2AWNtmVnOnTqXmcifW0MhmKGveUvHy7eGjNK9vGn3vT3mVcDtMtAqdhIu3oIvkTvj1
         iEOfO0Q2vgCZS98a0zL+3huLH/Ve5J7y6aT9XDlly/JbQqnZ+QksZu9DPc6mM6x12ABl
         yyZyZX2bChRYfw7JX9R2Utda6yQaD36O/JJEee2GeD5A+imFh8DOVKh2nLHInxqXnAJk
         luuuz1jkKwyqvSn1/y1GZB8LCVCKUNq1cPrE0sEfpWiOskuUNufV2HVY1YyqOjbpDyww
         cX6w==
X-Forwarded-Encrypted: i=1; AKwUvBwkZmTev1/n0i5Fdzc2ftTE3ShBPhE1t+1wYbN7HOugcWg/AYXdFwXM5a1B1lKKBPx3KNGpoKCkwP+9dtQN@vger.kernel.org
X-Gm-Message-State: AFq9FYJYOgF3KNgynYa0MLfJkUwybaEd0nBSel5ETySzpFwqI7Lj5v0+
	pJrGmIrMFzpVioBBCFzghrIbnLGqAymp4lJod/e7v8243FdTgYkxL18DsIaHfrvf5q8pb4+Fp9l
	0eNbaxkzr5oLI6HeB9ApRHC8MZyofBHB/SABo92g+g7of8N0qT5ZsBci4/kGZHlLjb/Fe
X-Gm-Gg: AYBFou1f8VphfIlmBslfaqlt3GB5UC5hcM0tGylMXhqKiIuEvQ9TjINfKAkEsNUuzEx
	FE6t1Ovtkvm/5Gp3gHqGOODGSc8hbIvCgWTuLHohgLvQqWDsZ89rIWRpxnZzA9sxVSnL6AdSGTn
	0BzxFFOqWIIe8qe9yEAUD0KgTdRDGlnesffCtWGsMLR9dTbxTp7BpTJElBM0Sp5KZ3N7nwk5gki
	E7Jh+RHpeEIBgGcvxK5jwTtE+ykYqYLvSlug3+X+uxu+1Bhg8F03hXUb7xLmJdguqTFPZ0hwA0r
	n8G+AQPlnbEU1zQy3Ew+y1KJRsEgJ+w+TNccPTZtS4vYKXa/mTJuO8lFqgR+EDnoNRdAjomajrh
	dRbor2fPui1H8
X-Received: by 2002:a05:620a:2248:20b0:93e:c12c:9dce with SMTP id af79cd13be357-93ec12ca060mr2243953885a.78.1792093679220;
        Thu, 15 Oct 2026 12:47:59 -0700 (PDT)
X-Received: by 2002:a05:620a:2248:20b0:93e:c12c:9dce with SMTP id af79cd13be357-93ec12ca060mr2243951085a.78.1792093678667;
        Thu, 15 Oct 2026 12:47:58 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c4fc4sm138027f8f.15.2026.10.15.12.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:47:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] arm64: dts: qcom: mahua-t14s: wire backlight through pmk8850 pwm
Date: Thu, 15 Oct 2026 20:47:31 +0100
Message-ID: <20261015194732.64428-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfX4hbtA1bbMKZO
 c2O4h5OwVhoDpr0bFZhCtoEmDaQveLyYduJU2yLhvIXwz9Bhiewyg/Pj8qob4G7GoWlmMsDqEvI
 uU/+PwTR0AYhtXPfR6QRPXr1VMORodE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA3OCBTYWx0ZWRfXxA+KWbK4Rqza
 0nYGr3Vhu3NK7BzqPo/U+5UcoTSQugTvPk4MFooMbqODKdwYXqOCnuvSI1a3MleIlOzi3Uonw/G
 wGndG3LpKTXj+mCocUFpoHTjA8DUCnQNGk3sVeeWQ5/F7xtSw4kSJMA3YecOnbOOKNna31LMkUd
 CM5Gs28zq4kbNvNJunVQ2geSjqHgSN6NUdas7QCiN8of5ty1xeCkCtp4mhHeR6cWkmkjeX9Z43V
 3z5X1bZcewztIkbdQSfxTxW9fmjrMDMiCN/ORBVKhFAGiSv/X5kKmPtFgbCf3FZHwTcmExRpxpF
 B6F3S0aMv5p069dspAlHBXwcbipWp61c7iv504PYh4FuFlrmJuTh4T1qUxzSimkcn3Wl22ofa+K
 HDToir0aTiFss0gYePHmbifv4WzeTmYvw5q36oW+q3soogBCNU0v9m+Lx3mXOyeAeE9kKdURsgD
 CzdLyG0z/MHgNDUnZ4g==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad12df0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=lS6zJmM_-713XfzwtBwA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: t_55cVh-8oxbuNWtqIiwy9TzgWYpVudD
X-Proofpoint-ORIG-GUID: t_55cVh-8oxbuNWtqIiwy9TzgWYpVudD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150078

Move TLMM 18 (EDP_BL_EN) out of the panel node into a pwm-backlight
node and wire real brightness control through the pmk8850 PWMR output
(EDP_BL/PWMR_BV_PS on the schematic).

panel-edp was asserting EDP_BL_EN before eDP link training, turning the
backlight on ahead of video. With a dedicated backlight node the
framework toggles EDP_BL_EN after the link is up; TLMM 18 remains the
LED-driver enable, now gated correctly.

The panel takes only its 3.3 V logic supply and references the
backlight via a phandle. Brightness drives the LPG/PWM channel on
pmk8850 routed out via pmk8850_gpios gpio5 (func3).

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 26 ++++++++++++++++---
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..be094f9a6ef2 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -39,6 +39,16 @@ aliases {
 		serial1 = &uart14;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8850_pwm 0 4266537>;
+		enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vreg_edp_bl>;
+
+		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
+		pinctrl-names = "default";
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -773,11 +783,8 @@ &mdss_dp3 {
 	aux-bus {
 		panel {
 			compatible = "edp-panel";
-			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
 			power-supply = <&vreg_edp_3p3>;
-
-			pinctrl-0 = <&edp_bl_en>;
-			pinctrl-names = "default";
+			backlight = <&backlight>;
 
 			port {
 				edp_panel_in: endpoint {
@@ -902,6 +909,17 @@ misc_3p3_reg_en: misc-3p3-reg-en-state {
 	};
 };
 
+&pmk8850_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio5";
+		function = "func3";
+	};
+};
+
+&pmk8850_pwm {
+	status = "okay";
+};
+
 &pmk8850_rtc {
 	qcom,no-alarm;
 };
-- 
2.53.0

