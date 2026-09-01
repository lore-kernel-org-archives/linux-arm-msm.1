Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1ED47209C
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250096; cv=none; b=dzj1XehGIsamiOjNs6Bol/+EpSykI0mMAV0b7omUJSBvD/nOclySTPqHAvwQXn3wBmBUIcm842oNI72sfxpgkc/h9aaYEXYAdrDvbkK20OqNtVv1YfTmsoX2154K3huGXDns0xe3m1nCNGqQiXd9KwXXx7fbqR4IllHOY9xKNks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250096; c=relaxed/simple;
	bh=mFnQq/dkhM5tvCdOWiM/nzdrS6jwO2OOqJVDNp1Vutg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QdWDF7d45niUgJBE7zCSSND9/oyVZBzFZZ7QlMnX3QOe8tPcTRtARGmAw3g4tCaMij4r+QXSRKaTkmVFSmqAsRR4sTeZ6+SS5+vR87fnnH4yOHMBVsnRKbkBWrGM7iXebu8GnJ8UTC7H0DJ8ww0aKi01gkHV51DV3tX9JK+UsLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V70YMhVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ALP7cG9g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V70YMhVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALP7cG9g"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179CGr2061533
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 08:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YlHMFxXvr8+udJbU44L/P9wcmn5Hgtnl95h/oFgGJ94=; b=V70YMhVuTKZk4yA2
	s4vmsJRLDvAP1Z1DrzEQdAbntGoHwNcJAk6zu+rCZaq5mJVkAUkC4MHvHBxb5QEC
	zueJgPTwWqXnJy41cMNZqG2V3x17OwIXSe0k3dWYiXSU0ckmukEvuq85ZgXO9gcu
	4USEivlmRlFzmBTeI0cTzD/2DZxxUZZrL2f9W/0cpuK21q2J/jgy8WaTN/PJiuKu
	wTSFjzudYnokVbp0sXLvVxeyiU1scC4iAvDuMQB1eqqruy+UwCbAwtKfbA7q49+w
	CqN1TyPL3DOUHnaesmZha4o6DJQEyMIjLF8Fi3V1ZQrzJ1JafwFDlluM8JdBx/In
	VLPzEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh0ww2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:08:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b571432fso125363985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250093; x=1788854893; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlHMFxXvr8+udJbU44L/P9wcmn5Hgtnl95h/oFgGJ94=;
        b=ALP7cG9glWQG2U5GL1b4HjovhxsEnJwrwYYxxrCj/LO3Orsz6vvPElxFGwS+JFSTkI
         G6BmfWIl3pdqFjpBJfzBxP1hXtRmjUizOwfHQmSct9CzIy/bFUHt6ECaoQWQ1kGzprN3
         VkWdxhUk5hs/sbwDiF0lGFZ92lxjAEx55/xrcPQPUZxtQSwK1tAr9zQXPnfT57TVcT6R
         ASP6+S0Md5LFkHDm2xClvcsK/eCIrkIPD5wZCYlqv77fkhgbIDTSUznAYmdJIaJvF4fB
         4sQeUfUISyTs0L9VwaM6qn6lD9eVcLCbZAVXD32PH1LSIoE16Zq15T2iAB2iQxFcqH+L
         o5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250093; x=1788854893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YlHMFxXvr8+udJbU44L/P9wcmn5Hgtnl95h/oFgGJ94=;
        b=Js0XXcEHe7FSZUfLB4k8w9wxjBh9U/zn1AYFVmwwTS89FLhA0Jyiir+YJIPJHmaPHm
         Gy2VIVN40qT4g6JIgqJB9Hu1TDQN8O30uaulMGdPtwmRWOZDXZpJFpRzsAB7IVIDSL2B
         SPMnPD1ZMUjCDG3JMO/ZN4f2Uv5iPNA/hMCHacyTzO7wYdmP0jbM7TT7YWUeKl3sXoTn
         9GEGoU0XAwT480eks+iQVNuHM3a37rWsPCzeO2vvRQju8KZJq5ECHGgi6eFmcnqxkVZm
         Q75GIIf70XjsP3gjogFAxX9l1SLKZ87sezXKi4Nu/Qx54wrXWwYYd/w9NpjmdM1YGnyK
         xZGQ==
X-Gm-Message-State: AFuF++mXAgBdkJjUfmLZtOoy2GikGAgvaFsvWRR3FW7E23Jgl116kijq
	S/8LyxQgNw+cB8LpD8yhRiMoTNgIlxJsNmZ6ATGm5jb8CMVXvtnbGzT5rCI9WshKor28DDX4kp7
	2oVJaqnLIMGSK46GHf0Yt26fuVBZqIs+BYf6ObH2AO7o87LmHA+yQQjoY9AE5vVEkniIO
