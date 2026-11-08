Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794143959;
	b=xlC4cs1Ww5ewa1RU25ORP6Og2X6FcthrnGTD1Q3Rci8e6Ze3+PaSaHCY9G/uhHS4pAhw
	 o6YODUwhNqCM9mgaTS8SmTMY8ZTuc+gg8wcqPG9CKi+m8JBLrLSLuqTXYOvliREKR88uF
	 ashLy+vIo4BSQGFkoLeZDKCfXJNuXcc1RQzDOsxv7pdOYIW6LhtzMUOwPMUgmdFzI6qa9
	 QIpmIc5gDQ8wGrGcEk0gt9VOZvMR2gk26wTiVttAFpgDbp+7FnD+96a0gqO/23GTVZ0nm
	 SpX0fzCZhm4m9HwJBRsc3fJnT1FnFqRdp5tDFfjyX8X2yVOSF3Tj7javc7hg91vgMIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794143959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=p/lUPGTPC28aT7+PeAISrTjJA9eq7snKjsK80BxDrnE=;
	b=x1Qj/S+aQflx3Ca7TpDYMcwmBGo7FDR9c8/5W2KPa5hWfhXMbn0aipmYIo77vHkDTrlL
	 HbcBGRZzsv6OqDB4ijizB/3N5bFh+8SYF1EYxdzjvws7r1T++tBWStNhVQvxek8ISF3q+
	 8N1W/zAqvFaYlbMVRvsAlHkRphrbuZ27st5U8DEiR7cbJLaUb2wIscJIcFr3NPDUdQgIN
	 vp+KcNAB7zOTV5fQn7oXgfMkpupciDMHj86gYI0T4SEJTm7WEtMEXp4WPdR6swD0gQJu4
	 mj7aeOqtyieIn/Aya6GsiFI+QolVJhUE/oiTNVvlgzOoE3HOXIE5qk6n5RUllC4N6uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gZaDpRYk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AFPD2K6s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBF2606A326
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 13:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EBF2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gZaDpRYk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AFPD2K6s
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AfrNj1199194
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Nov 2026 13:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p/lUPGTPC28aT7+PeAISrTjJA9eq7snKjsK80BxDrnE=; b=gZaDpRYkMHh0Ss5e
	j+StO+2Q5fi9WoSckpNGxZdDF7nzVTeNZG3ICQ5Aqx92+rKbMhNFVf0H8Ac76LYw
	1bWjeL67DpdGQRxyyurDaUoTI9J8s0vOW04e7+PEaxo/KqPIzUBc+EEjK0C8L15A
	PFC6yULyxht6u0e6joYzAp7U+pI0ui0pJnhua0WYL/+EV7IcttPR6DLGezdj/lZR
	fqoCBbZYnkR49cx3kk42FN8dVrEfXoMSStKoxr/fH3W9IzZgoxcD8WV2OTKwiYdI
	3j62I17vVT908+yM7AEKDJJWdXv+lT9YJB8RNNiS7HgyU+uajDT20N5CDHxeLjog
	JfBmxg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv732wjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 13:19:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36fa5673fccso454526eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 05:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794143957; x=1794748757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/lUPGTPC28aT7+PeAISrTjJA9eq7snKjsK80BxDrnE=;
        b=AFPD2K6sMXtvsgwhYwtNEeKEecgDvwpv1Nc50jnDKr9VdaItzEgN0TuzCSxhHx4Oc/
         rj/w8thcxtvSHkjcXuPa8qqlH9NjU4I1h3M67ScRZHnKjWBQqMiq6oKQjLDhH11iK1P3
         itW+i7+R6Qfqwids2cUPuZo/AMPteJaJ2EM1pVpM9PB65m/stfyVLVAEQeRpDE4XbtCV
         V0ZMMlLtul1CqbTC+RfIZd+URI0+LpoRyJ2kQFAQfJqTgWvfRLRplSXVb4OU67hbiKeK
         Wu4CFZdW9stRkIHvcvExQcD24Ul+AgKOYt10/9eAM3JD9ssFkMgOmvGeGm4jKM3PsYas
         jq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794143957; x=1794748757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p/lUPGTPC28aT7+PeAISrTjJA9eq7snKjsK80BxDrnE=;
        b=iInJC0JtUDgZThwpWtMcjpgwPrX/m7ZpE5fp+OwpNfmU0sCQRe+GNvxjmROARzSvmG
         esYark+FlpcxXx9te50tjBCLHSF4YpR51CWX/Fzaww5o3NbtwXhZTidr5o9e8QaJYKwY
         VWPLtDWojvn0vhjpcaKtIwMcWzUrqOm/LtyVqKFUy0CPuut+/dU+WWeWTF5PvA3U2c39
         fTtGtBE/TJfP/817CQ/PHNi54TcDU6z3+dCwpGjk2xg1BE37n/R9jWEUHZ7ub1Mn0cjF
         nggsXaRXw0qPKF9ZFbtI3JZB91tn4MWm38iEB9s8dB7KTN0UTYpK6i/FSfHP+algNVcb
         gyHA==
