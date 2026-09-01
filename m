Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1098D474246
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250091; cv=none; b=PyXqVKfR7sx76QhRyRjuPN2bC814pT39uC3Y0medL3sixfludPdrlimrXlcwJd1QsLNpI8/WOeUgjfn/r+ysKRGIYS+oi8RV2h8rnIYEdf+bGQiwc17fuaAKUza34lHHP02qyVNx1WkF3kt/k4TVpp5eI9S568k8D/+KbP+17us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250091; c=relaxed/simple;
	bh=sFqG9CIAihRqDQ9bvVwk6iZoUUSU0TNuyP/K0+ZwkZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j4KtscrHsDNbhRWwbJxxCwJYmRq58tCyMaRZY2whGlF8fbtGzsVCyM1zftUfRW+l86lxASAK3LH98+Smn4h14DhwDotQuqg8HYO6X3vGZkdEVscDW7zJrubXt4F2zRaQwAeNPx4EoEP9NySkREF/NYH5I8ZKw4urNKqFtzDtAB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gzy9nP9l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S+IoYwz7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gzy9nP9l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S+IoYwz7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179CLT2061542
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 08:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZhqZCO0Y9Ekj38CaU7V5cEOQWT1F6bwhve5NdhTNfE=; b=Gzy9nP9lqg8qyDJG
	4ytP0WAU2fMk3xsQVWEAw2XNIq4FfidR207qd3FUOv9qIUs97RuPCRRkD4tdKF21
	WqH9DiCbPDhJAy1cMIIf8TWkO9r5y++2WfcXnJiwAlhj4I8VQL4VeCzbV9JPJcYb
	aH1suYJezmXCJeSZhslSZRCyW/my1jLycikShgQ9ApZtR5e4/spsZyrp+loB4A88
	qzfF1j3+P8D+Xu/U+AaRuPzz7e5zQ78Q2UPYkKwv5Pcj3+mgwJI3fm6382e01s3t
	y8a7NiaUIh6MOdAjnwuOl0WvLuP8FXiJ9ReG/g/tkb2H3hQ3IzJfZZRkYG1dsiHp
	ROrN8w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh0wvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:08:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390ca1a9abso104775885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250088; x=1788854888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZhqZCO0Y9Ekj38CaU7V5cEOQWT1F6bwhve5NdhTNfE=;
        b=S+IoYwz7/oy37x2vJFtAfVB3uga5GjkQqUsQWQx1x/0xgo768URrjS0+gKBtEhmnCx
         ADWHKEvFeCnlDhurhVCGD7EzUUlOFU+HJKeTo5DkllUjH9xw9B+dK7LoYjrZu/gysjEF
         v+HYPTpWrxZCuiJ40vz9901TdJZUTqfW/3iBu1pMz52JHuTx6O12q88uXwq3WWE5wS51
         KWl9gXT9PZYIc30V/eIyK2FG+kXC58kKQNGVaDzP3zHYzM6tJFwK7cHq3J9ZgeHkNSV1
         PVc0qTlkoSPqItsy+Dn7uA8c5ygdR1KeCgd1vpAAlW4BK8lDxyFm+MW1BdwxQ6xPvBX8
         OeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250088; x=1788854888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZhqZCO0Y9Ekj38CaU7V5cEOQWT1F6bwhve5NdhTNfE=;
        b=CsVw2S7SwEC2ytcL83dDFEMMODGd+Kc5w4zcbGrecSoRWR1c3cVZEgyQ0YIgPJRcPG
         lQDxGygq/QiLmIpeEMpbvq8XSDSvc3Yz2iUgy9yVhfstSTbevBNzIuVivL9BrtZ09SHc
         TRmExWyYfzCI2Ld0puk/62Et1rn31FtqM0Tv4JY2yXXPQvW9Kwx1lXg1CrmZiKzmNYyr
         8L6yvS6hdA0qJgtK2O1sMIR0e9MLfp2qwmX1k+HL6FrCgTIm8tBV+zDJz3WF/LQJ2Jtm
         XImWnXE69kgA41781V4khbKLC/OCDFjOqKxtQDpsNCrl2tHEKu6NwsNQm7AdI2uVGhQy
         OhHQ==
X-Gm-Message-State: AFuF++n1LerbgB4odSH+rmfnWrEDpMfvXFwC3qQqJ+nRKWwXcXLOWijv
	QmMrgasUbcRh4f7iCcGO5DGjnakhih8rvk2I0K7Vi7zRKvLvNRtEfWgjJCATdR6lyRdNvdI16vH
	Wh019tvm2Qi6UKXRWF7hg2HAcTm/ossSmj5Owzzl/OOq+GukNDq7K64V32f3iFVMEy902