X-Gm-Gg: AR+sD11YP6B78I+7B26zBmHO1QfpjBgEO2kLBbJf09/ArUTv04o7uFXou/WhydBAhe+
	KgqKFOgOEFPOvACg10VgWO7HXAmk7e1qR7dqrEb70wwi7H2FG+yaQv9SUM9WMKOeH/6KrtrAUJj
	EbJuhcMYv8ByPaHqU3rEgWoX27uQD/rTOGay8v2Z4r2/60biyAUN3uXBaqJCOcx3Iu6YldOvdbx
	jdX/RFgrQoFDsIgicoFGl1gqhvfiPv5r11u1Rh6l2DZ71aLDA9XpkHqBX5VivocOYZNwnxPnZ7U
	s6X+VOlM0Vanuvnf5f90fDvk0BqI6tciasSVSqzCFmpAhuYBKbsqbxKivsCkrPmTl4LEtc8+3yG
	f7RM13Ts4
X-Received: by 2002:a05:620a:90c7:10b0:933:ade:2daf with SMTP id af79cd13be357-9394bdf41e6mr349018185a.18.1788250093469;
        Tue, 01 Sep 2026 01:08:13 -0700 (PDT)
X-Received: by 2002:a05:620a:90c7:10b0:933:ade:2daf with SMTP id af79cd13be357-9394bdf41e6mr349013485a.18.1788250092897;
        Tue, 01 Sep 2026 01:08:12 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:08:11 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:12 +0300
Subject: [PATCH v2 15/16] arm64: dts: qcom: x1p42100-thinkbook-16: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-15-f4ab7e4bb75d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=mFnQq/dkhM5tvCdOWiM/nzdrS6jwO2OOqJVDNp1Vutg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloe5t+uJjuSbwW8jZbonfsLcTns8trwwRP7By
 VtT9R2BOcKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHuQAKCRAbX0TJAJUV
 VnT+D/0euFYTquHFjBGOVc9OSG4Hs73zhv4R7JSYuAwrFm8VxIo9XFOr5FjXPi1XhamgDesNOkg
 sKT+mdXWsi/umVvm480TLMgqcSayIBmrKmwSHrIR/9gy9ULn8Pedm6IB2MQgg2UJfR7HJdn7Gqa
 9kUws7BYzmomrAvXV3Zl/CkjrUkzOMWoltwarephbVbXnPkbKCBen5hQO/j0qv9liiUjenYCpi3
 umNw9GhAil+kiP1wbtezVpFtXfxRjBwzpP9b75ILq0UgLDJ5wUBzYQzRLAU+o2gPavizs4FQfPm
 5OLmWnQKQdwHizOSwmUKlHSe5oKwn7QvOyRxsmSeObfrLtKiuFkTu/QmR4Vvks1zfUP0Iume6c9
 Lpp0wish2QFNjiQ/vWJawylrGWOqCZjr1gbEFnYASZr80Q7+BiXP2C0qBjdNsbqVSNtl2OZSswk
 QYUURRZ78JITjp4T+51kLUgOrULn+dYNM45r5heDMfRtP7O+4Dt3EGq5qhX5KzozHlLJ+dyDK6X
 C8Yxar8cefWbg8unvuaayu/wNmojJuExIMl4M+9TADcF+N8FNo2dCSqzI0TlRflFbLuXOLoSqv/
 YIXrKjvYZRoB1i8a/NVWD/ErZdRgmcI3x3Og/G3pwkGRZkkHj0P2iXqgCWFHf19Lvln+KIHaqoP
 wcxWYTJd9x/WxAQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXzn0dFnQ2W0Zv
 yZYcHsuOM5dkJb+CCJyuG3iNebNZG5lkJkWf5RwCEiOTDvs85UfDSOEKK6Ez9UR975OmmuGXIrD
 tbZz/8yS/jnfXkaNZnqyUZFsCjqhM7M=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a9687ee cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 9L_qDhKFWbFkL74EJuX5r-rIAC3NTWAj
X-Proofpoint-ORIG-GUID: 9L_qDhKFWbFkL74EJuX5r-rIAC3NTWAj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXw4HnzcGaJvVZ
 8cibE8HMQfO+vkAMOispSDx19k6qlQYkA7l7vAdegjYqYjZWeA2WWivlYcuwanao2bA9gEevMUu
 NyFfv/rJWh7yoA2YAPp7UvCcV5TNNA9ajwkl+X+gNrBPDIIyhDGz6GdU50TD0SfQbqyP1U4yZfA
 mpH0AU/iOwTa7S4SaSTNys1pMjOYXTxdegkVmUbYr13idVmYNBkMWdsHsDTygHsSSWX5diXSf9u
 Ew9Is2jfyWncUjeIxpGbaBUKbsuhHIRb7SxV6MoGIOCm3MM4NeJLMhmAip59NiV3Bmwrj1zi2Bf
 YtpPuqLw+FYYqxKBQ/o864gbg7du4KrVqHPAx5DySawsTM3gLOw694BiEzx+ioQO7i5rNiNp1C+
 7XesbNUVW/G76mUpBmr5v4urZ9X2D4xSRLTfmAGAllrdmEG/8vWCHH2lqAwS8so9jTN1zdsfVDE
 RqhB0YSyBblNc0odxSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: d3f600dc452d ("arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY device tree")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
index c2f21fcb1b09..1e295741e676 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
@@ -1327,6 +1327,7 @@ wcd_tx: codec@0,3 {
 
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
+			       <65 1>, /* EC reset */
 			       <72 2>; /* Secure EC I2C connection (?) */
 
 	edp_hpd_default: edp-hpd-default-state {

-- 
2.54.0

