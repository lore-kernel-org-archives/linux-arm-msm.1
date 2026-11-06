Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986652;
	b=bMDZBBYH4/cE2MrM4PTG3q66i/gM5U1kswGIH1j4V1cUNTZFk7QdJ/KomgRXwTKs+OjP
	 wbqK+IUiMB3pKVBMU5895ACCzCgxFvnOCL3hui7NNPiXPMTVNPPFYIZhCeL5Ejn62D8zE
	 71DG6PTCwmQjwxRcZuWHGAJCwwQED2kPuAmpW+UbSUvWYzqm2esF3DKZrS9EOwsgjfckQ
	 5LsC6KU7/ARNycZFSMZRpnwZaiuxGj0vBTTx7/ef+n5Sf+jxejU+l3isWf8ZKUJpAwi6h
	 fG/CEj8SRMdcDrB27/A0rMw9u6lZ+uoUSSuUsDSqcWQP15/rFcrqoMH84vjxPIlCEXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FSWoH1B3xqS+XmwCZlEj6HL0S71EQzHuGTDPl9NCoAA=;
	b=pNvkpvQMe6KLeDBTwEuJXw6TSFhuF0dX1126pp/H5IbXmrFi0+HcpdV0ZGB1Vct1Prnk
	 ruDinMUY8IfodbkC5D8l3D3P0QY+kE6w1sxHMZCqUwz7vOZbJgkhlqrix/WtQa4B/EhOz
	 sVSWw8Px7DcI4hDQDJI20uQH013sqRvj7D5gb442XMLZQYvf9WFoMHtdBjTynk++AJ0mI
	 2JP0df5uLe0nt4wvpdc3ePFdAc6ZqxE9X7Ouc7ApM7EQFAT8llCwPDQqLpSobU7M9jTbM
	 +WkmmnDbIqomfm51KHZ/VFsK+JCrjB3qw/buzudPwV+wwnbRTFz/gba618CF0bbBN/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TQ7V2gyM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eYxGzbqS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B8F606A335
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 17:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01B8F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TQ7V2gyM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eYxGzbqS
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F06PP1122030
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 17:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FSWoH1B3xqS
	+XmwCZlEj6HL0S71EQzHuGTDPl9NCoAA=; b=TQ7V2gyM6iMPqHgI+DTRf65TdRR
	tfCdKTJHDhdmWI7Ckk923laIqq1zSVIVhBT1NbKMKuBUxLhgdb0b0/QmCdqckJIE
	msXYnA446NPHdGKU96zbcUbEHHVTTELZQZ/TUCOjB2qjdkJRJq1TEglD55eiJrUg
	/owUE0Z3LLsYFo+1Jbwd/Z/20G3yZRxG8+EXfDqGOFeipp+e5Ik+zQtBUfu1s7bL
	heEC9cQZKHPlPkp1rlSTyfGoGE9rnk+NPJULpaw6UTrrJfyp2MC1rGTpiM/5BmNt
	PJtTyqy0qPNzqxMg86DUtPMujgqoKDmdg8T2BsJnzQNuOe90vHI6pijABpw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9uxyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:37:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-944101e6367so178357985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793986650; x=1794591450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSWoH1B3xqS+XmwCZlEj6HL0S71EQzHuGTDPl9NCoAA=;
        b=eYxGzbqS3qCQalCYnDYdr+KbJuy2DbzSnQVqqG1Aaz7k7rHGtB+9OTJkrUu8a+ZclA
         acyFdljDZvtlerK1T1JL/Gr7XSQt9kVAGlLVApwnVDSNeP5IZeKxgDAYQvvla8WgFdMZ
         VOfuYKqefkk4PEY6MXKjlGn5HR4+VUck6EUn/sn2fc+ONqyC7U/86YrO2ftCgFrlSVqt
         WgwByGCCDo0/daKEKmZIVKzAJyr6NevkwaAgWYAdcJBv9cchIoMdP2DFhO7+La4IxMMY
         9Vk6DhZkGWuHv8pUwlybm6wonx6Yu+ulsitON3yI52UlosNCe1n6mI5Ug9841YhpDlO7
         R+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986650; x=1794591450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSWoH1B3xqS+XmwCZlEj6HL0S71EQzHuGTDPl9NCoAA=;
        b=nYICMJLsQYZ/mwsqib5Eg3NPFf2feeiKpO716aQ6+cvwVGbWrEs2oaDTxkP+h7LLDP
         a43YR4TgLjWOfXstazIlGzzhlBPsjdSDfrEgSenWtwde/uS84THQeYMpTbA2MrH39i0Z
         4r0PVT8rfDKdIA+IRYCook9Q5pAIiyzrNHDzfRGR5Ze2ah0Ek6tMRa2JDsHSPX8VYdQX
         /5XQ3105Wro8/lEmaBKFzEqRmvOEfdoI3Yzvytvk61muuqqKT4ubyET1bXMYyWmmz03A
         9mA2r/3kk3RZEDbP6JDM2icIBVqk59O23Zn6IJXoyfteCpyhUwcq+n7kCypo+zSREdiH
         p+Cw==
