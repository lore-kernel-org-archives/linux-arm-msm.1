Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE60472070
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250070; cv=none; b=LwT99qZGkAnEMyayL0gYJSld05jUt9T1inB6L504G3eefU1tIki1Y6nPNVkrgcqMEG4MDvJOuTDY7xu4Plrzu2xQTmi2yFc8C35Uo5c2gVqOSKm3CmBQmxD3Pj5kkVzYyERHl0EVvWh8XNDHuZVNAWNNwzMkyZPYC7S2Mu1f18M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250070; c=relaxed/simple;
	bh=UoWZ6TMFmWJFZ4O/POChI611r+ZIq82nn/iwUb724B8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AbMv9D77HljmYQLaCKM0YOHqaSiyYEwGIlYzqxt3CXwGgQIx7aMZ7drTKZluoV52ezgZdpoNuROTs1v0FMk3JCwcbCNPfQsjMi+ZSxOqwlLWvHFulIT2H0Ab1UnlcVOO8mjQs1qYCrj7/D0p1i0RUcmY4rvw0tPAvjcyX4lQn/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AxflbmEC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gwk+rlmy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AxflbmEC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gwk+rlmy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179O6L2321943
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 08:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VthTsFAOIiFAa1hk8/UzDRJb1bvhW1r0SIVjbBCIy5A=; b=AxflbmECYybRtJry
	KVU8CE6+nRIu2fnCyI8veNSG1hjMPrSsxUZrt9bexW1tq9uvz6fY65THHmECvoKL
	7w1zpG7/GQUSR00Mc93+IrF8V1UR4zHX8uAY2L9xmxxwY7Nx89S/zaWTugcsIW83
	CKWlDJewKBye/8vz+qj7Tsqq4iH/7eXpaXm/sBGhag0gVPHPAaArgcdgudu7hhlx
	XAblabep1cgk4PGQ0e8eh07YOfE2sKVcOk3veZbhlZdVR5yeyesAU1hvE5Xcc7UZ
	DiiWu4Kvvnm9IVySKz/4A0FZ+KPyT6XcW3YdJ/Zu7fBRf0+0kHu1Mz15ubK/TrYd
	u/MMQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchau35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:07:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390a2c895bso996230885a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250067; x=1788854867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VthTsFAOIiFAa1hk8/UzDRJb1bvhW1r0SIVjbBCIy5A=;
        b=gwk+rlmyN5XfA4nD+RBg5LKJN+Ch1Z4tIE80yYWaIidZLDfGzdlHvAU3unjybjYPs5
         xx3J06D5zEeN4hhvE3cqt5UDKLaBgBwedDmiehOa/zaMfAuzUh3Gn4AaCw2T6AR8BQqX
         lv3QDE2Sn/ETzBRGkxJO02X8+O2yJkzShfO9uU3IKUdXt5NiRtUKc7TjcwezWc/Qiuks
         kgQrR0JLhVpA+7+80ZxyLM6ztjpUnLm6dVBKzejLPXTmyGh3Ckax/YrqTY0caI2509w1
         51NJ+ubE/TuMRxokKIoChHYWa8B7gsUPDrHcDSw+Aus4RxvIwY/KvwvWm4dVwAtwmoXc
         kXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250067; x=1788854867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VthTsFAOIiFAa1hk8/UzDRJb1bvhW1r0SIVjbBCIy5A=;
        b=fjkNvjhfNfga7P7zETgH/8SozcGpg4gQTEPICHzV3lpx9UwxvklimzB/0YIM63OyEI
         BwdoxAW/YAQm2uMRhwy6gl5hKw2tUIgv2yQ8zxWhCE7kdoPwv42LHLBdSDFe2Jl/v/C3
         Rc4B4o/T7yVZOnmBE2uKZr8uhd5pWiyg4UhCHeXIy8iwQs8P1aE0ohbbun+nZo5murzR
         mRiQ0uSN2FqNjasCTf1xaAuV6iuRcVvezF9V1u8ux501r/anUFjdNV/5Da74QLIGRGoo
         EsYupWTBzsQ+EA/gKoni872YH0huU/j4vbKmm9qpfTmefRCv4jxe8zlnmlHK5atSbRjB
         PLPw==
X-Gm-Message-State: AFuF++nezz3YsLTO9+lbj0nu1a8POP66rLpRsqcM/X1RxDl+fiBLWfPU
	v2Q/cDysZVRljSfzMU5FqHUZ2bB2GZAGWqLwpjEdZuy241Ytjfaf8X7V95i9r5GIMlU490WjIHM
	y4KrWkCGrLoj0y17f9ZZLrDvh9P7Ebh4IJ2i5ZsyEKcmia9CaPVyg5/9yN/gHh8oZv7ed
