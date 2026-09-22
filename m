Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E385237BA
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790063532; cv=none; b=dvYx9s7Oje1WCwUOPppfcFdLw7e3GXn6k/wSMpWWI2HWs2cLzKy/IAmGGQ2Gl7ZcZk/LCRmPdGpo8DLHjnwpfnlEGoLVN9ldnecRVRUcOSZ2hTIKXZn/bhhG4zvxvXlk+zheaiuEvyyBxz6KzcNZFET0ijtprM2Av1r7Yf1RMz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790063532; c=relaxed/simple;
	bh=lenA3TmGMchdsVKN9+uAHQBrDjyA0o++iDuJFjSVQjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VOBLhviWI+No56rkPw8uahYJln6IxHHu/kNVb/j4+2myHyJtghFtoa2Rsi+aFthuhya6bZQVZT9bKC7qEWvpMlBc8CFxqAyK1oTcSLHuREb5/K/ytcCyn+ytOT9W/mSH46DWEnz55jFV0kBGczZ+QmRYSNtA74FWop76BiTA+Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nPt7FvxO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lo1gbly/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nPt7FvxO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lo1gbly/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2sKjY3675270
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrjEjAGDs38OVb+9nMUhl997V2TPVxA7GdQ7siYpazs=; b=nPt7FvxOfqKJbM8E
	vKsj7xOcrKSF7I8L0QZZkV/u35InULIXTrCuCpk+kiGtlsae3mLJMaJGfZDOzVjq
	9VrRrHmgV0LItICupsBCvYF1JkewEGoSdr1Mg75y1tbwft5bcJgie+TlIOV9RC0o
	ewNDaOkbf+hLjhZHbcJ2QkEkL4jg2yEJEa20Xlx6Dpn/uMqiE5RuaL01GjGOaFK9
	KO2Qo+CNlXnW52WCTzubmIdnBoPcjOMrAca3/+Vc/pXdUD9aAEwkK5aACfL1fbdZ
	VOzSXEq3unaMHWGw2tHilP+leLzvIE9HFZTuVSc0ejnG+ye3/It49wxdJcWFjSCl
	v71rfQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5s29v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 07:51:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91258c6ee64so13715456d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 00:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790063517; x=1790668317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrjEjAGDs38OVb+9nMUhl997V2TPVxA7GdQ7siYpazs=;
        b=Lo1gbly/WHNHl/Cotx2fZ4bnEqXpphxrsO0F3AiI1tt2rzLifGBT0o4wNZvIu/217K
         sF/ePvovetw70iMxxm0QW4oWjglXdvnoBHTJCh6pK5lpa2lY8ougGU8HhwXUmPFnrzAR
         W3jdTuw3KkoZR3QbRMhLeecaEfdAiDh6o/mo8UOhvcBVf/fUPcZ6dvHsfAsRln9MsYZN
         zCuZ6Dz1OTkIggAhyOqKRF6fg71Mr1BLLYh46BU7fP+MzxTSiycntDbcYSeLSjkwNEok
         AhjuLLokc0DzFULpKpJeaw/ty9XefgRzMb1KyXSGH6lh4oTtHtorlL+jdQY4/+uyi1Zk
         dfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790063517; x=1790668317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrjEjAGDs38OVb+9nMUhl997V2TPVxA7GdQ7siYpazs=;
        b=UKNsJtpI2BhNUWwoUWMfXq6HKoMNu6y3IWeVTlwe7eG1isi6QM9TitcRbFH7hhG3YS
         pIOtFjeCEGK94U7coT4hnHbRLzzA03EWBuhoRnYKZBRzt+/uIBNiFVB8IxrTp81uVxgK
         y2VuTrId1LPyHbVhld6XxeiKCSVVSsELYOo5aKdfbfTeBq4P07LBBKpU7GlegbUucCQN
         miJU+XdPfe9kPitCqivnB55a6+JxStCIcZKrZYKixkh0mYNXfoxitc9Txji+ZtA1E9FG
         yD+Xvs3HDIhBFe6ba7L64pBjymwTlwMSL01xoncEWISgvFgSvQz9zxuJKMkvX3pq9KPZ
         THOg==
X-Gm-Message-State: AFuF++llYi0TlIv4yuMQ+kAbdjqw8Fpck4wKOnxSoDaHKJKDJTBy9der
	rZYhl1Mln/jwiXz8NNsHyVLwcmF2cgfJe0DiW72CO/2Wva/mAhudkX8ysJf9Lk5NIzxtwCQa7n3
	s5l04cZ/vzd65pCTrXg+laS6K1cqtaG3tbl0oihX1ukFJ8LUHo3htNAqmiC+FvhDn2BH2
X-Gm-Gg: AYBFou2obpONKVW9wKolPD47XieSKCzLfZsT1Ix7cEwxaUw4CeLE8AMpUcni7sVSl1A
	e13o+rlEgqUfEhdjEQDVTDh6ePcxyAqnYrBd6tNYh9XF14/mU4tFhSnSNzmVmW7n1GQEZ/+0WbH
	UArzyKa+BZFVPYbi/TXp69Y6CVZYLTc339E+9ZK+5+5XTS0gnkYRTpWAHxb6ecy0vxNvLwgKdX5
	Z9kg3uzdhaoLaxLMk/qXqkFI8ee+/63Lj9sU6Spty5/hlbLf9/fTCKkXciGlIFOs7fT3Wm3fwfB
	J8pQH2aNRO+/aXG+vWV/pzv57EV2WINnOvJqo71ci2gN0KLYuXmU7n3EB2Yni4eLMgpvqfg70RM
	Jwi/IaM9S