X-Forwarded-Encrypted: i=1; AKwUvBzkL5g6nNNAphx7KAgrXIBQlkERHz2pi3bl13cMPYM88Bwt6DxZroMg4bAN4zx78DQmhsa4GdapOdoGn1It@vger.kernel.org
X-Gm-Message-State: APuU4Z81EOo3+30ZcHbEptD/LIi5xkEMcXvFWuO95OUT8cZvbt2uVGOW
	Ho8Fzb+7t2Upw2s1eO53h3RDk5Onw8lwmhIKBsRlc5b2t0ak5VN7G7+fJwKdnQr34Aq80jL8UmO
	YyY1efGUWyIcSMhgamUhvmgRD5AGHaRTvE0XdeGpM3TrG+ZE7mVISuL0wvqGS5JeHFE9e
X-Gm-Gg: AYBFou24U596/65N5rnrsR/EoybbcBqzMQXTJyR85UIivgplm/4H+xXpDhZsrF6mVK+
	LED+mENFa85Ke0RDonXMHjPINBWriTD31L7MiZRAgrImTTZaI+d2yCL9kpHwY4orkpFpnvKJLzI
	2fjNsKcqsav6N7keCIS8r8Bd/RyGVtStGlIputzG6HRJmk6yGwy5n12ZLh+arsd9B5n8yWCdkUy
	AOsn1cY0vC3WeEY19yJxlVWINzZbj2i/FuQeoDhYUb4TaEVwpCzuYemUrC057Efm7SVWu5pJZwm
	Pac6WvvXATeO0HkKf4HylDjT9GJjxIyarehMz52ZANk4HV+hobyX50pArQHw/tWC4aeXVeX8HjQ
	R5kkZ+zIDv6dxiLgfln6a1JBZN34D2DrAEk1gb/Ud3rdmL52x392BHCXRjajLDA==
X-Received: by 2002:a05:620a:414c:b0:93a:1196:ce5 with SMTP id af79cd13be357-945e17a4111mr990647185a.33.1793986650382;
        Fri, 06 Nov 2026 09:37:30 -0800 (PST)
X-Received: by 2002:a05:620a:414c:b0:93a:1196:ce5 with SMTP id af79cd13be357-945e17a4111mr990642485a.33.1793986649931;
        Fri, 06 Nov 2026 09:37:29 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6af5f0c63sm84256135e9.6.2026.11.06.09.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:37:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
        Dang Huynh <danct12@riseup.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: sm8150: Drop non-existing enable-gpio in PCI