X-Gm-Gg: AR+sD105xHrFNQ/Ok2/YNgeucopUGS0ov/HBXUodB8oMzlgCapNrt53mu0jbikLQzzn
	VI+2qw0A2Jofn6y4DxcfxeJ+1FPFxL6Gy5QLC5fZcM2kl+7HZhJJ66f2cOSFH/wlpX1IafHOJac
	nvDdtNnUdugzX9sH5b0d/jW0RiLi1VfjVft6Thmn36lUm1yi5cg3bAP9fAjjBvKV3xUegoq1hu7
	itEzZ2AM0uYwG41lLKULFHeBgPOTcYMIjM/xOZq8BIy2SCV6tWA+dVc0+ah3S2GRLWv2j8Qmj5I
	qW64kxJ2F9isIawD8v3h49djWqMy1G36w2bfI3oQI7W679OGyxMKpJbihb5I4CxnLj3ic3SboP7
	14Cc6w4Jd
X-Received: by 2002:a05:620a:6881:b0:939:4f9:bfaf with SMTP id af79cd13be357-939139a0b5bmr3997927385a.40.1788250087868;
        Tue, 01 Sep 2026 01:08:07 -0700 (PDT)
X-Received: by 2002:a05:620a:6881:b0:939:4f9:bfaf with SMTP id af79cd13be357-939139a0b5bmr3997913285a.40.1788250086646;
        Tue, 01 Sep 2026 01:08:06 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:08:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:10 +0300
Subject: [PATCH v2 13/16] arm64: dts: qcom: x1-hp-omnibook-x14: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-13-f4ab7e4bb75d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=sFqG9CIAihRqDQ9bvVwk6iZoUUSU0TNuyP/K0+ZwkZQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloe3e0DWFJj9GIIo77JwS0VQbDEWtqRkDIMoF
 p2OgpWx/RmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHtwAKCRAbX0TJAJUV
 VrRaD/43rLO+BdUC6qAg81QNwx67Aur+h0fxsuVxS/xzpWhKh53tzeNEbBvpKQh2Cvj9HaN2Zr3
 wvhEV68VdR7/3njvh8gTlNJ8x2ZipXk3zKi9F5mQW2dMtc1AaPgRIGl4AesOm41WqtKlSQEU8FX
 mzz60iJ29nUyb9qQwrQwyOr8B2BUx2XeQ5Mu9Ew7kUgjEjmldHyxGVlbZNGDz+BtT1hHqS0mtoh
 mvp5nLAaEVBzOa4in7WDgEcQBy2ekeK85Rz3MCkOkZm2scQlzDZzBJDCTr/2s53oFsrMJNQuX7w
 ykr5lquMQ0kturGI+kYY4/XW5cQshvrL+5N7jzaOqeCqfnesPzeiwHlh1SJhkA1kpnTDpUn8GW2
 tB0zeP+rk4+ii+WX7YJy05M/q4Jh+8nJRsKEb3oRW55IQ2c6jzzEPxahAesN7Jas39WILtfrmtf
 9mjla98nh9Y+7GvPmcnsbheF/MTSdjYCZ944iCD67waQDga2eHCECMQog0p3NMQuhi6RS9/q05M
 Z0/axmH4oEYMqn6WendiJ1S35sR9v+NDVgfslhKuhNKyxbnzG6YR05q1DyLQ34QaWLwLba1Onnd
 Sv0bU+H5jwu7e1FL9H05MdyretUaf7aI3b0EcjamOyhdW4TnnTS6FQHHsiQa77afxJ2OEOIlsNI
 kye0Z3KHiFxpkVQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXz/hDUyhXW9lF
 v+FRKM9TxnjUMhsk26VCs86U30sId+gImP+3CgbdBqviNGyPf+cea16/707QKbjnpa1EtKsLwf+
 mCXMHNryox2OmWI2bAxZVoEf0E+7ucs=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a9687e8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: SDlSEgFKRk373CyQWB0jPbZHKDHHlslt
X-Proofpoint-ORIG-GUID: SDlSEgFKRk373CyQWB0jPbZHKDHHlslt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXxhzFu+c87MN1
 iPNAm+rfGubS5RArI3GYACrNa4jMAfR0PExlXVVW/MdpTbfwUVd9KRjsJH2qfar9UsdDDYRoHHM
 DCE+0bt0nbIh79iXzThAqwjWnnGWO3TCSyhUzH9TKYPne3YA5HlGfF2oQoBnSbkYRzCUqDakNNk
 Pqui/If8hmoE8zY3XG9P2sSb6b49oYcJkFLx6EqxYouAx+ylKeCdf0v85MI4hc3asXdBUn8MRE4
 WjNwXoCXFwKgPJxy0fm/VTy+42ffY/XmnbDcTHZr7wwoc1eghPn1csDMb8pTbIXMe0AZjSOKtw3
 5ZnHjqXV/UhqB35z+9IEVVEiNtsA9Q6wXK1CFpCeJ1X/r6XecGYOlEiATuAVhKIkZut0qu/M+SM
 a2SInxENM5aisFN5597UZkcV20hjofchITi9TimlJV4LEQ4UPpi5Dugi9RtYuVf8V55iT+Sph6/
 qeazmvbtx6pAoee6BOQ==
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

Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
index dba8cee43e29..bcd85cbdcb93 100644
--- a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
@@ -1287,6 +1287,7 @@ wcd_tx: codec@0,3 {
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
 			       <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 

-- 
2.54.0