X-Forwarded-Encrypted: i=1; AL+hErECE/b2VCXHgKNf+we3y/0ya1rLCb60LVz6HQinw0KtD0nN6j04fujSy7vuFVtc3vw2tq7O/4Tt4AwViQBq@vger.kernel.org
X-Gm-Message-State: APuU4Z97c8lfzAjTf5Vu1u8M+vSWOSMg3wbA1CVv2vGqRZd8cOi7hQkO
	69Yl6nsS/6rATheKj5X9UBbW//bNR4l4rIsVRJBDRZlimyy5LaSj1CmsREqk5HZZyW3QKDG9Z97
	HOOh+FMdEUrMHE58EqYn1WYdzcC6KXKyvjbCEYQwoEAqq3+1o6DF6fsZbax0sVbzy9vI6
X-Gm-Gg: AYBFou1XpWYV04PgQybA+eNEO5KDOqowmJKSeXEXF7fUzpJE2nS5pMu4O+46svxZ9+F
	vSOWXaW7eaYhFW/+++eC9zMgkoyGWs+tTObztgFnjiPCtbwygeOVIB/3p8iOdn1Gybc9F8NWlJ1
	nCz86T1dTJNFTb1cbTmGqDhA7QKZn5C+m4Cx6XiWJvessdRV10R9Qg9alkK+ty270IqZYCF+csX
	9mkHzcpF9H+uuiGxX37swU9C+sHc2eSTNXRptE3+d4gD3b4FepMy0l4W5BTSAHsvszjJ0qtajRl
	k2GQK3x3hPC/7Kofde8ODLaYvfzJvCJ67P06DXG9KyBWwf4VZq1Tg2iKxhSGDVSVJQogX7xbmyX
	xeK6aUiHQ1wNE0f2vPwt+SntpJnpMKb4LtPE0dFKcWMhRQo7N+AoocGtYRn9CgUEwJPYXCBR2H6
	aEFhg=
X-Received: by 2002:a05:7022:5f11:b0:1b2:4e2c:6838 with SMTP id a92af1059eb24-1b39fe879b7mr1875866c88.15.1794143956884;
        Sun, 08 Nov 2026 05:19:16 -0800 (PST)
X-Received: by 2002:a05:7022:5f11:b0:1b2:4e2c:6838 with SMTP id a92af1059eb24-1b39fe879b7mr1875834c88.15.1794143956331;
        Sun, 08 Nov 2026 05:19:16 -0800 (PST)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm5336980c88.13.2026.11.08.05.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 05:19:15 -0800 (PST)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 18:48:28 +0530
Subject: [PATCH v2 07/10] arm64: dts: qcom: monaco: Add support for TSCSS
 node
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
Message-Id: <20261108-tscss-v2-7-d5f575010427@oss.qualcomm.com>
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
In-Reply-To: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX9aSLeAlYGBZD
 Y8k/xxDim568e122qE8ENvCzBysBo+q1vSpRFIF+6tAgS9y8rPN8pYo/ViJvdEDeXQCpEmjRO6v
 xNgxxxI8Y+mhnj58ci4iaaiO+z0cbwK7XrwLTC2AU07+LmWrA90z+FXDuMMkWElPtixBOv3oxhN
 li3k7kYGwPQizpTAvpK++NxPM4nqr8qJ6ZJ6F0ePgq5ZmyNqH50CcHYN+EgQuw/eUQUUOYUfaDE
 vRg5Jlh7DfOSj+peAuujWm8mhwqwdq7Ofg/EuRnXPhCAoCR7XKZdJ4CtTWAmuJsxTcFe5FEfmW2
 H7N2yyWbNuLgVDrvFK2nFw9dZR2RV4Nt6XK8s3pr+KLqbU0DIdGl727TfNngY/8dA2mASesxh+U
 N+hUxOkzq2OZceY2FGOOSc9LHCW9GwGuM9kLPLjQ8SpTjDoMswxQFweTVIumhHBHPHLRQVz9Fe+
 9lb/dv0inBOwqw0yDNg==
X-Proofpoint-ORIG-GUID: X5Lw8H7fqIMjhFi-_zFSULiNi_nhcHrF
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af076d5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=03a50ROZyo0H9j-jB2QA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1MiBTYWx0ZWRfX4o2OEy6yL10P
 2EZeswyZUknlwHgDCf+X2mfI+6vPqnNhfmX4xtJPmdOFf6N8ThhFr6BSOCZ7YaCD04RggKbmXYg
 YHFfkmGsCDxakEy1A1yGnyRCT3OaR3A=
X-Proofpoint-GUID: X5Lw8H7fqIMjhFi-_zFSULiNi_nhcHrF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080052

Add Timestamp Counter Subsystem (TSCSS) node support on Qualcomm Monaco
SoCs.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 35fbee63d4c6..b87ba4b3a5a6 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2628,6 +2628,18 @@ pcie1_phy: phy@1c14000 {
 			status = "disabled";
 		};
 
+		ptp@1c80000 {
+			compatible = "qcom,qcs8300-tscss", "qcom,sa8775p-tscss";
+			reg = <0x0 0x01c80000 0x0 0x2000>;
+			reg-names = "tsc";
+			clocks = <&gcc GCC_TSCSS_AHB_CLK>,
+				 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>,
+				 <&gcc GCC_TSCSS_ETU_CLK>;
+			clock-names = "ahb", "cntr", "etu";
+			assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
+			assigned-clock-rates = <15625000>;
+		};
+
 		ufs_mem_hc: ufs@1d84000 {
 			compatible = "qcom,qcs8300-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x0 0x01d84000 0x0 0x3000>;

-- 
2.34.1