Date: Fri,  6 Nov 2026 18:37:21 +0100
Message-ID: <20261106173719.276668-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106173719.276668-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261106173719.276668-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=703; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Zu0EGxqMzGFfmSiOqNguX77I5A+Rd5yuUAj5togeDfQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq7hBTLvRS9GqylAYZy1MZs4vw5sOSDN77Iqwep
 HNfxJCyqV6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCau4QUwAKCRDBN2bmhouD
 189VEACUl1zynl1sPCOeD8PtdyJm8Pb38cw6x2OCQvaXXxo5Jh6VwK7LA1erYWMOk//WzV02Wra
 fWf0CJviB+BWIY7ZrYnjFSQf38ouCGGiyfHp11luWpdsyz3FrNHsUG4UQbnDWFRxXAIYV4kP7M8
 cMm/U9LkhtGIFSyNleiaUZqjrX19aNPdPo5GXw0x88aqXVfenmorlBMqolvqd8A0CI5PxfrOFKY
 J8qEQylNZ8GN0GLXZpqwnH6JS6h7+ET4/3K+ZCznt6kN0R7WYpHJiDI+RkPwyBfsVPPTN3JG6X/
 muMtRzHs8yxio6eE4DJpCdoHkzWhYB3DL7r3zcCR6RUhUYhh9KKNJdOdeVf5DBPCqCCI6wvSdC7
 tutovzFBI/IU+L7UKKh0pmqTadkpfZvoCl4ZsnAlrPGjKCswJqVkz25Y+SBslm8v7Rpu4wGBzZL
 /9LXBp++/Ahz6j1KaAdcx9TN1ER5BuCPhdFttBOL+lyOEm3wTBGxe4V+2VjjTyt39wd+dlEHVEf
 5jiuXKCtjEWnQ1zdIVIVXMCtRg1L0L7NdUczSrfYI5vF90TZ/rZyHlhdnXrFsY25/ljjW+5HyKO
 3zAWYYLzDc11qoLtx+LgefUbwv22bXL25lpAMPsKGCIhhEDScXbrQdQUQlo6Lcn2EB/Go4s6RhC 5BOZVRFZG/NrLCg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfXw3w7eUKwZ4so
 Ks8nqr5XmYF7CuWgHe+GG/tVWLe2GmB/XMJk6e9lnAk1n22DSAewfCRBR5egH8E4JK8nyo0Ti85
 IkZXl62x957r9AjyoDeyRP0IHH87dlg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX8NIkboJocwGx
 qXMYyDlvIOczSzZY1w49rvTRiQfwrjlyPH/gM+3ID+q2O37i67VaMgBz1VOraT7zPmGTzynPB9G
 2P4uHla6XuC3Knr+djjEk9oUbHak67ISngBGKmmirmWBy8m/+YJrmwKQEVevOSuTmlCt/U5LY1A
 vSjeyi1X43e3OBFBasVO2pJqVQHWR+ABkMwSjR/QoX7chglfX79ut727EauViCYtpW8R4CQgNYk
 zc8Jd+lVmOaTmxTZVfnUvP3wTziZTVCQeNtqB07Pq3C6VpGkBtGOkdw/yVVXLHquvdphh9XRrS+
 Q7xl8UCRgs8SXGzl9e2iM71R9wU3IkiqKEU/mP00oAYXFNmUhqg5B+mH4kgkYg3SfmMebXOv3HC
 T7B8t6qGtxpUiH8BJ4kaG9YRkie1NZAFHG8prjT79l5uvaRuGL+prj/O7rS9hcB+89KWULHBuDF
 W+aGPAcADdRevG7qPNg==
X-Proofpoint-ORIG-GUID: mKQxjwUpLeI1Hir8AIO-mF32Os7m-lup
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aee105b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Yf3vPEn-BI-scYSMMdYA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: mKQxjwUpLeI1Hir8AIO-mF32Os7m-lup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060070

Qualcomm PCI bindings do not allow enable-gpio.  Linux drivers do not
use it, either.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 293fcbacff34..e62a3005134f 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2019,8 +2019,6 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			enable-gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
 
-- 
2.53.0