X-Received: by 2002:a05:620a:45a2:b0:93b:c6fc:71e9 with SMTP id af79cd13be357-93c17ee2bd9mr327348785a.25.1790063517248;
        Tue, 22 Sep 2026 00:51:57 -0700 (PDT)
X-Received: by 2002:a05:620a:45a2:b0:93b:c6fc:71e9 with SMTP id af79cd13be357-93c17ee2bd9mr327344385a.25.1790063516633;
        Tue, 22 Sep 2026 00:51:56 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862789080sm3046925f8f.28.2026.09.22.00.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:51:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:51:22 +0300
Subject: [PATCH v3 13/13] arm64: dts: qcom: x1p42100-thinkbook-16: Mark the
 EC reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-13-fde7f8a53382@oss.qualcomm.com>
References: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
In-Reply-To: <20260922-dts-qcom-hamoa-reserve-ec-reset-gpio-v3-0-fde7f8a53382@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1085;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lenA3TmGMchdsVKN9+uAHQBrDjyA0o++iDuJFjSVQjw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqsjN+5oQf2iiV00KtPq2KOKK6BuIb9FxzwFUak
 QNPGNgzq/yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarIzfgAKCRAbX0TJAJUV
 VrnJD/47jqduBs5nql3AOndh7489OrJyRE0kVnd0m3WmIkHb2swiZ3xLMecuOZrlcZtDris4iM9
 2cfOJjwrjqLbt+UkaumZtCJgFlwJi0E3NA8FiBWQ1+mZprHh0CImJFIMekG+cqYisxP2Zvt+7w5
 zP2vbDi6nkXydDEWivupyPR5Zt2hsb+tVYTK13YnqtdaQjBt1d4uVSQsQ6LmQeRPfHPqkWKxwTC
 0VU+R0Or/CgxQyZAP1tW3lS5637BZGei1F54+5ngSqGdVNaq6l/bhK22FA7PEt3zIgkT9vGywsf
 n+GFvxfwk87eVuSx+K2qYKFZlKpv1jx895FVeEaR5PwYN31nPLMK+XINDBzHb/cYCMUy4RjEWS0
 i0stbJ0DrlaIUinnRjrLJuIQRpJnK21FC58Jrmtyeq5hoUwzt+GYbGC3jYbMHYrXXlIF13VXt/m
 pbci/QRLGne6oR4iDTwkx6GK1oN3+yADpyGZZKnaKBePgW8oM4OmAhDGkUo3YlV1cdatVF0Awe9
 7iG+6wnb0W9o8y6FyVXDJdqKjV3aajXjE9fi4qp6eZzDI/xp9ZstyPlTaf+seG0vhR4ukMV5dUo
 1MOEiW83MgJcSD84wD+EOTzfxKukAqiQytECOzx7HyyZDAo1ZoHirrBNmZPilfoGW58KAnOt0zm
 WfVwo6KaNUherRw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: wRshlRFaaa4tyaJIubVF_Gsom-jNJse7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfXy23+5NLiCwJ7
 PosLO3dNHcJTLvyguEc3KmhH3hcBOmDHTnqcM76btRszyi6Xe2IgGRyOUZLwblNCRYTf59Wh0WQ
 ePz/QLot3h7HtMgWiPcgjo+dwTJ6tAA=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab2339d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: wRshlRFaaa4tyaJIubVF_Gsom-jNJse7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExMSBTYWx0ZWRfX3b0bWX82utGR
 t4jL6QOJhEPbDwuJLERBJR/UVA88IhTQ87ni2FOZCvT6vQcdEyNOl2RzNnSQ99+GhGKfQrHMbqa
 UmpTKb7kzDap0FPUCz5j/4WNiURkyHFoq2tAJRVeSLUnHDROg4MItpiNKGa4MnrgA1NdWYw2o9N
 BdgUPizkJJK1pCtob64daM0ogth0/hqoAL9GycfOLNcS9XdXJyQLJF1dOwmAHI4SZdsLM3GdElm
 d95zwytCMBxY/leo6Ol4oGCP+HY1tut2b9Pg74D5vTuQ7R2uRCQo3hkK6Z2tuvpy1zTwKdN9z5n
 r/EEchYGrQWb9LKlAf6k+M/Z4Cw3srhQVnC0xvZOO0KdHp7gJGNtwVf203XdjPw/VPm7tWyovYU
 33bb/PYTBiZ/lS7W/Zy1bJWeqCQ+GzNxK5CShvAI2DjY+/gKSlNoQa4kJ3thnYS5OeHs3PXRSQX
 yPsu/H+TzehvYaqAsbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220111

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
index 8891ad6188ed..951888845c90 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts
@@ -1348,6 +1348,7 @@ &tcsr {
 
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
+			       <65 1>, /* EC reset */
 			       <72 2>; /* Secure EC I2C connection (?) */
 
 	edp_hpd_default: edp-hpd-default-state {

-- 
2.54.0

