Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468039;
	b=FpvmTCfUPc81s85mYLhruGq8EbaRffO+jdibgQn5jEfDiT54hmhfryUZhkgx4l003Tpr
	 ZwCdOf0JXu8pbSRnjA3vDZr8JT5TXzVCGPber39HNO8N+jfVbYTraYObPHi44Exz3lcAI
	 ybDTo2PKxaCDYqUYEMCOLRqvaQ2gVa7oEBRyN+rpBlqbXwubk5uFplpD/zpA/5PttVYRo
	 5amy3U9SUkI9UxuRvZiLw1IrnIbRoDsJ8sB56gR2PVvVmzopQ/wOPvwpgQE0pXC9pZVDo
	 Ttzrhdv1R3Jg3uOza1UNxD+1CI93LUmwU5oIzJYMp8Ptu5UxnzfW5oRnyOdKyfqqX4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rwNiXWlFQ2u5PDZW9/aSnB5LCp1bhEw06E4ToHfhjDE=;
	b=hb6SosV/o8zWYirdpQCZeohAclh4HBYnZOKs6uVRuiDSgpfKWGpAEP3fIbWUw0N9+xHf
	 q13OaMarkSOzjYAuTFJptgGEtpvQqFz9Y1SzziyHWdIwAJR9bmrvR6/Ucp8ha+Uwyt1qT
	 9ZZ4TqBHcGsCYScpyWQ3Fmz1oEZrs6Jr7jlQwutI8wyNEOxlkAwzn7mMx/32Iee2H5QDG
	 iXex+nN0jABHsYe2bg74l1v+eJ7NRLmCQSFx3l0smNCUjJRE6nODUpMIRfugAojtyjeLo
	 G2T96DWFKTbweO+ORpRp7da5YUUlgwqcgwpVkMHqvJL0rvONvtHNHGYqYl7mo+fttug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nx8cIear;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QATD8S4t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF357606A8B9
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF357606A8B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nx8cIear;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QATD8S4t
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC70S33022652
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rwNiXWlFQ2u
	5PDZW9/aSnB5LCp1bhEw06E4ToHfhjDE=; b=nx8cIearCKz2M7jUwCP0l6hGYyq
	nNQR4T7934+K0oNS1sC9kAfxW+5MP6Y/jsIGXdZ39lIsKIEEoG9Vpi3KbVT+PmMP
	xoR++p/dg4Nb130XSwcTiKIJceUdKsOG99f6lASdWzXjpa5IImcf5I8rMnIK+Cf+
	hxUOCBm+OIPGacas9l/+N5x+hPz/WmsZCorYKUFLxH8DKfuGuCio84OX5Qbgf95t
	v0HV2NJNJbCkn0YSIOOc7QtH5KHhGo/8qxLyCaPqWnj1eTopghiwtsAl0oYrw4P+
	vjV/QkXtxi6iqWZM2EzbjlDE845H3JG8JymJ/slwv0RwaJqOVg55T5ksAHQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw8m7039x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:20:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b08727641aso320723a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 23:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794468037; x=1795072837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwNiXWlFQ2u5PDZW9/aSnB5LCp1bhEw06E4ToHfhjDE=;
        b=QATD8S4tJeA0mmBBT74w5H1ea6PH4eVxGnt9euzkrkca9iPfMRCX58BCzf0V6Xy0sd
         bQ/ckFwp/TpbHFJKC0JvzHaiqVVL4tgE9ZOL0NzCK3eXpnZRQLKMyYEkTV5W8cdoR+5A
         Wk1u/ZKlAwEB0ChWSuoQlRPDaeDFDMSpTsBpsH0kdiNCyig8Cley+4SZaN6/UkGrSTew
         2q5MWfeqJU48BghtIb+OgmWrs8DqvxOaRbpoi/bQhQhqSUn/NXuye6kTHFCdkht71Fnx
         bcpFg539N02bVnog+cbbPsnDxLVZwtZGZF2OTKnwRMm1ifWPu837J5USQ18x1v5l7HHZ
         qyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468037; x=1795072837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwNiXWlFQ2u5PDZW9/aSnB5LCp1bhEw06E4ToHfhjDE=;
        b=qNUh4KwLk3N5tYp1zx10SbmxUJ+BQfgGks167q1gJ8aO7YBVZj0/PlcvzPAYj5G5gj
         d+h8EHvGxF2XPfnhxauoyD+AqTG5G8bzi9Dm/YGJ4mWrQrq10nuFuEQuGEmfcvtbgcNP
         YSHZJAYzgwW2v3R8ar4a4BLWlss7leT3c5XGYlMnNHfs1V87y9kauQmuqjtl3zJvokFS
         FokQZ9ds8Q6fNvjp44dya3CCO4SH8RdbuuR5nuBbA0NbBchFgrS/OD/xD9wohu7yS2e7
         j3U7NyfZLtH50FCNBOXfULiR+eSJ3wBki143/Itd5MHMDaTuIHmVr3Fv9J0Uxuvewpst
         29iA==