X-Gm-Gg: AR+sD10zu5m85mXNmfnd4xcFs6AAx7n0m/VLs3eFxStOX6+pidpJil6mXpXtAyvOaqK
	VereF7Zvedn5W4w+DNEhjs1xmumw1QK9bdvqGKauViNyP8n3Se+Rqp0uZ+ue462heBuSHeqzaFI
	YcYoEi3ZdCoYL0m6EPNu7Y03yz8g2PH6k3MN43HSORXCazrDblm9A4/DnqDkVpTQLd/AB4xiUDK
	b17uPJqbPhPnq/npPW/s7Ls7ygIp8gor2Wl+N3VrcXp7LH2LGY5iQTXtX/lwtmKSzLfMMKqceO1
	CWgmHUj+HXbgorA9RNupGGCjpAST6pVKjTX75/obwA8Cj+/h3xgjBlBx+rIQNL0BhSK3vGwbNny
	KBxq4H6rz
X-Received: by 2002:a05:620a:319a:b0:92e:541e:632b with SMTP id af79cd13be357-939137b4683mr3656950885a.2.1788250067249;
        Tue, 01 Sep 2026 01:07:47 -0700 (PDT)
X-Received: by 2002:a05:620a:319a:b0:92e:541e:632b with SMTP id af79cd13be357-939137b4683mr3656946685a.2.1788250066708;
        Tue, 01 Sep 2026 01:07:46 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:04 +0300
Subject: [PATCH v2 07/16] arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-7-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=UoWZ6TMFmWJFZ4O/POChI611r+ZIq82nn/iwUb724B8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloexHpBqmOWIJuXlw6Bcl6qKwGst0nN+/60//
 vI0257CQtSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHsQAKCRAbX0TJAJUV
 VrMeD/0VtpuJDBQVtLsVUaKIAraeacEXb0+/dha8jQmAOTd9kzk6XdlyB9J5YGV01h1mXoBryRc
 XvqUNrZLZVmZLT6F+YZjv8mzvfD/Jq1ev1SKbxa6BAE7GJ3RiksvyRPi2vaMONkAXp9VWTPODC3
 LDaswcsMYBJGPNfcYntJl8VcvqIwiXrAWeTaDE9lteHw+WjH5weVwd5cw27flq0RQnjBKfSkVQX
 Qif1yKk1sXfH1G6dMETcagE5wdW6bpz/KX/JeUdics9rA9nqby0unmLw8mqIluMn56dtc03qy7V
 5hTBtLEaWBTX23TkUh+oU0xgAvHvMHx0AswblJ5ZBq7a+Qb5Zy6WcGqke2pmndMh00zarm93nEK
 WgQiKvlfyz/Zy7Ds4p2J4ytkxpNWENjyTXGGVWmJY1Hz9FNxGJuD8EAEUmVrQz1JBjJ9GQgEiQv
 JnsiBlcHXrDHoRR/bzEO0qoWl2r7AIXo09U/HWbV1z8U+p6/XfNQoZHDEnWohmkyKrpfTY69+Lt
 pP8RsDF4XhufdBv9E2j/3tpS7tjhEELDDpe6wWgw6H/7N5xGGCFBACFrXYv1mrM9OGiLPleG7Y3
 Cxz6oDVck3eJVqzaB8dQ0HEM86nXZ9oz7AL84n8cWlE7zmNnCGfXAE5VhZsXqApD2KDqkxmmJN/
 VzWBqTpM16HCQvQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: JO7TwIz9JUR9hoyruuMYD3jMjvvbl4Cn
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a9687d4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: JO7TwIz9JUR9hoyruuMYD3jMjvvbl4Cn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX60zsHH8br83u
 KJX3AqyI+2eT1RApbvIk3e9o8z2oqc8Dv8IPLItkPC5qXHszOYnYAkd8mQnnvEhIx18s1dUMIZo
 ChazhXuRMP1cs/9eA1x9gxVc9jhjLKQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX+EPron1q7O18
 TLkjGAfxsnrM97nunuBm68fvqT00vNCK7x3jsmo/dsAhwmrx0jLbX46WkLiky5GXUDXBlNWmxMA
 z/xVD2zpVFfxzaC7Sweh7vPeqej0PLjWkwXv8A6hFCkKM7gKUw/MllQ+ovJQw7Tj6AD/+fGgOCG
 MiHIkBUQjBjq7iLzSPurTbmGJTbmuJV8z9LBiL5WEsKQd8dj6P5kDF+xy/kGmWGyCVfEddHrlKZ
 a9yjfnN5vMuJUvrKyTu4vs5fD2203f00msAVNmqixkP8uXCk164oWaLoEXuM7/hWGZokdkLqZS0
 E02pkmKtFSsNslI4JmlBB3sOZVyeNLO0CijZrDHRqlLRGsWli8YAvq1OEVQbwEq6Ja2/DFTKijX
 YK47pd97zlDr3rwkee/wts2LrfuY7QfT6AqJkIPG8UpvpTfD+6ZmPNoluYgzWpM2UQijTG+sV1d
 K7s4PhgnM8kv3StAmlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 8cf65490cdb0 ("arm64: dts: qcom: Add dts for Medion SPRCHRGD 14 S1")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
index e4a0b86847cd..4b45f293e167 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
@@ -1251,6 +1251,7 @@ right_tweeter: speaker@0,1 {
 &tlmm {
 	gpio-reserved-ranges = <28 4>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	edp_reg_en: edp-reg-en-state {

-- 
2.54.0