X-Forwarded-Encrypted: i=1; AL+hErHDKNG50Cqs7nGSjsIhMVxaVv6mjFBk/MAUad5oe6wT0BiDNxGOLEX+0X5uczj4ntipTTFXXTgOA9TzGwNb@vger.kernel.org
X-Gm-Message-State: APuU4Z+E+pnJshKFPWeCKG4uTkl2PBvd8o5uqQ3Zyh/n6NLjVA/zKSiT
	S2KEDd+ZhepAM3/t4N92u59CaOgnGDnoVOQawnA4Rjsd5SS20fZczG/7B9aANtQjCONjEOJsWvS
	5sufij9PJ0GnnNRD6r3UFoc6wc9u3nMAdCOWqFtxgqGpFrwIs5jAyIFr2IKlDCP1DmkpidWPCLq
	yO
X-Gm-Gg: AYBFou2WCqd2VJUaOSdwdBCcrtJFxvw3RKJfjIG3OibMcAGnmrev/jfSGPAz3ONJOvm
	ObFAtshRdArLwJpKeqrpY4sU4fkoYD357+vRht0nfOB3ypB0rniB45ZZdZKrJpybEBUjDBbrBt2
	GUpaxzapv4MVKVKr5cZzK7uzRvKhaImGr/LvrpleNd3Y6LMLx2ABJAZqrgBhE/fvogIVN7svhZ0
	UH7xCIZGOMfFwoANo5UXb5sUMonI2B4zOdt5jIAUzM/DXlq72cvboQoNlqPb3ZRzqZcB0T6POFr
	9PtyojW6OhkRnkjZU5v9lyS4wAhTgf/zZc+SkVKwJGmOWeLCtFWi3Zo//wv9fPth0K8gC8ONQh3
	Y3OU1yxYwTiEXaRoh8PcKAkWUSZAW8yLEtEIF63gkt8t6XjfTB9UD0JXP2StTyFeqKJNeJdXqFs
	NOnw==
X-Received: by 2002:a17:90b:134e:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3b182d6a766mr7549735a91.0.1794468036619;
        Wed, 11 Nov 2026 23:20:36 -0800 (PST)
X-Received: by 2002:a17:90b:134e:b0:3a0:c162:51af with SMTP id 98e67ed59e1d1-3b182d6a766mr7549707a91.0.1794468036206;
        Wed, 11 Nov 2026 23:20:36 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c73e27sm3149185a91.9.2026.11.11.23.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:20:35 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v4 3/3] arm64: dts: qcom: shikra: enable WCN SW_CTRL wakeup
Date: Thu, 12 Nov 2026 15:20:09 +0800
Message-ID: <20261112072009.3815276-4-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
References: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
 <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfX39IzWtZG7Hi4
 QStQN5XvPQcQ6t/dN+RwFzfd8/tTO476Z7/y0q52+cqyzbWWbU7FIMPfKuJi8BRdk2Q7hFlaOBq
 OHmw4zgAd4+jjQQ8MjGZxL3kOJyiXvzQlJnxVgH/roGyFCnNK8a3G98UtVHscDZaMEtvJMd1Z+1
 5tp8cqDvXpCrFmRqKwrbd1k77SRriYO7gbYe+eowELt/bSU/+/LX7DpLANafXavH8qMY6MVATc9
 /S606bJfGV6z4ZQ8XWsxPvl3etY9UW7M+SJAfkjFD2cZ1h82iKrLmafc/X06cQ99zls6ZIBPChi
 aYUUWsuR2G0GkIiRdRJQ8zxpTctveDx6SniEComwYJWSY7k41nEjv3UmR7lfdLYOpr+8vjI82xY
 KVPJme19UM9Nf4AZ/L1+knMhZt00QA5ME57gC6X+Wfm9HxSSSty7DOCmEPNkOL/p1zEPkVEHNQa
 DzU0HcNMT9kxWlDj0DQ==
X-Authority-Analysis: v=2.4 cv=WYiZ+EhX c=1 sm=1 tr=0 ts=6af568c5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=GJxj0BfhqkdqIuq2HFIA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: -ZmN1sJC4Ch_23fQMTxKh4dHcDpLsHtd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfX2PiJ5vD34he7
 wNtap+iP3p+/1b+kPgB4HynOgYSALj8XId/xeolrDjIS3rtWjv4XvVInj2oGpnXVQNAMtofjYFX
 /Sbq21UmvHRbPT6EeMHWH7Koz5eDIoY=
X-Proofpoint-GUID: -ZmN1sJC4Ch_23fQMTxKh4dHcDpLsHtd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120029

The WCN3988 SW_CTRL signal can wake the application processor on the
Shikra CQM, CQS and IQS EVKs.

Mark the WCN power sequencer as a wakeup source so the driver uses the
existing SW_CTRL GPIO as a dedicated wake IRQ.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 1 +
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 95eb7255fb22..c7b894b6126c 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -102,6 +102,7 @@ wcn3988-pmu {
 		pinctrl-names = "default";
 
 		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		wakeup-source;
 
 		vddio-supply = <&pm4125_l7>;
 		vddxo-supply = <&pm4125_l13>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 99e974f6ca7e..321bc6423728 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -85,6 +85,7 @@ wcn3988-pmu {
 		pinctrl-names = "default";
 
 		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		wakeup-source;
 
 		vddio-supply = <&pm8150_s4>;
 		vddxo-supply = <&pm8150_l12>;
-- 
2.43.0

